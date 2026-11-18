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
open CenteredMomentSecondCanonical CenteredMomentCanonicalFirst CenteredMomentSecondCanonicalScalar
open CenteredMomentSecondPhysicalBlock CenteredMomentFirstSectors CenteredMomentSourceRow
open CenteredMomentSectorLocalization CenteredMomentSecondActiveDyadic CenteredMomentFirstPhysicalSource
open CenteredMomentFirstAmplificationChoice RayFourExpansion

variable (ω₁ ω₂ : Id →* ℂ)

/-- The active ideal pool is computed after summing the decorated tuple coefficients. -/
def rayS0 {ι : Type*} [Fintype ι] {a b : ℝ} (s : Source ι a b) (ha : 0<a) : Finset Id :=
  CenteredMomentActiveSource.activeSource (sourceColumns s) (raySource ω₁ ω₂ s ha 1)

variable {L : ℝ} {θ : GData L} {mesh Z : ℝ}
structure RayRootData (ω₁ ω₂ : Id →* ℂ) {η : Character} (P : SidePack η)
    (Q : Id) (m : O) (s : Source (Fin θ.N) θ.a θ.b) (ha : 0 < θ.a) (rs : GSrc θ mesh Z)
    (Kc R H : ℝ) (M : ℤ) (Mm : ℕ) (clow : ℝ) : Prop where
  hW₁ : rs.W₁ = s.W₁
  hW₂ : rs.W₂ = s.W₂
  ht₁ : rs.t₁ = s.t₁ / (2 * Real.pi)
  ht₂ : rs.t₂ = s.t₂ / (2 * Real.pi)
  hX₁ : rs.X₁ = s.X₁
  hX₂ : rs.X₂ = s.X₂
  hY₁ : rs.Y₁ = s.Y₁
  hY₂ : rs.Y₂ = s.Y₂
  hV₀ : rs.V₀ = P.V
  /-- the first common factor is in the residual puncture (FP `liveSource`: `R = s.R·s.G`) -/
  hCR : P.Cs ∣ s.R
  hcan : Canonical s Z rs.χ rs.w rs.σ rs.freq rs.t rs.R₀ s.H s.R s.d
  hQ : internalQ θ.Q θ.η₀ = Q
  hQ72 : Q ≤ Ideal.span {(72:O)}
  hm0 : m ≠ 0
  hml : ConcretePrimeRowBridge.goodLambda ∣ m
  hm2 : (2:O) ∣ m
  /-- the frame Gauss log-scale is the split's Gauss scale -/
  hkLog : Z ^ rs.kLog = Kc
  hKc : 0 < Kc
  hholes_sub : s.H ⊆ ReferencePrimeEnclosure.enclosure (θ.Cap * Z^θ.Lcap)
  hholes_R₀ : ∀ i, ∀ P ∈ s.H, P.val ∈ rs.R₀ i
  /-- the radical cap on both genuine columns of every label and every second divisor -/
  hcapC : ∀ l : Lab (rayS0 ω₁ ω₂ s ha), ∀ Lp ∈ labelPool (rayS0 ω₁ ω₂ s ha) l,
    (Ideal.absNorm (∏ I ∈ QRH.Record1252270103KernelMass.primeSupport ((s.R * l.1.val.1) * Lp) ∪
      holes s.H, I) : ℝ) ≤ Z^θ.Bmask
  hcapD : ∀ l : Lab (rayS0 ω₁ ω₂ s ha), ∀ Lp ∈ labelPool (rayS0 ω₁ ω₂ s ha) l,
    (Ideal.absNorm (∏ I ∈ QRH.Record1252270103KernelMass.primeSupport ((s.R * l.1.val.2) * Lp) ∪
      holes s.H, I) : ℝ) ≤ Z^θ.Bmask
  /-- cube-free genuine factors -/
  hcubeExp : ∀ l : Lab (rayS0 ω₁ ω₂ s ha), ∀ P, leftExponent l.1.val.1 l.1.val.2 P ≤ 2 ∧
    rightExponent l.1.val.1 l.1.val.2 P ≤ 2
  hcubeRadC : ∀ l : Lab (rayS0 ω₁ ω₂ s ha),
    l.1.val.1 ∣ (∏ P ∈ IdealMobiusDivisorSum.primeSupport l.1.val.1, P)^2
  hcubeRadD : ∀ l : Lab (rayS0 ω₁ ω₂ s ha),
    l.1.val.2 ∣ (∏ P ∈ IdealMobiusDivisorSum.primeSupport l.1.val.2, P)^2
  /-- every dyadic range in the box `[-M, M]⁴` -/
  hbox : ∀ l n, inRange (rayS0 ω₁ ω₂ s ha) Kc R H l n → n ∈ box M
  /-- the retained rows lie below the Poisson cutoff of the frame source -/
  hdyad : 32 * R ≤ Z ^ cutoffLog rs
  /-- the column-norm lower bound `N(d₁)N(d₂)·N(I) ≥ c·vol` on nonzero coefficients
  (`hcol_of_canonical`, `c = a²`) -/
  hclow_pos : 0 < clow
  hcol : ∀ I, raySource ω₁ ω₂ s ha 1 I ≠ 0 →
    clow * rs.vol ≤ ((s.d.1.absNorm : ℝ) * (s.d.2.absNorm : ℝ)) * (Ideal.absNorm I : ℝ)
  /-- the twist is determined by its ideal on the labels -/
  hspanInj : ∀ l l' : Lab (rayS0 ω₁ ω₂ s ha), Ideal.span {lA (rayS0 ω₁ ω₂ s ha) l} = Ideal.span {lA (rayS0 ω₁ ω₂ s ha) l'} →
    lA (rayS0 ω₁ ω₂ s ha) l = lA (rayS0 ω₁ ω₂ s ha) l'
  /-- multiplicities of the labels with a given column and twist -/
  hmultC : ∀ (G : Id) (A : O),
    ((Finset.univ : Finset (Lab (rayS0 ω₁ ω₂ s ha))).filter
      (fun l => l.1.val.1 = G ∧ lA (rayS0 ω₁ ω₂ s ha) l = A)).card ≤ Mm
  hmultD : ∀ (G : Id) (A : O),
    ((Finset.univ : Finset (Lab (rayS0 ω₁ ω₂ s ha))).filter
      (fun l => l.1.val.2 = G ∧ lA (rayS0 ω₁ ω₂ s ha) l = A)).card ≤ Mm

