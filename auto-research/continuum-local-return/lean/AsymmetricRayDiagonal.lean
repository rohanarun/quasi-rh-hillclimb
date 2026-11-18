/- Copyright (c) 2026 Sil. Apache-2.0.
   Adapted with OpenAI Codex assistance from MixedOriginalSecondZero, MixedOriginalTail,
   MixedOriginalTailPower and ConcreteDiagAssembly at tracker c74d855.
   The zero frequency and discarded Fourier tail allow an arbitrary contractive multiplier
   on each tuple, including separate ordinary ray characters. The endpoint application
   assumes the preprint's 7/8 theorem. -/
import AsymmetricRayFirst
import Submissions.sil_density_split_20261026.CubeFree.Second.ConcreteDiagAssembly

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
namespace ContinuumLocalReturn.AsymmetricRayDiagonal

open QRH.SilDensitySplit.CubeFree.FP
open Candidate.FourthPower
universe u
noncomputable section
open scoped Classical BigOperators SchwartzMap ContDiff
open OAI OAI.SevenEighths HeckeFamily CanonicalQuadraticSieve CompletedGauss
open QRH.Record1252270103KernelMass
open CenteredMomentAddedZeroUniform CenteredMomentSourceMass CenteredMomentSourceProfileMass
open CenteredMomentSupportedZeroEnergy CenteredMomentSourceZeroEnergy
open CenteredMomentSourceSecondZeroEnergy CenteredMomentSourceRow CenteredMomentHeckeColumnWindow
open CenteredMomentLattice CenteredMomentTwist CenteredMomentSecondDiagonal
open CenteredMomentFirstAmplificationChoice EisensteinSchwartzPoisson
open MixedPrincipalPair MixedPrincipalAllocations MixedPrincipalWindow
open MixedHeightEnergy MixedLiteralAllocation MixedCommonRestriction MixedCommonCoefficient
open MixedOriginalTail MixedOriginalNormCap MixedPoissonLocalization
open Filter CenteredMomentSupportedTailAggregate CenteredMomentFirstLocalization
open CenteredMomentSecondLocalization CenteredMomentSectorLocalization
open CenteredMomentSourceInputTailUniform (eventually_tail_threshold)
open MixedOriginalSecondZero MixedOriginalTailPower MixedLocalizedDictionary
open CenteredMomentSourceLiveColumn MixedInnerExceptionalLedger
local notation "O" => HeckeFamily.O
local notation "Id" => Ideal O
local instance {α : Type*} : DecidableEq (α⊕Fin 2) := Classical.decEq _
variable {ι : Type u} [Fintype ι] {a b : ℝ}

/-- The source retains both individual heights, the prime profiles and the seed. -/
def column (s : Source ι a b) (ha : 0<a) (seed : Id) (decor : Tuple ι → ℂ) : Id → ℂ :=
  AsymmetricRayLabel.rayColumn decor s.S s.H s.pool s.d s.hd s.R seed s.ν s.Wslot s.P
    (normPowerProfile s.W₁ a b ha s.hs₁ (s.W₁.smooth ⊤) s.t₁)
    (normPowerProfile s.W₂ a b ha s.hs₂ (s.W₂.smooth ⊤) s.t₂)
    b s.X₁ s.X₂ s.Y₁ s.Y₂

theorem column_at_root (s : Source ι a b) (ha : 0<a) (ω₁ ω₂ : Id →* ℂ) :
    column s ha 1 (AsymmetricRayColumn.rayWeight ω₁ ω₂) =
      AsymmetricRayFirst.aggregate s ha ω₁ ω₂ := rfl

omit [Fintype ι] in
theorem ray_contractive (ω₁ ω₂ : Id →* ℂ) (h₁ : ∀ I, ‖ω₁ I‖ ≤ 1)
    (h₂ : ∀ I, ‖ω₂ I‖ ≤ 1) (v : Tuple ι) : ‖AsymmetricRayColumn.rayWeight ω₁ ω₂ v‖ ≤ 1 := by
  rw [AsymmetricRayColumn.rayWeight, norm_mul]
  exact (mul_le_of_le_one_left (norm_nonneg _) (h₁ _)).trans (h₂ _)

