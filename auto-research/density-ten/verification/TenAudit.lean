import Candidate.Main

set_option autoImplicit false
namespace QRHDensityTenAudit

theorem canonical_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (2731076077/3125000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ hs hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage1_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (17478902521/20000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage2_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (436972497/500000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage3_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (87394498959/100000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage4_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (87394494041/100000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage5_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (43697231383/50000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage6_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (87394441941/100000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage7_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (87394435183/100000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage8_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (8739443501/10000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- This is a weaker-bound corollary of the final endpoint.
theorem stage9_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (21848608627/25000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

#print axioms Candidate.bound
#print axioms canonical_bound
#print axioms QRH.DensityTen.final_source
#print axioms QRH.DensityTen.physical_source
#print axioms QRH.DensityTen.Return.beta_le_theta_of_sources
#print axioms stage1_bound
#print axioms stage2_bound
#print axioms stage3_bound
#print axioms stage4_bound
#print axioms stage5_bound
#print axioms stage6_bound
#print axioms stage7_bound
#print axioms stage8_bound
#print axioms stage9_bound
#print axioms QRH.DensityTen.Density.ds_low_aux
#print axioms QRH.DensityTen.Bridge.Return.GenericPhysical.Assembly.exists_compatible_data
#print axioms QRH.DensityTen.Bridge.Return.GenericPhysical.Assembly.exists_compatible_data_with_mesh
end QRHDensityTenAudit
