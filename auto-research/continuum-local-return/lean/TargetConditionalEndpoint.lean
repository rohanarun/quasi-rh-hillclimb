/- Local source count as a conditional all-moduli endpoint. Adapted from
   Joseph Bebel's #143 ExactEndpoint and earlier Collet/Sil return, Apache-2.0. -/
import CutoffTransfer
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.PositiveSourceClosure
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.ExactCountScheme
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.ContactSource
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.PositiveSource
import Candidate.Local.Qrh.TwoSlot.AnchorZeroLoss.SourceClosure
import Candidate.Local.Qrh.TwoSlot.AnchorExtension.Library.PositiveGap.BestEndpoint

set_option autoImplicit false
set_option maxHeartbeats 1800000
namespace ContinuumLocalReturn.ConditionalEndpoint
noncomputable section
open Set Qrh.TwoSlot.AnchorZeroLoss QRH.Record1252270103Return
open Qrh.TwoSlot.AnchorContinuum Qrh.TwoSlot.AnchorContinuum.PositiveTransport
open Qrh.TwoSlot.AnchorZeroLoss.Affine.Return
open QRH.Record12518109Source QRH.Record12518109Existence
open OAI OAI.SevenEighths HeckeFamily
open QRH.PositiveGap.Return.Tuning (uniform_restrict source_restricts_count source_restricts_physical)
open NonfloorSchedule (t s fee)
local instance : ImprovedCountScheme Contact.exactLine := Contact.exactScheme

def original : List Branch := ImprovedCount.admittedBranches (line := Contact.exactLine)
def sourceWindow : ImprovedWindow Contact.exactLine Contact.exactScheme.naturalκ := ExactWindow.window
theorem covers : PhysicalBranch.Covers sourceWindow :=
  PhysicalBranch.covers_of_source_edges _ rfl rfl rfl
def extra : Branch := PhysicalBranch.savedBranch sourceWindow covers

/-- One early mesh supplies both native windows, including the low window. -/
private theorem count_mesh
    (hC : UniformUnitFaceSource QRH.PositiveGap.Return.countGlobal) (hP : UniformUnitFaceSource QRH.PositiveGap.Return.physicalGlobal)
    (ε : ℝ) (hε : 0 < ε) : ∃ mesh : ℝ, 0 < mesh ∧
      ∀ w ∈ Contact.exactScheme.windows, UnitFaceSource w.face mesh ε := by
  obtain ⟨mesh,hm,hc,hp⟩ := QRH.PositiveGap.Return.selected_sources_common_mesh hC hP hε
  refine ⟨mesh,hm,?_⟩
  intro w hw
  obtain ⟨v,hv,rfl⟩ := List.mem_map.mp hw
  change UnitFaceSource (QRH.PositiveGap.Return.countingSource v.branch) mesh ε
  apply unit_source_restrict (QRH.PositiveGap.Return.supplier_restricts_counting v.branch v.nonold)
  cases v.branch <;> first | exact (v.nonold rfl).elim | exact hc | exact hp

variable (H : ℝ) (hH : H ∈ TargetGeometry.cutoffCorridor)

private def padding : ℝ := Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Transport.rowExtension
private theorem pad_bounds : 0 < padding ∧ padding ≤ s := by
  norm_num [padding,s,Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Transport.rowExtension]

def inputs := @SavedInput Contact.exactLine
  (TargetGeometry.targetParameters t H TargetGeometry.proposed_mem hH) Contact.exactScheme sourceWindow

/-- The five finite geometric edge inequalities and the localized arithmetic
    count are the only additional premises beyond the preprint input chain. -/
