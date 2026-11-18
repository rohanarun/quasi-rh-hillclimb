/- Adapted from Sil, MixedCommonCoefficient.lean, copyright 2026 Sil, Apache-2.0.
   Adaptations also use MixedArtificialRestriction, MixedFrozenSource and MixedLiteralAllocation.
   This version inserts separate multiplicative weights on the two ordinary ideals.
   In particular it applies to fixed ray characters with their natural zeros.
   Written with assistance from OpenAI Codex. -/
import Submissions.sil_density_split_20261026.CubeFree.FP.MixedLiteralAllocation

set_option autoImplicit false
namespace ContinuumLocalReturn.AsymmetricRayColumn
noncomputable section
open scoped Classical BigOperators
open QRH.SilDensitySplit.CubeFree.FP
open Candidate.FourthPower
open OAI OAI.SevenEighths
open CenteredMomentAddedZeroUniform CenteredMomentCommonProfile
open CenteredMomentCommonAllocationSum CenteredMomentCommonAllocationBox CenteredMomentCommonPrimeSlots
open CenteredMomentSourceLiveAllocation CenteredMomentSourceLiveColumn
open CenteredMomentSourceProfileMass CenteredMomentSourceMass
open QRH.Record1252270103KernelMass CanonicalQuadraticSieve
open CenteredMomentDivisorAllocation CenteredMomentDivisorExtraction
open MixedCommonAllocation MixedCommonCoefficient MixedCommonRestriction MixedFixedSupport
open MixedArtificialRestriction MixedLiteralAllocation MixedLiveNormalization
open HeckeFamily CenteredMomentFirstSectors CenteredMomentSourceRectangle MixedTupleRows MixedCompletedRows
local notation "Id" => Ideal ActualEisensteinCubic.O
variable {ι : Type*} [Fintype ι]
local instance : DecidableEq (ι⊕Fin 2) := Classical.decEq _

def rayWeight {α : Type*} (χ₀ χ₁ : Id →* ℂ) (v : Tuple α) : ℂ :=
  χ₀ (v (Sum.inr 0)) * χ₁ (v (Sum.inr 1))

private theorem ray_split {α : Type*} [Fintype α] (χ₀ χ₁ : Id →* ℂ) (B u : Tuple α) :
    rayWeight χ₀ χ₁ (fun j => B j * u j) =
      rayWeight χ₀ χ₁ B * rayWeight χ₀ χ₁ (remainingTuple B u) := by
  change χ₀ (_ * _) * χ₁ (_ * _) = (χ₀ (B (.inr 0)) * χ₁ (B (.inr 1))) * (χ₀ (u (.inr 0)) * χ₁ (u (.inr 1)))
  simp only [map_mul]
  ring

