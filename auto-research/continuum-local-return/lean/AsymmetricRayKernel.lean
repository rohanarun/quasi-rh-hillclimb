/- Two fixed ordinary multipliers in Sil's marked cube-free restoration.
   Uses the native coefficient expansion, extraction normalization, and
   central absolute mass. Adapted from Sil and Collet's KernelRowProfiles,
   KernelMarkedRows, and KernelFamilyEnergy (Apache-2.0). AI assistance
   from OpenAI Codex. -/
import Submissions.sil_density_split_20261026.CubeFree.FP.RestorationComplete

set_option autoImplicit false
set_option maxHeartbeats 900000
set_option backward.isDefEq.respectTransparency false
namespace ContinuumLocalReturn.AsymmetricRayKernel
noncomputable section
open scoped Classical BigOperators
open Candidate.FourthPower
open QRH.SilDensitySplit.CubeFree.FP
open OAI OAI.SevenEighths ActualEisensteinCubic CanonicalQuadraticSieve HeckeFamily
open QRH.Record1252270103TwoIdeal QRH.Record1252270103KernelMass
open KernelFormal KernelAllocationIdentity KernelLabelledSlots KernelRowExpansion
open KernelRowProfiles KernelRowPools KernelAssignmentReindex KernelPhysicalScalars
open KernelMarkedRows KernelFamilyEnergy
local notation "Id" => Ideal ActualEisensteinCubic.O

def rays (ω₁ ω₂ : Id →* ℂ) (n : IdealPair) : ℂ := ω₁ n.1 * ω₂ n.2

theorem rays_multiply (ω₁ ω₂ : Id →* ℂ) (d a : IdealPair) :
    rays ω₁ ω₂ (multiplyPair d a) = rays ω₁ ω₂ d * rays ω₁ ω₂ a := by
  simp only [rays, multiplyPair, map_mul]
  ring

private theorem rays_norm (ω₁ ω₂ : Id →* ℂ)
    (h₁ : ∀ I, ‖ω₁ I‖ ≤ 1) (h₂ : ∀ I, ‖ω₂ I‖ ≤ 1) (d : IdealPair) :
    ‖rays ω₁ ω₂ d‖ ≤ 1 := by
  simpa only [rays, norm_mul, one_mul] using
    (mul_le_mul (h₁ d.1) (h₂ d.2) (norm_nonneg _) zero_le_one)

def rayRow (ω₁ ω₂ : Id →* ℂ) (χ : Character) (D : Finset IdealPair)
    (r : IdealPair → ℂ) (W₁ W₂ : ℝ → ℂ) (X₁ X₂ : ℝ) : ℂ :=
  normalizedRow χ D (fun n => r n*rays ω₁ ω₂ n) W₁ W₂ X₁ X₂

variable {α : Type*} [Fintype α]

private def coeff (inv : Bool) (S : Finset PrimeIdeal) (t : α → S) (d : IdealPair) : ℂ :=
  (kernelOn S (fun P => if marked S t P then markedSeriesFor inv else ordinarySeriesFor inv)
    d.1 d.2 : ℂ)

