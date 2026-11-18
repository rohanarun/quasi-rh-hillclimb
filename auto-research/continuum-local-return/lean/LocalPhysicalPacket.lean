/- Conditional physical packet for the local inverse window. The source packet
   statement is adapted from Joseph Bebel, Sil and Hailey Collet (Apache-2.0). -/
import LocalPhysicalBranch
import Candidate.Local.Qrh.TwoSlot.AnchorContinuum.PositiveAmplitudeClass

set_option autoImplicit false
set_option maxHeartbeats 900000
namespace ContinuumLocalReturn.PhysicalBranch
noncomputable section
open scoped Classical BigOperators SchwartzMap
open Filter
open Qrh.TwoSlot.AnchorContinuum Qrh.TwoSlot.AnchorContinuum.PositiveTransport
open Qrh.TwoSlot.AnchorZeroLoss.Affine Qrh.TwoSlot.AnchorZeroLoss.Affine.Return
open QRH.Record1252270103Return
open QRH.Record12518109Return (finiteEnvelope)
open Qrh.JointDetector.BoundaryPhysical.Return.GenericPhysical.PhysicalDirect
open Cycle25.Weighted.Numerator Cycle25.Numerator
open OAI OAI.SevenEighths Cycle25ProbeFinalAssembly ProbeHighRowFamily ProbePhysical
open HeckeFamily HeckeInverseAmplification Cycle25DetectorRowCount
open HeckeDetectorPhysicalSelection HeckeDetectorAmplitudeFirst HeckeDetectorFiberPartition
variable {line : Line} [Geometry.Parameters]
variable [Qrh.JointDetector.BoundaryPhysical.Return.Geometry.CoreBounds]
variable [S : ImprovedCountScheme line]

/-- At the original full amplitude class, the count contribution to the physical
    packet exponent is three quarters of the saved envelope at the masked mean. -/