private def term (s : Source ι a b) (ha : 0<a) (seed : Id) (decor : Tuple ι → ℂ) (v : Tuple ι) :=
  (decor v * tupleWeight (punctureProduct s.S s.H) v) *
    profileCoefficient s.R s.ν s.Wslot s.P
      (normPowerProfile s.W₁ a b ha s.hs₁ (s.W₁.smooth ⊤) s.t₁)
      (normPowerProfile s.W₂ a b ha s.hs₂ (s.W₂.smooth ⊤) s.t₂)
      s.X₁ s.X₂ s.Y₁ s.Y₂ s.d.1 s.d.2 seed v

private theorem term_bound (s : Source ι a b) (ha : 0<a) (seed : Id) (decor : Tuple ι → ℂ)
    (hd : ∀ v, ‖decor v‖ ≤ 1) (v : Tuple ι) : ‖term s ha seed decor v‖ ≤ profileCap s := by
  unfold term
  rw [mul_assoc, norm_mul]
  exact (mul_le_of_le_one_left (norm_nonneg _) (hd v)).trans (original_tuple_norm s ha seed v)

theorem column_seed (s : Source ι a b) (ha : 0<a) (seed I : Id) (decor : Tuple ι → ℂ)
    (hI : column s ha seed decor I ≠ 0) : seed ∣ I := by
  unfold column AsymmetricRayLabel.rayColumn at hI
  obtain ⟨v, _, hv, he⟩ := finiteColumnCoefficient_witness _ _ I hI
  rw [← he]
  by_contra h
  exact hv (by simp only [profileCoefficient, h, ite_false, mul_zero])

theorem column_cap (s : Source ι a b) (ha : 0<a) (seed I : Id) (decor : Tuple ι → ℂ)
    (hI : column s ha seed decor I≠0) :
    I≠0 ∧ (I.absNorm:ℝ)≤sourceNormCap s.P b s.T s.d := by
  let V₁ := normPowerProfile s.W₁ a b ha s.hs₁ (s.W₁.smooth ⊤) s.t₁
  let V₂ := normPowerProfile s.W₂ a b ha s.hs₂ (s.W₂.smooth ⊤) s.t₂
  have hs₁ : Function.support (V₁:ℝ→ℂ)⊆Set.Icc a b :=
    (normPowerProfile_support _ _ _ _ _ _ _).trans s.hs₁
  have hs₂ : Function.support (V₂:ℝ→ℂ)⊆Set.Icc a b :=
    (normPowerProfile_support _ _ _ _ _ _ _).trans s.hs₂
  have hz (i : ι) : s.Wslot i 0=0 := by
    by_contra hn
    have h := (s.hW i hn).1
    norm_num at h
  have hz₁ : V₁ 0=0 := by
    by_contra hn
    exact (not_le_of_gt ha) (hs₁ hn).1
  have hz₂ : V₂ 0=0 := by
    by_contra hn
    exact (not_le_of_gt ha) (hs₂ hn).1
  have h := weighted_profile_column_norm (Fintype.piFinset (tuplePools s))
    (fun v => decor v * tupleWeight (punctureProduct s.S s.H) v) s.R seed s.ν s.Wslot s.P (fun _=>(2:ℝ))
    V₁ V₂ b b s.X₁ s.X₂ s.Y₁ s.Y₂ s.d s.hd
    (fun i=>zero_lt_one.trans_le (s.hP i)) (s.hL.trans_le s.hX₁) (s.hL.trans_le s.hX₂)
    (s.hL.trans_le s.hY₁) (s.hL.trans_le s.hY₂) (s.hpX.trans s.hpY.symm) hz hz₁ hz₂
    (fun i x hx=>(s.hW i hx).2) (fun x hx=>(hs₁ hx).2) (fun x hx=>(hs₂ hx).2) I hI
  refine ⟨h.1,h.2.trans_eq ?_⟩
  unfold sourceNormCap
  rw [s.hpX,Finset.prod_mul_distrib]
  ring

