/- Copyright (c) 2026 Joseph Bebel. Apache-2.0.
Canonical physical class count, including the masked selection mean, without
a fixed-fee schedule. Adapted from PR137 PublicCount and MaskedSourceCount
(Sil, Hailey Collet and predecessor authors, Apache-2.0). -/
import TargetNonfloorSchedule
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.PositiveCanonicalCount
import Candidate.Local.Qrh.TwoSlot.AnchorExtension.Library.JointDetector.BoundaryPhysical.PhysicalDirect.MaskedSourceCount

set_option autoImplicit false
set_option maxHeartbeats 700000
namespace ContinuumLocalReturn.DynamicSource
open Qrh.TwoSlot.AnchorContinuum.PositiveTransport
open NonfloorSchedule PhysicalBranch
open Qrh.TwoSlot.AnchorZeroLoss.Affine.Return
noncomputable section
open scoped Classical BigOperators
open Filter
open QRH.Record1252270103Return QRH.Record1252270103Return.GenericPhysical
open Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.PhysicalDirect
open OAI OAI.SevenEighths QRH.Record12518109Count
open HeckeFamily HeckeInverseAmplification ProbePhysical ProbeHighRowFamily
open HeckeDetectorPhysicalSelection HeckeDetectorAmplitudeFirst HeckeDetectorFiberPartition
open Cycle25DetectorRowCount
variable {line : Qrh.TwoSlot.AnchorZeroLoss.Affine.Line}
variable [Geometry.Parameters]
variable [Qrh.JointDetector.BoundaryPhysical.Return.Geometry.CoreBounds]
variable [scheme : Qrh.TwoSlot.AnchorZeroLoss.Affine.Return.ImprovedCountScheme line]