section
variable {η : Character} {P : SidePack η} {Q : Id} {m : O}
  {s : Source (Fin θ.N) θ.a θ.b} {ha : 0 < θ.a} {rs : GSrc θ mesh Z} {Kc R H : ℝ} {M : ℤ}
  {Mm : ℕ} {clow : ℝ}


theorem rayFrame_good (hR : RayRootData ω₁ ω₂ (θ := θ) P Q m s ha rs Kc R H M Mm clow) (ξ : RayCharacter)
    (g : Lab (rayS0 ω₁ ω₂ s ha) → Id) (hg : IsColumn (rayS0 ω₁ ω₂ s ha) g) (n : Fin 4 → ℤ) (χ : RayCharacter)
    (k : Σ _ : Lab (rayS0 ω₁ ω₂ s ha), Id) (hk : k.2 ∈ labelPool (rayS0 ω₁ ω₂ s ha) k.1) :
    (frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).Good rs := by
  have hsq : Squarefree k.2 := (Finset.mem_filter.mp hk).2
  have hGs := column_supported hg k.1
  have hcap : (Ideal.absNorm (∏ I ∈ QRH.Record1252270103KernelMass.primeSupport
      ((s.R * g k.1) * k.2) ∪ holes s.H, I) : ℝ) ≤ Z^θ.Bmask := by
    rcases hg k.1 with h | h <;> rw [h]
    · exact hR.hcapC k.1 k.2 hk
    · exact hR.hcapD k.1 k.2 hk
  have hcube : g k.1 ∣ (∏ P ∈ IdealMobiusDivisorSum.primeSupport (g k.1), P)^2 := by
    rcases hg k.1 with h | h <;> rw [h]
    · exact hR.hcubeRadC k.1
    · exact hR.hcubeRadD k.1
  have hZ0 : 0 < Z := zero_lt_one.trans rs.hZ
  have hN := absNorm_span_pos (lA (rayS0 ω₁ ω₂ s ha) k.1) (lA_ne _ k.1)
  refine
    { A_ne := lA_ne _ k.1
      R_ne := s.hR
      G_ne := hGs.1
      seed_dvd := one_dvd _
      D_sq := hsq
      G_cube := hcube
      holes_sub := hR.hholes_sub
      cap := hcap
      holes_R₀ := hR.hholes_R₀
      d₁ := s.hd.1
      d₂ := s.hd.2
      dual := ?_ }
  show Real.logb Z (((Ideal.span {lA (rayS0 ω₁ ω₂ s ha) k.1}).absNorm : ℝ) *
      dyadicScale (raisedN rs (rayS0 ω₁ ω₂ s ha) n k.1 1)) ≤ 2 * rs.colLog - rs.kLog + mesh
  unfold raisedN
  rw [Function.update_self]
  obtain ⟨h1, -⟩ := topDyad_spec (Z ^ cutoffLog rs) _ (Real.rpow_pos_of_pos hZ0 _) hN
  rw [Real.logb_le_iff_le_rpow rs.hZ (mul_pos hN (dyadicScale_pos _))]
  exact h1

