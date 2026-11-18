/- Exact scalar inequalities for the unequal ordinary terminal moment.
   The analytic application is conditional on the preprint's 7/8 theorem
   and the marked sources of tracker #143. This file proves scalar facts
   over the reals; its hypotheses contain no analytic moment estimate.
   Written with assistance from OpenAI Codex. -/
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

set_option autoImplicit false
namespace ContinuumLocalReturn.AsymmetricTerminal
noncomputable section

/-- Closed bounds obtained by adding the physical window offsets. -/
structure Window (n y g h : ℝ) : Prop where
  n_lo : 0.42505871 - 0.000001 ≤ n
  n_hi : n ≤ 0.42506577 + 0.0000008
  y_lo : 1.12796 / 3 - 0.00004 ≤ y
  y_hi : y ≤ 1.12903 / 3 + 0.00001
  g_lo : 0.05805911 ≤ g
  g_hi : g ≤ 0.05805913
  h_lo : 0.07599618 ≤ h
  h_hi : h ≤ 0.07599620

def u : ℝ := 0.0006
def H : ℝ := 1 - 6*u
def d : ℝ := 0.000021
def w : ℝ := 0.76
def wp (v n : ℝ) : ℝ := v/2-n
def ws (v y g h : ℝ) : ℝ := v*(1/2+g)-(1+2*h)*y
def root (n y g h : ℝ) : ℝ := (wp 1 n+ws 1 y g h)/2+d
def live (n y g h : ℝ) : ℝ := root n y g h-u

def small (v n y g h e : ℝ) : ℝ :=
  e*(live n y g h-(wp v n+ws v y g h)/2)
def ds (ν e : ℝ) : ℝ := ν*w+e*(1-w)/2
def dl (ν : ℝ) : ℝ := 5/6-(5/6-ν)*3*w/2
def short (v n y g h ν e : ℝ) : ℝ :=
  ν*y+e*(live n y g h-wp v n/2)-v*ds ν e/2
def long (v n y g h ν e : ℝ) : ℝ :=
  ν*y+e*(live n y g h-wp v n/2)-v*dl ν/2

private theorem product_lower {n y g h : ℝ} (B : Window n y g h) :
    0.07599618*(1.12796/3-0.00004) ≤ h*y := by
  exact mul_le_mul B.h_lo B.y_lo (by norm_num) (by linarith [B.h_lo])