theorem residual_column (χ₀ χ₁ : Id →* ℂ) (H : Id) (S : (ι⊕Fin 2)→Finset Id)
    (hS : ∀j,∀I∈S j,I≠0) (hp : ∀i,∀I∈S (Sum.inl i),Prime I)
    (C R s a : Id) (hC : C≠0) (hsC : s∣C) (B : actualAllocations S C)
    (ν : ι→Id→ℂ) (Wslot : ι→ℝ→ℂ) (P : ι→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (B₁ B₂ : Id) :
    (∑u∈residualBoxes S C B.val
        (allocation_data S C B.val (Finset.mem_filter.mp B.property).1).1,
      if finiteTupleProduct u=a then
        (rayWeight χ₀ χ₁ (fun j=>B.val j*u j) * tupleWeight H (fun j=>B.val j*u j))*
          profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ s (fun j=>B.val j*u j)
      else 0)=
      ((rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*frozenCoefficient B.val C R ν Wslot P)*
        finiteColumnCoefficient
          (liveBox S B.val (allocation_data S C B.val (Finset.mem_filter.mp B.property).1).1)
          (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val C R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v) a := by
  let hB := (allocation_data S C B.val (Finset.mem_filter.mp B.property).1).1
  let F := fun v : Tuple (liveIndices B.val)=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*
    (if finiteTupleProduct v=a then 1 else 0)
  have hh := residual_source_profile S hp B.val hB C R s
    (Finset.mem_filter.mp B.property).2 hsC ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ F
  rw [ite_eq_left (allocation_frozen_gate S hp C B.val (Finset.mem_filter.mp B.property).1)] at hh
  have hcol : (∑u∈residualBoxes S C B.val hB,
      profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ s (fun j=>B.val j*u j)*
        F (remainingTuple B.val u))=
      frozenCoefficient B.val C R ν Wslot P*
        finiteColumnCoefficient (liveBox S B.val hB)
          (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val C R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v) a := by
    apply hh.trans
    unfold frozenCoefficient finiteColumnCoefficient liveBox liveProfile
    rw [Finset.sum_filter]
    congr 1
    apply Finset.sum_congr
    · ext v
      simp only [Fintype.mem_piFinset]
    · intro v hv
      dsimp only [F]
      split_ifs <;> ring
  calc
    _ = (rayWeight χ₀ χ₁ B.val * frozenWeight H B.val) * (∑u∈residualBoxes S C B.val hB,
        profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ s (fun j=>B.val j*u j)*
          F (remainingTuple B.val u)) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro u hu
      have hf := actual_frozen_slots S hS C hC B.val hB
        (allocation_data S C B.val (Finset.mem_filter.mp B.property).1).2 u hu hp
      rw [ray_split, remaining_product B.val u hf,actual_weight_split H S hS C hC B u hu hp]
      dsimp only [F]
      split_ifs <;> ring
    _ = _ := by rw [hcol];ring

/-- Common extraction for a full column with two separate ordinary multipliers. -/
theorem original_column (χ₀ χ₁ : Id →* ℂ) (H : Id) (S : (ι⊕Fin 2)→Finset Id)
    (hS : ∀j,∀I∈S j,I≠0) (hp : ∀i,∀I∈S (Sum.inl i),Prime I)
    (C R s a : Id) (hC : C≠0) (ha : a≠0) (hCa : IsCoprime C a) (hsC : s∣C)
    (ν : ι→Id→ℂ) (Wslot : ι→ℝ→ℂ) (P : ι→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (B₁ B₂ : Id) :
    finiteColumnCoefficient (Fintype.piFinset S)
      (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ s v) (C*a)=
      ∑B : actualAllocations S C,
        ((rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*frozenCoefficient B.val C R ν Wslot P)*
          finiteColumnCoefficient
            (liveBox S B.val (allocation_data S C B.val (Finset.mem_filter.mp B.property).1).1)
            (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val C R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v) a := by
  have halloc := original_coefficient_allocated S hS C a hC ha hCa
    (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ s v)
  change (∑v∈Fintype.piFinset S,if finiteTupleProduct v=C*a then
    (rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ s v else 0)=_ at halloc
  change (∑v∈(Fintype.piFinset S).filter (fun v=>finiteTupleProduct v=C*a),
    (rayWeight χ₀ χ₁ v * tupleWeight H v)*profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ s v)=_
  rw [Finset.sum_filter,halloc]
  apply Finset.sum_congr rfl
  intro B hB
  exact residual_column χ₀ χ₁ H S hS hp C R s a hC hsC B ν Wslot P
    W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂

theorem allocated_sum (χ₀ χ₁ : Id →* ℂ) (H : Id) (S : (ι⊕Fin 2)→Finset Id)
    (hS : ∀j,∀I∈S j,I≠0) (hp : ∀i,∀I∈S (Sum.inl i),Prime I)
    (D F R : Id) (hF : F≠0) (hDF : D∣F)
    (a : Allocation D (Finset.univ : Finset (ι⊕Fin 2)))
    (ψ : Id→*ℂ)
    (ν : ι→Id→ℂ) (Wslot : ι→ℝ→ℂ) (P : ι→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (B₁ B₂ : Id) :
    (∑v∈Fintype.piFinset S,(rayWeight χ₀ χ₁ v * tupleWeight H v)*allocationTerm D Finset.univ v a*
      profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ 1 v*ψ (finiteTupleProduct v))=
      ∑B : boundedLabels S F,
        ((rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*allocationTerm D Finset.univ B.val a*
          frozenCoefficient B.val (finiteTupleProduct B.val) R ν Wslot P*ψ (finiteTupleProduct B.val))*
        ∑v∈liveBox S B.val (allocation_data S F B.val (Finset.mem_filter.mp B.property).1).1,
          (rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val F R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v*
            ψ (finiteTupleProduct v) := by
  let c := fun v : Tuple ι=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*allocationTerm D Finset.univ v a*
    profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ 1 v*ψ (finiteTupleProduct v)
  have hc (v) (hv : v∈Fintype.piFinset S) (hn : c v≠0) :
      SexticSieve.PowerFree 3 (finiteTupleProduct v) := by
    have hw : tupleWeight H v≠0 :=
      (mul_ne_zero_iff.mp (mul_ne_zero_iff.mp (mul_ne_zero_iff.mp (mul_ne_zero_iff.mp hn).1).1).1).2
    have hr : tupleRestriction H v := by
      by_contra hh
      exact hw (by simp only [tupleWeight,ite_eq_right hh])
    exact restricted_tuple_fifth_free H v (fun j=>hS j _ (Fintype.mem_piFinset.mp hv j))
      (fun i=>hp i _ (Fintype.mem_piFinset.mp hv (Sum.inl i))) hr
  rw [bounded_residual_sum S hS F hF c hc]
  apply Finset.sum_congr rfl
  intro B hB
  let hb := (allocation_data S F B.val (Finset.mem_filter.mp B.property).1).1
  have hh := residual_profile_at_support S hp F R B.val hb (Finset.mem_filter.mp B.property).1
    ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ (fun v=>(rayWeight χ₀ χ₁ v * tupleWeight H v)*ψ (finiteTupleProduct v))
  calc
    _ = ((rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*allocationTerm D Finset.univ B.val a*ψ (finiteTupleProduct B.val))*
        ∑u∈residualBoxes S F B.val hb,
          profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ 1 (fun j=>B.val j*u j)*
            ((rayWeight χ₀ χ₁ (remainingTuple B.val u) * tupleWeight H (remainingTuple B.val u))*ψ (finiteTupleProduct (remainingTuple B.val u))) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro u hu
      dsimp only [c]
      rw [ray_split, fixed_weight_split H S hS hp F hF B u hu,
        artificial_projector_frozen D F hDF Finset.univ a B.val u
          (fun j=>(Finset.mem_filter.mp (Fintype.mem_piFinset.mp hu j)).2)]
      have hf := actual_frozen_slots S hS F hF B.val hb
        (allocation_data S F B.val (Finset.mem_filter.mp B.property).1).2 u hu hp
      have he : finiteTupleProduct (fun j=>B.val j*u j)=
          finiteTupleProduct B.val*finiteTupleProduct (remainingTuple B.val u) := by
        rw [finiteTupleProduct,Finset.prod_mul_distrib]
        exact congrArg (fun x=>finiteTupleProduct B.val*x) (remaining_product B.val u hf)
      rw [he,map_mul]
      ring
    _ = _ := by
      rw [hh]
      have he : (∑v∈liveBox S B.val hb,
          liveProfile B.val F R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v*
            ((rayWeight χ₀ χ₁ v * tupleWeight H v)*ψ (finiteTupleProduct v)))=
          ∑v∈liveBox S B.val hb,
            (rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val F R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v*
              ψ (finiteTupleProduct v) := by
        apply Finset.sum_congr rfl
        intro v hv
        ring
      rw [he]
      ring

/-- Positive-energy transfer preserving the squared frozen coefficients.
The extracted character phase costs at most one, independently of the row.
The factor counting fixed-support labels has the proved subpower bound. -/
theorem allocated_energy (χ₀ χ₁ : Id →* ℂ) (H : Id) (S : (ι⊕Fin 2)→Finset Id)
    (hS : ∀j,∀I∈S j,I≠0) (hp : ∀i,∀I∈S (Sum.inl i),Prime I)
    (D F R : Id) (hF : F≠0) (hDF : D∣F)
    (a : Allocation D (Finset.univ : Finset (ι⊕Fin 2)))
    (ψ : Id→*ℂ) (hψ : ∀I,‖ψ I‖≤1)
    (ν : ι→Id→ℂ) (Wslot : ι→ℝ→ℂ) (P : ι→ℝ)
    (W₁ W₂ : ℝ→ℂ) (X₁ X₂ Y₁ Y₂ : ℝ) (B₁ B₂ : Id) :
    ‖∑v∈Fintype.piFinset S,(rayWeight χ₀ χ₁ v * tupleWeight H v)*allocationTerm D Finset.univ v a*
      profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ 1 v*ψ (finiteTupleProduct v)‖^2≤
      ((boundedLabels S F).card:ℝ)*∑B : boundedLabels S F,
        ‖(rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*allocationTerm D Finset.univ B.val a*
          frozenCoefficient B.val (finiteTupleProduct B.val) R ν Wslot P‖^2*
        ‖∑v∈liveBox S B.val (allocation_data S F B.val (Finset.mem_filter.mp B.property).1).1,
          (rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val F R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v*
            ψ (finiteTupleProduct v)‖^2 := by
  rw [allocated_sum χ₀ χ₁ H S hS hp D F R hF hDF a ψ
    ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂]
  let A := fun B : boundedLabels S F=>(rayWeight χ₀ χ₁ B.val * frozenWeight H B.val)*allocationTerm D Finset.univ B.val a*
    frozenCoefficient B.val (finiteTupleProduct B.val) R ν Wslot P
  let G := fun B : boundedLabels S F=>
    ∑v∈liveBox S B.val (allocation_data S F B.val (Finset.mem_filter.mp B.property).1).1,
      (rayWeight χ₀ χ₁ v * tupleWeight H v)*liveProfile B.val F R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ B₁ B₂ v*
        ψ (finiteTupleProduct v)
  have hh := CubicEisenstein.norm_sum_sq_le_card Finset.univ
    (fun B : boundedLabels S F=>A B*ψ (finiteTupleProduct B.val)*G B)
  apply hh.trans
  simp only [Finset.card_univ,Fintype.card_coe]
  apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg _)
  apply Finset.sum_le_sum
  intro B hB
  change ‖A B*ψ (finiteTupleProduct B.val)*G B‖^2≤‖A B‖^2*‖G B‖^2
  rw [norm_mul,norm_mul,mul_pow,mul_pow]
  have hc : ‖ψ (finiteTupleProduct B.val)‖^2≤1 := by
    nlinarith [hψ (finiteTupleProduct B.val),norm_nonneg (ψ (finiteTupleProduct B.val))]
  calc
    _ ≤ (‖A B‖^2*1)*‖G B‖^2 := mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_left hc (sq_nonneg _)) (sq_nonneg _)
    _ = _ := by ring

section Rows
variable {α : Type*} [Fintype α]
def liveRowSum (χ₀ χ₁ : Id →* ℂ) (χ : Character) (S H : Finset PrimeIdeal) (pool : α→Finset Id)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (B : Tuple α) (hB : ∀j,B j≠0) (F R : Id)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) : ℂ :=
  ∑v∈liveBox (pools pool (residualPool d.1 hd.1 (plainSupportPool b X₁ Y₁))
      (residualPool d.2 hd.2 (plainSupportPool b X₂ Y₂))) B hB,
    (rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*
      liveProfile B F R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 v*
      idealCoeff χ (finiteTupleProduct v)

def frozenRowWithRays (χ₀ χ₁ : Id →* ℂ) (χ : Character) (S H : Finset PrimeIdeal) (pool : α→Finset Id)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (B : Tuple α) (hB : ∀j,B j≠0) (F R : Id)
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) : ℂ :=
  normalization (X₁*X₂) P*(frozenCoefficient B (finiteTupleProduct B) R ν Wslot P*
    liveRowSum χ₀ χ₁ χ S H pool d hd B hB F R ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂)

def allocatedRowWithRays (χ₀ χ₁ : Id →* ℂ) (χ : Character) (S H : Finset PrimeIdeal) (pool : α→Finset Id)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (D R : Id)
    (a : Allocation D (Finset.univ : Finset (α⊕Fin 2)))
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) : ℂ :=
  normalization (X₁*X₂) P*
    ∑v∈Fintype.piFinset (sourcePools pool d hd b X₁ X₂ Y₁ Y₂),
      (rayWeight χ₀ χ₁ v * tupleWeight (punctureProduct S H) v)*allocationTerm D Finset.univ v a*
        profileCoefficient R ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2 1 v*
        idealCoeff χ (finiteTupleProduct v)

/-- The analytic family consists of the literal original source after
the already proved fixed-support expansion, with its signs intact. -/
theorem allocated_row_identity (χ₀ χ₁ : Id →* ℂ) (χ : Character) (S H : Finset PrimeIdeal)
    (pool : α→Finset Id) (hp : ∀i,∀I∈pool i,Prime I)
    (d : Id×Id) (hd : d.1≠0 ∧ d.2≠0) (D F R : Id) (hF : F≠0) (hDF : D∣F)
    (a : Allocation D (Finset.univ : Finset (α⊕Fin 2)))
    (ν : α→Id→ℂ) (Wslot : α→ℝ→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) :
    allocatedRowWithRays χ₀ χ₁ χ S H pool d hd D R a ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂=
      ∑B : boundedLabels (sourcePools pool d hd b X₁ X₂ Y₁ Y₂) F,
        ((rayWeight χ₀ χ₁ B.val * frozenWeight (punctureProduct S H) B.val)*allocationTerm D Finset.univ B.val a*
          idealCoeff χ (finiteTupleProduct B.val))*
        frozenRowWithRays χ₀ χ₁ χ S H pool d hd B.val
          (allocation_data _ F B.val (Finset.mem_filter.mp B.property).1).1 F R
          ν Wslot P W₁ W₂ b X₁ X₂ Y₁ Y₂ := by
  let T := sourcePools pool d hd b X₁ X₂ Y₁ Y₂
  have he := allocated_sum χ₀ χ₁ (punctureProduct S H) T
    (source_pools_nonzero pool hp d hd b X₁ X₂ Y₁ Y₂)
    (fun i I hI=>hp i I hI) D F R hF hDF a (idealCoeff χ).toMonoidHom
    ν Wslot P W₁ W₂ X₁ X₂ Y₁ Y₂ d.1 d.2
  apply (congrArg (fun x : ℂ=>normalization (X₁*X₂) P*x) he).trans
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro B hB
  unfold frozenRowWithRays liveRowSum
  dsimp only [T,sourcePools]
  have hψ (I : Id) : (idealCoeff χ).toMonoidHom I=idealCoeff χ I := rfl
  simp only [hψ]
  ring

end Rows

end
end ContinuumLocalReturn.AsymmetricRayColumn

#print axioms ContinuumLocalReturn.AsymmetricRayColumn.residual_column
#print axioms ContinuumLocalReturn.AsymmetricRayColumn.original_column
#print axioms ContinuumLocalReturn.AsymmetricRayColumn.allocated_sum
#print axioms ContinuumLocalReturn.AsymmetricRayColumn.allocated_energy
#print axioms ContinuumLocalReturn.AsymmetricRayColumn.allocated_row_identity
