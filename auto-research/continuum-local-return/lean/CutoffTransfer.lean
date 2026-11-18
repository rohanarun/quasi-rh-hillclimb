/- Finite-edge transport inside the exact #143 cutoff enclosure. -/
import TargetNonfloorSchedule

set_option autoImplicit false
set_option maxHeartbeats 500000
namespace ContinuumLocalReturn.CutoffTransfer
noncomputable section
open Set QRH.Record1252270103Return NonfloorSchedule

def H0 : ℝ := 815324504/1000000000
def tol : ℝ := 1/1000000000
def edgeD (H : ℝ) : Fin 5 → ℝ := ![1/200,19/25,19/25,seam H,top H]
def edgeCap (H : ℝ) : Fin 5 → ℝ := ![(1/200)/(6*K),(2*Y H-19/25)/(6*K),
  (3/40)*(19/25),faceCap H (seam H),faceCap H (top H)]
def edgeBs (bs : List Branch) (b : Branch) (i : Fin 5) := if i=4 then b::bs else bs

def StrongRow (D C : ℝ) (bs : List Branch) : Prop := ∀ (δ p : ℝ),
  δ ∈ Icc (0:ℝ) (3/4) → p ∈ Icc (0:ℝ) (1/2) →
  scalarRow H0 D C δ p (envelope bs K δ p) ≤ t-1/100000000
structure StrongEdges (bs : List Branch) (b : Branch) : Prop where
  oldLeft : StrongRow (1/200) ((1/200)/(6*K)) bs
  oldRight : StrongRow (19/25) ((2*Y H0-19/25)/(6*K)) bs
  newLeft : StrongRow (19/25) ((3/40)*(19/25)) bs
  newSeam : StrongRow (seam H0) (faceCap H0 (seam H0)) bs
  savedTop : StrongRow (top H0) (faceCap H0 (top H0)) (b::bs)

private theorem strong_at {bs : List Branch} {b : Branch} (e : StrongEdges bs b) (i : Fin 5) :
    StrongRow (edgeD H0 i) (edgeCap H0 i) (edgeBs bs b i) := by
  fin_cases i
  · exact e.oldLeft
  · exact e.oldRight
  · exact e.newLeft
  · exact e.newSeam
  · exact e.savedTop

private theorem edge_guards {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor) (i : Fin 5) :
    0 ≤ edgeD H i ∧ 0 ≤ edgeCap H i ∧ edgeD H i-edgeD H0 i ≤ tol ∧
    -tol ≤ edgeD H i-edgeD H0 i ∧ edgeCap H0 i-edgeCap H i ≤ 2*tol ∧
    (edgeD H i=edgeD H0 i ∨ (3/4:ℝ) ≤ edgeD H0 i ∧ edgeD H0 i ≤ 1 ∧ edgeCap H0 i ≤ 1) := by
  have hl := hH.1
  have hu := hH.2
  fin_cases i <;> norm_num [edgeD,edgeCap,H0,tol,seam,top,faceCap,Y,ell,t,s,K] <;>
    repeat' first | constructor | linarith

private theorem price_guard {H δ p : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor)
    (hδ : δ ∈ Icc (0:ℝ) (3/4)) (hp : p ∈ Icc (0:ℝ) (1/2)) (i : Fin 5) (E : ℝ)
    (hrow : scalarRow H0 (edgeD H0 i) (edgeCap H0 i) δ p E ≤ t-1/100000000) :
    scalarRow H (edgeD H i) (edgeCap H i) δ p E ≤ t-fee := by
  obtain ⟨hD,hC,hdU,hdL,hCU,hcases⟩ := edge_guards hH i
  have hb0 := hH.1
  have hδp0 := mul_nonneg hδ.1 hp.1
  have hδp1 : δ*p ≤ 1 := (mul_le_mul hδ.2 hp.2 hp.1 (by norm_num)).trans (by norm_num)
  have hδp : δ*p ≤ 3/8 := (mul_le_mul hδ.2 hp.2 hp.1 (by norm_num)).trans (by norm_num)
  have he0 : 0 < ell := by norm_num [ell,t]
  rcases le_or_gt E 0 with hneg|hpos
  · have hDE := mul_nonpos_of_nonneg_of_nonpos hD hneg
    have hCδ := mul_nonneg hδp0 hC
    have hfactor := mul_le_mul_of_nonneg_right hδp he0.le
    unfold scalarRow Y at *
    dsimp [fee,t,ell] at *
    nlinarith only [hDE,hCδ,hfactor,hδ.2,hD,hb0]
  · have hpδ := mul_le_mul_of_nonneg_right hCU hδp0
    have hCapDiff : δ*p*(edgeCap H0 i-edgeCap H i) ≤ 2*tol := by
      nlinarith only [hpδ,mul_le_mul_of_nonneg_right hδp1 (show 0 ≤ 2*tol by norm_num [tol])]
    have hEDiff : E*(edgeD H i-edgeD H0 i) ≤ 2*tol := by
      rcases hcases with hEq|⟨hd0,hd1,hc1⟩
      · rw [hEq,sub_self,mul_zero]
        norm_num [tol]
      · have hhC := mul_le_mul_of_nonneg_left hc1 hδp0
        have hDE := mul_le_mul_of_nonneg_right hd0 hpos.le
        have hpE := mul_nonneg hδp0 he0.le
        have hE : E ≤ 2 := by
          unfold scalarRow Y at hrow
          dsimp [H0,t,ell] at hrow hpE
          dsimp only [H0] at hDE hhC hd1
          nlinarith only [hrow,hhC,hδp,hDE,hd1,hδ.1,hpE]
        have hh := mul_le_mul_of_nonneg_left hdU hpos.le
        nlinarith only [hh,mul_le_mul_of_nonneg_right hE (show 0 ≤ tol by norm_num [tol])]
    unfold scalarRow Y at hrow ⊢
    dsimp [fee,tol,t,H0] at *
    nlinarith only [hrow,hCapDiff,hEDiff,hdL,hb0]

theorem at_stationary_height {H : ℝ} (hH : H ∈ TargetGeometry.cutoffCorridor)
    {bs : List Branch} {b : Branch} (e : StrongEdges bs b) : EdgeBounds H bs b := by
  have allRows (i : Fin 5) : RowBound H (edgeD H i) (edgeCap H i) (edgeBs bs b i) := by
    intro δ p hd hp
    exact price_guard hH hd hp i _ (strong_at e i δ p hd hp)
  exact ⟨allRows 0,allRows 1,allRows 2,allRows 3,allRows 4⟩

end
end ContinuumLocalReturn.CutoffTransfer
#print axioms ContinuumLocalReturn.CutoffTransfer.at_stationary_height
