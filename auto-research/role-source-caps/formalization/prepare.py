#!/usr/bin/env python3
"""Create an isolated Lake project from the pinned inherited archive.

This copies sources only. It does not fetch caches or claim a successful build.
"""
import argparse
import json
import shutil
import zipfile
from pathlib import Path

from generate import ARCHIVE_SHA, HERE, REPO, sha


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("destination", type=Path)
    args = ap.parse_args()
    dst = args.destination.resolve()
    if dst.exists() and any(dst.iterdir()):
        raise SystemExit("Refusing to overwrite a nonempty build directory")
    archive = REPO / "submissions/hailey-collet-1252270103/lean-sources.zip"
    if sha(archive.read_bytes()) != ARCHIVE_SHA:
        raise SystemExit("Inherited archive hash mismatch")
    dst.mkdir(parents=True, exist_ok=True)
    upstream = dst / "upstream"
    with zipfile.ZipFile(archive) as z:
        for entry in z.infolist():
            p = Path(entry.filename)
            if p.is_absolute() or ".." in p.parts:
                raise SystemExit("Unsafe archive path")
        z.extractall(upstream)
    shutil.copytree(HERE / "src", dst / "src")
    for f in ["lean-toolchain", "toolchain/lake-manifest.json"]:
        shutil.copyfile(upstream / f, dst / Path(f).name)
    (dst / "lakefile.lean").write_text('''import Lake
open Lake DSL
package QRH where
  fixedToolchain := true
  leanOptions := #[⟨`autoImplicit, false⟩]
require «rellich-kondrachov» from git
  "https://github.com/abenenson/rellich-kondrachov.git" @ "70f85d4c1bf99c6e7d61e8be4daa6f3664d08d23"
require PrimeNumberTheoremAnd from git
  "https://github.com/AlexKontorovich/PrimeNumberTheoremAnd.git" @ "c39a751132c88b6e8080b74c74023fd95b3d8be0"
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "d13f23b723b8a846827a245b89c10fc7d3f11612"
lean_lib Submissions where
  srcDir := "upstream/src"
  globs := #[`Submissions.+]
lean_lib QRH87477137 where
  srcDir := "src"
  globs := #[`QRH87477137.+]
''')
    (dst / "preparation.json").write_text(json.dumps({
        "inherited_archive_sha256": ARCHIVE_SHA,
        "generated_manifest_sha256": sha((HERE / "generated-manifest.json").read_bytes()),
        "build_performed": False, "endpoint_verified": False,
    }, indent=2) + "\n")
    print(f"Prepared source-only Lake project at {dst}; no build performed.")


if __name__ == "__main__":
    main()
