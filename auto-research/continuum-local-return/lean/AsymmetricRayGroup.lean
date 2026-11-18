/- Copyright (c) 2026 Sil. Apache-2.0.
   Adapted with OpenAI Codex assistance from the two-coordinate separation and
   one-scale grouping in CubeFree/Packet/{ProfileSeparation,GroupedRows,GroupedClass},
   tracker c74d855c3bdfceeee059501aea76c8b1627b9abd.
   The ordinary factors carry independently chosen fixed finite characters; the
   prime slots, shared row symbol and both central normalizations are literal.
   The intended analytic application assumes the preprint's 7/8 theorem. -/
import Submissions.sil_density_split_20261026.CubeFree.Packet.GroupedClass
import Submissions.openai_baseline.OAI.NumberTheory.DirichletL.Hecke.IdealOperations

set_option autoImplicit false

namespace ContinuumLocalReturn.AsymmetricRayGroup
noncomputable section
open scoped Classical BigOperators SchwartzMap FourierTransform
open MeasureTheory
open OAI OAI.SevenEighths HeckeFamily CanonicalRowCompletion ConcreteTraceCRT
open CenteredMomentHeckeHeight CenteredMomentHeckeSlots CenteredMomentRetainedEnergy
open CenteredMomentInductionEnergy CenteredMomentFirstAmplificationChoice
open QRH.SilDensitySplit QRH.SilDensitySplit.CubeFree.Packet
open ProfileSeparation Grouped
local notation "O" => HeckeFamily.O
variable {ι : Type*} [Fintype ι]

/-- A ray multiplier acts inside each ideal sum, including all its natural zeros. -/
theorem rowTwistedSum_ray (η ω : Character) (m A z : O) (W : ℝ → ℂ) (t X : ℝ) :
    rowTwistedSum (η.product ω) m A z W t X =
      ∑' I : Ideal O, ((idealCoeff η I * idealCoeff ω I) *
        idealRowHom (m^6 * (A*z)) I) * (I.absNorm : ℂ)^(Complex.I*t) *
        W ((I.absNorm : ℝ)/X) := by
  simp only [rowTwistedSum, idealCoeff_product]

/-- The first and second character may be the products of a common anchor
with separate ray characters. The slots retain an independently fixed anchor. -/
def mixedRow (η₁ η₂ η : Character) (m A z : O) (W₁ W₂ : ℝ → ℂ)
    (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ) (P : ι → ℝ) (t X₁ X₂ : ℝ) : ℂ :=
  (Real.sqrt (X₁*X₂*∏ i, P i) : ℂ)⁻¹ *
    ((rowTwistedSum η₁ m A z W₁ t X₁ * rowTwistedSum η₂ m A z W₂ t X₂) *
      ∏ i, rowSlot η m A z (S i) (β i) t)

/-- Coefficient-level interface for two actual ray decorations. Every ideal
in the first (second) ordinary sum retains its value under ω₁ (ω₂), as well
as the row symbol, including at a nonunit. -/
theorem mixedRow_ray_expansion (η ω₁ ω₂ ηp : Character) (m A z : O)
    (W₁ W₂ : ℝ → ℂ) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t X₁ X₂ : ℝ) :
    let plain := fun (ω : Character) (W : ℝ → ℂ) (X : ℝ) =>
      ∑' I : Ideal O, ((idealCoeff η I * idealCoeff ω I) * idealRowHom (m^6 * (A*z)) I) *
        (I.absNorm : ℂ)^(Complex.I*t) * W ((I.absNorm : ℝ)/X)
    mixedRow (η.product ω₁) (η.product ω₂) ηp m A z W₁ W₂ S β P t X₁ X₂ =
      (Real.sqrt (X₁*X₂*∏ i, P i) : ℂ)⁻¹ *
        ((plain ω₁ W₁ X₁ * plain ω₂ W₂ X₂) * ∏ i, rowSlot ηp m A z (S i) (β i) t) := by
  dsimp only
  rw [mixedRow, rowTwistedSum_ray, rowTwistedSum_ray]

theorem mixedRow_same (η : Character) (m A z : O) (W₁ W₂ : ℝ → ℂ)
    (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ) (P : ι → ℝ) (t X₁ X₂ : ℝ) :
    mixedRow η η η m A z W₁ W₂ S β P t X₁ X₂ =
      positiveSlotRow η m A z W₁ W₂ S β P t X₁ X₂ := rfl

def mixedEnergy (η₁ η₂ η : Character) (m A : O) (t : ℝ) (W₁ W₂ : ℝ → ℂ)
    (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ) (P : ι → ℝ) (X₁ X₂ : ℝ)
    (keep : O → Prop) (Φ : 𝓢(ℝ,ℂ)) (K : ℝ) : ℝ :=
  ∑' z : O, if keep z then ‖mixedRow η₁ η₂ η m A z W₁ W₂ S β P t X₁ X₂‖^2 *
    (Φ (‖eisEmbedding z‖^2/K)).re else 0

