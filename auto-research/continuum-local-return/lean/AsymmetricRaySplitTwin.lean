/- Adapted from Sil's cube-free packet and concrete label assembly, copyright 2026 Sil,
   Apache-2.0. Written with OpenAI Codex assistance. The analytic application assumes the
   preprint's 7/8 theorem. -/
import AsymmetricRaySplitDefs
import Submissions.sil_density_split_20261026.CubeFree.Second.ConcreteLabelAssembly12

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 1000000
set_option linter.unusedVariables false

namespace ContinuumLocalReturn.AsymmetricRaySplit
open Candidate.FourthPower QRH.SilDensitySplit.CubeFree.FP QRH.SilDensitySplit.CubeFree.Packet.Reduce
open QRH.SilDensitySplit.CubeFree.Packet QRH.SilDensitySplit.CubeFree.Packet.Grouped
open QRH.SilDensitySplit.CubeFree.Second.ConcreteFrame

noncomputable section
open scoped Classical BigOperators SchwartzMap ContDiff
open Filter OAI OAI.SevenEighths HeckeFamily CanonicalQuadraticSieve ConcreteTraceCRT
open QRH.Record1252270103TwoIdeal QRH.Record1252270103KernelMass
open KernelAssignmentReindex KernelNaturalSlots ReferencePrimeEnclosure MixedCompletedRows
open NativeFiniteHoles NativeInjectiveEnergy
open MixedCenteredEnergy MixedLiveRows MixedLiveNormalization MixedCanonicalSource
open MixedCommonCoefficient MixedCommonRestriction MixedLiteralAllocation
open MixedCommonSource MixedOriginalSource MixedRestrictedDictionary MixedHeightEnergy
open CenteredMomentOriginalRadialComparison CenteredMomentAllocatedNaturalRadial
open CenteredMomentEnergyCapacityRemoval CenteredMomentNaturalFixedRaySource
open CenteredMomentPrimeSlot (primePool)
open CenteredMomentInductionEnergy CenteredMomentCommonMaskEnergy
open CenteredMomentNaturalRowSource CenteredMomentFiniteProfileExceptional
open CenteredMomentRayMaskedFloor HeckeDyadic CenteredMomentCommonProfile
open CenteredMomentSourceLiveColumn CenteredMomentAddedZeroUniform CenteredMomentSourceProfileMass
open CenteredMomentFirstSectors CenteredMomentSourceRectangle CenteredMomentSourceMass
open CenteredMomentRestrictedSource CenteredMomentHeckeColumnWindow
open CenteredMomentSecondNonexceptionalChosenBlock CenteredMomentSecondHeightFamily
open CenteredMomentSecondExceptionalFamily CenteredMomentFirstAmplificationChoice
open CenteredMomentSectorLocalization CenteredMomentCanonicalFirst CenteredMomentSourceRow
open CanonicalRowCompletion CompletedGauss RayFourExpansion CenteredMomentFirstPhysicalSource
open CenteredMomentSecondCanonicalNonunit CenteredMomentChildRows CenteredMomentRestrictedEnergy
open CenteredMomentRowNorm MixedPrincipalPair MixedPrincipalWindow MixedPrincipalAllocations
open QRH.SilDensitySplit.CubeFree QRH.SilDensitySplit.CubeFree.Second.ConcreteLabelAssembly
open FP.MixedPrincipalPair FP.MixedPrincipalWindow FP.MixedPrincipalAllocations
open CenteredMomentLattice CenteredMomentSecondIdealBlockBound CenteredMomentHeckeSlots
open CenteredMomentSecondPhysicalBlock CenteredMomentSecondCanonical
open QRH.SilDensitySplit.CubeFree.Second.Concrete QRH.SilDensitySplit.CubeFree.Second.ConcreteGroup
open AsymmetricRayLabel AsymmetricRayColumn
local notation "O" => HeckeFamily.O
local notation "Id" => Ideal O
variable (ω₁ ω₂ : Id →* ℂ)
variable {L : ℝ} {θ : GData L} {mesh Z : ℝ}

