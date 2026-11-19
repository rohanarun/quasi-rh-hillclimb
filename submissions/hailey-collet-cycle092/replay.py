#!/usr/bin/env python3
"""Read back exact supplied proof/certificate bytes; optionally replay Appendix Q."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import time

ROOT = Path(__file__).resolve().parent

def need(condition, message):
    if not condition:
        raise RuntimeError(message)

def digest(data):
    return hashlib.sha256(data).hexdigest()

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--recompute', action='store_true', help='Run the original exact-rational return and compare its entire receipt')
    args = parser.parse_args()
    need(__debug__, 'Run with ordinary, unoptimized Python: upstream arithmetic uses assertions')
    manifest = json.loads((ROOT / 'source-manifest.json').read_text())
    for entry in manifest['files']:
        path = ROOT / entry['path']
        need(path.resolve().is_relative_to(ROOT), 'Unsafe member path')
        data = path.read_bytes()
        need(len(data) == entry['bytes'] and digest(data) == entry['sha256'], 'Changed supplied file: ' + entry['path'])
    controller = ROOT / 'packet/research/local_cycle090/controller'
    held = (controller / 'REFINED_126667206.json').read_bytes()
    receipt = json.loads(held)
    need(receipt['status'] == 'PASS_WHOLE_RETURN_CONDITIONAL_ON_ANALYTIC_SOURCES' and receipt['unpaid'] == 0, 'Wrong receipt status')
    need(receipt['c'] == '.126667206' and receipt['h_add'] == '.0022595743' and receipt['steps'] == 65536, 'Wrong parameters')
    need(receipt['original_cells'] == 57 and receipt['terminal'] + receipt['new_exterior'] == receipt['coarse_central'] + 3 * receipt['subdivisions'], 'Coverage identity mismatch')
    wrapper = controller / 'REFINE_CONTACT.py'
    need(digest(wrapper.read_bytes()) == receipt['checker_sha256'], 'Wrapper binding changed')
    upstream = ROOT / manifest['replay_aliases']['cycle088/near_record/CHECK_FULL.py']['path']
    raw = upstream.read_text().replace('\r\n', '\n')
    for old, new in [("ann=Q('1e-10'); fee=Q('1e-10')", "ann=Q('1e-13'); fee=Q('1e-13')"), ("'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),", "'checker_sha256':wrapper_sha,'upstream_checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'effective_program_sha256':effective_sha,")]:
        need(raw.count(old) == 1, 'Changed refinement seam')
        raw = raw.replace(old, new, 1)
    need(digest(raw.encode()) == receipt['effective_program_sha256'], 'Effective program identity mismatch')
    start = time.monotonic()
    if args.recompute:
        with tempfile.TemporaryDirectory(prefix='qrh-cycle092-return-') as temp:
            scratch = Path(temp)
            for alias, binding in manifest['replay_aliases'].items():
                data = (ROOT / binding['path']).read_bytes()
                need(digest(data) == binding['sha256'], 'Alias binding changed')
                target = scratch / alias
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(data)
            output = scratch / 'reproduced.json'
            run = subprocess.run([sys.executable, '-B', str(wrapper), '--source', str(scratch / 'cycle088/near_record/CHECK_FULL.py'), '--output', str(output)], cwd=scratch, capture_output=True, timeout=1200)
            need(run.returncode == 0, 'Arithmetic replay failed: ' + run.stderr.decode(errors='replace')[-2000:])
            need(output.read_bytes() == held, 'Replayed receipt is not byte-identical')
    print(json.dumps({'status': 'PASS', 'supplied_files_checked': len(manifest['files']), 'arithmetic_recomputed': args.recompute, 'replayed_receipt_byte_identical': True if args.recompute else None, 'receipt_sha256': digest(held), 'c': '63333603/500000000', 'theta': '436666397/500000000', 'unpaid': 0, 'coverage_digest': receipt['coverage_digest'], 'elapsed_seconds': round(time.monotonic() - start, 3), 'scope': 'Exact finite arithmetic and source binding; analytic foundations are as stated in the manuscript. No Lean or kernel verification.'}))

if __name__ == '__main__':
    main()