/-- Initial volume gates and availability of the improved short rectangle. -/
theorem dimension_guards {n y g h V : ℝ} (B : Window n y g h)
    (hV : 0.98 ≤ V) (hV' : V ≤ 1) :
    n+y < 0.802 ∧ root n y g h < 0.101 ∧
    (1467/2000)*V < 2*y ∧ 2*y < (311/400)*V ∧
    live n y g h < (1-n-y)/2 := by
  have hb := product_lower B
  unfold live root wp ws d u
  constructor
  · linarith [B.n_hi, B.y_hi]
  constructor
  · nlinarith only [B.n_lo, B.y_lo, B.g_hi, hb]
  constructor
  · linarith [B.y_lo]
  constructor
  · linarith [B.y_hi]
  · nlinarith only [B.g_hi, hb]

/-- The root volume and reference lane inequalities at reserve 1/100,
    with total ordinary budget n+y, zero affine slope, reference length
    0.139, and any selected width up to u. -/
theorem reference_guards {n y g h S a : ℝ} (B : Window n y g h)
    (hS : S ≤ 0.101) (ha : a ≤ u) :
    0.01 < 1-(n+y) ∧ 0.01 < 1-(n+y)-0.101 ∧
    0.01 < 5/6+0.6*0.139-(n+y)-S-3*a ∧
    0.01 < 5/6-(2/3)-S-3*a ∧
    0.01 < 1-(n+y)-S-4*a ∧
    (0.139+1/2+(49/20)*0.101+0.01 : ℝ) < 0.99 ∧
    0.139 < (7/50)*H := by
  obtain ⟨hplain, _⟩ := dimension_guards (V := 1) B (by norm_num) le_rfl
  unfold H u at *
  repeat' constructor
  all_goals linarith

/-- The low-amplitude fourth-moment interpolation at the starting scale. -/
theorem small_at_H {n y g h e : ℝ} (B : Window n y g h)
    (he : 0 ≤ e) (he' : e ≤ 0.447) :
    small H n y g h e < u-0.00000749 := by
  have hg := mul_le_mul_of_nonneg_right B.g_hi he
  unfold small live root wp ws H d u
  nlinarith only [hg, he']

/-- The correlation between ν and e matters even on the high triangle.
    First replace ν by e only in a term with nonpositive coefficient. -/
theorem detector_at_H {n y g h ν e : ℝ} (B : Window n y g h)
    (hk : 0.447 ≤ e) (hν : e ≤ ν) (hν' : ν ≤ 3/4) :
    short H n y g h ν e < u-0.00021763 ∧
    long H n y g h ν e < u-0.00014958 := by
  have hy : 0 ≤ y := by linarith [B.y_lo]
  have he : 0 ≤ e := by linarith
  have hproj : (1/2-h)*y ≤ (1/2-0.07599618)*(1.12903/3+0.00001) :=
    calc
      _ ≤ (1/2-0.07599618)*y := mul_le_mul_of_nonneg_right (by linarith [B.h_lo]) hy
      _ ≤ _ := mul_le_mul_of_nonneg_left B.y_hi (by norm_num)
  let a := (1/2-h)*y + (1/2+g)/2 + (1-H)/4 + d-u
  have ha : a ≤ (1/2-0.07599618)*(1.12903/3+0.00001)
                  +(1/2+0.05805913)/2+(1-H)/4+d-u := by
    dsimp [a]
    linarith only [hproj, B.g_hi]
  have hae := mul_le_mul_of_nonneg_right ha he
  have hs : (ν-e)*(y-H*w/2) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hν) (by
      unfold H u w
      linarith [B.y_hi])
  have hl : (ν-e)*(y-H*3*w/4) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos (sub_nonneg.mpr hν) (by
      unfold H u w
      linarith [B.y_hi])
  have ids : short H n y g h ν e =
      (ν-e)*(y-H*w/2) + (a-H*w/2-H*(1-w)/4)*e := by
    unfold short live root wp ws ds
    dsimp [a]
    ring
  have idl : long H n y g h ν e =
      (ν-e)*(y-H*3*w/4)+(a-H*3*w/4)*e+H*(5/12)*(3*w/2-1) := by
    unfold long live root wp ws dl
    dsimp [a]
    ring
  rw [ids, idl]
  simp only [H, u, w, d] at hae hs hl ⊢
  constructor
  · nlinarith only [hae, hs, hν, hν']
  · nlinarith only [hae, hl, hk]

/-- Every excess plane decreases on its operative amplitude region, and
    the magnitude of its slope is bounded by 29/48, strictly below 5/6. -/
theorem slope_bounds {n y g h ν e : ℝ} (B : Window n y g h)
    (he : 0 ≤ e) (hν : e ≤ ν) (hν' : ν ≤ 3/4) :
    0 ≤ e*(1+g)/2 ∧ e*(1+g)/2 ≤ 29/48 ∧
    0 ≤ e/4+ds ν e/2 ∧ e/4+ds ν e/2 ≤ 29/48 ∧
    (0.447 ≤ e → 0 ≤ e/4+dl ν/2 ∧ e/4+dl ν/2 ≤ 29/48) := by
  have hg := mul_le_mul_of_nonneg_right B.g_hi he
  have hg' := mul_le_mul_of_nonneg_right B.g_lo he
  unfold ds dl w
  constructor
  · nlinarith only [he, hg']
  constructor
  · nlinarith only [hg, hν, hν']
  constructor
  · linarith
  constructor
  · linarith
  · intro hk
    constructor <;> linarith

private theorem transport_plane {V a b c : ℝ}
    (hid : b = a + c*(H-V)) (ha : a < u-0.000007)
    (hc : 0 ≤ c) (hc' : c ≤ 29/48) :
    b < u-0.000007+(5/6)*max (H-V) 0 := by
  rw [hid]
  by_cases hV : V ≤ H
  · rw [max_eq_left (sub_nonneg.mpr hV)]
    have hm := mul_le_mul_of_nonneg_right (show c ≤ 5/6 by linarith)
      (sub_nonneg.mpr hV)
    linarith
  · rw [max_eq_right (by linarith : H-V ≤ 0)]
    have hm := mul_nonpos_of_nonneg_of_nonpos hc (by linarith : H-V ≤ 0)
    linarith

/-- Transport the operative terminal price over the full continuous core
    width. The analytic use of the improved widths is for 0.98 ≤ V ≤ 1. -/
theorem terminal_price {V n y g h ν e : ℝ} (B : Window n y g h)
    (he : 0 ≤ e) (hν : e ≤ ν) (hν' : ν ≤ 3/4) :
    (if e ≤ 0.447 then small V n y g h e
     else max (short V n y g h ν e) (long V n y g h ν e)) <
      u-0.000007+(5/6)*max (H-V) 0 := by
  obtain ⟨hb, hb', hs, hs', hl⟩ := slope_bounds B he hν hν'
  by_cases hx : e ≤ 0.447
  · rw [ite_eq_left hx]
    apply transport_plane (a := small H n y g h e) (c := e*(1+g)/2)
    · unfold small wp ws
      ring
    · linarith only [small_at_H B he hx]
    · exact hb
    · exact hb'
  · rw [ite_eq_right hx, max_lt_iff]
    have hk : 0.447 ≤ e := by linarith
    obtain ⟨ha, ha'⟩ := detector_at_H B hk hν hν'
    obtain ⟨hl, hl'⟩ := hl hk
    constructor
    · apply transport_plane (a := short H n y g h ν e) (c := e/4+ds ν e/2)
      · unfold short wp
        ring
      · linarith only [ha]
      · exact hs
      · exact hs'
    · apply transport_plane (a := long H n y g h ν e) (c := e/4+dl ν/2)
      · unfold long wp
        ring
      · linarith only [ha']
      · exact hl
      · exact hl'

/-- At every lower core scale, the native, unmarked, and tiny-core prices
    fit the propagated allowance. The pure scalar bounds use upper widths
    of the original rectangle, so any coordinate shortening is allowed. -/
theorem lower_core_guards {n y g h V : ℝ} (B : Window n y g h) :
    (V ≤ 0.98 → (3/8)*(1-V) < (5/6)*(H-V)) ∧
    (V ≤ 0.875 → (3/4)*live n y g h < (5/6)*(H-V)) ∧
    (5/6)*0.08+(3/4)*(n+y)+live n y g h < (5/6)*H := by
  obtain ⟨hplain, hmarks, _⟩ := dimension_guards (V := 1) B (by norm_num) le_rfl
  unfold live H u
  constructor
  · intro hv
    linarith
  constructor
  · intro hv
    linarith
  · linarith

/-- Lifting a sixth-power cofactor of width b costs b in the count and 6b
    in the core radius. This removes the cone loss for all M ≥ H. -/
theorem cofactor_transport {M V b : ℝ} (hb : 0 ≤ b) (hV : V = M-6*b) :
    V+b+(5/6)*max (H-V) 0 ≤ M+(5/6)*max (H-M) 0 := by
  by_cases hM : M ≤ H
  · rw [max_eq_left (by linarith : 0 ≤ H-V), max_eq_left (sub_nonneg.mpr hM)]
    linarith
  · rw [max_eq_right (by linarith : H-M ≤ 0)]
    by_cases hh : V ≤ H
    · rw [max_eq_left (sub_nonneg.mpr hh)]
      linarith
    · rw [max_eq_right (by linarith : H-V ≤ 0)]
      linarith

/-- Equation (4) of the companion physical note. The quantity z is the
    finite-source reference width; wp(1,n)-z only needs its lower bound. -/
theorem physical_margin {n y g h p δ m z : ℝ} (B : Window n y g h)
    (hp : 0.49995 ≤ p) (hp' : p ≤ 0.5) (hδ : 0.425 ≤ δ)
    (hy : m-0.00004 ≤ y) (hz : -0.0000008 ≤ wp 1 n-z) :
    let k := 1-p*(1+2*h)
    let C := p*(1+2*g)+2*k*m
    0.00000054753 <
      (δ*(2*y+4*p*root n y g h-2*p*z-C)-9*0.0000001)/4 := by
  dsimp only
  let k := 1-p*(1+2*h)
  have p0 : 0 ≤ p := by linarith
  have k0 : 0 ≤ k := by
    have hh := mul_le_mul_of_nonneg_left B.h_hi p0
    dsimp [k]
    nlinarith only [hh, hp']
  have k1 : k ≤ 1-0.49995*(1+2*0.07599618) := by
    have hh := mul_le_mul_of_nonneg_left B.h_lo p0
    dsimp [k]
    nlinarith only [hh, hp]
  have hy' := mul_nonneg k0 (show 0 ≤ y-m+0.00004 by linarith)
  have hz' := mul_le_mul_of_nonneg_left hz p0
  let b : ℝ := 4*0.49995*0.000021
      -0.00008*(1-0.49995*(1+2*0.07599618))-0.0000008
  have hb0 : 0 ≤ b := by norm_num [b]
  have hred : b ≤ 2*k*(y-m)+2*p*(wp 1 n-z)+4*p*d := by
    dsimp [b, d]
    nlinarith only [hy', hz', k1, hp, hp']
  have hid : 2*y+4*p*root n y g h-2*p*z-
      (p*(1+2*g)+2*(1-p*(1+2*h))*m) =
      2*k*(y-m)+2*p*(wp 1 n-z)+4*p*d := by
    unfold root ws
    dsimp [k]
    ring
  rw [hid]
  have hb := mul_le_mul hδ hred hb0 (by linarith)
  dsimp [b] at hb
  linarith only [hb]

end
end ContinuumLocalReturn.AsymmetricTerminal

#print axioms ContinuumLocalReturn.AsymmetricTerminal.dimension_guards
#print axioms ContinuumLocalReturn.AsymmetricTerminal.small_at_H
#print axioms ContinuumLocalReturn.AsymmetricTerminal.detector_at_H
#print axioms ContinuumLocalReturn.AsymmetricTerminal.slope_bounds
#print axioms ContinuumLocalReturn.AsymmetricTerminal.physical_margin
#print axioms ContinuumLocalReturn.AsymmetricTerminal.terminal_price
#print axioms ContinuumLocalReturn.AsymmetricTerminal.lower_core_guards
#print axioms ContinuumLocalReturn.AsymmetricTerminal.cofactor_transport
#print axioms ContinuumLocalReturn.AsymmetricTerminal.reference_guards
