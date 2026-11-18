#!/usr/bin/env bash
set -euo pipefail
source_dir=$(cd -- "$(dirname -- "$0")" && pwd)
project_dir=${1:?Usage: replay_asymmetric.sh compiled-lean-project [compiled-tracker-imports]}
imports=
if [[ -n ${2:-} ]]; then
  imports=$(cd -- "$2" && pwd)
fi
output_dir=$(mktemp -d)
trap 'rm -rf -- "$output_dir"' EXIT
cd -- "$project_dir"
lake env bash -euo pipefail -s -- "$source_dir" "$output_dir" "$imports" <<'REPLAY'
  src=$1
  out=$2
  export LEAN_PATH="$out:${3:+$3:}${LEAN_PATH:-}"
  modules=(TargetGeometry AsymmetricTerminal AsymmetricStep AsymmetricPacked AsymmetricRayColumn
           AsymmetricRayGroup AsymmetricRayShape AsymmetricRayKernel AsymmetricRayLabel AsymmetricRayException
           AsymmetricPhysicalReturn)
  for module in "${modules[@]}"; do
    lean -R "$src" -o "$out/$module.olean" "$src/$module.lean" | tee "$out/$module.log"
    python3 - "$src/$module.lean" "$out/$module.log" <<'PY'
import re
import sys
from pathlib import Path

source, log = (Path(arg).read_text() for arg in sys.argv[1:])
expected = set(re.findall(r"^#print axioms (\S+)", source, re.M))
reports = re.findall(r"\x27([^\x27]+)\x27 depends on axioms:\s*\[([^\]]*)\]", log)
standard = {"propext", "Classical.choice", "Quot.sound"}
if not expected or len(reports) != len(expected):
    sys.exit("Incomplete axiom report")
for declaration in expected:
    matches = [name for name, _ in reports if name == declaration or name.endswith("." + declaration)]
    if len(matches) != 1:
        sys.exit(f"Missing or ambiguous axiom report for {declaration}")
for name, axioms in reports:
    actual = {value.strip() for value in axioms.split(",")}
    if actual - standard:
        sys.exit(f"Additional axioms in {name}: {actual - standard}")
PY
    leanchecker -v "$module"
  done
REPLAY
