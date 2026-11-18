/- Copyright (c) 2026 Sil, Apache-2.0, for the adapted JointKernel and reference proofs.
   The first physical block, ray expansion and whole-kernel Cauchy are from OAI.
   Adapted with OpenAI Codex assistance. The tracker application assumes the preprint's
   7/8 theorem. The displayed first-block identities and implications are independent of it. -/
import Submissions.sil_density_split_20261026.CubeFree.First.RawSidesBlock
import AsymmetricRayLabel

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 400000

namespace ContinuumLocalReturn.AsymmetricRayFirst
noncomputable section
open scoped Classical BigOperators SchwartzMap
open OAI OAI.SevenEighths HeckeFamily CanonicalQuadraticSieve CompletedGauss
open ConcreteTraceCRT ConcretePrimeRowBridge RayFourExpansion CanonicalRowCompletion
open CenteredMomentFirstPhysicalSource CenteredMomentCanonicalFirst CenteredMomentSourceRow
open CenteredMomentHeckeColumnWindow CenteredMomentGaussEnergy CenteredMomentSecondHeightFamily
open CenteredMomentSmoothedWindowEnergy CenteredMomentSecondWindowBudget CenteredMomentSecondWindowSource
open CenteredMomentFirstAmplificationChoice CenteredMomentSmooth CenteredMomentCauchy
open CenteredMomentLogDyadic CenteredMomentFirstColumns CenteredMomentHeckeWindowEnergy
open CenteredMomentFirstMaskedFamily CenteredMomentFirstChildBound CenteredMomentMobiusRegroup
open CenteredMomentSourceCommonMask CenteredMomentSupportedZeroEnergy CenteredMomentLattice CenteredMomentTwist CenteredMomentFirstSectors CenteredMomentHeckeExpansion CenteredMomentChildAssembly
open CenteredMomentFirstAssembly CenteredMomentSourceMass CenteredMomentSourceProfileMass
open CenteredMomentAddedZeroUniform CenteredMomentSourceRectangle
open QRH.SilDensitySplit.CubeFree
open FP.MixedPrincipalPair FP.MixedPrincipalWindow FP.MixedPrincipalAllocations
open FP.MixedFirstPhysicalApplication FP.MixedOriginalSecondZero FP.MixedInnerExceptionalBlock
open FP.MixedFirstAveragedWindow CenteredMomentSecondIdealBlockBound
open QRH.Record1252270103KernelMass ActualEisensteinCubic
local notation "O" => HeckeFamily.O
local notation "Id" => Ideal O
local instance {α : Type*} : DecidableEq α := Classical.decEq _

/-- The original two coordinate multipliers are evaluated separately on each tuple.
The two original heights and all punctures belong to the same original profiles as in Sil. -/
def aggregate {ι : Type*} [Fintype ι] {a b : ℝ} (s : Source ι a b) (ha : 0<a)
    (ω₁ ω₂ : Id →* ℂ) : Id → ℂ :=
  AsymmetricRayLabel.rayColumn (AsymmetricRayColumn.rayWeight ω₁ ω₂)
    s.S s.H s.pool s.d s.hd s.R 1 s.ν s.Wslot s.P
    (normPowerProfile s.W₁ a b ha s.hs₁ (s.W₁.smooth ⊤) s.t₁)
    (normPowerProfile s.W₂ a b ha s.hs₂ (s.W₂.smooth ⊤) s.t₂)
    b s.X₁ s.X₂ s.Y₁ s.Y₂

theorem aggregate_coprime {ι : Type*} [Fintype ι] {a b : ℝ} (s : Source ι a b) (ha : 0<a)
    (ω₁ ω₂ : Id →* ℂ) (I : Id) (h : aggregate s ha ω₁ ω₂ I ≠ 0) : IsCoprime I s.R := by
  unfold aggregate AsymmetricRayLabel.rayColumn at h
  obtain ⟨v, _, hv, he⟩ := finiteColumnCoefficient_witness _ _ I h
  have hm := profile_nonzero_masks _ _ _ _ _ _ _ _ _ _ _ _ _ v (mul_ne_zero_iff.mp hv).2
  exact he ▸ hm.1

open CenteredMomentSourceLowerSupport CenteredMomentFirstMixedRoot CenteredMomentFirstMixedAllowance CenteredMomentFirstCanonicalAllowance
open CenteredMomentFirstPhysicalSourceSupport CenteredMomentRankinRadical CenteredMomentFirstCanonicalFamily

