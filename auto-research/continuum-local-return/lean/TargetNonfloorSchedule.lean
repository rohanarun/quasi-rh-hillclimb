/- Target nonfloor geometry and conductor-dependent finite-envelope schedule.
   Built on #143 (Joseph Bebel, Sil and Hailey Collet, Apache-2.0). -/
import TargetGeometry
import LocalPhysicalBranch
import Candidate.Local.Qrh.TwoSlot.AnchorZeroLoss.ConductorInterpolation
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.PositiveFeedback

set_option autoImplicit false
namespace ContinuumLocalReturn.NonfloorSchedule
noncomputable section
open Set QRH.Record1252270103Return
open Qrh.TwoSlot.AnchorZeroLoss
open Qrh.TwoSlot.AnchorZeroLoss.Affine Qrh.TwoSlot.AnchorZeroLoss.Affine.Return
open Qrh.JointDetector.BoundaryPhysical.Return.GenericArithmetic (rowAt oldCapacityAt)
open ContinuumLocalReturn.PhysicalBranch

def t : ℝ := 17466917/20000000
def ell : ℝ := 11/3-4*t
def Y (H : ℝ) : ℝ := H-2*ell
def K : ℝ := 2*t-1
def s : ℝ := 1/10000000000
def fee : ℝ := 1/2000000000
def seam (H : ℝ) : ℝ := H-1/100000
def top (H : ℝ) : ℝ := H+s

def scalarRow (H D cap δ p E : ℝ) : ℝ :=
  1/2+13*H/75-Y H/2-ell/2-9*D/100+δ/2+δ*p*(ell-cap/2)+3*D*E/4

def oldCap (H D : ℝ) : ℝ := min D (2*Y H-D)/(6*K)
def faceCap (H D : ℝ) : ℝ := (2*Y H-(1+s)*D)/(2+10*s)
def newCap (H D : ℝ) : ℝ := min ((3/40)*D) (faceCap H D)

def RowBound (H D cap : ℝ) (bs : List Branch) : Prop :=
  ∀ (δ p : ℝ), δ ∈ Icc (0:ℝ) (3/4) → p ∈ Icc (0:ℝ) (1/2) →
    scalarRow H D cap δ p (envelope bs K δ p) ≤ t-fee

/-- Five explicit edge rows. The old envelope pays the lower seam. -/
structure EdgeBounds (H : ℝ) (bs : List Branch) (b : Branch) : Prop where
  oldLeft : RowBound H (1/200) ((1/200)/(6*K)) bs
  oldRight : RowBound H (19/25) ((2*Y H-19/25)/(6*K)) bs
  newLeft : RowBound H (19/25) ((3/40)*(19/25)) bs
  newSeam : RowBound H (seam H) (faceCap H (seam H)) bs
  savedTop : RowBound H (top H) (faceCap H (top H)) (b::bs)

/-- Outside the top conductor strip only the inherited branch list is used. -/
def branchesAt (H D : ℝ) (bs : List Branch) (b : Branch) : List Branch :=
  if seam H ≤ D then b::bs else bs

def capacityAt (H D : ℝ) : ℝ := if D ≤ 19/25 then oldCap H D else newCap H D

private theorem row_cons_le {H D cap : ℝ} {bs : List Branch} {b : Branch}
    (hD : 0 ≤ D) (h : RowBound H D cap bs) : RowBound H D cap (b::bs) := by
  intro δ p hδ hp
  have he : envelope (b::bs) K δ p ≤ envelope bs K δ p := by
    change QRH.Record12518109Return.finiteEnvelope _ (b::bs) _ _ _ ≤ _
    rw [QRH.Record12518109Return.finiteEnvelope]
    split
    · exact min_le_right _ _
    · exact le_rfl
  have hh := h δ p hδ hp
  unfold scalarRow at *
  nlinarith only [hh,mul_nonneg hD (sub_nonneg.mpr he)]

