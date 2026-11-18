/- Exact count and capacity prices on the five conductor edges of the local
   return, conditional downstream on the saved arithmetic count on actual rows. -/
import TargetEdgeCover
import TargetEdgePrices
import CutoffTransfer
import TargetEnvelopeBounds
set_option autoImplicit false
namespace ContinuumLocalReturn.TargetEdges
noncomputable section
open Set
open ContinuumLocalReturn.NonfloorSchedule
open QRH.ArviReturnTuning

theorem priced_edge (e : Edge) {d p : ℝ}
    (hd : d ∈ Icc (0:ℝ) (3/4)) (hp : p ∈ Icc (0:ℝ) (1/2)) :
    scalarRow (conductor:ℝ) (e.D:ℝ) (e.cap:ℝ) d p
        (QRH.Record1252270103Return.envelope (branches e) (kappa:ℝ) d p) ≤
      NonfloorSchedule.t-(reserve:ℝ) := by
  obtain ⟨b,ha,hm⟩ := five_polynomial_edges e hd hp
  exact scalar_from_margin hm (den_pos b hd hp) (envelope_le_ratio hd hp ha)

open CutoffTransfer

/-- Feed the five native prices into the conductor interpolation at the rational reference height. -/
theorem strong_edges : StrongEdges inheritedBranches extraBranch := by
  constructor <;> intro d p hd hp
  case' oldLeft => have hh := priced_edge .oldLeft hd hp
  case' oldRight => have hh := priced_edge .oldRight hd hp
  case' newLeft => have hh := priced_edge .newLeft hd hp
  case' newSeam => have hh := priced_edge .seam hd hp
  case' savedTop => have hh := priced_edge .top hd hp
  all_goals
    norm_num [branches,Edge.cap,Edge.D,conductor,cost,yLength,length,target,kappa,
      reserve,H0,K,t,Y,ell,faceCap,top,seam,s] at hh ⊢
    exact hh

open Qrh.TwoSlot.AnchorContinuum.Contact

/-- Five checked edges at #143's actual stationary cutoff, with the saved count confined to the upper edge. -/
theorem stationary_edges : EdgeBounds stationaryCutoff inheritedBranches extraBranch :=
  at_stationary_height ⟨Precision.cutoff_bounds.1.le,Precision.cutoff_bounds.2.le⟩ strong_edges

end
end ContinuumLocalReturn.TargetEdges
#print axioms ContinuumLocalReturn.TargetEdges.priced_edge
#print axioms ContinuumLocalReturn.TargetEdges.strong_edges
#print axioms ContinuumLocalReturn.TargetEdges.stationary_edges