/-- A nonzero signed decorated aggregate supplies a genuine tuple at the original norm floor. -/
theorem aggregate_lower {ι : Type*} [Fintype ι] {a b : ℝ} (s : Source ι a b) (ha : 0<a) (ω₁ ω₂ : Id →* ℂ) (I : Id)
    (hI : aggregate s ha ω₁ ω₂ I≠0) :
    (a^2/pairNorm s.d)*sourceVolume s≤(I.absNorm:ℝ) := by
  unfold aggregate AsymmetricRayLabel.rayColumn at hI
  obtain ⟨v,hv,hv0,hvI⟩ := CenteredMomentSupportedZeroEnergy.finiteColumnCoefficient_witness _ _ I hI
  have hs₁ := (normPowerProfile_support s.W₁ a b ha s.hs₁ (s.W₁.smooth ⊤) s.t₁).trans s.hs₁
  have hs₂ := (normPowerProfile_support s.W₂ a b ha s.hs₂ (s.W₂.smooth ⊤) s.t₂).trans s.hs₂
  have hl := profile_product_lower s.R s.ν s.Wslot s.P (fun _=>(1:ℝ))
    (normPowerProfile s.W₁ a b ha s.hs₁ (s.W₁.smooth ⊤) s.t₁)
    (normPowerProfile s.W₂ a b ha s.hs₂ (s.W₂.smooth ⊤) s.t₂)
    a a s.X₁ s.X₂ s.Y₁ s.Y₂ (s.X₁*s.X₂) s.d.1 s.d.2 1
    (fun i=>zero_lt_one.trans_le (s.hP i)) (fun _=>zero_le_one) ha.le ha.le
    (s.hL.trans_le s.hX₁) (s.hL.trans_le s.hX₂) (s.hL.trans_le s.hY₁) (s.hL.trans_le s.hY₂)
    s.hd.1 s.hd.2 rfl (s.hpY.trans s.hpX.symm)
    (fun i x hx=>(s.hW i hx).1) (fun x hx=>(hs₁ hx).1) (fun x hx=>(hs₂ hx).1)
    v (mul_ne_zero_iff.mp hv0).2
  simp only [Finset.prod_const_one,one_mul,hvI] at hl
  convert hl using 1
  unfold sourceVolume pairNorm
  ring

/-- Paired reference normalization for the same decorated nonzero block. -/
theorem physical_reference_pair {ι : Type*} [Fintype ι] {a b : ℝ} (s : Source ι a b) (ha : 0<a)
    (ω₁ ω₂ : Id →* ℂ) (η : Character) (m A : O) (t : ℝ)
    (C D : Id) (hC : Supported C) (hD : Supported D)
    (hCD : CompletedGauss.primeSupport C=CompletedGauss.primeSupport D) (E : Finset (CommonIndex C D))
    (ξ₁ ξ₂ : RayCharacter) (F : FixedPair η C D hC E ξ₁ ξ₂)
    (rows : Finset O) (W : 𝓢(ℝ,ℂ)) (U : Fin 4→ℝ→ℂ)
    (K K₀ H₀ A₀ B₀ M Z EL ER : ℝ)
    (hK : 0<K) (hA : 0<A₀) (hB : 0<B₀) (hZ : 1<Z)
    (hEL : 0≤EL) (hER : 0≤ER) (hwin : ∀i y,U i y≠0→|y|≤M)
    (hn : block η m A t (sourceColumns s) (aggregate s ha ω₁ ω₂)
      C D hC hD E rows W U K K₀ H₀ A₀ B₀≠0) :
    ‖scalar C D hC E K A₀ B₀‖/sourceVolume s*
      Real.sqrt (((F.left.modulus.absNorm:ℝ)*(sourceVolume s/(C.absNorm:ℝ))^2*
        Z^(allowance C D Z)*EL)*
        ((F.right.modulus.absNorm:ℝ)*(sourceVolume s/(D.absNorm:ℝ))^2*
        Z^(allowance D C Z)*ER))≤
      ‖inactiveWeight C D E‖*(Real.exp M/(a^2/pairNorm s.d))*fixedPresentationCost*K*
        (η.modulus.absNorm:ℝ)/(commonRadical C D).absNorm*Real.sqrt (EL*ER) := by
  have ha' : 0<a^2/pairNorm s.d := div_pos (sq_pos_of_pos ha) (pairNorm_pos s.hd.1 s.hd.2)
  obtain ⟨hl,hr⟩ := block_reference_lower η m A t (sourceColumns s) (aggregate s ha ω₁ ω₂)
    C D hC hD E rows W U K K₀ H₀ A₀ B₀ (a^2/pairNorm s.d) (sourceVolume s) M
    hA hB (fun I hI=>aggregate_lower s ha ω₁ ω₂ I hI) hwin hn
  exact actual_fixed_reference_pair C D hC hD hCD E η ξ₁ ξ₂ F
    K A₀ B₀ (a^2/pairNorm s.d) (sourceVolume s) M Z EL ER
    hK hA hB ha' (sourceVolume_pos s) hZ hEL hER hl hr


/-- Actual finite column data on the two sides of a first Poisson block. -/
structure Frame where
  S : Finset Id
  C : Id
  D : Id
  hC : Supported C
  hD : Supported D
  E : Finset (CommonIndex C D)

namespace Frame
variable (f : Frame)
abbrev e := primeSubsetGenerator (fun P : CommonIndex f.C f.D => P.val) f.E
abbrev r := activeConductor f.C f.D
abbrev ρ := activeRow f.C f.D f.hC
abbrev L := columns f.C f.C f.hC.1 f.S
abbrev T := columns f.C f.D f.hD.1 f.S
abbrev us := divisorPool (Finset.univ : Finset f.T) (fun j => Ideal.span {element f.C f.D f.hD.1 f.S j})
abbrev usSq := f.us.filter (fun u => (UniqueFactorizationMonoid.moebius u : ℂ) ≠ 0)
abbrev P (η : Character) (χ ξ : RayCharacter) := fixedPair η f.C f.D f.hC f.E χ (ξ⁻¹)

