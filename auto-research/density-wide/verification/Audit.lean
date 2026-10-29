import Candidate.Main

set_option autoImplicit false
namespace QRHDensityWideAudit

-- Canonical all-moduli Dirichlet target, with only the exact bound changed.
theorem canonical_bound {q : ℕ} [NeZero q]
    (χ : _root_.DirichletCharacter ℂ q) {s : ℂ}
    (hs : (1747893 / 2000000 : ℝ) < s.re)
    (hpole : ¬ (χ = 1 ∧ s = 1)) :
    _root_.DirichletCharacter.LFunction χ s ≠ 0 :=
  Candidate.bound χ hs hpole

#print axioms Candidate.bound
#print axioms canonical_bound
#print axioms QRH.DensityWide.final_source
#print axioms QRH.DensityWide.physical_source
#print axioms QRH.DensityWide.Return.beta_le_theta_of_sources
end QRHDensityWideAudit
