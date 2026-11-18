/- Conditional endpoint below tracker #143, at its stationary conductor cutoff.
   The sole new analytic premise is the saved count for actual source classes. -/
import TargetConditionalEndpoint
import TargetPhysicalEdges

set_option autoImplicit false
namespace ContinuumLocalReturn.TargetReturn
noncomputable section
open Qrh.TwoSlot.AnchorContinuum.Contact

theorem cutoff_mem : stationaryCutoff ∈ TargetGeometry.cutoffCorridor :=
  ⟨Precision.cutoff_bounds.1.le, Precision.cutoff_bounds.2.le⟩

/-- The extra count is required on the full, unmasked physical amplitude class.
    Its exact conductor, density, amplitude, height and loss ranges are in DynamicSource.SavedCount. -/
abbrev SavedClassCount : Prop :=
  (17466917/20000000 : ℝ) < OAI.SevenEighths.HeckeZeroSupremum.beta →
    ConditionalEndpoint.inputs stationaryCutoff cutoff_mem

/-- With the local count saving, the Hecke zero supremum is at most the proposed rational target. -/
theorem hecke_beta (hc : SavedClassCount) :
    OAI.SevenEighths.HeckeZeroSupremum.beta ≤ (17466917/20000000 : ℝ) := by
  by_contra hn
  exact hn (ConditionalEndpoint.beta_le_target stationaryCutoff cutoff_mem
    TargetEdges.stationary_edges (hc (lt_of_not_ge hn)))

/-- All positive Dirichlet moduli, with the principal pole excluded. -/
theorem dirichlet (hc : SavedClassCount) {q : ℕ} [NeZero q]
    (χ : DirichletCharacter ℂ q) {z : ℂ} (hz : (17466917/20000000 : ℝ) < z.re)
    (hp : ¬ (χ = 1 ∧ z = 1)) : DirichletCharacter.LFunction χ z ≠ 0 := by
  exact _root_.Cycle25.dirichlet_of_hecke (by norm_num)
    (fun η z hz hp => OAI.SevenEighths.HeckeZeroSupremum.LFunction_ne_zero_of_beta_lt η
      ((hecke_beta hc).trans_lt hz) hp) χ z hz hp

end
end ContinuumLocalReturn.TargetReturn
#print axioms ContinuumLocalReturn.TargetReturn.hecke_beta
#print axioms ContinuumLocalReturn.TargetReturn.dirichlet