/-- The original aggregate stays inside the artificial-divisor restriction on the whole residual. -/
def coeff (c : Id → ℂ) (G u I : Id) := if u ∣ I then c (G*I) else 0

def vec (S : Finset Id) (opp G : Id) (hG : G ≠ 0) (c : Id → ℂ)
    (u : Id) (τ : Character) (t : ℝ) (z : O) (i : columns opp G hG S) :=
  (coeff c G u i * heightCoeff τ t i) * gaussRow _ (element_supported opp G hG S i) z

def matrix (c : Id → ℂ) (Us : Finset Id) (τL τR : Character) (t : ℝ)
    (rows : Finset O) (W : 𝓢(ℝ,ℂ)) (K K₀ H₀ A₀ B₀ : ℝ) : ℂ :=
  ∑ u ∈ Us, (UniqueFactorizationMonoid.moebius u : ℂ) *
    ∑ z ∈ rows, (star (f.ρ z)*f.ρ f.e) * ∑ i : f.L, ∑ j : f.T,
      (vec f.S f.C f.C f.hC.1 c u τL t z i * star (vec f.S f.C f.D f.hD.1 c u τR t (-z) j)) *
      physicalKernel W (fun _ => logAnnulus) f.C f.D f.E K K₀ H₀ A₀ B₀ z i j

private theorem divisor_eq (c : Id → ℂ) (R : Id) (hc : ∀ I, c I ≠ 0 → IsCoprime I R)
    (G u I : Id) (hI : Supported I) (η τ : Character) (ψ : O → ℂ) (ξ : RayCharacter)
    (hτ : ∀ J, Supported J → ∀ t, heightCoeff τ t J =
      rowWeight η fixedBadMask 1 1 t J * (ψ (primaryGenerator J)*rayCharacter ξ (primaryGenerator J)))
    (t : ℝ) :
    divisorCoefficient u (fun J : Id => primaryGenerator J)
      (fun J => coefficient η (fixedBadMask*idealGenerator R) 1 t c G J * ψ (primaryGenerator J)) ξ I =
      coeff c G u I * heightCoeff τ t I := by
  have hm := maskedSource_eq_of_live (idealGenerator R) (fun J => c (G*J)) (by
    intro J hJ
    rw [span_idealGenerator]
    exact (hc _ hJ).of_mul_left_right)
  have hh := divisor_column_masked η τ ψ ξ hτ (idealGenerator R) u I hI (fun J => c (G*J)) t
  rw [hm] at hh
  exact hh

