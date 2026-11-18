/- Copyright (c) 2026 Sil and the original authors. Apache-2.0.
This AI-assisted extension uses the pinned HeckeTwist, FiniteProfileExceptional
and PrincipalRectangle proofs. It keeps the actual scalar volume coefficient
of each induced character, with its own imprimitive Euler zeros. Equal products
of positive scales cancel the product of the two volumes at the common height.
-/
import Submissions.openai_baseline.OAI.NumberTheory.DirichletL.Moments.FixedRowMask
import Submissions.sil_density_split_20261026.CubeFree.FP.PrincipalQuantitative
import Submissions.arvi_repeated_marks_on_sil_face_20261025.FourthPower.PrincipalRectangle
import Submissions.openai_baseline.OAI.NumberTheory.DirichletL.Moments.FiniteProfileExceptionalRectangle

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency true
namespace ContinuumLocalReturn.AsymmetricRayException
noncomputable section
open scoped Classical BigOperators SchwartzMap ContDiff
open OAI OAI.SevenEighths HeckeFamily CenteredMomentHeckeVolume CenteredMomentHeckeCancellation
open CenteredMomentHeckeTwist CenteredMomentLattice CenteredMomentCounting CenteredMomentTwist
open CenteredMomentFiniteProfileExceptional EisensteinSchwartzPoisson
open Candidate.FourthPower.PrincipalRectangle (fractional_of_two_bounds)
local notation "O" => ActualEisensteinCubic.O

/-- Separate fixed inducing characters over the same exceptional row. The
completed coefficient functions may have different moduli and different zeros. -/
structure Coordinate (Q : Ideal O) (m A z : O) where
  puncture : O
  base : Character
  completed : Character
  inducing : Character
  period : Q ≤ inducing.modulus
  induced : CenteredExceptionalProfile.InducedBy completed inducing
  row : ∀ n, elementCoeff completed n = CanonicalRowCompletion.rowTwist
    (HeckeRowClosure.elementHom base) (m*puncture) 1 (A*z) n

/-- The unnormalized first-order saving with two actual scalar volume terms. -/
theorem two_character_saving
    (Q : Ideal O) (hQ : Q ≠ 0)
    (m A₀ z : O) (hmLam : ConcretePrimeRowBridge.goodLambda ∣ m) (hm2 : (2:O) ∣ m)
    (c₁ c₂ : Coordinate Q m A₀ z) (W₁ W₂ : ℝ → ℂ) (a₁ b₁ a₂ b₂ M₁ M₂ : ℝ)
    (ha₁ : 0 < a₁) (ha₂ : 0 < a₂) (hb₁ : 0 ≤ b₁) (hb₂ : 0 ≤ b₂)
    (hM₁ : 0 ≤ M₁) (hM₂ : 0 ≤ M₂)
    (hs₁ : Function.support W₁ ⊆ Set.Icc a₁ b₁)
    (hs₂ : Function.support W₂ ⊆ Set.Icc a₂ b₂)
    (hW₁ : ContDiff ℝ ∞ W₁) (hW₂ : ContDiff ℝ ∞ W₂)
    (hbound₁ : ∀ y, ‖W₁ y‖ ≤ M₁) (hbound₂ : ∀ y, ‖W₂ y‖ ≤ M₂)
    (t X₁ X₂ Y₁ Y₂ T L : ℝ) (hL : 0 < L)
    (hX₁ : L ≤ X₁) (hX₂ : L ≤ X₂) (hY₁ : L ≤ Y₁) (hY₂ : L ≤ Y₂)
    (hprodX : X₁ * X₂ = T) (hprodY : Y₁ * Y₂ = T) :
    let E := volumeControl Q c₁.completed (normPowerProfile W₁ a₁ b₁ ha₁ hs₁ hW₁ t) +
      volumeControl Q c₂.completed (normPowerProfile W₂ a₂ b₂ ha₂ hs₂ hW₂ t)
    ‖twistedIdealSum c₁.completed W₁ t X₁ * twistedIdealSum c₂.completed W₂ t X₂ -
      twistedIdealSum c₁.completed W₁ t Y₁ * twistedIdealSum c₂.completed W₂ t Y₂‖ ≤
      4 * E * (128 * (b₁ * M₁ + b₂ * M₂)) * (T / L) := by
  let V₁ := normPowerProfile W₁ a₁ b₁ ha₁ hs₁ hW₁ t
  let V₂ := normPowerProfile W₂ a₂ b₂ ha₂ hs₂ hW₂ t
  let E := volumeControl Q c₁.completed V₁ + volumeControl Q c₂.completed V₂
  let C := 128 * (b₁ * M₁ + b₂ * M₂)
  let v₁ := density (fixedPeriod Q) (fixedPeriod_ne_zero Q hQ) c₁.inducing c₁.completed.modulus *
    paperRadialFourier V₁ 0
  let v₂ := density (fixedPeriod Q) (fixedPeriod_ne_zero Q hQ) c₂.inducing c₂.completed.modulus *
    paperRadialFourier V₂ 0
  let m₁ := fun X : ℝ => (X : ℂ) ^ (1 + Complex.I * t) * v₁
  let m₂ := fun X : ℝ => (X : ℂ) ^ (1 + Complex.I * t) * v₂
  have hE₁ := volumeControl_nonneg Q c₁.completed V₁
  have hE₂ := volumeControl_nonneg Q c₂.completed V₂
  have hE : 0 ≤ E := add_nonneg hE₁ hE₂
  have hC : 0 ≤ C := mul_nonneg (by norm_num) (add_nonneg (mul_nonneg hb₁ hM₁) (mul_nonneg hb₂ hM₂))
  have hC₁ : 128 * b₁ * M₁ ≤ C := by dsimp only [C]; nlinarith [mul_nonneg hb₂ hM₂]
  have hC₂ : 128 * b₂ * M₂ ≤ C := by dsimp only [C]; nlinarith [mul_nonneg hb₁ hM₁]
  have he₁ (X : ℝ) (hX : L ≤ X) : ‖twistedIdealSum c₁.completed W₁ t X - m₁ X‖ ≤ E := by
    have h := twistedIdealSum_volume c₁.base c₁.completed c₁.inducing Q hQ c₁.period c₁.induced
      (m*c₁.puncture) A₀ z (hmLam.trans (dvd_mul_right _ _))
      (hm2.trans (dvd_mul_right _ _)) c₁.row W₁ a₁ b₁ ha₁ hs₁ hW₁ t X
      (lt_of_lt_of_le hL hX)
    change ‖_ - _ * v₁‖ ≤ E
    simpa only [v₁, mul_assoc] using h.trans (le_add_of_nonneg_right hE₂)
  have he₂ (X : ℝ) (hX : L ≤ X) : ‖twistedIdealSum c₂.completed W₂ t X - m₂ X‖ ≤ E := by
    have h := twistedIdealSum_volume c₂.base c₂.completed c₂.inducing Q hQ c₂.period c₂.induced
      (m*c₂.puncture) A₀ z (hmLam.trans (dvd_mul_right _ _))
      (hm2.trans (dvd_mul_right _ _)) c₂.row W₂ a₂ b₂ ha₂ hs₂ hW₂ t X
      (lt_of_lt_of_le hL hX)
    change ‖_ - _ * v₂‖ ≤ E
    simpa only [v₂, mul_assoc] using h.trans (le_add_of_nonneg_left hE₁)
  have hmain₁ (X : ℝ) (hX : L ≤ X) : ‖m₁ X‖ ≤ C * X := by
    have hv := (twisted_actual_volumeCoefficient_norm_le c₁.base c₁.completed c₁.inducing Q hQ c₁.period c₁.induced
      (m*c₁.puncture) A₀ z (hmLam.trans (dvd_mul_right _ _))
      (hm2.trans (dvd_mul_right _ _)) c₁.row W₁ a₁ b₁ M₁
      ha₁ hb₁ hM₁ hs₁ hW₁ hbound₁ t).trans hC₁
    dsimp only [m₁]
    rw [norm_mul, Complex.norm_cpow_eq_rpow_re_of_pos (lt_of_lt_of_le hL hX)]
    simp only [Complex.add_re, Complex.one_re, Complex.mul_re, Complex.I_re, zero_mul,
      Complex.ofReal_im, mul_zero, sub_self, add_zero, Real.rpow_one]
    nlinarith [mul_le_mul_of_nonneg_left hv (le_trans hL.le hX)]
  have habs₂ (X : ℝ) (hX : L ≤ X) : ‖twistedIdealSum c₂.completed W₂ t X‖ ≤ C * X :=
    (twistedIdealSum_absolute c₂.completed W₂ a₂ b₂ M₂ ha₂ hb₂ hM₂ hs₂ hW₂ hbound₂ t X
      (lt_of_lt_of_le hL hX)).trans (mul_le_mul_of_nonneg_right hC₂ (le_trans hL.le hX))
  have hmain : m₁ X₁ * m₂ X₂ = m₁ Y₁ * m₂ Y₂ := by
    have hpow := CenteredMoment.volume_products_eq
      (1 : ℂ) v₁ v₂ t X₁ X₂ Y₁ Y₂ (le_trans hL.le hX₁) (le_trans hL.le hX₂)
      (le_trans hL.le hY₁) (le_trans hL.le hY₂) (hprodX.trans hprodY.symm)
    simpa only [CenteredMoment.volumeTerm, one_mul, m₁, m₂] using hpow
  exact CenteredMoment.centered_saving_of_approx _ _ _ _ _ _ _ _
    X₁ X₂ Y₁ Y₂ T L C E hmain hC hE (he₁ X₁ hX₁) (he₂ X₂ hX₂)
    (he₁ Y₁ hY₁) (he₂ Y₂ hY₂) (habs₂ X₂ hX₂) (hmain₁ X₁ hX₁)
    (habs₂ Y₂ hY₂) (hmain₁ Y₁ hY₁) hL hX₁ hX₂ hY₁ hY₂ hprodX hprodY

