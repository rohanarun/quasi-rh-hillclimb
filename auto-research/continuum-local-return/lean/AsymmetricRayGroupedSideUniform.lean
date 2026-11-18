/- Uniform form of the two-ray packed side estimate. AI-assisted adaptation of
Sil’s Packet/Grouped, copyright 2026 Sil, Apache-2.0. -/
import AsymmetricRayGroupedSide

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false

namespace ContinuumLocalReturn.AsymmetricRayGroupedSide
open QRH.SilDensitySplit.CubeFree QRH.SilDensitySplit.CubeFree.Packet
open QRH.SilDensitySplit.CubeFree.Packet.Grouped
open ContinuumLocalReturn.AsymmetricPacked (InShape)
open ContinuumLocalReturn.AsymmetricRayGroup (mixedEnergy mixedRow grouped_ray_class_bound)
open Candidate.FourthPower QRH.SilDensitySplit.CubeFree.FP QRH.SilDensitySplit.CubeFree.Packet.Reduce

noncomputable section
open scoped Classical BigOperators SchwartzMap ContDiff
open Filter OAI OAI.SevenEighths HeckeFamily CanonicalQuadraticSieve ConcreteTraceCRT
open QRH.Record1252270103KernelMass
open CenteredMomentNaturalFixedRaySource
open CenteredMomentInductionEnergy
open CenteredMomentFiniteProfileExceptional
open HeckeDyadic
open CenteredMomentDetectorEnergyInitialState
open CenteredMomentFirstAmplificationChoice
open CenteredMomentSectorLocalization
open CenteredMomentRetainedEnergy
open OAI.SevenEighths.CenteredMomentEnergyBands (length)
open ProfileSeparation (commonPair scale pairWeight pairMajorant)
local notation "O" => HeckeFamily.O

local instance (rayM : Ideal O) [NeZero rayM] : Finite (O⧸rayM) :=
  Ring.HasFiniteQuotients.finiteQuotient (NeZero.ne rayM)



variable {L : ℝ}

/-- Uniform side power with the source-independent Schwartz and height constants
chosen before the scale, the source, the label set and the two ray characters. -/
theorem eventually_packed (price : Price) (Mmin Mmax : ℝ) (θ : GData L) (hL : 0 ≤ L)
    (mesh ε : ℝ) (hmesh : 0 < mesh) (hm2 : mesh ≤ 1/2) (hε : 0 < ε)
    (hmε : (3+price.lip)*mesh ≤ ε/8) (η : Character)
    (degA : ℕ) (SA : Finset (ℕ×ℕ)) (CA Cred : ℝ) (hCA : 0 ≤ CA) (hCred : 0 ≤ Cred) :
    ∃ (J : ℕ) (controls : Finset (ℕ×ℕ)) (C : ℝ), 0<C ∧ ∀ᶠ Z : ℝ in atTop,
    ∀ (r : GSrc θ mesh Z) (labels : Finset (GLabel θ mesh Z)) (w₀ H : ℝ),
      Second.AdmissibleGroup (gFrame L θ mesh η Z) Mmin Mmax mesh ε Z r labels H →
    ∀ (ω₁ ω₂ : Character) (keep : DictIdx → O → Prop), (∀ j z, keep j z → z ≠ 0) →
    ∀ (raw : (x : GLabel θ mesh Z) → Fits η r x → ℝ → ℝ) (n y short err : ℝ),
      InShape n y short err (length Z r.X₁) (length Z r.X₂) →
      InShape n y short err (length Z r.Y₁) (length Z r.Y₂) →
      LocalReduction η ω₁ ω₂ keep r raw Cred (ε/8) (ε/(48*max 1 θ.Bmask)) →
      ShapeLeaf price η ω₁ ω₂ keep r w₀ H n y short (err+Real.logb Z 3) (ε/8) degA SA CA →
      ∀ v : ℝ, ∑ x ∈ labels, gWeight x * weightedEnergy η r raw x v ≤
        C * gAmp L θ mesh η Z r J controls * (1+‖v‖)^(2*J) *
          Z^(r.colLog+r.twistLog+price.f w₀ (gP r) (∑i,r.w i) H+ε) := by
  have hlip := price.lip_nonneg
  obtain ⟨nP, CP, hCP, hctl⟩ := ProfileSeparation.commonPair_control SA
  obtain ⟨T₀, K₀, hK₀, hm₀⟩ := ProfileSeparation.pairMajorant_mass_control 0
  obtain ⟨TJ, KJ, hKJ, hmJ⟩ := ProfileSeparation.pairMajorant_mass_control (2*nP)
  obtain ⟨n₀, S₀, C₀, hC₀, -, htw₀⟩ :=
    ReferenceUniformApproximation.twisted_source_control θ.a θ.b θ.ha0 T₀
  obtain ⟨nJ, SJ, CJ, hCJ, -, htwJ⟩ :=
    ReferenceUniformApproximation.twisted_source_control θ.a θ.b θ.ha0 TJ
  refine ⟨degA + 2*n₀ + 2*nJ, S₀ ∪ SJ, ctot CA CP Cred K₀ C₀ KJ CJ + 1, ?_, ?_⟩
  · have : 0 ≤ ctot CA CP Cred K₀ C₀ KJ CJ := by
      unfold ctot
      have := QuadraticInitialBound.diagonalControl_nonneg
        CenteredMomentFirstAmplificationChoice.ballProfile
      positivity
    linarith
  filter_upwards [
    eventually_dyadic_count ((Fintype.card DictIdx : ℝ) * 2^θ.N) L θ.b (ε/16) (by positivity),
    eventually_logb_le 3 (ε / (16 * (1 + 3*price.lip))) (by positivity),
    eventually_logb_le 3 (1/2) (by norm_num), eventually_gt_atTop (1:ℝ),
    (tendsto_rpow_atTop (by norm_num : (0:ℝ) < 3/2)).eventually_ge_atTop (2:ℝ)]
    with Z hcount hl3 hl3' hZ1 hZ32
  have hl3e : (1 + 3*price.lip) * Real.logb Z 3 ≤ ε/16 := by
    rw [le_div_iff₀ (by positivity)] at hl3
    linarith
  intro r labels w₀ H hadm ω₁ ω₂ keep hkeep raw n y short err hX hY hred hleaf v
  have h := packed_at price Mmin Mmax θ hL mesh hmesh hm2 η ε hε hmε degA SA CA hCA
    nP CP hctl T₀ K₀ hK₀.le hm₀ TJ KJ hKJ.le hmJ n₀ S₀ C₀ hC₀.le htw₀ nJ SJ CJ hCJ.le htwJ
    Cred hCred Z hZ1 hcount hl3e hl3' hZ32 r labels w₀ H hadm ω₁ ω₂ keep hkeep raw n y short err
    hX hY hred hleaf v
  apply h.trans
  have hnon : 0 ≤ gAmp L θ mesh η Z r (degA+2*n₀+2*nJ) (S₀∪SJ) := by
    unfold gAmp
    exact mul_nonneg (sq_nonneg _) (pow_nonneg (zero_le_one.trans r.one_le_height) _)
  gcongr
  linarith

end
end ContinuumLocalReturn.AsymmetricRayGroupedSide

#print axioms ContinuumLocalReturn.AsymmetricRayGroupedSide.eventually_packed