/-- A nonzero class block has a retained row, hence `N(A₂) ≤ 4R`. -/
theorem rayTwist_le_radius (ψ : Character) (χ₀ : RayCharacter) (t : ℝ) (S : Finset Id) (Kc : ℝ)
    (l : Lab S) (n : Fin 4 → ℤ)
    (hb : classBlock S (raySource ω₁ ω₂ s ha 1) ψ χ₀ Q m t Kc R l n ≠ 0) :
    normValue (lA S l) ≤ 4 * R := by
  unfold classBlock labelBlock at hb
  obtain ⟨z, hz, -⟩ := Finset.exists_ne_zero_of_sum_ne_zero hb
  rw [CenteredMomentSecondEnergySplit.partRows_false] at hz
  have hz1 := (Finset.mem_filter.mp hz).1
  have hz0 := CenteredMomentSecondEnergySplit.sourceRows_nonzero _ _ _ _ z hz1
  have hw := CenteredMomentSecondLiveBlock.liveRows_weight _ _ _ _ _ z hz1
  have he := (retainedWeight_enclosure R _ hw).2
  rw [normValue_mul] at he
  have h1 := normValue_ge_one z hz0
  have h0 : 0 ≤ normValue (lA S l) := by unfold normValue; positivity
  have : normValue (lA S l) ≤ normValue (lA S l) * normValue z := le_mul_of_one_le_right h0 h1
  exact this.trans he

/-- **The raised dyad is above twice the class row scale.** -/
theorem rayFrame_dyad (hR : RayRootData ω₁ ω₂ (θ := θ) P Q m s ha rs Kc R H M Mm clow) (ξ : RayCharacter)
    (ψ : Character) (χ₀ : RayCharacter) (t : ℝ)
    (g : Lab (rayS0 ω₁ ω₂ s ha) → Id) (n : Fin 4 → ℤ) (χ : RayCharacter) (k : Σ _ : Lab (rayS0 ω₁ ω₂ s ha), Id)
    (hr : inRange (rayS0 ω₁ ω₂ s ha) Kc R H k.1 n)
    (hb : classBlock (rayS0 ω₁ ω₂ s ha) (raySource ω₁ ω₂ s ha 1) ψ χ₀ Q m t Kc R k.1 n ≠ 0) :
    2 * dyadicScale (n 1) ≤
      dyadicScale ((frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).n 1) := by
  have hZ0 : 0 < Z := zero_lt_one.trans rs.hZ
  have hN := absNorm_span_pos (lA (rayS0 ω₁ ω₂ s ha) k.1) (lA_ne _ k.1)
  show 2 * dyadicScale (n 1) ≤ dyadicScale (raisedN rs (rayS0 ω₁ ω₂ s ha) n k.1 1)
  unfold raisedN
  rw [Function.update_self]
  apply dyad_lt_top _ _ (Real.rpow_pos_of_pos hZ0 _) hN
  have h1 := dyad_of_range _ _ _ (lA_ne _ k.1) Kc R H n (hr 1)
  have hA4 := rayTwist_le_radius ω₁ ω₂ ψ χ₀ t (rayS0 ω₁ ω₂ s ha) Kc k.1 n hb
  have h2 : 8 * max (normValue (lA (rayS0 ω₁ ω₂ s ha) k.1)) (4 * R) ≤ Z ^ cutoffLog rs := by
    rw [max_eq_right hA4]; linarith [hR.hdyad]
  have he : normValue (lA (rayS0 ω₁ ω₂ s ha) k.1) = ((Ideal.span {lA (rayS0 ω₁ ω₂ s ha) k.1}).absNorm : ℝ) := rfl
  rw [he] at h1 h2
  change normValue (commonFrequencyGenerator k.1.1.val.1 k.1.1.val.2 *
    CenteredMomentSecondCanonicalNonunit.nonunitFrequencyGenerator k.1.1.val.1 k.1.1.val.2 k.1.2) *
      dyadicScale (n 1) ≤ _ at h1
  have h1' : ((Ideal.span {lA (rayS0 ω₁ ω₂ s ha) k.1}).absNorm : ℝ) * dyadicScale (n 1) ≤
      4 * max ((Ideal.span {lA (rayS0 ω₁ ω₂ s ha) k.1}).absNorm : ℝ) (4 * R) := h1
  linarith

