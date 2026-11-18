/- Five-edge scalar branch comparisons for the conditional local return.
   Old/native evaluations adapted from Joseph Bebel's tracker #143 ReturnCount
   and ExactCountTransport, using Collet's and Sil's admitted windows (Apache-2.0). -/
import TargetEdgePolynomials
import LocalPhysicalBranch
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.ExactCountScheme
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.ParameterPrecision
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.ReturnCount

set_option autoImplicit false
set_option maxHeartbeats 4000000
set_option maxRecDepth 100000
namespace ContinuumLocalReturn.TargetEdges
noncomputable section
open Set QRH.ArviReturnTuning QRH.ArviReturnTuning.Q2
open Qrh.TwoSlot.AnchorContinuum Qrh.TwoSlot.AnchorContinuum.Contact
open Qrh.TwoSlot.AnchorZeroLoss
open QRH.Record12518109Return (Branch finiteEnvelope)
open QRH.Record1252270103Return (envelope)
open Affine.Return
local instance : ImprovedCountScheme exactLine := exactScheme

def inheritedBranches : List Branch := @ImprovedCount.admittedBranches exactLine exactScheme

def extraBranch : Branch :=
  PhysicalBranch.savedBranch (line := exactLine) ExactWindow.window
    (PhysicalBranch.covers_of_source_edges ExactWindow.window rfl rfl rfl)

def branches (e : Edge) : List Branch :=
  if e = .top then extraBranch :: inheritedBranches else inheritedBranches

private theorem denominator_checked (b : Bound) : bernCheck (J b) 0 (3/4) 0 (1/2) = true := by
  cases b <;> decide +kernel

theorem den_pos (b : Bound) {d p : ℝ}
    (hd : d ∈ Icc (0:ℝ) (3/4)) (hp : p ∈ Icc (0:ℝ) (1/2)) :
    0 < Q2.ev (J b) d p :=
  bernCheck_sound _ _ _ _ _ (denominator_checked b) (by simpa using hd.1)
    (by simpa using hd.2) (by simpa using hp.1) (by simpa using hp.2)

private def oldDr (p : ℝ) : ℝ := 3-p-2*p/(3*(kappa:ℝ))
private def oldCr (p : ℝ) : ℝ := 2*(1-p)*(1-p/(3*(kappa:ℝ)))
private def oldJr (d p : ℝ) : ℝ := (5/6-d)*oldDr p+d*oldCr p
private def oldNr (d p : ℝ) : ℝ := (1-d)*oldJr d p+d*oldCr p*(5/6-d)/2

private theorem ev_oldD (d p : ℝ) : Q2.ev oldD d p = oldDr p := by
  simp only [oldD,ev_sub,ev_smul,ev_C,ev_Y]
  push_cast
  unfold oldDr
  ring

private theorem ev_oldC (d p : ℝ) : Q2.ev oldC d p = oldCr p := by
  simp only [oldC,ev_mul,ev_sub,ev_smul,ev_C,ev_Y]
  push_cast
  unfold oldCr
  ring

private theorem ev_oldJ (d p : ℝ) : Q2.ev oldJ d p = oldJr d p := by
  simp only [oldJ,V,ev_add,ev_mul,ev_X,ev_sub,ev_C,ev_oldD,ev_oldC]
  push_cast
  rfl

private theorem ev_oldN (d p : ℝ) : Q2.ev oldN d p = oldNr d p := by
  simp only [oldN,V,ev_add,ev_mul,ev_sub,ev_smul,ev_C,ev_X,ev_oldJ,ev_oldC]
  push_cast
  unfold oldNr
  ring

