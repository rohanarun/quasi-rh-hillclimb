/- Five direct physical return edges at the rational target.
   Uses the rational branch polynomials from ArviFoxy, Collet, Sil and Bebel
   and the upstream Bernstein checker (Apache-2.0). -/
import Candidate.Local.Qrh.TwoSlot.AnchorExtension.Library.PositiveGap.Return.Tuning.Data

set_option autoImplicit false
namespace ContinuumLocalReturn.TargetEdges
open QRH.ArviReturnTuning QRH.ArviReturnTuning.Q2
open QRH.PositiveGap.ReturnTuning (toQ)

def target : ℚ := 17466917/20000000
def conductor : ℚ := 815324504/1000000000
def length : ℚ := 11/3-4*target
def yLength : ℚ := conductor-2*length
def kappa : ℚ := 2*target-1
def cost : ℚ := 1/10000000000
def reserve : ℚ := 1/100000000
def countGain : ℚ := 1/10000000
def g0 : ℚ := 58059119/1000000000
def g1 : ℚ := 37998093/500000000

inductive Bound | old | native | nativeLow | marked | saved deriving DecidableEq, Repr
inductive Edge | oldLeft | oldRight | newLeft | seam | top deriving DecidableEq, Repr

def Edge.D : Edge → ℚ
  | .oldLeft => 1/200
  | .oldRight | .newLeft => 19/25
  | .seam => conductor-1/100000
  | .top => conductor+cost

def Edge.cap (e : Edge) : ℚ :=
  match e with
  | .oldLeft => e.D/(6*kappa)
  | .oldRight => (2*yLength-e.D)/(6*kappa)
  | .newLeft => (3/40)*e.D
  | .seam | .top => (2*yLength-(1+cost)*e.D)/(2+10*cost)

def V : Q2 := sub (C (5/6)) X
def oldD : Q2 := sub (sub (C 3) Y) (smul (2/(3*kappa)) Y)
def oldC : Q2 := mul (smul 2 (sub (C 1) Y)) (sub (C 1) (smul (1/(3*kappa)) Y))
def oldJ : Q2 := add (mul V oldD) (mul X oldC)
def oldN : Q2 := add (mul (sub (C 1) X) oldJ) (smul (1/2) (mul (mul X oldC) V))
def markedK : Q2 := sub (C 1) (smul (1+2*g1) Y)
def markedU : Q2 := sub (C 1) (smul (1+6*g0-4*g1) Y)
def markedJ : Q2 := add (smul 3 V) (smul 2 (mul X markedK))
def markedN : Q2 := add (mul (sub (C 1) X) markedJ) (mul (mul V X) markedU)
def J : Bound → Q2
  | .old => oldJ
  | .native | .nativeLow => (toQ .C).Jq
  | .marked | .saved => markedJ
def N : Bound → Q2
  | .old => oldN
  | .native | .nativeLow => (toQ .C).Nq
  | .marked => markedN
  | .saved => sub markedN (smul countGain markedJ)

def base (e : Edge) : Q2 :=
  add (C (1/2+13*conductor/75-yLength/2-length/2-9*e.D/100))
    (add (smul (1/2) X) (smul (length-e.cap/2) (mul X Y)))
def margin (e : Edge) (b : Bound) : Q2 :=
  sub (mul (J b) (sub (C (target-reserve)) (base e)))
    (smul (3/4*e.D) (N b))

/-- A fixed window and the complete density/amplitude rectangle passed to the checker. -/
structure Box where
  dl : ℚ
  dh : ℚ
  pl : ℚ
  ph : ℚ
def Box.contains (B : Box) (d p : ℝ) : Prop :=
  (B.dl:ℝ) ≤ d ∧ d ≤ (B.dh:ℝ) ∧ (B.pl:ℝ) ≤ p ∧ p ≤ (B.ph:ℝ)

def allowed (e : Edge) (b : Bound) (d p : ℝ) : Prop :=
  match b with
  | .old => True
  | .native => d ∈ Set.Icc (15/64:ℝ) (9/16) ∧ p ∈ Set.Icc (9/32:ℝ) (1/2)
  | .nativeLow => d ∈ Set.Icc (15/64:ℝ) (1/2) ∧ p ∈ Set.Icc (3/16:ℝ) (1/2)
  | .marked => d ∈ Set.Icc (189/512:ℝ) (15/32) ∧ p ∈ Set.Icc (15/32:ℝ) (1/2)
  | .saved => e = .top ∧ d ∈ Set.Icc (425/1000:ℝ) (4267/10000) ∧ p ∈ Set.Icc (49995/100000:ℝ) (1/2)

