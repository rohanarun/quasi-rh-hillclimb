/- Conditional local count transport, using the original physical amplitude partition.
   Adapted from Joseph Bebel's tracker #143 PositiveMaskedCount and the inherited
   OpenAI, Hailey Collet and Sil mask transport (Apache-2.0). -/
import Submissions.hailey_collet_1252270103.Cycle25.Assembly.Count.MaskedCount

set_option autoImplicit false
namespace ContinuumLocalReturn
noncomputable section
open scoped Classical BigOperators
open OAI OAI.SevenEighths OAI.SevenEighths.Cycle25DetectorRowCount
open HeckeDetectorPhysicalSelection HeckeDetectorAmplitudeFirst HeckeDetectorFiberPartition

/-- The original bound everywhere, intersected with the saved inverse count on the patch. -/
def localizedCount (base inverse : ℝ → ℝ) (eta p0 d0 d1 delta p : ℝ) : ℝ :=
  if delta ∈ Set.Icc d0 d1 ∧ p ∈ Set.Icc p0 (1/2 : ℝ) then
    min (base p) (inverse p - eta)
  else base p

/-- For fixed delta, the conditional improvement is available at every larger
    admitted amplitude once it is available at the masked amplitude. -/
theorem localizedCount_antitone (base inverse : ℝ → ℝ) (eta p0 d0 d1 delta : ℝ)
    (hbase : AntitoneOn base (Set.Icc 0 (1/2 : ℝ)))
    (hinverse : delta ∈ Set.Icc d0 d1 → AntitoneOn inverse (Set.Icc p0 (1/2 : ℝ))) :
    AntitoneOn (localizedCount base inverse eta p0 d0 d1 delta) (Set.Icc 0 (1/2 : ℝ)) := by
  intro x hx y hy hxy
  have hb := hbase hx hy hxy
  by_cases hpatch : delta ∈ Set.Icc d0 d1 ∧ x ∈ Set.Icc p0 (1/2 : ℝ)
  · have hpy : y ∈ Set.Icc p0 (1/2 : ℝ) := ⟨hpatch.2.1.trans hxy, hy.2⟩
    simp only [localizedCount, ite_eq_left hpatch, ite_eq_left (And.intro hpatch.1 hpy)]
    exact min_le_min hb (sub_le_sub_right (hinverse hpatch.1 hpatch.2 hpy hxy) eta)
  · simp only [localizedCount, ite_eq_right hpatch]
    split
    · exact (min_le_left _ _).trans hb
    · exact hb

/-- The analytic hypothesis concerns the full finite amplitude class, prior to
    masking error slots. The conclusion uses that same class at the selected mean. -/
theorem masked_local_class_count {Row Slot : Type*} [DecidableEq Slot]
    (rows : Finset Row) (slots main : Finset Slot) (U delta mesh : ℝ) (hm : 0 < mesh)
    (width : Slot → ℝ) (Q : Row → Slot → ℂ) (bin : BinLabel slots (delta/2) mesh)
    (hd : 0 < delta) (hU : 1 ≤ U) (hw : ∀ j ∈ slots, 0 ≤ width j)
    (hL : 0 < ∑ j ∈ slots, width j)
    (base inverse : ℝ → ℝ) (eta p0 d0 d1 C loss : ℝ) (hC : 0 ≤ C)
    (hbase : AntitoneOn base (Set.Icc 0 (1/2 : ℝ)))
    (hinverse : delta ∈ Set.Icc d0 d1 → AntitoneOn inverse (Set.Icc p0 (1/2 : ℝ)))
    (hne : (amplitudeRows rows slots U (delta/2) mesh hm width Q bin).Nonempty)
    (hcard : ((amplitudeRows rows slots U (delta/2) mesh hm width Q bin).card : ℝ) ≤
      C * U ^ (base (classMean slots (delta/2) mesh width bin / delta) + loss))
    (hsave : delta ∈ Set.Icc d0 d1 → classMean slots (delta/2) mesh width bin / delta ∈
      Set.Icc p0 (1/2 : ℝ) →
      ((amplitudeRows rows slots U (delta/2) mesh hm width Q bin).card : ℝ) ≤
      C * U ^ (inverse (classMean slots (delta/2) mesh width bin / delta) - eta + loss)) :
    let g := binValue slots (delta/2) mesh bin
    let q := weightedMean slots width (maskedGain main g)
    0 ≤ q ∧ q ≤ delta/2 ∧
      ((amplitudeRows rows slots U (delta/2) mesh hm width Q bin).card : ℝ) ≤
        C * U ^ (localizedCount base inverse eta p0 d0 d1 delta (q/delta) + loss) := by
  dsimp only
  let g := binValue slots (delta/2) mesh bin
  let q := weightedMean slots width (maskedGain main g)
  let full := classMean slots (delta/2) mesh width bin
  have hg : ∀ j ∈ slots, 0 ≤ g j ∧ g j ≤ delta/2 := by
    obtain ⟨u, hu⟩ := hne
    intro j hj
    change 0 ≤ binValue slots (delta/2) mesh bin j ∧ binValue slots (delta/2) mesh bin j ≤ delta/2
    rw [← amplitude_class_value rows slots U (delta/2) mesh hm width Q bin u hu j hj]
    exact HeckePrimeAmplitudeBins.amplitude_bounds _ _ _ _ (by positivity)
  obtain ⟨hq0, hqf, hfulltop⟩ := maskedMean_bounds slots main width g delta hw hL hg
  change 0 ≤ q at hq0
  change q ≤ full at hqf
  change full ≤ delta/2 at hfulltop
  have hpf : full/delta ∈ Set.Icc 0 (1/2 : ℝ) :=
    ⟨div_nonneg (hq0.trans hqf) hd.le, (div_le_iff₀ hd).mpr (by linarith)⟩
  have hpqf : q/delta ≤ full/delta := div_le_div_of_nonneg_right hqf hd.le
  have hpq : q/delta ∈ Set.Icc 0 (1/2 : ℝ) := ⟨div_nonneg hq0 hd.le, hpqf.trans hpf.2⟩
  refine ⟨hq0, hqf.trans hfulltop, ?_⟩
  apply le_trans (b := C * U ^ (localizedCount base inverse eta p0 d0 d1 delta (full/delta) + loss))
  · unfold localizedCount
    split
    next hp =>
      by_cases hcmp : base (full/delta) ≤ inverse (full/delta) - eta
      · rw [min_eq_left hcmp]
        exact hcard
      · rw [min_eq_right (le_of_not_ge hcmp)]
        exact hsave hp.1 hp.2
    next => exact hcard
  · apply mul_le_mul_of_nonneg_left _ hC
    apply Real.rpow_le_rpow_of_exponent_le hU
    exact add_le_add (localizedCount_antitone base inverse eta p0 d0 d1 delta
      hbase hinverse hpq hpf hpqf) le_rfl

end
end ContinuumLocalReturn
#print axioms ContinuumLocalReturn.localizedCount_antitone
#print axioms ContinuumLocalReturn.masked_local_class_count
