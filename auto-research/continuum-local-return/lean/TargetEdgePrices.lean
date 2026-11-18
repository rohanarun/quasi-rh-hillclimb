/- Connect the rational Bernstein prices to the real scalar row in the
   conductor-dependent nonfloor return. Built on tracker #143 (Apache-2.0). -/
import TargetEdgePolynomials
import TargetNonfloorSchedule
set_option autoImplicit false
namespace ContinuumLocalReturn.TargetEdges
noncomputable section
open QRH.ArviReturnTuning
open ContinuumLocalReturn.NonfloorSchedule (scalarRow)

theorem scalar_from_margin {e : Edge} {b : Bound} {d p E : ℝ}
    (hm : 0 < Q2.ev (margin e b) d p) (hj : 0 < Q2.ev (J b) d p)
    (he : E ≤ Q2.ev (N b) d p / Q2.ev (J b) d p) :
    scalarRow (conductor:ℝ) (e.D:ℝ) (e.cap:ℝ) d p E ≤
      NonfloorSchedule.t-(reserve:ℝ) := by
  have hD : (0:ℝ) ≤ (e.D:ℝ) := by
    cases e <;> norm_num [Edge.D,conductor,cost]
  have hbase : Q2.ev (base e) d p + 3*(e.D:ℝ)*E/4 =
      scalarRow (conductor:ℝ) (e.D:ℝ) (e.cap:ℝ) d p E := by
    simp only [base,Q2.ev_add,Q2.ev_C,Q2.ev_smul,Q2.ev_mul,Q2.ev_X,Q2.ev_Y,
      scalarRow,NonfloorSchedule.Y,NonfloorSchedule.ell,NonfloorSchedule.t,
      yLength,length,target]
    push_cast
    ring
  have hmul := mul_le_mul_of_nonneg_left ((le_div_iff₀ hj).mp he)
    (mul_nonneg (by norm_num : (0:ℝ) ≤ 3/4) hD)
  have ht : (target:ℝ) = NonfloorSchedule.t := by norm_num [target,NonfloorSchedule.t]
  simp only [margin,Q2.ev_sub,Q2.ev_mul,Q2.ev_C,Q2.ev_smul] at hm
  push_cast at hm
  -- Only the count moment can change sides here; the cleared denominator is positive.
  rw [←hbase]
  apply (mul_le_mul_iff_left₀ hj).mp
  rw [←ht]
  nlinarith only [hm,hmul]

end
end ContinuumLocalReturn.TargetEdges
#print axioms ContinuumLocalReturn.TargetEdges.scalar_from_margin
