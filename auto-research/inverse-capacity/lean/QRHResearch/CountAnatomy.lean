/-
Copyright (c) 2026 Subhanjan Das. Released under the MIT License.
Prepared with substantial assistance from Claude (Anthropic).
-/
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Anatomy of the same-zero count

The preprint's `prop:detector-counts` (paper.tex 15185) and Collet's FR4/NR2 obtain
the count exponent `R` as the common value of three affine witness lines,

* inverse `I(r) = a_I - b_I r`,
* plain   `P(m) = a_P - b_P m`,
* long    `L(t) = c + v t`,

at a crossing with `t = r + m`. We prove that `R` is then the mean of the three
intercepts weighted by the reciprocals of the slopes. This is the exact identity
behind the statement "the inverse line carries about half the weight" in
`auto-research/inverse-capacity/INVERSE_CAPACITY.md`.
-/

namespace QRHResearch.CountAnatomy

/-- The crossing value of three affine witness lines is the reciprocal-slope
weighted mean of their intercepts. -/
theorem crossing_weighted_mean (aI bI aP bP c v r m R : ℝ)
    (hbI : 0 < bI) (hbP : 0 < bP) (hv : 0 < v)
    (hI : aI - bI * r = R) (hP : aP - bP * m = R) (hL : c + v * (r + m) = R) :
    R * (1 / bI + 1 / bP + 1 / v) = aI / bI + aP / bP + c / v := by
  have h1 : aI / bI = r + R / bI := by
    field_simp
    linear_combination hI
  have h2 : aP / bP = m + R / bP := by
    field_simp
    linear_combination hP
  have h3 : c / v = R / v - (r + m) := by
    field_simp
    linear_combination hL
  rw [h1, h2, h3]
  ring

/-- Equivalent division form. -/
theorem crossing_value (aI bI aP bP c v r m R : ℝ)
    (hbI : 0 < bI) (hbP : 0 < bP) (hv : 0 < v)
    (hI : aI - bI * r = R) (hP : aP - bP * m = R) (hL : c + v * (r + m) = R) :
    R = (aI / bI + aP / bP + c / v) / (1 / bI + 1 / bP + 1 / v) := by
  have hpos : 0 < 1 / bI + 1 / bP + 1 / v := by positivity
  rw [eq_div_iff hpos.ne']
  exact crossing_weighted_mean aI bI aP bP c v r m R hbI hbP hv hI hP hL

end QRHResearch.CountAnatomy
