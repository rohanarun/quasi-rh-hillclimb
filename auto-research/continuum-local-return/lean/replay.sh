#!/usr/bin/env bash
set -euo pipefail
adapter_dir=$(cd -- "$(dirname -- "$0")" && pwd)
project_dir=${1:?Usage: replay.sh /path/to/compiled/project [tracker-checkout]}
tracker_dir=
if [[ -n ${2:-} ]]; then
  tracker_dir=$(cd -- "$2" && pwd)
fi
scratch=$(mktemp -d)
trap 'rm -rf -- "$scratch"' EXIT
cd -- "$project_dir"
lake env bash -eu -o pipefail -c '
  adapter_dir=$1
  scratch=$2
  tracker_dir=$3
  export LEAN_NUM_THREADS=2
  export LEAN_PATH="$scratch:${LEAN_PATH:-}"
  if [[ -n "$tracker_dir" ]]; then
    pin=c74d855c3bdfceeee059501aea76c8b1627b9abd
    source_root=submissions/2026-11-13-continuum-exact-contact/src
    compile_tracker_import() {
      local module_path=$1 blob=$2 output="$scratch/$1.olean"
      mkdir -p "$(dirname "$output")"
      git -C "$tracker_dir" show "$pin:$source_root/$module_path.lean" > "$scratch/$module_path.lean"
      test "$(git hash-object "$scratch/$module_path.lean")" = "$blob"
      lean -R "$scratch" -o "$output" "$scratch/$module_path.lean"
      leanchecker -v "${module_path//\//.}"
    }
    compile_tracker_import Candidate/Local/Qrh/TwoSlot/AnchorExtension/Library/JointDetector/BoundaryPhysical/TransportGeometry c5693b7fba0ea4f3355b293a605cf70251094b15
    compile_tracker_import Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/BoundsCore 4dc3b4bfd9384d411c03b555252c4c86da0ee98a
  fi
  for module in RadicalPhysical MaskedLocalCount TargetGeometry; do
    case "$module" in
      RadicalPhysical) expected=6 ;;
      MaskedLocalCount) expected=2 ;;
      TargetGeometry) expected=7 ;;
    esac
    lean -R "$adapter_dir" -o "$scratch/$module.olean" "$adapter_dir/$module.lean" | tee "$scratch/$module.axioms"
    test "$(rg -c "depends on axioms:" "$scratch/$module.axioms")" = "$expected"
    test "$(rg -U --count-matches "depends on axioms: \[propext,\s*Classical\.choice,\s*Quot\.sound\]" "$scratch/$module.axioms")" = "$expected"
    leanchecker -v "$module"
  done
' _ "$adapter_dir" "$scratch" "$tracker_dir"
