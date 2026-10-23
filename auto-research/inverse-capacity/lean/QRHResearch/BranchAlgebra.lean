/-
Copyright (c) 2026 Subhanjan Das. Released under the MIT License.
Prepared with substantial assistance from Claude (Anthropic).
-/
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Terminal-branch algebra at the initialization of the marked inverse moment

This file formalizes the *exact algebra* of the obstruction recorded in
`auto-research/inverse-capacity/STRUCTURED_MARK.md`. Line numbers refer to the OpenAI QRH
preprint, `openai/math` revision `fd4aeeb`, `build/paper.tex`.

The analytic inequalities of the preprint are **not** formalized here. We take
the preprint's defining relations at the initialization of `lem:marked`
(paper.tex 11751, 11909, 12197–12211):

* `D' = r + z - 2G`, mark cap `z₀ = z - G`,
* dual row length `M = 2D' - m - 2P₁`, column length `F = D' - P₁`,
* puncture length `Q = P₁ + G` (its largest admissible value, `old-eq:4.13`),

and prove:

1. the two margin identities that the preprint itself records at 12206–12211;
2. the **column branch** of the terminal reflected-energy estimate can close only
   if `2M + Q + 2z₀ < 2F` (a necessary condition: from `old-eq:4.10` and
   `eq:inverse-terminal-width`, the exact requirement also subtracts the small
   nonnegative lengths `V` and `3ĥ`; derived in `STRUCTURED_MARK.md` §3, not
   formalized). We prove this condition is equivalent to
   `r + 2z < m + (P₁ + 5G)/2`; at `P₁ = G = 0` it is the inverse capacity
   condition `r + 2z < m`;
3. the **row branch** with a mark saving `κ·z₀` requires `r + (2 - κ)z < m`
   (at `P₁ = G = 0`), so a structured saving relaxes only the row branch;
4. hence, for every `κ ≥ 0`, the conjunction of both branches is equivalent to
   `r + 2z < m`: improving the mark coefficients cannot change the capacity.
-/

namespace QRHResearch.BranchAlgebra

/-- Initialization column length `D' = r + z - 2G` (paper.tex 11624–11627). -/
def Dp (r z G : ℝ) : ℝ := r + z - 2 * G

/-- Surviving mark cap `z₀ = z - G`. -/
def z0 (z G : ℝ) : ℝ := z - G

/-- Formal initial row scale `M = 2D' - m - 2P₁` (`eq:inverse-initial-row`, 11751). -/
def Minit (r z m G P₁ : ℝ) : ℝ := 2 * Dp r z G - m - 2 * P₁

/-- Formal canonical column length `F = D' - P₁` (`eq:initial-canonical-lengths`, 11909). -/
def Finit (r z G P₁ : ℝ) : ℝ := Dp r z G - P₁

/-- The first margin identity recorded by the preprint at 12207. -/
theorem first_margin_identity (r z m G P₁ : ℝ) :
    Finit r z G P₁ - Minit r z m G P₁ - (P₁ + G) - z0 z G = m - r - 2 * z + 2 * G := by
  unfold Finit Minit Dp z0; ring

/-- The second margin identity recorded by the preprint at 12208. -/
theorem second_margin_identity (r z m G P₁ : ℝ) :
    4 * Finit r z G P₁ - 3 * Minit r z m G P₁ - 6 * z0 z G
      = 3 * m - 2 * r - 8 * z + 10 * G + 2 * P₁ := by
  unfold Finit Minit Dp z0; ring

/-- **Column branch.** With the largest puncture `Q = P₁ + G`, the necessary
column-branch condition `2M + Q + 2z₀ < 2F` is equivalent to
`r + 2z < m + (P₁ + 5G)/2`. -/
theorem column_branch_iff (r z m G P₁ : ℝ) :
    2 * Minit r z m G P₁ + (P₁ + G) + 2 * z0 z G < 2 * Finit r z G P₁ ↔
      r + 2 * z < m + (P₁ + 5 * G) / 2 := by
  unfold Finit Minit Dp z0
  constructor <;> intro h <;> linarith

/-- **Row branch** with a mark saving `κ·z₀` (paper: `κ = 0`; Lemma S: `κ = 1/3`). -/
theorem row_branch_iff (r z m κ : ℝ) :
    Minit r z m 0 0 + z0 z 0 - κ * z0 z 0 < Finit r z 0 0 ↔ r + (2 - κ) * z < m := by
  unfold Finit Minit Dp z0
  constructor <;> intro h <;> nlinarith [h]

/-- **Mixed branch** (paper's second invariant `3M + 6z₀ ≤ 4F`, `old-eq:4.11`). -/
theorem mixed_branch_iff (r z m : ℝ) :
    3 * Minit r z m 0 0 + 6 * z0 z 0 ≤ 4 * Finit r z 0 0 ↔ 2 * r + 8 * z ≤ 3 * m := by
  unfold Finit Minit Dp z0
  constructor <;> intro h <;> linarith

/-- **The obstruction.** For every structured mark saving `κ ≥ 0` (and `z ≥ 0`), the
necessary column-branch condition and the row-branch condition hold together exactly
when `r + 2z < m`, the preprint's inverse capacity. A better mark coefficient alone
cannot move it. -/
theorem capacity_unchanged (r z m κ : ℝ) (hκ : 0 ≤ κ) (hz : 0 ≤ z) :
    (2 * Minit r z m 0 0 + (0 + 0) + 2 * z0 z 0 < 2 * Finit r z 0 0 ∧
        Minit r z m 0 0 + z0 z 0 - κ * z0 z 0 < Finit r z 0 0) ↔
      r + 2 * z < m := by
  rw [column_branch_iff, row_branch_iff]
  have hκz : 0 ≤ κ * z := mul_nonneg hκ hz
  constructor
  · rintro ⟨h, -⟩; linarith
  · intro h
    refine ⟨by linarith, ?_⟩
    nlinarith [hκz]

end QRHResearch.BranchAlgebra
