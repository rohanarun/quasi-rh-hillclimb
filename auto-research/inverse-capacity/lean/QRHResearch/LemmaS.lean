/-
Copyright (c) 2026 Subhanjan Das. Released under the MIT License.
Prepared with substantial assistance from Claude (Anthropic).
-/
import Mathlib.Analysis.Complex.Norm
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.Tactic.GCongr
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Linarith

/-!
# Lemma S: structured mark bound (analytic core)

`auto-research/inverse-capacity/STRUCTURED_MARK.md` proves that, after the preprint's cubic
reflection, the slot ("mark") coefficient factorizes over two groups of slot
primes as `A(P₁P₂) = α(P₁) β(P₂) K(P₁, P₂)`, where `K(P₁,P₂) = (P₂/P₁)₃^{±2}` is
a cubic residue symbol (paper.tex 2271, 7446). Heath-Brown's cubic large sieve
(paper.tex 7491; Israel J. Math. 120 (2000), Thm 2) says that this kernel
satisfies a large-sieve inequality with constant
`Δ ≍_ε Z^ε (A + B + (AB)^{2/3})`.

**What is formalized here.** Heath-Brown's theorem and the residue-symbol
factorization are *not* available in Mathlib; they enter only as the explicit
hypotheses `LargeSieve K Δ` and `hA`. Given them, we prove:

* `bilinear_bound`: the bilinear form is bounded by `Δ ‖α‖² ‖β‖²`
  (Cauchy–Schwarz plus the large sieve);
* `structured_mark_bound`: the same for any tuple coefficient of the factorized
  form;
* `balanced_saving`: the exponent bookkeeping. If the two groups have lengths
  `z₁ + z₂ = z` with `|z₁ - z₂| ≤ w ≤ z/3`, the saving over the trivial bound,
  `z - max(z₁, z₂, 2z/3)`, is at least `z/3`.
-/

open Finset

namespace QRHResearch.LemmaS

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- The kernel `K` satisfies the large-sieve inequality with constant `Δ`. -/
def LargeSieve (K : ι → κ → ℂ) (Δ : ℝ) : Prop :=
  ∀ b : κ → ℂ, ∑ i, ‖∑ j, b j * K i j‖ ^ 2 ≤ Δ * ∑ j, ‖b j‖ ^ 2

/-- Cauchy–Schwarz plus a large-sieve inequality bound the bilinear form. -/
theorem bilinear_bound (K : ι → κ → ℂ) (Δ : ℝ) (hLS : LargeSieve K Δ)
    (α : ι → ℂ) (β : κ → ℂ) :
    ‖∑ i, ∑ j, α i * β j * K i j‖ ^ 2 ≤ (∑ i, ‖α i‖ ^ 2) * (Δ * ∑ j, ‖β j‖ ^ 2) := by
  set X : ι → ℂ := fun i => ∑ j, β j * K i j with hX
  have hsum : ∑ i, ∑ j, α i * β j * K i j = ∑ i, α i * X i := by
    simp only [hX, Finset.mul_sum, mul_assoc]
  rw [hsum]
  have h1 : ‖∑ i, α i * X i‖ ≤ ∑ i, ‖α i‖ * ‖X i‖ := by
    calc ‖∑ i, α i * X i‖ ≤ ∑ i, ‖α i * X i‖ := norm_sum_le _ _
      _ = ∑ i, ‖α i‖ * ‖X i‖ := by simp only [Complex.norm_mul]
  have h2 : (∑ i, ‖α i‖ * ‖X i‖) ^ 2 ≤ (∑ i, ‖α i‖ ^ 2) * ∑ i, ‖X i‖ ^ 2 :=
    Finset.sum_mul_sq_le_sq_mul_sq _ _ _
  have h3 : ∑ i, ‖X i‖ ^ 2 ≤ Δ * ∑ j, ‖β j‖ ^ 2 := hLS β
  have hα : 0 ≤ ∑ i, ‖α i‖ ^ 2 := by positivity
  calc ‖∑ i, α i * X i‖ ^ 2 ≤ (∑ i, ‖α i‖ * ‖X i‖) ^ 2 := by
        gcongr
    _ ≤ (∑ i, ‖α i‖ ^ 2) * ∑ i, ‖X i‖ ^ 2 := h2
    _ ≤ (∑ i, ‖α i‖ ^ 2) * (Δ * ∑ j, ‖β j‖ ^ 2) := mul_le_mul_of_nonneg_left h3 hα

/-- **Lemma S, analytic core.** Any tuple coefficient that factorizes as
`α(P₁) β(P₂) K(P₁,P₂)` over two slot groups, with a kernel satisfying the large
sieve, obeys the bilinear bound. -/
theorem structured_mark_bound (K : ι → κ → ℂ) (Δ : ℝ) (hLS : LargeSieve K Δ)
    (α : ι → ℂ) (β : κ → ℂ) (A : ι → κ → ℂ) (hA : ∀ i j, A i j = α i * β j * K i j) :
    ‖∑ i, ∑ j, A i j‖ ^ 2 ≤ (∑ i, ‖α i‖ ^ 2) * (Δ * ∑ j, ‖β j‖ ^ 2) := by
  simp only [hA]
  exact bilinear_bound K Δ hLS α β

/-- **Exponent bookkeeping for Lemma S.** With Heath-Brown's constant
`Δ = Z^{max(z₁, z₂, 2z/3) + ε}`, the saving over the trivial bound `Z^z` is
`z - max(z₁, z₂, 2z/3)`. For balanced groups it is at least `z/3`. -/
theorem balanced_saving (z z₁ z₂ w : ℝ) (hsum : z₁ + z₂ = z) (hbal : |z₁ - z₂| ≤ w)
    (hw : w ≤ z / 3) :
    z / 3 ≤ z - max (max z₁ z₂) (2 * z / 3) := by
  obtain ⟨hl, hr⟩ := abs_le.mp hbal
  have h1 : z₁ ≤ 2 * z / 3 := by linarith
  have h2 : z₂ ≤ 2 * z / 3 := by linarith
  have hmax : max (max z₁ z₂) (2 * z / 3) ≤ 2 * z / 3 :=
    max_le (max_le h1 h2) le_rfl
  linarith

/-- The improved mark saving is at least `z/3` for every dual length `v`, whereas
the preprint's saving `min(v, z, (v+z)/3)` (`old-eq:4.7`) vanishes as `v → 0`. -/
theorem saving_floor (v z s : ℝ) (hs : z / 3 ≤ s) :
    z / 3 ≤ max (min (min v z) ((v + z) / 3)) s :=
  le_trans hs (le_max_right _ _)

end QRHResearch.LemmaS
