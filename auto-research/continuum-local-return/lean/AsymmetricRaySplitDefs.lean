/- Adapted from Sil's cube-free packet and concrete label assembly, copyright 2026 Sil,
   Apache-2.0. Written with OpenAI Codex assistance. The analytic application assumes the
   preprint's 7/8 theorem. -/
import AsymmetricRayFirst
import Submissions.sil_density_split_20261026.CubeFree.Second.ConcreteLabelAssembly12

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
set_option maxHeartbeats 1000000
set_option linter.unusedVariables false

namespace ContinuumLocalReturn.AsymmetricRaySplit
open Candidate.FourthPower QRH.SilDensitySplit.CubeFree.FP QRH.SilDensitySplit.CubeFree.Packet.Reduce
open QRH.SilDensitySplit.CubeFree.Packet QRH.SilDensitySplit.CubeFree.Packet.Grouped
open QRH.SilDensitySplit.CubeFree.Second.ConcreteFrame

noncomputable section
open scoped Classical BigOperators SchwartzMap ContDiff
open Filter OAI OAI.SevenEighths HeckeFamily CanonicalQuadraticSieve ConcreteTraceCRT
open QRH.Record1252270103TwoIdeal QRH.Record1252270103KernelMass
open KernelAssignmentReindex KernelNaturalSlots ReferencePrimeEnclosure MixedCompletedRows
open NativeFiniteHoles NativeInjectiveEnergy
open MixedCenteredEnergy MixedLiveRows MixedLiveNormalization MixedCanonicalSource
open MixedCommonCoefficient MixedCommonRestriction MixedLiteralAllocation
open MixedCommonSource MixedOriginalSource MixedRestrictedDictionary MixedHeightEnergy
open CenteredMomentOriginalRadialComparison CenteredMomentAllocatedNaturalRadial
open CenteredMomentEnergyCapacityRemoval CenteredMomentNaturalFixedRaySource
open CenteredMomentPrimeSlot (primePool)
open CenteredMomentInductionEnergy CenteredMomentCommonMaskEnergy
open CenteredMomentNaturalRowSource CenteredMomentFiniteProfileExceptional
open CenteredMomentRayMaskedFloor HeckeDyadic CenteredMomentCommonProfile
open CenteredMomentSourceLiveColumn CenteredMomentAddedZeroUniform CenteredMomentSourceProfileMass
open CenteredMomentFirstSectors CenteredMomentSourceRectangle CenteredMomentSourceMass
open CenteredMomentRestrictedSource CenteredMomentHeckeColumnWindow
open CenteredMomentSecondNonexceptionalChosenBlock CenteredMomentSecondHeightFamily
open CenteredMomentSecondExceptionalFamily CenteredMomentFirstAmplificationChoice
open CenteredMomentSectorLocalization CenteredMomentCanonicalFirst CenteredMomentSourceRow
open CanonicalRowCompletion CompletedGauss RayFourExpansion CenteredMomentFirstPhysicalSource
open CenteredMomentSecondCanonicalNonunit CenteredMomentChildRows CenteredMomentRestrictedEnergy
open CenteredMomentRowNorm MixedPrincipalPair MixedPrincipalWindow MixedPrincipalAllocations
open QRH.SilDensitySplit.CubeFree QRH.SilDensitySplit.CubeFree.Second.ConcreteLabelAssembly
open FP.MixedPrincipalPair FP.MixedPrincipalWindow FP.MixedPrincipalAllocations
open CenteredMomentLattice CenteredMomentSecondIdealBlockBound CenteredMomentHeckeSlots
open CenteredMomentSecondPhysicalBlock CenteredMomentSecondCanonical
open QRH.SilDensitySplit.CubeFree.Second.Concrete QRH.SilDensitySplit.CubeFree.Second.ConcreteGroup
open AsymmetricRayLabel AsymmetricRayColumn
local notation "O" => HeckeFamily.O
local notation "Id" => Ideal O
variable (ω₁ ω₂ : Id →* ℂ)
def rayLabel (M : Id) [NeZero M] (Hray : Subgroup (O ⧸ M)ˣ)
    (hHray : RayOrthogonality.globalUnits M ≤ Hray) {α : Type*} [Fintype α] (W : ℝ→ℂ) (η₀ : Character)
    (θ : α→RayQuotient.Characters M Hray) (Z : ℝ) (w σ freq : α→ℝ) (t : ℝ) (R₀ : α→Finset Id)
    (τ : Character) (Q : Id) (n : Fin 4→ℤ) (Cap Lcap : ℝ) (R G : Id) (hG : G≠0) (seed D : Id)
    (H : Finset PrimeIdeal) (W₁ W₂ : ℝ→ℂ) (t₁ t₂ b X₁ X₂ Y₁ Y₂ : ℝ) (d : Id×Id)
    (hd : d.1≠0 ∧ d.2≠0) (v : ℝ) : ℝ :=
  sourceRestrictedEnergy (canonicalRadial τ Q n).keep
    (residualPool G hG (finiteColumns (Fintype.piFinset
      (sourcePools (fun i=>supportedPool (primePool M Hray 2 (Z^(w i)))) d hd b X₁ X₂ Y₁ Y₂))))
    (fun I=>if IsCoprime G I ∧ D∣I then
      rayColumn (rayWeight ω₁ ω₂) (enclosure (Cap*Z^Lcap)) H
        (fun i=>supportedPool (primePool M Hray 2 (Z^(w i)))) d hd R seed
        (slotCoefficient (fun i=>relativeCharacter M Hray hHray η₀ (θ i)) R₀ t)
        (fun i=>slotProfile W (σ i) (freq i)) (fun i=>Z^(w i))
        (phaseProfile W₁ t₁) (phaseProfile W₂ t₂) b X₁ X₂ Y₁ Y₂ (G*I) else 0)
    (heightCoeff τ v) ballProfile (dyadicScale (n 1))


