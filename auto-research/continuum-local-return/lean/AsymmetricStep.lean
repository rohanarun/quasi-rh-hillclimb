/- The scalar selected-Poisson step for the unequal ordinary rectangle.
   Instantiates Sil's StepData and StepGates as forked by Joseph Bebel
   in tracker #143, commit c74d855c3bdfceeee059501aea76c8b1627b9abd.
   The price here is the scalar allowance. The analytic leaf estimate at
   that price is a separate hypothesis in the application.
   Written with assistance from OpenAI Codex. -/
import Candidate.Local.Qrh.TwoSlot.AnchorExtension.Library.MarkedAnchor.Ordinary.StepData

set_option autoImplicit false
namespace ContinuumLocalReturn.AsymmetricStep
noncomputable section
open Qrh.MarkedAnchor.Ordinary QRH.SilDensitySplit.CubeFree

def selected (w : ℝ) : ℝ := min 0.0006 (max 0 w)

def price : Price where
  f := fun w _ _ _ => selected w
  nonneg := fun _ _ _ _ => le_min (by norm_num) (le_max_left ..)
  mono := fun _ _ _ _ _ _ _ _ => le_rfl
  lip := 0
  lip_nonneg := le_rfl
  lipP := by intros; simp
  lipS := by intros; simp
  lipM := by intros; simp

def step : StepData where
  B₀ := 0.99
  L₀ := 49/20
  c₀ := 0.14
  B := 0.802
  L := 0
  c := 0.101
  κ := 3/4
  s₀ := 0
  Hmin := 0.99
  Hmax := 3
  sel := fun _ w => selected w
  price := price
  lref := 0.139
  alpha := 0.6
  Pref := 2/3

theorem reference : ReferenceAt step 0.01 := by
  unfold ReferenceAt
  norm_num [step]
  intro ε hε S hS hcap
  have hu : selected S ≤ 0.0006 := min_le_left ..
  constructor
  · linarith
  constructor <;> linarith

/-- With f frozen, both the target and the leaf allowance are evaluated at
    exactly S-f. The mesh bounds the extra selected width only for the
    purpose of enclosing the frequency scale. -/
theorem ledger {ε : ℝ} (hε : 0 < ε) :
    LedgerAt step ε (ε/24) 0.0005 0.0005 := by
  refine ⟨by positivity, ?_, by norm_num, by norm_num, ?_⟩
  · change ε/24 ≤ ε/(16*(3/4))
    linarith
  intro mesh hmesh0 hmesh tl htl0 htl g hfloor
  have hs : selected (g.S-g.f) ≤ g.u := g.hsel.1
  have hu : g.u ≤ selected (g.S-g.f)+mesh := g.hsel.2
  have hcap : selected (g.S-g.f) ≤ 0.0006 := min_le_left ..
  obtain ⟨htlo, hthi⟩ := g.ht
  change 0.99 ≤ 1+g.t-6*g.u ∧ 1+g.t-6*g.u ≤ 3 ∧ selected (g.S-g.f) ≤ g.u+ε/16
  constructor
  · linarith
  constructor <;> linarith

theorem gates : StepGates step where
  face := by norm_num [step]
  kappa := rfl
  crossing := by norm_num [step]
  envelope := by norm_num [step]
  sel_spec := by
    intro ε hε
    constructor
    · intro a ha b hb hab
      exact min_le_min le_rfl (max_le_max le_rfl hab)
    · intro w hw hcap
      change 0 ≤ min 0.0006 (max 0 w) ∧ min 0.0006 (max 0 w) ≤ w
      rw [max_eq_right hw]
      exact ⟨le_min (by norm_num) hw, min_le_right ..⟩
  ledger := fun ε hε => ⟨(ε/24, 0.0005, 0.0005), ledger hε⟩
  reference := ⟨0.01, reference⟩

end
end ContinuumLocalReturn.AsymmetricStep

#print axioms ContinuumLocalReturn.AsymmetricStep.reference
#print axioms ContinuumLocalReturn.AsymmetricStep.ledger
#print axioms ContinuumLocalReturn.AsymmetricStep.gates
