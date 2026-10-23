-- Expected to FAIL: both examples are false or unprovable; see evidence/negative-controls.log.
import QRHResearch
open QRHResearch.BranchAlgebra
-- Negative control 1: claiming a structured saving changes the column branch must fail.
example (r z m : ℝ) : 2 * Minit r z m 0 0 + (0 + 0) + 2 * z0 z 0 < 2 * Finit r z 0 0 ↔
    r + (5/3) * z < m := by
  rw [column_branch_iff]; constructor <;> intro h <;> linarith
-- Negative control 2: a weaker geometric floor is not provable from wrong data.
example (θ : ℝ) (h : 11 / 3 - 4 * θ < 1 / 5) : 7 / 8 < θ := by linarith