theorem column_mass (s : Source ι a b) (ha : 0<a) (hb : 0≤b) (seed : Id)
    (decor : Tuple ι → ℂ) (hd : ∀ v, ‖decor v‖ ≤ 1) :
    (∑ I ∈ sourceColumns s, ‖column s ha seed decor I‖) ≤ massCap s := by
  calc
    _ ≤ ∑ v ∈ Fintype.piFinset (tuplePools s), ‖term s ha seed decor v‖ :=
      finiteColumnCoefficient_mass _ _
    _ ≤ ∑ _v ∈ Fintype.piFinset (tuplePools s), profileCap s :=
      Finset.sum_le_sum fun v _ => term_bound s ha seed decor hd v
    _ = ((Fintype.piFinset (tuplePools s)).card : ℝ) * profileCap s := by
      rw [Finset.sum_const, nsmul_eq_mul]
    _ ≤ poolCap s * profileCap s :=
      mul_le_mul_of_nonneg_right (source_pool_card s hb) (profileCap_nonneg s)
    _ = _ := mul_comm _ _

theorem column_bound (N : ℕ) (ε : ℝ) (hε : 0<ε) :
    ∃C : ℝ,0<C ∧ ∀(ι : Type u) [Fintype ι],∀a b : ℝ,∀s : Source ι a b,
      Fintype.card ι≤N→∀ha : 0<a,∀(decor : Tuple ι → ℂ), (∀ v, ‖decor v‖ ≤ 1) → ∀(seed I : Id)(Y : ℝ),
      I≠0→1≤Y→(I.absNorm:ℝ)≤Y→‖column s ha seed decor I‖≤C*profileCap s*Y^ε := by
  let δ := ε/(N+2:ℕ)
  have hδ : 0<δ := by dsimp only [δ];positivity
  have hδn : δ*(N+2:ℕ)=ε := by dsimp only [δ];push_cast;field_simp
  obtain ⟨D,hD,hd⟩ := IdealDivisorBound.ideal_divisor_small_power δ hδ
  refine ⟨(1+D)^(N+2),by positivity,?_⟩
  intro ι instι a b s hcard ha decor hdecor seed I Y hI hY hNI
  have hY0 : 0<Y := zero_lt_one.trans_le hY
  have hprofile : 0≤profileCap s := profileCap_nonneg s
  have hbase : 1≤(1+D)*Y^δ := by
    have hh := Real.one_le_rpow hY hδ.le
    nlinarith
  have hdiv : ((IdealMobiusDivisorSum.idealDivisors I).card:ℝ)≤(1+D)*Y^δ :=
    (hd I hI).trans (mul_le_mul (by linarith)
      (Real.rpow_le_rpow (Nat.cast_nonneg _) hNI hδ.le) (by positivity) (by positivity))
  have hp : ((1+D)*Y^δ)^(N+2)=(1+D)^(N+2)*Y^ε := by
    rw [mul_pow,←Real.rpow_mul_natCast hY0.le,hδn]
  have hf := finiteColumnCoefficient_norm_le (Fintype.piFinset (tuplePools s))
    (term s ha seed decor) (profileCap s) (profileCap_nonneg s)
    (fun v _ _=>term_bound s ha seed decor hdecor v) I hI
  change ‖column s ha seed decor I‖≤_ at hf
  calc
    _ ≤ profileCap s*((IdealMobiusDivisorSum.idealDivisors I).card:ℝ)^(Fintype.card ι+2) := hf
    _ ≤ profileCap s*((1+D)*Y^δ)^(Fintype.card ι+2) := by gcongr
    _ ≤ profileCap s*((1+D)*Y^δ)^(N+2) :=
      mul_le_mul_of_nonneg_left (pow_le_pow_right₀ hbase (by omega)) (profileCap_nonneg s)
    _ = _ := by rw [hp];ring

