/- Adapted from Sil, MixedHeightEnergy.lean and Packet/Reduce/Label.lean,
   copyright 2026 Sil, Apache-2.0. Written with assistance from OpenAI Codex.
   This file transports a tuple weight without moving it outside a column sum. -/
import Submissions.sil_density_split_20261026.CubeFree.Packet.Reduce.Label
import AsymmetricRayColumn

/-!
`packed_height_energy` identifies the normalized physical source with its ray-decorated packed
radial energy. The tuple multiplier is arbitrary there. For a product of two independent
bounded multiplicative ordinary weights, `common_reduction_single` and
`divisor_reduction_single` select one genuine allocation and one artificial squarefree
divisor allocation at respective costs `Cδ (NG)^δ` and `Cδ (ND)^δ`. The frozen coefficient
and the signed artificial allocation stay inside the selected radial energy.

The output is Sil's live allocated source. `divisor_child_price` rewrites it using the
actual surviving marked subset and both individual extracted ordinary prefixes, and obtains
the full inverse norm of G from a short-source energy bound. The remaining analytic step
prices the latter decorated source with the inverse norm of D and converts its punctured
sums to componentwise shortened canonical leaves. `allocated_price_transfer` composes the
proved selections and normalization into one implication with the complete G,D mass.
-/

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 1000000

namespace ContinuumLocalReturn.AsymmetricRayLabel
open QRH.SilDensitySplit.CubeFree
open QRH.SilDensitySplit.CubeFree.Packet.Reduce
open Candidate.FourthPower QRH.SilDensitySplit.CubeFree.FP

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
open CenteredMomentDetectorEnergyInitialState CenteredMomentEnergyChildState
open CenteredMomentEnergyReferenceChild CenteredMomentEnergySlotHeight
open CenteredMomentEnergyAllocatedChildren CenteredMomentLattice CenteredMomentTwist
open CenteredMomentSecondPhysicalBlock CenteredMomentSecondCanonical
open CenteredMomentSecondExceptionalFamily CenteredMomentFirstAmplificationChoice
open CenteredMomentSectorLocalization CenteredMomentCanonicalFirst
open CenteredMomentRetainedEnergy CenteredMomentHeckeSlots CenteredMomentHeckeExpansion
local notation "O" => HeckeFamily.O
local notation "Id" => Ideal O

local instance {β : Type*} : DecidableEq (β⊕Fin 2) := Classical.decEq _
open MixedCommonHeights
variable {α : Type*} [Fintype α]

def rayMaskedRow (decor : Tuple α → ℂ) (χ : Character) (S H : Finset PrimeIdeal) (pool : α→Finset Id)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (G R seed D : Id) (hG : G≠0)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) : ℂ :=
  normalization (X₁*X₂) P*
    ∑I∈residualPool G hG (finiteColumns (Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂))),
      (if IsCoprime G I ∧ D∣I then finiteColumnCoefficient
        (Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂))
        (fun v=>(decor v * tupleWeight (punctureProduct S H) v)*profileCoefficient R ν Wslot P W₁ W₂
          X₁ X₂ Y₁ Y₂ d.1 d.2 seed v) (G*I) else 0)*idealCoeff χ I

/-- The actual original finite column coefficient, before common
extraction. In particular tupleWeight stays inside its finite sum. -/
def rayColumn (decor : Tuple α → ℂ) (S H : Finset PrimeIdeal) (pool : α→Finset Id)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (R seed : Id)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) : Id→ℂ :=
  finiteColumnCoefficient (Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂))
    (fun u=>(decor u * tupleWeight (punctureProduct S H) u)*
      profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 seed u)

