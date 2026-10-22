import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Structural Quasi-RH budget lemmas

These are real inequalities for the finite budget model. They do not assert
an analytic moment estimate or a zero-free theorem.
-/

noncomputable section

namespace QuasiRhBudget

/-- Original low-block threshold after substituting the geometry. -/
def sigmaOld (ell : ℝ) : ℝ := 11 / 12 - ell / 4

/-- Hypothetical threshold after removing the entire low-block loss. -/
def sigmaIdeal (h : ℝ) : ℝ := 1 - h / 6

/-- High margin coefficient in the frozen geometry. -/
def highMargin (ell h : ℝ) : ℝ := 2 * h - 1 - 3 * ell

/-- Floor-bin exponent at the original low-block threshold. -/
def floorOld (ell h : ℝ) : ℝ := 39 * ell / 50 + h / 3 - 61 / 150

/-- Floor-bin exponent at the hypothetical loss-free threshold. -/
def floorIdeal (ell h : ℝ) : ℝ := 53 * ell / 100 + h / 2 - 49 / 100

/-- The preprint's first high-bin exponent, with an explicit target sigma and q.
The geometry is ly = h - 2 ell, and z0 = 17/50 is kept fixed. -/
def highExponent (ell h sigma d delta q R : ℝ) : ℝ :=
  (1 + delta) / 2 - sigma + h * (17 / 50 - 1 / 6) -
    (1 + delta) / 2 * (h - 2 * ell) - (1 - (1 + delta) / 2) * ell -
    (delta / 2 - q) * ell + d * (R + delta / 2 - 17 / 50)

theorem old_low_threshold (ell h : ℝ) :
    sigmaOld ell = 1 - h / 6 + highMargin ell h / 12 := by
  unfold sigmaOld highMargin
  ring

theorem high_exponent_affine (ell h sigma d delta q R : ℝ) :
    highExponent ell h sigma d delta q R =
      highExponent ell h sigma h delta q R + (d - h) * (R + delta / 2 - 17 / 50) := by
  unfold highExponent
  ring

theorem floor_specialization (ell h sigma rho : ℝ) :
    highExponent ell h sigma h (1 / 50) (1 / 100) (1 - rho) =
      51 / 100 - sigma + 53 * ell / 100 + h / 3 - h * rho := by
  unfold highExponent
  ring

theorem floor_old_specialization (ell h : ℝ) :
    highExponent ell h (sigmaOld ell) h (1 / 50) (1 / 100) 1 = floorOld ell h := by
  unfold highExponent sigmaOld floorOld
  ring

theorem floor_ideal_specialization (ell h : ℝ) :
    highExponent ell h (sigmaIdeal h) h (1 / 50) (1 / 100) 1 = floorIdeal ell h := by
  unfold highExponent sigmaIdeal floorIdeal
  ring

theorem floor_old_identity (ell h : ℝ) :
    floorOld ell h = 128 / 25 * (167 / 192 - sigmaOld ell) + highMargin ell h / 6 := by
  unfold floorOld sigmaOld highMargin
  ring

theorem old_floor_obstruction {ell h : ℝ}
    (hfloor : floorOld ell h < 0) (hmargin : 0 < highMargin ell h) :
    167 / 192 < sigmaOld ell := by
  have := floor_old_identity ell h
  linarith

theorem floor_ideal_identity (ell h : ℝ) :
    floorIdeal ell h =
      1818 / 500 * (1573 / 1818 - sigmaIdeal h) + 53 / 500 * (5 * ell - h) := by
  unfold floorIdeal sigmaIdeal
  ring

theorem ideal_floor_obstruction {ell h : ℝ}
    (hfloor : floorIdeal ell h < 0) (hreserve : 0 < 5 * ell - h) :
    1573 / 1818 < sigmaIdeal h := by
  have := floor_ideal_identity ell h
  linarith

theorem floor_supply_identity (ell h : ℝ) :
    floorIdeal ell h =
      13326 / 3700 * (11513 / 13326 - sigmaIdeal h) +
        1961 / 3700 * (ell - 7 * h / 37) := by
  unfold floorIdeal sigmaIdeal
  ring

