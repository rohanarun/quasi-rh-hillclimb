#!/usr/bin/env bash
set -euo pipefail
adapter_dir=$(cd -- "$(dirname -- "$0")" && pwd)
project_dir=${1:?Usage: replay.sh /path/to/compiled/project [tracker-checkout] [compiled-tracker-imports]}
tracker_dir=
if [[ -n ${2:-} ]]; then
  tracker_dir=$(cd -- "$2" && pwd)
fi
packet_imports=
if [[ -n ${3:-} ]]; then
  packet_imports=$(cd -- "$3" && pwd)
fi
scratch=$(mktemp -d)
trap 'rm -rf -- "$scratch"' EXIT
cd -- "$project_dir"
lake env bash -eu -o pipefail -c '
  adapter_dir=$1
  scratch=$2
  tracker_dir=$3
  export LEAN_NUM_THREADS=2
  packet_imports=$4
  if [[ -n "$tracker_dir" && -z "$packet_imports" && -d "$PWD/.lake/build/lib/lean/Candidate" ]]; then
    packet_imports=$PWD/.lake/build/lib/lean
  fi
  export LEAN_PATH="$scratch:${packet_imports:+$packet_imports:}${LEAN_PATH:-}"
  if [[ -n "$packet_imports" ]]; then
    cp -R -s -L "$packet_imports/Candidate" "$scratch/"
  fi
  if [[ -n "$tracker_dir" ]]; then
    pin=c74d855c3bdfceeee059501aea76c8b1627b9abd
    source_root=submissions/2026-11-13-continuum-exact-contact/src
    compile_tracker_import() {
      local module_path=$1 blob=$2 output="$scratch/$1.olean"
      local input="$scratch/pinned/$module_path.lean"
      mkdir -p "$(dirname "$input")" "$(dirname "$output")"
      git -C "$tracker_dir" show "$pin:$source_root/$module_path.lean" > "$input"
      test "$(git hash-object "$input")" = "$blob"
      local linked
      for linked in "$output" "$output".* "${output%.olean}".ilean "${output%.olean}".ir; do
        if [[ -L "$linked" ]]; then unlink "$linked"; fi
      done
      lean -R "$scratch/pinned" -o "$output" "$input"
      leanchecker -v "${module_path//\//.}"
    }
    compile_tracker_import Candidate/Local/Qrh/TwoSlot/AnchorExtension/Library/JointDetector/BoundaryPhysical/TransportGeometry c5693b7fba0ea4f3355b293a605cf70251094b15
    compile_tracker_import Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/BoundsCore 4dc3b4bfd9384d411c03b555252c4c86da0ee98a
    compile_tracker_import Candidate/Local/Qrh/TwoSlot/AnchorExtension/Library/MarkedAnchor/Interface/FiberImproved 7758ef1791aa61ead011d3aa115270b87c6029c4
    compile_tracker_import Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/AffineFiber 7255881453349cfac56690e0714e43a814b51107
    compile_tracker_import Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/AffineScheme 793efca62b409020a94876b78e2757b9ad575e86
    compile_tracker_import Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveAmplitudeClass 8e72b5d45f42aaa81b84beb1f4b3f32383fc4293
  fi
  for module in RadicalPhysical MaskedLocalCount TargetGeometry LocalPhysicalBranch LocalPhysicalPacket; do
    case "$module" in
      RadicalPhysical) expected=6 ;;
      MaskedLocalCount) expected=2 ;;
      TargetGeometry) expected=7 ;;
      LocalPhysicalBranch) expected=4 ;;
      LocalPhysicalPacket) expected=1 ;;
    esac
    lean -R "$adapter_dir" -o "$scratch/$module.olean" "$adapter_dir/$module.lean" | tee "$scratch/$module.axioms"
    test "$(rg -c "depends on axioms:" "$scratch/$module.axioms")" = "$expected"
    test "$(rg -U --count-matches "depends on axioms: \[propext,\s*Classical\.choice,\s*Quot\.sound\]" "$scratch/$module.axioms")" = "$expected"
    leanchecker -v "$module"
  done
' _ "$adapter_dir" "$scratch" "$tracker_dir" "$packet_imports"