/-- In the second zero-frequency term every contributing column is divisible by the seed.
The divisor count gives one reciprocal of its full norm. -/
theorem seed_second_zero (N : ℕ) (ε : ℝ) (hε : 0<ε) :
    ∃C : ℝ,0<C ∧ ∀(ι : Type u) [Fintype ι],∀a b : ℝ,∀r : Source ι a b,
      Fintype.card ι≤N→∀ha : 0<a,∀(decor : Tuple ι → ℂ), (∀ v, ‖decor v‖ ≤ 1) →
      ∀seed : Id,seed≠0→∀(τ : Character)(t Y : ℝ),1≤Y→
      sourceNormCap r.P b r.T r.d≤Y→
      ‖sourceSecondZero (sourceColumns r) (column r ha seed decor) τ t‖≤
        C*(profileCap r)^2*Y^(1+ε)/(seed.absNorm:ℝ) := by
  obtain ⟨C0,hC0,hbound⟩ := column_bound N (ε/2) (half_pos hε)
  refine ⟨128*C0^2,by positivity,?_⟩
  intro ι instι a b r hcard ha decor hdecor seed hseed τ t Y hY hcap
  have hY0 : 0<Y := zero_lt_one.trans_le hY
  have hsize (I : Id) (_ : I∈supportedColumns (sourceColumns r))
      (hi : column r ha seed decor I≠0) : (I.absNorm:ℝ)≤Y :=
    (column_cap r ha seed I decor hi).2.trans hcap
  have hcoeff (I : Id) (hI : I∈supportedColumns (sourceColumns r))
      (hi : column r ha seed decor I≠0) :
      ‖column r ha seed decor I‖≤C0*profileCap r*Y^(ε/2) :=
    hbound ι a b r hcard ha decor hdecor seed I Y (column_cap r ha seed I decor hi).1 hY
      (hsize I hI hi)
  have hh := sourceSecondZero_divisor_bound (sourceColumns r) (column r ha seed decor)
    τ t (C0*profileCap r*Y^(ε/2)) Y
    (by have := profileCap_nonneg r;positivity) hY0.le seed hseed hcoeff
    (fun I _ hi=>column_seed r ha seed I decor hi) hsize
  have hp : (Y^(ε/2))^2*Y=Y^(1+ε) := by
    rw [←Real.rpow_mul_natCast hY0.le]
    norm_num only [Nat.cast_ofNat]
    rw [show ε/2*(2:ℝ)=ε by ring,Real.rpow_add hY0,Real.rpow_one]
    ring
  apply hh.trans_eq
  calc
    _=(128*C0^2)*(profileCap r)^2*((Y^(ε/2))^2*Y)/(seed.absNorm:ℝ) := by ring
    _=_ := by rw [hp]

