# Conditional all-moduli return at 0.87334585

Assume the preprint's 7/8 theorem and the inputs used in tracker #143. The new theorem `TargetReturn.dirichlet` reduces nonvanishing for every positive modulus on $\Re s>17466917/20000000$, with the principal pole excluded, to one additional arithmetic premise, `TargetReturn.SavedClassCount`. Proving that premise remains open. [Endpoint and exact premise](TargetReturn.lean) · [Tracker #143](https://github.com/GTimG/QuasiRiemannTracker/pull/143).

## Direct return from the physical integral

The theorem `AsymmetricPhysicalReturn.dirichlet` proves a second conditional endpoint at the same target. Its premise `atTarget` bounds a sum of the original finite central cube integrals over the intermediate physical rows. The integrals retain the reciprocal of the denominator character. One source and a positive saving are chosen before the character. Each character may choose its own positive height exponent before the grid size and buffered row selections. The proof uses the tracker's transport to the principal signal, its low estimate, and continuation to all positive Dirichlet moduli. The estimate `atTarget` is open. [Exact definitions and endpoint](AsymmetricPhysicalReturn.lean) · [Proposed integral estimate](../asymmetric-root.md).

| Part of the proposed integral estimate | Verified scope |
|---|---|
| Terminal exponents | Continuous real inequalities over the critical window, including cofactor counting and the final physical saving. [AsymmetricTerminal.lean](AsymmetricTerminal.lean) |
| Selected Poisson step | The tracker's scalar `StepGates`, including all allowed frozen widths and reference reserve $.01$. [AsymmetricStep.lean](AsymmetricStep.lean) |
| Two ordinary lengths | Separate upper bounds at the native physical and reference rectangles, their first allocations, the native positive child and dyadic common profiles. [AsymmetricPacked.lean](AsymmetricPacked.lean) |
| Two ordinary characters | Exact cube-free restoration with both multipliers, including overlapping prime labels. Exact common-column and signed divisor-allocation identities, keeping both residual weights. [Root restoration](AsymmetricRayKernel.lean) · [Columns and allocations](AsymmetricRayColumn.lean) |
| Exceptional and packed rows | The full cube-free marked exceptional rectangle saves $L^{-\alpha}$ for every $0\le\alpha<2/3$, with an inducing witness and conductor cap for each ordinary character. The packed calculation retains the punctures, the two ordinary heights and the moving sublattice. [Exceptional rectangles](AsymmetricRayException.lean) · [Packed labels](AsymmetricRayLabel.lean) |
| First retained Poisson block | The literal block is bounded in terms of the two height-uniform side energies summed over its permitted squarefree divisors, with the reflected right row and native factor $256$. [Balanced block inequality](AsymmetricRayFirst.lean) |
| Grouped positive estimate | Fourier separation bounds a weighted sum on sublattices by the energy on one common ball. On a class with a known pair of length bounds, its input can be restricted to the original or reference rectangle. [Two-character grouping](AsymmetricRayGroup.lean) · [Restriction by shape](AsymmetricRayShape.lean) |

### Second Poisson step

| Quantity | Verified scope |
|---|---|
| Zero frequency and discarded tail | For a nonzero seed, a tuple multiplier of modulus at most one preserves the reciprocal seed norm in the zero-frequency bound. The discarded Fourier tail admits any fixed power saving under the stated scale caps. Both estimates allow separate ordinary ray characters. [Seed bounds](AsymmetricRayDiagonal.lean) |
| Squarefree divisor | For each fixed signed allocation the estimate recovers the reciprocal norm of the squarefree divisor up to an arbitrarily small power, assuming the residual-source bound. The centered arms retain their separate lengths. The forward row retains the two ordinary twists and the injective prime sum. [Divisor estimate](AsymmetricRayPaid.lean) · [Centered arms](AsymmetricRayPaidSource.lean) · [Forward row](AsymmetricRayPaidForward.lean) |
| Sum over packed labels | Given a bound reducing each raw label to one child with its full divisor factor (`LocalReduction`) and a terminal energy bound on the common ball (`ShapeLeaf`), the theorem bounds the whole weighted sum on an admissible group. Its constants and profile controls are uniform before the scale and the two characters are chosen. [Group estimate](AsymmetricRayGroupedSide.lean) · [Uniform version](AsymmetricRayGroupedSideUniform.lean) |
| Labels of the actual source | The decorated source determines the active columns. The packet character identity preserves its punctures. Under the stated root geometry, the frame weight ratio and the sum of weights over labels hitting a given row obey the required bounds. [Source and energy](AsymmetricRaySplitDefs.lean) · [Character identity](AsymmetricRaySplitTwin.lean) · [Ratio and multiplicities](AsymmetricRaySplitGeometry.lean) |