/-- Exact independent-height absorption, retaining the residual phase
and both original prefix norms. Neither squarefreeness nor seed|G is
needed: those enter the analytic estimate after this identity. -/
theorem masked_height_row (decor : Tuple α → ℂ) (χ : Character) (v : ℝ)
    (S H : Finset PrimeIdeal) (pool : α→Finset Id) (hp : ∀i,∀I∈pool i,Prime I)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (G R seed D : Id) (hG : G≠0)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (t₁ t₂ b X₁ X₂ Y₁ Y₂ : ℝ)
    (hX₁ : 0<X₁) (hX₂ : 0<X₂) (hY₁ : 0<Y₁) (hY₂ : 0<Y₂)
    (hXY : X₁*X₂=Y₁*Y₂) :
    normalization (X₁*X₂) P*
      (∑I∈residualPool G hG (finiteColumns (Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂))),
        (if IsCoprime G I ∧ D∣I then
          rayColumn decor S H pool d hd R seed ν Wslot P (phaseProfile W₁ t₁) (phaseProfile W₂ t₂)
            b X₁ X₂ Y₁ Y₂ (G*I) else 0)*idealCoeff χ I*(I.absNorm:ℂ)^(Complex.I*v))=
      residualPhase (X₁*X₂) d G v*
        rayMaskedRow decor χ S H pool d hd G R seed D hG
          (fun i=>heightCoefficient (ν i) v) Wslot P
          (phaseProfile W₁ (t₁+v/(2*Real.pi))) (phaseProfile W₂ (t₂+v/(2*Real.pi)))
          b X₁ X₂ Y₁ Y₂ := by
  let Q := Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂)
  have hQ : ∀u∈Q,∀j,u j≠0 := by
    intro u hu j
    exact source_pools_nonzero pool hp d hd b X₁ X₂ Y₁ Y₂ j _ (Fintype.mem_piFinset.mp hu j)
  have hcol (I : Id) :
      rayColumn decor S H pool d hd R seed ν Wslot P (phaseProfile W₁ t₁) (phaseProfile W₂ t₂)
          b X₁ X₂ Y₁ Y₂ (G*I)*(I.absNorm:ℂ)^(Complex.I*v)=
        residualPhase (X₁*X₂) d G v*
          rayColumn decor S H pool d hd R seed (fun i=>heightCoefficient (ν i) v) Wslot P
            (phaseProfile W₁ (t₁+v/(2*Real.pi))) (phaseProfile W₂ (t₂+v/(2*Real.pi)))
            b X₁ X₂ Y₁ Y₂ (G*I) := by
    simpa only [Q,rayColumn,idealHeight,MonoidHom.coe_mk,OneHom.coe_mk,heightPhase,
      Complex.ofReal_natCast] using
      residual_column_height Q hQ (fun u => decor u * tupleWeight (punctureProduct S H) u) R seed G hG ν Wslot P
        W₁ W₂ t₁ t₂ v X₁ X₂ Y₁ Y₂ hX₁ hX₂ hY₁ hY₂ hXY d hd I
  have hterm (I : Id) :
      (if IsCoprime G I ∧ D∣I then
        rayColumn decor S H pool d hd R seed ν Wslot P (phaseProfile W₁ t₁) (phaseProfile W₂ t₂)
          b X₁ X₂ Y₁ Y₂ (G*I) else 0)*idealCoeff χ I*(I.absNorm:ℂ)^(Complex.I*v)=
      residualPhase (X₁*X₂) d G v*
        ((if IsCoprime G I ∧ D∣I then
          rayColumn decor S H pool d hd R seed (fun i=>heightCoefficient (ν i) v) Wslot P
            (phaseProfile W₁ (t₁+v/(2*Real.pi))) (phaseProfile W₂ (t₂+v/(2*Real.pi)))
            b X₁ X₂ Y₁ Y₂ (G*I) else 0)*idealCoeff χ I) := by
    by_cases h : IsCoprime G I ∧ D∣I
    · simp only [ite_eq_left h]
      calc
        _ = (rayColumn decor S H pool d hd R seed ν Wslot P
            (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂ Y₁ Y₂ (G*I)*
              (I.absNorm:ℂ)^(Complex.I*v))*idealCoeff χ I := by ring
        _ = _ := by rw [hcol I];ring
    · simp only [h,ite_false,zero_mul,mul_zero]
  simp_rw [hterm]
  rw [←Finset.mul_sum]
  change normalization (X₁*X₂) P*(residualPhase (X₁*X₂) d G v*_)=_
  unfold rayMaskedRow
  dsimp only [rayColumn]
  ring

/-- The energy identity has exactly the same keep predicate on both
sides. Its only row hypothesis is nonvanishing on kept rows. -/
theorem source_height_energy (decor : Tuple α → ℂ) (η : Character) (v : ℝ)
    (S H : Finset PrimeIdeal) (pool : α→Finset Id) (hp : ∀i,∀I∈pool i,Prime I)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (G R seed D : Id) (hG : G≠0)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ) (hP : ∀i,0<P i)
    (W₁ W₂ : ℝ→ℂ) (t₁ t₂ b X₁ X₂ Y₁ Y₂ : ℝ)
    (hX₁ : 0<X₁) (hX₂ : 0<X₂) (hY₁ : 0<Y₁) (hY₂ : 0<Y₂)
    (hXY : X₁*X₂=Y₁*Y₂) (keep : O→Prop) (hkeep : ∀z,keep z→z≠0)
    (Φ : 𝓢(ℝ,ℂ)) (K : ℝ) :
    sourceRestrictedEnergy keep
      (residualPool G hG (finiteColumns (Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂))))
      (fun I=>if IsCoprime G I ∧ D∣I then
        rayColumn decor S H pool d hd R seed ν Wslot P (phaseProfile W₁ t₁) (phaseProfile W₂ t₂)
          b X₁ X₂ Y₁ Y₂ (G*I) else 0) (heightCoeff η v) Φ K/
      (X₁*X₂*∏i,P i)=
    radialEnergy (fun z=>rayMaskedRow decor (naturalCharacter η z) S H pool d hd G R seed D hG
      (fun i=>heightCoefficient (ν i) v) Wslot P
      (phaseProfile W₁ (t₁+v/(2*Real.pi))) (phaseProfile W₂ (t₂+v/(2*Real.pi)))
      b X₁ X₂ Y₁ Y₂) keep Φ K := by
  rw [restricted_energy_natural_character η v _ _ keep hkeep Φ K]
  rw [←radial_normalization (X₁*X₂) (mul_pos hX₁ hX₂) P hP]
  have hrow (z : O) := masked_height_row decor (naturalCharacter η z) v S H pool hp
    d hd G R seed D hG ν Wslot P W₁ W₂ t₁ t₂ b X₁ X₂ Y₁ Y₂ hX₁ hX₂ hY₁ hY₂ hXY
  simp_rw [hrow]
  rw [radial_mul,residual_phase_norm (X₁*X₂) (mul_pos hX₁ hX₂) d hd G hG v,one_pow,one_mul]