theorem discarded_bound (Adec : ℕ) :
    ∃(control : Finset (ℕ×ℕ))(C : ℝ),0<C ∧
      ∀(ι : Type u) [Fintype ι],∀a b : ℝ,∀s : Source ι a b,∀ha : 0<a,0≤b→
      ∀(decor : Tuple ι → ℂ), (∀ v, ‖decor v‖ ≤ 1) → ∀(seed : Id)(η : Character)(t K W X H Tsec Z Csec ξ : ℝ),
      0<K→0<W→0<X→1<Z→1≤Csec→
      sourceNormCap s.P b s.T s.d≤Real.exp H*X→
      X^2/(16*K*W^4)≤Tsec→
      (2*H/Real.log Z+Real.log (4*Csec)/Real.log Z<ξ/4)→
      ‖localizedDensity Finset.univ (sourceGenerator (sourceColumns s))
        (sourceGenerator_supported (sourceColumns s))
        (fun I : supportedColumns (sourceColumns s)=>column s ha seed decor I*heightCoeff η t I)
        K W (discardedWeight (frequencyRadius Tsec Z ξ))‖≤
      ((massCap s)^2*(16*K*W^4)*(Real.exp H*X)^2*
        (C*control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile)/
        ((min 1 (kernelReference Tsec H))^2*(1+Z^(ξ/4))^Adec))/W := by
  obtain ⟨control,C,hC,htail⟩ := source_discarded_bound Adec
  refine ⟨control,C,hC,?_⟩
  intro ι instι a b s ha hb decor hdecor seed η t K W X H Tsec Z Csec ξ hK hW hX hZ hCs hcap hsec hthreshold
  have htail := htail η t (sourceColumns s) (column s ha seed decor)
    K W X H Tsec Z Csec ξ hK hW hX hZ hCs
    (fun I _ hI=>(column_cap s ha seed I decor hI).2.trans hcap) hsec hthreshold
  let F := (16*K*W^4)*(Real.exp H*X)^2*
    (C*control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile)/
    ((min 1 (kernelReference Tsec H))^2*(1+Z^(ξ/4))^Adec)/W
  have hF : 0≤F := by
    have := (show 0≤control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile from apply_nonneg _ _)
    have := zero_lt_one.trans hZ
    dsimp only [F]
    positivity
  have hmass := pow_le_pow_left₀
    (Finset.sum_nonneg (fun I _=>norm_nonneg (column s ha seed decor I)))
    (column_mass s ha hb seed decor hdecor) 2
  apply htail.trans
  calc
    _ = (∑I∈sourceColumns s,‖column s ha seed decor I‖)^2*F := by dsimp only [F];ring
    _ ≤ (massCap s)^2*F := mul_le_mul_of_nonneg_right hmass hF
    _ = _ := by dsimp only [F];ring

theorem tail_saving (B ξ saving : ℝ) (hB : 0≤B) (hξ : 0<ξ) :
    ∃(control : Finset (ℕ×ℕ))(C : ℝ),0<C ∧
      ∀ᶠZ : ℝ in atTop,1<Z ∧
      ∀(ι : Type u) [Fintype ι],∀a b : ℝ,∀s : Source ι a b,∀ha : 0<a,0≤b→
      ∀(decor : Tuple ι → ℂ), (∀ v, ‖decor v‖ ≤ 1) → ∀(seed : Id)(η : Character)(t K W X Tsec : ℝ),0<K→0<W→0<X→
      poolCap s≤Z^B→sourceNormCap s.P b s.T s.d≤X→
      X≤Z^B→K≤Z^B→W≤Z^B→W⁻¹≤Z^B→Tsec≤Z^B→X^2/(16*K*W^4)≤Tsec→
      ‖localizedDensity Finset.univ (sourceGenerator (sourceColumns s))
        (sourceGenerator_supported (sourceColumns s))
        (fun I : supportedColumns (sourceColumns s)=>column s ha seed decor I*heightCoeff η t I)
        K W (discardedWeight (frequencyRadius Tsec Z ξ))‖≤
      C*(profileCap s)^2*control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile*Z^(-saving) := by
  obtain ⟨Adec,hdecay⟩ := choose_fourth_tail_order B ξ saving hB hξ
  obtain ⟨control,Ctail,hCtail,htail⟩ := discarded_bound Adec
  refine ⟨control,64*Ctail,mul_pos (by norm_num) hCtail,?_⟩
  filter_upwards [eventually_tail_threshold 0 ξ hξ] with Z hZ
  refine ⟨hZ.1,?_⟩
  intro ι instι a b s ha hb decor hdecor seed η t K W X Tsec hK hW hX
    hmass hcap hXc hKc hWc hWic hTc hscale
  have hT : 0<Tsec := (div_pos (sq_pos_of_pos hX) (by positivity : 0<16*K*W^4)).trans_le hscale
  have ht := htail ι a b s ha hb decor hdecor seed η t K W X 0 Tsec Z 1 ξ
    hK hW hX hZ.1 le_rfl (by simpa using hcap) hscale (by simpa using hZ.2)
  have hbnd := hdecay Z (poolCap s) K W X Tsec hZ.1.le (poolCap_nonneg s)
    hK hW hX hT hmass hKc hWc hXc hTc hWic
  have hp : 0≤control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile := apply_nonneg _ _
  have hfactor : 0≤Ctail*(profileCap s)^2*control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile :=
    mul_nonneg (mul_nonneg hCtail.le (sq_nonneg _)) hp
  apply ht.trans
  calc
    _ = (Ctail*(profileCap s)^2*control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile)*
        ((poolCap s)^2*(16*K*W^4)*X^2*((min 1 (kernelReference Tsec 0))^2)⁻¹*
          ((1+Z^(ξ/4))^Adec)⁻¹/W) := by
      simp only [Real.exp_zero,one_mul,massCap,div_eq_mul_inv,mul_inv_rev,mul_pow]
      ring
    _ ≤ (Ctail*(profileCap s)^2*control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile)*
        (64*Z^(-saving)) := mul_le_mul_of_nonneg_left hbnd hfactor
    _ = _ := by ring