theorem rayColumn_coprime {α : Type*} [Fintype α] (S H : Finset PrimeIdeal)
    (pool : α → Finset Id) (d : Id × Id) (hd : d.1 ≠ 0 ∧ d.2 ≠ 0) (R seed : Id)
    (ν : α → Id → ℂ) (Wslot : α → ℝ → ℂ) (P : α → ℝ) (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ)
    (J : Id) (h : rayColumn (rayWeight ω₁ ω₂) S H pool d hd R seed ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ J ≠ 0) :
    IsCoprime J R := by
  unfold rayColumn finiteColumnCoefficient at h
  obtain ⟨v, hv, hne⟩ := Finset.exists_ne_zero_of_sum_ne_zero h
  have hvJ := (Finset.mem_filter.mp hv).2
  by_contra hc
  apply hne
  unfold profileCoefficient
  rw [hvJ, ite_eq_right hc]
  ring

theorem ray_zeroPrimes_side {η : Character} (P : SidePack η) {α : Type*} [Fintype α]
    (S H : Finset PrimeIdeal)
    (pool : α → Finset Id) (d : Id × Id) (hd : d.1 ≠ 0 ∧ d.2 ≠ 0) (R seed : Id)
    (ν : α → Id → ℂ) (Wslot : α → ℝ → ℂ) (Pw : α → ℝ) (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ)
    (G : Id) (hCR : P.Cs ∣ R) (I : Id)
    (h : rayColumn (rayWeight ω₁ ω₂) S H pool d hd R seed ν Wslot Pw W₁ W₂ b X₁ X₂ Y₁ Y₂ (G * I) ≠ 0) :
    IsCoprime I P.Z₀ := by
  have h1 := rayColumn_coprime ω₁ ω₂ S H pool d hd R seed ν Wslot Pw W₁ W₂ b X₁ X₂ Y₁ Y₂ _ h
  exact P.zcop I ((h1.of_isCoprime_of_dvd_right hCR).of_mul_left_right)

