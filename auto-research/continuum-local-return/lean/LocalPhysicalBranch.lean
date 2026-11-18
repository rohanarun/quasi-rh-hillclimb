/- Conditional count on the full amplitude class, at the patched Collet envelope.
   Uses the count-scheme contracts of Joseph Bebel, Sil and Hailey Collet. -/
import MaskedLocalCount
import Candidate.Local.Qrh.TwoSlot.AnchorZeroLoss.AffineScheme

set_option autoImplicit false
namespace ContinuumLocalReturn.PhysicalBranch
noncomputable section
open scoped Classical BigOperators
open Qrh.TwoSlot.AnchorZeroLoss.Affine Qrh.TwoSlot.AnchorZeroLoss.Affine.Return
open OAI OAI.SevenEighths OAI.SevenEighths.Cycle25DetectorRowCount
open HeckeDetectorPhysicalSelection HeckeDetectorAmplitudeFirst HeckeDetectorFiberPartition
open QRH.Record12518109Return (Branch finiteEnvelope)

variable {line : Line} [S : ImprovedCountScheme line]

/-- Inclusion of the proposed rectangle in the source window. -/
def Covers (w : ImprovedWindow line S.naturalκ) : Prop :=
  w.deltaLo ≤ 425/1000 ∧ 4267/10000 ≤ w.deltaHi ∧ w.pLo ≤ 49995/100000

/-- The window endpoints used by tracker #143 imply the required inclusions. -/
theorem covers_of_source_edges (w : ImprovedWindow line S.naturalκ)
    (hlo : w.deltaLo = 189/512) (hhi : w.deltaHi = 15/32) (hp : w.pLo = 15/32) :
    Covers w := by
  norm_num [Covers,hlo,hhi,hp]

private theorem saved_antitone (w : ImprovedWindow line S.naturalκ) (hc : Covers w)
    {δ : ℝ} (hd : δ ∈ Set.Icc (425/1000 : ℝ) (4267/10000)) :
    AntitoneOn (w.value δ) (Set.Icc (49995/100000 : ℝ) (1/2)) := by
  have hsrc : δ ∈ Set.Icc w.deltaLo w.deltaHi := ⟨hc.1.trans hd.1, hd.2.trans hc.2.1⟩
  intro p hp q hq hpq
  exact w.antitone hsrc ⟨hc.2.2.trans hp.1,hp.2⟩ ⟨hc.2.2.trans hq.1,hq.2⟩ hpq

/-- The source window with its exponent reduced on the proposed rectangle. -/
def savedBranch (w : ImprovedWindow line S.naturalκ) (hc : Covers w) : Branch where
  available δ p := δ ∈ Set.Icc (425/1000 : ℝ) (4267/10000) ∧
    p ∈ Set.Icc (49995/100000 : ℝ) (1/2)
  value δ p := w.value δ p - 1/10000000
  upward := fun hp hpq htop => ⟨hp.1, ⟨hp.2.1.trans hpq,htop⟩⟩
  antitone := fun hp hq hpq =>
    sub_le_sub_right (saved_antitone w hc hp.1 hp.2 hq.2 hpq) _

theorem envelope_eq_localized (w : ImprovedWindow line S.naturalκ) (hc : Covers w)
    (κ δ p : ℝ) :
    finiteEnvelope QRH.Record12518109Return.countingR
      (savedBranch w hc :: ImprovedCount.admittedBranches (line := line)) κ δ p =
    localizedCount (ImprovedCount.envelope (line := line) κ δ) (w.value δ)
      (1/10000000) (49995/100000) (425/1000) (4267/10000) δ p := by
  classical
  rw [finiteEnvelope]
  by_cases ha : (savedBranch w hc).available δ p
  · rw [ite_eq_left ha]
    change δ ∈ Set.Icc (425/1000 : ℝ) (4267/10000) ∧
      p ∈ Set.Icc (49995/100000 : ℝ) (1/2) at ha
    rw [localizedCount, ite_eq_left ha]
    exact min_comm _ _
  · rw [ite_eq_right ha]
    change ¬(δ ∈ Set.Icc (425/1000 : ℝ) (4267/10000) ∧
      p ∈ Set.Icc (49995/100000 : ℝ) (1/2)) at ha
    rw [localizedCount, ite_eq_right ha]
    rfl

/-- The original finite class satisfies the prepended envelope at the masked
    mean, from its inherited bound and the additional estimate at the full mean. -/
theorem masked_class_at_prepended_envelope (w : ImprovedWindow line S.naturalκ) (hc : Covers w)
    {Row Slot : Type*} [DecidableEq Slot] (rows : Finset Row) (slots main : Finset Slot)
    (U δ κ mesh : ℝ) (hm : 0 < mesh) (width : Slot → ℝ) (Q : Row → Slot → ℂ)
    (bin : BinLabel slots (δ/2) mesh) (hd : 0 < δ) (hdhi : δ ≤ 3/4)
    (hk : (7/10 : ℝ) ≤ κ) (hkhi : κ ≤ 3/4) (hU : 1 ≤ U)
    (hw : ∀ j ∈ slots, 0 ≤ width j) (hL : 0 < ∑ j ∈ slots, width j)
    (C loss : ℝ) (hC : 0 ≤ C)
    (hne : (amplitudeRows rows slots U (δ/2) mesh hm width Q bin).Nonempty)
    (hcard : ((amplitudeRows rows slots U (δ/2) mesh hm width Q bin).card : ℝ) ≤
      C * U ^ (ImprovedCount.envelope (line := line) κ δ
        (classMean slots (δ/2) mesh width bin / δ) + loss))
    (hsave : δ ∈ Set.Icc (425/1000 : ℝ) (4267/10000) →
      classMean slots (δ/2) mesh width bin / δ ∈ Set.Icc (49995/100000 : ℝ) (1/2) →
      ((amplitudeRows rows slots U (δ/2) mesh hm width Q bin).card : ℝ) ≤
        C * U ^ (w.value δ (classMean slots (δ/2) mesh width bin / δ) - 1/10000000 + loss)) :
    let q := weightedMean slots width (maskedGain main (binValue slots (δ/2) mesh bin))
    0 ≤ q ∧ q ≤ δ/2 ∧
      ((amplitudeRows rows slots U (δ/2) mesh hm width Q bin).card : ℝ) ≤
        C * U ^ (finiteEnvelope QRH.Record12518109Return.countingR
          (savedBranch w hc :: ImprovedCount.admittedBranches (line := line)) κ δ (q/δ) + loss) := by
  dsimp only
  rw [envelope_eq_localized]
  apply masked_local_class_count rows slots main U δ mesh hm width Q bin hd hU hw hL
    _ _ _ _ _ _ C loss hC _ (saved_antitone w hc) hne hcard hsave
  intro p hp q hq hpq
  apply QRH.Record12518109Return.finiteEnvelope_antitone QRH.Record12518109Return.countingR
    (ImprovedCount.admittedBranches (line := line)) hpq hq.2
  rw [QRH.Record12518109Return.countingR_eq_actual hk,
    QRH.Record12518109Return.countingR_eq_actual hk]
  exact rowCount_antitone hd.le hdhi hk hkhi hp.1 hpq hq.2

end
end ContinuumLocalReturn.PhysicalBranch
#print axioms ContinuumLocalReturn.PhysicalBranch.covers_of_source_edges
#print axioms ContinuumLocalReturn.PhysicalBranch.savedBranch
#print axioms ContinuumLocalReturn.PhysicalBranch.envelope_eq_localized
#print axioms ContinuumLocalReturn.PhysicalBranch.masked_class_at_prepended_envelope