private theorem interval {H left right D a b c e : ℝ} {bs : List Branch}
    (hD : D ∈ Icc left right)
    (hleft : RowBound H left (min (a+b*left) (c+e*left)) bs)
    (hright : RowBound H right (min (a+b*right) (c+e*right)) bs) :
    RowBound H D (min (a+b*D) (c+e*D)) bs := by
  intro δ p hδ hp
  let E := envelope bs K δ p
  apply min_capacity_interval (fun x w => scalarRow H x w δ p E)
    (fun x => a+b*x) (fun x => c+e*x) hD
  · intro x i j hij
    unfold scalarRow
    nlinarith only [mul_nonneg (mul_nonneg hδ.1 hp.1) (sub_nonneg.mpr hij)]
  · refine ⟨scalarRow H 0 a δ p E, -9/100-δ*p*b/2+3*E/4,?_⟩
    intro x
    unfold scalarRow
    ring
  · refine ⟨scalarRow H 0 c δ p E, -9/100-δ*p*e/2+3*E/4,?_⟩
    intro x
    unfold scalarRow
    ring
  · exact hleft δ p hδ hp
  · exact hright δ p hδ hp

private theorem old_affine (H D : ℝ) : oldCap H D =
    min (0+(1/(6*K))*D) (2*Y H/(6*K)+(-1/(6*K))*D) := by
  dsimp only [oldCap]
  rw [←min_div_div_right (show 0 ≤ 6*K by norm_num [K,t])]
  congr 1 <;> ring

private theorem new_affine (H D : ℝ) : newCap H D =
    min (0+(3/40)*D) (2*Y H/(2+10*s)+(-(1+s)/(2+10*s))*D) := by
  unfold newCap faceCap
  congr 1 <;> ring

private theorem cap_guards {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor) :
    oldCap H (1/200) = (1/200)/(6*K) ∧
    oldCap H (19/25) = (2*Y H-19/25)/(6*K) ∧
    newCap H (19/25) = (3/40)*(19/25) ∧
    newCap H (seam H) = faceCap H (seam H) ∧
    newCap H (top H) = faceCap H (top H) := by
  have h0 := hH.1
  have h1 := hH.2
  unfold oldCap newCap
  have guard1 : (1/200:ℝ) ≤ 2*Y H-1/200 := by dsimp [Y,ell,t]; linarith
  have guard2 : 2*Y H-19/25 ≤ (19/25:ℝ) := by dsimp [Y,ell,t]; linarith
  have guard3 : (3/40:ℝ)*(19/25) ≤ faceCap H (19/25) := by
    unfold faceCap Y ell t s
    norm_num
    linarith
  have guard4 : faceCap H (seam H) ≤ (3/40)*seam H := by
    unfold faceCap Y ell t s seam
    norm_num
    linarith
  have guard5 : faceCap H (top H) ≤ (3/40)*top H := by
    unfold faceCap Y ell t top s
    norm_num
    linarith
  rw [min_eq_left guard1,min_eq_right guard2,min_eq_left guard3,min_eq_right guard4,
    min_eq_right guard5]
  exact ⟨rfl,rfl,rfl,rfl,rfl⟩

theorem conductor_guards {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor) :
    (19/25:ℝ) < seam H ∧ seam H ≤ top H ∧ top H < 1 ∧ top H ≤ 2*Y H := by
  have ha := hH.1
  have hb := hH.2
  dsimp [seam,top,s,Y,ell,t]
  constructor <;> first | linarith | constructor <;> first | linarith | constructor <;> linarith

/-- The five edge witnesses pay every nonfloor conductor, with the saved branch
    used only on its own strip. This includes the positive physical source cost. -/
theorem nonfloor_rows {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor)
    {bs : List Branch} {b : Branch} (edges : EdgeBounds H bs b)
    {D : ℝ} (hD : D ∈ Icc (1/200:ℝ) (top H)) :
    RowBound H D (capacityAt H D) (branchesAt H D bs b) := by
  obtain ⟨hc0,hc1,hc2,hc3,hc4⟩ := cap_guards hH
  have hs := conductor_guards hH
  by_cases hlow : D ≤ 19/25
  · rw [capacityAt,ite_eq_left hlow,branchesAt,ite_eq_right (not_le.mpr (hlow.trans_lt hs.1)),old_affine]
    apply interval ⟨hD.1,hlow⟩
    · rw [←old_affine,hc0]
      exact edges.oldLeft
    · rw [←old_affine,hc1]
      exact edges.oldRight
  · rw [capacityAt,ite_eq_right hlow,new_affine,branchesAt]
    by_cases hstrip : seam H ≤ D
    · rw [ite_eq_left hstrip]
      apply interval ⟨hstrip,hD.2⟩
      · rw [←new_affine,hc3]
        exact row_cons_le (by linarith [hs.1] : 0 ≤ seam H) edges.newSeam
      · rw [←new_affine,hc4]
        exact edges.savedTop
    · rw [ite_eq_right hstrip]
      apply interval ⟨le_of_not_ge hlow,le_of_not_ge hstrip⟩
      · rw [←new_affine,hc2]
        exact edges.newLeft
      · rw [←new_affine,hc3]
        exact edges.newSeam