/-- Exact packing of the decorated source at every height. The multiplier decor may
encode the two different ordinary ray characters, including their nonunit zeros. -/
theorem packed_height_energy (decor : Tuple α → ℂ) (τ σA : Character)
    (Q : Id) (n : Fin 4 → ℤ) (V wm : O) (hV : V ≠ 0) (hwm : wm ≠ 0)
    (hcoef : ∀I : Id, Supported I → IsCoprime I (Ideal.span {wm}) →
      idealCoeff τ I = idealCoeff σA I * CanonicalRowCompletion.idealRowHom V I)
    (v : ℝ) (S H : Finset PrimeIdeal) (pool : α→Finset Id) (hp : ∀i,∀I∈pool i,Prime I)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (G R seed D : Id) (hG : G≠0)
    (hGw : ∀I : Id, IsCoprime G I → IsCoprime I (Ideal.span {wm}))
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ) (hP : ∀i,0<P i)
    (W₁ W₂ : ℝ→ℂ) (t₁ t₂ b X₁ X₂ Y₁ Y₂ : ℝ)
    (hX₁ : 0<X₁) (hX₂ : 0<X₂) (hY₁ : 0<Y₁) (hY₂ : 0<Y₂)
    (hXY : X₁*X₂=Y₁*Y₂) (Φ : 𝓢(ℝ,ℂ)) (K : ℝ) :
    sourceRestrictedEnergy (canonicalRadial τ Q n).keep
      (residualPool G hG (finiteColumns (Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂))))
      (fun I=>if IsCoprime G I ∧ D∣I then
        rayColumn decor S H pool d hd R seed ν Wslot P (phaseProfile W₁ t₁) (phaseProfile W₂ t₂)
          b X₁ X₂ Y₁ Y₂ (G*I) else 0) (heightCoeff τ v) Φ K/
      (X₁*X₂*∏i,P i)=
    radialEnergy (fun y=>rayMaskedRow decor (naturalCharacter σA y) S H pool d hd G R seed D hG
      (fun i=>heightCoefficient (ν i) v) Wslot P
      (phaseProfile W₁ (t₁+v/(2*Real.pi))) (phaseProfile W₂ (t₂+v/(2*Real.pi)))
      b X₁ X₂ Y₁ Y₂) (packedKeep σA Q V) Φ (((Ideal.span {V}).absNorm:ℝ)*K) := by
  rw [source_height_energy decor τ v S H pool hp d hd G R seed D hG ν Wslot P hP W₁ W₂
    t₁ t₂ b X₁ X₂ Y₁ Y₂ hX₁ hX₂ hY₁ hY₂ hXY _ (fun _ hz=>hz.1) Φ K]
  apply radialEnergy_pack _ _ _ _ Φ K V hV
  · intro z
    rw [Packet.keep_transfer τ σA Q n V wm z hwm hV hcoef]
    exact ⟨fun h=>⟨dvd_mul_right V z,h⟩,fun h=>h.2⟩
  · exact fun _ hy=>hy.1
  · intro z hz
    have hz0 : z≠0 := hz.1
    unfold rayMaskedRow
    congr 1
    apply Finset.sum_congr rfl
    intro I _
    by_cases hI : IsCoprime G I ∧ D∣I
    · by_cases hs : Supported I
      · rw [Packet.naturalCharacter_transfer τ σA V wm z hV hz0 hcoef I hs (hGw I hI.1)]
      · rw [natural_character_off_supported τ z hz0 I hs,
          natural_character_off_supported σA (V*z) (mul_ne_zero hV hz0) I hs]
    · simp [hI]

open AsymmetricRayColumn
open CenteredMomentCommonAllocationSum CenteredMomentCommonAllocationBox CenteredMomentLiveDomain
open CenteredMomentSourceRow CenteredMomentRowNorm CenteredMomentSourceRectangleEnergy
open MixedCommonEnergy MixedDivisorMask

