/- Based on Sil, NativeForwardEnergy, Apache-2.0. Written with OpenAI Codex assistance. -/
import AsymmetricRayKernel
import Submissions.sil_density_split_20261026.CubeFree.Packet.Reduce.NativeForwardEnergy

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 1000000
namespace ContinuumLocalReturn.AsymmetricRayPaidForward
open ContinuumLocalReturn.AsymmetricRayKernel
open QRH.SilDensitySplit.CubeFree.FP
open Candidate.FourthPower
noncomputable section
open scoped Classical BigOperators SchwartzMap ContDiff
open Filter OAI OAI.SevenEighths HeckeFamily CanonicalQuadraticSieve
open QRH.Record1252270103TwoIdeal QRH.Record1252270103KernelMass
open KernelAssignmentReindex KernelMarkedRows KernelNaturalSlots KernelRowPools KernelRowProfiles
open KernelPhysicalScalars KernelFamilyEnergy ReferencePrimeEnclosure RestorationFamily
open RestorationInverseEnergy ReferenceForwardRows NativeRemainingEnergy NativeInjectiveEnergy
open CenteredMomentCommonMaskExpansion CenteredMomentCommonMaskEnergy
open CenteredMomentOriginalRadialComparison CenteredMomentAllocatedNaturalRadial
open CenteredMomentEnergyCapacityRemoval ConcreteTraceCRT HeckeDyadic
local notation "O" => HeckeFamily.O
local notation "Id" => Ideal O
variable {α : Type*} [Fintype α]

