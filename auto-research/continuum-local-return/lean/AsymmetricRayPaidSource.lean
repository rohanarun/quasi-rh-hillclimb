/- Decorated squarefree divisor cost. Based on Sil, MixedDom2.lean, Apache-2.0.
 Written with OpenAI Codex assistance. -/
import AsymmetricRayPaid
import AsymmetricRayKernel

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 1000000

namespace ContinuumLocalReturn.AsymmetricRayPaidSource
open ContinuumLocalReturn.AsymmetricRayPaid ContinuumLocalReturn.AsymmetricRayKernel
open ContinuumLocalReturn.AsymmetricRayColumn ContinuumLocalReturn.AsymmetricRayLabel
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

open AsymmetricRayColumn
open CenteredMomentCommonAllocationSum CenteredMomentCommonAllocationBox CenteredMomentLiveDomain
open CenteredMomentSourceRow CenteredMomentRowNorm CenteredMomentSourceRectangleEnergy
open MixedCommonEnergy MixedDivisorMask

open MixedSourceAssembly CenteredMomentDivisorAllocation CenteredMomentDivisorExtraction
open CenteredMomentDivisorEnergy

open MixedAllocationCost MixedFixedSupport
open MixedTupleRows MixedLiveRows KernelMarkedRows KernelRowPools KernelRowProfiles KernelLabelledSlots KernelPunctureRows KernelRowExpansion
open IdealMobiusDivisorSum (support_prime)
theorem rect_sum (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (A B : Finset Id) (β : α→Id→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ : ℝ) :
    (∑v∈Fintype.piFinset (pools (fun _ : α=>primeValues S) A B),
      (rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*rectangleCoefficient pool β P W₁ W₂ X₁ X₂ v*
        idealCoeff χ (finiteTupleProduct v))=
      weightedSum (naturalCoefficients χ S pool β P)
        (fun slot=>rayRow χ₀ χ₁ χ (A×ˢB)
          (restrictedValue S (KernelPunctureRows.augmented S H (KernelLabelledSlots.marked S slot)))
          W₁ W₂ X₁ X₂) := by
  rw [split_tuple_sum,prime_tuple_sum]
  unfold weightedSum
  apply Finset.sum_congr rfl
  intro slot hs
  simp_rw [packed_weight]
  by_cases hi : Function.Injective slot
  · simp only [hi,ite_true]
    rw [rayRow,normalizedRow,Finset.mul_sum,Finset.sum_mul]
    apply Finset.sum_congr rfl
    intro n hn
    rw [MixedTupleRows.pack_product,map_mul,natural_product_all]
    unfold rectangleCoefficient pairCharacter rayWeight rays
    simp only [MixedTupleRows.pack,Sum.elim_inl,Sum.elim_inr,Matrix.cons_val_zero,Matrix.cons_val_one]
    ring
  · simp only [hi,ite_false,mul_zero,zero_mul,Finset.sum_const_zero]

theorem center_sum (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (A B : Finset Id) (β : α→Id→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (d : Id×Id)
    (hX : 0<X₁*X₂) (hXY : X₁*X₂=Y₁*Y₂) (hd : d.1≠0 ∧ d.2≠0) :
    (∑v∈Fintype.piFinset (pools (fun _ : α=>primeValues S) A B),
      (rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*centeredCoefficient pool β P W₁ W₂ X₁ X₂ Y₁ Y₂ d v*
        idealCoeff χ (finiteTupleProduct v))=
      (Real.sqrt (pairNorm d):ℂ)⁻¹*
        (weightedSum (naturalCoefficients χ S pool β P)
          (fun slot=>rayRow χ₀ χ₁ χ (A×ˢB)
            (restrictedValue S (KernelPunctureRows.augmented S H (KernelLabelledSlots.marked S slot)))
            W₁ W₂ (X₁/d.1.absNorm) (X₂/d.2.absNorm))-
        weightedSum (naturalCoefficients χ S pool β P)
          (fun slot=>rayRow χ₀ χ₁ χ (A×ˢB)
            (restrictedValue S (KernelPunctureRows.augmented S H (KernelLabelledSlots.marked S slot)))
            W₁ W₂ (Y₁/d.1.absNorm) (Y₂/d.2.absNorm))) := by
  simp_rw [centered_extraction pool β P W₁ W₂ X₁ X₂ Y₁ Y₂ d hX hXY hd]
  rw [←rect_sum,←rect_sum,←Finset.sum_sub_distrib,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro v hv
  ring

theorem pool_completion (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (hpool : ∀i,pool i⊆primeValues S) (A B : Finset Id)
    (β : α→Id→ℂ) (P : α→ℝ) (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (d : Id×Id) :
    (∑v∈Fintype.piFinset (pools pool A B),(rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*
      centeredCoefficient pool β P W₁ W₂ X₁ X₂ Y₁ Y₂ d v*idealCoeff χ (finiteTupleProduct v))=
    ∑v∈Fintype.piFinset (pools (fun _ : α=>primeValues S) A B),(rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*
      centeredCoefficient pool β P W₁ W₂ X₁ X₂ Y₁ Y₂ d v*idealCoeff χ (finiteTupleProduct v) := by
  have hsub : Fintype.piFinset (pools pool A B)⊆
      Fintype.piFinset (pools (fun _ : α=>primeValues S) A B) := by
    intro v hv
    apply Fintype.mem_piFinset.mpr
    intro j
    cases j with
    | inl i=>exact hpool i (Fintype.mem_piFinset.mp hv (Sum.inl i))
    | inr j=>exact Fintype.mem_piFinset.mp hv (Sum.inr j)
  apply Finset.sum_subset hsub
  intro v hv hn
  by_contra he
  have hc := (mul_ne_zero_iff.mp (mul_ne_zero_iff.mp he).1).2
  have hp : (∏i,slotWeight pool β P i (v (Sum.inl i)))≠0 :=
    (mul_ne_zero_iff.mp hc).2
  apply hn
  apply Fintype.mem_piFinset.mpr
  intro j
  cases j with
  | inl i=>
      by_contra hi
      change v (Sum.inl i)∉pool i at hi
      exact (Finset.prod_ne_zero_iff.mp hp i (Finset.mem_univ i))
        (by simp only [slotWeight,ite_eq_right hi])
  | inr j=>exact Fintype.mem_piFinset.mp hv (Sum.inr j)
theorem pool_profile (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (R : Id) (hR : R≠0) (pool : α→Finset Id) (hpool : ∀i,pool i⊆primeValues S)
    (A B : Finset Id) (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (d : Id×Id) :
    ((Real.sqrt (X₁*X₂):ℂ)⁻¹*∏i,(Real.sqrt (P i):ℂ)⁻¹)*
      (∑v∈Fintype.piFinset (pools pool A B),(rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*
        profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 1 v*
        idealCoeff χ (finiteTupleProduct v))=
      ∑v∈Fintype.piFinset (pools (fun _ : α=>primeValues S) A B),
        (rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*
          centeredCoefficient pool (fun i I=>ν i I*Wslot i (I.absNorm/P i)) P
            W₁ W₂ X₁ X₂ Y₁ Y₂ d v*
          idealCoeff (χ.excludePrimes (primeSupport R) (fun _ h=>support_prime h))
            (finiteTupleProduct v) := by
  rw [←pool_completion χ₀ χ₁ _ S H pool hpool A B]
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro v hv
  have he := profile_centralization pool ν Wslot P R W₁ W₂ X₁ X₂ Y₁ Y₂ d v
    (fun i hi=>False.elim (hi (Fintype.mem_piFinset.mp hv (Sum.inl i))))
  rw [←radical_character_mask χ R hR]
  calc
    _ = (rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*
        (((Real.sqrt (X₁*X₂):ℂ)⁻¹*∏i,(Real.sqrt (P i):ℂ)⁻¹)*
          profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 1 v)*
        idealCoeff χ (finiteTupleProduct v) := by ring
    _ = _ := by rw [he];ring

def punctured (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (β : α→Id→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ : ℝ) : ℂ :=
  weightedSum (naturalCoefficients χ S pool β P)
    (fun slot=>rayRow χ₀ χ₁ χ (supportedRectangle S b X₁ X₂)
      (restrictedValue S (augmented S H (marked S slot))) W₁ W₂ X₁ X₂)

def centered (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (β : α→Id→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) (d : Id×Id) : ℂ :=
  (Real.sqrt (pairNorm d):ℂ)⁻¹*
    (punctured χ₀ χ₁ χ S H pool β P W₁ W₂ b (X₁/d.1.absNorm) (X₂/d.2.absNorm)-
      punctured χ₀ χ₁ χ S H pool β P W₁ W₂ b (Y₁/d.1.absNorm) (Y₂/d.2.absNorm))

theorem center_complete (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (A B : Finset Id) (β : α→Id→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) (d : Id×Id)
    (hX₁ : 0<X₁) (hX₂ : 0<X₂) (hY₁ : 0<Y₁) (hY₂ : 0<Y₂)
    (hXY : X₁*X₂=Y₁*Y₂) (hd : d.1≠0 ∧ d.2≠0)
    (hs₁ : Function.support W₁⊆Set.Iic b) (hs₂ : Function.support W₂⊆Set.Iic b)
    (hDX : rectangle b (X₁/d.1.absNorm) (X₂/d.2.absNorm)⊆A×ˢB)
    (hDY : rectangle b (Y₁/d.1.absNorm) (Y₂/d.2.absNorm)⊆A×ˢB)
    (hoff : ∀I,¬Supported I→idealCoeff χ I=0)
    (hS : ∀I,Supported I→
      (((I.absNorm:ℝ)≤b*(X₁/d.1.absNorm) ∨ (I.absNorm:ℝ)≤b*(X₂/d.2.absNorm)) ∨
       ((I.absNorm:ℝ)≤b*(Y₁/d.1.absNorm) ∨ (I.absNorm:ℝ)≤b*(Y₂/d.2.absNorm)))→
      primeSupport I⊆primeValues S) :
    (∑v∈Fintype.piFinset (pools (fun _ : α=>primeValues S) A B),
      (rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*centeredCoefficient pool β P W₁ W₂ X₁ X₂ Y₁ Y₂ d v*
        idealCoeff χ (finiteTupleProduct v))=
      centered χ₀ χ₁ χ S H pool β P W₁ W₂ b X₁ X₂ Y₁ Y₂ d := by
  rw [center_sum χ₀ χ₁ χ S H pool A B β P W₁ W₂ X₁ X₂ Y₁ Y₂ d
    (mul_pos hX₁ hX₂) hXY hd]
  unfold centered punctured
  apply congrArg (fun z : ℂ=>(Real.sqrt (pairNorm d):ℂ)⁻¹*z)
  apply congrArg₂ (fun x y : ℂ=>x-y)
  · apply congrArg (weightedSum (naturalCoefficients χ S pool β P))
    funext slot
    exact normalized_row_complete χ S (A×ˢB) _ W₁ W₂ b _ _
      (shortened_positive_le hX₁ hd.1).1 (shortened_positive_le hX₂ hd.2).1 hs₁ hs₂ hDX hoff
      (fun I hI hh=>hS I hI (Or.inl hh))
  · apply congrArg (weightedSum (naturalCoefficients χ S pool β P))
    funext slot
    exact normalized_row_complete χ S (A×ˢB) _ W₁ W₂ b _ _
      (shortened_positive_le hY₁ hd.1).1 (shortened_positive_le hY₂ hd.2).1 hs₁ hs₂ hDY hoff
      (fun I hI hh=>hS I hI (Or.inr hh))

theorem source_centered (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal) (R : Id) (hR : R≠0)
    (pool : α→Finset Id) (hp : ∀i,pool i⊆primeValues S)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) (d : Id×Id)
    (hX₁ : 0<X₁) (hX₂ : 0<X₂) (hY₁ : 0<Y₁) (hY₂ : 0<Y₂)
    (hXY : X₁*X₂=Y₁*Y₂) (hd : d.1≠0 ∧ d.2≠0)
    (hs₁ : Function.support W₁⊆Set.Iic b) (hs₂ : Function.support W₂⊆Set.Iic b)
    (hoff : ∀I,¬Supported I→idealCoeff χ I=0)
    (hS : ∀I,Supported I→
      (((I.absNorm:ℝ)≤b*(X₁/d.1.absNorm) ∨ (I.absNorm:ℝ)≤b*(X₂/d.2.absNorm)) ∨
       ((I.absNorm:ℝ)≤b*(Y₁/d.1.absNorm) ∨ (I.absNorm:ℝ)≤b*(Y₂/d.2.absNorm)))→
      primeSupport I⊆primeValues S) :
    raySource χ₀ χ₁ χ S H pool d hd R ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ =
      centered χ₀ χ₁ (χ.excludePrimes (primeSupport R) (fun _ h=>support_prime h)) S H pool
        (fun i I=>ν i I*Wslot i (I.absNorm/P i)) P W₁ W₂ b X₁ X₂ Y₁ Y₂ d := by
  unfold raySource sourcePools normalization
  rw [pool_profile χ₀ χ₁ χ S H R hR pool hp _ _ ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d]
  have hc := source_pool_rectangles d hd b X₁ X₂ Y₁ Y₂
  dsimp only at hc

  apply center_complete χ₀ χ₁ _ S H _ _ _ _ _ W₁ W₂ b X₁ X₂ Y₁ Y₂ d
    hX₁ hX₂ hY₁ hY₂ hXY hd hs₁ hs₂ hc.1 hc.2 _ hS
  intro I hI
  rw [idealCoeff_excludePrimes,hoff I hI]
  split_ifs <;> rfl


theorem row_absorb (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal) (hH : H⊆S)
    (D : Finset (Id×Id)) (live : S→Bool) (W₁ W₂ : ℝ→ℂ) (X₁ X₂ : ℝ) :
    rayRow χ₀ χ₁ χ D (restrictedValue S (augmented S H live)) W₁ W₂ X₁ X₂=
      rayRow χ₀ χ₁ (χ.excludePrimes (holes H) (holes_prime H)) D
        (restrictedValue S live) W₁ W₂ X₁ X₂ := by
  unfold rayRow normalizedRow
  apply congrArg (fun z : ℂ=>(Real.sqrt (X₁*X₂):ℂ)⁻¹*z)
  apply Finset.sum_congr rfl
  intro n hn
  dsimp only
  rw [ordinary_mask S H hH]
  unfold pairCharacter
  rw [←common_character_mask]
  ring

theorem absorb (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal) (hH : H⊆S)
    (pool : α→Finset Id) (β : α→Id→ℂ) (P : α→ℝ)
    (hβ : ∀i,∀Q∈H,β i Q.val=0) (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ : ℝ) :
    weightedSum (naturalCoefficients χ S pool β P)
      (fun slot=>rayRow χ₀ χ₁ χ (supportedRectangle S b X₁ X₂)
        (restrictedValue S (augmented S H (marked S slot))) W₁ W₂ X₁ X₂)=
      markedRow χ₀ χ₁ false S (χ.excludePrimes (holes H) (holes_prime H)) pool β P W₁ W₂ b X₁ X₂ := by
  unfold markedRow sourceValue
  simp only [Bool.false_eq_true,ite_false,natural_hole_absorption χ S H pool β P hβ]
  apply congrArg (weightedSum (naturalCoefficients χ S pool β P))
  funext slot
  exact row_absorb χ₀ χ₁ χ S H hH _ _ W₁ W₂ X₁ X₂


end
end ContinuumLocalReturn.AsymmetricRayPaidSource
#print axioms ContinuumLocalReturn.AsymmetricRayPaidSource.source_centered
#print axioms ContinuumLocalReturn.AsymmetricRayPaidSource.absorb