/-- At the selected Gauss scale the discarded frequencies have arbitrary polynomial decay.
The factor W comes from undoing the outer average. -/
theorem seed_tail (B ξ saving : ℝ) (hB : 0≤B) (hξ : 0<ξ) :
    ∃(control : Finset (ℕ×ℕ))(C : ℝ),0<C ∧
      ∀ᶠZ : ℝ in atTop,1<Z ∧
      ∀(ι : Type u) [Fintype ι],∀a b : ℝ,∀r : Source ι a b,∀ha : 0<a,0≤b→
      ∀(decor : Tuple ι → ℂ), (∀ v, ‖decor v‖ ≤ 1) → ∀(seed : Id)(η : Character)(t K W X Tsec : ℝ),0<K→0<W→0<X→
      poolCap r≤Z^B→sourceNormCap r.P b r.T r.d≤X→
      X≤Z^B→K≤Z^B→W≤Z^B→W⁻¹≤Z^B→Tsec≤Z^B→X^2/(16*K*W^4)≤Tsec→
      ‖secondDiscardedEnergy η t (sourceColumns r) (column r ha seed decor) ballProfile
        (16*K*W^4) Tsec Z ξ‖≤
      W*(C*(profileCap r)^2*control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile*Z^(-saving)) := by
  obtain ⟨control,C,hC,hZ⟩ := tail_saving.{u} B ξ saving hB hξ
  refine ⟨control,C,hC,?_⟩
  filter_upwards [hZ] with Z hZ
  refine ⟨hZ.1,?_⟩
  intro ι instι a b r ha hb decor hdecor seed η t K W X Tsec hK hW hX hpool hcap hXc hKc hWc hWic hTc hscale
  have h := hZ.2 ι a b r ha hb decor hdecor seed η t K W X Tsec hK hW hX hpool hcap hXc hKc hWc hWic hTc hscale
  rw [source_discarded η t (sourceColumns r) (column r ha seed decor) K W Tsec Z ξ hW,
    norm_div, Complex.norm_real, Real.norm_of_nonneg hW.le] at h
  have := (div_le_iff₀ hW).mp h
  linarith [mul_comm W (C*(profileCap r)^2*control.sup (schwartzSeminormFamily ℝ ℝ ℂ) ballProfile*
    Z^(-saving))]

end
end ContinuumLocalReturn.AsymmetricRayDiagonal
#print axioms ContinuumLocalReturn.AsymmetricRayDiagonal.column_at_root
#print axioms ContinuumLocalReturn.AsymmetricRayDiagonal.seed_second_zero
#print axioms ContinuumLocalReturn.AsymmetricRayDiagonal.seed_tail
