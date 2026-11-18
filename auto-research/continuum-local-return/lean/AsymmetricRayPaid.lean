/- Decorated squarefree divisor cost. Based on Sil, MixedDom2.lean, Apache-2.0.
 Written with OpenAI Codex assistance. -/
import AsymmetricRayLabel

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 1000000

namespace ContinuumLocalReturn.AsymmetricRayPaid
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
/-- Native source with its common puncture, current ordinary prefixes, and no
artificial divisor allocation. Both ordinary rays remain inside the tuple sum. -/
def raySource (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (R : Id)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ) (W₁ W₂ : ℝ→ℂ)
    (b X₁ X₂ Y₁ Y₂ : ℝ) : ℂ :=
  normalization (X₁*X₂) P*
    ∑v∈Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂),
      (rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*
        profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 1 v*
        idealCoeff χ (finiteTupleProduct v)

theorem live_eq_source (χ₀ χ₁ : Id→*ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (F R : Id)
    (B : Tuple α) (hB : ∀j,B j≠0) (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) :
    normalization (X₁*X₂) (fun i : liveIndices B=>P i.val)*
      liveRowSum χ₀ χ₁ χ S H pool d hd B hB F R ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ =
    raySource χ₀ χ₁ χ S H (fun i : liveIndices B=>pool i.val)
      (d.1*B (.inr 0),d.2*B (.inr 1)) ⟨mul_ne_zero hd.1 (hB _),mul_ne_zero hd.2 (hB _)⟩
      (R*F) (fun i=>ν i.val) (fun i=>Wslot i.val) (fun i=>P i.val) W₁ W₂ b X₁ X₂ Y₁ Y₂ := by
  unfold liveRowSum raySource sourcePools
  rw [source_live_box pool d hd (plainSupportPool b X₁ Y₁) (plainSupportPool b X₂ Y₂) B hB]
  unfold liveProfile
  congr 1

/-- One signed allocation. The hypothesis prices each residual source by its
updated ordinary pair norm; the conclusion gains the full additional inverse
norm of the squarefree D. All surviving prime slots see the actual R*D mask. -/
theorem allocated_to_source (δ : ℝ) (hδ : 0<δ) :
    ∃C : ℝ,0<C ∧ ∀(χ₀ χ₁ : Id→*ℂ), (∀I,‖χ₀ I‖≤1) → (∀I,‖χ₁ I‖≤1) →
    ∀(χ : O→Character)(S H : Finset PrimeIdeal)(pool : α→Finset Id), (∀i,∀I∈pool i,Prime I) →
    ∀(d : Id×Id)(hd : d.1≠0 ∧ d.2≠0)(D R : Id),Squarefree D →
    ∀(a : Allocation D (Finset.univ : Finset (α⊕Fin 2)))
    (ν : α→Id→ℂ)(Wslot : α→ℝ→ℂ)(P M : α→ℝ), (∀i,0<P i) →
    (∀i I,‖ν i I‖≤1) → (∀i x,‖Wslot i x‖≤M i) → (∀i,1≤M i) →
    ∀(lo hi : ℝ), 0<lo → (∀i,Function.support (Wslot i)⊆Set.Icc lo hi) →
    ∀(W₁ W₂ : ℝ→ℂ)(b X₁ X₂ Y₁ Y₂ : ℝ), 0<X₁*X₂ →
    ∀(keep : O→Prop)(Φ : 𝓢(ℝ,ℂ))(K radial E : ℝ),0<K → 0≤E →
    Function.support (Φ:ℝ→ℂ)⊆Set.Iic radial → (∀z,0≤(Φ (‖eisEmbedding z‖^2/K)).re) →
    (∀(B : boundedLabels (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) D),
      allocationTerm D Finset.univ B.val a≠0 →
      radialEnergy (fun z=>raySource χ₀ χ₁ (χ z) S H (fun i : liveIndices B.val=>pool i.val)
        (d.1*B.val (.inr 0),d.2*B.val (.inr 1))
        ⟨mul_ne_zero hd.1 ((allocation_data _ D B.val (Finset.mem_filter.mp B.property).1).1 _),
         mul_ne_zero hd.2 ((allocation_data _ D B.val (Finset.mem_filter.mp B.property).1).1 _)⟩
        (R*D) (fun i=>ν i.val) (fun i=>Wslot i.val) (fun i=>P i.val) W₁ W₂ b X₁ X₂ Y₁ Y₂)
        keep Φ K ≤ E/pairNorm (d.1*B.val (.inr 0),d.2*B.val (.inr 1))) →
    radialEnergy (fun z=>rayAllocatedRow χ₀ χ₁ (χ z) S H pool d hd D R a ν Wslot P W₁ W₂ b
      X₁ X₂ Y₁ Y₂) keep Φ K ≤ C*(D.absNorm:ℝ)^δ*
      (((∏i,M i)^2*(max 1 hi)^Fintype.card α)/(D.absNorm:ℝ))*(E/pairNorm d) := by
  obtain ⟨C,hC,hcount⟩ := fixed_count_squared (ι:=α⊕Fin 2) δ hδ
  refine ⟨C,hC,?_⟩
  intro χ₀ χ₁ h₀ h₁ χ S H pool hp d hd D R hD a ν Wslot P M hP hν hWnorm hM lo hi hlo hW
    W₁ W₂ b X₁ X₂ Y₁ Y₂ hX keep Φ K radial E hK hE hs hΦ hsource
  let T := sourcePools pool d hd b X₁ X₂ Y₁ Y₂
  let labels := boundedLabels T D
  have hB (B : labels) := (allocation_data T D B.val (Finset.mem_filter.mp B.property).1).1
  let active := fun B : labels=>allocationTerm D Finset.univ B.val a≠0
  let f := fun (B : labels)(z : O)=>frozenRowWithRays χ₀ χ₁ (χ z) S H pool d hd B.val (hB B)
    D R ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂
  let phase := fun (B : labels)(z : O)=>(rayWeight χ₀ χ₁ B.val*frozenWeight (punctureProduct S H)
    B.val)*allocationTerm D Finset.univ B.val a*idealCoeff (χ z) (finiteTupleProduct B.val)
  let F := (∏i,M i)^2*(max 1 hi)^Fintype.card α
  let L := (F/(D.absNorm:ℝ))*(E/pairNorm d)
  have hF : 0≤F := mul_nonneg (sq_nonneg _) (pow_nonneg
    ((show (0:ℝ)≤1 by norm_num).trans (le_max_left _ _)) _)
  have hL : 0≤L := mul_nonneg (div_nonneg hF (Nat.cast_nonneg _)) (div_nonneg hE (pairNorm_pos hd.1 hd.2).le)
  have hrew : (fun z=>rayAllocatedRow χ₀ χ₁ (χ z) S H pool d hd D R a ν Wslot P W₁ W₂ b
      X₁ X₂ Y₁ Y₂) = fun z=>∑B,phase B z*f B z := funext (fun z=>
    AsymmetricRayColumn.allocated_row_identity χ₀ χ₁ (χ z) S H pool hp d hd D D R hD.ne_zero
      (dvd_refl D) a ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂)
  have hphase (B : labels) (z : O) (_ : keep z) : ‖phase B z‖≤1 := by
    have hfroz : ‖frozenWeight (punctureProduct S H) B.val‖≤1 := by
      unfold frozenWeight
      split_ifs <;> norm_num
    dsimp only [phase,rayWeight]
    simp only [norm_mul]
    have prod {x y : ℝ} (hx : x≤1) (hy : y≤1) (hy0 : 0≤y) : x*y≤1 :=
      (mul_le_mul_of_nonneg_right hx hy0).trans (by simpa only [one_mul] using hy)
    exact prod (prod (prod (prod (h₀ _) (h₁ _) (norm_nonneg _)) hfroz (norm_nonneg _))
      (allocation_term_norm D Finset.univ B.val a) (norm_nonneg _))
      (idealCoeff_norm_le_one _ _) (norm_nonneg _)
  have hz (B : labels) (hn : ¬active B) (z : O) : phase B z=0 := by
    change ¬(allocationTerm D Finset.univ B.val a≠0) at hn
    simp only [phase,not_not.mp hn,mul_zero,zero_mul]
  have hf (B : labels) (hact : active B) : radialEnergy (f B) keep Φ K≤L := by
    let PB := finiteTupleProduct B.val
    have hPB : PB≠0 := Finset.prod_ne_zero_iff.mpr (fun i _=>hB B i)
    have hnorm : (D.absNorm:ℝ)≤PB.absNorm := (squarefree_norm_le_selected_product D hD a).trans
      (selected_product_norm D a B.val (hB B) hact)
    let r := fun z=>liveRowSum χ₀ χ₁ (χ z) S H pool d hd B.val (hB B) D R ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂
    have hh := frozen_source_energy B.val (hB B) PB R hPB rfl d hd (X₁*X₂) hX ν Wslot P M
      hP hν hWnorm hM lo hi hlo hW r keep Φ K E hE (by
        have hfun := funext (fun z=>live_eq_source χ₀ χ₁ (χ z) S H pool d hd D R B.val
          (hB B) ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂)
        dsimp only [r]
        rw [hfun]
        exact hsource B hact)
    apply hh.trans
    apply mul_le_mul_of_nonneg_right _ (div_nonneg hE (pairNorm_pos hd.1 hd.2).le)
    have hnormD : 0<(D.absNorm:ℝ) := by
      exact_mod_cast Nat.pos_of_ne_zero (Ideal.absNorm_eq_zero_iff.not.mpr hD.ne_zero)
    exact div_le_div_of_nonneg_left hF hnormD hnorm
  rw [hrew]
  have hsum := radial_active_family active phase f (fun _=>L) keep Φ K radial hK hs hΦ hphase hz hf
  apply hsum.trans
  calc
    _ ≤ (Fintype.card labels:ℝ)*∑_B : labels,L := by
      apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg _)
      apply Finset.sum_le_sum
      intro B _
      split_ifs <;> first | exact le_rfl | exact hL
    _ = (labels.card:ℝ)^2*L := by simp only [Finset.sum_const,Finset.card_univ,Fintype.card_coe,nsmul_eq_mul]; ring
    _ ≤ _ := by
      apply (mul_le_mul_of_nonneg_right (hcount T D hD.ne_zero) hL).trans_eq
      dsimp only [L,F];ring

end
end ContinuumLocalReturn.AsymmetricRayPaid
#print axioms ContinuumLocalReturn.AsymmetricRayPaid.allocated_to_source