/-- Exact ray and artificial-divisor regrouping of the actual physical block, for any signed
aggregate with its original puncture, before either Cauchy or a norm is applied. -/
theorem actual (c : Id → ℂ) (R : Id) (hc : ∀ I, c I ≠ 0 → IsCoprime I R)
    (η : Character) (t : ℝ) (hCD : CompletedGauss.primeSupport f.C=CompletedGauss.primeSupport f.D)
    (rows : Finset O) (hrows : ∀ z ∈ rows, z ≠ 0)
    (W : 𝓢(ℝ,ℂ)) (K K₀ H₀ A₀ B₀ : ℝ)
    (hK : 0<K) (hK₀ : 0<K₀) (hH₀ : 0<H₀) (hA₀ : 0<A₀) (hB₀ : 0<B₀) :
    block η (fixedBadMask*idealGenerator R) 1 t f.S c f.C f.D f.hC f.hD f.E rows
        W (fun _ => logAnnulus) K K₀ H₀ A₀ B₀ =
      scalar f.C f.D f.hC f.E K A₀ B₀ *
        ∑ χ : RayCharacter, ∑ ξ : RayCharacter, pairCoeff firstPhaseTable χ ξ *
          f.matrix c f.usSq (f.P η χ ξ).left (f.P η χ ξ).right t rows W K K₀ H₀ A₀ B₀ := by
  rw [block_eq_whole η (fixedBadMask*idealGenerator R) 1 t f.S c f.C f.D f.hC f.hD hCD
    f.E rows hrows W (fun _ => logAnnulus) K K₀ H₀ A₀ B₀ hK hK₀ hH₀ hA₀ hB₀]
  apply congrArg (fun w : ℂ => scalar f.C f.D f.hC f.E K A₀ B₀ * w)
  have hh := first_row_children rows (Finset.univ : Finset f.L) (Finset.univ : Finset f.T)
    (element f.C f.C f.hC.1 f.S) (element f.C f.D f.hD.1 f.S)
    (element_supported f.C f.C f.hC.1 f.S) (element_supported f.C f.D f.hD.1 f.S)
    (element_primary f.C f.C f.hC.1 f.S) (element_primary f.C f.D f.hD.1 f.S)
    (fun i => coefficient η (fixedBadMask*idealGenerator R) 1 t c f.C i)
    (fun j => coefficient η (fixedBadMask*idealGenerator R) 1 t c f.D j)
    f.e f.r f.ρ (finiteSexticRow_mul _ _ _) (fun z => star (f.ρ z))
    (fun z i j => physicalKernel W (fun _ => logAnnulus) f.C f.D f.E K K₀ H₀ A₀ B₀ z i j)
  refine Eq.trans ?_ (hh.trans ?_)
  · simp only [physicalKernel,eisEmbedding_norm_sq_eq_absNorm_span,element_span]
    rfl
  · let raw := fun u χ ξ => ∑ z ∈ rows, (star (f.ρ z)*f.ρ f.e) * ∑ i : f.L, ∑ j : f.T,
        (vec f.S f.C f.C f.hC.1 c u (f.P η χ ξ).left t z i *
          star (vec f.S f.C f.D f.hD.1 c u (f.P η χ ξ).right t (-z) j)) *
          physicalKernel W (fun _ => logAnnulus) f.C f.D f.E K K₀ H₀ A₀ B₀ z i j
    have hl (u : Id) (χ ξ : RayCharacter) (i : f.L) := divisor_eq c R hc f.C u i
      (column_supported f.C f.C f.hC.1 f.S i) η (f.P η χ ξ).left _ χ (f.P η χ ξ).left_height t
    have hr (u : Id) (χ ξ : RayCharacter) (j : f.T) := divisor_eq c R hc f.D u j
      (column_supported f.C f.D f.hD.1 f.S j) η (f.P η χ ξ).right _ (ξ⁻¹) (f.P η χ ξ).right_height t
    have hs : (∑ u ∈ f.usSq, (UniqueFactorizationMonoid.moebius u : ℂ) *
        ∑ χ : RayCharacter, ∑ ξ : RayCharacter, pairCoeff firstPhaseTable χ ξ * raw u χ ξ) =
      ∑ u ∈ f.us, (UniqueFactorizationMonoid.moebius u : ℂ) *
        ∑ χ : RayCharacter, ∑ ξ : RayCharacter, pairCoeff firstPhaseTable χ ξ * raw u χ ξ := by
      apply Finset.sum_filter_of_ne
      intro u _ hu
      exact left_ne_zero_of_mul hu
    have hreg := First.summed_projector_regroup f.usSq (1 : ℂ) raw
    simp only [mul_one,one_mul] at hreg
    refine Eq.trans ?_ (hs.symm.trans hreg)
    apply Finset.sum_congr rfl
    intro u hu
    apply congrArg (fun w : ℂ => (UniqueFactorizationMonoid.moebius u : ℂ) * w)
    apply Finset.sum_congr rfl
    intro χ hχ
    apply Finset.sum_congr rfl
    intro ξ hξ
    apply congrArg (fun w : ℂ => pairCoeff firstPhaseTable χ ξ * w)
    apply Finset.sum_congr rfl
    intro z hz
    apply congrArg (fun w : ℂ => (star (f.ρ z)*f.ρ f.e) * w)
    apply Finset.sum_congr rfl
    intro i hi
    apply Finset.sum_congr rfl
    intro j hj
    rw [show divisorCoefficient u (element f.C f.C f.hC.1 f.S)
      (fun i => coefficient η (fixedBadMask*idealGenerator R) 1 t c f.C i *
        leftCoefficient f.e f.r f.ρ (element f.C f.C f.hC.1 f.S i)) χ i = _ from hl u χ ξ i,
      show divisorCoefficient u (element f.C f.D f.hD.1 f.S)
      (fun j => coefficient η (fixedBadMask*idealGenerator R) 1 t c f.D j *
        rightCoefficient f.e f.r f.ρ (element f.C f.D f.hD.1 f.S j)) (ξ⁻¹) j = _ from hr u χ ξ j]
    rfl


def rawEnergy (S : Finset Id) (c : Id → ℂ) (opp G : Id) (hG : Supported G)
    (u : Id) (τ : Character) (v K : ℝ) : ℝ :=
  (gaussEnergy Finset.univ (element opp G hG.1 S) (element_supported opp G hG.1 S)
    (fun i : columns opp G hG.1 S => coeff c G u i * heightCoeff τ v i) ballProfile K).re