theorem packet_at_prepended_envelope (A : ChosenData)
    (w : ImprovedWindow line S.naturalκ) (hc : Covers w)
    (hk : (7/10 : ℝ) ≤ A.D.momentKappa) (hkhi : A.D.momentKappa ≤ 3/4) {cost : ℝ}
    (hcost : 0 ≤ cost) (hcostmax : cost ≤ 1/1000000000)
    (hbeta : (51/100:ℝ) ≤ HeckeZeroSupremum.beta)
    (hkbeta : 2*HeckeZeroSupremum.beta-1 ≤ A.D.momentKappa)
    (bPhi error : ℝ) (haff : 0 < error)
    (hsPhi : Function.support (CenteredMomentDetectorPlainFiberSource.radialMajorant : ℝ → ℂ) ⊆ Set.Iic bPhi)
    (di : ℕ) (control : Finset (ℕ×ℕ)) (Ci : ℝ) (hCi : 0 < Ci)
    (hinput : ∀ᶠ U : ℝ in atTop,
      affineAtFace (PositiveSource.physicalFace cost) A bPhi error U di control Ci)
    (J : Finset (Fin A.D.N)) :
    ∃ degree : ℕ, ∃ C : ℝ, 0 < C ∧ ∀ᶠ U : ℝ in atTop,
      1 < U ∧ ∀ Z d : ℝ, 1 < Z → (3/4:ℝ) ≤ d → d ≤ 2*Geometry.y → U = Z^d →
      ∀ (η : Character) (x z : ℂ) (a height : ℝ), (51/100:ℝ) ≤ a → a ≤ 7/8 →
      x.re = a+16*A.D.e → z.re = 17/50 → 0 ≤ height → |z.im| ≤ height →
      ∀ rows : Finset FreeRow,
      (∀ u ∈ rows, U^(1/100:ℝ) ≤ rowNorm u ∧ rowNorm u ≤ U) →
      (∀ u ∈ rows, (rowCharacter A.F.S A.F.exclusions.prime u).residue ≠ 1) →
      (∀ P : ∀ i : J, sourcePrimePool A.F Z i.val, Function.Injective (fun i => (P i).val)) →
      (∀ i P, P ∈ sourcePrimePool A.F Z i → IsCoprime P.val η.modulus) →
      (∀ i : J, sourcePrimePool A.F Z i.val) →
      ∀ bin : BinLabel (Finset.univ : Finset (Fin A.D.N)) ((2*a-1)/2) A.D.t,
      let Q := fun (u : FreeRow) k => HeckePrimeRow.canonicalPrimeAmplitude A.F.modulus ⊤ u.val
        A.F.W 2 (Z^(A.D.length k)) z
      let rows' := amplitudeRows rows Finset.univ (Z^d) ((2*a-1)/2) A.D.t A.D.t_pos
        (fun k => A.D.length k/d) Q bin
      let main := (Finset.univ : Finset (Fin A.D.N)) \ J
      let q := weightedMean Finset.univ (fun k => A.D.length k/d)
        (maskedGain main (binValue Finset.univ ((2*a-1)/2) A.D.t bin))
      let δ := 2*a-1
      let full := classMean Finset.univ (δ/2) A.D.t (fun k => A.D.length k/d) bin / δ
      let R := finiteEnvelope QRH.Record12518109Return.countingR
        (savedBranch w hc :: ImprovedCount.admittedBranches (line := line)) A.D.momentKappa δ (q/δ)
      rows'.Nonempty → ∀ Ccount loss : ℝ, 1 ≤ Ccount →
      (rows'.card : ℝ) ≤ Ccount * U ^ (ImprovedCount.envelope (line := line) A.D.momentKappa δ full + loss) →
      (δ ∈ Set.Icc (425/1000 : ℝ) (4267/10000) → full ∈ Set.Icc (49995/100000 : ℝ) (1/2) →
        (rows'.card : ℝ) ≤ Ccount * U ^ (w.value δ full - 1/10000000 + loss)) →
      (∀ u ∈ rows', ∀ k, ‖Q u k‖ ≤ (Z^(A.D.length k))^
        (HeckePrimeAmplitudeBins.amplitude (Z^(A.D.length k)) ((2*a-1)/2) A.D.t (Q u k)+A.D.t)) →
      (∑ i : rows', ‖labelPolynomialPacket A.F.S A.F.exclusions η i.val
        (fun k : J => sourcePrimePool A.F Z k.val) (fun k => source_prime_pool_outside A.F Z k.val)
        (fun _ => A.F.W) (fun k => Z^(A.D.length k.val)) x z A.F.W (U^(Geometry.y/d))*
        (∏ k ∈ main, Q i.val k)‖) ≤
      C*Ccount*(1+height)^degree*(U^(Geometry.y/d))^(-(1/2:ℝ))*
        (∏ k : J, (Z^(A.D.length k.val))^(-(4/25:ℝ)))*
        U^(A.D.t+q*(Geometry.ell/d)-q*Selection.zeroCapacity cost d/2+
          (3*(R+loss)+1+A.D.t+error+A.D.t)/4+(2*a-1)*Cycle25.sourceMesh A.D.t/4+
          (2*a-1)*(A.D.t+A.D.t)/2+A.D.t*(Geometry.ell/d)) := by
  obtain ⟨degree,C,hC,hpacket⟩ := amplitude_class_packet_with_cost A hcost hcostmax hbeta
    hkbeta bPhi error haff hsPhi di control Ci hCi hinput J
  refine ⟨degree,C,hC,?_⟩
  filter_upwards [hpacket] with U hpacket
  refine ⟨hpacket.1,?_⟩
  intro Z d hZ hd hdmax hUZ η x z a height ha hatop hx hz hheight hzim
    rows hrows hrow hdis hη Pbase bin
  subst U
  dsimp only
  let δ := 2*a-1
  let widths := fun k => A.D.length k/d
  let Q := fun (u : FreeRow) k => HeckePrimeRow.canonicalPrimeAmplitude A.F.modulus ⊤ u.val
    A.F.W 2 (Z^(A.D.length k)) z
  let main := (Finset.univ : Finset (Fin A.D.N)) \ J
  let q := weightedMean Finset.univ widths (maskedGain main (binValue Finset.univ (δ/2) A.D.t bin))
  let R := finiteEnvelope QRH.Record12518109Return.countingR
    (savedBranch w hc :: ImprovedCount.admittedBranches (line := line)) A.D.momentKappa δ (q/δ)
  intro hne Ccount loss hCc hbase hsave hupper
  have hd0 : 0 < d := by linarith
  have hδ : 0 < δ := by dsimp [δ]; linarith
  have hδhi : δ ≤ 3/4 := by dsimp [δ]; linarith
  have hwidth (k : Fin A.D.N) (_ : k ∈ Finset.univ) : 0 ≤ widths k :=
    (div_pos (A.D.slots_pos k) hd0).le
  have hL : 0 < ∑ k, widths k := by
    dsimp only [widths]
    rw [←Finset.sum_div,A.D.slots_sum]
    exact div_pos Geometry.ell_pos hd0
  have hcount := masked_class_at_prepended_envelope w hc rows Finset.univ main (Z^d)
    δ A.D.momentKappa A.D.t A.D.t_pos widths Q bin hδ hδhi hk hkhi hpacket.1.le
    hwidth hL Ccount loss (zero_le_one.trans hCc) hne hbase hsave
  exact hpacket.2 Z d hZ hd hdmax rfl η x z a height ha hatop hx hz hheight hzim
    rows hrows hrow hdis hη Pbase bin hne (R+loss) Ccount hCc hcount.2.2 hupper

end
end ContinuumLocalReturn.PhysicalBranch
#print axioms ContinuumLocalReturn.PhysicalBranch.packet_at_prepended_envelope