theorem supply_floor_obstruction {ell h : ℝ}
    (hfloor : floorIdeal ell h < 0) (hsupply : 7 * h / 37 < ell) :
    11513 / 13326 < sigmaIdeal h := by
  have := floor_supply_identity ell h
  linarith

/-- Reaching the hypothetical target 108/125 requires this saving in floor R. -/
theorem target_floor_saving {ell h rho : ℝ}
    (htarget : sigmaIdeal h = 108 / 125)
    (hreserve : 0 < 5 * ell - h)
    (hfloor : floorIdeal ell h - h * rho < 0) :
    281 / 51000 < rho := by
  have hh : h = 102 / 125 := by unfold sigmaIdeal at htarget; linarith
  subst h
  unfold floorIdeal at hfloor
  linarith

/-- Frozen plain-capacity (2/9) factors in the balanced row count. -/
def rowD (x : ℝ) : ℝ := 3 - 17 * x / 9

def rowP (x : ℝ) : ℝ := (2 - 8 * x / 9) * (1 - x)

def rowJ (delta x : ℝ) : ℝ := (5 / 6 - delta) * rowD x + delta * rowP x

def balancedCount (delta x : ℝ) : ℝ :=
  1 - delta + (5 / 6 - delta) * delta * rowP x / (2 * rowJ delta x)

theorem row_factor_bounds {x : ℝ} (hx : 0 ≤ x ∧ x ≤ 1 / 2) :
    37 / 18 ≤ rowD x ∧ 7 / 9 ≤ rowP x ∧ 1 ≤ rowD x - rowP x := by
  unfold rowD rowP
  refine ⟨by linarith [hx.1, hx.2], ?_, ?_⟩
  · nlinarith [mul_nonneg (by linarith [hx.2] : 0 ≤ 1 / 2 - x)
      (by linarith [hx.2] : 0 ≤ 22 - 8 * x)]
  · nlinarith [mul_nonneg hx.1 (by linarith [hx.2] : 0 ≤ 1 - 8 * x / 9)]

theorem row_denominator_lower {delta x : ℝ}
    (hdelta : 0 ≤ delta ∧ delta ≤ 5 / 6) (hx : 0 ≤ x ∧ x ≤ 1 / 2) :
    35 / 54 ≤ rowJ delta x := by
  obtain ⟨hD, hP, _⟩ := row_factor_bounds hx
  have hslack : 0 ≤ 5 / 6 - delta := by linarith [hdelta.2]
  have hD' : 0 ≤ rowD x - 7 / 9 := by linarith
  have hP' : 0 ≤ rowP x - 7 / 9 := by linarith
  unfold rowJ
  nlinarith [mul_nonneg hslack hD', mul_nonneg hdelta.1 hP']

/-- Agreement with the preprint's balanced-t expression for the row count. -/
theorem balanced_count_closed_form {delta x : ℝ}
    (hdelta : 0 ≤ delta ∧ delta ≤ 5 / 6) (hx : 0 ≤ x ∧ x ≤ 1 / 2) :
    1 - delta + delta * rowP x / rowD x *
      (3 / 2 - (1 + delta * rowP x / (2 * rowJ delta x))) = balancedCount delta x := by
  have hD : rowD x ≠ 0 := ne_of_gt (by linarith [(row_factor_bounds hx).1])
  have hJ : rowJ delta x ≠ 0 := ne_of_gt (by linarith [row_denominator_lower hdelta hx])
  unfold balancedCount
  field_simp
  unfold rowJ
  ring

