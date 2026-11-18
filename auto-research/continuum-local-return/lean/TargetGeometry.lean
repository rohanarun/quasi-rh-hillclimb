/- Target geometry for the conditional local count application.
   Adapted from Joseph Bebel's tracker #143 PositiveCapacity, PositiveGeometry
   and BoundsCore, commit c74d855c3bdfceeee059501aea76c8b1627b9abd, and Hailey
   Collet's Record1252270103Return geometry. Apache-2.0. -/
import Candidate.Local.Qrh.TwoSlot.AnchorZeroLoss.BoundsCore

set_option autoImplicit false
namespace ContinuumLocalReturn.TargetGeometry
noncomputable section
open QRH.Record1252270103Return
open Qrh.TwoSlot.AnchorZeroLoss (BoundsCore floorPrice floor_margin_coarse)

/-- The lower endpoint is the proposed rational target. The upper endpoint is
    the same as in #143 PositiveGeometry. -/
def targetCorridor : Set ℝ := Set.Icc (17466917 / 20000000) (87334587 / 100000000)

/-- Closed form of the stationary-cutoff enclosure from #143 Precision.cutoff_bounds. -/
def cutoffCorridor : Set ℝ := Set.Icc (815324503 / 1000000000) (163064901 / 200000000)

def targetEll (t : ℝ) : ℝ := 11/3 - 4*t

theorem target_ell_bounds {t : ℝ} (ht : t ∈ targetCorridor) :
    (17328/100000 : ℝ) < targetEll t ∧ targetEll t < 17329/100000 := by
  rcases ht with ⟨ht0, ht1⟩
  dsimp [targetEll]
  constructor <;> linarith

/-- Collet's genuine return geometry, with every defining inequality proved on
    a corridor extending to the new target from below the old contact. -/
@[instance_reducible] def targetParameters (t H : ℝ)
    (ht : t ∈ targetCorridor) (hH : H ∈ cutoffCorridor) : Geometry.Parameters where
  theta := t
  ell := targetEll t
  x := 1 + targetEll t - H
  y := H - 2 * targetEll t
  ell_pos := by linarith [(target_ell_bounds ht).1]
  sixth_lt_ell := by linarith [(target_ell_bounds ht).1]
  ell_lt_fifth := by linarith [(target_ell_bounds ht).2]
  ell_lt_x := by linarith [hH.2]
  x_lt_y := by linarith [hH.1, (target_ell_bounds ht).2]
  y_lt_half := by linarith [hH.2, (target_ell_bounds ht).1]
  x_add_y := by ring
  dilation_gap := by linarith [hH.2, (target_ell_bounds ht).1]
  tuple_margin_neg := by linarith [(target_ell_bounds ht).2]
  signal_boundary := by unfold targetEll; ring

theorem target_h (t H : ℝ) (ht : t ∈ targetCorridor) (hH : H ∈ cutoffCorridor) :
    @Geometry.h (targetParameters t H ht hH) = H := by
  change 1 + targetEll t - (1 + targetEll t - H) = H
  ring

/-- The actual five-field class imported from tracker #143. -/
theorem targetCoarse (t H : ℝ) (ht : t ∈ targetCorridor) (hH : H ∈ cutoffCorridor) :
    @BoundsCore (targetParameters t H ht hH) := by
  refine @BoundsCore.mk (targetParameters t H ht hH) ?_ ?_ ?_ ?_ ?_
  · change (873/1000 : ℝ) < t ∧ t < 7/8
    constructor <;> linarith [ht.1, ht.2]
  · rw [target_h]
    constructor <;> linarith [hH.1, hH.2]
  · change (458/1000 : ℝ) < H - 2*targetEll t ∧ H - 2*targetEll t < 473/1000
    constructor <;> linarith [hH.1, hH.2, (target_ell_bounds ht).1, (target_ell_bounds ht).2]
  · change (1672/10000 : ℝ) < targetEll t ∧ targetEll t < 175/1000
    constructor <;> linarith [(target_ell_bounds ht).1, (target_ell_bounds ht).2]
  · rw [target_h]
    change (7/100 : ℝ) < (H - 2*targetEll t)/2 - H*(17/50 - 1/6) - 1/50
    linarith [hH.1, (target_ell_bounds ht).2]

theorem proposed_mem : (17466917/20000000 : ℝ) ∈ targetCorridor := by
  norm_num [targetCorridor, Set.mem_Icc]

/-- The whole rational enclosure in #143 `Precision.thetaBox` fits the same corridor. -/
theorem contact_enclosure_subset :
    Set.Icc (109168232013339822100148 / 125000000000000000000000 : ℝ)
      (174669171221343715360237 / 200000000000000000000000) ⊆ targetCorridor := by
  apply Set.Icc_subset_Icc <;> norm_num

/-- An application of the inherited averaged-floor margin to the rational target. -/
theorem proposed_floor {H d : ℝ} (hH : H ∈ cutoffCorridor) (hd : d ≤ H + 1/10000000000) :
    let G := targetParameters (17466917/20000000) H proposed_mem hH
    (1/1000 : ℝ) < (17466917/20000000 : ℝ) - @floorPrice G d - 1/100000 - 1/1000000000000 := by
  let G := targetParameters (17466917/20000000) H proposed_mem hH
  have hcore : @BoundsCore G := targetCoarse _ H proposed_mem hH
  apply @floor_margin_coarse G hcore d
  rw [target_h]
  exact hd

end
end ContinuumLocalReturn.TargetGeometry
#print axioms ContinuumLocalReturn.TargetGeometry.target_ell_bounds
#print axioms ContinuumLocalReturn.TargetGeometry.targetParameters
#print axioms ContinuumLocalReturn.TargetGeometry.target_h
#print axioms ContinuumLocalReturn.TargetGeometry.targetCoarse
#print axioms ContinuumLocalReturn.TargetGeometry.proposed_mem
#print axioms ContinuumLocalReturn.TargetGeometry.contact_enclosure_subset
#print axioms ContinuumLocalReturn.TargetGeometry.proposed_floor
