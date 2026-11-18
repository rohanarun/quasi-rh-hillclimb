/- Adapted from the Cycle25 physical coefficient packet originally contributed by
akashlevy (tracker revision 2fd60c0926b66ea18d7436f5ed55250fd006ab5d), Apache-2.0,
as integrated by Hailey Collet. Row-only dilation and shortening added with
OpenAI Codex assistance. See accompanying source and replay note. -/
import Submissions.hailey_collet_1252270103.Cycle25.Numerator.Imported.NumeratorPhysicalPacketMass
import Submissions.hailey_collet_1252270103.Cycle25.Numerator.Imported.NumeratorReflectionData

/-! A row-only coefficient dilation can be enlarged using a radical deficit.
The marked physical coefficient bound keeps the full sum over error labels. -/
noncomputable section
set_option autoImplicit false
set_option maxHeartbeats 1600000
open scoped BigOperators NNReal Classical
namespace QRH.RadicalPhysical
open OAI OAI.SevenEighths ProbeHighRowFamily ProbeEuler HeckeFamily ProbePhysical HeckeInverseAmplification
open CanonicalQuadraticSieve ProbeRowRadicalConductor Cycle25.Weighted.Numerator
local notation "O" => HeckeFamily.O
variable {ι : Type} [Fintype ι] [DecidableEq ι]