private theorem raw (inv : Bool) (S : Finset PrimeIdeal) (slot : α → S)
    (hi : Function.Injective slot) (D : Finset IdealPair)
    (hnz : ∀ n ∈ D, n.1 ≠ 0 ∧ n.2 ≠ 0)
    (hs : ∀ n ∈ D, pairSupport n.1 n.2 ⊆ primeValues S)
    (χ : Character) (f : IdealPair → ℂ) :
    (∑ n ∈ D, sourceValue inv S slot n * pairCharacter χ n * f n) =
    ∑ T : Finset α, ∑ d ∈ divisorPool D,
      coeff inv S (fun i : T => slot i.val) d * pairCharacter χ d *
        ∑ a ∈ residualPool D d, childValue inv S (fun i : {i // i ∉ T} => slot i.val) a *
          pairCharacter χ a * f (multiplyPair d a) := by
  cases inv
  · simpa only [coeff, sourceValue, childValue, markedSeriesFor, ordinarySeriesFor,
      Bool.false_eq_true, ite_false, marked_restriction, forwardFactor, one_mul] using
      forward_row_expansion S slot hi D hnz hs χ f
  · simpa only [coeff, sourceValue, childValue, markedSeriesFor, ordinarySeriesFor,
      ite_true, marked_restriction, marked_complement, inverseFactor, one_mul] using
      inverse_restricted_row S slot hi D hnz hs χ f

/-- Both inverse and forward identities at the actual normalized labelled
    row. The independent factors at the extracted ideals stay outside; each
    surviving multiplier stays on its original, shortened coordinate. -/
theorem fixed_profile (ω₁ ω₂ : Id →* ℂ) (inv : Bool) (S : Finset PrimeIdeal) (slot : α → S)
    (hi : Function.Injective slot) (D : Finset IdealPair)
    (hnz : ∀ n ∈ D, n.1 ≠ 0 ∧ n.2 ≠ 0)
    (hs : ∀ n ∈ D, pairSupport n.1 n.2 ⊆ primeValues S)
    (χ : Character) (W₁ W₂ : ℝ → ℂ) (X₁ X₂ : ℝ) (h₁ : 0 < X₁) (h₂ : 0 < X₂) :
    rayRow ω₁ ω₂ χ D (sourceValue inv S slot) W₁ W₂ X₁ X₂ =
      ∑ T : Finset α, ∑ d ∈ divisorPool D,
        (rays ω₁ ω₂ d * extraction inv S (fun i : T => slot i.val) χ d) *
          rayRow ω₁ ω₂ χ (residualPool D d)
            (childValue inv S (fun i : {i // i ∉ T} => slot i.val))
            W₁ W₂ (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2) := by
  let f (n : IdealPair) := rays ω₁ ω₂ n * pairProfile W₁ W₂ X₁ X₂ n
  have hr := raw inv S slot hi D hnz hs χ f
  calc
    _ = (Real.sqrt (X₁*X₂) : ℂ)⁻¹ *
          ∑ n ∈ D, sourceValue inv S slot n * pairCharacter χ n * f n := by
      unfold rayRow normalizedRow f
      congr 1
      apply Finset.sum_congr rfl
      intro n _
      ring
    _ = _ := by
      rw [hr]
      simp only [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro T _
      apply Finset.sum_congr rfl
      intro d hd
      let r := childValue inv S (fun i : {i // i ∉ T} => slot i.val)
      let k := coeff inv S (fun i : T => slot i.val)
      have he := normalized_extraction χ d (divisorPool_nonzero D hnz hd) (residualPool D d)
        k (fun a => r a*rays ω₁ ω₂ a) W₁ W₂ X₁ X₂ h₁ h₂
      change _ = (rays ω₁ ω₂ d * extractedScalar χ k d) *
        normalizedRow χ (residualPool D d) (fun a => r a*rays ω₁ ω₂ a) W₁ W₂ _ _
      rw [mul_assoc, ← he]
      dsimp only [f, k, r]
      simp only [rays_multiply, Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro a _
      ring

/-- The whole injective marked family, with all remaining cross-distinctness
    constraints, in the same finite assignment form as the native kernel. -/
theorem family_expansion (ω₁ ω₂ : Id →* ℂ) (inv : Bool) (S : Finset PrimeIdeal)
    (a : α → S → ℂ) (D : Finset IdealPair)
    (hnz : ∀ n ∈ D, n.1 ≠ 0 ∧ n.2 ≠ 0)
    (hs : ∀ n ∈ D, pairSupport n.1 n.2 ⊆ primeValues S)
    (χ : Character) (W₁ W₂ : ℝ → ℂ) (X₁ X₂ : ℝ) (h₁ : 0 < X₁) (h₂ : 0 < X₂) :
    weightedSum a (fun slot => rayRow ω₁ ω₂ χ D (sourceValue inv S slot) W₁ W₂ X₁ X₂) =
      ∑ T : Finset α, ∑ t : T → S, if Function.Injective t then ∑ d ∈ divisorPool D,
        ((rays ω₁ ω₂ d*extraction inv S t χ d) * ∏ i : T, a i.val (t i)) *
        remainingSum T a t (fun s => rayRow ω₁ ω₂ χ (residualPool D d)
          (childValue inv S s) W₁ W₂ (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2)) else 0 := by
  calc
    _ = weightedSum a (fun slot => ∑ T : Finset α, ∑ d ∈ divisorPool D,
        (rays ω₁ ω₂ d*extraction inv S (fun i : T => slot i.val) χ d) *
        rayRow ω₁ ω₂ χ (residualPool D d)
          (childValue inv S (fun i : {i // i ∉ T} => slot i.val)) W₁ W₂
          (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2)) := by
      unfold weightedSum
      apply Finset.sum_congr rfl
      intro slot _
      by_cases hi : Function.Injective slot
      · simp only [hi, ite_true]
        rw [fixed_profile ω₁ ω₂ inv S slot hi D hnz hs χ W₁ W₂ X₁ X₂ h₁ h₂]
      · simp [hi]
    _ = _ := by
      rw [weightedSum_sum]
      apply Finset.sum_congr rfl
      intro T _
      convert split_convolution (divisorPool D) T a (fun t d => rays ω₁ ω₂ d*extraction inv S t χ d)
        (fun d s => rayRow ω₁ ω₂ χ (residualPool D d) (childValue inv S s) W₁ W₂
          (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2)) using 1
      apply Finset.sum_congr (by ext; simp)
      intro t _
      split_ifs <;> rfl

/-- The actual supported rectangle and natural prime coefficients. Both
    coordinates are shortened separately, while the frozen ideal phases
    multiply Sil's original scalar. -/
theorem rectangle_expansion (ω₁ ω₂ : Id →* ℂ) (inv : Bool) (S : Finset PrimeIdeal)
    (χ : Character) (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ)
    (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ) (h₁ : 0 < X₁) (h₂ : 0 < X₂) :
    weightedSum (naturalCoefficients χ S pool β P) (fun slot =>
      rayRow ω₁ ω₂ χ (supportedRectangle S b X₁ X₂) (sourceValue inv S slot) W₁ W₂ X₁ X₂) =
    ∑ T : Finset α, ∑ t : T → S, if Function.Injective t then
      ∑ d ∈ divisorPool (supportedRectangle S b X₁ X₂),
        (rays ω₁ ω₂ d * scalar χ S (ordinarySeriesFor inv) (markedSeriesFor inv)
          (fun i : T => pool i.val) (fun i : T => β i.val) (fun i : T => P i.val) t d) *
        remainingSum T (naturalCoefficients χ S pool β P) t (fun s => rayRow ω₁ ω₂ χ
          (supportedRectangle S b (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2))
          (childValue inv S s) W₁ W₂ (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2)) else 0 := by
  rw [family_expansion ω₁ ω₂ inv S _ _ (fun _ h => supportedRectangle_nonzero h)
    (fun _ h => (Finset.mem_filter.mp h).2) χ W₁ W₂ X₁ X₂ h₁ h₂]
  apply Finset.sum_congr rfl
  intro T _
  apply Finset.sum_congr rfl
  intro t _
  by_cases ht : Function.Injective t
  · simp only [ht, ite_true]
    apply Finset.sum_congr rfl
    intro d hd
    rw [residual_rectangle hd]
    simp only [scalar, extraction, naturalCoefficients, mul_assoc]
  · simp [ht]

/-- Native forward and reverse scalar mass still controls a positive row
    norm with two fixed multipliers, including their zeros. -/
theorem subpower_energy (ω₁ ω₂ : Id →* ℂ) (h₁ : ∀ I, ‖ω₁ I‖ ≤ 1)
    (h₂ : ∀ I, ‖ω₂ I‖ ≤ 1) (inv : Bool) (B ε : ℝ) (hB : 0 ≤ B) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → ∀ S : Finset PrimeIdeal,
      (∀ p ∈ S, Supported p.val ∧ (Ideal.absNorm p.val : ℝ) ≤ X) →
      ∀ F : Finset (α → S), (∀ t ∈ F, Function.Injective t) →
      ∀ D : (α → S) → Finset IdealPair,
      (∀ t ∈ F, ∀ d ∈ D t, d.1 ≠ 0 ∧ d.2 ≠ 0) →
      (∀ t ∈ F, ∀ d ∈ D t, pairSupport d.1 d.2 ⊆ primeValues S) →
      ∀ {Row : Type*} (rows : Finset Row) (ρ : Row → ℝ) (χ : Row → Character)
        (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ),
      (∀ i, 0 < P i) →
      (∀ i I, I ∈ pool i → Supported I ∧ (Ideal.absNorm I : ℝ) ≤ 2*P i) →
      (∀ i I, I ∈ pool i → ‖β i I‖ ≤ B) →
      ∀ G : (α → S) → IdealPair → Row → ℂ, ∀ E : ℝ, 0 ≤ E →
      (∀ u ∈ rows, 0 ≤ ρ u) →
      (∀ t ∈ F, ∀ d ∈ D t, (∑ u ∈ rows, ρ u*‖G t d u‖^2) ≤ E) →
      (∑ u ∈ rows, ρ u*‖∑ t ∈ F, ∑ d ∈ D t,
        (rays ω₁ ω₂ d*scalar (χ u) S (ordinarySeriesFor inv) (markedSeriesFor inv)
          pool β P t d)*G t d u‖^2) ≤ C*X^ε*E := by
  obtain ⟨C,hC,hbound⟩ := actual_subpower_energy (α := α) inv B ε hB hε
  refine ⟨C,hC,?_⟩
  intro X hX S hS F hi D hn hd Row rows ρ χ pool β P hP hp hβ G E hE hρ hG
  have hr (t : α → S) (ht : t ∈ F) (d : IdealPair) (hd' : d ∈ D t) :
      (∑ u ∈ rows, ρ u*‖rays ω₁ ω₂ d * G t d u‖^2) ≤ E := by
    apply le_trans _ (hG t ht d hd')
    apply Finset.sum_le_sum
    intro u hu
    apply mul_le_mul_of_nonneg_left _ (hρ u hu)
    apply pow_le_pow_left₀ (norm_nonneg _) _ 2
    rw [norm_mul]
    exact mul_le_of_le_one_left (norm_nonneg _) (rays_norm ω₁ ω₂ h₁ h₂ d)
  have he := hbound X hX S hS F hi D hn hd rows ρ χ pool β P hP hp hβ
    (fun t d u => rays ω₁ ω₂ d * G t d u) E hE hρ hr
  simpa only [mul_assoc, mul_left_comm, mul_comm] using he


open RestorationFamily RestorationInverseEnergy RestorationCollisionEnergy
open KernelCollisionEnergy KernelCollisionMass KernelNaturalSlots ReferencePrimeEnclosure
open OAI.SevenEighths.Record12518109GainDeletion

/-- The decorated injective family at a full supported rectangle. -/
def markedRow (ω₁ ω₂ : Id →* ℂ) (inv : Bool) (S : Finset PrimeIdeal) (χ : Character)
    (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ)
    (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ) : ℂ :=
    weightedSum (naturalCoefficients χ S pool β P) (fun slot =>
      rayRow ω₁ ω₂ χ (supportedRectangle S b X₁ X₂) (sourceValue inv S slot) W₁ W₂ X₁ X₂)

/-- The physical prime product, allowing arbitrary overlaps among the pools. -/
def fullProduct (ω₁ ω₂ : Id →* ℂ) (S : Finset PrimeIdeal) (χ : Character)
    (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ)
    (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ) : ℂ :=
  rayRow ω₁ ω₂ χ (supportedRectangle S b X₁ X₂) (fun _ => 1) W₁ W₂ X₁ X₂ *
    ∏ i, CenteredMomentCommonMaskExpansion.naturalSlot χ (pool i) (β i) (P i)

/-- The inverse identity now identifies the positive child as another full
    decorated marked row, with the exact cross-hole mask on its prime slots. -/
theorem marked_inverse (ω₁ ω₂ : Id →* ℂ) (S : Finset PrimeIdeal) (χ : Character)
    (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ)
    (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ) (hX₁ : 0 < X₁) (hX₂ : 0 < X₂) :
    markedRow ω₁ ω₂ true S χ pool β P W₁ W₂ b X₁ X₂ =
      ∑ T : Finset α, ∑ t ∈ frozenChoices T S,
        ∑ d ∈ divisorPool (supportedRectangle S b X₁ X₂),
          (rays ω₁ ω₂ d * scalar χ S (ordinarySeriesFor true) (markedSeriesFor true)
            (fun i : T => pool i.val) (fun i : T => β i.val) (fun i : T => P i.val) t d) *
          markedRow ω₁ ω₂ false S χ (fun i : {i // i ∉ T} => pool i.val)
            (crossBeta T S t β) (fun i => P i.val) W₁ W₂ b
            (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2) := by
  rw [markedRow,rectangle_expansion ω₁ ω₂ true S χ pool β P W₁ W₂ b X₁ X₂ hX₁ hX₂]
  apply Finset.sum_congr rfl
  intro T _
  rw [frozenChoices,Finset.sum_filter]
  apply Finset.sum_congr (by ext; simp)
  intro t _
  by_cases ht : Function.Injective t
  · simp only [ht,ite_true]
    apply Finset.sum_congr rfl
    intro d _
    rw [remaining_mask]
    rfl
  · simp only [ht,ite_false]

/-- Positive inverse restoration for injective prime configurations. -/
theorem marked_inverse_energy (ω₁ ω₂ : Id →* ℂ) (hω₁ : ∀ I, ‖ω₁ I‖ ≤ 1) (hω₂ : ∀ I, ‖ω₂ I‖ ≤ 1) (B ε : ℝ) (hB : 0 ≤ B) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → ∀ S : Finset PrimeIdeal,
      (∀ Q ∈ S, Supported Q.val ∧ (Ideal.absNorm Q.val : ℝ) ≤ X) →
      ∀ {Row : Type*} (rows : Finset Row) (ρ : Row → ℝ) (χ : Row → Character)
        (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ),
      (∀ i, 0 < P i) →
      (∀ i I, I ∈ pool i → Supported I ∧ (Ideal.absNorm I : ℝ) ≤ 2*P i) →
      (∀ i I, I ∈ pool i → ‖β i I‖ ≤ B) →
      ∀ (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ E : ℝ), 0 < X₁ → 0 < X₂ → 0 ≤ E →
      (∀ u ∈ rows, 0 ≤ ρ u) →
      (∀ (T : Finset α) (t : T → S), Function.Injective t →
        ∀ Y₁ Y₂ : ℝ, 0 < Y₁ → Y₁ ≤ X₁ → 0 < Y₂ → Y₂ ≤ X₂ →
        (∑ u ∈ rows, ρ u * ‖markedRow ω₁ ω₂ false S (χ u)
          (fun i : {i // i ∉ T} => pool i.val) (crossBeta T S t β) (fun i => P i.val) W₁ W₂ b Y₁ Y₂‖^2) ≤ E) →
      (∑ u ∈ rows, ρ u * ‖markedRow ω₁ ω₂ true S (χ u) pool β P W₁ W₂ b X₁ X₂‖^2) ≤
        C*X^ε*E := by
  choose C hC hbound using fun T : Finset α =>
    subpower_energy (α:=T) ω₁ ω₂ hω₁ hω₂ true B ε hB hε
  let M := 1+∑ T : Finset α, C T
  have hM : 0 < M := by
    have hh := Finset.sum_nonneg (fun T (_ : T ∈ (Finset.univ : Finset (Finset α))) => (hC T).le)
    dsimp [M]; linarith
  have hCM (T : Finset α) : C T ≤ M := by
    have hh := Finset.single_le_sum (s:=Finset.univ) (f:=C) (fun T _ => (hC T).le) (Finset.mem_univ T)
    dsimp [M]; linarith
  refine ⟨(Fintype.card (Finset α) : ℝ)^2*M,by positivity,?_⟩
  intro X hX S hS Row rows ρ χ pool β P hP hp hβ W₁ W₂ b X₁ X₂ E hX₁ hX₂ hE hρ hroot
  let D := divisorPool (supportedRectangle S b X₁ X₂)
  let G (T : Finset α) (t : T → S) (d : Id × Id) (u : Row) :=
    markedRow ω₁ ω₂ false S (χ u) (fun i : {i // i ∉ T} => pool i.val)
      (crossBeta T S t β) (fun i => P i.val) W₁ W₂ b
      (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2)
  let F (T : Finset α) (u : Row) := ∑ t ∈ frozenChoices T S, ∑ d ∈ D,
    (rays ω₁ ω₂ d * scalar (χ u) S (ordinarySeriesFor true) (markedSeriesFor true)
      (fun i : T => pool i.val) (fun i : T => β i.val) (fun i : T => P i.val) t d) * G T t d u
  have hG (T : Finset α) (t : T → S) (ht : Function.Injective t) (d : Id × Id) (hd : d ∈ D) :
      (∑ u ∈ rows, ρ u*‖G T t d u‖^2) ≤ E := by
    have hs := divisor_supported hd
    have h₁ := shortened_positive_le hX₁ hs.1
    have h₂ := shortened_positive_le hX₂ hs.2.1
    exact hroot T t ht _ _ h₁.1 h₁.2 h₂.1 h₂.2
  have hF (T : Finset α) : (∑ u ∈ rows, ρ u*‖F T u‖^2) ≤ M*X^ε*E := by
    have hh := hbound T X hX S hS (frozenChoices T S)
      (fun t ht => (Finset.mem_filter.mp ht).2) (fun _ => D)
      (fun _ _ d hd => ⟨(divisor_supported hd).1,(divisor_supported hd).2.1⟩)
      (fun _ _ d hd => (divisor_supported hd).2.2)
      rows ρ χ (fun i : T => pool i.val) (fun i : T => β i.val) (fun i : T => P i.val)
      (fun i => hP i.val) (fun i => hp i.val) (fun i => hβ i.val)
      (G T) E hE hρ (fun t ht d hd => hG T t (Finset.mem_filter.mp ht).2 d hd)
    exact hh.trans (mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right (hCM T) (Real.rpow_nonneg (zero_le_one.trans hX) _)) hE)
  have hid (u : Row) : markedRow ω₁ ω₂ true S (χ u) pool β P W₁ W₂ b X₁ X₂ = ∑ T : Finset α, F T u := by
    exact marked_inverse ω₁ ω₂ S (χ u) pool β P W₁ W₂ b X₁ X₂ hX₁ hX₂
  simp_rw [hid]
  have hh := KernelCollisionEnergy.weighted_physical_energy rows ρ F F (fun _ => 1)
    (M*X^ε*E) hρ (fun _ => zero_le_one) (by intros; simp) hF
  simpa only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,mul_one,
    mul_assoc] using hh

private theorem unrestricted (ω₁ ω₂ : Id →* ℂ) (S : Finset PrimeIdeal) (χ : Character)
    (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ)
    (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ) :
    markedRow ω₁ ω₂ true S χ pool β P W₁ W₂ b X₁ X₂ =
      rayRow ω₁ ω₂ χ (supportedRectangle S b X₁ X₂) (fun _ => 1) W₁ W₂ X₁ X₂ *
        OAI.SevenEighths.Record12518109GainDeletion.injectiveTuplePolynomial
          (naturalCoefficients χ S pool β P) := by
  unfold markedRow weightedSum OAI.SevenEighths.Record12518109GainDeletion.injectiveTuplePolynomial
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro s _
  by_cases h : Function.Injective s <;> simp only [h,ite_true,ite_false,mul_zero,sourceValue]

private theorem collision (ω₁ ω₂ : Id →* ℂ) (r : Setoid α) (S : Finset PrimeIdeal)
    (t : {q // ¬singletonBlock r q} → S) (χ : Character)
    (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ)
    (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ) :
    markedRow ω₁ ω₂ true S χ (fun q : {q // singletonBlock r q} => pool (singletonRepresentative r q))
      (collisionBeta r S t β) (fun q => P (singletonRepresentative r q)) W₁ W₂ b X₁ X₂ =
      rayRow ω₁ ω₂ χ (supportedRectangle S b X₁ X₂) (fun _ => 1) W₁ W₂ X₁ X₂ *
        injectiveTuplePolynomial (fun q : {q // singletonBlock r q} => fun p : S =>
          if ∀ j : {q // ¬singletonBlock r q}, p ≠ t j then
            naturalCoefficients χ S pool β P (singletonRepresentative r q) p else 0) := by
  rw [unrestricted]
  congr 1
  apply congrArg injectiveTuplePolynomial
  funext q p
  exact collision_coefficient r S t χ pool β P q p

/-- Repeated prime labels are handled at their original half-power normalizations. -/
private theorem collision_energy (ω₁ ω₂ : Id →* ℂ) (B ε : ℝ) (hB : 1 ≤ B) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → ∀ S : Finset PrimeIdeal,
      (∀ Q ∈ S, Supported Q.val ∧ (Ideal.absNorm Q.val : ℝ) ≤ X) →
      ∀ {Row : Type*} (rows : Finset Row) (ρ : Row → ℝ) (χ : Row → Character)
        (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ),
      (∀ i, pool i ⊆ primeValues S) → (∀ i, 0 < P i) →
      (∀ i I, I ∈ pool i → Supported I ∧ (Ideal.absNorm I : ℝ) ≤ 2*P i) →
      (∀ i I, I ∈ pool i → ‖β i I‖ ≤ B) →
      ∀ (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ E : ℝ), 0 ≤ E →
      (∀ u ∈ rows, 0 ≤ ρ u) →
      (∀ (r : Setoid α) (t : {q // ¬singletonBlock r q} → S),
        (∑ u ∈ rows, ρ u*‖markedRow ω₁ ω₂ true S (χ u)
          (fun q : {q // singletonBlock r q} => pool (singletonRepresentative r q))
          (collisionBeta r S t β) (fun q => P (singletonRepresentative r q)) W₁ W₂ b X₁ X₂‖^2) ≤ E) →
      (∑ u ∈ rows, ρ u*‖fullProduct ω₁ ω₂ S (χ u) pool β P W₁ W₂ b X₁ X₂‖^2) ≤ C*X^ε*E := by
  let k := Fintype.card α
  let δ := ε/(2*(k : ℝ)+1)
  have hd : 0 < 2*(k : ℝ)+1 := by positivity
  have hδ : 0 < δ := div_pos hε hd
  let Q := SieveDescent.rootMass (1+δ)+1
  have hQ : 1 ≤ Q := by
    dsimp [Q]
    exact le_add_of_nonneg_left (SieveDescent.rootMass_nonneg _)
  let C := ((2 : ℝ)^(k*k)*(Q*(2*B)^k)^k)^2
  have hC : 0 < C := by dsimp [C]; positivity
  refine ⟨C,hC,?_⟩
  intro X hX S hS Row rows ρ χ pool β P hpool hP hp hβ W₁ W₂ b X₁ X₂ E hE hρ hroot
  have hX0 := zero_lt_one.trans_le hX
  have hB0 := zero_le_one.trans hB
  let L := Q*X^δ
  have hL : 1 ≤ L := one_le_mul_of_one_le_of_one_le hQ (Real.one_le_rpow hX hδ.le)
  let a (u : Row) (i : α) (p : S) := naturalCoefficients (χ u) S pool β P i p
  let D (u : Row) := rayRow ω₁ ω₂ (χ u) (supportedRectangle S b X₁ X₂) (fun _ => 1) W₁ W₂ X₁ X₂
  have he (i : α) : (∑ p : S, (centralWeight (2*B) p.val.val)^2) ≤ L*(2*B)^2 := by
    calc
      _ ≤ (2*B)^2*X^δ*SieveDescent.rootMass (1+δ) := prime_pool_energy δ (2*B) X hδ hX0 S hS
      _ ≤ (2*B)^2*X^δ*Q := mul_le_mul_of_nonneg_left
        (by dsimp [Q]; linarith) (by positivity)
      _ = _ := by dsimp [L]; ring
  have hsingle (r : Setoid α) (t : {q // ¬singletonBlock r q} → S) :
      (∑ u ∈ rows, ρ u*‖D u*injectiveTuplePolynomial
        (fun q : {q // singletonBlock r q} => fun p : S =>
          if ∀ j : {q // ¬singletonBlock r q}, p ≠ t j then
            a u (singletonRepresentative r q) p else 0)‖^2) ≤ E := by
    have hh := hroot r t
    apply (le_of_eq ?_).trans hh
    apply Finset.sum_congr rfl
    intro u _
    rw [collision]
  have hb2 : 1 ≤ 2*B := by linarith
  have hv0 (i : α) (p : S) : 0 ≤ centralWeight (2*B) p.val.val :=
    centralWeight_nonneg (2*B) (by positivity) p.val.val
  have hv (i : α) (p : S) : centralWeight (2*B) p.val.val ≤ 2*B :=
    centralWeight_le (2*B) (by positivity) p.val.val (hS p.val p.property).1
  have ha (u : Row) (_hu : u ∈ rows) (i : α) (p : S) :
      ‖a u i p‖ ≤ centralWeight (2*B) p.val.val :=
    slotTerm_bound (χ u) (pool i) (β i) (P i) B (hP i) hB0 (hp i) (hβ i) p.val.val
  have hh : (∑ u ∈ rows, ρ u*‖D u*(∏ i, ∑ p, a u i p)‖^2) ≤
      ((2 : ℝ)^(k*k)*(L*(2*B)^k)^k)^2*E := by
    exact weighted_product_energy_of_singletons (Row:=Row) (I:=α) (A:=S) rows ρ a
      (fun _i : α => fun p : S => centralWeight (2*B) p.val.val) D (2*B) L E
      hρ hb2 hL hE hv0 hv he ha k (le_refl _) (by
        intro r t
        apply (le_of_eq ?_).trans (hsingle r t)
        apply Finset.sum_congr rfl
        intro u _
        apply congrArg (fun z : ℂ => ρ u*‖D u*z‖^2)
        unfold injectiveTuplePolynomial
        apply Finset.sum_congr (by ext; simp)
        intro s _
        split_ifs
        · apply Finset.prod_congr (by ext; simp)
          intro q _
          dsimp only
          by_cases hc : ∀ j : {q // ¬singletonBlock r q}, s q ≠ t j
          · rw [ite_eq_left hc,ite_eq_left hc]
          · rw [ite_eq_right hc,ite_eq_right hc]
        · rfl)
  have hcost : ((2 : ℝ)^(k*k)*(L*(2*B)^k)^k)^2 = C*X^(δ*(k : ℝ)*2) := by
    dsimp [L,C]
    rw [show Q*X^δ*(2*B)^k = (Q*(2*B)^k)*X^δ by ring,mul_pow]
    rw [mul_pow,mul_pow]
    rw [← Real.rpow_natCast (X^δ) k,← Real.rpow_mul hX0.le,
      ← Real.rpow_natCast (X^(δ*(k : ℝ))) 2,← Real.rpow_mul hX0.le]
    ring
  have hexp : δ*(k : ℝ)*2 ≤ ε := by
    have heq := div_mul_cancel₀ ε (ne_of_gt hd)
    change δ*(2*(k : ℝ)+1)=ε at heq
    nlinarith
  rw [hcost] at hh
  have hlast := hh.trans (mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_left (Real.rpow_le_rpow_of_exponent_le hX hexp) hC.le) hE)
  unfold fullProduct
  simpa only [a, D, naturalCoefficients, sum_prime_slot _ _ _ _ _ (hpool _)] using hlast

omit [Fintype α] in
private theorem fintype_irrel (ω₁ ω₂ : Id →* ℂ) (h₁ h₂ : Fintype α) (inv : Bool) (S : Finset PrimeIdeal)
    (χ : Character) (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ)
    (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ) :
    @markedRow α h₁ ω₁ ω₂ inv S χ pool β P W₁ W₂ b X₁ X₂ =
      @markedRow α h₂ ω₁ ω₂ inv S χ pool β P W₁ W₂ b X₁ X₂ := by
  have h : h₁ = h₂ := Subsingleton.elim _ _
  cases h
  rfl

/-- Full positive root restoration to shortened cube-free rectangles, including all
    collisions and frozen slots. The required child estimates are displayed explicitly. -/
theorem full_energy (ω₁ ω₂ : Id →* ℂ) (hω₁ : ∀ I, ‖ω₁ I‖ ≤ 1) (hω₂ : ∀ I, ‖ω₂ I‖ ≤ 1) (B ε : ℝ) (hB : 1 ≤ B) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → ∀ S : Finset PrimeIdeal,
      (∀ Q ∈ S, Supported Q.val ∧ (Ideal.absNorm Q.val : ℝ) ≤ X) →
      ∀ {Row : Type*} (rows : Finset Row) (ρ : Row → ℝ) (χ : Row → Character)
        (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ),
      (∀ i, pool i ⊆ primeValues S) → (∀ i, 0 < P i) →
      (∀ i I, I ∈ pool i → Supported I ∧ (Ideal.absNorm I : ℝ) ≤ 2*P i) →
      (∀ i I, I ∈ pool i → ‖β i I‖ ≤ B) →
      ∀ (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ E : ℝ), 0 < X₁ → 0 < X₂ → 0 ≤ E →
      (∀ u ∈ rows, 0 ≤ ρ u) →
      (∀ (r : Setoid α) (tc : {q // ¬singletonBlock r q} → S)
        (T : Finset {q // singletonBlock r q}) (ti : T → S), Function.Injective ti →
        ∀ Y₁ Y₂ : ℝ, 0 < Y₁ → Y₁ ≤ X₁ → 0 < Y₂ → Y₂ ≤ X₂ →
        (∑ u ∈ rows, ρ u*‖markedRow ω₁ ω₂ false S (χ u)
          (fun q : {q : {q // singletonBlock r q} // q ∉ T} =>
            pool (singletonRepresentative r q.val))
          (crossBeta T S ti (RestorationCollisionEnergy.collisionBeta r S tc β))
          (fun q => P (singletonRepresentative r q.val)) W₁ W₂ b Y₁ Y₂‖^2) ≤ E) →
      (∑ u ∈ rows, ρ u*‖fullProduct ω₁ ω₂ S (χ u) pool β P W₁ W₂ b X₁ X₂‖^2) ≤ C*X^ε*E := by
  obtain ⟨Cc,hCc,hcollision⟩ := collision_energy (α:=α) ω₁ ω₂ B (ε/2) hB (half_pos hε)
  choose Ci hCi hinverse using fun r : Setoid α =>
    marked_inverse_energy (α:={q // singletonBlock r q}) ω₁ ω₂ hω₁ hω₂
      B (ε/2) (zero_le_one.trans hB) (half_pos hε)
  let M := 1+∑ r : Setoid α, Ci r
  have hM : 0 < M := by
    have hh := Finset.sum_nonneg (fun r (_ : r ∈ (Finset.univ : Finset (Setoid α))) => (hCi r).le)
    dsimp [M]; linarith
  have hiM (r : Setoid α) : Ci r ≤ M := by
    have hh := Finset.single_le_sum (s:=Finset.univ) (f:=Ci) (fun r _ => (hCi r).le) (Finset.mem_univ r)
    dsimp [M]; linarith
  refine ⟨Cc*M,mul_pos hCc hM,?_⟩
  intro X hX S hS Row rows ρ χ pool β P hpool hP hp hβ W₁ W₂ b X₁ X₂ E hX₁ hX₂ hE hρ hroot
  have hinj (r : Setoid α) (tc : {q // ¬singletonBlock r q} → S) :
      (∑ u ∈ rows, ρ u*‖markedRow ω₁ ω₂ true S (χ u)
        (fun q : {q // singletonBlock r q} => pool (singletonRepresentative r q))
        (RestorationCollisionEnergy.collisionBeta r S tc β)
        (fun q => P (singletonRepresentative r q)) W₁ W₂ b X₁ X₂‖^2) ≤ M*X^(ε/2)*E := by
    let β' := RestorationCollisionEnergy.collisionBeta r S tc β
    have hβ' : ∀ q I, I ∈ pool (singletonRepresentative r q) → ‖β' q I‖ ≤ B :=
      maskedBeta_bound _ _ _ B (zero_le_one.trans hB) (fun q=>hβ (singletonRepresentative r q))
    have hh := hinverse r X hX S hS rows ρ χ
      (fun q : {q // singletonBlock r q} => pool (singletonRepresentative r q)) β'
      (fun q => P (singletonRepresentative r q))
      (fun q => hP (singletonRepresentative r q))
      (fun q => hp (singletonRepresentative r q)) hβ'
      W₁ W₂ b X₁ X₂ E hX₁ hX₂ hE hρ (by
        intro T ti hti Y₁ Y₂ hY₁ hY₁le hY₂ hY₂le
        apply (le_of_eq ?_).trans (hroot r tc T ti hti Y₁ Y₂ hY₁ hY₁le hY₂ hY₂le)
        apply Finset.sum_congr rfl
        intro u _
        apply congrArg (fun z : ℂ => ρ u*‖z‖^2)
        apply fintype_irrel)
    exact hh.trans (mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right (hiM r) (Real.rpow_nonneg (zero_le_one.trans hX) _)) hE)
  have hh := hcollision X hX S hS rows ρ χ pool β P hpool hP hp hβ
    W₁ W₂ b X₁ X₂ (M*X^(ε/2)*E) (by positivity) hρ (by
      intro r tc
      apply (le_of_eq ?_).trans (hinj r tc)
      apply Finset.sum_congr rfl
      intro u _
      apply congrArg (fun z : ℂ => ρ u*‖z‖^2)
      apply fintype_irrel)
  apply hh.trans_eq
  calc
    _ = (Cc*M)*(X^(ε/2)*X^(ε/2))*E := by ring
    _ = _ := by
      rw [← Real.rpow_add (zero_lt_one.trans_le hX),show ε/2+ε/2=ε by ring]



/-- Entry from two literal Hecke polynomials at independent heights and
    with their respective fixed finite twists and zero extensions. -/
theorem physical_product (ω₁ ω₂ χ : Character) (S : Finset PrimeIdeal)
    (pool : α → Finset Id) (β : α → Id → ℂ) (P : α → ℝ) (W₁ W₂ : ℝ → ℂ)
    (b X₁ X₂ t₁ t₂ : ℝ) (h₁ : 0 < X₁) (h₂ : 0 < X₂)
    (hs₁ : Function.support W₁ ⊆ Set.Iic b) (hs₂ : Function.support W₂ ⊆ Set.Iic b)
    (hχ : ∀ I, ¬Supported I → idealCoeff χ I = 0)
    (henc : ∀ I, Supported I →
       ((Ideal.absNorm I : ℝ) ≤ b*X₁ ∨ (Ideal.absNorm I : ℝ) ≤ b*X₂) →
       primeSupport I ⊆ primeValues S) :
    fullProduct (idealCoeff ω₁).toMonoidHom (idealCoeff ω₂).toMonoidHom S χ pool β P
      (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂ =
      (HeckeDyadic.polynomial (χ.product ω₁) false W₁ X₁ 0 (2*Real.pi*t₁) *
       HeckeDyadic.polynomial (χ.product ω₂) false W₂ X₂ 0 (2*Real.pi*t₂)) *
        ∏ i, CenteredMomentCommonMaskExpansion.naturalSlot χ (pool i) (β i) (P i) := by
  have ray_apply (η : Character) (I : Id) : (idealCoeff η).toMonoidHom I = idealCoeff η I := rfl
  unfold fullProduct rayRow
  congr 1
  rw [enclosed_row χ S b X₁ X₂ _ _ _ hχ henc]
  rw [← phase_polynomial (χ.product ω₁) W₁ b X₁ t₁ h₁ hs₁,
      ← phase_polynomial (χ.product ω₂) W₂ b X₂ t₂ h₂ hs₂]
  rw [natural_polynomial_finite _ _ b X₁ h₁ ((phaseProfile_support W₁ t₁).trans hs₁),
      natural_polynomial_finite _ _ b X₂ h₂ ((phaseProfile_support W₂ t₂).trans hs₂)]
  unfold normalizedRow
  rw [Real.sqrt_mul h₁.le, Complex.ofReal_mul, mul_inv_rev]
  simp only [rectangle, Finset.sum_product, rays, pairCharacter, map_mul, pairProfile,
    idealCoeff_product, ray_apply, one_mul, Finset.mul_sum, Finset.sum_mul]
  conv_rhs => rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro I _
  apply Finset.sum_congr rfl
  intro J _
  ring

end
end ContinuumLocalReturn.AsymmetricRayKernel

#print axioms ContinuumLocalReturn.AsymmetricRayKernel.fixed_profile
#print axioms ContinuumLocalReturn.AsymmetricRayKernel.family_expansion
#print axioms ContinuumLocalReturn.AsymmetricRayKernel.rectangle_expansion
#print axioms ContinuumLocalReturn.AsymmetricRayKernel.subpower_energy

#print axioms ContinuumLocalReturn.AsymmetricRayKernel.full_energy

#print axioms ContinuumLocalReturn.AsymmetricRayKernel.physical_product
