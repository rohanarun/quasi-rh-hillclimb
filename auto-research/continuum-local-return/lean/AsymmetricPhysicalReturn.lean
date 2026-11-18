/- Adapted from Joseph Bebel's PositiveChosenTransport, tracker #143, Apache-2.0,
   and the cited Collet/Sil physical return. Uses the literal finite central
   integrals with all rows and the source reciprocal still present.
   Written with assistance from OpenAI Codex. -/
import TargetGeometry
import Candidate.Local.Qrh.TwoSlot.AnchorExtension.Library.JointDetector.BoundaryPhysical.Transport.FinalFixedHigh
import Candidate.Local.Qrh.TwoSlot.AnchorExtension.Library.JointDetector.BoundaryPhysical.Transport.Transport.NormalizedTransportSaving
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.PositiveChosenTransport
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.ExactReturnData

set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
namespace ContinuumLocalReturn.AsymmetricPhysicalReturn
open scoped Classical BigOperators Topology ContDiff
open Filter Asymptotics
open Qrh.TwoSlot.AnchorZeroLoss
open QRH.Record1252270103Return QRH.Record1252270103Return.GenericPhysical
open Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.PhysicalDirect.Source
open Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly
open Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.FinalAssembly
open Qrh.JointDetector.BoundaryPhysical.Return.GenericArithmetic
open OAI OAI.SevenEighths ProbeHighRowFamily ProbePhysical HeckeFamily HeckeInverseAmplification
open HeckeDetectorPhysicalSelection Cycle25.Numerator Cycle25.Weighted.FullWContour
open BoundaryDensitySplitReturn.TransportHighTransport
open BoundaryDensitySplitReturn.TransportHighRowFamily
open ProbeMellinBoundary CompletedGauss PrincipalMellinResidues PrincipalSignalComparison ProbePrincipalResidueActual
section Geometry
variable [Geometry.Parameters] [BoundsCore]

private abbrev pad : ℝ :=
  Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Transport.rowExtension / 2

def normalizer (D : BaselineData) (F : BaselineSourceData D) (Z : ℝ) : ℂ :=
  actualNormalizer F.modulus ⊤ F.S D.length 1 2 (fun _ => F.w) F.W F.W Z

/-- The original sum of central cube integrals at the buffered row heights. -/
def cube (D : BaselineData) (F : BaselineSourceData D) (η : Character) (Z τ : ℝ)
    (idx grid : FreeRow → ℕ) : ℂ :=
  finiteCentralCubeRows F.S F.exclusions F.maximal η
    (rowBand (Z^(1/100:ℝ)) (Z^(Geometry.h+pad)))
    (sourcePrimePool F Z) (fun j => source_prime_pool_outside F Z j)
    (fun _ => F.W) (fun j => Z^(D.length j)) F.W F.W
    (Z^Geometry.x) (Z^Geometry.y) Z D.e (fun u => 51/100+D.e*grid u)
    (fun u => (3*idx u+1:ℕ)*Z^τ)

/-- At a common source, the target may select its own positive height exponent.
    All grid choices satisfying the actual transport selection must be covered. -/
def physicalBound (D : BaselineData) (F : BaselineSourceData D) (P : TransportParameters D) :
    Prop :=
  ∀ η : Character, ∃ τ : ℝ, 0 < τ ∧ ∀ n : ℕ, 0 < n → ∃ C : ℝ, 0 < C ∧
    ∀ᶠ Z : ℝ in atTop, ∀ idx grid : FreeRow → ℕ,
      ActualBufferedSelection F.modulus ⊤ le_top F.S F.exclusions F.maximal
        η pad D.e τ n Z idx grid →
      ‖cube D F η Z τ idx grid / normalizer D F Z‖ ≤
        C*Z^(HeckeZeroSupremum.beta+Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signalShift-P.sigma)