/-- Uniform in every error-label tuple, row, finite exclusion set and height. -/
theorem label_mass_with_dilation (epsilon : ℝ) (hepsilon : 0 < epsilon) :
    ∃ C : ℝ, 0 < C ∧ ∀ (S : Finset (Ideal O)) (hS : SourceExclusions S)
      (firsteps : ℝ) (_hfirst : FirstTail firsteps S) (η : Character) (u : FreeRow)
      (T : ι → Finset ProbePhysical.PrimeIdeal) (hT : ∀ i P, P ∈ T i → P.val ∉ S)
      (_hdis : ∀ P : ∀ i, T i, Function.Injective (fun i => (P i).val))
      (_hη : ∀ i P, P ∈ T i → IsCoprime P.val η.modulus)
      (weight : ∀ i, T i → ℂ) (x z : ℂ) (alpha eps rho L : ℝ),
      (51 / 100 : ℝ) ≤ alpha → alpha ≤ 1 → 0 < eps → eps ≤ 1 / 1000 →
      x.re = alpha + 16 * eps → z.re = 17 / 50 → 0 ≤ rho → rho ≤ 1 →
      1 - alpha - 6 * eps ≤ 1 / 2 - rho → -(1 / 100 : ℝ) ≤ 1 / 2 - rho →
      1 + firsteps ≤ x.re + (1 / 2 - rho) →
      0 ≤ L → (∀ P : ∀ i, T i, L * errorProductDeficit u (labelPrimes T P) ≤ 1) →
      Summable (fun e : LabelPacketIndex S u T => ‖labelPacketCoefficient S hS η u T hT weight x z e‖ *
        (labelPacketScale S u T e : ℝ)^(-(1 / 2 : ℝ)) * max 1 (L*(labelPacketScale S u T e : ℝ))^rho) ∧
      (∑' e : LabelPacketIndex S u T, ‖labelPacketCoefficient S hS η u T hT weight x z e‖ *
        (labelPacketScale S u T e : ℝ)^(-(1 / 2 : ℝ)) * max 1 (L*(labelPacketScale S u T e : ℝ))^rho) ≤
        (C * ((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^epsilon) *
          ∏ i, ∑ P : T i, 2880 * ‖weight i P‖ * errorSize u P.val := by
  obtain ⟨C,hC,hpref⟩ := coefficient_prefactor_subpower epsilon hepsilon
  refine ⟨C,hC,?_⟩
  intro S hS firsteps hfirst η u T hT hdis hη weight x z alpha eps rho L
    halpha halpha1 heps heps1 hx hz hrho hrho1 hline hleft hmargin hL hcap
  let M := C * ((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^epsilon
  have hpacket (P : ∀ i, T i) :
      Summable (fun e : ErrorPacketIndex S u (labelPrimes T P) =>
        ‖errorPacketCoefficient S hS η u (labelPrimes T P) (labelSupported S hS T hT P) x z e‖ *
        (errorPacketScale S u (labelPrimes T P) e : ℝ)^(-(1 / 2 : ℝ)) *
        max 1 (L * (errorPacketScale S u (labelPrimes T P) e : ℝ))^rho) ∧
      (∑' e : ErrorPacketIndex S u (labelPrimes T P),
        ‖errorPacketCoefficient S hS η u (labelPrimes T P) (labelSupported S hS T hT P) x z e‖ *
        (errorPacketScale S u (labelPrimes T P) e : ℝ)^(-(1 / 2 : ℝ)) *
        max 1 (L * (errorPacketScale S u (labelPrimes T P) e : ℝ))^rho) ≤
        M * errorProductSize u (labelPrimes T P) := by
    have hηP : ∀ Q ∈ labelPrimes T P, IsCoprime Q.val η.modulus := by
      intro Q hQ
      obtain ⟨i,hi,rfl⟩ := Finset.mem_image.mp hQ
      exact hη i _ (P i).property
    have hQP : ∀ Q ∈ labelPrimes T P, (4 : ℝ) ≤ Q.val.absNorm := by
      intro Q hQ
      obtain ⟨i,hi,rfl⟩ := Finset.mem_image.mp hQ
      exact_mod_cast hS.tail.norm_four _ (hT i _ (P i).property)
    obtain ⟨hs,hm⟩ := error_packet_damped_mass S hS firsteps hfirst η u (labelPrimes T P)
      (labelSupported S hS T hT P) hηP x z alpha eps rho L hQP halpha halpha1 heps heps1 hx hz
      hrho hrho1 hline hleft hmargin hL (hcap P)
    refine ⟨hs,hm.trans ?_⟩
    have hp := mul_le_mul_of_nonneg_right (hpref (markExclusions S (labelPrimes T P)) u)
      (errorProductSize_nonneg u (labelPrimes T P))
    simpa only [mul_assoc,M] using hp
  have hh := finite_label_damped_mass
    (fun P => errorPacketCoefficient S hS η u (labelPrimes T P) (labelSupported S hS T hT P) x z)
    (fun P e => (errorPacketScale S u (labelPrimes T P) e : ℝ))
    (fun P e => lt_of_lt_of_le zero_lt_one (by exact_mod_cast errorPacketScale_one_le S u (labelPrimes T P) e))
    (fun P => ∏ i, weight i (P i)) (fun P => errorProductSize u (labelPrimes T P)) L rho M
    (fun P => (hpacket P).1) (fun P => (hpacket P).2)
  refine ⟨hh.1,?_⟩
  change _ ≤ M * _
  exact hh.2.trans_eq (congrArg (fun t : ℝ => M*t) (error_label_mass_factor u T hdis weight))


/-- The physical prime weights with the same arbitrary row-only dilation. -/
theorem physical_mass_with_dilation (epsilon c d B : ℝ)
    (hepsilon : 0 < epsilon) (hc : 0 < c) (hd : 0 < d) (hB : 0 ≤ B) :
    ∃ C : ℝ, 0 < C ∧ ∀ (S : Finset (Ideal O)) (hS : SourceExclusions S)
      (firsteps : ℝ) (_hfirst : FirstTail firsteps S) (η : Character) (u : FreeRow)
      (T : ι → Finset ProbePhysical.PrimeIdeal) (hT : ∀ i P, P ∈ T i → P.val ∉ S)
      (_hdis : ∀ P : ∀ i, T i, Function.Injective (fun i => (P i).val))
      (_hη : ∀ i P, P ∈ T i → IsCoprime P.val η.modulus)
      (W : ι → ℝ → ℂ) (Y : ι → ℝ),
      (∀ i, 1 ≤ Y i) → (∀ i, Function.support (W i) ⊆ Set.Icc c d) →
      (∀ i y, ‖W i y‖ ≤ B) → ∀ (x z : ℂ) (alpha eps rho L : ℝ),
      (51 / 100 : ℝ) ≤ alpha → alpha ≤ 1 → 0 < eps → eps ≤ 1 / 1000 →
      x.re = alpha + 16 * eps → z.re = 17 / 50 → 0 ≤ rho → rho ≤ 1 →
      1 - alpha - 6 * eps ≤ 1 / 2 - rho → -(1 / 100 : ℝ) ≤ 1 / 2 - rho →
      1 + firsteps ≤ x.re + (1 / 2 - rho) →
      0 ≤ L → (∀ P : ∀ i, T i, L * errorProductDeficit u (labelPrimes T P) ≤ 1) →
      let weight : ∀ i, T i → ℂ := fun i P => physicalSlotWeight P.val (W i) (Y i) z
      Summable (fun e : LabelPacketIndex S u T => ‖labelPacketCoefficient S hS η u T hT weight x z e‖ *
        (labelPacketScale S u T e : ℝ)^(-(1 / 2 : ℝ)) * max 1 (L*(labelPacketScale S u T e : ℝ))^rho) ∧
      (∑' e : LabelPacketIndex S u T, ‖labelPacketCoefficient S hS η u T hT weight x z e‖ *
        (labelPacketScale S u T e : ℝ)^(-(1 / 2 : ℝ)) * max 1 (L*(labelPacketScale S u T e : ℝ))^rho) ≤
        C * ((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^epsilon * ∏ i, (Y i)^(-(4 / 25 : ℝ)) := by
  obtain ⟨C1,hC1,hmass⟩ := label_mass_with_dilation (ι:=ι) (epsilon/2) (by linarith)
  obtain ⟨C2,hC2,hprime⟩ := error_label_prime_product_bound (epsilon/2) c d B (Fintype.card ι)
    (by linarith) hc hd hB
  refine ⟨C1*C2,mul_pos hC1 hC2,?_⟩
  intro S hS firsteps hfirst η u T hT hdis hη W Y hY hWS hWB x z alpha eps rho L
    halpha halpha1 heps heps1 hx hz hrho hrho1 hline hleft hmargin hL hcap
  let weight : ∀ i, T i → ℂ := fun i P => physicalSlotWeight P.val (W i) (Y i) z
  obtain ⟨hs,hm⟩ := hmass S hS firsteps hfirst η u T hT hdis hη weight x z alpha eps rho L
    halpha halpha1 heps heps1 hx hz hrho hrho1 hline hleft hmargin hL hcap
  refine ⟨hs,hm.trans ?_⟩
  have hp := hprime ι le_rfl u T Y W hY hWS hWB z hz
  change (∏ i, ∑ P : T i, 2880*‖weight i P‖*errorSize u P.val) ≤ _ at hp
  have hNu : (0 : ℝ) < (Ideal.span {u.val} : Ideal O).absNorm := by
    exact_mod_cast Nat.pos_of_ne_zero (Ideal.absNorm_eq_zero_iff.not.mpr
      (Ideal.span_singleton_eq_bot.not.mpr u.property.1))
  calc
    _ ≤ (C1*((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^(epsilon/2)) *
        (C2*((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^(epsilon/2) * ∏ i, (Y i)^(-(4 / 25 : ℝ))) :=
      mul_le_mul_of_nonneg_left hp (by positivity)
    _ = _ := by
      rw [show (C1*((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^(epsilon/2)) *
          (C2*((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^(epsilon/2) * ∏ i, (Y i)^(-(4 / 25 : ℝ))) =
          (C1*C2)*((((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^(epsilon/2))*
          (((Ideal.span {u.val} : Ideal O).absNorm : ℝ)^(epsilon/2))) * ∏ i, (Y i)^(-(4 / 25 : ℝ)) by ring]
      rw [←Real.rpow_add hNu,show epsilon/2+epsilon/2=epsilon by ring]


omit [DecidableEq ι] in
/-- Distinct annular error labels charge at most one prime norm per slot. -/
theorem error_deficit_le_slot_product (u : FreeRow)
    (T : ι → Finset ProbePhysical.PrimeIdeal) (P : ∀ i, T i)
    (hdistinct : Function.Injective (fun i => (P i).val))
    (Y : ι → ℝ) (hY : ∀ i, 1 ≤ Y i)
    (hprime : ∀ i, ((P i).val.val.absNorm : ℝ) ≤ 2 * Y i) :
    errorProductDeficit u (labelPrimes T P) ≤ ∏ i, 2 * Y i := by
  calc
    _ = ∏ Q ∈ labelPrimes T P, (repeatedDeficit u Q : ℝ) := Finset.prod_coe_sort _ _
    _ = ∏ i, (repeatedDeficit u (P i).val : ℝ) := Finset.prod_image hdistinct.injOn
    _ ≤ _ := by
      apply Finset.prod_le_prod₀ (fun _ _ => NNReal.coe_nonneg _)
      intro i hi
      unfold repeatedDeficit
      split_ifs
      · simpa only [primeScale, NNReal.coe_natCast] using hprime i
      · simp only [NNReal.coe_one]
        linarith [hY i]

omit [DecidableEq ι] in
/-- The radical assumption pays for both the enlarged row-only dilation
and every repeated error label before the coefficient series is summed. -/
theorem radial_dilation_admissible {S : Finset (Ideal O)} {u : FreeRow}
    {hS : ∀ P ∈ S, Prime P} (data : PhysicalReflectionData S hS u)
    {U c b : ℝ} (hU : 1 < U)
    (hrad : ((Ideal.span {u.val} : Ideal O).radical.absNorm : ℝ) ≤ U^(1-c))
    (T : ι → Finset ProbePhysical.PrimeIdeal) (width : ι → ℝ)
    (hw : ∀ i, 0 ≤ width i)
    (hreserve : ∑ i, width i ≤ c/2) (hb : b ≤ c/3)
    (hslots : (2 : ℝ)^Fintype.card ι ≤ U^(c/6))
    (hdis : ∀ P : ∀ i, T i, Function.Injective (fun i => (P i).val))
    (hprime : ∀ i, ∀ P ∈ T i, (P.val.absNorm : ℝ) ≤ 2 * U^(width i)) :
    let L := data.combinedConductor / ((fixedConductorConstant S : ℝ)*U^(1-b))
    0 ≤ L ∧ ∀ P : ∀ i, T i, L * errorProductDeficit u (labelPrimes T P) ≤ 1 := by
  have hU0 : 0 < U := zero_lt_one.trans hU
  have hC : (0 : ℝ) < fixedConductorConstant S := by
    exact_mod_cast fixedConductorConstant_pos S hS
  have hden : 0 < (fixedConductorConstant S : ℝ)*U^(1-b) := by positivity
  refine ⟨div_nonneg data.combined_pos.le hden.le, ?_⟩
  intro P
  have he := error_deficit_le_slot_product u T P (hdis P) (fun i => U^(width i))
    (fun i => Real.one_le_rpow hU.le (hw i)) (fun i => hprime i _ (P i).property)
  rw [Finset.prod_mul_distrib, Finset.prod_const, Finset.card_univ,
    ←Real.rpow_sum_of_pos hU0] at he
  have hdef := he.trans (mul_le_mul_of_nonneg_right hslots (Real.rpow_nonneg hU0.le _))
  rw [←Real.rpow_add hU0] at hdef
  have hc := data.combined_le_radical.trans (mul_le_mul_of_nonneg_left hrad hC.le)
  change data.combinedConductor / _ * _ ≤ 1
  rw [div_mul_eq_mul_div, div_le_one hden]
  have hpos := (errorProductDeficit_one_le u (labelPrimes T P)).trans' zero_le_one
  calc
    _ ≤ ((fixedConductorConstant S : ℝ)*U^(1-c))*U^(c/6+∑ i, width i) :=
      mul_le_mul hc hdef hpos (by positivity)
    _ = (fixedConductorConstant S : ℝ)*U^((1-c)+(c/6+∑ i, width i)) := by
      rw [mul_assoc, ←Real.rpow_add hU0]
    _ ≤ _ := mul_le_mul_of_nonneg_left (Real.rpow_le_rpow_of_exponent_le hU.le
      (by linarith)) hC.le

/-- One large-scale threshold absorbs every fixed error-label choice. -/
theorem eventually_slot_factor (n : ℕ) {c : ℝ} (hc : 0 < c) :
    ∀ᶠ U : ℝ in Filter.atTop, (2 : ℝ)^n ≤ U^(c/6) :=
  (tendsto_rpow_atTop (by positivity : (0 : ℝ) < c/6)).eventually
    (Filter.eventually_ge_atTop _)

/-- Every active dilation bin transfers the same gain to the reflected
length, including bins whose raw coefficient scale is large. -/
theorem shortened_scale {Cu C U b v mu N : ℝ}
    (hC : 0 < C) (hU : 0 < U) (hN : 0 < N)
    (hbin : max 1 (Cu / (C * U^(1-b)) * N) ≤ U^v) :
    Cu ≤ C * U^(1-b-mu+v) * (U^mu / N) := by
  have hden : 0 < C * U^(1-b) := by positivity
  have hcalc := (le_max_right 1 _).trans hbin
  rw [div_mul_eq_mul_div, div_le_iff₀ hden] at hcalc
  rw [←mul_div_assoc, le_div_iff₀ hN]
  convert hcalc using 1
  rw [mul_assoc, ←Real.rpow_add hU, show 1-b-mu+v+mu = v+(1-b) by ring,
    Real.rpow_add hU]
  ring

end QRH.RadicalPhysical
#print axioms QRH.RadicalPhysical.label_mass_with_dilation
#print axioms QRH.RadicalPhysical.physical_mass_with_dilation
#print axioms QRH.RadicalPhysical.error_deficit_le_slot_product
#print axioms QRH.RadicalPhysical.radial_dilation_admissible
#print axioms QRH.RadicalPhysical.eventually_slot_factor
#print axioms QRH.RadicalPhysical.shortened_scale