theorem mixedEnergy_same (η : Character) (m A : O) (t : ℝ) (W₁ W₂ : ℝ → ℂ)
    (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ) (P : ι → ℝ) (X₁ X₂ : ℝ)
    (keep : O → Prop) (Φ : 𝓢(ℝ,ℂ)) (K : ℝ) :
    mixedEnergy η η η m A t W₁ W₂ S β P X₁ X₂ keep Φ K =
      energy η m A t W₁ W₂ S β P X₁ X₂ keep Φ K := rfl

def spectralRow (η₁ η₂ η : Character) (m A : O) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (e : Fin 2 × Fin 2) (τ : ℝ × ℝ) (z : O) : ℂ :=
  mixedRow η₁ η₂ η m A z ((commonPair e τ).profile 0) ((commonPair e τ).profile 1)
    S β P t (scale e.1 * Y₁) (scale e.2 * Y₂)

theorem spectralRow_mul (W₁ W₂ : 𝓢(ℝ, ℂ))
    (hs₁ : Function.support (W₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (hs₂ : Function.support (W₂ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (η₁ η₂ η : Character) (m A z : O) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (e : Fin 2 × Fin 2) (v τ : ℝ × ℝ) :
    pairCoeff W₁ W₂ hs₁ hs₂ e v τ * spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ z =
      (Real.sqrt (Y₁ * Y₂ * ∏ i, P i) : ℂ)⁻¹ *
        ((cellCoeff W₁ hs₁ e.1 v.1 τ.1 *
            rowTwistedSum η₁ m A z (commonProfile e.1 τ.1) t (scale e.1 * Y₁)) *
          (cellCoeff W₂ hs₂ e.2 v.2 τ.2 *
            rowTwistedSum η₂ m A z (commonProfile e.2 τ.2) t (scale e.2 * Y₂))) *
        ∏ i, rowSlot η m A z (S i) (β i) t := by
  have hc1 := scale_pos e.1
  have hc2 := scale_pos e.2
  have hsq : Real.sqrt (scale e.1 * Y₁ * (scale e.2 * Y₂) * ∏ i, P i) =
      Real.sqrt (scale e.1 * scale e.2) * Real.sqrt (Y₁ * Y₂ * ∏ i, P i) := by
    rw [← Real.sqrt_mul (mul_pos hc1 hc2).le]
    congr 1
    ring
  have hne : (Real.sqrt (scale e.1 * scale e.2) : ℂ) ≠ 0 := by
    exact_mod_cast (Real.sqrt_pos.mpr (mul_pos hc1 hc2)).ne'
  have key : (Real.sqrt (scale e.1 * scale e.2) : ℂ) * (Real.sqrt (scale e.1 * scale e.2) : ℂ)⁻¹
      = 1 := mul_inv_cancel₀ hne
  simp only [spectralRow, mixedRow, pairCoeff, commonPair_profile_zero,
    commonPair_profile_one]
  rw [hsq, Complex.ofReal_mul, mul_inv]
  linear_combination
    ((Real.sqrt (Y₁ * Y₂ * ∏ i, P i) : ℂ)⁻¹ * cellCoeff W₁ hs₁ e.1 v.1 τ.1 *
      cellCoeff W₂ hs₂ e.2 v.2 τ.2 *
      rowTwistedSum η₁ m A z (commonProfile e.1 τ.1) t (scale e.1 * Y₁) *
      rowTwistedSum η₂ m A z (commonProfile e.2 τ.2) t (scale e.2 * Y₂) *
      ∏ i, rowSlot η m A z (S i) (β i) t) * key

/-- **Exact separation of the literal prefix-dilated positive slot row.** For prefix dilations
`v ∈ [0, log 2]²` of both ordinary profiles, normalized at the common scales `Y₁, Y₂`, the row is
a sum over the four tensored cells of spectral integrals of the common rows, with coefficient
`pairCoeff` (density, unimodular prefix and scale phases, and the retained `√(c_{e₁}c_{e₂})`). -/
theorem row_fourier (W₁ W₂ : 𝓢(ℝ, ℂ))
    (hs₁ : Function.support (W₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (hs₂ : Function.support (W₂ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (v : ℝ × ℝ) (hv₁ : v.1 ∈ Set.Icc 0 (Real.log 2)) (hv₂ : v.2 ∈ Set.Icc 0 (Real.log 2))
    (η₁ η₂ η : Character) (m A z : O) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂) :
    mixedRow η₁ η₂ η m A z (dilate W₁ v.1) (dilate W₂ v.2) S β P t Y₁ Y₂ =
      ∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
        pairCoeff W₁ W₂ hs₁ hs₂ e v τ * spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ z := by
  set N : ℂ := (Real.sqrt (Y₁ * Y₂ * ∏ i, P i) : ℂ)⁻¹ with hN
  set Q₀ : ℂ := ∏ i, rowSlot η m A z (S i) (β i) t with hQ₀
  set F₁ : Fin 2 → ℝ → ℂ := fun e₁ τ₁ => cellCoeff W₁ hs₁ e₁ v.1 τ₁ *
    rowTwistedSum η₁ m A z (commonProfile e₁ τ₁) t (scale e₁ * Y₁) with hF₁
  set F₂ : Fin 2 → ℝ → ℂ := fun e₂ τ₂ => cellCoeff W₂ hs₂ e₂ v.2 τ₂ *
    rowTwistedSum η₂ m A z (commonProfile e₂ τ₂) t (scale e₂ * Y₂) with hF₂
  have hcell : ∀ (e : Fin 2 × Fin 2),
      ∫ τ : ℝ × ℝ, pairCoeff W₁ W₂ hs₁ hs₂ e v τ * spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ z =
        N * ((∫ τ₁ : ℝ, F₁ e.1 τ₁) * (∫ τ₂ : ℝ, F₂ e.2 τ₂)) * Q₀ := by
    intro e
    have hpt : ∀ τ : ℝ × ℝ,
        pairCoeff W₁ W₂ hs₁ hs₂ e v τ * spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ z =
          N * (F₁ e.1 τ.1 * F₂ e.2 τ.2) * Q₀ := fun τ =>
      spectralRow_mul W₁ W₂ hs₁ hs₂ η₁ η₂ η m A z S β P t Y₁ Y₂ e v τ
    simp_rw [hpt]
    rw [integral_mul_const, integral_const_mul]
    have hp := integral_prod_mul (μ := (volume : Measure ℝ)) (ν := (volume : Measure ℝ))
      (F₁ e.1) (F₂ e.2)
    rw [← Measure.volume_eq_prod] at hp
    rw [hp]
  simp only [mixedRow]
  rw [rowTwisted_separation W₁ hs₁ v.1 hv₁.1 hv₁.2 η₁ m A z t Y₁ hY₁,
    rowTwisted_separation W₂ hs₂ v.2 hv₂.1 hv₂.2 η₂ m A z t Y₂ hY₂]
  rw [Finset.sum_congr rfl (fun e _ => hcell e), Fintype.sum_prod_type]
  rw [Finset.sum_mul_sum, Finset.sum_mul, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro e₁ _
  rw [Finset.sum_mul, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro e₂ _
  simp only [hN, hQ₀, hF₁, hF₂]
  ring

/-- **The `hrep` majorant for a family of ordinary-prefix dilations.** Rows `r` carry lattice
points `z r`; each label `l` over `r` has prefix dilations `vd l ∈ [0, log 2]²` and an
arbitrary scalar `sc l r` (frozen character values, valuation/keep weights, `√Φ`, ...) with
`‖sc l r‖ ≤ K`. Then the packets satisfy the `hrep` hypothesis of
`CommonProfile.weighted_separation` with cells `Fin 2 × Fin 2`, the spectral plane `ℝ × ℝ`,
the label-independent majorant `K · pairMajorant` and the common coefficients `spectralRow`. -/
theorem prefix_bound {ρ Λ : Type*} (W₁ W₂ : 𝓢(ℝ, ℂ))
    (hs₁ : Function.support (W₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (hs₂ : Function.support (W₂ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (η₁ η₂ η : Character) (m A : O) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂)
    (rows : Finset ρ) (labels : ρ → Finset Λ) (z : ρ → O) (vd : Λ → ℝ × ℝ)
    (hvd : ∀ r ∈ rows, ∀ l ∈ labels r,
      (vd l).1 ∈ Set.Icc 0 (Real.log 2) ∧ (vd l).2 ∈ Set.Icc 0 (Real.log 2))
    (sc : Λ → ρ → ℂ) (K : ℝ) (hsc : ∀ r ∈ rows, ∀ l ∈ labels r, ‖sc l r‖ ≤ K)
    (B : Λ → ρ → ℂ)
    (hB : ∀ r ∈ rows, ∀ l ∈ labels r, B l r = sc l r *
      mixedRow η₁ η₂ η m A (z r) (dilate W₁ (vd l).1) (dilate W₂ (vd l).2) S β P t Y₁ Y₂) :
    ∀ r ∈ rows, ∀ l ∈ labels r, ‖B l r‖ ≤
      ∑ e ∈ (Finset.univ : Finset (Fin 2 × Fin 2)), ∫ τ : ℝ × ℝ,
        (K * pairMajorant W₁ W₂ hs₁ hs₂ e τ) *
          ‖spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ (z r)‖ := by
  intro r hr l hl
  obtain ⟨hv₁, hv₂⟩ := hvd r hr l hl
  rw [hB r hr l hl, norm_mul,
    row_fourier W₁ W₂ hs₁ hs₂ (vd l) hv₁ hv₂ η₁ η₂ η m A (z r) S β P t Y₁ Y₂ hY₁ hY₂]
  have hsum : ‖∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
        pairCoeff W₁ W₂ hs₁ hs₂ e (vd l) τ * spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ (z r)‖ ≤
      ∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
        pairMajorant W₁ W₂ hs₁ hs₂ e τ * ‖spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ (z r)‖ := by
    refine (norm_sum_le _ _).trans (Finset.sum_le_sum fun e _ => ?_)
    refine (norm_integral_le_integral_norm _).trans (le_of_eq ?_)
    congr 1
    funext τ
    rw [norm_mul, pairCoeff_norm]
  have hnn : 0 ≤ ∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
      pairMajorant W₁ W₂ hs₁ hs₂ e τ * ‖spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ (z r)‖ :=
    Finset.sum_nonneg fun e _ => integral_nonneg fun τ =>
      mul_nonneg (pairMajorant_nonneg _ _ _ _ _ _) (norm_nonneg _)
  calc ‖sc l r‖ * _ ≤ K * ∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
        pairMajorant W₁ W₂ hs₁ hs₂ e τ * ‖spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ (z r)‖ :=
        mul_le_mul (hsc r hr l hl) hsum (norm_nonneg _) ((norm_nonneg _).trans (hsc r hr l hl))
    _ = _ := by
        rw [Finset.mul_sum]
        apply Finset.sum_congr rfl
        intro e _
        rw [← integral_const_mul]
        congr 1
        funext τ
        ring

/-! ### 8. Integrability of the common coefficients against the majorant (`hMA`, `hMA2`) -/

/-- A τ-independent bound for the common row. -/
def spectralBound (η₁ η₂ η : Character) (m A : O) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (e : Fin 2 × Fin 2) (z : O) : ℝ :=
  ‖(Real.sqrt (scale e.1 * Y₁ * (scale e.2 * Y₂) * ∏ i, P i) : ℂ)⁻¹‖ *
    ((rowTwistedBound η₁ m A z e.1 t Y₁ * rowTwistedBound η₂ m A z e.2 t Y₂) *
      ‖∏ i, rowSlot η m A z (S i) (β i) t‖)

theorem spectralRow_norm_le (η₁ η₂ η : Character) (m A : O) (S : ι → Finset (Ideal O))
    (β : ι → Ideal O → ℂ) (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂)
    (e : Fin 2 × Fin 2) (τ : ℝ × ℝ) (z : O) :
    ‖spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ z‖ ≤ spectralBound η₁ η₂ η m A S β P t Y₁ Y₂ e z := by
  simp only [spectralRow, mixedRow, commonPair_profile_zero, commonPair_profile_one,
    spectralBound, norm_mul]
  apply mul_le_mul_of_nonneg_left _ (norm_nonneg _)
  apply mul_le_mul_of_nonneg_right _ (norm_nonneg _)
  exact mul_le_mul (rowTwisted_common_norm_le η₁ m A z e.1 τ.1 t Y₁ hY₁)
    (rowTwisted_common_norm_le η₂ m A z e.2 τ.2 t Y₂ hY₂) (norm_nonneg _)
    ((norm_nonneg _).trans (rowTwisted_common_norm_le η₁ m A z e.1 τ.1 t Y₁ hY₁))

theorem spectralRow_continuous (η₁ η₂ η : Character) (m A : O) (S : ι → Finset (Ideal O))
    (β : ι → Ideal O → ℂ) (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂)
    (e : Fin 2 × Fin 2) (z : O) :
    Continuous (fun τ : ℝ × ℝ => spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ z) := by
  simp only [spectralRow, mixedRow, commonPair_profile_zero, commonPair_profile_one]
  exact continuous_const.mul
    ((((rowTwisted_common_continuous η₁ m A z e.1 t Y₁ hY₁).comp continuous_fst).mul
      ((rowTwisted_common_continuous η₂ m A z e.2 t Y₂ hY₂).comp continuous_snd)).mul
        continuous_const)

/-- `hMA`. -/
theorem spectral_integrable (W₁ W₂ : 𝓢(ℝ, ℂ))
    (hs₁ : Function.support (W₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (hs₂ : Function.support (W₂ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (η₁ η₂ η : Character) (m A : O) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂) (K : ℝ)
    (hK : 0 ≤ K) (e : Fin 2 × Fin 2) (z : O) :
    Integrable (fun τ : ℝ × ℝ => (K * pairMajorant W₁ W₂ hs₁ hs₂ e τ) *
      ‖spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ z‖) (volume : Measure (ℝ × ℝ)) := by
  have hM := (pairMajorant_integrable W₁ W₂ hs₁ hs₂ e).const_mul K
  refine (hM.mul_const (spectralBound η₁ η₂ η m A S β P t Y₁ Y₂ e z)).mono' ?_ ?_
  · exact hM.aestronglyMeasurable.mul
      (spectralRow_continuous η₁ η₂ η m A S β P t Y₁ Y₂ hY₁ hY₂ e z).norm.aestronglyMeasurable
  · filter_upwards with τ
    rw [norm_mul, norm_norm, Real.norm_of_nonneg (mul_nonneg hK (pairMajorant_nonneg _ _ _ _ _ _))]
    exact mul_le_mul_of_nonneg_left (spectralRow_norm_le η₁ η₂ η m A S β P t Y₁ Y₂ hY₁ hY₂ e τ z)
      (mul_nonneg hK (pairMajorant_nonneg _ _ _ _ _ _))

/-- `hMA2`. -/
theorem spectral_sq_integrable (W₁ W₂ : 𝓢(ℝ, ℂ))
    (hs₁ : Function.support (W₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (hs₂ : Function.support (W₂ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (η₁ η₂ η : Character) (m A : O) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂) (K : ℝ)
    (hK : 0 ≤ K) (e : Fin 2 × Fin 2) (z : O) :
    Integrable (fun τ : ℝ × ℝ => (K * pairMajorant W₁ W₂ hs₁ hs₂ e τ) *
      ‖spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ z‖ ^ 2) (volume : Measure (ℝ × ℝ)) := by
  have hM := (pairMajorant_integrable W₁ W₂ hs₁ hs₂ e).const_mul K
  refine (hM.mul_const (spectralBound η₁ η₂ η m A S β P t Y₁ Y₂ e z ^ 2)).mono' ?_ ?_
  · exact hM.aestronglyMeasurable.mul
      ((spectralRow_continuous η₁ η₂ η m A S β P t Y₁ Y₂ hY₁ hY₂ e z).norm.pow 2).aestronglyMeasurable
  · filter_upwards with τ
    rw [norm_mul, norm_pow, norm_norm,
      Real.norm_of_nonneg (mul_nonneg hK (pairMajorant_nonneg _ _ _ _ _ _))]
    exact mul_le_mul_of_nonneg_left
      (pow_le_pow_left₀ (norm_nonneg _)
        (spectralRow_norm_le η₁ η₂ η m A S β P t Y₁ Y₂ hY₁ hY₂ e τ z) 2)
      (mul_nonneg hK (pairMajorant_nonneg _ _ _ _ _ _))


theorem weighted_fourier {ρ Λ : Type*} (W₁ W₂ : 𝓢(ℝ, ℂ))
    (hs₁ : Function.support (W₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (hs₂ : Function.support (W₂ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (η₁ η₂ η : Character) (m A : O) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ)
    (P : ι → ℝ) (t Y₁ Y₂ : ℝ) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂)
    (rows : Finset ρ) (labels : ρ → Finset Λ) (z : ρ → O) (vd : Λ → ℝ × ℝ)
    (hvd : ∀ r ∈ rows, ∀ l ∈ labels r,
      (vd l).1 ∈ Set.Icc 0 (Real.log 2) ∧ (vd l).2 ∈ Set.Icc 0 (Real.log 2))
    (sc : Λ → ρ → ℂ) (K : ℝ) (hK : 0 ≤ K) (hsc : ∀ r ∈ rows, ∀ l ∈ labels r, ‖sc l r‖ ≤ K)
    (B : Λ → ρ → ℂ)
    (hB : ∀ r ∈ rows, ∀ l ∈ labels r, B l r = sc l r *
      mixedRow η₁ η₂ η m A (z r) (dilate W₁ (vd l).1) (dilate W₂ (vd l).2) S β P t Y₁ Y₂)
    (w : Λ → ρ → ℝ) (D C T : ℝ) (J : ℕ)
    (hw : ∀ l r, 0 ≤ w l r) (hD0 : 0 ≤ D) (hD : ∀ r ∈ rows, ∑ l ∈ labels r, w l r ≤ D)
    (hC : 0 ≤ C) (hT : 0 ≤ T)
    (hsource : ∀ (e : Fin 2 × Fin 2) (τ : ℝ × ℝ),
      ∑ r ∈ rows, ‖spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ (z r)‖ ^ 2 ≤ C * pairWeight J τ * T) :
    ∑ r ∈ rows, ∑ l ∈ labels r, w l r * ‖B l r‖ ^ 2 ≤
      D * C * (∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ, K * pairMajorant W₁ W₂ hs₁ hs₂ e τ) *
        (∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
          K * pairMajorant W₁ W₂ hs₁ hs₂ e τ * pairWeight J τ) * T :=
  CommonProfile.weighted_separation (volume : Measure (ℝ × ℝ)) Finset.univ rows labels w B
    (fun e τ => K * pairMajorant W₁ W₂ hs₁ hs₂ e τ)
    (fun e τ r => spectralRow η₁ η₂ η m A S β P t Y₁ Y₂ e τ (z r)) (pairWeight J) D C T
    hw hD0 hD (fun _ _ => mul_nonneg hK (pairMajorant_nonneg _ _ _ _ _ _))
    (pairWeight_nonneg J) hC hT
    (prefix_hM1 W₁ W₂ hs₁ hs₂ K) (prefix_hMω W₁ W₂ hs₁ hs₂ K J)
    (fun e _ r _ => spectral_integrable W₁ W₂ hs₁ hs₂ η₁ η₂ η m A S β P t Y₁ Y₂ hY₁ hY₂ K hK e (z r))
    (fun e _ r _ =>
      spectral_sq_integrable W₁ W₂ hs₁ hs₂ η₁ η₂ η m A S β P t Y₁ Y₂ hY₁ hY₂ K hK e (z r))
    (prefix_bound W₁ W₂ hs₁ hs₂ η₁ η₂ η m A S β P t Y₁ Y₂ hY₁ hY₂ rows labels z vd hvd sc K hsc B hB)
    (fun e _ τ => hsource e τ)


theorem mixedRow_rescale (η₁ η₂ η : Character) (m A z : O)
    (W₁ W₂ : 𝓢(ℝ, ℂ)) (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ) (P : ι → ℝ)
    (t X₁ X₂ Y₁ Y₂ : ℝ) (hX₁ : 0 < X₁) (hX₂ : 0 < X₂) (hY₁ : 0 < Y₁)
    (hY₂ : 0 < Y₂) :
    mixedRow η₁ η₂ η m A z W₁ W₂ S β P t X₁ X₂ =
      (Real.sqrt (Y₁ * Y₂ / (X₁ * X₂)) : ℂ) *
        mixedRow η₁ η₂ η m A z (ProfileSeparation.dilate W₁ (Real.log (Y₁ / X₁)))
          (ProfileSeparation.dilate W₂ (Real.log (Y₂ / X₂))) S β P t Y₁ Y₂ := by
  unfold mixedRow
  rw [← Grouped.rowTwistedSum_rescale η₁ m A z W₁ t X₁ Y₁ hX₁ hY₁,
    ← Grouped.rowTwistedSum_rescale η₂ m A z W₂ t X₂ Y₂ hX₂ hY₂]
  have hρ : 0 < Real.sqrt (Y₁ * Y₂ / (X₁ * X₂)) :=
    Real.sqrt_pos.mpr (div_pos (mul_pos hY₁ hY₂) (mul_pos hX₁ hX₂))
  have hsplit : Real.sqrt (Y₁ * Y₂ * ∏ i, P i) =
      Real.sqrt (Y₁ * Y₂ / (X₁ * X₂)) * Real.sqrt (X₁ * X₂ * ∏ i, P i) := by
    rw [← Real.sqrt_mul (div_nonneg (mul_pos hY₁ hY₂).le (mul_pos hX₁ hX₂).le)]
    congr 1
    field_simp
  rw [hsplit, Complex.ofReal_mul, mul_inv]
  have hne : (Real.sqrt (Y₁ * Y₂ / (X₁ * X₂)) : ℂ) ≠ 0 := by exact_mod_cast hρ.ne'
  field_simp


/-- The weighted grouped estimate of one coefficient class. -/
theorem grouped_ray_class_bound {ι Λ : Type*} [Fintype ι] (σ₁ σ₂ σA : Character) (m : O) (keep : O → Prop)
    (hkeep : ∀ y, keep y → y ≠ 0)
    (p₀ p₁ : 𝓢(ℝ, ℂ)) (hs₀ : Function.support (p₀ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (hs₁ : Function.support (p₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ) (P : ι → ℝ)
    (Y₁ Y₂ Kc : ℝ) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂) (hKc : 0 < Kc)
    (labels : Finset Λ) (ω : Λ → ℝ) (hω : ∀ x, 0 ≤ ω x) (V : Λ → O) (K : Λ → ℝ)
    (hK : ∀ x ∈ labels, 0 < ((Ideal.span {V x}).absNorm : ℝ) * K x)
    (hscale : ∀ x ∈ labels, 2 * (((Ideal.span {V x}).absNorm : ℝ) * K x) ≤ Kc)
    (X₁ X₂ : Λ → ℝ)
    (hX : ∀ x ∈ labels, 0 < X₁ x ∧ Y₁ / 2 ≤ X₁ x ∧ X₁ x ≤ Y₁ ∧
      0 < X₂ x ∧ Y₂ / 2 ≤ X₂ x ∧ X₂ x ≤ Y₂)
    (D : ℝ) (hD0 : 0 ≤ D) (hD : ∀ y : O, y ≠ 0 → ‖eisEmbedding y‖ ^ 2 ≤ Kc →
      ∑ x ∈ labels.filter (fun x => V x ∣ y), ω x ≤ D)
    (C T : ℝ) (J : ℕ) (hC : 0 ≤ C) (hT : 0 ≤ T)
    (hsource : ∀ (e : Fin 2 × Fin 2) (τ : ℝ × ℝ),
      mixedEnergy σ₁ σ₂ σA m 1 0 ((commonPair e τ).profile 0) ((commonPair e τ).profile 1) S β P
        (scale e.1 * Y₁) (scale e.2 * Y₂) keep ballProfile Kc ≤ C * pairWeight J τ * T) :
    ∑ x ∈ labels, ω x * mixedEnergy σ₁ σ₂ σA m 1 0 p₀ p₁ S β P (X₁ x) (X₂ x)
        (fun y => V x ∣ y ∧ keep y) ballProfile (((Ideal.span {V x}).absNorm : ℝ) * K x) ≤
      (4 * D) * C * (∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ, 1 * pairMajorant p₀ p₁ hs₀ hs₁ e τ) *
        (∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
          1 * pairMajorant p₀ p₁ hs₀ hs₁ e τ * pairWeight J τ) * T := by
  classical
  set Ball : Finset O := ShortDraftLatticeCount.rowNormBall ⌈2 * Kc⌉₊ with hBall
  set rows : Finset O := Ball.filter (fun y => keep y ∧ ‖eisEmbedding y‖ ^ 2 ≤ Kc) with hrows
  let ρ : Λ → ℝ := fun x => Real.sqrt (Y₁ * Y₂ / (X₁ x * X₂ x))
  let vd : Λ → ℝ × ℝ := fun x => (Real.log (Y₁ / X₁ x), Real.log (Y₂ / X₂ x))
  let B : Λ → O → ℂ := fun x y =>
    mixedRow σ₁ σ₂ σA m 1 y (dilate p₀ (vd x).1) (dilate p₁ (vd x).2) S β P 0 Y₁ Y₂
  let bw : Λ → O → ℝ := fun x y => if V x ∣ y then
    (ballProfile (‖eisEmbedding y‖ ^ 2 / (((Ideal.span {V x}).absNorm : ℝ) * K x))).re else 0
  let w : Λ → O → ℝ := fun x y => ω x * ρ x ^ 2 * bw x y
  have hbw0 : ∀ x y, 0 ≤ bw x y := by
    intro x y
    by_cases hv : V x ∣ y
    · simp only [bw, hv, ite_true]; exact ballProfile_nonneg _
    · simp only [bw, hv, ite_false, le_refl]
  have hw0 : ∀ x y, 0 ≤ w x y := fun x y =>
    mul_nonneg (mul_nonneg (hω x) (sq_nonneg _)) (hbw0 x y)
  -- Step 1: each child mixedEnergy is a finite row sum of rescaled rows.
  have hstep1 : ∀ x ∈ labels,
      mixedEnergy σ₁ σ₂ σA m 1 0 p₀ p₁ S β P (X₁ x) (X₂ x) (fun y => V x ∣ y ∧ keep y) ballProfile
          (((Ideal.span {V x}).absNorm : ℝ) * K x) =
        ∑ y ∈ rows, ρ x ^ 2 * bw x y * ‖B x y‖ ^ 2 := by
    intro x hx
    obtain ⟨hX₁, hX₁l, hX₁u, hX₂, hX₂l, hX₂u⟩ := hX x hx
    unfold mixedEnergy
    rw [tsum_eq_sum (s := rows)]
    · apply Finset.sum_congr rfl
      intro y hy
      have hk : keep y := (Finset.mem_filter.mp hy).2.1
      by_cases hv : V x ∣ y
      · have hc : V x ∣ y ∧ keep y := ⟨hv, hk⟩
        rw [ite_eq_left hc]
        simp only [bw, hv, ite_true]
        rw [mixedRow_rescale σ₁ σ₂ σA m 1 y p₀ p₁ S β P 0 (X₁ x) (X₂ x) Y₁ Y₂ hX₁ hX₂ hY₁ hY₂,
          norm_mul, Complex.norm_real, Real.norm_of_nonneg (Real.sqrt_nonneg _)]
        ring
      · have hc : ¬ (V x ∣ y ∧ keep y) := fun h => hv h.1
        rw [ite_eq_right hc]
        simp only [bw, hv, ite_false, mul_zero, zero_mul]
    · intro y hy
      by_cases hc : V x ∣ y ∧ keep y
      · rw [ite_eq_left hc]
        have hb : (ballProfile (‖eisEmbedding y‖ ^ 2 /
            (((Ideal.span {V x}).absNorm : ℝ) * K x))).re = 0 := by
          by_contra hne
          have hlt := ball_lt_of_ne_zero _ _ (sq_nonneg _) (hK x hx) hne
          have hle : ‖eisEmbedding y‖ ^ 2 ≤ Kc := by linarith [hscale x hx]
          apply hy
          refine Finset.mem_filter.mpr ⟨mem_rowNormBall_of_norm_sq_le _ _ ?_, hc.2, hle⟩
          linarith
        rw [hb, mul_zero]
      · rw [ite_eq_right hc]
  -- Step 2: swap the label and row sums.
  have hstep2 : ∑ x ∈ labels, ω x * mixedEnergy σ₁ σ₂ σA m 1 0 p₀ p₁ S β P (X₁ x) (X₂ x)
        (fun y => V x ∣ y ∧ keep y) ballProfile (((Ideal.span {V x}).absNorm : ℝ) * K x) =
      ∑ y ∈ rows, ∑ x ∈ labels, w x y * ‖B x y‖ ^ 2 := by
    rw [Finset.sum_congr rfl (fun x hx => by rw [hstep1 x hx])]
    simp_rw [Finset.mul_sum]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl; intro y _
    apply Finset.sum_congr rfl; intro x _
    simp only [w]; ring
  rw [hstep2]
  -- Step 3: weighted common-profile separation.
  have hvd : ∀ r ∈ rows, ∀ l ∈ (fun _ : O => labels) r,
      (vd l).1 ∈ Set.Icc 0 (Real.log 2) ∧ (vd l).2 ∈ Set.Icc 0 (Real.log 2) := by
    intro r _ l hl
    obtain ⟨hX₁, hX₁l, hX₁u, hX₂, hX₂l, hX₂u⟩ := hX l hl
    exact ⟨dilate_log_mem _ _ hX₁ hX₁l hX₁u, dilate_log_mem _ _ hX₂ hX₂l hX₂u⟩
  have hDrow : ∀ r ∈ rows, ∑ l ∈ (fun _ : O => labels) r, w l r ≤ 4 * D := by
    intro r hr
    have hk : keep r := (Finset.mem_filter.mp hr).2.1
    have hrK : ‖eisEmbedding r‖ ^ 2 ≤ Kc := (Finset.mem_filter.mp hr).2.2
    have hle : ∀ l ∈ labels, w l r ≤ 4 * (if V l ∣ r then ω l else 0) := by
      intro l hl
      obtain ⟨hX₁, hX₁l, _, hX₂, hX₂l, _⟩ := hX l hl
      have hρ := rescale_factor_le Y₁ Y₂ (X₁ l) (X₂ l) hX₁ hX₂ hX₁l hX₂l hY₁.le hY₂.le
      by_cases hv : V l ∣ r
      · simp only [w, bw, hv, ite_true]
        have hb1 := ballProfile_le_one (‖eisEmbedding r‖ ^ 2 /
          (((Ideal.span {V l}).absNorm : ℝ) * K l))
        have hb0 := ballProfile_nonneg (‖eisEmbedding r‖ ^ 2 /
          (((Ideal.span {V l}).absNorm : ℝ) * K l))
        have hωl := hω l
        have h1 : ρ l ^ 2 * (ballProfile (‖eisEmbedding r‖ ^ 2 /
            (((Ideal.span {V l}).absNorm : ℝ) * K l))).re ≤ 4 :=
          by nlinarith [sq_nonneg (ρ l)]
        nlinarith
      · simp only [w, bw, hv, ite_false, mul_zero, le_refl]
    calc ∑ l ∈ labels, w l r ≤ ∑ l ∈ labels, 4 * (if V l ∣ r then ω l else 0) :=
          Finset.sum_le_sum hle
      _ = 4 * ∑ x ∈ labels.filter (fun x => V x ∣ r), ω x := by
          rw [← Finset.mul_sum, Finset.sum_filter]
      _ ≤ 4 * D := by linarith [hD r (hkeep r hk) hrK]
  have hsrc : ∀ (e : Fin 2 × Fin 2) (τ : ℝ × ℝ),
      ∑ r ∈ rows, ‖spectralRow σ₁ σ₂ σA m 1 S β P 0 Y₁ Y₂ e τ (id r)‖ ^ 2 ≤
        C * pairWeight J τ * T := by
    intro e τ
    refine le_trans ?_ (hsource e τ)
    unfold mixedEnergy
    rw [tsum_eq_sum (s := Ball)]
    · calc ∑ r ∈ rows, ‖spectralRow σ₁ σ₂ σA m 1 S β P 0 Y₁ Y₂ e τ (id r)‖ ^ 2
          = ∑ r ∈ rows, (if keep r then
              ‖mixedRow σ₁ σ₂ σA m 1 r ((commonPair e τ).profile 0)
                ((commonPair e τ).profile 1) S β P 0 (scale e.1 * Y₁) (scale e.2 * Y₂)‖ ^ 2 *
                (ballProfile (‖eisEmbedding r‖ ^ 2 / Kc)).re else 0) := by
            apply Finset.sum_congr rfl
            intro r hr
            obtain ⟨_, hk, hle⟩ := Finset.mem_filter.mp hr
            rw [ite_eq_left hk, ball_one_of_le _ _ (sq_nonneg _) hKc hle, mul_one]
            rfl
        _ ≤ _ := by
            apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _)
            intro r _ _
            split_ifs
            · exact mul_nonneg (sq_nonneg _) (ballProfile_nonneg _)
            · exact le_refl _
    · intro r hr
      by_cases hk : keep r
      · rw [ite_eq_left hk]
        have hb : (ballProfile (‖eisEmbedding r‖ ^ 2 / Kc)).re = 0 := by
          by_contra hne
          have hlt := ball_lt_of_ne_zero _ _ (sq_nonneg _) hKc hne
          exact hr (mem_rowNormBall_of_norm_sq_le _ _ hlt.le)
        rw [hb, mul_zero]
      · rw [ite_eq_right hk]
  exact weighted_fourier p₀ p₁ hs₀ hs₁ σ₁ σ₂ σA m 1 S β P 0 Y₁ Y₂ hY₁ hY₂
    rows (fun _ => labels) id vd hvd (fun _ _ => 1) 1 zero_le_one
    (fun _ _ _ _ => by simp) B (fun r _ l _ => by simp only [B, one_mul, id]) w (4 * D) C T J
    hw0 (by linarith) hDrow hC hT hsrc

end
end ContinuumLocalReturn.AsymmetricRayGroup
#print axioms ContinuumLocalReturn.AsymmetricRayGroup.mixedRow_ray_expansion
#print axioms ContinuumLocalReturn.AsymmetricRayGroup.row_fourier
#print axioms ContinuumLocalReturn.AsymmetricRayGroup.grouped_ray_class_bound
