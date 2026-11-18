/- Coordinate bounds for Sil's grouped cube-free source, pinned by tracker #143
   at c74d855c3bdfceeee059501aea76c8b1627b9abd. The analytic application
   assumes the preprint's 7/8 theorem. Written with OpenAI Codex assistance. -/
import Submissions.sil_density_split_20261026.CubeFree.Packet.GroupedSteps
import Candidate.Local.Qrh.TwoSlot.AnchorExtension.Library.MarkedAnchor.Ordinary.Second.ProviderResidual
import Candidate.Local.Qrh.TwoSlot.AnchorExtension.Library.MarkedAnchor.Ordinary.FP.RepairedSourceRootInput

set_option autoImplicit false

namespace ContinuumLocalReturn.AsymmetricPacked
noncomputable section
open scoped Classical BigOperators SchwartzMap
open OAI OAI.SevenEighths HeckeFamily
open QRH.SilDensitySplit.CubeFree.Packet
open Grouped Reduce
open CenteredMomentEnergyBands (length)
open CenteredMomentSectorLocalization (dyadicScale)
open CenteredMomentInductionEnergy (energy)
open CenteredMomentFirstAmplificationChoice (ballProfile)
open CenteredMomentDetectorEnergyInitialState (initialKeep)
open CenteredMomentNaturalFixedRaySource (internalQ)
open ConcreteTraceCRT (eisEmbedding)
open ProfileSeparation (commonPair scale pairWeight pairMajorant)

/-- Bounds for the two ordinary log-lengths, with a separate allowance per
coordinate for dyadic rounding and common-profile separation. -/
def InShape (n y short err x₁ x₂ : ℝ) : Prop :=
  (x₁ ≤ n + err ∧ x₂ ≤ y + err) ∨ min x₁ x₂ ≤ short + err

private theorem shape_enlarge {n y short err d a b x₁ x₂ : ℝ}
    (h : InShape n y short err a b) (h₁ : x₁ ≤ a+d) (h₂ : x₂ ≤ b+d) :
    InShape n y short (err+d) x₁ x₂ := by
  rcases h with ⟨ha,hb⟩ | hab
  · exact Or.inl ⟨by linarith, by linarith⟩
  · rcases min_le_iff.mp hab with ha | hb
    · exact Or.inr ((min_le_left _ _).trans (by linarith))
    · exact Or.inr ((min_le_right _ _).trans (by linarith))

/-- The common profiles at the top of a dyadic class increase each
individual log-length by at most log_Z 3. -/
theorem common_scale_length (Z X : ℝ) (hZ : 1 < Z) (hX : 0 < X) (e : Fin 2) :
    length Z (scale e * dyadicTop X) ≤ length Z X + Real.logb Z 3 := by
  have hs := ProfileSeparation.scale_mem e
  have ht := dyadicTop_spec X hX
  have h₃ : scale e * dyadicTop X ≤ 3*X := by nlinarith [hs.2, dyadicTop_pos X]
  exact (length_mono Z _ _ hZ h₃).trans (length_mul_le Z 3 X hZ (by norm_num))