def SavedCount (H : ℝ) (w : ImprovedWindow line scheme.naturalκ) (D : QRH.Record1252270103Return.GenericPhysical.BaselineData) (F : SourceData)
    (counts : CountParameters F.modulus ⊤ D.t) (τ sigma : ℝ) (n : ℕ)
    : Prop :=
    ∃ C : ℝ, 1 ≤ C ∧ ∀ η : Character, ∀ᶠ Z : ℝ in atTop,
      ∀ d a C0 : ℝ, (1/200:ℝ) ≤ d → d ≤ 7/8 → 51/100 < a → a ≤ 7/8 → 1 ≤ C0 →
      ∀ rows : Finset FreeRow,
      (∀ u ∈ rows, u.val ≠ 1 ∧ Z^(1/100:ℝ) ≤ rowNorm u ∧
        (calibrationForSet F.S F.maximal).residueMonoid u.val ≠ 0 ∧ rowNorm u ≤ Z^(d-D.t)) →
      ∀ i : ℕ, i ≤ n →
      (∀ u ∈ rows, detectorMaximum
        (sourceDetectorFamily F.S F.exclusions.prime η u (rayCubeFamily F.modulus ⊤ le_top u))
        (3*(i+1:ℕ)*Z^τ) < a+2*D.e) →
      (∀ u ∈ rows, a ≤ detectorMaximum
        (sourceDetectorFamily F.S F.exclusions.prime η u (rayCubeFamily F.modulus ⊤ le_top u))
        ((3*i:ℕ)*Z^τ)) →
      ∀ z : ℂ, z.re = 17/50 → |z.im| ≤ Z^(2*τ) →
      SourceMomentBound D F counts η Z τ (C0*Z^D.t) (Z^(2*τ)) →
      let Q := canonicalFamily D F Z z
      ∀ bin : BinLabel (Finset.univ : Finset (Fin D.N)) ((2*a-1)/2) D.t,
      let rows' := amplitudeRows rows Finset.univ (Z^d) ((2*a-1)/2) D.t D.t_pos
        (fun j => D.length j/d) Q bin
      let q := classMean Finset.univ ((2*a-1)/2) D.t (fun j => D.length j/d) bin
      rows'.Nonempty → d ∈ Set.Icc (seam H) (top H) →
      2*a-1 ∈ Set.Icc (425/1000:ℝ) (4267/10000) →
      q/(2*a-1) ∈ Set.Icc (49995/100000:ℝ) (1/2) →
      (rows'.card : ℝ) ≤ C*C0*(Z^d)^(w.value (2*a-1) (q/(2*a-1))-1/10000000+sigma)

theorem masked_source_count_dynamic (H : ℝ) (w : ImprovedWindow line scheme.naturalκ) (hc : Covers w) (D : QRH.Record1252270103Return.GenericPhysical.BaselineData) (F : SourceData)
    (counts : CountParameters F.modulus ⊤ D.t) (τ sigma : ℝ) (n : ℕ)
    (hτ : 0 < τ) (hτzero : τ < (1/200:ℝ)/2)
    (hτheight : 4*τ < (1/200:ℝ)*D.cost) (hτ2 : 2*τ ≤ D.t)
    (herror : 159*D.ε+609*D.t ≤ sigma) (saved : SavedCount H w D F counts τ sigma n) :
    ∃ C : ℝ, 1 ≤ C ∧ ∀ η : Character, ∀ᶠ Z : ℝ in atTop,
      ∀ d a C0 : ℝ, (1/200:ℝ) ≤ d → d ≤ 7/8 → d ≤ top H → 51/100 < a → a ≤ 7/8 → 1 ≤ C0 →
      ∀ rows : Finset FreeRow,
      (∀ u ∈ rows, u.val ≠ 1 ∧ Z^(1/100:ℝ) ≤ rowNorm u ∧
        (calibrationForSet F.S F.maximal).residueMonoid u.val ≠ 0 ∧ rowNorm u ≤ Z^(d-D.t)) →
      ∀ i : ℕ, i ≤ n →
      (∀ u ∈ rows, detectorMaximum
        (sourceDetectorFamily F.S F.exclusions.prime η u (rayCubeFamily F.modulus ⊤ le_top u))
        (3*(i+1:ℕ)*Z^τ) < a+2*D.e) →
      (∀ u ∈ rows, a ≤ detectorMaximum
        (sourceDetectorFamily F.S F.exclusions.prime η u (rayCubeFamily F.modulus ⊤ le_top u))
        ((3*i:ℕ)*Z^τ)) →
      ∀ z : ℂ, z.re = 17/50 → |z.im| ≤ Z^(2*τ) →
      SourceMomentBound D F counts η Z τ (C0*Z^D.t) (Z^(2*τ)) →
      let Q := canonicalFamily D F Z z
      ∀ main : Finset (Fin D.N),
      ∀ bin : BinLabel (Finset.univ : Finset (Fin D.N)) ((2*a-1)/2) D.t,
      let rows' := amplitudeRows rows Finset.univ (Z^d) ((2*a-1)/2) D.t D.t_pos
        (fun j => D.length j/d) Q bin
      let q := weightedMean Finset.univ (fun j => D.length j/d)
        (maskedGain main (binValue Finset.univ ((2*a-1)/2) D.t bin))
      rows'.Nonempty → 0 ≤ q ∧ q ≤ (2*a-1)/2 ∧ (rows'.card : ℝ) ≤ C*C0*
        (Z^d)^(envelope (branchesAt H d (ImprovedCount.admittedBranches (line := line)) (savedBranch w hc)) D.momentKappa
          (2*a-1) (q/(2*a-1))+sigma) := by
  obtain ⟨K,hK,hbase⟩ := canonical_source_count D F counts τ sigma n hτ hτzero hτheight hτ2 herror
  obtain ⟨K',hK',hsaved⟩ := saved
  refine ⟨max K K',hK.trans (le_max_left _ _),?_⟩
  intro η
  filter_upwards [hbase η,hsaved η,eventually_gt_atTop (1:ℝ)] with Z hbase hsaved hZ
  intro d a C0 hd hd' htop ha ha' hC0 rows hrows i hi hnext hcurrent z hz hzim hmom
  dsimp only
  intro main bin hne
  have hdpos : 0 < d := by linarith
  have hδ : 0 < 2*a-1 := by linarith
  have hδhi : 2*a-1 ≤ 3/4 := by linarith
  have hU := Real.one_le_rpow hZ.le hdpos.le
  have hC : 0 ≤ max K K'*C0 := by have := le_max_left K K'; positivity
  have hw : ∀ j ∈ Finset.univ, 0 ≤ D.length j/d := fun j _ => (div_pos (D.slots_pos j) hdpos).le
  have hL : 0 < ∑ j, D.length j/d := by rw [←Finset.sum_div,D.slots_sum]; exact div_pos Geometry.ell_pos hdpos
  have hb := hbase d a C0 hd hd' ha ha' hC0 rows hrows i hi hnext hcurrent z hz hzim hmom bin hne
  have strongBase := hb.2.2.trans (mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_right (le_max_left K K') (by linarith)) (by positivity))
  unfold branchesAt
  by_cases hstrip : seam H ≤ d
  · rw [ite_eq_left hstrip]
    apply masked_class_at_prepended_envelope w hc rows Finset.univ main (Z^d) (2*a-1)
      D.momentKappa D.t D.t_pos (fun j => D.length j/d) (canonicalFamily D F Z z)
      bin hδ hδhi D.momentKappa_lo D.momentKappa_hi hU hw hL _ sigma hC hne strongBase
    intro hds hps
    have hh := hsaved d a C0 hd hd' ha ha' hC0 rows hrows i hi hnext hcurrent z hz hzim hmom
      bin hne ⟨hstrip,htop⟩ hds hps
    exact hh.trans (mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right (le_max_right K K') (by linarith)) (by positivity))
  · rw [ite_eq_right hstrip]
    exact masked_class_count rows Finset.univ main (Z^d) (2*a-1) D.momentKappa D.t D.t_pos
      (fun j => D.length j/d) (canonicalFamily D F Z z) bin hδ hδhi
      D.momentKappa_lo D.momentKappa_hi hU hw hL _ sigma hC hne strongBase

end
end ContinuumLocalReturn.DynamicSource
#print axioms ContinuumLocalReturn.DynamicSource.masked_source_count_dynamic