theorem balanced_count_bounds {delta x : ℝ}
    (hdelta : 0 ≤ delta ∧ delta ≤ 5 / 6) (hx : 0 ≤ x ∧ x ≤ 1 / 2) :
    1 - delta ≤ balancedCount delta x ∧ balancedCount delta x ≤ 1 - delta / 2 := by
  obtain ⟨hD, hP, hDP⟩ := row_factor_bounds hx
  have hJ := row_denominator_lower hdelta hx
  have hden : 0 < 2 * rowJ delta x := by linarith
  have hslack : 0 ≤ 5 / 6 - delta := by linarith [hdelta.2]
  have hP0 : 0 ≤ rowP x := by linarith
  have hnum : 0 ≤ (5 / 6 - delta) * delta * rowP x :=
    mul_nonneg (mul_nonneg hslack hdelta.1) hP0
  have hJP : (5 / 6 - delta) * rowP x ≤ rowJ delta x := by
    unfold rowJ
    nlinarith [mul_nonneg hslack (by linarith : 0 ≤ rowD x - rowP x),
      mul_nonneg hdelta.1 hP0]
  have hquot : (5 / 6 - delta) * delta * rowP x / (2 * rowJ delta x) ≤ delta / 2 := by
    apply (div_le_iff₀ hden).2
    nlinarith [mul_nonneg hdelta.1 (sub_nonneg.mpr hJP)]
  unfold balancedCount
  exact ⟨by linarith [div_nonneg hnum hden.le], by linarith⟩

/-- The high-bin frequency slope remains in (0,1), including a capacity
allowance u of at most 1/8. Its endpoint cost must still be paid separately. -/
theorem balanced_slope_bounds {delta x u : ℝ}
    (hdelta : 0 ≤ delta ∧ delta ≤ 5 / 6) (hx : 0 ≤ x ∧ x ≤ 1 / 2)
    (hu : 0 ≤ u ∧ u ≤ 1 / 8) :
    73 / 300 ≤ balancedCount delta x + u + delta / 2 - 17 / 50 ∧
      balancedCount delta x + u + delta / 2 - 17 / 50 ≤ 157 / 200 := by
  obtain ⟨hlo, hhi⟩ := balanced_count_bounds hdelta hx
  constructor <;> linarith [hdelta.2, hu.1, hu.2]

/-- Slack above the inverse-capacity requirement 7/37 at frequency h. -/
def supplySlack (ell h : ℝ) : ℝ := 37 * ell - 7 * h

/-- A fixed positive reserve, uniform throughout the extended interval. -/
def supplyGap (ell h : ℝ) : ℝ := supplySlack ell h / 74

/-- Explicit simultaneous supply, buffered-frequency and exponent allowance. -/
def extensionRadius (ell h gamma : ℝ) : ℝ :=
  min (supplySlack ell h / 14) (min ((1 - h) / 2) (gamma / 2))

theorem extension_radius_pos {ell h gamma : ℝ}
    (hsupply : 0 < supplySlack ell h) (hh : h < 1) (hgamma : 0 < gamma) :
    0 < extensionRadius ell h gamma := by
  unfold extensionRadius
  simp only [lt_min_iff]
  exact ⟨by positivity, by linarith, by positivity⟩

theorem extension_below_one {ell h gamma zeta : ℝ}
    (hh : h < 1) (hzeta : zeta ≤ extensionRadius ell h gamma) :
    h + zeta < 1 := by
  unfold extensionRadius at hzeta
  simp only [le_min_iff] at hzeta
  linarith [hzeta.2.1]

theorem extension_supply {ell h gamma zeta d : ℝ}
    (hell : 0 < ell) (hh : h < 1) (hsupply : 0 < supplySlack ell h)
    (hzeta : zeta ≤ extensionRadius ell h gamma)
    (hd : 0 < d) (hupper : d ≤ h + zeta) :
    supplyGap ell h < ell / d - 7 / 37 := by
  have hroom := extension_below_one hh hzeta
  have hden : 0 < h + zeta := lt_of_lt_of_le hd hupper
  have hs : zeta ≤ supplySlack ell h / 14 :=
    le_trans hzeta (min_le_left _ _)
  have hproduct : 0 < supplySlack ell h * (1 - h - zeta) :=
    mul_pos hsupply (by linarith)
  have hstrict : (supplyGap ell h + 7 / 37) * (h + zeta) < ell := by
    unfold supplyGap supplySlack at *
    nlinarith
  have hend : supplyGap ell h + 7 / 37 < ell / (h + zeta) :=
    (lt_div_iff₀ hden).2 hstrict
  have hmono := div_le_div_of_nonneg_left hell.le hd hupper
  linarith