theorem beta_le_target (he : NonfloorSchedule.EdgeBounds H original extra) (hi : inputs H hH) :
    HeckeZeroSupremum.beta ≤ t := by
  let : Geometry.Parameters := TargetGeometry.targetParameters t H TargetGeometry.proposed_mem hH
  let : BoundsCore := TargetGeometry.targetCoarse t H TargetGeometry.proposed_mem hH
  by_contra hn
  have hgap : t < HeckeZeroSupremum.beta := lt_of_not_ge hn
  have hβ : (51/100:ℝ) ≤ HeckeZeroSupremum.beta := (by norm_num [t] : (51/100:ℝ)≤t).trans hgap.le
  have hgeom : Geometry.h = H := TargetGeometry.target_h t H TargetGeometry.proposed_mem hH
  have inc : 2*t-1 ≤ Contact.exactScheme.naturalκ := by
    change 2*t-1 ≤ QRH.PositiveGap.Return.naturalK/6
    norm_num [t,QRH.PositiveGap.Return.naturalK]
  have hs : 0 < s := by norm_num [s]
  have hsmax : s ≤ (1/1000000000:ℝ) := by norm_num [s]
  have hf : 0 < fee := by norm_num [fee]
  let S : Schedule (line := Contact.exactLine) := {
    window := sourceWindow
    windowCovers := covers
    savedInput := hi
    cost := s
    extension := padding
    extension_guard := pad_bounds.2
    seam_after_switch := by rw [hgeom]; exact (NonfloorSchedule.conductor_guards hH).1
    fee := fee
    cost_pos := hs
    cost_small := hsmax
    extension_pos := pad_bounds.1
    extension_small := pad_bounds.2.trans hsmax
    fee_pos := hf
    y_before_switch := by linarith [BoundsCore.ly_coarse.2]
    switch_before_twoy := by linarith [BoundsCore.ly_coarse.1]
    prime_supply := by
      have hplus : 0 < Geometry.h+padding := by linarith [BoundsCore.h_interval.1,pad_bounds.1]
      apply (lt_div_iff₀ hplus).mpr
      linarith [BoundsCore.ell_interval.1,BoundsCore.h_interval.2,pad_bounds.2.trans hsmax]
    incumbent := inc
    old_rows := by
      intro D δ p hD hd hp
      exact NonfloorSchedule.old_row_at hH he hD hd hp
    new_rows := by
      intro D δ p hD hd hp
      rw [hgeom] at hD ⊢
      exact NonfloorSchedule.new_row_at hH he ⟨hD.1,hD.2.trans (add_le_add_right pad_bounds.2 H)⟩ hd hp }
  have hG := Qrh.PositiveGap.return_source hβ
  have hC : UniformUnitFaceSource QRH.PositiveGap.Return.countGlobal :=
    uniform_restrict source_restricts_count hG
  have hP : UniformUnitFaceSource QRH.PositiveGap.Return.physicalGlobal :=
    uniform_restrict source_restricts_physical hG
  have hcap : 2*HeckeZeroSupremum.beta-1 ≤ Contact.exactScheme.naturalκ :=
    QRH.PositiveGap.Return.Tuning.natural_cap_return
  obtain ⟨A,_,_,hpad,_,hlabel,himp,hphysical⟩ :=
    exists_initial_sources_with_costs (PositiveSource.physicalFace s) hcap
      (count_mesh hC hP) (PositiveSource.physical_source hs hsmax hβ)
      (Contact.exact_fiber_moments hβ) hgap pad_bounds.1 hf (show (0:ℝ) < 1 by norm_num)
  let B : BufferedData (line := Contact.exactLine) := {
    toChosenData := A, padding_budget := hpad,
    padding_small := by change padding/2 ≤ padding; linarith [pad_bounds.1] }
  exact (not_le_of_gt hgap) (PositiveTransport.beta_le_theta_of_initial_source
    (line := Contact.exactLine) (fun _ => ⟨B,hlabel,himp,hphysical⟩))

/-- All positive moduli, conditional on the same physical arithmetic count. -/
theorem bound (he : CutoffTransfer.StrongEdges original extra) (hi : inputs H hH)
    {q : ℕ} [NeZero q] (χ : _root_.DirichletCharacter ℂ q) {z : ℂ}
    (hz : t < z.re) (hp : ¬(χ=1 ∧ z=1)) : _root_.DirichletCharacter.LFunction χ z ≠ 0 :=
  Cycle25.dirichlet_of_hecke (by norm_num [t])
    (fun η z hz hp => HeckeZeroSupremum.LFunction_ne_zero_of_beta_lt η
      ((beta_le_target H hH (CutoffTransfer.at_stationary_height hH he) hi).trans_lt hz) hp)
    χ z hz hp

end
end ContinuumLocalReturn.ConditionalEndpoint
#print axioms ContinuumLocalReturn.ConditionalEndpoint.beta_le_target
#print axioms ContinuumLocalReturn.ConditionalEndpoint.bound