The first open identification is between the residual ideal pool used by `rayLabel` and the one constructed from `sourceColumns s` after substituting the canonical prime slots. The two local hypotheses above still need proofs for the actual source. The off-diagonal bound must then be assembled on both sides of the signed block and returned to the physical integral. [Paid divisor argument](../paid-divisor-transfer.md) · [Required product estimate](../asymmetric-root.md#remaining-estimate-for-a-retained-block). The scalar price here is an allowance for these two physical shapes. The corresponding uniform theorem over *all* shapes with the same total length would require additional estimates. [Source comparison and unresolved implication](../marked-ray-transfer.md).

For a fresh compilation and kernel replay, use Lean 4.34.1 and the compiled imports from tracker revision `c74d855c3bdfceeee059501aea76c8b1627b9abd`. Run from this directory. The replay covers 21 local modules, including the nine added for the second Poisson step, and checks 72 named declarations against the allowed axioms `propext`, `Classical.choice` and `Quot.sound`. The script also checks the name and axiom report for each declaration. It uses the unmodified tracker imports for the direct return.

```sh
bash replay_asymmetric.sh /path/to/challenge-project /path/to/compiled/tracker/lean
```

## Return from a saved detector count

The full-count premise concerns a nonempty, full amplitude class of actual detector rows. Put $U=Z^D$, $\delta=2a-1$ and $p=q/\delta$ with $q$ the full class mean. Write $R$ for the exact marked-window exponent. The estimate is $\#\mathcal C\le CC_0 U^{R(\delta,p)-10^{-7}+\sigma}$ on the following ranges.

| Quantity | Required range |
|---|---|
| Conductor exponent $D$ | $h-10^{-5}\le D\le h+10^{-10}$, with #143's stationary cutoff $h$ |
| Density $\delta$ | $0.425\le\delta\le0.4267$ |
| Full normalized amplitude $p$ | $0.49995\le p\le1/2$ |
| Loss $\sigma$ | $(\beta-17466917/20000000)/10000$, in the case $\beta>17466917/20000000$ |

For fixed chosen source data, height exponent $\tau$ and integer $n$, the constant $C$ is uniform in the external character and the subsequent row, height and class parameters in `SavedCount`. Its statement gives the order of the eventual bound in $Z$, the two detector-height tests, and the hypotheses on the source moment. The full-count bound transfers to the masked mean on the original row set. [Arithmetic quantifiers and transfer](DynamicSourceCount.lean).

At the rational height $0.815324504$, 79 Bernstein rectangles establish normalized margin $10^{-8}$ on five conductor edges. The old, native and marked inequalities use the tracker's own branch values. Only the upper edge uses the saved branch, within its density and amplitude window. Moving to the exact stationary cutoff retains $5\cdot10^{-10}$. Interpolation then proves the comparison for every conductor in range, including both sides of the capacity switch and the start of the saved strip. [Rectangles](TargetEdgeCover.lean) · [Branch comparisons](TargetEnvelopeBounds.lean) · [Exact stationary edges](TargetPhysicalEdges.lean) · [Conductor interpolation](TargetNonfloorSchedule.lean).

Five modified tracker files carry the conductor-dependent branch list through its schedule and physical consumers. The remaining source argument, including the original averaged-floor estimates, initial moments, and transfer to the Hecke zero supremum, is instantiated at the rational target. To inspect or reproduce the result, use Lean 4.34.1 and run the following from a challenge project with its compiled dependencies.

```sh
lake env python3 /path/to/lean/replay_endpoint.py \
  --tracker /path/to/QuasiRiemannTracker \
  --compiled /path/to/compiled/tracker/lean \
  --work /tmp/qrh-endpoint-replay
```

The compiled root contains `Candidate` and `Submissions`. Supply `--compiled` twice if they live in separate roots. The work directory must be empty. The script extracts the affected sources from commit `c74d855c3bdfceeee059501aea76c8b1627b9abd`, applies the five-file patch there, checks the patched hashes and recompiles all 32 affected modules on the proof path. It compiles the local proofs, checks their printed axioms, and runs `leanchecker` on each local and recompiled module. The replay uses existing compiled imports for the rest of the challenge and Mathlib. [Patch](physical-return.patch) · [Replay script](replay_endpoint.py) · [Source and initial-moment assembly](TargetConditionalEndpoint.lean).

The endpoint replay checks 28 printed declarations across 13 local modules and replays those modules together with the 32 tracker modules. Both `TargetReturn.hecke_beta` and `TargetReturn.dirichlet` report `propext`, `Classical.choice` and `Quot.sound`. The arithmetic hypothesis appears in their theorem statements. A second replay below checks the older physical packet and radical lemmas separately.

## Earlier physical and geometry replays

The six theorems in `RadicalPhysical.lean` extend the physical coefficient mass to any nonnegative row-only dilation whose product with the repeated error-prime norms is at most one. They prove admissibility for the actual primitive-and-redundant conductor when the radical norm is at most $U^{1-c}$, the error widths total at most $c/2$, and the gain $b$ is at most $c/3$. The final theorem transfers $b$ to the reflected length in each active bin, at every positive coefficient scale. The subsequent fourth-moment bin assembly, conductor interpolation, and target comparison are supplied in the written argument.

Use Lean 4.34.1 and a compiled challenge project with the Collet physical packet and amplitude-count modules on its Lake search path. The two files directly imported by the radical module have git blob IDs `7781b41058c0d460e0a5dadd3ef073d68fb07bab` and `b3a8103d7f4112407842a4ddd201b6cf250544d7`. Both correspond to tracker #143 head `c74d855c3bdfceeee059501aea76c8b1627b9abd`. All 1,017 transitive submission source files found in the local cache match that revision. Lake warned of local changes in the cached external packages `PrimeNumberTheoremAnd` and `rellich-kondrachov`. This replay checks the new module using the compiled imports. A clean rebuild of every dependency was outside this check. [Pinned physical packet sources](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-10-21-hailey-collet-1252270103/src/Submissions/hailey_collet_1252270103/Cycle25/Numerator/Imported)

The two lemmas in [MaskedLocalCount.lean](MaskedLocalCount.lean) apply to the source's actual finite amplitude class. At each fixed conductor where the extra count is available, take the minimum of the inherited exponent and the saved exponent on the upper amplitude patch. It is antitone on the whole amplitude range, including when the masked mean leaves the patch. The same original amplitude class then satisfies the resulting bound evaluated at its masked mean. The input must count that class with its full amplitude. The mask theorem does not supply this count. Tracker #143 proves the needed antitonicity for the inherited envelope and exact marked count on domains containing this patch. The imported Collet mask source matches tracker blob `b22189696a81a7281cd69282af887285475fa01e`. [Inherited envelope](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveMaskedCount.lean#L18) · [Marked window](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/ExactCountWindow.lean#L117).

[TargetGeometry.lean](TargetGeometry.lean) instantiates Collet's geometry parameters and tracker #143's five coarse bounds for every target from `17466917/20000000` to `87334587/100000000` and every stationary cutoff in the stated rational enclosure. The averaged-floor margin follows at the proposed endpoint from the original `floor_margin_coarse` theorem. These seven declarations cover the geometry and floor comparison. The new conductor schedule above uses these coarse and floor bounds. [Original geometry](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveGeometry.lean) · [Upstream coarse bounds and floor margin](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/BoundsCore.lean).

[LocalPhysicalBranch.lean](LocalPhysicalBranch.lean) puts the additional count into the tracker's admitted branch list. Its four audited declarations check the window endpoints, construct the conditional branch, identify its envelope with the localized minimum and transfer the full-class count to the masked mean. [LocalPhysicalPacket.lean](LocalPhysicalPacket.lean) then applies the source's physical amplitude-class packet directly to this count. Its exponent contains three quarters of the count exponent including the inherited loss. The actual full-class arithmetic saving is a hypothesis of this theorem. The conditional endpoint above uses the conductor-dependent schedule on the nonfloor rows. The central-value route in the [written reduction](../central-values.md) instead directly bounds the physical contribution. [Pinned physical amplitude-class packet](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveAmplitudeClass.lean).

Run from this directory using Lean and Lake 4.34.1. A compiled #143 challenge project containing the original physical packet and its imports needs only the first argument. For a separate compiled tracker module tree, give its root (containing the Candidate and Submissions directories) as the third argument. The optional source checkout pins six directly used modules by Git blob, recompiles them and kernel-replays them. The final replay audits twenty declarations in five local modules against the standard axioms and kernel-checks each module.

```sh
bash replay.sh /path/to/compiled/challenge-project
bash replay.sh /path/to/compiled/challenge-project /path/to/tracker-checkout /path/to/compiled-tracker-modules
```

The physical packet source has blob `8e72b5d45f42aaa81b84beb1f4b3f32383fc4293`. The isolated packet build resolved 1,108 submission and candidate modules, using the existing predecessor cache and signed upstream cache shards for Arvi and Sil. The restored archive and module hashes were checked against the published cache and the module keys against the pinned revision's verification run. Both the source packet and the local wrapper passed kernel replay. [Upstream verification](https://github.com/GTimG/QuasiRiemannTracker/actions/runs/43761452075) · [Published cache](https://github.com/GTimG/QuasiRiemannTracker/releases/tag/submission-build-cache-v2).

Prepared with OpenAI Codex assistance. The application to a QRH bound assumes the preprint’s 7/8 theorem.