/-- **The class weight ratio** on a nonzero block. -/
theorem rayClass_frame_ratio (hR : RayRootData ω₁ ω₂ (θ := θ) P Q m s ha rs Kc R H M Mm clow) (ξ : RayCharacter)
    (ψ : Character) (χ₀ : RayCharacter) (t : ℝ)
    (g : Lab (rayS0 ω₁ ω₂ s ha) → Id) (hg : IsColumn (rayS0 ω₁ ω₂ s ha) g) (n : Fin 4 → ℤ) (χ : RayCharacter)
    (k : Σ _ : Lab (rayS0 ω₁ ω₂ s ha), Id)
    (hb : classBlock (rayS0 ω₁ ω₂ s ha) (raySource ω₁ ω₂ s ha 1) ψ χ₀ Q m t Kc R k.1 n ≠ 0) :
    classWeight (rayS0 ω₁ ω₂ s ha) Kc k.1 n ≤ (rs.vol / clow) *
      (rho (frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).G *
        ‖(frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).prefactor‖ *
        (((frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).G.absNorm : ℝ)) *
        ((((frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).d.1.absNorm : ℝ)) *
          (((frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).d.2.absNorm : ℝ))) * rs.norm) := by
  have hZ0 : 0 < Z := zero_lt_one.trans rs.hZ
  set PD : ℝ := (s.d.1.absNorm : ℝ) * (s.d.2.absNorm : ℝ) with hPD
  have hPD0 : 0 < PD := by
    have h1 : 0 < (s.d.1.absNorm : ℝ) := by
      exact_mod_cast Nat.pos_of_ne_zero (Ideal.absNorm_eq_zero_iff.not.mpr s.hd.1)
    have h2 : 0 < (s.d.2.absNorm : ℝ) := by
      exact_mod_cast Nat.pos_of_ne_zero (Ideal.absNorm_eq_zero_iff.not.mpr s.hd.2)
    positivity
  have hvol := rs.vol_pos hZ0
  have hcl := hR.hclow_pos
  obtain ⟨hCs, hDs, hCD⟩ := lab_data (rayS0 ω₁ ω₂ s ha) k.1
  set C₂ := k.1.1.val.1
  set D₂ := k.1.1.val.2
  -- the columns of a nonzero block
  obtain ⟨⟨I, hI, hIn⟩, ⟨J, hJ, hJn⟩⟩ := labelBlock_ne_zero_column ψ t (rayS0 ω₁ ω₂ s ha)
    (raySource ω₁ ω₂ s ha 1) C₂ D₂ hCs hDs k.1.2 R _ ballProfile _ _ _ _ _
    (dyadicScale_pos _) (dyadicScale_pos _) hb
  have hc1 := hR.hcol _ hI
  have hc2 := hR.hcol _ hJ
  rw [map_mul, Nat.cast_mul] at hc1 hc2
  have hCn : 0 < (C₂.absNorm : ℝ) := by
    exact_mod_cast Nat.pos_of_ne_zero (Ideal.absNorm_eq_zero_iff.not.mpr hCs.1)
  have hDn : 0 < (D₂.absNorm : ℝ) := by
    exact_mod_cast Nat.pos_of_ne_zero (Ideal.absNorm_eq_zero_iff.not.mpr hDs.1)
  have hd2 := dyadicScale_pos (n 2)
  have hd3 := dyadicScale_pos (n 3)
  have h1 : rs.vol ≤ (PD/clow) * ((C₂.absNorm : ℝ) * dyadicScale (n 2)) := by
    rw [div_mul_eq_mul_div, le_div_iff₀ hcl]
    have : PD * ((C₂.absNorm : ℝ) * (I.absNorm : ℝ)) ≤ PD * ((C₂.absNorm : ℝ) * dyadicScale (n 2)) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hIn.le hCn.le) hPD0.le
    nlinarith
  have h2 : rs.vol ≤ (PD/clow) * ((D₂.absNorm : ℝ) * dyadicScale (n 3)) := by
    rw [div_mul_eq_mul_div, le_div_iff₀ hcl]
    have : PD * ((D₂.absNorm : ℝ) * (J.absNorm : ℝ)) ≤ PD * ((D₂.absNorm : ℝ) * dyadicScale (n 3)) :=
      mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left hJn.le hDn.le) hPD0.le
    nlinarith
  have hos := outerScalar_le C₂ D₂ hCs.1 hDs.1 Kc hR.hKc.le n rs.vol (PD/clow) hvol (by positivity)
    h1 h2
  have hnz : normalizer C₂ D₂ k.1.2 ≤ ((g k.1).absNorm : ℝ) := by
    rcases hg k.1 with h | h <;> rw [h]
    · exact normalizer_le_left C₂ D₂ hCs hDs hCD k.1.2
    · exact normalizer_le_right C₂ D₂ hCs hDs hCD k.1.2
  have hnorm : rs.norm = Kc / rs.vol^2 := by unfold GSrc.norm; rw [hR.hkLog]
  have hn0 := (normalizer_pos C₂ D₂ hCs k.1.2).le
  have hK := hR.hKc
  change ‖rhoC C₂‖ * (outerScalar C₂ D₂ Kc n * normalizer C₂ D₂ k.1.2) ≤
    (rs.vol / clow) * (rho (g k.1) * ‖(1:ℂ)‖ * ((g k.1).absNorm : ℝ) * PD * rs.norm)
  rw [norm_rhoC, rho_column hg, norm_one, mul_one, hnorm]
  have hr0 : 0 ≤ rho C₂ := by unfold rho; positivity
  calc rho C₂ * (outerScalar C₂ D₂ Kc n * normalizer C₂ D₂ k.1.2)
      ≤ rho C₂ * ((PD/clow * rs.vol) * (Kc / rs.vol^2) * ((g k.1).absNorm : ℝ)) :=
        mul_le_mul_of_nonneg_left (mul_le_mul hos hnz hn0 (by positivity)) hr0
    _ = (rs.vol / clow) * (rho C₂ * ((g k.1).absNorm : ℝ) * PD * (Kc / rs.vol^2)) := by ring