/-- Positive side lengths, including subunit lengths, with any fractional saving. -/
theorem two_character_fractional
    (Q : Ideal O) (hQ : Q ≠ 0)
    (m A₀ z : O) (hmLam : ConcretePrimeRowBridge.goodLambda ∣ m) (hm2 : (2:O) ∣ m)
    (c₁ c₂ : Coordinate Q m A₀ z)
    (W₁ W₂ : ℝ → ℂ) (a₁ b₁ a₂ b₂ M₁ M₂ : ℝ)
    (ha₁ : 0 < a₁) (ha₂ : 0 < a₂) (hb₁ : 0 ≤ b₁) (hb₂ : 0 ≤ b₂)
    (hM₁ : 0 ≤ M₁) (hM₂ : 0 ≤ M₂)
    (hs₁ : Function.support W₁ ⊆ Set.Icc a₁ b₁)
    (hs₂ : Function.support W₂ ⊆ Set.Icc a₂ b₂)
    (hW₁ : ContDiff ℝ ∞ W₁) (hW₂ : ContDiff ℝ ∞ W₂)
    (hbound₁ : ∀ y, ‖W₁ y‖ ≤ M₁) (hbound₂ : ∀ y, ‖W₂ y‖ ≤ M₂)
    (t X₁ X₂ Y₁ Y₂ T L α : ℝ) (hL : 0 < L) (hα : 0 ≤ α) (hα1 : α ≤ 1)
    (hX₁ : L ≤ X₁) (hX₂ : L ≤ X₂) (hY₁ : L ≤ Y₁) (hY₂ : L ≤ Y₂)
    (hprodX : X₁*X₂=T) (hprodY : Y₁*Y₂=T) :
    let E := volumeControl Q c₁.completed (normPowerProfile W₁ a₁ b₁ ha₁ hs₁ hW₁ t) +
      volumeControl Q c₂.completed (normPowerProfile W₂ a₂ b₂ ha₂ hs₂ hW₂ t)
    let K := 4*E*(128*(b₁*M₁+b₂*M₂))+2*(128*b₁*M₁)*(128*b₂*M₂)
    ‖(Real.sqrt T : ℂ)⁻¹ *
      (twistedIdealSum c₁.completed W₁ t X₁*twistedIdealSum c₂.completed W₂ t X₂ -
        twistedIdealSum c₁.completed W₁ t Y₁*twistedIdealSum c₂.completed W₂ t Y₂)‖ ≤
      K*Real.sqrt T*L^(-α) := by
  let E := volumeControl Q c₁.completed (normPowerProfile W₁ a₁ b₁ ha₁ hs₁ hW₁ t) +
    volumeControl Q c₂.completed (normPowerProfile W₂ a₂ b₂ ha₂ hs₂ hW₂ t)
  let A := 4*E*(128*(b₁*M₁+b₂*M₂))
  let B := 2*(128*b₁*M₁)*(128*b₂*M₂)
  let D := twistedIdealSum c₁.completed W₁ t X₁*twistedIdealSum c₂.completed W₂ t X₂ -
    twistedIdealSum c₁.completed W₁ t Y₁*twistedIdealSum c₂.completed W₂ t Y₂
  have hT : 0 < T := hprodX ▸ mul_pos (hL.trans_le hX₁) (hL.trans_le hX₂)
  have hA : 0 ≤ A := by
    have he : 0 ≤ E := add_nonneg (volumeControl_nonneg _ _ _) (volumeControl_nonneg _ _ _)
    dsimp only [A]
    positivity
  have hB : 0 ≤ B := by dsimp only [B]; positivity
  have habs (U V : ℝ) (hU : 0 < U) (hV : 0 < V) (hUV : U*V=T) :
      ‖twistedIdealSum c₁.completed W₁ t U*twistedIdealSum c₂.completed W₂ t V‖ ≤
        (128*b₁*M₁)*(128*b₂*M₂)*T := by
    rw [norm_mul]
    have hh := mul_le_mul
      (twistedIdealSum_absolute c₁.completed W₁ a₁ b₁ M₁ ha₁ hb₁ hM₁ hs₁ hW₁ hbound₁ t U hU)
      (twistedIdealSum_absolute c₂.completed W₂ a₂ b₂ M₂ ha₂ hb₂ hM₂ hs₂ hW₂ hbound₂ t V hV)
      (norm_nonneg _) (by positivity)
    apply hh.trans_eq
    rw [← hUV]
    ring
  have hvol : ‖D‖ ≤ B*T := by
    have h := (norm_sub_le _ _).trans (add_le_add
      (habs X₁ X₂ (hL.trans_le hX₁) (hL.trans_le hX₂) hprodX)
      (habs Y₁ Y₂ (hL.trans_le hY₁) (hL.trans_le hY₂) hprodY))
    exact h.trans_eq (by dsimp only [B]; ring)
  have hsave : ‖D‖ ≤ A*(T/L) := two_character_saving
    Q hQ m A₀ z hmLam hm2 c₁ c₂ W₁ W₂ a₁ b₁ a₂ b₂ M₁ M₂
    ha₁ ha₂ hb₁ hb₂ hM₁ hM₂ hs₁ hs₂ hW₁ hW₂ hbound₁ hbound₂
    t X₁ X₂ Y₁ Y₂ T L hL hX₁ hX₂ hY₁ hY₂ hprodX hprodY
  have hraw := fractional_of_two_bounds ‖D‖ A B T L α hA hB hT.le hL hα hα1 hvol hsave
  change ‖(Real.sqrt T : ℂ)⁻¹*D‖ ≤ (A+B)*Real.sqrt T*L^(-α)
  rw [norm_mul,norm_inv,Complex.norm_real,Real.norm_eq_abs,abs_of_nonneg (Real.sqrt_nonneg T)]
  apply (mul_le_mul_of_nonneg_left hraw (inv_nonneg.mpr (Real.sqrt_nonneg T))).trans_eq
  have hs : 0 < Real.sqrt T := Real.sqrt_pos.mpr hT
  have he : Real.sqrt T*Real.sqrt T=T := Real.mul_self_sqrt hT.le
  have hc : (Real.sqrt T)⁻¹*T=Real.sqrt T := by
    calc
      _ = (Real.sqrt T)⁻¹*(Real.sqrt T*Real.sqrt T) := congrArg (fun x => (Real.sqrt T)⁻¹*x) he.symm
      _ = _ := inv_mul_cancel_left₀ hs.ne' _
  calc
    _ = (A+B)*((Real.sqrt T)⁻¹*T)*L^(-α) := by ring
    _ = _ := by rw [hc]