/-- Reduce the literal raw energy. The coordinate alternative is furnished by
Sil's reduction theorem. The hypotheses constrain only the input rectangles. -/
theorem label_reduction_in_shape {L : ℝ} (θ : GData L) (ε δ : ℝ) (hε : 0 < ε) (hδ : 0 < δ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (mesh Z : ℝ), mesh ≤ 1 → ∀ (η : Character) (r : GSrc θ mesh Z)
      (x : GLabel θ mesh Z) (hx : Fits η r x) (v n y short : ℝ),
      length Z r.X₁ ≤ n → length Z r.X₂ ≤ y → min (length Z r.Y₁) (length Z r.Y₂) ≤ short →
      rawEnergy η r x hx v ≤ 0 ∨ ∃ (A : Finset (Fin θ.N)) (X₁ X₂ : ℝ),
        0 < X₁ ∧ 0 < X₂ ∧ InShape n y short 0 (length Z X₁) (length Z X₂) ∧
        (∀ e : Fin 2 × Fin 2, InShape n y short (Real.logb Z 3)
          (length Z (scale e.1 * dyadicTop X₁)) (length Z (scale e.2 * dyadicTop X₂))) ∧
        rawEnergy η r x hx v ≤ labelMass C Z ε δ r.w r.X₁ r.X₂ x.G x.D x.d *
          childE η r v (x.anchor r) A X₁ X₂ (r.V₀ * x.twist) (dyadicScale (x.n 1)) := by
  obtain ⟨C,hC,red⟩ := label_reduction_frame θ ε hε δ hδ
  refine ⟨C,hC,?_⟩
  intro mesh Z hmesh η r x hx v n y short hn hy hshort
  rcases red mesh Z hmesh η r x hx v with hzero | ⟨A,X₁,X₂,h₁,h₂,hrect,hle⟩
  · exact Or.inl hzero
  · have shape : InShape n y short 0 (length Z X₁) (length Z X₂) := by
      rcases hrect with ⟨a,b⟩ | ⟨a,b⟩
      · exact Or.inl ⟨by simpa using (length_mono Z _ _ r.hZ a).trans hn,
            by simpa using (length_mono Z _ _ r.hZ b).trans hy⟩
      · exact Or.inr (by simpa using
            (min_le_min (length_mono Z _ _ r.hZ a) (length_mono Z _ _ r.hZ b)).trans hshort)
    refine Or.inr ⟨A,X₁,X₂,h₁,h₂,shape,?_,hle⟩
    intro e
    simpa using shape_enlarge shape (common_scale_length Z X₁ r.hZ h₁ e.1)
      (common_scale_length Z X₂ r.hZ h₂ e.2)


/-- The native one-scale class estimate, keyed by the dyadic bins of an
actual representative. Its only analytic input concerns the indicated
ordinary shapes at the one common row scale. -/
def ClassEstimate {L mesh Z : ℝ} {θ : GData L} (η : Character) (r : GSrc θ mesh Z)
    (v : ℝ) (j : DictIdx) (A : Finset (Fin θ.N)) (B₁ B₂ n y short : ℝ) : Prop :=
  ∀ (labels : Finset (GLabel θ mesh Z)) (ω : GLabel θ mesh Z → ℝ)
    (X₁ X₂ : GLabel θ mesh Z → ℝ) (Kc D C T : ℝ) (J : ℕ),
    0 < Kc → 0 ≤ D → 0 ≤ C → 0 ≤ T → (∀ x, 0 ≤ ω x) →
    (∀ x ∈ labels, 0 < X₁ x ∧ 0 < X₂ x ∧
      dyadicIndex (X₁ x) = dyadicIndex B₁ ∧ dyadicIndex (X₂ x) = dyadicIndex B₂) →
    (∀ x ∈ labels, 0 < ((Ideal.span {r.V₀ * x.twist}).absNorm : ℝ) * dyadicScale (x.n 1)) →
    (∀ x ∈ labels, 2 * (((Ideal.span {r.V₀ * x.twist}).absNorm : ℝ) *
      dyadicScale (x.n 1)) ≤ Kc) →
    (∀ z : HeckeFamily.O, z ≠ 0 → ‖eisEmbedding z‖ ^ 2 ≤ Kc →
      ∑ x ∈ labels.filter (fun x => r.V₀ * x.twist ∣ z), ω x ≤ D) →
    (∀ (e : Fin 2 × Fin 2) (τ : ℝ × ℝ),
      InShape n y short (Real.logb Z 3)
        (length Z (scale e.1 * dyadicTop B₁)) (length Z (scale e.2 * dyadicTop B₂)) →
      energy (anchors η j) pmask 1 0 ((commonPair e τ).profile 0) ((commonPair e τ).profile 1)
        (r.pools A) (r.coeffs v A) (r.scales A) (scale e.1 * dyadicTop B₁)
        (scale e.2 * dyadicTop B₂) (initialKeep (anchors η j) (internalQ θ.Q θ.η₀))
        ballProfile Kc ≤ C * pairWeight J τ * T) →
    ∑ x ∈ labels, ω x * childE η r v j A (X₁ x) (X₂ x) (r.V₀ * x.twist)
      (dyadicScale (x.n 1)) ≤
      (4 * D) * C *
      (∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
        1 * pairMajorant ((r.prof v).profile 0) ((r.prof v).profile 1)
          (prof_support r v 0) (prof_support r v 1) e τ) *
      (∑ e : Fin 2 × Fin 2, ∫ τ : ℝ × ℝ,
        1 * pairMajorant ((r.prof v).profile 0) ((r.prof v).profile 1)
          (prof_support r v 0) (prof_support r v 1) e τ * pairWeight J τ) * T

private theorem class_from_common_shape {L mesh Z : ℝ} {θ : GData L} (η : Character)
    (r : GSrc θ mesh Z) (v : ℝ) (j : DictIdx) (A : Finset (Fin θ.N)) (B₁ B₂ n y short : ℝ)
    (hshape : ∀ e : Fin 2 × Fin 2, InShape n y short (Real.logb Z 3)
      (length Z (scale e.1 * dyadicTop B₁)) (length Z (scale e.2 * dyadicTop B₂))) :
    ClassEstimate η r v j A B₁ B₂ n y short := by
  intro labels ω X₁ X₂ Kc D C T J hKc hD hC hT hω hbins hK hscale hmass hsource
  apply class_bound (anchors η j) pmask (initialKeep (anchors η j) (internalQ θ.Q θ.η₀))
    (fun z hz => hz.1) ((r.prof v).profile 0) ((r.prof v).profile 1)
    (prof_support r v 0) (prof_support r v 1) (r.pools A) (r.coeffs v A) (r.scales A)
    (dyadicTop B₁) (dyadicTop B₂) Kc (dyadicTop_pos _) (dyadicTop_pos _) hKc
    labels ω hω (fun x => r.V₀ * x.twist) (fun x => dyadicScale (x.n 1))
    hK hscale X₁ X₂ _ D hD hmass C T J hC hT (fun e τ => hsource e τ (hshape e))
  intro x hx
  obtain ⟨a,b,c,d⟩ := hbins x hx
  have h₁ := dyadicTop_spec (X₁ x) a
  have h₂ := dyadicTop_spec (X₂ x) b
  rw [dyadicTop,c,← dyadicTop] at h₁
  rw [dyadicTop,d,← dyadicTop] at h₂
  exact ⟨a,h₁.1,h₁.2,b,h₂.1,h₂.2⟩

/-- Every positive fitting label supplies a real native child and a
one-scale class estimate for its actual anchor, slots and dyadic bins. -/
theorem label_reduction_and_class_bound {L : ℝ} (θ : GData L) (ε δ : ℝ)
    (hε : 0 < ε) (hδ : 0 < δ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (mesh Z : ℝ), mesh ≤ 1 → ∀ (η : Character) (r : GSrc θ mesh Z)
      (x : GLabel θ mesh Z) (hx : Fits η r x) (v n y short : ℝ),
      length Z r.X₁ ≤ n → length Z r.X₂ ≤ y → min (length Z r.Y₁) (length Z r.Y₂) ≤ short →
      rawEnergy η r x hx v ≤ 0 ∨ ∃ (A : Finset (Fin θ.N)) (B₁ B₂ : ℝ),
        0 < B₁ ∧ 0 < B₂ ∧ InShape n y short 0 (length Z B₁) (length Z B₂) ∧
        rawEnergy η r x hx v ≤ labelMass C Z ε δ r.w r.X₁ r.X₂ x.G x.D x.d *
          childE η r v (x.anchor r) A B₁ B₂ (r.V₀ * x.twist) (dyadicScale (x.n 1)) ∧
        ClassEstimate η r v (x.anchor r) A B₁ B₂ n y short := by
  obtain ⟨C,hC,red⟩ := label_reduction_in_shape θ ε δ hε hδ
  refine ⟨C,hC,?_⟩
  intro mesh Z hmesh η r x hx v n y short hn hy hs
  rcases red mesh Z hmesh η r x hx v n y short hn hy hs with
    zero | ⟨A,B₁,B₂,h₁,h₂,shape,common,hraw⟩
  · exact Or.inl zero
  · exact Or.inr ⟨A,B₁,B₂,h₁,h₂,shape,hraw,class_from_common_shape _ _ _ _ _ _ _ _ _ _ common⟩

section Root
local instance (priority := 2000) {κ : Type*} {p : κ → Prop} :
    DecidableEq (Subtype p) := Classical.decEq _
open QRH QRH.SilDensitySplit QRH.SilDensitySplit.CubeFree QRH.SilDensitySplit.CubeFree.Second
open QRH.SilDensitySplit.CubeFree.Second.Provider
open Candidate.FourthPower
open scoped ContDiff
open CenteredMomentCommonAllocationSum CenteredMomentCommonProfile
open Qrh.MarkedAnchor.Ordinary.FP.RepairedRawContext
open QRH.SilDensitySplit.CubeFree.FP Qrh.MarkedAnchor.Ordinary.FP
open MixedPrincipalPair MixedPrincipalAllocations MixedFirstLiveSource
open Qrh.MarkedAnchor.Ordinary Qrh.MarkedAnchor.Ordinary.RootParameters
open Qrh.MarkedAnchor.Ordinary.Second Qrh.MarkedAnchor.Ordinary.Second.Provider
open QRH.SilDensitySplit.CubeFree.Second.Concrete Qrh.MarkedAnchor.Ordinary.Second.Concrete
open CenteredMomentSourceRectangle
local notation "O" => HeckeFamily.O
local notation "Id" => Ideal O

universe u
variable {D : StepData} {G : StepGates D} {κ : Type u} [Fintype κ]
  {M : Id} [NeZero M] {H : Subgroup (O ⧸ M)ˣ} {hH : RayOrthogonality.globalUnits M ≤ H}
  {W : ℝ → ℂ} {N Holes : ℕ} {ε Z Kslot : ℝ} {η η₀ : Character}

set_option backward.isDefEq.respectTransparency false in
set_option maxHeartbeats 1500000 in
/-- In #143’s actual first-allocation frame the prefix ideals divide the
two ordinary scales in each rectangle coordinate by coordinate. -/
theorem frameOf_root_lengths
    (d : RootInput G M H hH κ W N Holes ε Z Kslot η η₀) (C : Id)
    (B : actualAllocations (tuplePools d.root) C) (J : Finset (liveIndices B.val))
    (hW : ContDiff ℝ ∞ W) (hWs : Function.support W ⊆ Set.Icc (1:ℝ) 2) (bΦ : ℝ) (hbΦ : 2 ≤ bΦ)
    (Q : Id) (hQM : Q ≤ M) (hQ0 : internalQ Q η₀ ≠ 0) (hQt : internalQ Q η₀ ≠ ⊤)
    (hQ72 : internalQ Q η₀ ≤ Ideal.span {(72:O)}) (hε : 0 < ε) (Bmask : ℝ) (hBmask : 0 ≤ Bmask)
    (mesh : ℝ) (hmesh : ∀ i, d.w i ≤ mesh) (V₀ : O) (hV₀ : V₀ ≠ 0) (kLog : ℝ) :
    let r := Qrh.MarkedAnchor.Ordinary.Second.Provider.frameOf d C B J hW hWs bΦ hbΦ Q hQM hQ0
      hQt hQ72 hε Bmask hBmask mesh hmesh V₀ hV₀ kLog
    length Z r.X₁ ≤ length Z d.root.X₁ ∧ length Z r.X₂ ≤ length Z d.root.X₂ ∧
      length Z r.Y₁ ≤ length Z d.root.Y₁ ∧ length Z r.Y₂ ≤ length Z d.root.Y₂ := by
  let a := restOf d.root (by norm_num) d.cover C B J
  have first := nrm_one_le a.hd.1
  have second := nrm_one_le a.hd.2
  refine ⟨length_mono Z _ _ d.one_lt_Z ?_, length_mono Z _ _ d.one_lt_Z ?_,
    length_mono Z _ _ d.one_lt_Z ?_, length_mono Z _ _ d.one_lt_Z ?_⟩
  · exact div_le_self (a.hL.trans_le a.hX₁).le first
  · exact div_le_self (a.hL.trans_le a.hX₂).le second
  · exact div_le_self (a.hL.trans_le a.hY₁).le first
  · exact div_le_self (a.hL.trans_le a.hY₂).le second


open CenteredMomentUncenteredTerminal (comparisonScale)
open Qrh.MarkedAnchor.Ordinary.FP.RestoredRootEnergy
open Qrh.MarkedAnchor.Ordinary.FP.RecenteredRootSetup

/-- The literal low root uses a first reference scale of 2/9. -/
theorem low_root_shape {ι : Type u} [Fintype ι]
    (s : Setup M H D ι) (hn₁ : comparisonScale (9/4) < s.Y₁)
    (hn₂ : comparisonScale (9/4) < s.Y₂) :
    let r := s.rootSource hH hn₁ hn₂
    length s.Z r.X₁ ≤ length s.Z s.X₁ ∧ length s.Z r.X₂ ≤ length s.Z s.X₂ ∧
      min (length s.Z r.Y₁) (length s.Z r.Y₂) ≤ 0 := by
  refine ⟨length_mono _ _ _ s.hZ s.hy₁, length_mono _ _ _ s.hZ s.hy₂,?_⟩
  apply (min_le_left _ _).trans
  apply length_le_of_le_rpow _ _ _ s.hZ le_rfl
  change comparisonScale (9/4) ≤ s.Z^(0:ℝ)
  norm_num [comparisonScale]

/-- The actual recentered high root sets its first reference width to
the step's selected lref, independently of the two ordinary coordinates. -/
theorem centered_root_shape {ι : Type u} [Fintype ι]
    (s : Setup M H D ι) (hε : 0 < ε) (hn₁ : comparisonScale (9/4) < s.Y₁)
    (hn₂ : comparisonScale (9/4) < s.Y₂) (hs₀ : D.s₀ ≤ markedWidth M H s)
    (hhigh : NeedsCentering G ε (ordinaryExponent M H s) (markedWidth M H s))
    (h₁ : rootReference M H G s ε ≤ s.Y₁) (h₂ : rootReference M H G s ε ≤ s.Y₂) :
    let r := centeredRoot M H hH G s ε hε hn₁ hn₂ hs₀ hhigh h₁ h₂
    length s.Z r.X₁ ≤ length s.Z s.X₁ ∧ length s.Z r.X₂ ≤ length s.Z s.X₂ ∧
      min (length s.Z r.Y₁) (length s.Z r.Y₂) ≤ D.lref := by
  refine ⟨length_mono _ _ _ s.hZ s.hy₁, length_mono _ _ _ s.hZ s.hy₂,?_⟩
  apply (min_le_left _ _).trans
  exact length_le_of_le_rpow s.Z (s.Z^D.lref) D.lref s.hZ G.reference_spec.2.1.le le_rfl

end Root

end
end ContinuumLocalReturn.AsymmetricPacked
#print axioms ContinuumLocalReturn.AsymmetricPacked.label_reduction_in_shape
#print axioms ContinuumLocalReturn.AsymmetricPacked.label_reduction_and_class_bound

#print axioms ContinuumLocalReturn.AsymmetricPacked.frameOf_root_lengths
#print axioms ContinuumLocalReturn.AsymmetricPacked.low_root_shape
#print axioms ContinuumLocalReturn.AsymmetricPacked.centered_root_shape