/-- The physical left pool uses C where the native summed-side provider writes D.
Equal prime supports give literally equal residual pools and energies. -/
theorem rawEnergy_same_support (S : Finset Id) (c : Id → ℂ) (Q Q' G : Id)
    (hQ : Q≠0) (hQ' : Q'≠0) (hG : Supported G)
    (hs : CompletedGauss.primeSupport Q=CompletedGauss.primeSupport Q')
    (u : Id) (τ : Character) (t K : ℝ) :
    rawEnergy S c Q G hG u τ t K = rawEnergy S c Q' G hG u τ t K := by
  have hp : columns Q G hG.1 S = columns Q' G hG.1 S := by
    ext I
    simp only [columns,Finset.mem_filter]
    constructor
    · rintro ⟨hi,hcop⟩
      exact ⟨hi,(CenteredMomentSecondSectorColumns.coprime_of_same_support Q Q' I hQ hQ'
        (CenteredMomentFirstSectorTransform.residualPool_supported G hG.1 S ⟨I,hi⟩).1 hs).mp hcop⟩
    · rintro ⟨hi,hcop⟩
      exact ⟨hi,(CenteredMomentSecondSectorColumns.coprime_of_same_support Q Q' I hQ hQ'
        (CenteredMomentFirstSectorTransform.residualPool_supported G hG.1 S ⟨I,hi⟩).1 hs).mpr hcop⟩
  let F (T : Finset Id) (hT : ∀ i : T, Supported (Ideal.span {primaryGenerator (i:Id)})) :=
    (gaussEnergy Finset.univ (fun i : T => primaryGenerator (i:Id)) hT
      (fun i : T => coeff c G u i*heightCoeff τ t i) ballProfile K).re
  have shift (T T' : Finset Id) (he : T=T') (hT hT') : F T hT = F T' hT' := by
    subst T'
    rfl
  exact shift _ _ hp _ _

def windowPolynomial (S : Finset Id) (c : Id → ℂ) (opposite G : Id) (hG : G ≠ 0)
    (u : Id) (τ : Character) (right : Bool) (t θ X : ℝ) (z : O) : ℂ :=
  gaussPolynomial Finset.univ (element opposite G hG S)
    (element_supported opposite G hG S)
    (fun I : columns opposite G hG S =>
      coeff c G u I*heightCoeff τ t I*
        windowFactor right logAnnulus (Real.log ((I.val.absNorm:ℝ)/X)) θ) z

theorem window_conj (S : Finset Id) (c : Id → ℂ) (opposite G : Id) (hG : G ≠ 0)
    (u : Id) (τ : Character) (t θ X : ℝ) (z : O) :
    windowPolynomial S c opposite G hG u τ true t θ X z =
      windowPolynomial S c opposite G hG u τ false t (-θ) X z := by
  simp only [windowPolynomial, windowFactor, Bool.false_eq_true, ↓reduceIte,
    star_logAnnulus_column]

theorem finite_window_le_energy (S : Finset Id) (c : Id → ℂ) (opposite G : Id)
    (hG : G ≠ 0) (u : Id) (τ : Character) (right : Bool) (t θ X K : ℝ) (hK : 0 < K)
    (rows : Finset O) (hrows : ∀ z ∈ rows, ‖eisEmbedding z‖^2 ≤ K) :
    (∑ z ∈ rows, ‖windowPolynomial S c opposite G hG u τ right t θ X z‖^2) ≤
      (gaussEnergy Finset.univ (element opposite G hG S)
        (element_supported opposite G hG S)
        (fun I : columns opposite G hG S =>
          coeff c G u I*heightCoeff τ t I*
            windowFactor right logAnnulus (Real.log ((I.val.absNorm:ℝ)/X)) θ)
        ballProfile K).re := by
  have hb := finite_weighted_le_gaussEnergy Finset.univ
    (element opposite G hG S) (element_supported opposite G hG S)
    (fun I : columns opposite G hG S =>
      coeff c G u I*heightCoeff τ t I*
        windowFactor right logAnnulus (Real.log ((I.val.absNorm:ℝ)/X)) θ)
    ballProfile K hK (fun z => ballProfile_nonneg _) rows
  have hm (z : O) (hz : z ∈ rows) : ballProfile (‖eisEmbedding z‖^2/K) = 1 :=
    ballProfile_one _ (div_nonneg (sq_nonneg _) hK.le) ((div_le_one hK).mpr (hrows z hz))
  have heq : (∑ z ∈ rows, ‖windowPolynomial S c opposite G hG u τ right t θ X z‖^2) =
      ∑ z ∈ rows, ‖windowPolynomial S c opposite G hG u τ right t θ X z‖^2*
        (ballProfile (‖eisEmbedding z‖^2/K)).re := by
    apply Finset.sum_congr rfl
    intro z hz
    rw [hm z hz, Complex.one_re, mul_one]
  rw [heq]
  exact hb

/-- The summed window bound: a bound on `∑_u` of the raw height energies bounds `∑_u ∑_z`
of the (ordinary) window polynomials on the `K`-ball rows. -/
theorem summed_window_bound (S : Finset Id) (c : Id → ℂ) (opposite G : Id) (hG : Supported G)
    (Us : Finset Id) (τ : Character) (t θ X K : ℝ) (hX : 0 < X) (hK : 0 < K)
    (rows : Finset O) (hrows : ∀ z ∈ rows, ‖eisEmbedding z‖^2 ≤ K)
    (J : ℕ) (E : ℝ) (hE : 0 ≤ E)
    (hraw : ∀ v : ℝ, ∑ u ∈ Us, rawEnergy S c opposite G hG u τ v K ≤ E*(1+‖v‖)^(2*J)) :
    (∑ u ∈ Us, ∑ z ∈ rows, ‖windowPolynomial S c opposite G hG.1 u τ false t θ X z‖^2) ≤
      (windowBudget J t E*(1+‖θ‖)^J)^2 := by
  have he := First.summed_window_energy_from_height logAnnulus logAnnulus_compact logAnnulus_smooth
    J Us Finset.univ (element opposite G hG.1 S)
    (element_supported opposite G hG.1 S)
    (fun u (I : columns opposite G hG.1 S) => coeff c G u I)
    τ t θ X hX ballProfile K hK (fun z => ballProfile_nonneg _) E hE
    (fun v => by simpa only [rawEnergy, element_span] using hraw v)
  have he' : (∑ u ∈ Us, (gaussEnergy Finset.univ (element opposite G hG.1 S)
        (element_supported opposite G hG.1 S)
        (fun I : columns opposite G hG.1 S =>
          coeff c G u I*heightCoeff τ t I*
            windowFactor false logAnnulus (Real.log ((I.val.absNorm:ℝ)/X)) θ)
        ballProfile K).re) ≤ (E*heightCost t θ^(2*J))*profileMoment J^2 := by
    simpa only [windowFactor, Bool.false_eq_true, ↓reduceIte, element_span, profileMoment] using he
  calc
    _ ≤ ∑ u ∈ Us, (gaussEnergy Finset.univ (element opposite G hG.1 S)
        (element_supported opposite G hG.1 S)
        (fun I : columns opposite G hG.1 S =>
          coeff c G u I*heightCoeff τ t I*
            windowFactor false logAnnulus (Real.log ((I.val.absNorm:ℝ)/X)) θ)
        ballProfile K).re :=
      Finset.sum_le_sum (fun u _ =>
        finite_window_le_energy S c opposite G hG.1 u τ false t θ X K hK rows hrows)
    _ ≤ _ := he'
    _ ≤ _ := shifted_window_budget J t θ E hE


private theorem left_identity (S : Finset Id) (c : Id → ℂ) (opp G : Id) (hG : G ≠ 0)
    (u : Id) (τ : Character) (t θ X : ℝ) (z : O) :
    leftColumn Finset.univ (vec S opp G hG c u τ t z) logAnnulus
        (fun i : columns opp G hG S => Real.log ((i.val.absNorm:ℝ)/X)) θ =
      windowPolynomial S c opp G hG u τ false t θ X z := by
  unfold leftColumn vec windowPolynomial gaussPolynomial
  apply Finset.sum_congr rfl
  intro i hi
  simp only [windowFactor,Bool.false_eq_true,↓reduceIte]
  ring

private theorem right_identity (S : Finset Id) (c : Id → ℂ) (opp G : Id) (hG : G ≠ 0)
    (u : Id) (τ : Character) (t θ X : ℝ) (z : O) :
    rightColumn Finset.univ (vec S opp G hG c u τ t (-z)) logAnnulus
        (fun i : columns opp G hG S => Real.log ((i.val.absNorm:ℝ)/X)) θ =
      star (windowPolynomial S c opp G hG u τ true t θ X (-z)) := by
  unfold rightColumn vec windowPolynomial gaussPolynomial
  rw [star_sum]
  apply Finset.sum_congr rfl
  intro i hi
  simp only [windowFactor,↓reduceIte,star_mul,star_star]
  ring
theorem summed_paired_column_bound (S : Finset Id) (c : Id → ℂ)
    (C D : Id) (hC : Supported C) (hD : Supported D) (Us : Finset Id) (τL τR : Character)
    (t θ A₀ B₀ KL KR : ℝ) (hA₀ : 0 < A₀) (hB₀ : 0 < B₀) (hKL : 0 < KL) (hKR : 0 < KR)
    (rows : Finset O) (hrowsL : ∀ z ∈ rows, ‖eisEmbedding z‖^2 ≤ KL)
    (hrowsR : ∀ z ∈ rows, ‖eisEmbedding z‖^2 ≤ KR)
    (J : ℕ) (EL ER : ℝ) (hEL : 0 ≤ EL) (hER : 0 ≤ ER)
    (hleft : ∀ v : ℝ, ∑ u ∈ Us, rawEnergy S c C C hC u τL v KL ≤ EL*(1+‖v‖)^(2*J))
    (hright : ∀ v : ℝ, ∑ u ∈ Us, rawEnergy S c C D hD u τR v KR ≤ ER*(1+‖v‖)^(2*J)) :
    Real.sqrt (∑ k ∈ Us ×ˢ rows, ‖leftColumn Finset.univ
      (vec S C C hC.1 c k.1 τL t k.2) logAnnulus
      (fun I : columns C C hC.1 S => Real.log ((I.val.absNorm:ℝ)/A₀)) θ‖^2)*
    Real.sqrt (∑ k ∈ Us ×ˢ rows, ‖rightColumn Finset.univ
      (vec S C D hD.1 c k.1 τR t (-k.2)) logAnnulus
      (fun I : columns C D hD.1 S => Real.log ((I.val.absNorm:ℝ)/B₀)) θ‖^2) ≤
      (windowBudget J t EL*windowBudget J t ER)*(1+‖θ‖)^(2*J) := by
  simp only [left_identity,right_identity,norm_star,window_conj,Finset.sum_product]
  have hl := summed_window_bound S c C C hC Us τL t θ A₀ KL hA₀ hKL rows hrowsL J EL hEL hleft
  have hneg : ∀ z ∈ rows.image Neg.neg, ‖eisEmbedding z‖^2 ≤ KR := by
    intro z hz
    obtain ⟨y,hy,rfl⟩ := Finset.mem_image.mp hz
    simpa only [map_neg,norm_neg] using hrowsR y hy
  have hr := summed_window_bound S c C D hD Us τR t (-θ) B₀ KR hB₀ hKR (rows.image Neg.neg) hneg
    J ER hER hright
  simp only [norm_neg,Finset.sum_image (fun x _ y _ h => neg_injective h)] at hr
  have hLp : 0 ≤ windowBudget J t EL*(1+‖θ‖)^J :=
    mul_nonneg (windowBudget_nonneg _ _ _) (pow_nonneg (by positivity) _)
  have hRp : 0 ≤ windowBudget J t ER*(1+‖θ‖)^J :=
    mul_nonneg (windowBudget_nonneg _ _ _) (pow_nonneg (by positivity) _)
  have hLs := Real.sqrt_le_iff.mpr ⟨hLp, hl⟩
  have hRs := Real.sqrt_le_iff.mpr ⟨hRp, hr⟩
  apply (mul_le_mul hLs hRs (Real.sqrt_nonneg _) hLp).trans_eq
  rw [show 2*J = J*2 by omega, pow_mul]
  ring


/-- The balanced coefficient-generic first kernel. Both sums of physical raw Gauss energies
are taken over the same artificial divisors, and the kernel constant precedes their choice. -/
theorem balanced (W : 𝓢(ℝ,ℂ)) (J : ℕ) :
    ∃ Ckernel : ℝ, 0 ≤ Ckernel ∧ ∀ (f : Frame) (c : Id → ℂ) (Us : Finset Id)
      (τL τR : Character) (t K K₀ H₀ A₀ B₀ KL KR : ℝ),
      0<K₀ → 0<H₀ → 0<A₀ → 0<B₀ → 0<KL → 0<KR →
      ∀ (rows : Finset O), (∀ z ∈ rows, ‖eisEmbedding z‖^2 ≤ KL) →
      (∀ z ∈ rows, ‖eisEmbedding z‖^2 ≤ KR) →
      ∀ (EL ER : ℝ), 0≤EL → 0≤ER →
      (∀ v : ℝ, ∑ u ∈ Us, rawEnergy f.S c f.C f.C f.hC u τL v KL ≤ EL*(1+‖v‖)^(2*J)) →
      (∀ v : ℝ, ∑ u ∈ Us, rawEnergy f.S c f.C f.D f.hD u τR v KR ≤ ER*(1+‖v‖)^(2*J)) →
      ‖f.matrix c Us τL τR t rows W K K₀ H₀ A₀ B₀‖ ≤
        Ckernel*(windowBudget J t EL*windowBudget J t ER) := by
  obtain ⟨Ckernel,hCkernel,hkernel⟩ := whole_kernel_row_estimate W (fun _ => logAnnulus)
    (fun _ => Real.log 4) (fun _ => Real.log_nonneg (by norm_num))
    (fun _ y hy => logAnnulus_enclosure y hy) 0 (2*J)
  refine ⟨Ckernel,hCkernel,?_⟩
  intro f c Us τL τR t K K₀ H₀ A₀ B₀ KL KR hK₀ hH₀ hA₀ hB₀ hKL hKR rows hrowsL hrowsR EL ER hEL hER hl hr
  have he := hkernel (K₀*H₀/(A₀*B₀)) (div_pos (mul_pos hK₀ hH₀) (mul_pos hA₀ hB₀))
    (Us ×ˢ rows) Finset.univ Finset.univ
    (fun k : Id × O => vec f.S f.C f.C f.hC.1 c k.1 τL t k.2)
    (fun k : Id × O => vec f.S f.C f.D f.hD.1 c k.1 τR t (-k.2))
    (fun i : f.L => Real.log ((i.val.absNorm:ℝ)/A₀))
    (fun j : f.T => Real.log ((j.val.absNorm:ℝ)/B₀))
    (fun _ : Id × O => Real.log (((K/‖eisEmbedding f.e‖^2)/‖eisEmbedding f.r‖^2)/K₀))
    (fun k : Id × O => Real.log (‖eisEmbedding k.2‖^2/H₀))
    (fun k : Id × O => (UniqueFactorizationMonoid.moebius k.1 : ℂ)*(star (f.ρ k.2)*f.ρ f.e))
    (fun k _ => by
      simp only [norm_mul,norm_star]
      have ha : ∀ z, ‖f.ρ z‖ ≤ 1 := fun z => QuadraticInitialBound.finiteSexticRow_norm_le_one _ _ _ z
      exact (mul_le_mul (QuadraticInitialBound.norm_ideal_moebius_le_one k.1)
        (mul_le_mul (ha _) (ha _) (norm_nonneg _) zero_le_one) (by positivity) zero_le_one).trans_eq
        (by norm_num))
    (fun k _ => logAnnulus_norm _) (fun k _ => logAnnulus_norm _)
    (windowBudget J t EL*windowBudget J t ER) (mul_nonneg (windowBudget_nonneg _ _ _) (windowBudget_nonneg _ _ _))
    (fun θ => summed_paired_column_bound f.S c f.C f.D f.hC f.hD Us τL τR t θ A₀ B₀ KL KR
      hA₀ hB₀ hKL hKR rows hrowsL hrowsR J EL ER hEL hER hl hr)
  rw [pow_zero,one_mul] at he
  refine le_of_eq_of_le ?_ he
  congr 1
  simp only [matrix, physicalKernel, Finset.sum_product, Finset.mul_sum]
  refine Finset.sum_congr rfl (fun u _ => Finset.sum_congr rfl (fun z _ =>
    Finset.sum_congr rfl (fun i _ => Finset.sum_congr rfl (fun j _ => ?_))))
  ring

end Frame

/-- Balanced first-block implication on the genuine two-ray source. The two side budgets may
depend on both canonical auxiliary rays. The only projector loss is the native 256.

The last two hypotheses are the outputs required from the decorated counterpart of the
tracker's Ordinary/Second/Provider.blockData_bounds. In the equal-radius retained block the
two right sides use Second.Concrete.balancedBudget with (C,D) and (D,C), respectively.
Ordinary/Second/Provider.BlockData specifies the four height-uniform diagonal/label bounds,
the allocation widths and multiplicities, and both sums of budgets needed upstream. -/
theorem physical_block {ι : Type*} [Fintype ι] {a b : ℝ} (W : 𝓢(ℝ,ℂ)) (J : ℕ) :
    ∃ Ckernel : ℝ, 0≤Ckernel ∧ ∀ (s : Source ι a b) (ha : 0<a) (ω₁ ω₂ : Id →* ℂ)
      (η : Character) (t : ℝ) (C D : Id) (hC : Supported C) (hD : Supported D),
      CompletedGauss.primeSupport C=CompletedGauss.primeSupport D →
      ∀ (E : Finset (CommonIndex C D)) (rows : Finset O), (∀ z ∈ rows, z ≠ 0) →
      ∀ (K K₀ H₀ A₀ B₀ KL KR : ℝ), 0<K → 0<K₀ → 0<H₀ → 0<A₀ → 0<B₀ → 0<KL → 0<KR →
      (∀ z ∈ rows, ‖eisEmbedding z‖^2 ≤ KL) → (∀ z ∈ rows, ‖eisEmbedding z‖^2 ≤ KR) →
      let f : Frame := ⟨sourceColumns s,C,D,hC,hD,E⟩
      let c := aggregate s ha ω₁ ω₂
      ∀ (B : ℝ) (EL ER : RayCharacter → RayCharacter → ℝ),
      (∀ χ ξ, 0≤EL χ ξ) → (∀ χ ξ, 0≤ER χ ξ) →
      (∀ χ ξ, windowBudget J t (EL χ ξ)*windowBudget J t (ER χ ξ) ≤ B) →
      (∀ χ ξ v, ∑ u ∈ Second.Concrete.concreteArtificial s C D hD.1,
        Frame.rawEnergy f.S c D C hC u (f.P η χ ξ).left v KL ≤ EL χ ξ*(1+‖v‖)^(2*J)) →
      (∀ χ ξ v, ∑ u ∈ Second.Concrete.concreteArtificial s C D hD.1,
        Frame.rawEnergy f.S c C D hD u (f.P η χ ξ).right v KR ≤ ER χ ξ*(1+‖v‖)^(2*J)) →
      ‖block η (fixedBadMask*idealGenerator s.R) 1 t f.S c C D hC hD E rows
        W (fun _ => logAnnulus) K K₀ H₀ A₀ B₀‖ ≤
        ‖scalar C D hC E K A₀ B₀‖*(256*(Ckernel*B)) := by
  obtain ⟨Ckernel,hCkernel,hs⟩ := Frame.balanced W J
  refine ⟨Ckernel,hCkernel,?_⟩
  intro s ha ω₁ ω₂ η t C D hC hD hCD E rows hz K K₀ H₀ A₀ B₀ KL KR hK hK₀ hH₀ hA₀ hB₀ hKL hKR
    hrowsL hrowsR f c B EL ER hEL hER hprod hl hr
  have hact := f.actual c s.R (aggregate_coprime s ha ω₁ ω₂) η t hCD rows hz W K K₀ H₀ A₀ B₀
    hK hK₀ hH₀ hA₀ hB₀
  rw [hact,norm_mul]
  apply mul_le_mul_of_nonneg_left _ (norm_nonneg _)
  have hproj := First.summed_ray_projector 1 (Ckernel*B) zero_le_one
    (fun χ ξ => f.matrix c f.usSq (f.P η χ ξ).left (f.P η χ ξ).right t rows W K K₀ H₀ A₀ B₀)
    (fun χ ξ => by
      have hleft (v : ℝ) : ∑ u ∈ f.usSq,
          Frame.rawEnergy f.S c f.C f.C f.hC u (f.P η χ ξ).left v KL ≤ EL χ ξ*(1+‖v‖)^(2*J) := by
        simpa only [Frame.rawEnergy_same_support f.S c f.C f.D f.C f.hC.1 f.hD.1 f.hC hCD] using
          (show ∑ u ∈ f.usSq, Frame.rawEnergy f.S c f.D f.C f.hC u (f.P η χ ξ).left v KL ≤ _ from hl χ ξ v)
      rw [one_mul]
      exact (hs f c f.usSq _ _ t K K₀ H₀ A₀ B₀ KL KR hK₀ hH₀ hA₀ hB₀ hKL hKR rows hrowsL hrowsR
        _ _ (hEL χ ξ) (hER χ ξ) hleft (hr χ ξ)).trans
        (mul_le_mul_of_nonneg_left (hprod χ ξ) hCkernel))
  simpa only [one_mul] using hproj

#print axioms aggregate_coprime
#print axioms aggregate_lower
#print axioms physical_reference_pair
#print axioms Frame.actual
#print axioms Frame.balanced
#print axioms physical_block

end
end ContinuumLocalReturn.AsymmetricRayFirst
