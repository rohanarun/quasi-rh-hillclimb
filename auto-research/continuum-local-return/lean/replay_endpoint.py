#!/usr/bin/env python3
"""Rebuild the conditional endpoint in a fresh directory using compiled #143 dependencies."""
import argparse
from concurrent.futures import ThreadPoolExecutor, wait, FIRST_COMPLETED
from graphlib import TopologicalSorter
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

PIN = 'c74d855c3bdfceeee059501aea76c8b1627b9abd'
PREFIX = 'submissions/2026-11-13-continuum-exact-contact/src/'
NAMESPACE = 'Candidate.Local.Qrh.TwoSlot.AnchorContinuum.'
BUNDLE = Path(__file__).resolve().parent


def run(args, **kwargs):
    return subprocess.run(args, check=True, **kwargs)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--tracker', type=Path, required=True, help='Git checkout containing the pinned tracker commit')
    p.add_argument('--compiled', type=Path, required=True, action='append', help='Lean root containing compiled original private Candidate and/or predecessor Submissions packages, repeatable')
    p.add_argument('--work', type=Path, required=True, help='fresh, empty work directory')
    p.add_argument('--jobs', type=int, default=2)
    args = p.parse_args()
    if args.jobs < 1:
        p.error('--jobs must be positive')
    work = args.work.resolve()
    if work.exists() and any(work.iterdir()):
        p.error('--work must be empty')
    work.mkdir(parents=True, exist_ok=True)
    src, out, logs = (work / d for d in ['sources', 'lean', 'logs'])
    for folder in [src, out, logs]:
        folder.mkdir()
    tracker = args.tracker.resolve()
    modules = {}
    originals = {}

    def visit(m):
        if m in modules:
            return
        rel = m.replace('.', '/') + '.lean'
        blob = subprocess.check_output(['git', '-C', str(tracker), 'show', f'{PIN}:{PREFIX}{rel}'])
        originals[m] = blob
        parents = {line.split()[1] for line in blob.decode().splitlines() if line.startswith('import ' + NAMESPACE)}
        modules[m] = parents
        for dep in parents:
            visit(dep)

    visit(NAMESPACE + 'PositiveSourceClosure')
    schedule = NAMESPACE + 'PositiveSchedule'
    changed = {schedule}
    for m in TopologicalSorter(modules).static_order():
        if changed & modules[m]:
            changed.add(m)
    # Keep only the schedule and its descendants on the source-closure proof path.
    lib = {m: modules[m] & changed for m in changed}
    if len(lib) != 32:
        raise ValueError(f'expected 32 affected modules, found {len(lib)}')
    for m in lib:
        f = src / (m.replace('.', '/') + '.lean')
        f.parent.mkdir(parents=True, exist_ok=True)
        f.write_bytes(originals[m])
    patch_env = dict(os.environ, GIT_CEILING_DIRECTORIES=str(src.parent))
    run(['git', 'apply', '--check', str(BUNDLE / 'physical-return.patch')], cwd=src, env=patch_env)
    run(['git', 'apply', str(BUNDLE / 'physical-return.patch')], cwd=src, env=patch_env)
    for name, checksum in json.loads((BUNDLE / "patch-sha256.json").read_text()).items():
        if hashlib.sha256((src / name).read_bytes()).hexdigest() != checksum:
            raise ValueError(f"patched source hash mismatch for {name}")
    # Lean resolves only the first matching top-level namespace in LEAN_PATH.
    # Construct a merged view and exclude original binaries for changed modules.
    hidden = {m.replace('.', '/') for m in changed}
    for base in args.compiled:
        for namespace in ['Candidate', 'Submissions']:
            for artifact in (base.resolve() / namespace).rglob('*.olean*'):
                rel = artifact.relative_to(base.resolve())
                if rel.as_posix().split('.olean')[0] in hidden or not artifact.is_file():
                    continue
                dest = out / rel
                if not dest.is_symlink():
                    dest.parent.mkdir(parents=True, exist_ok=True)
                    dest.symlink_to(artifact)
    for module in [NAMESPACE + name for name in ["ContactSource", "PositiveCanonicalCount", "PositiveFeedback",
                                                  "ExactCountScheme", "ParameterPrecision", "ReturnCount"]]:
        required = out / (module.replace(".", "/") + ".olean")
        if not required.is_file():
            raise FileNotFoundError(f"Supply a compiled #143 root containing {module} via --compiled")
    env = os.environ.copy()
    env['LEAN_PATH'] = os.pathsep.join([str(out), *[str(d.resolve()) for d in args.compiled], env.get('LEAN_PATH', '')])
    env['LEAN_NUM_THREADS'] = '2'
    standalone = [
        'MaskedLocalCount', 'TargetGeometry', 'LocalPhysicalBranch', 'TargetNonfloorSchedule',
        'CutoffTransfer', 'DynamicSourceCount', 'TargetEdgePolynomials', 'TargetEdgeCover',
        'TargetEdgePrices', 'TargetEnvelopeBounds', 'TargetPhysicalEdges',
    ]
    endpoint = ['TargetConditionalEndpoint', 'TargetReturn']

    def compile_one(m):
        rel = Path(m.replace('.', '/'))
        source = (src if m in lib else BUNDLE) / rel.with_suffix('.lean')
        result = out / rel.with_suffix('.olean')
        result.parent.mkdir(parents=True, exist_ok=True)
        message = logs / (m + '.log')
        with message.open('w') as log:
            rc = subprocess.run(['lean', '-R', str(src if m in lib else BUNDLE), '-o', str(result), str(source)], env=env, stdout=log, stderr=subprocess.STDOUT)
        if rc.returncode:
            raise RuntimeError(f'{m} failed: {message}')
        if m not in lib:
            expected = sum(line.startswith('#print axioms ') for line in source.read_text().splitlines())
            reports = re.findall(r'depends on axioms:\s*\[([^\]]*)\]', message.read_text())
            ordinary = {'propext', 'Classical.choice', 'Quot.sound'}
            if len(reports) != expected or any(set(''.join(r.split()).split(',')) != ordinary
                                                for r in reports):
                raise RuntimeError(f'Unexpected axiom report in {message}')
        print(m, flush=True)

    for m in standalone:
        compile_one(m)
    graph = TopologicalSorter(lib)
    graph.prepare()
    with ThreadPoolExecutor(max_workers=args.jobs) as pool:
        active = {}
        while graph.is_active():
            for m in graph.get_ready():
                active[pool.submit(compile_one, m)] = m
            done, _ = wait(active, return_when=FIRST_COMPLETED)
            for f in done:
                f.result()
                graph.done(active.pop(f))
    for m in endpoint:
        compile_one(m)
    checks = [*standalone, *sorted(lib), *endpoint]
    with (logs / 'kernel.log').open('w') as log:
        for i in range(0, len(checks), args.jobs):
            run(['leanchecker', '-v', *checks[i:i + args.jobs]], env=env,
                stdout=log, stderr=subprocess.STDOUT)
    print('Kernel replay complete:', logs / 'kernel.log')


if __name__ == '__main__':
    main()