/-- Uniform finite-seminorm estimate on the unit balls in both coordinates. -/
theorem two_character_unit (a b ε B : ℝ)
    (ha : 0<a) (hb : 0≤b) (hε : 0<ε) (hB : 0≤B) :
    ∃ J : ℕ, ∃ S : Finset (ℕ×ℕ), (0,0)∈S ∧
      ∀ Q : Ideal O, Q≠0 → ∃ C : ℝ, 0<C ∧
      ∀ W₁ W₂ : 𝓢(ℝ,ℂ),
      Function.support (W₁:ℝ→ℂ)⊆Set.Icc a b →
      Function.support (W₂:ℝ→ℂ)⊆Set.Icc a b →
      S.sup (schwartzSeminormFamily ℝ ℝ ℂ) W₁≤1 →
      S.sup (schwartzSeminormFamily ℝ ℝ ℂ) W₂≤1 →
      ∀ Z : ℝ, 1≤Z →
      ∀ m A z : O, ConcretePrimeRowBridge.goodLambda∣m → (2:O)∣m →
      ∀ c₁ c₂ : Coordinate Q m A z,
      (Ideal.absNorm c₁.completed.modulus:ℝ)≤Z^B →
      (Ideal.absNorm c₂.completed.modulus:ℝ)≤Z^B →
      ∀ t X₁ X₂ Y₁ Y₂ T L : ℝ, 0<L →
      L≤X₁ → L≤X₂ → L≤Y₁ → L≤Y₂ → X₁*X₂=T → Y₁*Y₂=T →
      ‖(Real.sqrt T:ℂ)⁻¹*(twistedIdealSum c₁.completed W₁ t X₁*twistedIdealSum c₂.completed W₂ t X₂-
        twistedIdealSum c₁.completed W₁ t Y₁*twistedIdealSum c₂.completed W₂ t Y₂)‖ ≤
        C*Z^ε*(1+‖t‖)^J*(Real.sqrt T/L) := by
  obtain ⟨J,S,hS,hvol⟩ := volumeControl_source_control a b ε B ha hε hB
  refine ⟨J,S,hS,?_⟩
  intro Q hQ
  obtain ⟨D,hD,hDvol⟩ := hvol Q
  let V := 128*(b+b)
  have hV : 0≤V := by dsimp [V]; positivity
  refine ⟨1+8*D*V,by positivity,?_⟩
  intro W₁ W₂ hs₁ hs₂ hS₁ hS₂ Z hZ m A z hml hm2 c₁ c₂ hnorm₁ hnorm₂
    t X₁ X₂ Y₁ Y₂ T L hL hX₁ hX₂ hY₁ hY₂ hpX hpY
  have hbound₁ (y:ℝ) : ‖W₁ y‖≤1 :=
    (SchwartzMap.norm_le_seminorm ℝ W₁ y).trans
      ((Seminorm.le_finset_sup_apply (p:=schwartzSeminormFamily ℝ ℝ ℂ) hS).trans hS₁)
  have hbound₂ (y:ℝ) : ‖W₂ y‖≤1 :=
    (SchwartzMap.norm_le_seminorm ℝ W₂ y).trans
      ((Seminorm.le_finset_sup_apply (p:=schwartzSeminormFamily ℝ ℝ ℂ) hS).trans hS₂)
  have herr (χ : Character) (hnorm : (Ideal.absNorm χ.modulus:ℝ) ≤ Z^B)
      (W:𝓢(ℝ,ℂ)) (hs:Function.support (W:ℝ→ℂ)⊆Set.Icc a b)
      (hS':S.sup (schwartzSeminormFamily ℝ ℝ ℂ) W≤1) :
      volumeControl Q χ (normPowerProfile W a b ha hs (W.smooth ⊤) t) ≤
        D*Z^ε*(1+‖t‖)^J := by
    apply (hDvol W hs Z hZ χ hnorm t).trans
    simpa only [mul_one] using
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_left hS' hD.le) (Real.rpow_nonneg (by linarith) _))
        (show 0≤(1+‖t‖)^J by positivity)
  have hraw := two_character_saving Q hQ m A z hml hm2 c₁ c₂
    W₁ W₂ a b a b 1 1 ha ha hb hb zero_le_one zero_le_one hs₁ hs₂
    (W₁.smooth ⊤) (W₂.smooth ⊤) hbound₁ hbound₂
    t X₁ X₂ Y₁ Y₂ T L hL hX₁ hX₂ hY₁ hY₂ hpX hpY
  have hT : 0<T := hpX ▸ mul_pos (hL.trans_le hX₁) (hL.trans_le hX₂)
  have hn := CenteredMoment.normalized_centered_saving _ T L V _ hT (by
    simpa only [mul_one] using hraw)
  have hE := add_le_add (herr c₁.completed hnorm₁ W₁ hs₁ hS₁) (herr c₂.completed hnorm₂ W₂ hs₂ hS₂)
  have hr : 0≤Real.sqrt T/L := div_nonneg (Real.sqrt_nonneg _) hL.le
  calc
    _ ≤ _ := hn
    _ ≤ 4*(D*Z^ε*(1+‖t‖)^J+D*Z^ε*(1+‖t‖)^J)*V*(Real.sqrt T/L) := by
      gcongr
    _ = (8*D*V)*Z^ε*(1+‖t‖)^J*(Real.sqrt T/L) := by ring
    _ ≤ (1+8*D*V)*Z^ε*(1+‖t‖)^J*(Real.sqrt T/L) := by
      gcongr
      linarith

/-- The normalized exceptional bound, uniform in both moving moduli, all four
positive scales and both independent profiles. -/
theorem two_character_control (a b ε B : ℝ)
    (ha : 0<a) (hb : 0≤b) (hε : 0<ε) (hB : 0≤B) :
    ∃ J : ℕ, ∃ S : Finset (ℕ×ℕ), (0,0)∈S ∧
      ∀ Q : Ideal O, Q≠0 → ∃ C : ℝ, 0<C ∧
      ∀ W₁ W₂ : 𝓢(ℝ,ℂ),
      Function.support (W₁:ℝ→ℂ)⊆Set.Icc a b →
      Function.support (W₂:ℝ→ℂ)⊆Set.Icc a b →
      ∀ Z : ℝ, 1≤Z →
      ∀ m A z : O, ConcretePrimeRowBridge.goodLambda∣m → (2:O)∣m →
      ∀ c₁ c₂ : Coordinate Q m A z,
      (Ideal.absNorm c₁.completed.modulus:ℝ)≤Z^B →
      (Ideal.absNorm c₂.completed.modulus:ℝ)≤Z^B →
      ∀ t X₁ X₂ Y₁ Y₂ T L : ℝ, 0<L →
      L≤X₁ → L≤X₂ → L≤Y₁ → L≤Y₂ → X₁*X₂=T → Y₁*Y₂=T →
      ‖(Real.sqrt T:ℂ)⁻¹*(twistedIdealSum c₁.completed W₁ t X₁*twistedIdealSum c₂.completed W₂ t X₂-
        twistedIdealSum c₁.completed W₁ t Y₁*twistedIdealSum c₂.completed W₂ t Y₂)‖ ≤
        C*(sourceControl S W₁*sourceControl S W₂)*Z^ε*(1+‖t‖)^J*(Real.sqrt T/L) := by
  obtain ⟨J,S,hS,hunit⟩ := two_character_unit a b ε B ha hb hε hB
  refine ⟨J,S,hS,?_⟩
  intro Q hQ
  obtain ⟨C,hC,hbound⟩ := hunit Q hQ
  refine ⟨C,hC,?_⟩
  intro W₁ W₂ hs₁ hs₂ Z hZ m A z hml hm2 c₁ c₂ hnorm₁ hnorm₂
    t X₁ X₂ Y₁ Y₂ T L hL hX₁ hX₂ hY₁ hY₂ hpX hpY
  have h := hbound (normalizedProfile S W₁) (normalizedProfile S W₂)
    ((normalizedProfile_support S W₁).trans hs₁)
    ((normalizedProfile_support S W₂).trans hs₂)
    (normalizedProfile_control S W₁) (normalizedProfile_control S W₂)
    Z hZ m A z hml hm2 c₁ c₂ hnorm₁ hnorm₂
    t X₁ X₂ Y₁ Y₂ T L hL hX₁ hX₂ hY₁ hY₂ hpX hpY
  have heq : (Real.sqrt T:ℂ)⁻¹*(twistedIdealSum c₁.completed W₁ t X₁*twistedIdealSum c₂.completed W₂ t X₂-
      twistedIdealSum c₁.completed W₁ t Y₁*twistedIdealSum c₂.completed W₂ t Y₂) =
      ((sourceControl S W₁*sourceControl S W₂:ℝ):ℂ)*
      ((Real.sqrt T:ℂ)⁻¹*(twistedIdealSum c₁.completed (normalizedProfile S W₁) t X₁*
        twistedIdealSum c₂.completed (normalizedProfile S W₂) t X₂-
        twistedIdealSum c₁.completed (normalizedProfile S W₁) t Y₁*
        twistedIdealSum c₂.completed (normalizedProfile S W₂) t Y₂)) := by
    rw [twistedIdealSum_normalized S hS c₁.completed W₁ t X₁,
      twistedIdealSum_normalized S hS c₂.completed W₂ t X₂,
      twistedIdealSum_normalized S hS c₁.completed W₁ t Y₁,
      twistedIdealSum_normalized S hS c₂.completed W₂ t Y₂]
    push_cast
    ring
  rw [heq,norm_mul,Complex.norm_real,Real.norm_of_nonneg
    (mul_nonneg (sourceControl_nonneg S W₁) (sourceControl_nonneg S W₂))]
  exact (mul_le_mul_of_nonneg_left h
    (mul_nonneg (sourceControl_nonneg S W₁) (sourceControl_nonneg S W₂))).trans_eq (by ring)

open CenteredMomentHeckeHeight
/-- Physical equal-product rectangle with independent moving coprimality
punctures. Fixed inducing witnesses are required only on the original row.
The native mask identity applies the test `IsCoprime n rᵢ` at every element,
and the resulting two conductor bounds are explicit. -/
theorem punctured_physical_rectangle (a b ε B : ℝ)
    (ha : 0<a) (hb : 0≤b) (hε : 0<ε) (hB : 0≤B) :
    ∃ J : ℕ, ∃ S : Finset (ℕ×ℕ), (0,0)∈S ∧
      ∀ Q : Ideal O, Q≠0 → ∃ C : ℝ, 0<C ∧
      ∀ W₁ W₂ : 𝓢(ℝ,ℂ),
      Function.support (W₁:ℝ→ℂ)⊆Set.Icc a b →
      Function.support (W₂:ℝ→ℂ)⊆Set.Icc a b →
      ∀ Z : ℝ, 1≤Z →
      ∀ (η₁ η₂ : Character) (m r₁ r₂ A z : O),
      m≠0 → r₁≠0 → r₂≠0 → A≠0 → z≠0 →
      ConcretePrimeRowBridge.goodLambda∣m → (2:O)∣m →
      (HeckeRowClosure.rowConductorBound η₁ (m*r₁) 1 (A*z):ℝ) ≤ Z^B →
      (HeckeRowClosure.rowConductorBound η₂ (m*r₂) 1 (A*z):ℝ) ≤ Z^B →
      CenteredExceptionalProfile.FixedInducingRow η₁ Q m A z →
      CenteredExceptionalProfile.FixedInducingRow η₂ Q m A z →
      ∀ t X₁ X₂ Y₁ Y₂ T L : ℝ, 0<L →
      L≤X₁ → L≤X₂ → L≤Y₁ → L≤Y₂ → X₁*X₂=T → Y₁*Y₂=T →
      ‖(Real.sqrt T:ℂ)⁻¹*(rowTwistedSum η₁ (m*r₁) A z W₁ t X₁*rowTwistedSum η₂ (m*r₂) A z W₂ t X₂-
        rowTwistedSum η₁ (m*r₁) A z W₁ t Y₁*rowTwistedSum η₂ (m*r₂) A z W₂ t Y₂)‖ ≤
        C*(sourceControl S W₁*sourceControl S W₂)*Z^ε*(1+‖t‖)^J*(Real.sqrt T/L) := by
  obtain ⟨J,S,hS,hcontrol⟩ := two_character_control a b ε B ha hb hε hB
  refine ⟨J,S,hS,?_⟩
  intro Q hQ
  obtain ⟨C,hC,hbound⟩ := hcontrol Q hQ
  refine ⟨C,hC,?_⟩
  intro W₁ W₂ hs₁ hs₂ Z hZ η₁ η₂ m r₁ r₂ A z hm hr₁ hr₂ hA hz hLam h2
    hb₁ hb₂ hex₁ hex₂ t X₁ X₂ Y₁ Y₂ T L hL hX₁ hX₂ hY₁ hY₂ hpX hpY
  have complete (η : Character) (r : O) (hr : r≠0)
      (hb' : (HeckeRowClosure.rowConductorBound η (m*r) 1 (A*z):ℝ) ≤ Z^B)
      (hex : CenteredExceptionalProfile.FixedInducingRow η Q m A z) :
      ∃ c : Coordinate Q m A z, c.base=η ∧ c.puncture=r ∧
        (Ideal.absNorm c.completed.modulus:ℝ) ≤ Z^B := by
    have hmr := (CenteredMomentFixedRowMask.fixedInducingRow_mul_mask_iff η Q m r A z
      hm hr hA hz hLam h2).mpr hex
    obtain ⟨χ,ψ,hχ,_,hi,hp,hw⟩ := fixedInducingRow_controlled η Q (m*r) A z
      (mul_ne_zero hm hr) hA hz (hLam.trans (dvd_mul_right _ _)) (h2.trans (dvd_mul_right _ _)) hmr
    refine ⟨⟨r,η,χ,ψ,hp,hi,hw⟩,rfl,rfl,?_⟩
    exact (show (Ideal.absNorm χ.modulus:ℝ) ≤ HeckeRowClosure.rowConductorBound η (m*r) 1 (A*z)
      by exact_mod_cast hχ).trans hb'
  obtain ⟨c₁,hη₁,hp₁,hχ₁⟩ := complete η₁ r₁ hr₁ hb₁ hex₁
  obtain ⟨c₂,hη₂,hp₂,hχ₂⟩ := complete η₂ r₂ hr₂ hb₂ hex₂
  subst η₁ η₂ r₁ r₂
  simp_rw [rowTwistedSum_eq c₁.base c₁.completed (m*c₁.puncture) A z c₁.row,
    rowTwistedSum_eq c₂.base c₂.completed (m*c₂.puncture) A z c₂.row]
  exact hbound W₁ W₂ hs₁ hs₂ Z hZ m A z hLam h2 c₁ c₂ hχ₁ hχ₂
    t X₁ X₂ Y₁ Y₂ T L hL hX₁ hX₂ hY₁ hY₂ hpX hpY


namespace CubeFree
open QRH.SilDensitySplit.CubeFree.FP
open CanonicalQuadraticSieve CenteredMomentSourceMass
open QRH.Record1252270103TwoIdeal QRH.Record1252270103KernelMass
open KernelFormal KernelAllocationIdentity KernelRestrictedState KernelRowExpansion
open KernelRowProfiles KernelRowPools KernelSelectedMass PrincipalKernel ReferencePrimeEnclosure
open OAI.IdealMobiusDivisorSum (idealDivisors)
local notation "Id" => Ideal ActualEisensteinCubic.O

/-- The two literal completed ideal coefficients, with their natural zeros. -/
def joint (χ : Character × Character) (n : IdealPair) : ℂ :=
  idealCoeff χ.1 n.1 * idealCoeff χ.2 n.2

private theorem joint_multiply (χ : Character × Character) (d a : IdealPair) :
    joint χ (multiplyPair d a) = joint χ d * joint χ a := by
  simp only [joint,multiplyPair,map_mul]
  ring

private theorem joint_norm (χ : Character × Character) (n : IdealPair) : ‖joint χ n‖ ≤ 1 := by
  simpa only [joint,norm_mul,one_mul] using
    mul_le_mul (idealCoeff_norm_le_one χ.1 n.1) (idealCoeff_norm_le_one χ.2 n.2)
      (norm_nonneg _) zero_le_one

private theorem reindex (D : Finset IdealPair)
    (hnz : ∀ n ∈ D, n.1 ≠ 0 ∧ n.2 ≠ 0) (χ : Character × Character)
    (f k r : IdealPair → ℂ) :
    (∑ n ∈ D, ∑ d ∈ idealDivisors n.1 ×ˢ idealDivisors n.2,
      k d*r (cofactorPair n.1 n.2 d)*joint χ n*f n) =
      ∑ d ∈ divisorPool D, k d*joint χ d*
        ∑ a ∈ residualPool D d, r a*joint χ a*f (multiplyPair d a) := by
  rw [finite_divisor_reindex D hnz
    (fun n d a => k d*r a*joint χ n*f n)]
  simp_rw [joint_multiply]
  rw [expandedPairs_grouped D
    (fun d a => k d*r a*(joint χ d*joint χ a)*f (multiplyPair d a))]
  apply Finset.sum_congr rfl
  intro d _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro a _
  ring

def twoRow (χ : Character × Character) (D : Finset IdealPair) (r : IdealPair → ℂ)
    (W₁ W₂ : ℝ → ℂ) (X₁ X₂ : ℝ) : ℂ :=
  (Real.sqrt (X₁*X₂) : ℂ)⁻¹ *
    ∑ n ∈ D, r n*joint χ n*pairProfile W₁ W₂ X₁ X₂ n

private def scalar (χ : Character × Character) (k : IdealPair → ℂ) (d : IdealPair) : ℂ :=
  k d*joint χ d/(Real.sqrt (pairNorm d) : ℂ)

private theorem normalized_extraction_two (χ : Character × Character) (d : IdealPair)
    (hd : d.1 ≠ 0 ∧ d.2 ≠ 0) (A : Finset IdealPair) (k : IdealPair → ℂ)
    (r : IdealPair → ℂ) (W₁ W₂ : ℝ → ℂ) (X₁ X₂ : ℝ)
    (hX₁ : 0 < X₁) (hX₂ : 0 < X₂) :
    (Real.sqrt (X₁*X₂) : ℂ)⁻¹ * (k d*joint χ d*
      ∑ a ∈ A, r a*joint χ a*pairProfile W₁ W₂ X₁ X₂ (multiplyPair d a)) =
      scalar χ k d *
        twoRow χ A r W₁ W₂ (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2) := by
  simp_rw [profile_multiply]
  have he : (X₁/(Ideal.absNorm d.1 : ℝ))*(X₂/(Ideal.absNorm d.2 : ℝ)) =
      (X₁*X₂)/pairNorm d := by unfold pairNorm; ring
  unfold scalar twoRow
  rw [he,central_normalization (X₁*X₂) (pairNorm d)
    (mul_pos hX₁ hX₂) (pairNorm_pos hd.1 hd.2)]
  ring

private theorem scalar_bound (χ : Character × Character) (k : IdealPair → ℂ) (d : IdealPair) :
    ‖scalar χ k d‖ ≤ ‖k d‖/(Real.sqrt (pairNorm d)) := by
  unfold scalar
  rw [norm_div,norm_mul,Complex.norm_real,Real.norm_eq_abs,
    abs_of_nonneg (Real.sqrt_nonneg _)]
  apply div_le_div_of_nonneg_right _ (Real.sqrt_nonneg _)
  exact mul_le_of_le_one_right (norm_nonneg _) (joint_norm χ d)

private theorem row_expansion_two (S : Finset PrimeIdeal) (live : S → Bool) (D : Finset IdealPair)
    (hnz : ∀ n ∈ D, n.1 ≠ 0 ∧ n.2 ≠ 0)
    (hs : ∀ n ∈ D, pairSupport n.1 n.2 ⊆ primeValues S)
    (χ : Character × Character) (f : IdealPair → ℂ) :
    (∑ n ∈ D, restrictedValue S live n*joint χ n*f n) =
      ∑ d ∈ divisorPool D,
        (kernelOn S (fun P => localSeries (live P)) d.1 d.2 : ℂ)*joint χ d*
          ∑ a ∈ residualPool D d, joint χ a*f (multiplyPair d a) := by
  have hp (n : IdealPair) (hn : n ∈ D) : restrictedValue S live n =
      ∑ d ∈ idealDivisors n.1 ×ˢ idealDivisors n.2,
        (kernelOn S (fun P => localSeries (live P)) d.1 d.2 : ℂ) := by
    have h := congrArg (fun z : ℤ => (z : ℂ))
      (PrincipalKernel.divisor_identity S live (hnz n hn).1 (hnz n hn).2 (hs n hn))
    push_cast at h
    exact h.symm
  calc
    _ = ∑ n ∈ D, ∑ d ∈ idealDivisors n.1 ×ˢ idealDivisors n.2,
        (kernelOn S (fun P => localSeries (live P)) d.1 d.2 : ℂ)*joint χ n*f n := by
      apply Finset.sum_congr rfl
      intro n hn
      rw [hp n hn]
      simp only [Finset.sum_mul]
    _ = _ := by
      simpa only [mul_one,one_mul] using reindex D hnz χ f
        (fun d => (kernelOn S (fun P => localSeries (live P)) d.1 d.2 : ℂ)) (fun _ => 1)

private theorem normalized_expansion_two (S : Finset PrimeIdeal) (live : S → Bool) (D : Finset IdealPair)
    (hnz : ∀ n ∈ D, n.1 ≠ 0 ∧ n.2 ≠ 0)
    (hs : ∀ n ∈ D, pairSupport n.1 n.2 ⊆ primeValues S)
    (χ : Character × Character) (W₁ W₂ : ℝ → ℂ) (X₁ X₂ : ℝ)
    (hX₁ : 0 < X₁) (hX₂ : 0 < X₂) :
    twoRow χ D (restrictedValue S live) W₁ W₂ X₁ X₂ =
      ∑ d ∈ divisorPool D,
        scalar χ (fun e => (kernelOn S (fun P => localSeries (live P)) e.1 e.2 : ℂ)) d*
          twoRow χ (residualPool D d) (fun _ => 1) W₁ W₂
            (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2) := by
  unfold twoRow
  rw [row_expansion_two S live D hnz hs χ (pairProfile W₁ W₂ X₁ X₂),Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro d hd
  simpa only [twoRow,one_mul,Finset.mul_sum] using
    normalized_extraction_two χ d (divisorPool_nonzero D hnz hd) (residualPool D d)
      (fun e => (kernelOn S (fun P => localSeries (live P)) e.1 e.2 : ℂ))
      (fun _ => 1) W₁ W₂ X₁ X₂ hX₁ hX₂

private theorem cutoff_invariance_two (χ : Character × Character) (S : Finset PrimeIdeal) (r : IdealPair → ℂ)
    (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ U₁ U₂ : ℝ)
    (hb : 0 ≤ b) (hX₁ : 0 < X₁) (hX₂ : 0 < X₂)
    (hU₁ : X₁ ≤ U₁) (hU₂ : X₂ ≤ U₂)
    (hW₁ : Function.support W₁ ⊆ Set.Iic b) (hW₂ : Function.support W₂ ⊆ Set.Iic b) :
    twoRow χ (supportedRectangle S b U₁ U₂) r W₁ W₂ X₁ X₂ =
      twoRow χ (supportedRectangle S b X₁ X₂) r W₁ W₂ X₁ X₂ := by
  have hsub : supportedRectangle S b X₁ X₂ ⊆ supportedRectangle S b U₁ U₂ := by
    intro n hn
    obtain ⟨hn,hs⟩ := Finset.mem_filter.mp hn
    obtain ⟨hi,hj⟩ := Finset.mem_product.mp hn
    obtain ⟨hiz,hin⟩ := (mem_idealBall _ _).mp hi
    obtain ⟨hjz,hjn⟩ := (mem_idealBall _ _).mp hj
    exact Finset.mem_filter.mpr ⟨Finset.mem_product.mpr
      ⟨(mem_idealBall _ _).mpr ⟨hiz,hin.trans (mul_le_mul_of_nonneg_left hU₁ hb)⟩,
        (mem_idealBall _ _).mpr ⟨hjz,hjn.trans (mul_le_mul_of_nonneg_left hU₂ hb)⟩⟩,hs⟩
  unfold twoRow
  congr 1
  symm
  apply Finset.sum_subset hsub
  intro n hn hnot
  have hz : pairProfile W₁ W₂ X₁ X₂ n=0 := by
    by_contra h
    obtain ⟨h₁,h₂⟩ := mul_ne_zero_iff.mp h
    have hnz := supportedRectangle_nonzero hn
    apply hnot
    exact Finset.mem_filter.mpr ⟨Finset.mem_product.mpr
      ⟨(mem_idealBall _ _).mpr ⟨hnz.1,(div_le_iff₀ hX₁).mp (hW₁ h₁)⟩,
        (mem_idealBall _ _).mpr ⟨hnz.2,(div_le_iff₀ hX₂).mp (hW₂ h₂)⟩⟩,
        (Finset.mem_filter.mp hn).2⟩
  rw [hz,mul_zero]

private theorem centered_expansion_two (S : Finset PrimeIdeal) (live : S → Bool)
    (χ : Character × Character) (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ Y₁ Y₂ U₁ U₂ : ℝ)
    (hb : 0 ≤ b) (hX₁ : 0 < X₁) (hX₂ : 0 < X₂) (hY₁ : 0 < Y₁) (hY₂ : 0 < Y₂)
    (hXU₁ : X₁ ≤ U₁) (hXU₂ : X₂ ≤ U₂) (hYU₁ : Y₁ ≤ U₁) (hYU₂ : Y₂ ≤ U₂)
    (hW₁ : Function.support W₁ ⊆ Set.Iic b) (hW₂ : Function.support W₂ ⊆ Set.Iic b) :
    twoRow χ (supportedRectangle S b X₁ X₂) (restrictedValue S live) W₁ W₂ X₁ X₂ -
      twoRow χ (supportedRectangle S b Y₁ Y₂) (restrictedValue S live) W₁ W₂ Y₁ Y₂ =
      ∑ d ∈ divisorPool (supportedRectangle S b U₁ U₂),
        scalar χ (fun e => (kernelOn S (fun P => localSeries (live P)) e.1 e.2 : ℂ)) d*
          (twoRow χ (supportedRectangle S b (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2))
              (fun _ => 1) W₁ W₂ (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2) -
            twoRow χ (supportedRectangle S b (Y₁/Ideal.absNorm d.1) (Y₂/Ideal.absNorm d.2))
              (fun _ => 1) W₁ W₂ (Y₁/Ideal.absNorm d.1) (Y₂/Ideal.absNorm d.2)) := by
  rw [← cutoff_invariance_two χ S (restrictedValue S live) W₁ W₂ b X₁ X₂ U₁ U₂
    hb hX₁ hX₂ hXU₁ hXU₂ hW₁ hW₂,
    ← cutoff_invariance_two χ S (restrictedValue S live) W₁ W₂ b Y₁ Y₂ U₁ U₂
      hb hY₁ hY₂ hYU₁ hYU₂ hW₁ hW₂]
  rw [normalized_expansion_two S live _ (fun _ h => supportedRectangle_nonzero h)
      (fun _ h => (Finset.mem_filter.mp h).2) χ W₁ W₂ X₁ X₂ hX₁ hX₂,
    normalized_expansion_two S live _ (fun _ h => supportedRectangle_nonzero h)
      (fun _ h => (Finset.mem_filter.mp h).2) χ W₁ W₂ Y₁ Y₂ hY₁ hY₂,
    ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro d hd
  rw [← mul_sub,residual_rectangle hd]
  have hd0 := divisor_supported hd
  have hn₁ := ideal_norm_one_le hd0.1
  have hn₂ := ideal_norm_one_le hd0.2.1
  rw [cutoff_invariance_two χ S (fun _ => 1) W₁ W₂ b
    (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2) _ _ hb
    (shortened_positive_le hX₁ hd0.1).1 (shortened_positive_le hX₂ hd0.2.1).1
    (div_le_div_of_nonneg_right hXU₁ (zero_le_one.trans hn₁))
    (div_le_div_of_nonneg_right hXU₂ (zero_le_one.trans hn₂)) hW₁ hW₂,
    cutoff_invariance_two χ S (fun _ => 1) W₁ W₂ b
      (Y₁/Ideal.absNorm d.1) (Y₂/Ideal.absNorm d.2) _ _ hb
      (shortened_positive_le hY₁ hd0.1).1 (shortened_positive_le hY₂ hd0.2.1).1
      (div_le_div_of_nonneg_right hYU₁ (zero_le_one.trans hn₁))
      (div_le_div_of_nonneg_right hYU₂ (zero_le_one.trans hn₂)) hW₁ hW₂]

private theorem natural_pair_two (χ : Character × Character) (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ)
    (hX₁ : 0 < X₁) (hX₂ : 0 < X₂)
    (hW₁ : Function.support W₁ ⊆ Set.Iic b) (hW₂ : Function.support W₂ ⊆ Set.Iic b) :
    twoRow χ (rectangle b X₁ X₂) (fun _ => 1) W₁ W₂ X₁ X₂ =
      HeckeDyadic.polynomial χ.1 false W₁ X₁ 0 0 *
        HeckeDyadic.polynomial χ.2 false W₂ X₂ 0 0 := by
  rw [natural_polynomial_finite χ.1 W₁ b X₁ hX₁ hW₁,
    natural_polynomial_finite χ.2 W₂ b X₂ hX₂ hW₂]
  unfold twoRow
  rw [Real.sqrt_mul hX₁.le,Complex.ofReal_mul,mul_inv_rev]
  simp only [rectangle,Finset.sum_product,joint,pairProfile,one_mul]
  simp only [Finset.mul_sum,Finset.sum_mul]
  conv_rhs => rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro I hi
  apply Finset.sum_congr rfl
  intro J hj
  ring

private theorem enclosed_two (χ : Character × Character) (S : Finset PrimeIdeal) (b X₁ X₂ : ℝ)
    (W₁ W₂ : ℝ → ℂ) (r : Id × Id → ℂ)
    (hχ : ∀ I, ¬Supported I → idealCoeff χ.1 I = 0 ∧ idealCoeff χ.2 I = 0)
    (henclose : ∀ I, Supported I →
      ((Ideal.absNorm I : ℝ) ≤ b*X₁ ∨ (Ideal.absNorm I : ℝ) ≤ b*X₂) →
      primeSupport I ⊆ primeValues S) :
    twoRow χ (supportedRectangle S b X₁ X₂) r W₁ W₂ X₁ X₂ =
      twoRow χ (rectangle b X₁ X₂) r W₁ W₂ X₁ X₂ := by
  unfold twoRow supportedRectangle
  congr 1
  apply Finset.sum_subset (Finset.filter_subset _ _)
  intro n hn hnot
  have hn' : ¬pairSupport n.1 n.2 ⊆ primeValues S :=
    fun hs => hnot (Finset.mem_filter.mpr ⟨hn,hs⟩)
  have hbad : ¬Supported (n.1*n.2) := by
    intro hgood
    have hparts := (supported_mul_iff _ _).mp hgood
    have hmem := Finset.mem_product.mp hn
    apply hn'
    exact Finset.union_subset
      (henclose n.1 hparts.1 (Or.inl ((mem_idealBall _ _).mp hmem.1).2))
      (henclose n.2 hparts.2 (Or.inr ((mem_idealBall _ _).mp hmem.2).2))
  by_cases h₁ : Supported n.1
  · have h₂ : ¬Supported n.2 := fun hh => hbad ((supported_mul_iff _ _).mpr ⟨h₁,hh⟩)
    simp [joint,(hχ _ h₂).2]
  · simp [joint,(hχ _ h₁).1]

private theorem plain_pair_two (χ : Character × Character) (S : Finset PrimeIdeal) (W₁ W₂ : ℝ → ℂ)
    (b X₁ X₂ : ℝ) (hX₁ : 0 < X₁) (hX₂ : 0 < X₂)
    (hW₁ : Function.support W₁ ⊆ Set.Iic b) (hW₂ : Function.support W₂ ⊆ Set.Iic b)
    (hχ : ∀ I, ¬Supported I → idealCoeff χ.1 I = 0 ∧ idealCoeff χ.2 I = 0)
    (henclose : ∀ I, Supported I →
      ((Ideal.absNorm I : ℝ) ≤ b*X₁ ∨ (Ideal.absNorm I : ℝ) ≤ b*X₂) →
      primeSupport I ⊆ primeValues S) :
    twoRow χ (supportedRectangle S b X₁ X₂) (fun _ => 1) W₁ W₂ X₁ X₂ =
      (Real.sqrt (X₁*X₂) : ℂ)⁻¹*
        (twistedIdealSum χ.1 W₁ 0 X₁*twistedIdealSum χ.2 W₂ 0 X₂) := by
  rw [enclosed_two χ S b X₁ X₂ W₁ W₂ (fun _ => 1) hχ henclose,
    natural_pair_two χ W₁ W₂ b X₁ X₂ hX₁ hX₂ hW₁ hW₂,
    PrincipalRestricted.polynomial_zero χ.1 W₁ b X₁ hX₁ hW₁,PrincipalRestricted.polynomial_zero χ.2 W₂ b X₂ hX₂ hW₂,
    Real.sqrt_mul hX₁.le,Complex.ofReal_mul,mul_inv_rev]
  ring

private theorem actual_scalar_cost_two (χ : Character × Character) (S : Finset PrimeIdeal) (A : S → LocalSeries)
    (d : Id × Id) (hd : d.1 ≠ 0 ∧ d.2 ≠ 0)
    (T L α : ℝ) (hT : 0 ≤ T) (hL : 0 < L) :
    ‖scalar χ (fun e => (kernelOn S A e.1 e.2 : ℂ)) d‖*
        Real.sqrt (T/pairNorm d)*(L/pairNorm d)^(-α) ≤
      idealWeight S A (1-α) (1-α) d*Real.sqrt T*L^(-α) := by
  have hn := pairNorm_pos hd.1 hd.2
  have hh := scalar_bound χ (fun e => (kernelOn S A e.1 e.2 : ℂ)) d
  apply (mul_le_mul_of_nonneg_right
    (mul_le_mul_of_nonneg_right hh (Real.sqrt_nonneg _)) (Real.rpow_nonneg (by positivity) _)).trans_eq
  rw [← Complex.ofReal_intCast,Complex.norm_real,Real.norm_eq_abs,div_eq_mul_inv,PrincipalExtraction.pair_weight S A (1-α) d hd]
  calc
    _ = |(kernelOn S A d.1 d.2 : ℝ)| *
        ((Real.sqrt (pairNorm d))⁻¹*Real.sqrt (T/pairNorm d)*(L/pairNorm d)^(-α)) := by ring
    _ = _ := by rw [PrincipalExtraction.fractional_cost T L (pairNorm d) α hT hL hn]; ring

private theorem sum_bound_two (χ : Character × Character) (S : Finset PrimeIdeal) (A : S → LocalSeries)
    (D : Finset (Id × Id)) (hd : ∀ d ∈ D, d.1 ≠ 0 ∧ d.2 ≠ 0)
    (G : (Id × Id) → ℂ) (T L α C M : ℝ)
    (hT : 0 ≤ T) (hL : 0 < L) (hC : 0 ≤ C)
    (hmass : (∑ d ∈ D, idealWeight S A (1-α) (1-α) d) ≤ M)
    (hG : ∀ d ∈ D, ‖G d‖ ≤ C*Real.sqrt (T/pairNorm d)*(L/pairNorm d)^(-α)) :
    ‖∑ d ∈ D, scalar χ (fun e => (kernelOn S A e.1 e.2 : ℂ)) d*G d‖ ≤
      C*M*Real.sqrt T*L^(-α) := by
  calc
    _ ≤ ∑ d ∈ D, ‖scalar χ (fun e => (kernelOn S A e.1 e.2 : ℂ)) d*G d‖ :=
      norm_sum_le _ _
    _ ≤ ∑ d ∈ D, C*(idealWeight S A (1-α) (1-α) d*Real.sqrt T*L^(-α)) := by
      apply Finset.sum_le_sum
      intro d hD
      rw [norm_mul]
      calc
        _ ≤ ‖scalar χ (fun e => (kernelOn S A e.1 e.2 : ℂ)) d‖*
            (C*Real.sqrt (T/pairNorm d)*(L/pairNorm d)^(-α)) :=
          mul_le_mul_of_nonneg_left (hG d hD) (norm_nonneg _)
        _ = C*(‖scalar χ (fun e => (kernelOn S A e.1 e.2 : ℂ)) d‖*
            Real.sqrt (T/pairNorm d)*(L/pairNorm d)^(-α)) := by ring
        _ ≤ _ := mul_le_mul_of_nonneg_left (actual_scalar_cost_two χ S A d (hd d hD) T L α hT hL) hC
    _ = C*(∑ d ∈ D, idealWeight S A (1-α) (1-α) d)*Real.sqrt T*L^(-α) := by
      simp only [← Finset.sum_mul,← Finset.mul_sum]
      ring
    _ ≤ _ := mul_le_mul_of_nonneg_right
      (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hmass hC) (Real.sqrt_nonneg _)) (by positivity)

/-- The native cube-free and forbidden-prime restriction. The Euler-kernel
mass at `1-α` gives every `α < 2/3`, including the `3/5` exceptional
saving. The integer kernel and common finite pool are exactly Sil’s. -/
theorem restricted_rectangle_two (α B ε : ℝ)
    (hα : 0 ≤ α) (hα23 : α < 2/3) (hB : 0 ≤ B) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ Z : ℝ, 1 ≤ Z → ∀ F : Id,
      F ≠ 0 → (Ideal.absNorm F : ℝ) ≤ Z^B →
      ∀ (S : Finset PrimeIdeal) (live : S → Bool),
      (∀ P ∈ S, Supported P.val) → (∀ P : S, live P=true → P.val.val ∣ F) →
      ∀ (Q : Id) (_hQ : Q ≠ 0) (m A₀ z : O), (ConcretePrimeRowBridge.goodLambda ∣ m) → ((2:O) ∣ m) →
      ∀ c₁ c₂ : Coordinate Q m A₀ z,
      (∀ I, ¬Supported I → idealCoeff c₁.completed I = 0 ∧ idealCoeff c₂.completed I = 0) →
      ∀ (W₁ W₂ : ℝ → ℂ) (a b M₁ M₂ : ℝ) (ha : 0 < a),
      0 ≤ b → 0 ≤ M₁ → 0 ≤ M₂ →
      ∀ (hs₁ : Function.support W₁ ⊆ Set.Icc a b)
        (hs₂ : Function.support W₂ ⊆ Set.Icc a b)
        (hW₁ : ContDiff ℝ ∞ W₁) (hW₂ : ContDiff ℝ ∞ W₂),
      (∀ y, ‖W₁ y‖ ≤ M₁) → (∀ y, ‖W₂ y‖ ≤ M₂) →
      ∀ X₁ X₂ Y₁ Y₂ U₁ U₂ T L : ℝ, 0 < L →
      L ≤ X₁ → L ≤ X₂ → L ≤ Y₁ → L ≤ Y₂ →
      X₁ ≤ U₁ → X₂ ≤ U₂ → Y₁ ≤ U₁ → Y₂ ≤ U₂ →
      X₁*X₂=T → Y₁*Y₂=T →
      (∀ I, Supported I →
        ((Ideal.absNorm I : ℝ) ≤ b*U₁ ∨ (Ideal.absNorm I : ℝ) ≤ b*U₂) →
        primeSupport I ⊆ primeValues S) →
      let E := volumeControl Q c₁.completed (normPowerProfile W₁ a b ha hs₁ hW₁ 0) +
        volumeControl Q c₂.completed (normPowerProfile W₂ a b ha hs₂ hW₂ 0)
      let K := 4*E*(128*(b*M₁+b*M₂))+2*(128*b*M₁)*(128*b*M₂)
      ‖twoRow (c₁.completed,c₂.completed) (supportedRectangle S b X₁ X₂) (restrictedValue S live) W₁ W₂ X₁ X₂ -
        twoRow (c₁.completed,c₂.completed) (supportedRectangle S b Y₁ Y₂) (restrictedValue S live) W₁ W₂ Y₁ Y₂‖ ≤
        C*Z^ε*K*Real.sqrt T*L^(-α) := by
  obtain ⟨C,hC,hmass⟩ := PrincipalKernel.ideal_mass (1-α) B ε (by linarith) hB hε
  refine ⟨C,hC,?_⟩
  intro Z hZ F hF hcut S live hS hlive Q hQ m A₀ z hmLam hm2 c₁ c₂ hχ W₁ W₂ a b M₁ M₂ ha hb hM₁ hM₂ hs₁ hs₂ hW₁ hW₂ hbound₁ hbound₂
    X₁ X₂ Y₁ Y₂ U₁ U₂ T L hL hX₁ hX₂ hY₁ hY₂ hXU₁ hXU₂ hYU₁ hYU₂ hpX hpY henclose
  let E := volumeControl Q c₁.completed (normPowerProfile W₁ a b ha hs₁ hW₁ 0) +
    volumeControl Q c₂.completed (normPowerProfile W₂ a b ha hs₂ hW₂ 0)
  let K := 4*E*(128*(b*M₁+b*M₂))+2*(128*b*M₁)*(128*b*M₂)
  have hK : 0 ≤ K := by
    have he : 0 ≤ E := add_nonneg (volumeControl_nonneg _ _ _) (volumeControl_nonneg _ _ _)
    dsimp only [K]
    positivity
  have hT : 0 < T := hpX ▸ mul_pos (hL.trans_le hX₁) (hL.trans_le hX₂)
  have hw₁ : Function.support W₁ ⊆ Set.Iic b := fun _ h => (hs₁ h).2
  have hw₂ : Function.support W₂ ⊆ Set.Iic b := fun _ h => (hs₂ h).2
  let D := divisorPool (supportedRectangle S b U₁ U₂)
  let G (d : Id × Id) :=
    twoRow (c₁.completed,c₂.completed) (supportedRectangle S b (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2))
        (fun _ => 1) W₁ W₂ (X₁/Ideal.absNorm d.1) (X₂/Ideal.absNorm d.2) -
      twoRow (c₁.completed,c₂.completed) (supportedRectangle S b (Y₁/Ideal.absNorm d.1) (Y₂/Ideal.absNorm d.2))
        (fun _ => 1) W₁ W₂ (Y₁/Ideal.absNorm d.1) (Y₂/Ideal.absNorm d.2)
  have hd (d : Id × Id) (h : d ∈ D) := divisor_supported h
  have hG (d : Id × Id) (h : d ∈ D) :
      ‖G d‖ ≤ K*Real.sqrt (T/pairNorm d)*(L/pairNorm d)^(-α) := by
    have hdz := hd d h
    have hn := pairNorm_pos hdz.1 hdz.2.1
    have hn₁ := ideal_norm_one_le hdz.1
    have hn₂ := ideal_norm_one_le hdz.2.1
    have hc (V₁ V₂ : ℝ) (hv₁ : 0 < V₁) (hv₂ : 0 < V₂)
        (hu₁ : V₁ ≤ U₁) (hu₂ : V₂ ≤ U₂) :
        twoRow (c₁.completed,c₂.completed) (supportedRectangle S b (V₁/Ideal.absNorm d.1) (V₂/Ideal.absNorm d.2))
            (fun _ => 1) W₁ W₂ (V₁/Ideal.absNorm d.1) (V₂/Ideal.absNorm d.2) =
          (Real.sqrt ((V₁/Ideal.absNorm d.1)*(V₂/Ideal.absNorm d.2)) : ℂ)⁻¹*
            (twistedIdealSum c₁.completed W₁ 0 (V₁/Ideal.absNorm d.1)*
              twistedIdealSum c₂.completed W₂ 0 (V₂/Ideal.absNorm d.2)) := by
      apply plain_pair_two (c₁.completed,c₂.completed) S W₁ W₂ b _ _
        (shortened_positive_le hv₁ hdz.1).1 (shortened_positive_le hv₂ hdz.2.1).1 hw₁ hw₂ hχ
      intro I hI hlen
      apply henclose I hI
      exact hlen.elim
        (fun hh => Or.inl (hh.trans (mul_le_mul_of_nonneg_left
          ((shortened_positive_le hv₁ hdz.1).2.trans hu₁) hb)))
        (fun hh => Or.inr (hh.trans (mul_le_mul_of_nonneg_left
          ((shortened_positive_le hv₂ hdz.2.1).2.trans hu₂) hb)))
    have hp (V₁ V₂ : ℝ) (hv : V₁*V₂=T) :
        (V₁/(Ideal.absNorm d.1 : ℝ))*(V₂/(Ideal.absNorm d.2 : ℝ))=T/pairNorm d := by
      rw [pairNorm,← hv]
      ring
    dsimp only [G]
    rw [hc X₁ X₂ (hL.trans_le hX₁) (hL.trans_le hX₂) hXU₁ hXU₂,
      hc Y₁ Y₂ (hL.trans_le hY₁) (hL.trans_le hY₂) hYU₁ hYU₂,
      hp X₁ X₂ hpX,hp Y₁ Y₂ hpY,← mul_sub]
    apply two_character_fractional
      Q hQ m A₀ z hmLam hm2 c₁ c₂ W₁ W₂ a b a b M₁ M₂
      ha ha hb hb hM₁ hM₂ hs₁ hs₂ hW₁ hW₂ hbound₁ hbound₂
      0 _ _ _ _ (T/pairNorm d) (L/pairNorm d) α (div_pos hL hn) hα (by linarith)
    · exact PrincipalExtraction.shorter_lower_bound L X₁ _ _ hL.le hX₁ hn₁ hn₂
    · simpa only [pairNorm,mul_comm] using
        PrincipalExtraction.shorter_lower_bound L X₂ _ _ hL.le hX₂ hn₂ hn₁
    · exact PrincipalExtraction.shorter_lower_bound L Y₁ _ _ hL.le hY₁ hn₁ hn₂
    · simpa only [pairNorm,mul_comm] using
        PrincipalExtraction.shorter_lower_bound L Y₂ _ _ hL.le hY₂ hn₂ hn₁
    · exact hp X₁ X₂ hpX
    · exact hp Y₁ Y₂ hpY
  rw [centered_expansion_two S live (c₁.completed,c₂.completed) W₁ W₂ b X₁ X₂ Y₁ Y₂ U₁ U₂ hb
    (hL.trans_le hX₁) (hL.trans_le hX₂) (hL.trans_le hY₁) (hL.trans_le hY₂)
    hXU₁ hXU₂ hYU₁ hYU₂ hw₁ hw₂]
  have h := sum_bound_two (c₁.completed,c₂.completed) S (fun P => localSeries (live P)) D
    (fun d h => ⟨(hd d h).1,(hd d h).2.1⟩) G T L α K (C*Z^ε) hT.le hL hK
    (hmass Z hZ F hF hcut S live hS hlive D
      (fun d h => ⟨(hd d h).1,(hd d h).2.1⟩) (fun d h => (hd d h).2.2)) hG
  exact h.trans_eq (by dsimp only [K,E]; ring)


open ConcretePrimeRowBridge CanonicalRowCompletion
open KernelMarkedRows KernelLabelledSlots Candidate.FourthPower.KernelAssignmentReindex KernelPunctureRows PrincipalMarkedMass

/-- This is exactly the native normalized row with one fixed relative ray on
each ordinary coordinate, including the two natural zero extensions. -/
theorem relative_rays (χ ω₁ ω₂ : Character) (D : Finset IdealPair) (r : IdealPair → ℂ)
    (W₁ W₂ : ℝ → ℂ) (X₁ X₂ : ℝ) :
    twoRow (χ.product ω₁,χ.product ω₂) D r W₁ W₂ X₁ X₂ =
      normalizedRow χ D (fun n => r n*(idealCoeff ω₁ n.1*idealCoeff ω₂ n.2)) W₁ W₂ X₁ X₂ := by
  unfold twoRow normalizedRow
  congr 1
  apply Finset.sum_congr rfl
  intro n _
  simp only [joint,pairCharacter,idealCoeff_product,map_mul]
  ring

private theorem unit_cube_free (α B a b ε : ℝ) (hα : 0≤α) (hα23 : α<2/3)
    (hB : 0≤B) (ha : 0<a) (hb : 0≤b) (hε : 0<ε) :
    ∃J : ℕ,∃control : Finset (ℕ×ℕ),(0,0)∈control ∧
      ∀Q : Id,Q≠0→∃C : ℝ,0<C ∧ ∀W₁ W₂ : 𝓢(ℝ,ℂ),
      ∀hs₁ : Function.support (W₁:ℝ→ℂ)⊆Set.Icc a b,
      ∀hs₂ : Function.support (W₂:ℝ→ℂ)⊆Set.Icc a b,
      sourceControl control W₁≤1→sourceControl control W₂≤1→
      ∀Z : ℝ,1≤Z→∀F : Id,F≠0→(F.absNorm:ℝ)≤Z^B→
      ∀(S : Finset PrimeIdeal)(live : S→Bool),
      (∀P∈S,Supported P.val)→(∀P : S,live P=true→P.val.val∣F)→
      ∀ m A₀ z : O, goodLambda∣m → (2:O)∣m → ∀ c₁ c₂ : Coordinate Q m A₀ z,
      (c₁.completed.modulus.absNorm:ℝ)≤Z^B → (c₂.completed.modulus.absNorm:ℝ)≤Z^B →
      ∀t₁ t₂ X₁ X₂ Y₁ Y₂ U₁ U₂ T L : ℝ,0<L→
      L≤X₁→L≤X₂→L≤Y₁→L≤Y₂→X₁≤U₁→X₂≤U₂→Y₁≤U₁→Y₂≤U₂→
      X₁*X₂=T→Y₁*Y₂=T→
      (∀I,Supported I→((I.absNorm:ℝ)≤b*U₁∨(I.absNorm:ℝ)≤b*U₂)→primeSupport I⊆primeValues S)→
      ‖twoRow (c₁.completed,c₂.completed) (supportedRectangle S b X₁ X₂) (restrictedValue S live)
          (normPowerProfile W₁ a b ha hs₁ (W₁.smooth ⊤) t₁)
          (normPowerProfile W₂ a b ha hs₂ (W₂.smooth ⊤) t₂) X₁ X₂-
        twoRow (c₁.completed,c₂.completed) (supportedRectangle S b Y₁ Y₂) (restrictedValue S live)
          (normPowerProfile W₁ a b ha hs₁ (W₁.smooth ⊤) t₁)
          (normPowerProfile W₂ a b ha hs₂ (W₂.smooth ⊤) t₂) Y₁ Y₂‖≤
        C*Z^ε*(1+‖t₁‖+‖t₂‖)^J*Real.sqrt T*L^(-α) := by
  obtain ⟨n,control,h00,hcontrol⟩ := volumeControl_source_control a b (ε/2) B ha (half_pos hε) hB
  obtain ⟨Cm,hCm,hmain⟩ := restricted_rectangle_two α B (ε/2) hα hα23 hB (half_pos hε)
  refine ⟨n,control,h00,?_⟩
  intro Q hQ
  obtain ⟨D,hD,hDcontrol⟩ := hcontrol Q
  let V := 128*(b+b)
  let A := 2*(128*b)*(128*b)
  let K := 1+8*D*V+A
  have hV : 0≤V := by dsimp [V];positivity
  have hA : 0≤A := by dsimp [A];positivity
  have hK : 0<K := by dsimp [K];positivity
  refine ⟨Cm*K,mul_pos hCm hK,?_⟩
  intro W₁ W₂ hs₁ hs₂ hcontrol₁ hcontrol₂ Z hZ F hF hcut S live hS hlive
    m A₀ z hmLam hm2 c₁ c₂ hmod₁ hmod₂
    t₁ t₂ X₁ X₂ Y₁ Y₂ U₁ U₂ T L hL hX₁ hX₂ hY₁ hY₂ hXU₁ hXU₂ hYU₁ hYU₂ hpX hpY henclose
  let P₁ := normPowerProfile W₁ a b ha hs₁ (W₁.smooth ⊤) t₁
  let P₂ := normPowerProfile W₂ a b ha hs₂ (W₂.smooth ⊤) t₂
  have hbound₁ (y : ℝ) : ‖P₁ y‖≤1 := by
    rw [show P₁ y=normPowerProfile W₁ a b ha hs₁ (W₁.smooth ⊤) t₁ y from rfl,
      normPowerProfile_norm]
    exact (SchwartzMap.norm_le_seminorm ℝ W₁ y).trans
      ((Seminorm.le_finset_sup_apply (p:=schwartzSeminormFamily ℝ ℝ ℂ) h00).trans hcontrol₁)
  have hbound₂ (y : ℝ) : ‖P₂ y‖≤1 := by
    rw [show P₂ y=normPowerProfile W₂ a b ha hs₂ (W₂.smooth ⊤) t₂ y from rfl,
      normPowerProfile_norm]
    exact (SchwartzMap.norm_le_seminorm ℝ W₂ y).trans
      ((Seminorm.le_finset_sup_apply (p:=schwartzSeminormFamily ℝ ℝ ℂ) h00).trans hcontrol₂)
  have hp₁ : Function.support (P₁:ℝ→ℂ)⊆Set.Icc a b :=
    (normPowerProfile_support W₁ a b ha hs₁ (W₁.smooth ⊤) t₁).trans hs₁
  have hp₂ : Function.support (P₂:ℝ→ℂ)⊆Set.Icc a b :=
    (normPowerProfile_support W₂ a b ha hs₂ (W₂.smooth ⊤) t₂).trans hs₂
  let H := 1+‖t₁‖+‖t₂‖
  let E := Z^(ε/2)*H^n
  have hZ0 : 0<Z := zero_lt_one.trans_le hZ
  have hE : 1≤E := by
    have hH : 1≤H^n := one_le_pow₀ (by
      change 1≤1+‖t₁‖+‖t₂‖
      exact (le_add_of_nonneg_right (norm_nonneg t₁)).trans
        (le_add_of_nonneg_right (norm_nonneg t₂)))
    simpa only [one_mul] using mul_le_mul (Real.one_le_rpow hZ (half_pos hε).le)
      hH (by norm_num : (0:ℝ)≤1) (Real.rpow_nonneg hZ0.le _)
  have herr (χ : Character) (hmod : (χ.modulus.absNorm:ℝ)≤Z^B) (W : 𝓢(ℝ,ℂ)) (hs : Function.support (W:ℝ→ℂ)⊆Set.Icc a b)
      (hc : sourceControl control W≤1) (t : ℝ) (ht : 1+‖t‖≤H) :
      volumeControl Q χ (normPowerProfile W a b ha hs (W.smooth ⊤) t)≤D*E := by
    apply (hDcontrol W hs Z hZ χ hmod t).trans
    have hh := pow_le_pow_left₀ (by positivity : 0≤1+‖t‖) ht n
    calc
      _ ≤ D*1*Z^(ε/2)*H^n := by
        apply mul_le_mul
        · exact mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hc hD.le) (by positivity)
        · exact hh
        · positivity
        · positivity
      _ = D*E := by dsimp [E];ring
  have he₁ : volumeControl Q c₁.completed P₁≤D*E := herr c₁.completed hmod₁ W₁ hs₁ hcontrol₁ t₁
    (by dsimp only [H];exact le_add_of_nonneg_right (norm_nonneg t₂))
  have he₂ : volumeControl Q c₂.completed P₂≤D*E := herr c₂.completed hmod₂ W₂ hs₂ hcontrol₂ t₂
    (by dsimp only [H];linarith [norm_nonneg t₁])
  have hcoef : 4*(volumeControl Q c₁.completed P₁+volumeControl Q c₂.completed P₂)*V+A≤K*E := by
    have he := add_le_add he₁ he₂
    have hh := mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left he (by norm_num : (0:ℝ)≤4)) hV
    have hAE : A≤A*E := le_mul_of_one_le_right hA hE
    dsimp only [K]
    nlinarith
  have hzoff (c : Coordinate Q m A₀ z) : ∀ I, ¬Supported I → idealCoeff c.completed I=0 :=
    PrincipalPhysical.character_off_supported c.base c.completed (m*c.puncture) A₀ z
      (hmLam.trans (dvd_mul_right _ _)) (hm2.trans (dvd_mul_right _ _)) c.row
  have h := hmain Z hZ F hF hcut S live hS hlive Q hQ m A₀ z hmLam hm2 c₁ c₂
    (fun I hi => ⟨hzoff c₁ I hi,hzoff c₂ I hi⟩) P₁ P₂ a b 1 1 ha hb zero_le_one zero_le_one
    hp₁ hp₂ (P₁.smooth ⊤) (P₂.smooth ⊤) hbound₁ hbound₂
    X₁ X₂ Y₁ Y₂ U₁ U₂ T L hL hX₁ hX₂ hY₁ hY₂ hXU₁ hXU₂ hYU₁ hYU₂ hpX hpY henclose
  dsimp only at h
  rw [PrincipalUniform.profile_zero P₁ a b ha hp₁,PrincipalUniform.profile_zero P₂ a b ha hp₂] at h
  simp only [mul_one] at h
  apply h.trans
  calc
    _ ≤ Cm*Z^(ε/2)*(K*E)*Real.sqrt T*L^(-α) :=
      mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_left hcoef (by positivity)) (Real.sqrt_nonneg _)) (by positivity)
    _ = (Cm*K)*(Z^(ε/2)*Z^(ε/2))*H^n*Real.sqrt T*L^(-α) := by dsimp [E];ring
    _ = _ := by rw [←Real.rpow_add hZ0,show ε/2+ε/2=ε by ring]