end

section
variable {η : Character} {P : SidePack η} {Q : Id} {m : O}
  {s : Source (Fin θ.N) θ.a θ.b} {ha : 0 < θ.a} {rs : GSrc θ mesh Z} {Kc R H : ℝ} {M : ℤ}
  {Mm : ℕ} {clow : ℝ}

abbrev rayFrameX (ξ : RayCharacter) (g : Lab (rayS0 ω₁ ω₂ s ha) → Id) (n : Fin 4 → ℤ) (χ : RayCharacter)
    (k : Σ _ : Lab (rayS0 ω₁ ω₂ s ha), Id) : GLabel θ mesh Z :=
  (frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).toLabel η

/-- **Multiplicity of the frame labels.** -/
theorem rayFrame_mult (ξ : RayCharacter) (g : Lab (rayS0 ω₁ ω₂ s ha) → Id) (n : Fin 4 → ℤ)
    (χ : RayCharacter) (Ks : Finset (Σ _ : Lab (rayS0 ω₁ ω₂ s ha), Id))
    (hm : ∀ (G : Id) (A : O), ((Finset.univ : Finset (Lab (rayS0 ω₁ ω₂ s ha))).filter
      (fun l => g l = G ∧ lA (rayS0 ω₁ ω₂ s ha) l = A)).card ≤ Mm) :
    ∀ y ∈ Ks.image (rayFrameX ω₁ ω₂ (η := η) (P := P) (s := s) (ha := ha) (rs := rs)
        ξ g n χ),
      (Ks.filter (fun k => rayFrameX ω₁ ω₂ (η := η) (P := P) (s := s) (ha := ha)
        (rs := rs) ξ g n χ k = y)).card ≤ Mm := by
  intro y _
  refine le_trans ?_ (hm y.G y.twist)
  apply Finset.card_le_card_of_injOn (fun k => k.1)
  · intro k hk
    have hX := (Finset.mem_filter.mp hk).2
    simp only [Finset.coe_filter, Set.mem_ofPred_eq, Finset.mem_univ, true_and]
    rw [← hX]
    exact ⟨rfl, rfl⟩
  · intro k hk k' hk' h
    have hX := (Finset.mem_filter.mp hk).2
    have hX' := (Finset.mem_filter.mp hk').2
    have hD : k.2 = k'.2 := by
      have e1 : (rayFrameX ω₁ ω₂ (η := η) (P := P) (s := s) (ha := ha) (rs := rs)
        ξ g n χ k).D = k.2 := rfl
      have e2 : (rayFrameX ω₁ ω₂ (η := η) (P := P) (s := s) (ha := ha) (rs := rs)
        ξ g n χ k').D = k'.2 := rfl
      rw [← e1, ← e2, hX, hX']
    exact Sigma.ext h (heq_of_eq hD)

/-- **The frame group is a raised group.** -/
theorem rayFrame_group_raised (ξ : RayCharacter) (g : Lab (rayS0 ω₁ ω₂ s ha) → Id) (n : Fin 4 → ℤ)
    (χ : RayCharacter) (Ks : Finset (Σ _ : Lab (rayS0 ω₁ ω₂ s ha), Id)) :
    Ks.image (rayFrameX ω₁ ω₂ (η := η) (P := P) (s := s) (ha := ha) (rs := rs)
        ξ g n χ) =
      (Ks.image (fun k => setN (rayFrameX ω₁ ω₂ (η := η) (P := P) (s := s)
        (ha := ha) (rs := rs) ξ g n χ k) n)).image (raised rs) := by
  rw [Finset.image_image]
  rfl

/-- **The restricted fibre of a frame group.** -/
theorem rayFrame_group_fibre (hR : RayRootData ω₁ ω₂ (θ := θ) P Q m s ha rs Kc R H M Mm clow)
    (ξ : RayCharacter) (g : Lab (rayS0 ω₁ ω₂ s ha) → Id) (hg : IsColumn (rayS0 ω₁ ω₂ s ha) g)
    (hgdvd : ∀ l, g l ∣ (Ideal.span {lA (rayS0 ω₁ ω₂ s ha) l})^2) (n : Fin 4 → ℤ)
    (χ : RayCharacter) (Ks : Finset (Σ _ : Lab (rayS0 ω₁ ω₂ s ha), Id))
    (hKs : ∀ k ∈ Ks, k.2 ∈ labelPool (rayS0 ω₁ ω₂ s ha) k.1) (Cexp ε : ℝ)
    (hfib : FibreAt Z Cexp θ.Bmask ε 2) :
    ∀ y : O, y ≠ 0 → ((Ideal.span {y}).absNorm : ℝ) ≤ Z^Cexp →
      ∑ x ∈ (Ks.image (rayFrameX ω₁ ω₂ (η := η) (P := P) (s := s) (ha := ha)
        (rs := rs) ξ g n χ)).filter (fun x => x.twist ∣ y), gWeight x ≤ Z^(ε/8) := by
  apply hfib L θ mesh _ (fun x => ![x.G, Ideal.span {x.twist}])
  · intro x hx
    obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp hx
    show ‖(1:ℂ)‖ ≤ 1
    rw [norm_one]
  · intro x hx
    obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp hx
    exact hgdvd k.1
  · intro x hx
    obtain ⟨k, hk, rfl⟩ := Finset.mem_image.mp hx
    have hgood := rayFrame_good ω₁ ω₂ hR ξ g hg n χ k (hKs k hk)
    have hfits := toLabel_fits (θ := θ) (mesh := mesh) (Z := Z) η rs _ hgood
    exact ⟨hfits.D_sq.ne_zero, hfits.D_cap⟩
  · intro x hx i
    obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp hx
    fin_cases i
    · exact hgdvd k.1
    · exact dvd_pow_self _ two_ne_zero
  · intro x hx x' hx' h
    obtain ⟨k, _, rfl⟩ := Finset.mem_image.mp hx
    obtain ⟨k', _, rfl⟩ := Finset.mem_image.mp hx'
    simp only [Prod.mk.injEq] at h
    obtain ⟨hc, hD⟩ := h
    have hG : g k.1 = g k'.1 := congrFun hc 0
    have hsp : Ideal.span {lA (rayS0 ω₁ ω₂ s ha) k.1} = Ideal.span {lA (rayS0 ω₁ ω₂ s ha) k'.1} := congrFun hc 1
    have hA := hR.hspanInj k.1 k'.1 hsp
    show (frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k).toLabel η =
      (frameData P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k').toLabel η
    rw [frameData_eq P.j₀ ξ s rs (rayS0 ω₁ ω₂ s ha) g n χ k k' hG hA hD]

end

#print axioms rayClass_frame_ratio
#print axioms rayFrame_group_fibre
end
end ContinuumLocalReturn.AsymmetricRaySplit