private theorem old_count {d p : ℝ}
    (hd : d ∈ Icc (0:ℝ) (3/4)) (hp : p ∈ Icc (0:ℝ) (1/2)) :
    QRH.Record12518109Return.countingR (kappa:ℝ) d p =
      Q2.ev (N .old) d p / Q2.ev (J .old) d p := by
  have hk : (7/10:ℝ) ≤ (kappa:ℝ) := by norm_num [kappa,target]
  have hD : 0 < oldDr p := by
    norm_num [oldDr,kappa,target]
    nlinarith [hp.2]
  have hJ : 0 < oldJr d p := by
    simpa only [J,ev_oldJ] using den_pos .old hd hp
  simp only [N,J,ev_oldN,ev_oldJ]
  unfold QRH.Record12518109Return.countingR QRH.Record12518109Return.rowDen
  rw [QRH.Record12518109Return.canonical_counting_formula hk]
  change 1-d+d*(oldCr p/oldDr p)*(5/6-d)/
    (2*((5/6-d)+d*(oldCr p/oldDr p))) = oldNr d p/oldJr d p
  have he : (5/6-d)+d*(oldCr p/oldDr p) = oldJr d p/oldDr p := by
    unfold oldJr
    field_simp [hD.ne']
  rw [he]
  unfold oldNr
  field_simp [hD.ne',hJ.ne']

private theorem all_le_inherited (e : Edge) (d p : ℝ) :
    envelope (branches e) (kappa:ℝ) d p ≤
      ImprovedCount.envelope (line:=exactLine) (kappa:ℝ) d p := by
  classical
  by_cases h : e = .top
  · subst e
    change finiteEnvelope _ (extraBranch :: inheritedBranches) _ _ _ ≤ finiteEnvelope _ inheritedBranches _ _ _
    rw [finiteEnvelope]
    split
    · exact min_le_right _ _
    · exact le_rfl
  · simp only [branches,ite_eq_right h]
    rfl

private theorem inherited_le_native (w : QRH.PositiveGap.ReturnTuning.WinQ)
    (hw : w ∈ RationalReturn.nativeQ) (hb : w.branch = .C) {d p : ℝ}
    (hd : d ∈ Icc (w.dlo:ℝ) w.dhi) (hp : p ∈ Icc (w.plo:ℝ) (1/2)) :
    ImprovedCount.envelope (line:=exactLine) (kappa:ℝ) d p ≤
      QRH.PositiveGap.Return.branchCount .C d p := by
  let v := QRH.PositiveGap.ReturnTuning.mkWindow 0 w
    (QRH.PositiveGap.ReturnTuning.ok_of_mem RationalReturn.native_ok hw)
  have hm : QRH.PositiveGap.Return.Tuning.ReturnCountWindow.toAdmitted v ∈ exactScheme.windows :=
    List.mem_map.mpr ⟨v,QRH.PositiveGap.ReturnTuning.mkWindow_mem RationalReturn.native_ok hw,rfl⟩
  have ha : (QRH.PositiveGap.Return.Tuning.ReturnCountWindow.toAdmitted v).Available d p := ⟨hd,hp⟩
  have hh := ImprovedCount.envelope_le_window (line:=exactLine)
    (S:=exactScheme) hm (κ:=(kappa:ℝ)) ha
  change ImprovedCount.envelope (line:=exactLine) (kappa:ℝ) d p ≤ QRH.PositiveGap.Return.branchCount w.branch d p at hh
  simpa only [hb] using hh

private theorem ev_mU (d p : ℝ) : Q2.ev markedU d p = 1-(1+6*(g0:ℝ)-4*(g1:ℝ))*p := by
  simp only [markedU,ev_sub,ev_C,ev_smul,ev_Y]
  push_cast
  ring

private theorem ev_mJ (d p : ℝ) : Q2.ev markedJ d p =
    3*(5/6-d)+2*d*(1-(1+2*(g1:ℝ))*p) := by
  simp only [markedJ,V,markedK,ev_add,ev_smul,ev_mul,ev_sub,ev_C,ev_X,ev_Y]
  push_cast
  ring

private theorem ev_mN (d p : ℝ) : Q2.ev markedN d p =
    (1-d)*Q2.ev markedJ d p+(5/6-d)*d*Q2.ev markedU d p := by
  simp only [markedN,V,ev_add,ev_mul,ev_sub,ev_C,ev_X]
  push_cast
  ring

private theorem marked_ratio_bound {d p : ℝ} (hd : d ∈ Icc (189/512:ℝ) (15/32))
    (hp : p ∈ Icc (15/32:ℝ) (1/2)) :
    ExactWindow.valueI d p ≤ Q2.ev markedN d p/Q2.ev markedJ d p := by
  have hD : d ∈ Icc (0:ℝ) (3/4) := ⟨by linarith [hd.1],by linarith [hd.2]⟩
  have hP : p ∈ Icc (0:ℝ) (1/2) := ⟨by linarith [hp.1],hp.2⟩
  have hQ : 0<Q2.ev markedJ d p := den_pos .marked hD hP
  have hZ := ExactWindow.hJ hd hp
  have h0 : (g0:ℝ) ≤ exactLine.g0 := by
    norm_num [g0,exactLine]; exact Precision.coefficients.1
  have h1 : exactLine.g1 ≤ (g1:ℝ) := by
    norm_num [g1,exactLine]; exact Precision.coefficients.2.2.2
  have hUp : 0 ≤ Q2.ev markedU d p := by
    rw [ev_mU]
    norm_num [g0,g1]
    linarith [hp.2]
  have hUU : ExactWindow.UI p ≤ Q2.ev markedU d p := by
    rw [ev_mU]
    unfold ExactWindow.UI
    nlinarith only [mul_nonneg hP.1 (sub_nonneg.mpr h0),mul_nonneg hP.1 (sub_nonneg.mpr h1)]
  have hk : 1-(1+2*(g1:ℝ))*p ≤ ExactWindow.kI p := by
    unfold ExactWindow.kI
    nlinarith only [mul_nonneg hP.1 (sub_nonneg.mpr h1)]
  have hJJ : Q2.ev markedJ d p ≤ ExactWindow.JI d p := by
    rw [ev_mJ]
    unfold ExactWindow.JI
    nlinarith only [mul_nonneg hD.1 (sub_nonneg.mpr hk)]
  have hr := div_le_div₀ hUp hUU hQ hJJ
  have hm := mul_le_mul_of_nonneg_left hr (mul_nonneg (show 0≤(5/6:ℝ)-d by linarith [hd.2]) hD.1)
  rw [ExactWindow.valueI_ratio hZ.ne',ev_mN]
  calc
    1-d+(5/6-d)*d*(ExactWindow.UI p/ExactWindow.JI d p) ≤
        1-d+(5/6-d)*d*(Q2.ev markedU d p/Q2.ev markedJ d p) := by linarith only [hm]
    _ = ((1-d)*Q2.ev markedJ d p+(5/6-d)*d*Q2.ev markedU d p)/Q2.ev markedJ d p := by
      field_simp [hQ.ne']

theorem envelope_le_ratio {e : Edge} {b : Bound} {d p : ℝ}
    (hd : d ∈ Icc (0:ℝ) (3/4)) (hp : p ∈ Icc (0:ℝ) (1/2))
    (h : allowed e b d p) :
    envelope (branches e) (kappa:ℝ) d p ≤ Q2.ev (N b) d p / Q2.ev (J b) d p := by
  have common := all_le_inherited e d p
  cases b with
  | old => exact common.trans ((ImprovedCount.envelope_le_base (line:=exactLine)
      (S:=exactScheme) (kappa:ℝ) d p).trans_eq (old_count hd hp))
  | native =>
    change d ∈ Icc (15/64:ℝ) (9/16) ∧ p ∈ Icc (9/32:ℝ) (1/2) at h
    have hx := inherited_le_native ⟨.C,15/64,9/16,9/32⟩ (by simp [RationalReturn.nativeQ]) rfl (d:=d) (p:=p)
      (by simpa using h.1) (by simpa using h.2)
    exact (common.trans hx).trans_eq (RationalReturn.ReturnQ.native_ratio d p).symm
  | nativeLow =>
    change d ∈ Icc (15/64:ℝ) (1/2) ∧ p ∈ Icc (3/16:ℝ) (1/2) at h
    have hx := inherited_le_native ⟨.C,15/64,1/2,3/16⟩ (by simp [RationalReturn.nativeQ]) rfl (d:=d) (p:=p)
      (by simpa using h.1) (by simpa using h.2)
    exact (common.trans hx).trans_eq (RationalReturn.ReturnQ.native_ratio d p).symm
  | marked =>
    change d ∈ Icc (189/512:ℝ) (15/32) ∧ p ∈ Icc (15/32:ℝ) (1/2) at h
    have hv := ImprovedCount.envelope_le_improved (line:=exactLine)
      (S:=exactScheme) (w:=ExactWindow.window)
      (by change _ ∈ [_]; exact List.mem_singleton_self _) (κ:=(kappa:ℝ))
      (show ExactWindow.window.Available d p from ⟨h.1,h.2⟩)
    exact common.trans (hv.trans (marked_ratio_bound h.1 h.2))
  | saved =>
    change e = .top ∧ d ∈ Icc (425/1000:ℝ) (4267/10000) ∧ p ∈ Icc (49995/100000:ℝ) (1/2) at h
    obtain ⟨rfl,hd',hp'⟩ := h
    have hw : extraBranch.available d p := ⟨hd',hp'⟩
    have hs : envelope (branches .top) (kappa:ℝ) d p ≤ extraBranch.value d p :=
      QRH.Record12518109Return.finiteEnvelope_le_branch QRH.Record12518109Return.countingR
        (show extraBranch ∈ extraBranch :: inheritedBranches from by simp) hw
    have hh := marked_ratio_bound (d:=d) (p:=p)
      (show d ∈ Icc (189/512:ℝ) (15/32) from ⟨by linarith [hd'.1],by linarith [hd'.2]⟩)
      (show p ∈ Icc (15/32:ℝ) (1/2) from ⟨by linarith [hp'.1],hp'.2⟩)
    change envelope (branches .top) (kappa:ℝ) d p ≤ ExactWindow.valueI d p-1/10000000 at hs
    have hq : Q2.ev markedJ d p ≠ 0 := (den_pos .marked hd hp).ne'
    simp only [N,J,ev_sub,ev_smul,sub_div,mul_div_cancel_right₀ _ hq]
    exact hs.trans (by simpa [countGain] using sub_le_sub_right hh (1/10000000))

end
end ContinuumLocalReturn.TargetEdges
#print axioms ContinuumLocalReturn.TargetEdges.envelope_le_ratio
#print axioms ContinuumLocalReturn.TargetEdges.den_pos