/-- Collet's actual row expression at the target geometry and any branch list. -/
theorem row_eq {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor)
    (bs : List Branch) (D cap δ p : ℝ) :
    @rowAt (TargetGeometry.targetParameters t H TargetGeometry.proposed_mem hH)
      bs K D cap δ p = scalarRow H D cap δ p (envelope bs K δ p) := by
  change 1/2+13*(1+ell-(1+ell-H))/75-Y H/2-ell/2-9*D/100+δ/2+δ*p*(ell-cap/2)+
    3*D*envelope bs K δ p/4 = _
  unfold scalarRow
  ring

/-- The target's full nonfloor geometric return, in the original physical API. -/
theorem physical_nonfloor_rows {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor)
    {bs : List Branch} {b : Branch} (edges : EdgeBounds H bs b)
    {D δ p : ℝ} (hD : D ∈ Icc (1/200:ℝ) (top H))
    (hδ : δ ∈ Icc (0:ℝ) (3/4)) (hp : p ∈ Icc (0:ℝ) (1/2)) :
    @rowAt (TargetGeometry.targetParameters t H TargetGeometry.proposed_mem hH)
      (branchesAt H D bs b) (2*t-1) D (capacityAt H D) δ p ≤ t-fee := by
  rw [show 2*t-1 = K from rfl,row_eq]
  exact nonfloor_rows hH edges hD δ p hδ hp

/-- Both sides of the physical switch are available at the switch itself. -/
theorem old_row_at {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor)
    {bs : List Branch} {b : Branch} (edges : EdgeBounds H bs b)
    {D δ p : ℝ} (hD : D ∈ Icc (1/200:ℝ) (19/25))
    (hδ : δ ∈ Icc (0:ℝ) (3/4)) (hp : p ∈ Icc (0:ℝ) (1/2)) :
    @rowAt (TargetGeometry.targetParameters t H TargetGeometry.proposed_mem hH)
      bs (2*t-1) D (oldCap H D) δ p ≤ t-fee := by
  have hs := conductor_guards hH
  have hh := physical_nonfloor_rows hH edges (D := D) ⟨hD.1, hD.2.trans (hs.1.le.trans hs.2.1)⟩ hδ hp
  simpa only [branchesAt,ite_eq_right (not_le.mpr (hD.2.trans_lt hs.1)),capacityAt,
    ite_eq_left hD.2] using hh

theorem new_row_at {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor)
    {bs : List Branch} {b : Branch} (edges : EdgeBounds H bs b)
    {D δ p : ℝ} (hD : D ∈ Icc (19/25:ℝ) (top H))
    (hδ : δ ∈ Icc (0:ℝ) (3/4)) (hp : p ∈ Icc (0:ℝ) (1/2)) :
    @rowAt (TargetGeometry.targetParameters t H TargetGeometry.proposed_mem hH)
      (branchesAt H D bs b) (2*t-1) D (newCap H D) δ p ≤ t-fee := by
  rcases hD.1.eq_or_lt with he|hl
  · subst D
    have hs := (conductor_guards hH).1
    have hcap := (cap_guards hH).2.2.1
    rw [branchesAt,ite_eq_right (not_le.mpr hs),hcap,show 2*t-1=K from rfl,row_eq]
    exact edges.newLeft δ p hδ hp
  · have hh := physical_nonfloor_rows hH edges (D := D) ⟨(by linarith),hD.2⟩ hδ hp
    simpa only [capacityAt,ite_eq_right (not_le.mpr hl)] using hh

end
end ContinuumLocalReturn.NonfloorSchedule
#print axioms ContinuumLocalReturn.NonfloorSchedule.physical_nonfloor_rows