/-- Collect the full physical integral against its normalized probe and signal. -/
theorem high_of_cube (hgap : theta < HeckeZeroSupremum.beta) (D : BaselineData)
    (F : BaselineSourceData D) (P : TransportParameters D) (hc : physicalBound D F P)
    (η : Character) :
    (fun Z => sourceProbe D F η Z - HeckeSignal.signal
      (η.excludePrimes F.S F.exclusions.prime) (sourceCorrection η F.S) Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signalShift Z)
      =O[atTop] (fun Z : ℝ => Z^(HeckeZeroSupremum.beta+Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signalShift-P.sigma)) := by
  obtain ⟨tau, htau, hsums⟩ := hc η
  have hlarge : P.sigma+P.nu≤1+Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signal theta := by
    have hn := P.nu_eq
    have hs := P.sigma_small
    have ht := D.t_small
    have hsig : (1/10:ℝ)<Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signal theta := by
      have hb := Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Assembly.signal_at_boundary
      have hx : 1672/10000<Geometry.x := BoundsCore.ell_interval.1.trans Geometry.ell_lt_x
      have hy : 458/1000<Geometry.y := BoundsCore.ly_coarse.1
      change Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signal theta=Geometry.x/2+(Geometry.y-Geometry.x)/12 at hb
      linarith
    linarith
  have hbeta : HeckeZeroSupremum.beta≤(7/8:ℝ) :=
    HeckeCommonProbe.beta_le_seven_eighths
      (ProbeFinalAssembly.common_probe_of_chosen_moments
        (ProbeFinalAssemblyCertifiedBands.chosen_moments_of_certified
          ProbeFinalAssemblyUnconditional.detector_certified_bands))
  obtain ⟨n,hn,htransport⟩ := BoundaryDensitySplitReturn.TransportHighRowFamily.actual_normalized_probe_transport_saving
    F.modulus ⊤ le_top D.N D.e (1/100) 1 2 1 pad 1 tau P.ellMin P.nu
    D.e_pos D.e_small (by norm_num) (by norm_num)
    (by norm_num [pad, Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Transport.rowExtension])
    (by norm_num [pad, Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Transport.rowExtension]) htau
    (by norm_num) (by norm_num) (by norm_num) P.ellMin_pos P.nu_pos
    hgap.le hbeta F.S F.exclusions F.maximal F.first
    D.length P.slots_min D.slots_injective D.slots_sum
    (fun _=>F.w) (fun _=>F.smooth) (fun _=>F.compact) (fun _=>F.support)
    (fun _=>F.bounded) (fun _=>F.nonzero)
    F.W F.W 1 2 1 2 (by norm_num) (by norm_num)
    F.complex_support F.complex_support F.real F.real F.nonnegative F.nonnegative
    F.complex_nonzero F.complex_nonzero P.sigma P.sigma_pos
    P.geometric_budget P.principal_budget P.window_budget hlarge
  obtain ⟨Ct,hCt,htransport⟩ := htransport η
  obtain ⟨Cf,hCf,hfinite⟩ := hsums n hn
  apply BoundaryDensitySplitTransportLow.isBigO_rpow_of_eventual_norm_bound
  refine ⟨Ct+Cf,by positivity,?_⟩
  filter_upwards [htransport,hfinite] with Z ht hf
  dsimp only at ht
  obtain ⟨_,idx,grid,hlabels,hbins,hray,herror⟩ := ht
  have hsel : ActualBufferedSelection F.modulus ⊤ le_top F.S F.exclusions F.maximal
      η pad D.e tau n Z idx grid := ⟨hlabels,hbins,hray⟩
  have hs := hf idx grid hsel
  have hshift : Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Assembly.signalShift =
      Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signalShift := by rfl
  have hexp : HeckeZeroSupremum.beta-
      (4+Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Transport.b)/6-P.sigma =
      HeckeZeroSupremum.beta+Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signalShift-P.sigma := by
    rw [←hshift,←Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Transport.signalShift_eq]
    ring
  rw [hexp] at herror
  let residual := sourceProbe D F η Z - HeckeSignal.signal
    (η.excludePrimes F.S F.exclusions.prime) (sourceCorrection η F.S) Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signalShift Z
  let physical := cube D F η Z tau idx grid / normalizer D F Z
  let price := Z^(HeckeZeroSupremum.beta+Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.Assembly.signalShift-P.sigma)
  have herr : ‖residual-physical‖ ≤ Ct*price := by
    dsimp only [residual, physical, price]
    simp only [sourceProbe,Record1252270103Low.normalizedProbe,
      cube,normalizer,
      actualNormalizer,hshift,
      Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Transport.signalShift_eq,
      Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Arithmetic.h,
      Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Arithmetic.x,
      Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Arithmetic.y,
      Qrh.JointDetector.BoundaryPhysical.TransportKernel.Transport.Arithmetic.ell,
      ←F.complex_eq] at herror ⊢
    convert herror using 1
    rfl
  calc ‖residual‖ = ‖(residual-physical)+physical‖ := by rw [sub_add_cancel]
       _ ≤ ‖residual-physical‖+‖physical‖ := norm_add_le _ _
       _ ≤ Ct*price+Cf*price := add_le_add herr hs
       _ = (Ct+Cf)*price := by ring

