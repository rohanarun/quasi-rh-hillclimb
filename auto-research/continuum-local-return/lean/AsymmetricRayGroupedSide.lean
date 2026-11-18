/- Copyright (c) 2026 Sil. Apache-2.0.
AI-assisted adaptation of Packet/GroupedAt at tracker c74d855c3bdfceeee059501aea76c8b1627b9abd.
The extraction cost and the native frame weights are retained through the sum
over every label. The two assumptions carrying arithmetic are stated separately:
a labelwise reduction of the input and an energy estimate on single natural
Fourier tests on the original or reference shape. The source and fibre estimates
are uniform in the labels and retain the fixed rays inside the ordinary sums.
-/
import Submissions.sil_density_split_20261026.CubeFree.Packet.GroupedAt
import AsymmetricPacked
import AsymmetricRayGroup

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 4000000

namespace ContinuumLocalReturn.AsymmetricRayGroupedSide
open QRH.SilDensitySplit.CubeFree QRH.SilDensitySplit.CubeFree.Packet
open QRH.SilDensitySplit.CubeFree.Packet.Grouped
open ContinuumLocalReturn.AsymmetricPacked (InShape)
open ContinuumLocalReturn.AsymmetricRayGroup (mixedEnergy mixedRow grouped_ray_class_bound)
open Candidate.FourthPower QRH.SilDensitySplit.CubeFree.FP QRH.SilDensitySplit.CubeFree.Packet.Reduce

noncomputable section
open scoped Classical BigOperators SchwartzMap ContDiff
open Filter OAI OAI.SevenEighths HeckeFamily CanonicalQuadraticSieve ConcreteTraceCRT
open QRH.Record1252270103KernelMass
open CenteredMomentNaturalFixedRaySource
open CenteredMomentInductionEnergy
open CenteredMomentFiniteProfileExceptional
open HeckeDyadic
open CenteredMomentDetectorEnergyInitialState
open CenteredMomentFirstAmplificationChoice
open CenteredMomentSectorLocalization
open CenteredMomentRetainedEnergy
open OAI.SevenEighths.CenteredMomentEnergyBands (length)
open ProfileSeparation (commonPair scale pairWeight pairMajorant)
local notation "O" => HeckeFamily.O

local instance (rayM : Ideal O) [NeZero rayM] : Finite (O⧸rayM) :=
  Ring.HasFiniteQuotients.finiteQuotient (NeZero.ne rayM)


variable {L mesh Z : ℝ} {θ : GData L}

/-- Exact native normalization with a replaceable literal raw energy. -/
def weightedEnergy (η : Character) (r : GSrc θ mesh Z)
    (raw : (x : GLabel θ mesh Z) → Fits η r x → ℝ → ℝ) (x : GLabel θ mesh Z) (v : ℝ) : ℝ :=
  if h : Fits η r x then
    (x.G.absNorm : ℝ) * (x.D.absNorm : ℝ) * ((x.d.1.absNorm : ℝ) * (x.d.2.absNorm : ℝ)) *
      r.norm * raw x h v else 0

/-- The decorated canonical sublattice child. The prime anchor is the native one. -/
def rayChild (η ω₁ ω₂ : Character) (keep : DictIdx → O → Prop) (r : GSrc θ mesh Z)
    (v : ℝ) (j : DictIdx) (A : Finset (Fin θ.N)) (X₁ X₂ : ℝ) (V : O) (K : ℝ) : ℝ :=
  mixedEnergy ((anchors η j).product ω₁) ((anchors η j).product ω₂) (anchors η j) pmask 1 0
    ((r.prof v).profile 0) ((r.prof v).profile 1) (r.pools A) (r.coeffs v A) (r.scales A) X₁ X₂
    (fun y => V ∣ y ∧ keep j y) ballProfile (((Ideal.span {V}).absNorm : ℝ) * K)

/-- Only a single original-shaped or short-reference-shaped test on the common ball.
Its power uses the actual live subproduct and the two actual ordinary lengths. -/
def ShapeLeaf (price : Price) (η ω₁ ω₂ : Character) (keep : DictIdx → O → Prop)
    (r : GSrc θ mesh Z) (w₀ H n y short err εA : ℝ) (degA : ℕ) (SA : Finset (ℕ×ℕ))
    (CA : ℝ) : Prop :=
  ∀ (j : DictIdx) (A : Finset (Fin θ.N)) (v : ℝ) (e : Fin 2 × Fin 2) (τ : ℝ × ℝ)
    (X₁ X₂ : ℝ), 0 < X₁ → 0 < X₂ →
    InShape n y short err (length Z X₁) (length Z X₂) →
    length Z X₁ ≤ L+1 → length Z X₂ ≤ L+1 →
    let Kc := 2 * Z^(H+mesh)
    mixedEnergy ((anchors η j).product ω₁) ((anchors η j).product ω₂) (anchors η j)
      pmask 1 0 ((commonPair e τ).profile 0) ((commonPair e τ).profile 1)
      (r.pools A) (r.coeffs v A) (r.scales A) X₁ X₂ (keep j) ballProfile Kc ≤
        CA * QuadraticInitialBound.diagonalControl ballProfile * ((commonPair e τ).control SA)^2 *
          (1+|(0:ℝ)|+(|r.t|+|v|+r.Vf))^degA *
          Z^(Real.logb Z Kc +price.f w₀ (length Z X₁+length Z X₂) (∑i:A,r.w i) (Real.logb Z Kc)+εA)

/-- Reduce the actual labels separately with their complete divisor mass. -/
def LocalReduction (η ω₁ ω₂ : Character) (keep : DictIdx → O → Prop)
    (r : GSrc θ mesh Z) (raw : (x : GLabel θ mesh Z) → Fits η r x → ℝ → ℝ)
    (Cred ε δ : ℝ) : Prop :=
  ∀ (x : GLabel θ mesh Z) (hf : Fits η r x) (v : ℝ), raw x hf v ≤ 0 ∨
    ∃ (A : Finset (Fin θ.N)) (X₁' X₂' : ℝ), 0 < X₁' ∧ 0 < X₂' ∧
      ((X₁' ≤ r.X₁ ∧ X₂' ≤ r.X₂) ∨ (X₁' ≤ r.Y₁ ∧ X₂' ≤ r.Y₂)) ∧
      raw x hf v ≤ labelMass Cred Z ε δ r.w r.X₁ r.X₂ x.G x.D x.d *
        rayChild η ω₁ ω₂ keep r v (x.anchor r) A X₁' X₂' (r.V₀*x.twist) (dyadicScale (x.n 1))

private theorem shape_mono {n y short e d x₁ x₂ X₁ X₂ : ℝ}
    (h : InShape n y short e X₁ X₂) (h₁ : x₁ ≤ X₁+d) (h₂ : x₂ ≤ X₂+d) :
    InShape n y short (e+d) x₁ x₂ := by
  rcases h with ⟨h₁',h₂'⟩|hm
  · exact Or.inl ⟨by linarith,by linarith⟩
  · rcases min_le_iff.mp hm with hl|hr
    · exact Or.inr ((min_le_left _ _).trans (by linarith))
    · exact Or.inr ((min_le_right _ _).trans (by linarith))

