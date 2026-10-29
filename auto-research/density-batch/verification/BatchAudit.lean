import Candidate.Main

set_option autoImplicit false
namespace QRHDensityBatchAudit

-- Canonical all-moduli Dirichlet target, with only the exact bound changed.
theorem canonical_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (436972583 / 500000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ hs hpole

-- The strongest endpoint also proves each earlier, weaker boundary.
theorem stage1_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (873945927 / 1000000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- The strongest endpoint also proves each earlier, weaker boundary.
theorem stage2_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (436972827 / 500000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

-- The strongest endpoint also proves each earlier, weaker boundary.
theorem stage3_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (436972809 / 500000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ (lt_trans (by norm_num) hs) hpole

#print axioms Candidate.bound
#print axioms canonical_bound
#print axioms QRH.DensityBatch.final_source
#print axioms QRH.DensityBatch.physical_source
#print axioms QRH.DensityBatch.Return.beta_le_theta_of_sources
#print axioms stage1_bound
#print axioms stage2_bound
#print axioms stage3_bound
#print axioms QRH.DensityBatch.Density.ds_low_aux
end QRHDensityBatchAudit