theorem pair_product (ξ₀ ξ₁ χ : Character) (S : Finset PrimeIdeal) (W₁ W₂ : ℝ→ℂ)
    (b X₁ X₂ t₁ t₂ : ℝ) (h₁ : 0<X₁) (h₂ : 0<X₂)
    (hs₁ : Function.support W₁⊆Set.Iic b) (hs₂ : Function.support W₂⊆Set.Iic b)
    (hχ : ∀I,¬Supported I → idealCoeff χ I=0)
    (henclose : ∀I,Supported I → ((I.absNorm:ℝ)≤b*X₁ ∨ (I.absNorm:ℝ)≤b*X₂) →
      primeSupport I⊆primeValues S) :
    rayRow (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom χ (supportedRectangle S b X₁ X₂)
      (fun _=>1) (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) X₁ X₂ =
      polynomial (χ.product ξ₀) false W₁ X₁ 0 (2*Real.pi*t₁) *
      polynomial (χ.product ξ₁) false W₂ X₂ 0 (2*Real.pi*t₂) := by
  have he : (Finset.univ : Finset Empty) = ∅ := by ext i; exact Empty.elim i
  simpa only [fullProduct,he,Finset.prod_empty,mul_one] using
    physical_product (α:=Empty) ξ₀ ξ₁ χ S (fun i=>nomatch i) (fun i=>nomatch i)
      (fun i=>nomatch i) W₁ W₂ b X₁ X₂ t₁ t₂ h₁ h₂ hs₁ hs₂ hχ henclose

theorem literal_forward_expansion (ξ₀ ξ₁ : Character) (S : Finset PrimeIdeal) (χ : Character)
    (pool : α→Finset Id) (β : α→Id→ℂ) (P : α→ℝ)
    (W₁ W₂ : ℝ→ℂ) (b X₁ X₂ t₁ t₂ : ℝ)
    (hb : 0≤b) (hX₁ : 0<X₁) (hX₂ : 0<X₂)
    (hW₁ : Function.support W₁⊆Set.Iic b) (hW₂ : Function.support W₂⊆Set.Iic b)
    (hχ : ∀I,¬Supported I → idealCoeff χ I=0)
    (henclose : ∀I,Supported I →
      ((I.absNorm:ℝ)≤b*X₁ ∨ (I.absNorm:ℝ)≤b*X₂) → primeSupport I⊆primeValues S) :
    markedRow (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom false S χ pool β P (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂=
      ∑T : Finset α,∑frozen∈frozenChoices T S,∑d∈divisorPool (supportedRectangle S b X₁ X₂),
        (rays (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom d * scalar χ S (ordinarySeriesFor false) (markedSeriesFor false)
          (fun i : T=>pool i.val) (fun i : T=>β i.val) (fun i : T=>P i.val) frozen d) *
          (polynomial (χ.product ξ₀) false W₁ (X₁/(d.1.absNorm:ℝ)) 0 (2*Real.pi*t₁)*
            polynomial (χ.product ξ₁) false W₂ (X₂/(d.2.absNorm:ℝ)) 0 (2*Real.pi*t₂)*
            remainingSum T (naturalCoefficients χ S pool β P) frozen (fun _=>1)) := by
  rw [markedRow,rectangle_expansion (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom false S χ pool β P _ _ b X₁ X₂ hX₁ hX₂]
  apply Finset.sum_congr rfl
  intro T _
  rw [frozenChoices,Finset.sum_filter]
  apply Finset.sum_congr (by ext; simp)
  intro frozen _
  by_cases hinj : Function.Injective frozen
  · simp only [hinj,ite_true]
    apply Finset.sum_congr rfl
    intro d hd
    have hd0 := divisor_supported hd
    have h₁ := shortened_positive_le hX₁ hd0.1
    have h₂ := shortened_positive_le hX₂ hd0.2.1
    have hrow := pair_product ξ₀ ξ₁ χ S W₁ W₂ b
      (X₁/(d.1.absNorm:ℝ)) (X₂/(d.2.absNorm:ℝ)) t₁ t₂ h₁.1 h₂.1 hW₁ hW₂ hχ (by
        intro I hI hlen
        apply henclose I hI
        exact hlen.elim
          (fun h=>Or.inl (h.trans (mul_le_mul_of_nonneg_left h₁.2 hb)))
          (fun h=>Or.inr (h.trans (mul_le_mul_of_nonneg_left h₂.2 hb))))
    simp only [childValue,Bool.false_eq_true,ite_false]
    rw [remaining_constant,hrow]
  · simp only [hinj,ite_false]

/-- The scalar mass is summed before the physical norm. The number of
prime assignments is absent from the bound. The remaining energy premise
names exactly the canonical child family established separately. -/
theorem finite_forward_energy (ξ₀ ξ₁ : Character) (B ε : ℝ) (hB : 0≤B) (hε : 0<ε) :
    ∃C : ℝ,0<C ∧ ∀X : ℝ,1≤X → ∀S : Finset PrimeIdeal,
      (∀Q∈S,Supported Q.val ∧ (Q.val.absNorm:ℝ)≤X) →
    ∀{Row : Type*}(rows : Finset Row)(ρ : Row→ℝ)(χ : Row→Character)
      (pool : α→Finset Id)(β : α→Id→ℂ)(P : α→ℝ),
      (∀i,0<P i) → (∀i I,I∈pool i → Supported I ∧ (I.absNorm:ℝ)≤2*P i) →
      (∀i I,I∈pool i → ‖β i I‖≤B) →
    ∀(W₁ W₂ : ℝ→ℂ)(b X₁ X₂ t₁ t₂ E : ℝ),0≤b → 0<X₁ → 0<X₂ → 0≤E →
      Function.support W₁⊆Set.Iic b → Function.support W₂⊆Set.Iic b →
      (∀u∈rows,0≤ρ u) → (∀u∈rows,∀I,¬Supported I → idealCoeff (χ u) I=0) →
      (∀I,Supported I → ((I.absNorm:ℝ)≤b*X₁ ∨ (I.absNorm:ℝ)≤b*X₂) →
        primeSupport I⊆primeValues S) →
      (∀(T : Finset α)(frozen : T→S),Function.Injective frozen →
        ∀d∈divisorPool (supportedRectangle S b X₁ X₂),
          (∑u∈rows,ρ u*‖polynomial ((χ u).product ξ₀) false W₁ (X₁/(d.1.absNorm:ℝ)) 0 (2*Real.pi*t₁)*
            polynomial ((χ u).product ξ₁) false W₂ (X₂/(d.2.absNorm:ℝ)) 0 (2*Real.pi*t₂)*
            remainingSum T (naturalCoefficients (χ u) S pool β P) frozen (fun _=>1)‖^2)≤E) →
      (∑u∈rows,ρ u*‖markedRow (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom false S (χ u) pool β P
        (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂‖^2)≤C*X^ε*E := by
  choose CT hCT hbound using fun T : Finset α=>
    subpower_energy (α:=T) (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom
      (idealCoeff_norm_le_one ξ₀) (idealCoeff_norm_le_one ξ₁) false B ε hB hε
  let C := 1+∑T : Finset α,CT T
  have hC : 0<C := by
    have hh := Finset.sum_nonneg (fun T (_ : T∈(Finset.univ : Finset (Finset α)))=>(hCT T).le)
    dsimp [C]
    linarith
  have hCTC (T : Finset α) : CT T≤C := by
    have hh := Finset.single_le_sum (s:=Finset.univ) (f:=CT)
      (fun T _=>(hCT T).le) (Finset.mem_univ T)
    dsimp [C]
    linarith
  refine ⟨(Fintype.card (Finset α):ℝ)^2*C,by positivity,?_⟩
  intro X hX S hS Row rows ρ χ pool β P hP hp hβ W₁ W₂ b X₁ X₂ t₁ t₂ E
    hb hX₁ hX₂ hE hW₁ hW₂ hρ hχ henclose hchildren
  let D := divisorPool (supportedRectangle S b X₁ X₂)
  let G (T : Finset α) (frozen : T→S) (d : Id×Id) (u : Row) :=
    polynomial ((χ u).product ξ₀) false W₁ (X₁/(d.1.absNorm:ℝ)) 0 (2*Real.pi*t₁)*
      polynomial ((χ u).product ξ₁) false W₂ (X₂/(d.2.absNorm:ℝ)) 0 (2*Real.pi*t₂)*
      remainingSum T (naturalCoefficients (χ u) S pool β P) frozen (fun _=>1)
  let F (T : Finset α) (u : Row) := ∑frozen∈frozenChoices T S,∑d∈D,
    (rays (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom d * scalar (χ u) S (ordinarySeriesFor false) (markedSeriesFor false)
      (fun i : T=>pool i.val) (fun i : T=>β i.val) (fun i : T=>P i.val) frozen d) * G T frozen d u
  have hF (T : Finset α) : (∑u∈rows,ρ u*‖F T u‖^2)≤C*X^ε*E := by
    have hh := hbound T X hX S hS (frozenChoices T S)
      (fun t ht=>(Finset.mem_filter.mp ht).2) (fun _=>D)
      (fun _ _ d hd=>⟨(divisor_supported hd).1,(divisor_supported hd).2.1⟩)
      (fun _ _ d hd=>(divisor_supported hd).2.2)
      rows ρ χ (fun i : T=>pool i.val) (fun i : T=>β i.val) (fun i : T=>P i.val)
      (fun i=>hP i.val) (fun i=>hp i.val) (fun i=>hβ i.val) (G T) E hE hρ
      (fun t ht d hd=>hchildren T t (Finset.mem_filter.mp ht).2 d hd)
    exact hh.trans (mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right (hCTC T) (Real.rpow_nonneg (zero_le_one.trans hX) _)) hE)
  have hid (u : Row) (hu : u∈rows) : markedRow (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom false S (χ u) pool β P
      (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂=∑T : Finset α,F T u :=
    literal_forward_expansion ξ₀ ξ₁ S (χ u) pool β P W₁ W₂ b X₁ X₂ t₁ t₂
      hb hX₁ hX₂ hW₁ hW₂ (hχ u hu) henclose
  have hh := KernelCollisionEnergy.weighted_physical_energy rows ρ F F (fun _=>1)
    (C*X^ε*E) hρ (fun _=>zero_le_one) (by intros; simp) hF
  calc
    _ = ∑u∈rows,ρ u*‖∑T : Finset α,F T u‖^2 := by
      apply Finset.sum_congr rfl
      intro u hu
      rw [hid u hu]
    _ ≤ _ := by
      simpa only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,mul_one,mul_assoc] using hh

/-- Compact radial summation preserves the finite positive-norm estimate.
Off-support character vanishing is required only on retained physical rows. -/
theorem radial_forward_energy (ξ₀ ξ₁ : Character) (B ε : ℝ) (hB : 0≤B) (hε : 0<ε) :
    ∃C : ℝ,0<C ∧ ∀X : ℝ,1≤X → ∀S : Finset PrimeIdeal,
      (∀Q∈S,Supported Q.val ∧ (Q.val.absNorm:ℝ)≤X) →
    ∀(χ : O→Character)(pool : α→Finset Id)(β : α→Id→ℂ)(P : α→ℝ),
      (∀i,0<P i) → (∀i I,I∈pool i → Supported I ∧ (I.absNorm:ℝ)≤2*P i) →
      (∀i I,I∈pool i → ‖β i I‖≤B) →
    ∀(W₁ W₂ : ℝ→ℂ)(b X₁ X₂ t₁ t₂ E : ℝ),0≤b → 0<X₁ → 0<X₂ → 0≤E →
      Function.support W₁⊆Set.Iic b → Function.support W₂⊆Set.Iic b →
    ∀(keep : O→Prop)(Φ : 𝓢(ℝ,ℂ))(K radial : ℝ),0<K →
      Function.support (Φ:ℝ→ℂ)⊆Set.Iic radial →
      (∀z,0≤(Φ (‖eisEmbedding z‖^2/K)).re) →
      (∀z,keep z → ∀I,¬Supported I → idealCoeff (χ z) I=0) →
      (∀I,Supported I → ((I.absNorm:ℝ)≤b*X₁ ∨ (I.absNorm:ℝ)≤b*X₂) →
        primeSupport I⊆primeValues S) →
      (∀(T : Finset α)(frozen : T→S),Function.Injective frozen →
        ∀d∈divisorPool (supportedRectangle S b X₁ X₂),
          radialEnergy (fun z=>polynomial ((χ z).product ξ₀) false W₁ (X₁/(d.1.absNorm:ℝ)) 0 (2*Real.pi*t₁)*
            polynomial ((χ z).product ξ₁) false W₂ (X₂/(d.2.absNorm:ℝ)) 0 (2*Real.pi*t₂)*
            remainingSum T (naturalCoefficients (χ z) S pool β P) frozen (fun _=>1)) keep Φ K≤E) →
      radialEnergy (fun z=>markedRow (idealCoeff ξ₀).toMonoidHom (idealCoeff ξ₁).toMonoidHom false S (χ z) pool β P
        (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂) keep Φ K≤C*X^ε*E := by
  obtain ⟨C,hC,hfinite⟩ := finite_forward_energy (α:=α) ξ₀ ξ₁ B ε hB hε
  refine ⟨C,hC,?_⟩
  intro X hX S hS χ pool β P hP hp hβ W₁ W₂ b X₁ X₂ t₁ t₂ E
    hb hX₁ hX₂ hE hW₁ hW₂ keep Φ K radial hK hs hΦ hχ henclose hchildren
  unfold radialEnergy
  apply Real.tsum_le_of_sum_le (fun z=>by
    split_ifs; exact mul_nonneg (sq_nonneg _) (hΦ z); exact le_rfl)
  intro rows
  let rows' := rows.filter keep
  let ρ (z : O) := (Φ (‖eisEmbedding z‖^2/K)).re
  have hchild (T : Finset α) (frozen : T→S) (hf : Function.Injective frozen)
      (d : Id×Id) (hd : d∈divisorPool (supportedRectangle S b X₁ X₂)) :
      (∑z∈rows',ρ z*‖polynomial ((χ z).product ξ₀) false W₁ (X₁/(d.1.absNorm:ℝ)) 0 (2*Real.pi*t₁)*
        polynomial ((χ z).product ξ₁) false W₂ (X₂/(d.2.absNorm:ℝ)) 0 (2*Real.pi*t₂)*
        remainingSum T (naturalCoefficients (χ z) S pool β P) frozen (fun _=>1)‖^2)≤E := by
    let G (z : O) := polynomial ((χ z).product ξ₀) false W₁ (X₁/(d.1.absNorm:ℝ)) 0 (2*Real.pi*t₁)*
      polynomial ((χ z).product ξ₁) false W₂ (X₂/(d.2.absNorm:ℝ)) 0 (2*Real.pi*t₂)*
      remainingSum T (naturalCoefficients (χ z) S pool β P) frozen (fun _=>1)
    have hsum := compact_radial_summable G keep Φ K radial hK hs
    have hh := hsum.sum_le_tsum rows' (fun z _=>by
      split_ifs; exact mul_nonneg (sq_nonneg _) (hΦ z); exact le_rfl)
    apply (le_of_eq ?_).trans (hh.trans (hchildren T frozen hf d hd))
    apply Finset.sum_congr rfl
    intro z hz
    have hk := (Finset.mem_filter.mp hz).2
    simp only [hk,ite_true]
    change ρ z*‖G z‖^2=‖G z‖^2*ρ z
    ring
  have hh := hfinite X hX S hS rows' ρ χ pool β P hP hp hβ W₁ W₂ b X₁ X₂ t₁ t₂ E
    hb hX₁ hX₂ hE hW₁ hW₂ (fun z _=>hΦ z)
    (fun z hz=>hχ z (Finset.mem_filter.mp hz).2) henclose hchild
  apply (le_of_eq ?_).trans hh
  rw [Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro z _
  by_cases hk : keep z <;> simp only [hk,ite_true,ite_false]
  change ‖_‖^2*ρ z=ρ z*‖_‖^2
  ring


end
end ContinuumLocalReturn.AsymmetricRayPaidForward
#print axioms ContinuumLocalReturn.AsymmetricRayPaidForward.radial_forward_energy
