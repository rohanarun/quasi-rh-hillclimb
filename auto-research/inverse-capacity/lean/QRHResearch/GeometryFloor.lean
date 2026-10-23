/-
Copyright (c) 2026 Subhanjan Das. Released under the MIT License.
Prepared with substantial assistance from Claude (Anthropic).
-/
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# The geometric floor of the probe family, and exact bookkeeping of the gains

Collet's parameterized return (PR #8, `return.tex` NR3) uses
`ℓ = 11/3 - 4θ` and requires the Gram geometry `ℓ < 1/5` (also the third scalar
reserve `1/5 - ℓ > 0` in `return_budget.py`). Hence every member of this probe
family has `θ > 13/15`, whatever the source faces and counts.

We also record, as exact rational identities, the gains quoted in the write-ups.
These are arithmetic facts about the stated numbers only; they do not certify
any zero-free region.
-/

namespace QRHResearch.GeometryFloor

/-- `ℓ = 11/3 - 4θ` and `ℓ < 1/5` force `θ > 13/15`. -/
theorem theta_gt_13_15 (θ ℓ : ℝ) (hℓ : ℓ = 11 / 3 - 4 * θ) (hgeom : ℓ < 1 / 5) :
    13 / 15 < θ := by
  subst hℓ; linarith

/-- The relation is the boundary formula `θ = 11/12 - ℓ/4` (Track A's closed form). -/
theorem theta_of_ell (θ ℓ : ℝ) (hℓ : ℓ = 11 / 3 - 4 * θ) : θ = 11 / 12 - ℓ / 4 := by
  subst hℓ; ring

/-- Gain of the adaptive-cap candidate over the fine-step candidate (PR #27). -/
theorem gain_over_pr27 : (87477128 : ℚ) / 10 ^ 8 - 87477127 / 10 ^ 8 = 1 / 10 ^ 8 := by
  norm_num

/-- Gain of the PR #27 candidate over PR #26. -/
theorem gain_pr27_over_pr26 : (87477137 : ℚ) / 10 ^ 8 - 87477128 / 10 ^ 8 = 9 / 10 ^ 8 := by
  norm_num

/-- Gain of the PR #27 candidate over Collet's Lean-verified PR #8 endpoint. -/
theorem gain_pr27_over_pr8 :
    (8747729897 : ℚ) / 10 ^ 10 - 87477128 / 10 ^ 8 = 17097 / 10 ^ 10 := by
  norm_num

/-- Gain of the adaptive-cap candidate over Collet's Lean-verified PR #8 endpoint. -/
theorem gain_adaptive_over_pr8 :
    (8747729897 : ℚ) / 10 ^ 10 - 87477127 / 10 ^ 8 = 17197 / 10 ^ 10 := by
  norm_num

/-- All progress below `7/8` up to PR #27, used for the scale comparisons. -/
theorem progress_below_seven_eighths : (7 : ℚ) / 8 - 87477128 / 10 ^ 8 = 2859 / 12500000 := by
  norm_num

end QRHResearch.GeometryFloor