theorem punctured_column (χ₀ χ₁ : Id →* ℂ) (H : Id) (S : (α⊕Fin 2)→Finset Id)
    (hS : ∀j,∀I∈S j,I≠0) (hp : ∀i,∀I∈S (Sum.inl i),Prime I)
    (C R s a : Id) (hC : C≠0) (ha : a≠0) (hsC : s∣C)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (B₁ B₂ : Id) :
    (if IsCoprime C a then finiteColumnCoefficient (Fintype.piFinset S)
      (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ s v) (C*a)
      else 0)=
      ∑B : actualAllocations S C,
        ((rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*frozenCoefficient B.val C R ν Wslot P)*
          finiteColumnCoefficient
            (liveBox S B.val (allocation_data S C B.val (Finset.mem_filter.mp B.property).1).1)
            (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val C R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v) a := by
  by_cases hc : IsCoprime C a
  · rw [ite_eq_left hc]
    exact AsymmetricRayColumn.original_column χ₀ χ₁ H S hS hp C R s a hC ha hc hsC ν Wslot P
      W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂
  · rw [ite_eq_right hc]
    symm
    apply Finset.sum_eq_zero
    intro B hB
    have hz : finiteColumnCoefficient
        (liveBox S B.val (allocation_data S C B.val (Finset.mem_filter.mp B.property).1).1)
        (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val C R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v) a=0 := by
      by_contra hn
      exact hc (masked_live_support S hS hp B.val
        (allocation_data S C B.val (Finset.mem_filter.mp B.property).1).1 C R a
        (Finset.mem_filter.mp B.property).1 (Finset.mem_filter.mp B.property).2
        ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ (fun v=>rayWeight χ₀ χ₁ v * tupleWeight H v) hn).2.2
    rw [hz,mul_zero]

/-- The support statement is used before squaring: an arbitrary column
multiplier may be present, but no term with a nonzero live coefficient
is lost when the original residual column pool is replaced. -/
theorem live_column_sum (χ₀ χ₁ : Id →* ℂ) (H : Id) (S : (α⊕Fin 2)→Finset Id)
    (hS : ∀j,∀I∈S j,I≠0) (hp : ∀i,∀I∈S (Sum.inl i),Prime I)
    (B : Tuple α) (hB : ∀j,B j≠0) (G R : Id) (hG : G≠0)
    (hlabel : B∈allocationLabels S G) (hprod : finiteTupleProduct B=G)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (B₁ B₂ : Id) (f : Id→ℂ) :
    (∑I∈residualPool G hG (finiteColumns (Fintype.piFinset S)),
      finiteColumnCoefficient (liveBox S B hB)
        (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B G R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v) I*f I)=
      ∑v∈liveBox S B hB,
        (rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B G R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v*
          f (finiteTupleProduct v) := by
  apply (sum_same_support _ (finiteColumns (liveBox S B hB)) _ f ?_ ?_).trans
    (finite_column_sum _ _ f)
  · intro I hI hn
    exact finite_column_mem _ _ I hn
  · intro I hI hn
    exact (mem_residualPool G hG _ I).mpr
      (masked_live_support S hS hp B hB G R I hlabel hprod ν Wslot P W₁ W₂
        X₁ X₂ Y₁ Y₂ B₁ B₂ (fun v=>rayWeight χ₀ χ₁ v * tupleWeight H v) hn).1

/-- Exact whole-column common extraction, retaining both the literal
tuple restriction and the squarefree-divisor mask. Squarefreeness is
not needed for this identity; it enters only in the subsequent bound. -/
theorem common_masked_sum (χ₀ χ₁ : Id →* ℂ) (H : Id) (S : (α⊕Fin 2)→Finset Id)
    (hS : ∀j,∀I∈S j,I≠0) (hp : ∀i,∀I∈S (Sum.inl i),Prime I)
    (G R seed D : Id) (hG : G≠0) (hseed : seed∣G)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (B₁ B₂ : Id) (f : Id→ℂ) :
    (∑I∈residualPool G hG (finiteColumns (Fintype.piFinset S)),
      (if IsCoprime G I ∧ D∣I then finiteColumnCoefficient (Fintype.piFinset S)
        (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂
          X₁ X₂ Y₁ Y₂ B₁ B₂ seed v) (G*I) else 0)*f I)=
      ∑B : actualAllocations S G,
        ((rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*frozenCoefficient B.val G R ν Wslot P)*
          ∑v∈liveBox S B.val
            (allocation_data S G B.val (Finset.mem_filter.mp B.property).1).1,
            if D∣finiteTupleProduct v then (rayWeight χ₀ χ₁ v * tupleWeight H v)*
              liveProfile B.val G R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v*
              f (finiteTupleProduct v) else 0 := by
  let Q := residualPool G hG (finiteColumns (Fintype.piFinset S))
  let c := fun B : actualAllocations S G=>(rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*frozenCoefficient B.val G R ν Wslot P
  let β := fun B : actualAllocations S G=>finiteColumnCoefficient
    (liveBox S B.val (allocation_data S G B.val (Finset.mem_filter.mp B.property).1).1)
    (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val G R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v)
  let g := fun I : Id=>if D∣I then f I else 0
  have hne (I : Id) (hI : I∈Q) : I≠0 := by
    obtain ⟨v,hv,he⟩ := Finset.mem_image.mp ((mem_residualPool G hG _ I).mp hI)
    have hv0 : finiteTupleProduct v≠0 := by
      unfold finiteTupleProduct
      exact Finset.prod_ne_zero_iff.mpr (fun j _=>hS j _ (Fintype.mem_piFinset.mp hv j))
    rw [he] at hv0
    exact right_ne_zero_of_mul hv0
  have hrow (I : Id) (hI : I∈Q) :
      (if IsCoprime G I ∧ D∣I then finiteColumnCoefficient (Fintype.piFinset S)
        (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂
          X₁ X₂ Y₁ Y₂ B₁ B₂ seed v) (G*I) else 0)*f I=
        ∑B : actualAllocations S G,c B*(β B I*g I) := by
    have hm : (if IsCoprime G I ∧ D∣I then finiteColumnCoefficient (Fintype.piFinset S)
        (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂
          X₁ X₂ Y₁ Y₂ B₁ B₂ seed v) (G*I) else 0)*f I=
        (if IsCoprime G I then finiteColumnCoefficient (Fintype.piFinset S)
          (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂
            X₁ X₂ Y₁ Y₂ B₁ B₂ seed v) (G*I) else 0)*g I := by
      by_cases hc : IsCoprime G I <;> by_cases hd : D∣I <;> simp [g,hc,hd]
    rw [hm,punctured_column χ₀ χ₁ H S hS hp G R seed I hG (hne I hI) hseed
      ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂,Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro B hB
    dsimp only [c,β]
    ring
  calc
    _ = ∑I∈Q,∑B : actualAllocations S G,c B*(β B I*g I) :=
      Finset.sum_congr rfl hrow
    _ = ∑B : actualAllocations S G,c B*(∑I∈Q,β B I*g I) := by
      rw [Finset.sum_comm]
      simp only [Finset.mul_sum]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro B hB
      apply congrArg (fun x : ℂ=>c B*x)
      apply (live_column_sum χ₀ χ₁ H S hS hp B.val
        (allocation_data S G B.val (Finset.mem_filter.mp B.property).1).1 G R hG
        (Finset.mem_filter.mp B.property).1 (Finset.mem_filter.mp B.property).2
        ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ g).trans
      apply Finset.sum_congr rfl
      intro v hv
      dsimp only [g]
      split_ifs <;> simp


open MixedSourceAssembly CenteredMomentDivisorAllocation CenteredMomentDivisorExtraction
open CenteredMomentDivisorEnergy

/-- A whole nonnegative radial energy is carried by one finite summand,
with its exact cardinality cost. The index may be empty. -/
theorem radial_single {ι : Type*} [Fintype ι] (phase f : ι→O→ℂ)
    (keep : O→Prop) (Φ : 𝓢(ℝ,ℂ)) (K radial price : ℝ) (hK : 0<K)
    (hs : Function.support (Φ:ℝ→ℂ)⊆Set.Iic radial)
    (hΦ : ∀z,0≤(Φ (‖eisEmbedding z‖^2/K)).re)
    (hphase : ∀i z,keep z→‖phase i z‖≤1) (hprice : (Fintype.card ι:ℝ)^2≤price) :
    radialEnergy (fun z=>∑i,phase i z*f i z) keep Φ K≤0 ∨
      ∃i,radialEnergy (fun z=>∑j,phase j z*f j z) keep Φ K≤
        price*radialEnergy (f i) keep Φ K := by
  classical
  by_cases hi : Nonempty ι
  · have := hi
    let E := fun i=>radialEnergy (f i) keep Φ K
    obtain ⟨i,_,hm⟩ := Finset.exists_max_image Finset.univ E Finset.univ_nonempty
    exact Or.inr ⟨i,(radial_phase_sum phase f (E i) keep Φ K radial hK hs hΦ hphase
      (fun j=>hm j (Finset.mem_univ j))).trans
      (mul_le_mul_of_nonneg_right hprice (radialEnergy_nonneg _ _ _ _ hΦ))⟩
  · have : IsEmpty ι := not_nonempty_iff.mp hi
    have h := radial_phase_sum phase f 0 keep Φ K radial hK hs hΦ hphase (fun j=>isEmptyElim j)
    exact Or.inl (by simpa only [mul_zero] using h)

/-- The normalized live row after selecting the genuine common allocation.
Its prime and ordinary coefficients, frozen scalar and surviving divisor mask
are still present. -/
def commonChild (χ₀ χ₁ : Id →* ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0)
    (G R D : Id) (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ)
    (B : actualAllocations (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) G) : ℂ :=
  normalization (X₁*X₂) P*frozenCoefficient B.val G R ν Wslot P*
    ∑u∈liveBox (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) B.val (allocation_data _ G B.val (Finset.mem_filter.mp B.property).1).1,
      if D∣finiteTupleProduct u then (rayWeight χ₀ χ₁ u * tupleWeight (punctureProduct S H) u)*
        liveProfile B.val G R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 u*
        idealCoeff χ (finiteTupleProduct u) else 0

theorem masked_eq_common (χ₀ χ₁ : Id →* ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (hp : ∀i,∀I∈pool i,Prime I)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (G R seed D : Id) (hG : G≠0) (hseed : seed∣G)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) :
    rayMaskedRow (rayWeight χ₀ χ₁) χ S H pool d hd G R seed D hG ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ =
      ∑B : actualAllocations (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) G,
        (rayWeight χ₀ χ₁ B.val*frozenWeight (punctureProduct S H) B.val)*
        commonChild χ₀ χ₁ χ S H pool d hd G R D ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B := by
  unfold rayMaskedRow
  rw [common_masked_sum χ₀ χ₁ _ _ (source_pools_nonzero pool hp d hd b X₁ X₂ Y₁ Y₂)
    (fun i I hi=>hp i I hi) G R seed D hG hseed, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro B _
  unfold commonChild
  ring

/-- The positive price of the genuine common allocations is uniform in the two
ray characters and in all row and column data. The selected child retains the
entire squared frozen coefficient. -/
theorem common_reduction_single (δ : ℝ) (hδ : 0 < δ) :
    ∃C : ℝ,0<C ∧ ∀(χ₀ χ₁ : Id→*ℂ), (∀I,‖χ₀ I‖≤1) → (∀I,‖χ₁ I‖≤1) →
    ∀(χ : O→Character)(S H : Finset PrimeIdeal)(pool : α→Finset Id),
    (∀i,∀I∈pool i,Prime I) → ∀(d : Id×Id)(hd : d.1≠0 ∧ d.2≠0)(G R seed D : Id)
    (hG : G≠0), seed∣G → ∀(ν : α→Id→ℂ)(Wslot : α→ℝ→ℂ)(P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ)(b X₁ X₂ Y₁ Y₂ : ℝ)(keep : O→Prop)(Φ : 𝓢(ℝ,ℂ))(K radial : ℝ),
    0<K → Function.support (Φ:ℝ→ℂ)⊆Set.Iic radial → (∀z,0≤(Φ (‖eisEmbedding z‖^2/K)).re) →
    let E := radialEnergy (fun z=>rayMaskedRow (rayWeight χ₀ χ₁) (χ z) S H pool d hd G R seed D hG
      ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂) keep Φ K
    E ≤ 0 ∨ ∃B, E ≤ C*(G.absNorm:ℝ)^δ*
      radialEnergy (fun z=>commonChild χ₀ χ₁ (χ z) S H pool d hd G R D ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B)
        keep Φ K := by
  obtain ⟨C,hC,hcount⟩ := genuine_count_squared (Fintype.card α+2) δ hδ
  refine ⟨C,hC,?_⟩
  intro χ₀ χ₁ h₀ h₁ χ S H pool hp d hd G R seed D hG hseed ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂
    keep Φ K radial hK hs hΦ
  let T := sourcePools pool d hd b X₁ X₂ Y₁ Y₂
  let phase := fun (B : actualAllocations T G) (_ : O) =>
    rayWeight χ₀ χ₁ B.val*frozenWeight (punctureProduct S H) B.val
  let f := fun (B : actualAllocations T G) (z : O) =>
    commonChild χ₀ χ₁ (χ z) S H pool d hd G R D ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B
  have he : (fun z => rayMaskedRow (rayWeight χ₀ χ₁) (χ z) S H pool d hd G R seed D hG
      ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂) = fun z => ∑B,phase B z * f B z :=
    funext (fun z => masked_eq_common χ₀ χ₁ (χ z) S H pool hp d hd G R seed D hG hseed ν
      Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂)
  dsimp only
  rw [he]
  apply radial_single phase f keep Φ K radial _ hK hs hΦ
  · intro B z _
    dsimp only [phase]
    rw [norm_mul]
    have hray : ‖rayWeight χ₀ χ₁ B.val‖ ≤ 1 := by
      unfold rayWeight
      rw [norm_mul]
      exact (mul_le_mul_of_nonneg_right (h₀ _) (norm_nonneg _)).trans (by simpa using h₁ _)
    apply (mul_le_mul_of_nonneg_right hray (norm_nonneg _)).trans
    rw [one_mul]
    unfold frozenWeight
    split_ifs <;> norm_num
  · rw [Fintype.card_coe]
    apply hcount _ T G hG
    simp

/-- The squarefree divisor allocation on precisely the live marked subset.
The signed allocation term remains inside the row sum. -/
def divisorChild (χ₀ χ₁ : Id →* ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0)
    (G R D : Id) (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ)
    (B : actualAllocations (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) G)
    (a : Allocation D (Finset.univ : Finset (liveIndices B.val⊕Fin 2))) : ℂ :=
  normalization (X₁*X₂) P*frozenCoefficient B.val G R ν Wslot P*
    ∑u∈liveBox (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) B.val
        (allocation_data _ G B.val (Finset.mem_filter.mp B.property).1).1,
      (rayWeight χ₀ χ₁ u * tupleWeight (punctureProduct S H) u)*allocationTerm D Finset.univ u a*
        liveProfile B.val G R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 u*
        idealCoeff χ (finiteTupleProduct u)

theorem common_eq_divisors (χ₀ χ₁ : Id →* ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (G R D : Id) (hD : Squarefree D)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ) (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ)
    (B : actualAllocations (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) G) :
    commonChild χ₀ χ₁ χ S H pool d hd G R D ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B =
      ∑a,divisorChild χ₀ χ₁ χ S H pool d hd G R D ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B a := by
  let T := sourcePools pool d hd b X₁ X₂ Y₁ Y₂
  have he := finite_mask_regroup D hD (Finset.univ : Finset (liveIndices B.val⊕Fin 2))
    (liveBox T B.val (allocation_data T G B.val (Finset.mem_filter.mp B.property).1).1) id
    (fun (_ : Unit) u=>(rayWeight χ₀ χ₁ u * tupleWeight (punctureProduct S H) u)*
      liveProfile B.val G R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 u*
      idealCoeff χ (finiteTupleProduct u)) ()
  unfold commonChild divisorChild
  rw [←Finset.mul_sum]
  congr 1
  apply he.trans
  apply Finset.sum_congr rfl
  intro a _
  unfold allocatedPolynomial
  apply Finset.sum_congr rfl
  intro u _
  dsimp only [id_eq]
  ring

/-- The divisor step selects one allocation at a cost uniform over the genuine
allocation B. In particular no sum over different B is moved outside this price. -/
theorem divisor_reduction_single (δ : ℝ) (hδ : 0 < δ) :
    ∃C : ℝ,0<C ∧ ∀(χ₀ χ₁ : Id→*ℂ)(χ : O→Character)(S H : Finset PrimeIdeal)(pool : α→Finset Id)
    (d : Id×Id)(hd : d.1≠0 ∧ d.2≠0)(G R D : Id), Squarefree D →
    ∀(ν : α→Id→ℂ)(Wslot : α→ℝ→ℂ)(P : α→ℝ)(W₁ W₂ : ℝ→ℂ)(b X₁ X₂ Y₁ Y₂ : ℝ)
    (B : actualAllocations (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) G)
    (keep : O→Prop)(Φ : 𝓢(ℝ,ℂ))(K radial : ℝ),
    0<K → Function.support (Φ:ℝ→ℂ)⊆Set.Iic radial → (∀z,0≤(Φ (‖eisEmbedding z‖^2/K)).re) →
    let E := radialEnergy (fun z=>commonChild χ₀ χ₁ (χ z) S H pool d hd G R D
      ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B) keep Φ K
    E≤0 ∨ ∃a,E≤C*(D.absNorm:ℝ)^δ*
      radialEnergy (fun z=>divisorChild χ₀ χ₁ (χ z) S H pool d hd G R D
        ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B a) keep Φ K := by
  obtain ⟨C,hC,hcount⟩ := allocation_count_squared (Fintype.card α+2) (by omega) δ hδ
  refine ⟨C,hC,?_⟩
  intro χ₀ χ₁ χ S H pool d hd G R D hD ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B keep Φ K radial hK hs hΦ
  have hdim : Fintype.card (liveIndices B.val⊕Fin 2) ≤ Fintype.card α+2 := by
    simp only [Fintype.card_sum,Fintype.card_fin,Fintype.card_coe]
    exact Nat.add_le_add_right (Finset.card_le_univ _) 2
  let f := fun a z=>divisorChild χ₀ χ₁ (χ z) S H pool d hd G R D ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B a
  have he : (fun z=>commonChild χ₀ χ₁ (χ z) S H pool d hd G R D ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B) =
      fun z=>∑a,f a z := funext (fun z=>common_eq_divisors χ₀ χ₁ (χ z) S H pool d hd G R D hD
        ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B)
  dsimp only
  rw [he]
  simpa only [one_mul] using radial_single (fun (_ : Allocation D (Finset.univ :
    Finset (liveIndices B.val⊕Fin 2))) (_ : O) => (1:ℂ))
    f keep Φ K radial (C*(D.absNorm:ℝ)^δ) hK hs hΦ (by simp) (hcount hdim D hD.ne_zero)

/-- A normalized allocated source with its actual shortened ordinary prefixes.
Its finite sum is in the form required by AsymmetricRayColumn.allocated_energy. -/
def rayAllocatedRow (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (D R : Id)
    (a : Allocation D (Finset.univ : Finset (α⊕Fin 2)))
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) : ℂ :=
  normalization (X₁*X₂) P*
    ∑u∈Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂),
      (rayWeight χ₀ χ₁ u * tupleWeight (punctureProduct S H) u)*allocationTerm D Finset.univ u a*
        profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 1 u*
        idealCoeff χ (finiteTupleProduct u)

/-- The child uses the actual live pools and both individual extracted prefixes.
A bound of E divided by that pair norm gives the full inverse norm of G. -/
theorem divisor_child_price (χ₀ χ₁ : Id→*ℂ) (χ : O→Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (G R D : Id) (hG : G≠0)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P M : α→ℝ) (hP : ∀i,0<P i)
    (hν : ∀i I,‖ν i I‖≤1) (hWnorm : ∀i x,‖Wslot i x‖≤M i) (hM : ∀i,1≤M i)
    (lo hi : ℝ) (hlo : 0<lo) (hW : ∀i,Function.support (Wslot i)⊆Set.Icc lo hi)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) (hX : 0<X₁*X₂)
    (B : actualAllocations (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) G)
    (a : Allocation D (Finset.univ : Finset (liveIndices B.val⊕Fin 2)))
    (keep : O→Prop)(Φ : 𝓢(ℝ,ℂ))(K E : ℝ)(hE : 0≤E)
    (he : radialEnergy (fun z=>rayAllocatedRow χ₀ χ₁ (χ z) S H
        (fun i : liveIndices B.val=>pool i.val)
        (d.1*B.val (Sum.inr 0),d.2*B.val (Sum.inr 1))
        ⟨mul_ne_zero hd.1 ((allocation_data _ G B.val (Finset.mem_filter.mp B.property).1).1 _),
         mul_ne_zero hd.2 ((allocation_data _ G B.val (Finset.mem_filter.mp B.property).1).1 _)⟩ D
        (R*G) a (fun i=>ν i.val) (fun i=>Wslot i.val) (fun i=>P i.val) W₁ W₂ b X₁ X₂ Y₁ Y₂)
        keep Φ K ≤ E/pairNorm (d.1*B.val (Sum.inr 0),d.2*B.val (Sum.inr 1))) :
    radialEnergy (fun z=>divisorChild χ₀ χ₁ (χ z) S H pool d hd G R D ν Wslot P W₁ W₂ b
      X₁ X₂ Y₁ Y₂ B a) keep Φ K ≤
      (((∏i,M i)^2*(max 1 hi)^Fintype.card α)/(G.absNorm:ℝ))*(E/pairNorm d) := by
  let T := sourcePools pool d hd b X₁ X₂ Y₁ Y₂
  have hB := (allocation_data T G B.val (Finset.mem_filter.mp B.property).1).1
  let f := fun z : O=>∑u∈liveBox T B.val hB,
      (rayWeight χ₀ χ₁ u * tupleWeight (punctureProduct S H) u)*allocationTerm D Finset.univ u a*
        liveProfile B.val G R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 u*
        idealCoeff (χ z) (finiteTupleProduct u)
  have heq (z : O) : normalization (X₁*X₂) (fun i : liveIndices B.val=>P i.val)*f z =
      rayAllocatedRow χ₀ χ₁ (χ z) S H (fun i : liveIndices B.val=>pool i.val)
        (d.1*B.val (Sum.inr 0),d.2*B.val (Sum.inr 1))
        ⟨mul_ne_zero hd.1 (hB _),mul_ne_zero hd.2 (hB _)⟩ D
        (R*G) a (fun i=>ν i.val) (fun i=>Wslot i.val) (fun i=>P i.val) W₁ W₂ b X₁ X₂ Y₁ Y₂ := by
    dsimp only [f,T,sourcePools]
    rw [source_live_box pool d hd (plainSupportPool b X₁ Y₁) (plainSupportPool b X₂ Y₂) B.val hB]
    unfold rayAllocatedRow sourcePools liveProfile
    congr 1
  have hc := frozen_source_energy B.val hB G R hG (Finset.mem_filter.mp B.property).2 d hd
    (X₁*X₂) hX ν Wslot P M hP hν hWnorm hM lo hi hlo hW f keep Φ K E hE
    (by simpa only [heq] using he)
  simpa only [divisorChild, f,T, mul_assoc] using hc

/-- Consumer for the packed radial side of `packed_height_energy`.
It suffices to price the short normalized allocated row for each actual B,a.
The cost carries the inverse norms of both G and D and the original pair norm.
The bound is uniform before all row and column data. -/
theorem allocated_price_transfer (δ : ℝ) (hδ : 0<δ) :
    ∃C : ℝ,0<C ∧ ∀(χ₀ χ₁ : Id→*ℂ), (∀I,‖χ₀ I‖≤1) → (∀I,‖χ₁ I‖≤1) →
    ∀(χ : O→Character)(S H : Finset PrimeIdeal)(pool : α→Finset Id),
    (∀i,∀I∈pool i,Prime I) → ∀(d : Id×Id)(hd : d.1≠0 ∧ d.2≠0)(G R seed D : Id)
    (hG : G≠0), seed∣G → Squarefree D →
    ∀(ν : α→Id→ℂ)(Wslot : α→ℝ→ℂ)(P M : α→ℝ), (∀i,0<P i) →
    (∀i I,‖ν i I‖≤1) → (∀i x,‖Wslot i x‖≤M i) → (∀i,1≤M i) →
    ∀(lo hi : ℝ), 0<lo → (∀i,Function.support (Wslot i)⊆Set.Icc lo hi) →
    ∀(W₁ W₂ : ℝ→ℂ)(b X₁ X₂ Y₁ Y₂ : ℝ), 0<X₁*X₂ →
    ∀(keep : O→Prop)(Φ : 𝓢(ℝ,ℂ))(K radial E : ℝ),0<K → 0≤E →
    Function.support (Φ:ℝ→ℂ)⊆Set.Iic radial → (∀z,0≤(Φ (‖eisEmbedding z‖^2/K)).re) →
    (∀(B : actualAllocations (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) G)
      (a : Allocation D (Finset.univ : Finset (liveIndices B.val⊕Fin 2))),
      radialEnergy (fun z=>rayAllocatedRow χ₀ χ₁ (χ z) S H (fun i : liveIndices B.val=>pool i.val)
        (d.1*B.val (Sum.inr 0),d.2*B.val (Sum.inr 1))
        ⟨mul_ne_zero hd.1 ((allocation_data _ G B.val (Finset.mem_filter.mp B.property).1).1 _),
         mul_ne_zero hd.2 ((allocation_data _ G B.val (Finset.mem_filter.mp B.property).1).1 _)⟩ D
        (R*G) a (fun i=>ν i.val) (fun i=>Wslot i.val) (fun i=>P i.val) W₁ W₂ b X₁ X₂ Y₁ Y₂)
        keep Φ K ≤ (E/(D.absNorm:ℝ))/pairNorm (d.1*B.val (Sum.inr 0),d.2*B.val (Sum.inr 1))) →
    radialEnergy (fun z=>rayMaskedRow (rayWeight χ₀ χ₁) (χ z) S H pool d hd G R seed D hG ν Wslot P
      W₁ W₂ b X₁ X₂ Y₁ Y₂) keep Φ K ≤ C*((G.absNorm:ℝ)^δ*(D.absNorm:ℝ)^δ)*
      (((∏i,M i)^2*(max 1 hi)^Fintype.card α)/(G.absNorm:ℝ))*((E/(D.absNorm:ℝ))/pairNorm d) := by
  obtain ⟨CG,hCG,hg⟩ := common_reduction_single (α:=α) δ hδ
  obtain ⟨CD,hCD,hh⟩ := divisor_reduction_single (α:=α) δ hδ
  refine ⟨CG*CD,mul_pos hCG hCD,?_⟩
  intro χ₀ χ₁ h₀ h₁ χ S H pool hp d hd G R seed D hG hseed hD ν Wslot P M hP hν hWnorm hM
    lo hi hlo hW W₁ W₂ b X₁ X₂ Y₁ Y₂ hX keep Φ K radial E hK hE hs hΦ he
  let g := CG*(G.absNorm:ℝ)^δ
  let j := CD*(D.absNorm:ℝ)^δ
  let F := ((∏i,M i)^2*(max 1 hi)^Fintype.card α)/(G.absNorm:ℝ)
  let T := (E/(D.absNorm:ℝ))/pairNorm d
  have g₀ : 0≤g := mul_nonneg hCG.le (Real.rpow_nonneg (Nat.cast_nonneg _) _)
  have j₀ : 0≤j := mul_nonneg hCD.le (Real.rpow_nonneg (Nat.cast_nonneg _) _)
  have F₀ : 0≤F := div_nonneg (mul_nonneg (sq_nonneg _) (pow_nonneg
    ((show (0:ℝ)≤1 by norm_num).trans (le_max_left _ _)) _)) (Nat.cast_nonneg _)
  have T₀ : 0≤T := div_nonneg (div_nonneg hE (Nat.cast_nonneg _)) (pairNorm_pos hd.1 hd.2).le
  have hrewrite : g*(j*(F*T)) = CG*CD*((G.absNorm:ℝ)^δ*(D.absNorm:ℝ)^δ)*F*T := by
    dsimp only [g,j];ring
  change _ ≤ CG*CD*((G.absNorm:ℝ)^δ*(D.absNorm:ℝ)^δ)*F*T
  rw [←hrewrite]
  rcases hg χ₀ χ₁ h₀ h₁ χ S H pool hp d hd G R seed D hG hseed ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂
    keep Φ K radial hK hs hΦ with hz | ⟨B,hB⟩
  · exact hz.trans (mul_nonneg g₀ (mul_nonneg j₀ (mul_nonneg F₀ T₀)))
  apply hB.trans
  apply mul_le_mul_of_nonneg_left _ g₀
  rcases hh χ₀ χ₁ χ S H pool d hd G R D hD ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ B
    keep Φ K radial hK hs hΦ with hz | ⟨a,ha⟩
  · exact hz.trans (mul_nonneg j₀ (mul_nonneg F₀ T₀))
  apply ha.trans
  apply mul_le_mul_of_nonneg_left _ j₀
  exact divisor_child_price χ₀ χ₁ χ S H pool d hd G R D hG ν Wslot P M hP hν hWnorm hM
    lo hi hlo hW W₁ W₂ b X₁ X₂ Y₁ Y₂ hX B a keep Φ K _ (div_nonneg hE (Nat.cast_nonneg _)) (he B a)

end
end ContinuumLocalReturn.AsymmetricRayLabel

#print axioms ContinuumLocalReturn.AsymmetricRayLabel.packed_height_energy

#print axioms ContinuumLocalReturn.AsymmetricRayLabel.common_masked_sum

#print axioms ContinuumLocalReturn.AsymmetricRayLabel.common_reduction_single

#print axioms ContinuumLocalReturn.AsymmetricRayLabel.divisor_reduction_single

#print axioms ContinuumLocalReturn.AsymmetricRayLabel.divisor_child_price

#print axioms ContinuumLocalReturn.AsymmetricRayLabel.allocated_price_transfer
