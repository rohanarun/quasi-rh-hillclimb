#!/usr/bin/env bash
set -euo pipefail
adapter_dir=$(cd -- "$(dirname -- "$0")" && pwd)
project_dir=${1:?Usage: replay.sh /path/to/compiled/tracker/project}
scratch=$(mktemp -d)
trap 'rm -rf -- "$scratch"' EXIT
cd -- "$project_dir"
lake env bash -eu -o pipefail -c '
  adapter_dir=$1
  scratch=$2
  export LEAN_NUM_THREADS=2
  lean -R "$adapter_dir" -o "$scratch/RadicalPhysical.olean" "$adapter_dir/RadicalPhysical.lean" | tee "$scratch/axioms"
  test "$(rg -c "depends on axioms:" "$scratch/axioms")" = 6
  test "$(rg -Fc "depends on axioms: [propext, Classical.choice, Quot.sound]" "$scratch/axioms")" = 6
  export LEAN_PATH="$scratch:${LEAN_PATH:-}"
  leanchecker -v RadicalPhysical
' _ "$adapter_dir" "$scratch"