private theorem normalized_row_scalars (χ : Character × Character) (D : Finset IdealPair) (r : IdealPair→ℂ)
    (W₁ W₂ : ℝ→ℂ) (c₁ c₂ : ℂ) (X₁ X₂ : ℝ) :
    twoRow χ D r (fun x=>c₁*W₁ x) (fun x=>c₂*W₂ x) X₁ X₂=
      (c₁*c₂)*twoRow χ D r W₁ W₂ X₁ X₂ := by
  unfold twoRow pairProfile
  simp only [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro n hn
  ring

section Marked
variable {ι : Type*} [Fintype ι]

def markedRow (χ : Character × Character) (χp : Character) (S H : Finset PrimeIdeal) (pool : ι → Finset Id)
    (β : ι → Id → ℂ) (P : ι → ℝ) (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ : ℝ) : ℂ :=
  weightedSum (naturalCoefficients χp S pool β P)
    (fun slot => twoRow χ (supportedRectangle S b X₁ X₂)
      (restrictedValue S (augmented S H (marked S slot))) W₁ W₂ X₁ X₂)

theorem markedRow_difference (χ : Character × Character) (χp : Character) (S H : Finset PrimeIdeal) (pool : ι → Finset Id)
    (β : ι → Id → ℂ) (P : ι → ℝ) (W₁ W₂ : ℝ → ℂ) (b X₁ X₂ Y₁ Y₂ : ℝ) :
    markedRow χ χp S H pool β P W₁ W₂ b X₁ X₂ - markedRow χ χp S H pool β P W₁ W₂ b Y₁ Y₂ =
      weightedSum (naturalCoefficients χp S pool β P)
        (fun slot => twoRow χ (supportedRectangle S b X₁ X₂)
            (restrictedValue S (augmented S H (marked S slot))) W₁ W₂ X₁ X₂ -
          twoRow χ (supportedRectangle S b Y₁ Y₂)
            (restrictedValue S (augmented S H (marked S slot))) W₁ W₂ Y₁ Y₂) := by
  unfold markedRow weightedSum
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro slot _
  split_ifs <;> ring

end Marked

/-- Two actual fixed-inducing ordinary rows, an independent prime character,
two dyad-relative norm heights, and the full injective marked sum. The native
forbidden and marked prime restrictions form the cube-free local mask. The
finite Schwartz controls and the height exponent precede every moving parameter. -/
theorem marked_exception (α B a b ε : ℝ) (hα : 0≤α) (hα23 : α<2/3)
    (hB : 0≤B) (ha : 0<a) (hb : 0≤b) (hε : 0<ε) :
    ∃J : ℕ,∃control : Finset (ℕ×ℕ),(0,0)∈control ∧
      ∀Q : Id,Q≠0→∃C : ℝ,0<C ∧ ∀W₁ W₂ : 𝓢(ℝ,ℂ),
      ∀hs₁ : Function.support (W₁:ℝ→ℂ)⊆Set.Icc a b,
      ∀hs₂ : Function.support (W₂:ℝ→ℂ)⊆Set.Icc a b,
      ∀Z : ℝ,1≤Z→∀F : Id,F≠0→(F.absNorm:ℝ)≤Z^B→
      ∀S H : Finset PrimeIdeal,(∀P∈S,Supported P.val)→(∀P∈H,P.val∣F)→
      ∀(m A z : O), goodLambda∣m → (2:O)∣m → ∀ (c₁ c₂ : Coordinate Q m A z) (χp : Character),
      (c₁.completed.modulus.absNorm:ℝ)≤Z^B → (c₂.completed.modulus.absNorm:ℝ)≤Z^B →
      ∀(ι : Type*) [Fintype ι],∀(pool : ι→Finset Id)(β : ι→Id→ℂ)(P M : ι→ℝ),
      (∀i,0<P i)→(∀i,0≤M i)→
      (∀i I,I∈pool i→Supported I∧(I.absNorm:ℝ)≤2*P i)→
      (∀i I,I∈pool i→‖β i I‖≤M i)→(∏i,2*P i)≤Z^B→
      ∀t₁ t₂ X₁ X₂ Y₁ Y₂ U₁ U₂ T L : ℝ,0<L→
      L≤X₁→L≤X₂→L≤Y₁→L≤Y₂→X₁≤U₁→X₂≤U₂→Y₁≤U₁→Y₂≤U₂→
      X₁*X₂=T→Y₁*Y₂=T→
      (∀I,Supported I→((I.absNorm:ℝ)≤b*U₁∨(I.absNorm:ℝ)≤b*U₂)→primeSupport I⊆primeValues S)→
      ‖markedRow (c₁.completed,c₂.completed) χp S H pool β P
          (normPowerProfile W₁ a b ha hs₁ (W₁.smooth ⊤) t₁)
          (normPowerProfile W₂ a b ha hs₂ (W₂.smooth ⊤) t₂) b X₁ X₂-
        markedRow (c₁.completed,c₂.completed) χp S H pool β P
          (normPowerProfile W₁ a b ha hs₁ (W₁.smooth ⊤) t₁)
          (normPowerProfile W₂ a b ha hs₂ (W₂.smooth ⊤) t₂) b Y₁ Y₂‖≤
        C*(sourceControl control W₁*sourceControl control W₂)*Z^ε*
          (1+‖t₁‖+‖t₂‖)^J*(∏i,256*M i)*Real.sqrt (T*∏i,P i)*L^(-α) := by
  obtain ⟨n,control,h00,hrect⟩ := unit_cube_free α (2*B) a b ε
    hα hα23 (by positivity) ha hb hε
  refine ⟨n,control,h00,?_⟩
  intro Q hQ
  obtain ⟨C,hC,hbound⟩ := hrect Q hQ
  refine ⟨C,hC,?_⟩
  intro W₁ W₂ hs₁ hs₂ Z hZ F hF hcut S H hS hH m A z hmLam hm2 c₁ c₂ χp hmod₁ hmod₂
    ι instι pool β P M hP hM hp hβ hV
    t₁ t₂ X₁ X₂ Y₁ Y₂ U₁ U₂ T L hL hX₁ hX₂ hY₁ hY₂ hXU₁ hXU₂ hYU₁ hYU₂ hpX hpY henclose
  have hb' : Z^B ≤ Z^(2*B) := Real.rpow_le_rpow_of_exponent_le hZ (by linarith)
  let N₁ := normalizedProfile control W₁
  let N₂ := normalizedProfile control W₂
  have hsN₁ : Function.support (N₁:ℝ→ℂ)⊆Set.Icc a b :=
    (normalizedProfile_support control W₁).trans hs₁
  have hsN₂ : Function.support (N₂:ℝ→ℂ)⊆Set.Icc a b :=
    (normalizedProfile_support control W₂).trans hs₂
  let V₁ := normPowerProfile W₁ a b ha hs₁ (W₁.smooth ⊤) t₁
  let V₂ := normPowerProfile W₂ a b ha hs₂ (W₂.smooth ⊤) t₂
  let V₁n := normPowerProfile N₁ a b ha hsN₁ (N₁.smooth ⊤) t₁
  let V₂n := normPowerProfile N₂ a b ha hsN₂ (N₂.smooth ⊤) t₂
  let q := sourceControl control W₁*sourceControl control W₂
  have hq : 0≤q := mul_nonneg (sourceControl_nonneg _ _) (sourceControl_nonneg _ _)
  let G := fun slot : ι→S=>
    twoRow (c₁.completed,c₂.completed) (supportedRectangle S b X₁ X₂) (restrictedValue S (augmented S H (marked S slot)))
      V₁ V₂ X₁ X₂-
    twoRow (c₁.completed,c₂.completed) (supportedRectangle S b Y₁ Y₂) (restrictedValue S (augmented S H (marked S slot)))
      V₁ V₂ Y₁ Y₂
  let Gn := fun slot : ι→S=>
    twoRow (c₁.completed,c₂.completed) (supportedRectangle S b X₁ X₂) (restrictedValue S (augmented S H (marked S slot)))
      V₁n V₂n X₁ X₂-
    twoRow (c₁.completed,c₂.completed) (supportedRectangle S b Y₁ Y₂) (restrictedValue S (augmented S H (marked S slot)))
      V₁n V₂n Y₁ Y₂
  have hscale (slot : ι→S) : G slot=(q:ℂ)*Gn slot := by
    dsimp only [G,Gn,V₁,V₂,V₁n,V₂n,N₁,N₂]
    rw [PrincipalQuantitative.norm_power_reconstruct control h00 W₁ a b ha hs₁ t₁,
      PrincipalQuantitative.norm_power_reconstruct control h00 W₂ a b ha hs₂ t₂,
      normalized_row_scalars,normalized_row_scalars]
    simp only [q,Complex.ofReal_mul,mul_sub]
  let K := C*q*Z^ε*(1+‖t₁‖+‖t₂‖)^n*Real.sqrt T*L^(-α)
  have hK : 0≤K := by dsimp [K];positivity
  have hG (slot : ι→S) (_hi : Function.Injective slot)
      (hnz : (∏i,naturalCoefficients χp S pool β P i (slot i))≠0) : ‖G slot‖≤K := by
    have hpool := active_pool χp S pool β P slot hnz
    have hFslot := support_norm_bound F S slot P Z B hZ hcut
      (fun i=>(hp i _ (hpool i)).2) hV
    have h := hbound N₁ N₂ hsN₁ hsN₂ (normalizedProfile_control control W₁)
      (normalizedProfile_control control W₂) Z hZ
      (supportIdeal F S slot) (support_nonzero F hF S slot) hFslot
      S (augmented S H (marked S slot)) hS (support_divisor F S H slot hH)
      m A z hmLam hm2 c₁ c₂ (hmod₁.trans hb') (hmod₂.trans hb')
      t₁ t₂ X₁ X₂ Y₁ Y₂ U₁ U₂ T L hL hX₁ hX₂ hY₁ hY₂ hXU₁ hXU₂ hYU₁ hYU₂ hpX hpY henclose
    rw [hscale slot,norm_mul,Complex.norm_real,Real.norm_eq_abs,abs_of_nonneg hq]
    exact (mul_le_mul_of_nonneg_left h hq).trans_eq (by dsimp [K];ring)
  rw [markedRow_difference]
  have hh := weighted_norm_le (naturalCoefficients χp S pool β P) G K hK hG
  apply hh.trans
  have hT : 0<T := hpX ▸ mul_pos (hL.trans_le hX₁) (hL.trans_le hX₂)
  calc
    _ ≤ K*∏i,(256*M i)*Real.sqrt (P i) := mul_le_mul_of_nonneg_left
      (Finset.prod_le_prod₀ (fun i _=>Finset.sum_nonneg (fun p _=>norm_nonneg _))
        (fun i _=>prime_slot_mass χp S (pool i) (β i) (P i) (M i) (hP i) (hM i) (hp i) (hβ i))) hK
    _ = _ := by
      rw [Finset.prod_mul_distrib,Real.sqrt_mul hT.le,Real.sqrt_prod _ (fun i _=>(hP i).le)]
      dsimp only [K,q]
      ring

end CubeFree

#print axioms two_character_fractional
#print axioms punctured_physical_rectangle
#print axioms CubeFree.marked_exception

end
end ContinuumLocalReturn.AsymmetricRayException