def raySource {ι : Type*} [Fintype ι] {a b : ℝ} (s : Source ι a b) (ha : 0<a) (seed : Id) :=
  rayColumn (rayWeight ω₁ ω₂) s.S s.H s.pool s.d s.hd s.R seed s.ν s.Wslot s.P
    (normPowerProfile s.W₁ a b ha s.hs₁ (s.W₁.smooth ⊤) s.t₁)
    (normPowerProfile s.W₂ a b ha s.hs₂ (s.W₂.smooth ⊤) s.t₂)
    b s.X₁ s.X₂ s.Y₁ s.Y₂

theorem root_aggregate {ι : Type*} [Fintype ι] {a b : ℝ} (s : Source ι a b) (ha : 0<a) :
    raySource ω₁ ω₂ s ha 1 = AsymmetricRayFirst.aggregate s ha ω₁ ω₂ := rfl

variable {L : ℝ} {θ : GData L} {mesh Z : ℝ}
def rayRaw (η : Character) (r : GSrc θ mesh Z) (x : GLabel θ mesh Z) (h : Fits η r x)
    (v : ℝ) : ℝ :=
  rayLabel ω₁ ω₂ θ.rayM θ.Hray θ.hH θ.W θ.η₀ r.χ Z r.w r.σ r.freq r.t r.R₀ (x.char r)
    (internalQ θ.Q θ.η₀) x.n θ.Cap θ.Lcap x.R x.G h.G_ne x.seed x.D x.holesH r.W₁ r.W₂
    r.t₁ r.t₂ θ.b r.X₁ r.X₂ r.Y₁ r.Y₂ x.d ⟨h.d₁, h.d₂⟩ v

theorem rayRaw_nonneg (η : Character) (r : GSrc θ mesh Z) (x : GLabel θ mesh Z)
    (h : Fits η r x) (v : ℝ) : 0 ≤ rayRaw ω₁ ω₂ η r x h v := by
  unfold rayRaw rayLabel
  exact CenteredMomentRestrictedSourceNormalization.sourceRestrictedEnergy_nonneg _ _ _ _ _ _
    (dyadicScale_pos _) (fun _ => ballProfile_nonneg _)

def rayGEnergy (η : Character) (r : GSrc θ mesh Z) (x : GLabel θ mesh Z) (v : ℝ) : ℝ :=
  if h : Fits η r x then
    (x.G.absNorm : ℝ) * (x.D.absNorm : ℝ) *
      ((x.d.1.absNorm : ℝ) * (x.d.2.absNorm : ℝ)) * r.norm * rayRaw ω₁ ω₂ η r x h v else 0


#print axioms root_aggregate
#print axioms rayRaw_nonneg
end
end ContinuumLocalReturn.AsymmetricRaySplit