/-- At or below the supply boundary, every positive extension already fails
the necessary 7/37 supply test at its right endpoint. -/
theorem no_extension_at_supply_boundary {ell h zeta : ℝ}
    (hh : 0 < h) (hzeta : 0 < zeta) (hsupply : supplySlack ell h ≤ 0) :
    ell / (h + zeta) < 7 / 37 := by
  apply (div_lt_iff₀ (by linarith : 0 < h + zeta)).2
  unfold supplySlack at hsupply
  linarith

/-- Exact supply-only characterization; it does not assert endpoint negativity. -/
theorem supply_extension_iff {ell h : ℝ} (hhalf : 1 / 2 ≤ h) (hh : h < 1) :
    (∃ zeta, 0 < zeta ∧ h + zeta < 1 ∧
      ∀ d, 1 / 2 ≤ d → d ≤ h + zeta → 7 / 37 < ell / d) ↔
        0 < supplySlack ell h := by
  constructor
  · rintro ⟨zeta, hzeta, _, hext⟩
    by_contra hsupply
    have hfail := no_extension_at_supply_boundary (by linarith : 0 < h) hzeta
      (le_of_not_gt hsupply)
    have hpass := hext (h + zeta) (by linarith) le_rfl
    linarith
  · intro hsupply
    have hell : 0 < ell := by unfold supplySlack at hsupply; linarith
    have hgap : 0 < supplyGap ell h := by unfold supplyGap; positivity
    refine ⟨extensionRadius ell h 1, extension_radius_pos hsupply hh (by norm_num),
      extension_below_one hh le_rfl, ?_⟩
    intro d hd hupper
    have := extension_supply hell hh hsupply (le_rfl : extensionRadius ell h 1 ≤ _)
      (by linarith : 0 < d) hupper
    linarith

/-- A uniform affine endpoint margin survives any extension of size ≤ gamma/2.
The endpoint must already include all capacity and target-comparison costs. -/
theorem affine_margin_extension {endpoint slope h gamma zeta d : ℝ}
    (hgamma : 0 ≤ gamma) (hendpoint : endpoint ≤ -gamma)
    (hslope0 : 0 ≤ slope) (hslope1 : slope ≤ 1)
    (hzeta : zeta ≤ gamma / 2) (hupper : d ≤ h + zeta) :
    endpoint + (d - h) * slope ≤ -gamma / 2 := by
  by_cases hd : d ≤ h
  · have := mul_nonpos_of_nonpos_of_nonneg (sub_nonpos.mpr hd) hslope0
    linarith
  · have := mul_nonneg (by linarith : 0 ≤ d - h) (sub_nonneg.mpr hslope1)
    nlinarith

/-- Constructive uniform extension for any indexed family of affine bins. -/
theorem constructive_extension {ι : Type*} {ell h gamma : ℝ}
    (endpoint slope : ι → ℝ)
    (hell : 0 < ell) (hhalf : 1 / 2 ≤ h) (hh : h < 1)
    (hsupply : 0 < supplySlack ell h) (hgamma : 0 < gamma)
    (hendpoint : ∀ i, endpoint i ≤ -gamma)
    (hslope : ∀ i, 0 ≤ slope i ∧ slope i ≤ 1) :
    let zeta := extensionRadius ell h gamma
    0 < zeta ∧ h + zeta < 1 ∧ 0 < supplyGap ell h ∧
      ∀ d, 1 / 2 ≤ d → d ≤ h + zeta →
        supplyGap ell h < ell / d - 7 / 37 ∧
          ∀ i, endpoint i + (d - h) * slope i ≤ -gamma / 2 := by
  dsimp only
  refine ⟨extension_radius_pos hsupply hh hgamma, extension_below_one hh le_rfl,
    by unfold supplyGap; positivity, ?_⟩
  intro d hd hupper
  refine ⟨extension_supply hell hh hsupply le_rfl (by linarith) hupper, ?_⟩
  intro i
  apply affine_margin_extension hgamma.le (hendpoint i) (hslope i).1 (hslope i).2
    (le_trans (min_le_right _ _) (min_le_right _ _)) hupper