def admitted (e : Edge) (b : Bound) (B : Box) : Bool :=
  match b with
  | .old => true
  | .native => decide (15/64 ≤ B.dl ∧ B.dh ≤ 9/16 ∧ 9/32 ≤ B.pl ∧ B.ph ≤ 1/2)
  | .nativeLow => decide (15/64 ≤ B.dl ∧ B.dh ≤ 1/2 ∧ 3/16 ≤ B.pl ∧ B.ph ≤ 1/2)
  | .marked => decide (189/512 ≤ B.dl ∧ B.dh ≤ 15/32 ∧ 15/32 ≤ B.pl ∧ B.ph ≤ 1/2)
  | .saved => decide (e = .top ∧ 425/1000 ≤ B.dl ∧ B.dh ≤ 4267/10000 ∧ 49995/100000 ≤ B.pl ∧ B.ph ≤ 1/2)

private theorem window_of_box {B : Box} {a b c z : ℚ} {d p : ℝ}
    (h : a ≤ B.dl ∧ B.dh ≤ b ∧ c ≤ B.pl ∧ B.ph ≤ z) (hB : B.contains d p) :
    d ∈ Set.Icc (a:ℝ) b ∧ p ∈ Set.Icc (c:ℝ) z :=
  ⟨⟨(Rat.cast_le.mpr h.1).trans hB.1,hB.2.1.trans (Rat.cast_le.mpr h.2.1)⟩,
   ⟨(Rat.cast_le.mpr h.2.2.1).trans hB.2.2.1,hB.2.2.2.trans (Rat.cast_le.mpr h.2.2.2)⟩⟩

theorem admitted_sound {e : Edge} {b : Bound} {B : Box} {d p : ℝ}
    (h : admitted e b B = true) (hB : B.contains d p) : allowed e b d p := by
  cases b <;> simp only [admitted,decide_eq_true_eq,allowed] at h ⊢
  · simpa using window_of_box h hB
  · simpa using window_of_box h hB
  · simpa using window_of_box h hB
  · exact ⟨h.1,by simpa using window_of_box h.2 hB⟩

inductive Cover
  | leaf (b : Bound)
  | cutD (x : ℚ) (left right : Cover)
  | cutP (x : ℚ) (left right : Cover)

def Cover.check (e : Edge) (B : Box) : Cover → Bool
  | .leaf b => admitted e b B && bernCheck (margin e b) B.dl B.dh B.pl B.ph
  | .cutD x l r => l.check e {B with dh := x} && r.check e {B with dl := x}
  | .cutP x l r => l.check e {B with ph := x} && r.check e {B with pl := x}

theorem Cover.sound {e : Edge} {B : Box} {d p : ℝ} (tree : Cover)
    (hc : tree.check e B = true) (hb : B.contains d p) :
    ∃ b, allowed e b d p ∧ 0 < Q2.ev (margin e b) d p := by
  induction tree generalizing B with
  | leaf b =>
    simp only [Cover.check,Bool.and_eq_true] at hc
    exact ⟨b,admitted_sound hc.1 hb,bernCheck_sound _ _ _ _ _ hc.2 hb.1 hb.2.1 hb.2.2.1 hb.2.2.2⟩
  | cutD x l r il ir =>
    simp only [Cover.check,Bool.and_eq_true] at hc
    by_cases h : d ≤ (x:ℝ)
    · exact il hc.1 ⟨hb.1,h,hb.2.2⟩
    · exact ir hc.2 ⟨le_of_not_ge h,hb.2⟩
  | cutP x l r il ir =>
    simp only [Cover.check,Bool.and_eq_true] at hc
    by_cases h : p ≤ (x:ℝ)
    · exact il hc.1 ⟨hb.1,hb.2.1,hb.2.2.1,h⟩
    · exact ir hc.2 ⟨hb.1,hb.2.1,le_of_not_ge h,hb.2.2.2⟩

end ContinuumLocalReturn.TargetEdges
#print axioms ContinuumLocalReturn.TargetEdges.Cover.sound