/-- The quantitative side bound on the native frame. Fitting-label normalization,
weighted divisor fibres, dyadic class count and polynomial profile dependence
are all included before pricing the two possible rectangle shapes. -/
theorem packed_at (price : Price) (Mmin Mmax : ℝ) (θ : GData L) (hL : 0 ≤ L) (mesh : ℝ)
    (hmesh0 : 0 < mesh) (hmesh1 : mesh ≤ 1/2) (η : Character) (ε : ℝ) (hε : 0 < ε)
    (hmeshε : (3 + price.lip) * mesh ≤ ε/8)
    (degA : ℕ) (SA : Finset (ℕ×ℕ)) (CA : ℝ) (hCA : 0 ≤ CA)
    (nP : ℕ) (CP : ℝ) (hctl : ∀ e τ, (commonPair e τ).control SA ≤ CP * pairWeight nP τ)
    (T₀ : Finset (ℕ×ℕ)) (K₀ : ℝ) (hK₀ : 0 ≤ K₀)
    (hm₀ : ∀ (W₁ W₂ : 𝓢(ℝ, ℂ)) (hs₁ : Function.support (W₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
      (hs₂ : Function.support (W₂ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4)) (e : Fin 2 × Fin 2),
      ∫ τ : ℝ × ℝ, pairMajorant W₁ W₂ hs₁ hs₂ e τ * pairWeight 0 τ ≤
        K₀ * (T₀.sup (schwartzSeminormFamily ℝ ℝ ℂ) W₁ * T₀.sup (schwartzSeminormFamily ℝ ℝ ℂ) W₂))
    (TJ : Finset (ℕ×ℕ)) (KJ : ℝ) (hKJ : 0 ≤ KJ)
    (hmJ : ∀ (W₁ W₂ : 𝓢(ℝ, ℂ)) (hs₁ : Function.support (W₁ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4))
      (hs₂ : Function.support (W₂ : ℝ → ℂ) ⊆ Set.Icc (1/4) (9/4)) (e : Fin 2 × Fin 2),
      ∫ τ : ℝ × ℝ, pairMajorant W₁ W₂ hs₁ hs₂ e τ * pairWeight (2*nP) τ ≤
        KJ * (TJ.sup (schwartzSeminormFamily ℝ ℝ ℂ) W₁ * TJ.sup (schwartzSeminormFamily ℝ ℝ ℂ) W₂))
    (n₀ : ℕ) (S₀ : Finset (ℕ×ℕ)) (C₀ : ℝ) (hC₀ : 0 ≤ C₀)
    (htw₀ : ∀ (W : 𝓢(ℝ,ℂ)) (hs : Function.support (W : ℝ → ℂ) ⊆ Set.Icc θ.a θ.b) (t : ℝ),
      T₀.sup (schwartzSeminormFamily ℝ ℝ ℂ)
        (CompletedHeight.uniformTwistedSchwartz W θ.a θ.b θ.ha0 hs (W.smooth ⊤) t) ≤
        C₀ * sourceControl S₀ W * (1+‖t‖)^n₀)
    (nJ : ℕ) (SJ : Finset (ℕ×ℕ)) (CJ : ℝ) (hCJ : 0 ≤ CJ)
    (htwJ : ∀ (W : 𝓢(ℝ,ℂ)) (hs : Function.support (W : ℝ → ℂ) ⊆ Set.Icc θ.a θ.b) (t : ℝ),
      TJ.sup (schwartzSeminormFamily ℝ ℝ ℂ)
        (CompletedHeight.uniformTwistedSchwartz W θ.a θ.b θ.ha0 hs (W.smooth ⊤) t) ≤
        CJ * sourceControl SJ W * (1+‖t‖)^nJ)
    (Cred : ℝ) (hCred : 0 ≤ Cred)
    (Z : ℝ) (hZ1 : 1 < Z)
    (hcount : ((Fintype.card DictIdx : ℝ) * 2^θ.N) *
      (L * Real.logb 2 Z + Real.logb 2 θ.b + 2)^2 ≤ Z^(ε/16))
    (hl3 : (1 + 3*price.lip) * Real.logb Z 3 ≤ ε/16) (hl3' : Real.logb Z 3 ≤ 1/2)
    (hZ32 : (2:ℝ) ≤ Z^(3/2:ℝ)) :
    ∀ (r : GSrc θ mesh Z) (labels : Finset (GLabel θ mesh Z)) (w₀ H : ℝ),
      Second.AdmissibleGroup (gFrame L θ mesh η Z) Mmin Mmax mesh ε Z r labels H →
    ∀ (ω₁ ω₂ : Character) (keep : DictIdx → O → Prop), (∀ j z, keep j z → z ≠ 0) →
    ∀ (raw : (x : GLabel θ mesh Z) → Fits η r x → ℝ → ℝ) (n y short err : ℝ),
      InShape n y short err (length Z r.X₁) (length Z r.X₂) →
      InShape n y short err (length Z r.Y₁) (length Z r.Y₂) →
      LocalReduction η ω₁ ω₂ keep r raw Cred (ε/8) (ε/(48*max 1 θ.Bmask)) →
      ShapeLeaf price η ω₁ ω₂ keep r w₀ H n y short (err+Real.logb Z 3) (ε/8) degA SA CA →
      ∀ v : ℝ, ∑ x ∈ labels, gWeight x * weightedEnergy η r raw x v ≤
        ctot CA CP Cred K₀ C₀ KJ CJ * gAmp L θ mesh η Z r (degA + 2*n₀ + 2*nJ) (S₀ ∪ SJ) *
          (1+‖v‖)^(2*(degA + 2*n₀ + 2*nJ)) *
          Z^(r.colLog + r.twistLog + price.f w₀ (gP r) (∑ i, r.w i) H + ε) := by
  intro r labels w₀ H hadm ω₁ ω₂ keep hkeep raw n y short err hXshape hYshape hred hleaf v
  obtain ⟨hHmin, hHmax, henv, -, hfib⟩ := hadm
  have henv' : ∀ x ∈ labels, |gEnvelope r x - H| ≤ mesh := henv
  have hfib' : ∀ y : O, y ≠ 0 → ((Ideal.span {y}).absNorm : ℝ) ≤ Z^(Mmax + 2) →
      ∑ x ∈ labels.filter (fun x => x.twist ∣ y), gWeight x ≤ Z^(ε/8) := hfib
  have hZ0 : 0 < Z := by linarith
  have hd := QuadraticInitialBound.diagonalControl_nonneg ballProfile
  have hnorm0 : 0 ≤ r.norm := div_nonneg (Real.rpow_nonneg hZ0.le _) (sq_nonneg _)
  have hvol := r.vol_pos hZ0
  set deg := degA + 2*n₀ + 2*nJ with hdeg
  set tgt := r.colLog + r.twistLog + price.f w₀ (gP r) (∑ i, r.w i) H + ε with htgt
  have hamp0 : 0 ≤ gAmp L θ mesh η Z r deg (S₀ ∪ SJ) := by
    unfold gAmp
    exact mul_nonneg (sq_nonneg _) (pow_nonneg (zero_le_one.trans r.one_le_height) _)
  have hctot0 : 0 ≤ ctot CA CP Cred K₀ C₀ KJ CJ := by unfold ctot; positivity
  have hRHS0 : 0 ≤ ctot CA CP Cred K₀ C₀ KJ CJ * gAmp L θ mesh η Z r deg (S₀ ∪ SJ) *
      (1+‖v‖)^(2*deg) * Z^tgt := by
    have := Real.rpow_nonneg hZ0.le tgt
    positivity
  -- no fitting label: the sum vanishes
  by_cases hne : ∃ x ∈ labels, Fits η r x
  swap
  · push_neg at hne
    have h0 : ∑ x ∈ labels, gWeight x * weightedEnergy η r raw x v = 0 := by
      apply Finset.sum_eq_zero
      intro x hx
      rw [weightedEnergy, dif_neg (hne x hx), mul_zero]
    rw [h0]; exact hRHS0
  obtain ⟨x₀, hx₀, hfx₀⟩ := hne
  -- the common envelope is at most the source envelope
  have hHle : H ≤ r.twistLog + (2 * r.colLog - r.kLog + mesh) + mesh := by
    have h1 := (abs_le.mp (henv' x₀ hx₀)).1
    rw [gEnvelope_eq r x₀ hfx₀.twist_ne] at h1
    linarith [hfx₀.dual]
  have hpn : ∀ x : GLabel θ mesh Z,
      0 ≤ (x.G.absNorm : ℝ) * (x.D.absNorm : ℝ) * pairNorm x.d :=
    fun x => mul_nonneg (by positivity) (by unfold pairNorm; positivity)
  -- (1) selection of one child per label
  let mass : GLabel θ mesh Z → ℝ := fun x =>
    labelMass Cred Z (ε/8) (ε/(48 * max 1 θ.Bmask)) r.w r.X₁ r.X₂ x.G x.D x.d
  have hsel : ∀ x ∈ labels, ∃ c : Finset (Fin θ.N) × ℝ × ℝ,
      gWeight x * weightedEnergy η r raw x v ≤ 0 ∨
      (Fits η r x ∧ 0 < c.2.1 ∧ 0 < c.2.2 ∧
        ((c.2.1 ≤ r.X₁ ∧ c.2.2 ≤ r.X₂) ∨ (c.2.1 ≤ r.Y₁ ∧ c.2.2 ≤ r.Y₂)) ∧
        gWeight x * weightedEnergy η r raw x v ≤ r.norm * (gWeight x *
          ((x.G.absNorm : ℝ) * (x.D.absNorm : ℝ) * pairNorm x.d * mass x) * rayChild η ω₁ ω₂ keep r v (x.anchor r) c.1 c.2.1 c.2.2 (r.V₀ * x.twist) (dyadicScale (x.n 1)))) := by
    intro x _
    by_cases hf : Fits η r x
    · rcases hred x hf v with h0 | ⟨A, X₁', X₂', h1, h2, h3, h4⟩
      · refine ⟨(∅, 1, 1), Or.inl ?_⟩
        rw [weightedEnergy, dif_pos hf]
        exact mul_nonpos_of_nonneg_of_nonpos (gWeight_nonneg x)
          (mul_nonpos_of_nonneg_of_nonpos (mul_nonneg (hpn x) hnorm0) h0)
      · refine ⟨(A, X₁', X₂'), Or.inr ⟨hf, h1, h2, h3, ?_⟩⟩
        rw [weightedEnergy, dif_pos hf]
        calc gWeight x * ((x.G.absNorm : ℝ) * (x.D.absNorm : ℝ) * pairNorm x.d * r.norm * raw x hf v)
            ≤ gWeight x * ((x.G.absNorm : ℝ) * (x.D.absNorm : ℝ) * pairNorm x.d * r.norm * (mass x *
                rayChild η ω₁ ω₂ keep r v (x.anchor r) A X₁' X₂' (r.V₀ * x.twist) (dyadicScale (x.n 1)))) :=
              mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_left h4
                (mul_nonneg (hpn x) hnorm0)) (gWeight_nonneg x)
          _ = _ := by ring
    · exact ⟨(∅, 1, 1), Or.inl (by rw [weightedEnergy, dif_neg hf, mul_zero])⟩
  choose! c hc using hsel
  let E : GLabel θ mesh Z → ℝ := fun x =>
    rayChild η ω₁ ω₂ keep r v (x.anchor r) (c x).1 (c x).2.1 (c x).2.2 (r.V₀ * x.twist) (dyadicScale (x.n 1))
  let wt : GLabel θ mesh Z → ℝ := fun x =>
    gWeight x * ((x.G.absNorm : ℝ) * (x.D.absNorm : ℝ) * pairNorm x.d * mass x)
  set good := labels.filter (fun x => 0 < gWeight x * weightedEnergy η r raw x v) with hgood_def
  have hgood : ∀ x ∈ good, x ∈ labels ∧ Fits η r x ∧ 0 < (c x).2.1 ∧ 0 < (c x).2.2 ∧
      (((c x).2.1 ≤ r.X₁ ∧ (c x).2.2 ≤ r.X₂) ∨ ((c x).2.1 ≤ r.Y₁ ∧ (c x).2.2 ≤ r.Y₂)) ∧
      0 < gWeight x * weightedEnergy η r raw x v ∧
      gWeight x * weightedEnergy η r raw x v ≤ r.norm * (wt x * E x) := by
    intro x hx
    obtain ⟨hxl, hpos⟩ := Finset.mem_filter.mp hx
    rcases hc x hxl with h | ⟨hf, h1, h2, h3, h4⟩
    · exact absurd h (not_le.mpr hpos)
    · exact ⟨hxl, hf, h1, h2, h3, hpos, h4⟩
  have hstep1 : ∑ x ∈ labels, gWeight x * weightedEnergy η r raw x v ≤ r.norm * ∑ x ∈ good, wt x * E x := by
    rw [← Finset.sum_filter_add_sum_filter_not labels (fun x => 0 < gWeight x * weightedEnergy η r raw x v)]
    have hneg : ∑ x ∈ labels.filter (fun x => ¬ 0 < gWeight x * weightedEnergy η r raw x v),
        gWeight x * weightedEnergy η r raw x v ≤ 0 :=
      Finset.sum_nonpos fun x hx => not_lt.mp (Finset.mem_filter.mp hx).2
    rw [Finset.mul_sum]
    have hpos : ∑ x ∈ good, gWeight x * weightedEnergy η r raw x v ≤ ∑ x ∈ good, r.norm * (wt x * E x) :=
      Finset.sum_le_sum fun x hx => (hgood x hx).2.2.2.2.2.2
    linarith
  -- (2) a contributing child has both lengths above the first ideal norm
  have hb0 : 0 < θ.b := lt_of_lt_of_le zero_lt_one θ.hb1
  have hE0 : ∀ x ∈ good, E x ≠ 0 := by
    intro x hx hE
    obtain ⟨-, hf, -, -, -, hpos, hle⟩ := hgood x hx
    rw [hE, mul_zero, mul_zero] at hle
    linarith
  have hlow : ∀ x ∈ good, 1 / θ.b ≤ (c x).2.1 ∧ 1 / θ.b ≤ (c x).2.2 := by
    intro x hx
    obtain ⟨-, -, h1, h2, -, -, -⟩ := hgood x hx
    constructor
    · by_contra hlt
      push_neg at hlt
      apply hE0 x hx
      have hz (z : O) := rowTwistedSum_eq_zero_of_small
        ((anchors η ((x.anchor r))).product ω₁) pmask 1 z ((r.prof v).profile 0) θ.a θ.b θ.ha0
        ((r.prof v).support 0) 0 _ h1 (by rw [lt_div_iff₀ hb0] at hlt; linarith)
      simp [E,rayChild,mixedEnergy,mixedRow,hz]
    · by_contra hlt
      push_neg at hlt
      apply hE0 x hx
      have hz (z : O) := rowTwistedSum_eq_zero_of_small
        ((anchors η ((x.anchor r))).product ω₂) pmask 1 z ((r.prof v).profile 1) θ.a θ.b θ.ha0
        ((r.prof v).support 1) 0 _ h2 (by rw [lt_div_iff₀ hb0] at hlt; linarith)
      simp [E,rayChild,mixedEnergy,mixedRow,hz]
  -- lengths of a child
  have hup : ∀ x ∈ good, (c x).2.1 ≤ Z^L ∧ (c x).2.2 ≤ Z^L ∧
      length Z (c x).2.1 + length Z (c x).2.2 ≤ gP r := by
    intro x hx
    obtain ⟨-, -, h1, h2, h3, -, -⟩ := hgood x hx
    rcases h3 with ⟨a1, a2⟩ | ⟨a1, a2⟩
    · refine ⟨a1.trans r.hX₁L, a2.trans r.hX₂L, ?_⟩
      exact (add_le_add (length_mono Z _ _ hZ1 a1) (length_mono Z _ _ hZ1 a2)).trans
        (le_max_left _ _)
    · refine ⟨a1.trans r.hY₁L, a2.trans r.hY₂L, ?_⟩
      exact (add_le_add (length_mono Z _ _ hZ1 a1) (length_mono Z _ _ hZ1 a2)).trans
        (le_max_right _ _)
  have hl30 : 0 ≤ Real.logb Z 3 := Real.logb_nonneg hZ1 (by norm_num)
  have hscaled : ∀ (X : ℝ) (e : Fin 2), 0 < X →
      length Z (scale e * dyadicTop X) ≤ length Z X + Real.logb Z 3 := by
    intro X e hX
    have hs := ProfileSeparation.scale_mem e
    have hT := dyadicTop_spec X hX
    have h3 : scale e * dyadicTop X ≤ 3 * X := by nlinarith [hs.2, dyadicTop_pos X]
    exact (length_mono Z _ _ hZ1 h3).trans (length_mul_le Z 3 X hZ1 (by norm_num))
  -- (3) classes
  let key : GLabel θ mesh Z → DictIdx × Finset (Fin θ.N) × ℤ × ℤ := fun x =>
    (x.anchor r, (c x).1, dyadicIndex (c x).2.1, dyadicIndex (c x).2.2)
  set img := good.image key with himg
  set Kc : ℝ := 2 * Z^(H + mesh) with hKc
  have hKc0 : 0 < Kc := by positivity
  have hlogKc : Real.logb Z Kc = Real.logb Z 2 + (H + mesh) := by
    rw [hKc, Real.logb_mul (by norm_num) (Real.rpow_pos_of_pos hZ0 _).ne',
      Real.logb_rpow hZ0 hZ1.ne']
  have hl2 : 0 ≤ Real.logb Z 2 := Real.logb_nonneg hZ1 (by norm_num)
  have hl23 : Real.logb Z 2 ≤ Real.logb Z 3 := Real.logb_le_logb_of_le hZ1 (by norm_num) (by norm_num)
  set Pbd := gP r + 2 * Real.logb Z 3 with hPbd
  set Dfib := Cred * Z^(ε/8 + ε/16) * r.vol * Z^(ε/8) with hDfib
  set T := QuadraticInitialBound.diagonalControl ballProfile *
      (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA *
      Z^(Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i) (Real.logb Z Kc) + ε/8) with hT
  have hT0 : 0 ≤ T := by
    have := Real.rpow_nonneg hZ0.le (Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i)
      (Real.logb Z Kc) + ε/8)
    have : 0 ≤ (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA := by
      apply pow_nonneg; linarith [abs_nonneg r.t, abs_nonneg v, r.hVf, abs_nonneg (0:ℝ)]
    positivity
  set L0 := ∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ, 1 * pairMajorant ((r.prof v).profile 0)
      ((r.prof v).profile 1) (prof_support r v 0) (prof_support r v 1) e τ with hL0
  set LJ := ∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ, 1 * pairMajorant ((r.prof v).profile 0)
      ((r.prof v).profile 1) (prof_support r v 0) (prof_support r v 1) e τ *
        pairWeight (2*nP) τ with hLJ
  -- mass bound and fibre
  have hmass : ∀ x ∈ good, wt x ≤ gWeight x * (Cred * Z^(ε/8 + ε/16) * r.vol) := by
    intro x hx
    obtain ⟨-, hf, -⟩ := hgood x hx
    have hM0 : 0 < max 1 θ.Bmask := lt_of_lt_of_le zero_lt_one (le_max_left _ _)
    have hδ0 : 0 ≤ ε/(48 * max 1 θ.Bmask) := by positivity
    have hδB : 3 * (ε/(48 * max 1 θ.Bmask)) * θ.Bmask ≤ ε/16 := by
      have h1 : θ.Bmask ≤ max 1 θ.Bmask := le_max_right _ _
      have h2 : 3 * (ε/(48 * max 1 θ.Bmask)) * θ.Bmask ≤
          3 * (ε/(48 * max 1 θ.Bmask)) * max 1 θ.Bmask :=
        mul_le_mul_of_nonneg_left h1 (by positivity)
      have h3 : 3 * (ε/(48 * max 1 θ.Bmask)) * max 1 θ.Bmask = ε/16 := by
        field_simp; ring
      linarith
    have hext := Second.Concrete.labelMass_extracted Cred Z (ε/8) (ε/(48 * max 1 θ.Bmask))
      θ.Bmask hCred hZ1.le hδ0 r.w r.X₁ r.X₂ r.hX₁ r.hX₂ x.G x.D hf.G_ne hf.D_sq.ne_zero (⊤, ⊤)
      (top_ne_bot : (⊤ : Ideal O) ≠ ⊥) (top_ne_bot : (⊤ : Ideal O) ≠ ⊥) hf.G_cap hf.D_cap
    rw [← labelMass_pair Cred Z (ε/8) (ε/(48 * max 1 θ.Bmask)) r.w r.X₁ r.X₂ x.G x.D x.d
      hf.d₁ hf.d₂, ← mul_assoc] at hext
    have hZp : Z^(ε/8 + 3 * (ε/(48 * max 1 θ.Bmask)) * θ.Bmask) ≤ Z^(ε/8 + ε/16) :=
      Real.rpow_le_rpow_of_exponent_le hZ1.le (by linarith)
    apply mul_le_mul_of_nonneg_left _ (gWeight_nonneg x)
    calc (x.G.absNorm : ℝ) * (x.D.absNorm : ℝ) * pairNorm x.d * mass x
        ≤ Cred * Z^(ε/8 + 3 * (ε/(48 * max 1 θ.Bmask)) * θ.Bmask) *
            (r.X₁ * r.X₂ * ∏ i, Z^(r.w i)) := hext
      _ ≤ Cred * Z^(ε/8 + ε/16) * (r.X₁ * r.X₂ * ∏ i, Z^(r.w i)) := by
          exact mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hZp hCred) hvol.le
      _ = Cred * Z^(ε/8 + ε/16) * r.vol := rfl
  have hwt0 : ∀ x, 0 ≤ wt x := by
    intro x
    apply mul_nonneg (gWeight_nonneg x)
    apply mul_nonneg (hpn x)
    unfold mass labelMass
    have : 0 < ∏ i, Z^(r.w i) := Finset.prod_pos fun i _ => Real.rpow_pos_of_pos hZ0 _
    have := Real.rpow_pos_of_pos hZ0 (ε/8)
    have := r.hX₁; have := r.hX₂
    have : (0:ℝ) ≤ (x.G.absNorm : ℝ)^(ε/(48 * max 1 θ.Bmask)) := Real.rpow_nonneg (Nat.cast_nonneg _) _
    have : (0:ℝ) ≤ (x.D.absNorm : ℝ)^(ε/(48 * max 1 θ.Bmask)) := Real.rpow_nonneg (Nat.cast_nonneg _) _
    have : (0:ℝ) ≤ pairNorm x.d := by unfold pairNorm; positivity
    positivity
  have hclass : ∀ k ∈ img, ∑ x ∈ good.filter (fun x => key x = k), wt x * E x ≤
      (4 * Dfib) * (CA * CP^2) * L0 * LJ * T := by
    intro k hk
    obtain ⟨x₁, hx₁, hkx₁⟩ := Finset.mem_image.mp hk
    set F := good.filter (fun x => key x = k) with hF
    have hFk : ∀ x ∈ F, x.anchor r = k.1 ∧ (c x).1 = k.2.1 ∧ dyadicIndex (c x).2.1 = k.2.2.1 ∧
        dyadicIndex (c x).2.2 = k.2.2.2 := by
      intro x hx
      have h := (Finset.mem_filter.mp hx).2
      simp only [key, Prod.ext_iff] at h
      exact ⟨h.1, h.2.1, h.2.2.1, h.2.2.2⟩
    have hEF : ∀ x ∈ F, E x = rayChild η ω₁ ω₂ keep r v k.1 k.2.1 (c x).2.1 (c x).2.2 (r.V₀ * x.twist)
        (dyadicScale (x.n 1)) := by
      intro x hx
      obtain ⟨h1, h2, -, -⟩ := hFk x hx
      simp only [E]; rw [h1, h2]
    rw [Finset.sum_congr rfl (fun x hx => by rw [hEF x hx])]
    -- the class representative
    obtain ⟨hk1, hk2, hk3, hk4⟩ : x₁.anchor r = k.1 ∧ (c x₁).1 = k.2.1 ∧
        dyadicIndex (c x₁).2.1 = k.2.2.1 ∧ dyadicIndex (c x₁).2.2 = k.2.2.2 := by
      simp only [key, Prod.ext_iff] at hkx₁
      exact ⟨hkx₁.1, hkx₁.2.1, hkx₁.2.2.1, hkx₁.2.2.2⟩
    obtain ⟨-, -, hx1p, hx2p, -, -, -⟩ := hgood x₁ hx₁
    obtain ⟨hu1, hu2, hu3⟩ := hup x₁ hx₁
    have hY₁ : (2:ℝ)^k.2.2.1 = dyadicTop (c x₁).2.1 := by rw [dyadicTop, hk3]
    have hY₂ : (2:ℝ)^k.2.2.2 = dyadicTop (c x₁).2.2 := by rw [dyadicTop, hk4]
    have hlen1 : ∀ e : Fin 2, length Z (scale e * (2:ℝ)^k.2.2.1) ≤ length Z (c x₁).2.1 +
        Real.logb Z 3 := fun e => by rw [hY₁]; exact hscaled _ e hx1p
    have hlen2 : ∀ e : Fin 2, length Z (scale e * (2:ℝ)^k.2.2.2) ≤ length Z (c x₁).2.2 +
        Real.logb Z 3 := fun e => by rw [hY₂]; exact hscaled _ e hx2p
    have hsrc (e : Fin 2 × Fin 2) (τ : ℝ × ℝ) :
        mixedEnergy ((anchors η k.1).product ω₁) ((anchors η k.1).product ω₂) (anchors η k.1)
          pmask 1 0 ((commonPair e τ).profile 0) ((commonPair e τ).profile 1)
          (r.pools k.2.1) (r.coeffs v k.2.1) (r.scales k.2.1)
          (scale e.1 * (2:ℝ)^k.2.2.1) (scale e.2 * (2:ℝ)^k.2.2.2) (keep k.1) ballProfile Kc ≤
            (CA*CP^2) * pairWeight (2*nP) τ * T := by
      have hcshape : InShape n y short err (length Z (c x₁).2.1) (length Z (c x₁).2.2) := by
        rcases (hgood x₁ hx₁).2.2.2.2.1 with ⟨h1,h2⟩|⟨h1,h2⟩
        · simpa using shape_mono (d:=0) hXshape (by simpa using length_mono Z _ _ hZ1 h1)
            (by simpa using length_mono Z _ _ hZ1 h2)
        · simpa using shape_mono (d:=0) hYshape (by simpa using length_mono Z _ _ hZ1 h1)
            (by simpa using length_mono Z _ _ hZ1 h2)
      have hh := hleaf k.1 k.2.1 v e τ _ _ (mul_pos (ProfileSeparation.scale_pos _) (zpow_pos (by norm_num) _))
        (mul_pos (ProfileSeparation.scale_pos _) (zpow_pos (by norm_num) _))
        (shape_mono hcshape (hlen1 e.1) (hlen2 e.2))
        ((hlen1 e.1).trans (by linarith [length_le_of_le_rpow Z _ L hZ1 hL hu1]))
        ((hlen2 e.2).trans (by linarith [length_le_of_le_rpow Z _ L hZ1 hL hu2]))
      have hplen : length Z (scale e.1 * (2:ℝ)^k.2.2.1) +
          length Z (scale e.2 * (2:ℝ)^k.2.2.2) ≤ Pbd := by linarith [hlen1 e.1, hlen2 e.2]
      have hs : ∑ i : k.2.1, r.w i ≤ ∑ i, r.w i := by
        rw [Finset.sum_coe_sort k.2.1 (fun i => r.w i)]
        exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _)
          (fun i _ _ => r.hw i)
      have hprice := price.mono w₀ Pbd (length Z (scale e.1 * ((2:ℝ)^k.2.2.1)) + length Z (scale e.2 * ((2:ℝ)^k.2.2.2)))
        (∑ i, r.w i) (∑ i : k.2.1, r.w i) (Real.logb Z Kc) (hplen) hs
      have hctl2 : ((commonPair e τ).control SA)^2 ≤ CP^2 * pairWeight (2*nP) τ := by
        rw [pairWeight_two_mul, ← mul_pow]
        exact pow_le_pow_left₀ (Profiles.control_nonneg _ _) (hctl e τ) 2
      have hd := QuadraticInitialBound.diagonalControl_nonneg ballProfile
      have hH0 : 0 ≤ (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA := by
        apply pow_nonneg; linarith [abs_nonneg r.t, abs_nonneg v, r.hVf, abs_nonneg (0:ℝ)]
      have hZe : Z^(Real.logb Z Kc + price.f w₀ (length Z (scale e.1 * ((2:ℝ)^k.2.2.1)) +
            length Z (scale e.2 * ((2:ℝ)^k.2.2.2))) (∑ i : k.2.1, r.w i) (Real.logb Z Kc) + (ε/8)) ≤
          Z^(Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i) (Real.logb Z Kc) + (ε/8)) :=
        Real.rpow_le_rpow_of_exponent_le hZ1.le (by linarith)
      have hZ0 : 0 ≤ Z^(Real.logb Z Kc + price.f w₀ (length Z (scale e.1 * ((2:ℝ)^k.2.2.1)) +
            length Z (scale e.2 * ((2:ℝ)^k.2.2.2))) (∑ i : k.2.1, r.w i) (Real.logb Z Kc) + (ε/8)) :=
        Real.rpow_nonneg (by linarith) _
      apply hh.trans
      calc CA * QuadraticInitialBound.diagonalControl ballProfile * ((commonPair e τ).control SA)^2 *
            (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA *
            Z^(Real.logb Z Kc + price.f w₀ (length Z (scale e.1 * ((2:ℝ)^k.2.2.1)) +
              length Z (scale e.2 * ((2:ℝ)^k.2.2.2))) (∑ i : k.2.1, r.w i) (Real.logb Z Kc) + (ε/8))
          ≤ CA * QuadraticInitialBound.diagonalControl ballProfile * (CP^2 * pairWeight (2*nP) τ) *
            (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA *
            Z^(Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i) (Real.logb Z Kc) + (ε/8)) := by
            apply mul_le_mul _ hZe hZ0 (mul_nonneg (mul_nonneg (mul_nonneg hCA hd)
              (mul_nonneg (sq_nonneg _) (ProfileSeparation.pairWeight_nonneg _ _))) hH0)
            apply mul_le_mul_of_nonneg_right _ hH0
            exact mul_le_mul_of_nonneg_left hctl2 (mul_nonneg hCA hd)
        _ = _ := by ring
    have hcb := grouped_ray_class_bound ((anchors η k.1).product ω₁) ((anchors η k.1).product ω₂) (anchors η k.1) pmask
      (keep k.1) (hkeep k.1)
      ((r.prof v).profile 0) ((r.prof v).profile 1) (prof_support r v 0) (prof_support r v 1)
      (r.pools k.2.1) (r.coeffs v k.2.1) (r.scales k.2.1) ((2:ℝ)^k.2.2.1) ((2:ℝ)^k.2.2.2) Kc
      (zpow_pos (by norm_num) _) (zpow_pos (by norm_num) _) hKc0 F wt hwt0
      (fun x => r.V₀ * x.twist) (fun x => dyadicScale (x.n 1))
      (fun x hx => by
        have hf := (hgood x (Finset.mem_filter.mp hx).1).2.1
        exact mul_pos (absNorm_span_pos _ (mul_ne_zero r.hV₀ hf.twist_ne)) (dyadicScale_pos _))
      (fun x hx => by
        have hxg := (Finset.mem_filter.mp hx).1
        have hf := (hgood x hxg).2.1
        have hxl := (hgood x hxg).1
        have hpos : 0 < ((Ideal.span {r.V₀ * x.twist}).absNorm : ℝ) * dyadicScale (x.n 1) :=
          mul_pos (absNorm_span_pos _ (mul_ne_zero r.hV₀ hf.twist_ne)) (dyadicScale_pos _)
        have he : ((Ideal.span {r.V₀ * x.twist}).absNorm : ℝ) * dyadicScale (x.n 1) =
            Z^(gEnvelope r x) := (Real.rpow_logb hZ0 hZ1.ne' hpos).symm
        have hle : gEnvelope r x ≤ H + mesh := by
          linarith [(abs_le.mp (henv' x hxl)).2]
        rw [he, hKc]
        have := Real.rpow_le_rpow_of_exponent_le hZ1.le hle
        linarith)
      (fun x => (c x).2.1) (fun x => (c x).2.2)
      (fun x hx => by
        obtain ⟨h1, h2, h3, h4⟩ := hFk x hx
        have hxg := (Finset.mem_filter.mp hx).1
        obtain ⟨-, -, hp1, hp2, -, -, -⟩ := hgood x hxg
        have e1 : (2:ℝ)^k.2.2.1 = dyadicTop (c x).2.1 := by rw [dyadicTop, h3]
        have e2 : (2:ℝ)^k.2.2.2 = dyadicTop (c x).2.2 := by rw [dyadicTop, h4]
        rw [e1, e2]
        exact ⟨hp1, (dyadicTop_spec _ hp1).1, (dyadicTop_spec _ hp1).2,
          hp2, (dyadicTop_spec _ hp2).1, (dyadicTop_spec _ hp2).2⟩)
      Dfib (by positivity)
      (fun y hy hyK => by
        have hyN : ((Ideal.span {y}).absNorm : ℝ) ≤ Z^(Mmax + 2) := by
          have e := ActualEisensteinCubic.eisEmbedding_norm_sq_eq_absNorm_span y
          have hKcM : Kc ≤ Z^(Mmax + 2) := by
            have hle : H + mesh ≤ Mmax + 1/2 := by linarith
            have h1 := Real.rpow_le_rpow_of_exponent_le hZ1.le hle
            have h2 : Z^(Mmax + 2) = Z^(Mmax + 1/2) * Z^(3/2:ℝ) := by
              rw [← Real.rpow_add hZ0]; ring_nf
            have h3 : 0 ≤ Z^(Mmax + 1/2) := Real.rpow_nonneg hZ0.le _
            rw [hKc, h2]; nlinarith
          rw [← e]; exact hyK.trans hKcM
        have hsub : ∑ x ∈ F.filter (fun x => r.V₀ * x.twist ∣ y), wt x ≤
            ∑ x ∈ labels.filter (fun x => r.V₀ * x.twist ∣ y),
              gWeight x * (Cred * Z^(ε/8 + ε/16) * r.vol) := by
          calc ∑ x ∈ F.filter (fun x => r.V₀ * x.twist ∣ y), wt x
              ≤ ∑ x ∈ F.filter (fun x => r.V₀ * x.twist ∣ y),
                  gWeight x * (Cred * Z^(ε/8 + ε/16) * r.vol) :=
                Finset.sum_le_sum fun x hx =>
                  hmass x (Finset.mem_filter.mp (Finset.mem_filter.mp hx).1).1
            _ ≤ _ := by
                apply Finset.sum_le_sum_of_subset_of_nonneg
                · intro x hx
                  obtain ⟨hxF, hxy⟩ := Finset.mem_filter.mp hx
                  exact Finset.mem_filter.mpr ⟨(hgood x (Finset.mem_filter.mp hxF).1).1, hxy⟩
                · intro x _ _
                  exact mul_nonneg (gWeight_nonneg x) (by positivity)
        have hmb : 0 ≤ Cred * Z^(ε/8 + ε/16) * r.vol := by positivity
        have hfp := fibre_packed r labels gWeight gWeight_nonneg (Z^(ε/8)) (Z^(Mmax + 2))
          (Real.rpow_nonneg hZ0.le _) hfib' y hy hyN
        refine hsub.trans ?_
        rw [← Finset.sum_mul]
        calc (∑ x ∈ labels.filter (fun x => r.V₀ * x.twist ∣ y), gWeight x) *
              (Cred * Z^(ε/8 + ε/16) * r.vol) ≤ Z^(ε/8) * (Cred * Z^(ε/8 + ε/16) * r.vol) :=
              mul_le_mul_of_nonneg_right hfp hmb
          _ = Dfib := by rw [hDfib]; ring)
      (CA * CP^2) T (2*nP) (by positivity) hT0 hsrc
    refine le_trans (le_of_eq ?_) hcb
    apply Finset.sum_congr rfl
    intro x _
    rfl
  -- (4) count of classes
  set klo := ⌈- Real.logb 2 θ.b⌉
  set khi := ⌈L * Real.logb 2 Z⌉
  have himg_sub : img ⊆ (Finset.univ : Finset DictIdx) ×ˢ (Finset.univ : Finset (Finset (Fin θ.N))) ×ˢ
      (Finset.Icc klo khi ×ˢ Finset.Icc klo khi) := by
    intro k hk
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.mp hk
    obtain ⟨hl1, hl2⟩ := hlow x hx
    obtain ⟨hu1, hu2, -⟩ := hup x hx
    obtain ⟨-, -, hp1, hp2, -⟩ := hgood x hx
    simp only [key, Finset.mem_product, Finset.mem_univ, Finset.mem_Icc, true_and]
    exact ⟨⟨dyadicIndex_lower _ _ hb0 hl1, dyadicIndex_upper _ Z L hp1 hZ0 hu1⟩,
      ⟨dyadicIndex_lower _ _ hb0 hl2, dyadicIndex_upper _ Z L hp2 hZ0 hu2⟩⟩
  have hcard : (img.card : ℝ) ≤ Z^(ε/16) := by
    have h1 : (img.card : ℝ) ≤ ((Fintype.card DictIdx : ℝ) * 2^θ.N) *
        ((Finset.Icc klo khi).card : ℝ)^2 := by
      have := Finset.card_le_card himg_sub
      rw [Finset.card_product, Finset.card_product, Finset.card_product, Finset.card_univ,
        Finset.card_univ, Fintype.card_finset, Fintype.card_fin] at this
      have : (img.card : ℝ) ≤ ((Fintype.card DictIdx * (2^θ.N * ((Finset.Icc klo khi).card *
          (Finset.Icc klo khi).card)) : ℕ) : ℝ) := by exact_mod_cast this
      push_cast at this
      linarith
    have h2 := card_dyadic_le L θ.b Z hL θ.hb1 hZ1.le
    have h3 : ((Finset.Icc klo khi).card : ℝ)^2 ≤ (L * Real.logb 2 Z + Real.logb 2 θ.b + 2)^2 :=
      pow_le_pow_left₀ (Nat.cast_nonneg _) h2 2
    have h4 : 0 ≤ (Fintype.card DictIdx : ℝ) * 2^θ.N := by positivity
    calc (img.card : ℝ) ≤ _ := h1
      _ ≤ _ := mul_le_mul_of_nonneg_left h3 h4
      _ ≤ _ := hcount
  -- (5) sum over classes
  have hsum : ∑ x ∈ good, wt x * E x ≤ (img.card : ℝ) * ((4 * Dfib) * (CA * CP^2) * L0 * LJ * T) := by
    rw [← Finset.sum_fiberwise_of_maps_to (fun x hx => Finset.mem_image_of_mem key hx)]
    calc ∑ k ∈ img, ∑ x ∈ good.filter (fun x => key x = k), wt x * E x
        ≤ ∑ _k ∈ img, (4 * Dfib) * (CA * CP^2) * L0 * LJ * T := Finset.sum_le_sum hclass
      _ = _ := by rw [Finset.sum_const, nsmul_eq_mul]
  -- (6) masses
  have hL0b : L0 ≤ 4 * (K₀ * (C₀^2 * (sourceControl S₀ r.W₁ * sourceControl S₀ r.W₂) *
      (r.height * (1 + ‖v‖))^(2*n₀))) := by
    have h := profile_mass r v 0 T₀ K₀ hm₀ n₀ S₀ C₀ hC₀ htw₀ hK₀
    refine le_trans (le_of_eq ?_) h
    apply Finset.sum_congr rfl; intro e _
    congr 1; funext τ; rw [ProfileSeparation.pairWeight_zero, mul_one]
  have hLJb : LJ ≤ 4 * (KJ * (CJ^2 * (sourceControl SJ r.W₁ * sourceControl SJ r.W₂) *
      (r.height * (1 + ‖v‖))^(2*nJ))) :=
    profile_mass r v (2*nP) TJ KJ hmJ nJ SJ CJ hCJ htwJ hKJ
  have hL00 : 0 ≤ L0 := Finset.sum_nonneg fun e _ => MeasureTheory.integral_nonneg fun τ =>
    mul_nonneg zero_le_one (ProfileSeparation.pairMajorant_nonneg _ _ _ _ _ _)
  have hLJ0 : 0 ≤ LJ := Finset.sum_nonneg fun e _ => MeasureTheory.integral_nonneg fun τ =>
    mul_nonneg (mul_nonneg zero_le_one (ProfileSeparation.pairMajorant_nonneg _ _ _ _ _ _))
      (ProfileSeparation.pairWeight_nonneg _ _)
  -- (7) exponent
  have hpriceT : price.f w₀ Pbd (∑ i, r.w i) (Real.logb Z Kc) ≤
      price.f w₀ (gP r) (∑ i, r.w i) H + price.lip * (2 * Real.logb Z 3) +
        price.lip * (Real.logb Z 2 + mesh) := by
    have h1 := price.lipP w₀ (gP r) (∑ i, r.w i) (Real.logb Z Kc) (2 * Real.logb Z 3)
      (by linarith)
    have h2 := price.lipM w₀ (gP r) (∑ i, r.w i) H (Real.logb Z 2 + mesh)
    rw [show H + (Real.logb Z 2 + mesh) = Real.logb Z Kc by rw [hlogKc]; ring,
      abs_of_nonneg (by linarith)] at h2
    linarith
  have hexp : r.kLog - r.colLog + (ε/8 + ε/16) + ε/8 + ε/16 +
      (Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i) (Real.logb Z Kc) + ε/8) ≤ tgt := by
    have hlip := price.lip_nonneg
    have a1 := mul_le_mul_of_nonneg_left hl23 hlip
    have e1 : (1 + 3*price.lip) * Real.logb Z 3 = Real.logb Z 3 + 3*(price.lip*Real.logb Z 3) := by
      ring
    have e2 : (3 + price.lip) * mesh = 3*mesh + price.lip*mesh := by ring
    have e3 : price.lip * (2 * Real.logb Z 3) = 2*(price.lip*Real.logb Z 3) := by ring
    have e4 : price.lip * (Real.logb Z 2 + mesh) = price.lip*Real.logb Z 2 + price.lip*mesh := by
      ring
    linarith [hl3, e1, hmeshε, e2, hpriceT, e3, e4, a1, hlogKc, hHle, hl23, hl2, htgt]
  have hzpart := zpart Z r.kLog r.colLog
    (Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i) (Real.logb Z Kc) + ε/8) tgt (img.card : ℝ)
    r.vol (ε/8 + ε/16) (ε/8) (ε/16) hZ1 (Real.rpow_logb hZ0 hZ1.ne' hvol).symm hvol
    (Nat.cast_nonneg _) hcard hexp
  -- (8) assembly
  have hsc : ∀ (S S' : Finset (ℕ×ℕ)) (W : 𝓢(ℝ,ℂ)), S ⊆ S' → sourceControl S W ≤ sourceControl S' W :=
    fun S S' W h => Seminorm.le_def.mp (Finset.sup_mono h) W
  have hh1 : 1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf) ≤ r.height * (1 + ‖v‖) := by
    unfold GSrc.height
    rw [abs_zero, Real.norm_eq_abs]
    have := abs_nonneg v; have := abs_nonneg r.t; have := abs_nonneg r.t₁
    have := abs_nonneg r.t₂; have := r.hVf
    nlinarith
  have hH1 := r.one_le_height
  have hv1 : (1:ℝ) ≤ 1 + ‖v‖ := by linarith [norm_nonneg v]
  set s₀ := sourceControl S₀ r.W₁ * sourceControl S₀ r.W₂
  set sJ := sourceControl SJ r.W₁ * sourceControl SJ r.W₂
  set sU := sourceControl (S₀ ∪ SJ) r.W₁ * sourceControl (S₀ ∪ SJ) r.W₂
  have hs₀ : s₀ ≤ sU := mul_le_mul (hsc _ _ _ Finset.subset_union_left)
    (hsc _ _ _ Finset.subset_union_left) (sourceControl_nonneg _ _) (sourceControl_nonneg _ _)
  have hsJ : sJ ≤ sU := mul_le_mul (hsc _ _ _ Finset.subset_union_right)
    (hsc _ _ _ Finset.subset_union_right) (sourceControl_nonneg _ _) (sourceControl_nonneg _ _)
  have hs₀0 : 0 ≤ s₀ := mul_nonneg (sourceControl_nonneg _ _) (sourceControl_nonneg _ _)
  have hsJ0 : 0 ≤ sJ := mul_nonneg (sourceControl_nonneg _ _) (sourceControl_nonneg _ _)
  set B := r.height * (1 + ‖v‖) with hB
  have hB1 : 1 ≤ B := by nlinarith
  have hpowB : B^(2*n₀) * B^(2*nJ) * (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA ≤
      r.height^deg * (1 + ‖v‖)^(2*deg) := by
    have h1 : (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA ≤ B^degA :=
      pow_le_pow_left₀ (by linarith [abs_nonneg r.t, abs_nonneg v, r.hVf, abs_nonneg (0:ℝ)]) hh1 _
    have h2 : B^(2*n₀) * B^(2*nJ) * B^degA = r.height^deg * (1 + ‖v‖)^deg := by
      rw [← pow_add, ← pow_add, hB, mul_pow, hdeg]; ring_nf
    have h3 : (1 + ‖v‖)^deg ≤ (1 + ‖v‖)^(2*deg) := pow_le_pow_right₀ hv1 (by omega)
    calc B^(2*n₀) * B^(2*nJ) * (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA
        ≤ B^(2*n₀) * B^(2*nJ) * B^degA := mul_le_mul_of_nonneg_left h1 (by positivity)
      _ = r.height^deg * (1 + ‖v‖)^deg := h2
      _ ≤ _ := mul_le_mul_of_nonneg_left h3 (by positivity)
  -- final chain
  calc ∑ x ∈ labels, gWeight x * weightedEnergy η r raw x v
      ≤ r.norm * ∑ x ∈ good, wt x * E x := hstep1
    _ ≤ r.norm * ((img.card : ℝ) * ((4 * Dfib) * (CA * CP^2) * L0 * LJ * T)) :=
        mul_le_mul_of_nonneg_left hsum hnorm0
    _ ≤ r.norm * ((img.card : ℝ) * ((4 * Dfib) * (CA * CP^2) *
          (4 * (K₀ * (C₀^2 * s₀ * B^(2*n₀)))) * (4 * (KJ * (CJ^2 * sJ * B^(2*nJ)))) * T)) := by
        apply mul_le_mul_of_nonneg_left _ hnorm0
        apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg _)
        apply mul_le_mul_of_nonneg_right _ hT0
        have hDf : 0 ≤ 4 * Dfib * (CA * CP^2) := by positivity
        exact mul_le_mul (mul_le_mul_of_nonneg_left hL0b hDf) hLJb hLJ0
          (mul_nonneg hDf (by positivity))
    _ = ctot CA CP Cred K₀ C₀ KJ CJ * (s₀ * sJ) *
          (B^(2*n₀) * B^(2*nJ) * (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA) *
          (Z^r.kLog / r.vol^2 * Z^(ε/8 + ε/16) * r.vol * Z^(ε/8) * (img.card : ℝ) *
            Z^(Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i) (Real.logb Z Kc) + ε/8)) := by
        rw [hT, hDfib]; unfold ctot GSrc.norm; ring
    _ ≤ ctot CA CP Cred K₀ C₀ KJ CJ * sU^2 * (r.height^deg * (1 + ‖v‖)^(2*deg)) * Z^tgt := by
        have hsU : s₀ * sJ ≤ sU^2 := by rw [sq]; exact mul_le_mul hs₀ hsJ hsJ0 (hs₀0.trans hs₀)
        have hz0 : 0 ≤ Z^r.kLog / r.vol^2 * Z^(ε/8 + ε/16) * r.vol * Z^(ε/8) * (img.card : ℝ) *
            Z^(Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i) (Real.logb Z Kc) + ε/8) := by
          have := Real.rpow_nonneg hZ0.le r.kLog
          have := Real.rpow_nonneg hZ0.le (ε/8)
          have := Real.rpow_nonneg hZ0.le (ε/8 + ε/16)
          have := Real.rpow_nonneg hZ0.le (Real.logb Z Kc + price.f w₀ Pbd (∑ i, r.w i)
            (Real.logb Z Kc) + ε/8)
          positivity
        have hp0 : 0 ≤ B^(2*n₀) * B^(2*nJ) * (1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf))^degA := by
          have : 0 ≤ 1 + |(0:ℝ)| + (|r.t| + |v| + r.Vf) := by
            linarith [abs_nonneg r.t, abs_nonneg v, r.hVf, abs_nonneg (0:ℝ)]
          positivity
        apply mul_le_mul _ hzpart hz0 (by positivity)
        apply mul_le_mul _ hpowB hp0 (by positivity)
        exact mul_le_mul_of_nonneg_left hsU hctot0
    _ = _ := by unfold gAmp; ring

end
end ContinuumLocalReturn.AsymmetricRayGroupedSide
#print axioms ContinuumLocalReturn.AsymmetricRayGroupedSide.packed_at