/-- The explicit even mesh size; the added one makes the width bound strict
even when ell / threshold is an integer. -/
def slotCount (ell threshold : ℝ) : ℕ :=
  2 * (⌊ell / threshold⌋₊ + 1)

theorem slot_count_pos (ell threshold : ℝ) : 0 < slotCount ell threshold := by
  unfold slotCount
  positivity

theorem slot_count_even (ell threshold : ℝ) : Even (slotCount ell threshold) := by
  exact ⟨⌊ell / threshold⌋₊ + 1, by unfold slotCount; omega⟩

theorem slot_width_lt {ell threshold : ℝ} (hthreshold : 0 < threshold) :
    2 * ell / (slotCount ell threshold : ℝ) < threshold := by
  have hfloor := Nat.lt_floor_add_one (ell / threshold)
  have hmul := (div_lt_iff₀ hthreshold).1 hfloor
  have hcount : (0 : ℝ) < slotCount ell threshold := by
    exact_mod_cast slot_count_pos ell threshold
  apply (div_lt_iff₀ hcount).2
  unfold slotCount
  push_cast
  nlinarith

theorem normalized_slot_width_lt {ell threshold d : ℝ}
    (hthreshold : 0 < threshold) (hd : 1 / 2 ≤ d) :
    ell / ((slotCount ell threshold : ℝ) * d) < threshold := by
  have hcount : (0 : ℝ) < slotCount ell threshold := by
    exact_mod_cast slot_count_pos ell threshold
  have hwidth := slot_width_lt (ell := ell) hthreshold
  have hmul := (div_lt_iff₀ hcount).1 hwidth
  apply (div_lt_iff₀ (mul_pos hcount (by linarith))).2
  have := mul_nonneg (mul_pos hthreshold hcount).le (by linarith : 0 ≤ d - 1 / 2)
  nlinarith

theorem scaled_slot_width_lt {ell threshold d delta : ℝ}
    (hell : 0 ≤ ell) (hthreshold : 0 < threshold) (hd : 1 / 2 ≤ d)
    (hdelta : delta ≤ 1) :
    delta * (ell / ((slotCount ell threshold : ℝ) * d)) < threshold := by
  have hwidth := normalized_slot_width_lt (ell := ell) hthreshold hd
  have hwidth0 : 0 ≤ ell / ((slotCount ell threshold : ℝ) * d) := by positivity
  nlinarith [mul_nonneg (sub_nonneg.mpr hdelta) hwidth0]

/-- Choose the mesh below both input allowances and half the supply reserve. -/
def meshThreshold (ell h eta b : ℝ) : ℝ := min eta (min b (supplyGap ell h / 2))

theorem mesh_threshold_pos {ell h eta b : ℝ}
    (hsupply : 0 < supplySlack ell h) (heta : 0 < eta) (hb : 0 < b) :
    0 < meshThreshold ell h eta b := by
  unfold meshThreshold supplyGap
  positivity

theorem even_mesh {ell h eta b : ℝ}
    (hsupply : 0 < supplySlack ell h) (heta : 0 < eta) (hb : 0 < b) :
    let K := slotCount ell (meshThreshold ell h eta b)
    0 < K ∧ Even K ∧ 2 * ell / (K : ℝ) < eta ∧
      2 * ell / (K : ℝ) < b ∧ 2 * ell / (K : ℝ) < supplyGap ell h / 2 := by
  dsimp only
  have hwidth := slot_width_lt (ell := ell) (mesh_threshold_pos hsupply heta hb)
  refine ⟨slot_count_pos _ _, slot_count_even _ _, ?_, ?_, ?_⟩
  · exact lt_of_lt_of_le hwidth (min_le_left _ _)
  · exact lt_of_lt_of_le hwidth (le_trans (min_le_right _ _) (min_le_left _ _))
  · exact lt_of_lt_of_le hwidth (le_trans (min_le_right _ _) (min_le_right _ _))

end QuasiRhBudget