theorem rayLabel_congr (M : Ideal O) [NeZero M] (Hray : Subgroup (O ⧸ M)ˣ)
    (hHray : RayOrthogonality.globalUnits M ≤ Hray) {α : Type*} [Fintype α] (W : ℝ → ℂ)
    (η₀ : Character) (θ : α → RayQuotient.Characters M Hray) (Z : ℝ) (w σ freq : α → ℝ)
    (t : ℝ) (R₀ : α → Finset (Ideal O)) (τ τ' : Character) (Q : Ideal O) (n : Fin 4 → ℤ)
    (Cap Lcap : ℝ) (R G : Ideal O) (hG : G ≠ 0) (seed D : Ideal O) (H : Finset PrimeIdeal)
    (W₁ W₂ : ℝ → ℂ) (t₁ t₂ b X₁ X₂ Y₁ Y₂ : ℝ) (d : Ideal O × Ideal O) (hd : d.1 ≠ 0 ∧ d.2 ≠ 0)
    (v : ℝ) (wm : O) (hwm : wm ≠ 0)
    (hcoef : ∀ I : Ideal O, Supported I → IsCoprime I (Ideal.span {wm}) →
      idealCoeff τ I = idealCoeff τ' I)
    (hcol : ∀ I : Ideal O, Supported I → IsCoprime G I → D ∣ I →
      rayColumn (rayWeight ω₁ ω₂) (enclosure (Cap*Z^Lcap)) H
        (fun i => supportedPool (primePool M Hray 2 (Z^(w i)))) d hd R seed
        (slotCoefficient (fun i => relativeCharacter M Hray hHray η₀ (θ i)) R₀ t)
        (fun i => slotProfile W (σ i) (freq i)) (fun i => Z^(w i))
        (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂ Y₁ Y₂ (G*I) ≠ 0 →
      IsCoprime I (Ideal.span {wm})) :
    rayLabel ω₁ ω₂ M Hray hHray W η₀ θ Z w σ freq t R₀ τ Q n Cap Lcap R G hG seed D H
        W₁ W₂ t₁ t₂ b X₁ X₂ Y₁ Y₂ d hd v =
      rayLabel ω₁ ω₂ M Hray hHray W η₀ θ Z w σ freq t R₀ τ' Q n Cap Lcap R G hG seed D H
        W₁ W₂ t₁ t₂ b X₁ X₂ Y₁ Y₂ d hd v := by
  unfold rayLabel sourceRestrictedEnergy
  rw [keep_congr τ τ' Q n wm hwm hcoef]
  congr 1
  funext I
  have hs : Supported (I : Ideal O) := (Finset.mem_filter.mp I.property).2
  beta_reduce
  by_cases hc : IsCoprime G (I : Ideal O) ∧ D ∣ (I : Ideal O)
  · rw [ite_eq_left hc]
    by_cases h0 : rayColumn (rayWeight ω₁ ω₂) (enclosure (Cap*Z^Lcap)) H
        (fun i => supportedPool (primePool M Hray 2 (Z^(w i)))) d hd R seed
        (slotCoefficient (fun i => relativeCharacter M Hray hHray η₀ (θ i)) R₀ t)
        (fun i => slotProfile W (σ i) (freq i)) (fun i => Z^(w i))
        (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂ Y₁ Y₂ (G*I) = 0
    · rw [h0, zero_mul, zero_mul]
    · unfold heightCoeff
      rw [hcoef I hs (hcol I hs hc.1 hc.2 h0)]
  · rw [ite_eq_right hc, zero_mul, zero_mul]

theorem rayLabel_packed_col {η : Character} (P : SidePack η)
    (ξ : RayCharacter) {C₂ D₂ : Ideal O} {hC₂ : Supported C₂} {hD₂ : Supported D₂}
    {U : Finset (CommonIndex C₂ D₂)} {τ : RayCharacter → Character}
    (hfam : Family (childCharacter P.base ξ) C₂ D₂ hC₂ hD₂ U τ) (χ : RayCharacter)
    (G : Ideal O) (hGs : Supported G) (hGc : ∀ I, IsCoprime G I → IsCoprime C₂ I ∨ IsCoprime D₂ I)
    (M : Ideal O) [NeZero M] (Hray : Subgroup (O ⧸ M)ˣ)
    (hHray : RayOrthogonality.globalUnits M ≤ Hray) {α : Type*} [Fintype α] (W : ℝ → ℂ)
    (η₀ : Character) (θs : α → RayQuotient.Characters M Hray) (w σ freq : α → ℝ)
    (t : ℝ) (R₀ : α → Finset (Ideal O)) (Q : Ideal O) (n : Fin 4 → ℤ)
    (Cap Lcap : ℝ) (R : Ideal O) (hG : G ≠ 0) (seed D' : Ideal O) (H : Finset PrimeIdeal)
    (W₁ W₂ : ℝ → ℂ) (t₁ t₂ b X₁ X₂ Y₁ Y₂ : ℝ) (d : Ideal O × Ideal O) (hd : d.1 ≠ 0 ∧ d.2 ≠ 0)
    (v : ℝ) (hCR : P.Cs ∣ R) :
    rayLabel ω₁ ω₂ M Hray hHray W η₀ θs Z w σ freq t R₀ (τ χ) Q n Cap Lcap R G hG seed D' H
        W₁ W₂ t₁ t₂ b X₁ X₂ Y₁ Y₂ d hd v =
      rayLabel ω₁ ω₂ M Hray hHray W η₀ θs Z w σ freq t R₀
        (packedChar η (P.j₀ * ξ * χ) (P.V * secondTwist C₂ D₂ U)) Q n Cap Lcap R G hG
        seed D' H W₁ W₂ t₁ t₂ b X₁ X₂ Y₁ Y₂ d hd v := by
  have hV : P.V * secondTwist C₂ D₂ U ≠ 0 :=
    mul_ne_zero P.hV (secondTwist_ne_zero C₂ D₂ hC₂ U)
  apply rayLabel_congr ω₁ ω₂ M Hray hHray W η₀ θs Z w σ freq t R₀ _ _ Q n Cap Lcap R G hG seed D' H
    W₁ W₂ t₁ t₂ b X₁ X₂ Y₁ Y₂ d hd v (packMask P.Z₀ G)
    (packMask_ne_zero _ _ P.hZ₀ hGs)
  · intro I hI hw
    obtain ⟨hz, hc⟩ := packMask_coprime _ _ I hw
    have h1 := second_packed_side P ξ hfam χ I hI hz (hGc I hc) 0
    rw [Packet.heightCoeff_zero, Packet.heightCoeff_zero] at h1
    rw [h1, packedChar_coef η _ _ hV I hI]
  · intro I _ hc _ h0
    have hz := ray_zeroPrimes_side ω₁ ω₂ P _ H _ d hd R seed _ _ _ _ _ b X₁ X₂ Y₁ Y₂ G hCR I h0
    rw [packMask, ConcretePrimeRowBridge.span_idealGenerator]
    exact IsCoprime.mul_right hz hc.symm

#print axioms rayLabel_congr
#print axioms rayLabel_packed_col
end
end ContinuumLocalReturn.AsymmetricRaySplit
