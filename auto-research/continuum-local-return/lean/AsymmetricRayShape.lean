/- A grouped class uses one of its two actual rectangle estimates.
   The two ordinary characters, the slot character, natural zeros, selected
   prime data, and the common scale are those of AsymmetricRayGroup.
   Prepared with OpenAI Codex assistance. -/
import AsymmetricPacked
import AsymmetricRayGroup

set_option autoImplicit false
noncomputable section
namespace ContinuumLocalReturn.AsymmetricRayShape
open scoped Classical BigOperators SchwartzMap
open OAI OAI.SevenEighths HeckeFamily ConcreteTraceCRT
open CenteredMomentEnergyBands (length)
open CenteredMomentFirstAmplificationChoice (ballProfile)
open QRH.SilDensitySplit.CubeFree.Packet
open QRH.SilDensitySplit.CubeFree.Packet.Grouped
open ProfileSeparation (commonPair scale pairWeight pairMajorant)
open ContinuumLocalReturn.AsymmetricPacked ContinuumLocalReturn.AsymmetricRayGroup
local notation "O" => ActualEisensteinCubic.O

/-- On a dyadic class represented by a shortened original or reference
    rectangle, the decorated grouped bound calls only the corresponding
    terminal estimate. Both estimates are needed solely on their own shapes. -/
theorem class_of_terminal_or_reference {ι Λ : Type*} [Fintype ι] (σ₁ σ₂ σA : Character) (m : O) (keep : O → Prop)
    (hkeep : ∀ y, keep y → y ≠ 0)
    (p₀ p₁ : 𝓢(ℝ, ℂ)) (hs₀ : Function.support (p₀ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (hs₁ : Function.support (p₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
    (S : ι → Finset (Ideal O)) (β : ι → Ideal O → ℂ) (P : ι → ℝ)
    (Z B₁ B₂ n y short Kc : ℝ) (hZ : 1 < Z) (h₁ : 0 < B₁) (h₂ : 0 < B₂)
    (hshape : InShape n y short 0 (length Z B₁) (length Z B₂)) (hKc : 0 < Kc)
    (labels : Finset Λ) (ω : Λ → ℝ) (hω : ∀ x, 0 ≤ ω x) (V : Λ → O) (K : Λ → ℝ)
    (hK : ∀ x ∈ labels, 0 < ((Ideal.span {V x}).absNorm : ℝ) * K x)
    (hscale : ∀ x ∈ labels, 2 * (((Ideal.span {V x}).absNorm : ℝ) * K x) ≤ Kc)
    (X₁ X₂ : Λ → ℝ)
    (hX : ∀ x ∈ labels, 0 < X₁ x ∧ (dyadicTop B₁) / 2 ≤ X₁ x ∧ X₁ x ≤ (dyadicTop B₁) ∧
      0 < X₂ x ∧ (dyadicTop B₂) / 2 ≤ X₂ x ∧ X₂ x ≤ (dyadicTop B₂))
    (D : ℝ) (hD0 : 0 ≤ D) (hD : ∀ y : O, y ≠ 0 → ‖eisEmbedding y‖ ^ 2 ≤ Kc →
      ∑ x ∈ labels.filter (fun x => V x ∣ y), ω x ≤ D)
    (C T : ℝ) (J : ℕ) (hC : 0 ≤ C) (hT : 0 ≤ T)
    (horiginal : ∀ (e : Fin 2 × Fin 2) (τ : ℝ × ℝ),
      length Z (scale e.1 * dyadicTop B₁) ≤ n + Real.logb Z 3 →
      length Z (scale e.2 * dyadicTop B₂) ≤ y + Real.logb Z 3 →
      mixedEnergy σ₁ σ₂ σA m 1 0 ((commonPair e τ).profile 0) ((commonPair e τ).profile 1) S β P
        (scale e.1 * (dyadicTop B₁)) (scale e.2 * (dyadicTop B₂)) keep ballProfile Kc ≤ C * pairWeight J τ * T)
    (hreference : ∀ (e : Fin 2 × Fin 2) (τ : ℝ × ℝ),
      min (length Z (scale e.1 * dyadicTop B₁)) (length Z (scale e.2 * dyadicTop B₂))
        ≤ short + Real.logb Z 3 →
      mixedEnergy σ₁ σ₂ σA m 1 0 ((commonPair e τ).profile 0) ((commonPair e τ).profile 1) S β P
        (scale e.1 * (dyadicTop B₁)) (scale e.2 * (dyadicTop B₂)) keep ballProfile Kc ≤ C * pairWeight J τ * T) :
    ∑ x ∈ labels, ω x * mixedEnergy σ₁ σ₂ σA m 1 0 p₀ p₁ S β P (X₁ x) (X₂ x)
        (fun y => V x ∣ y ∧ keep y) ballProfile (((Ideal.span {V x}).absNorm : ℝ) * K x) ≤
      (4 * D) * C * (∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ, 1 * pairMajorant p₀ p₁ hs₀ hs₁ e τ) *
        (∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
          1 * pairMajorant p₀ p₁ hs₀ hs₁ e τ * pairWeight J τ) * T := by
  apply grouped_ray_class_bound σ₁ σ₂ σA m keep hkeep p₀ p₁ hs₀ hs₁ S β P
    (dyadicTop B₁) (dyadicTop B₂) Kc (dyadicTop_pos _) (dyadicTop_pos _) hKc labels
    ω hω V K hK hscale X₁ X₂ hX D hD0 hD C T J hC hT
  intro e τ
  have hleft := common_scale_length Z B₁ hZ h₁ e.1
  have hright := common_scale_length Z B₂ hZ h₂ e.2
  rcases hshape with ⟨hn,hy⟩ | hs
  · exact horiginal e τ (by linarith) (by linarith)
  · apply hreference e τ
    rcases min_le_iff.mp hs with hl | hr
    · exact (min_le_left _ _).trans (by linarith)
    · exact (min_le_right _ _).trans (by linarith)

end ContinuumLocalReturn.AsymmetricRayShape
end
#print axioms ContinuumLocalReturn.AsymmetricRayShape.class_of_terminal_or_reference