/-- No count is assumed. The only new analytic input concerns the finite
    physical integral, with source and transport parameters chosen before η. -/
theorem beta_of_cube
    (hc : theta < HeckeZeroSupremum.beta → ∃ D : BaselineData,
      ∃ F : BaselineSourceData D, ∃ P : TransportParameters D, physicalBound D F P) :
    HeckeZeroSupremum.beta ≤ theta := by
  apply Cycle25.beta_le_of_common_probe
    (show (1/2:ℝ)≤theta by linarith [BoundsCore.theta_bounds.1]) BoundsCore.theta_bounds.2.le
  intro hgap
  obtain ⟨D,F,P,h⟩ := hc hgap
  let loss := (HeckeZeroSupremum.beta-theta)/2
  have hloss : 0 < loss := by dsimp [loss]; linarith
  refine ⟨loss,P.sigma,hloss,(by dsimp [loss]; linarith),P.sigma_pos,?_⟩
  exact fixed_source_contract D F loss P.sigma hloss (high_of_cube hgap D F P h)

end Geometry

section Endpoint
open Qrh.TwoSlot.AnchorContinuum.Contact
private theorem hCut : stationaryCutoff ∈ TargetGeometry.cutoffCorridor :=
  ⟨Precision.cutoff_bounds.1.le, Precision.cutoff_bounds.2.le⟩
local instance : Geometry.Parameters :=
  TargetGeometry.targetParameters _ _ TargetGeometry.proposed_mem hCut
local instance : BoundsCore := TargetGeometry.targetCoarse _ _ TargetGeometry.proposed_mem hCut

def atTarget : Prop := (17466917/20000000:ℝ) < HeckeZeroSupremum.beta →
  ∃ D : BaselineData, ∃ F : BaselineSourceData D, ∃ P : TransportParameters D,
      physicalBound D F P

theorem dirichlet (h : atTarget) {q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q)
    {z : ℂ} (hz : (17466917/20000000:ℝ) < z.re) (hp : ¬ (χ = 1 ∧ z = 1)) :
    DirichletCharacter.LFunction χ z ≠ 0 := by
  have hb : HeckeZeroSupremum.beta ≤ (17466917/20000000:ℝ) := beta_of_cube h
  exact _root_.Cycle25.dirichlet_of_hecke (by norm_num)
    (fun η z hz hp => HeckeZeroSupremum.LFunction_ne_zero_of_beta_lt η (hb.trans_lt hz) hp)
    χ z hz hp

end Endpoint
end ContinuumLocalReturn.AsymmetricPhysicalReturn
end
#print axioms ContinuumLocalReturn.AsymmetricPhysicalReturn.high_of_cube
#print axioms ContinuumLocalReturn.AsymmetricPhysicalReturn.beta_of_cube
#print axioms ContinuumLocalReturn.AsymmetricPhysicalReturn.dirichlet
