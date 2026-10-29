# Four cumulative source/return improvements

The strongest exact candidate is
`theta = 436972583/500000000 = 0.873945166`, with
`h = 402563361/500000000`. All analytic conclusions remain conditional
on the preprint's **7/8 theorem** and the inherited source/count/return
framework. The Dirichlet nonvanishing statement excludes the principal pole.

Exact certificates pass for all four rounds.

The complete local Lean 4.34.1 endpoint, canonical statement and nine
standard-axiom audits pass. A fresh native-kernel replay accepts all **263
submitted modules plus the canonical audit**. Inherited dependencies are
reused; tracker Comparator/NanoDa/con-ron admission remains separate and
pending. [Endpoint receipt](verification/endpoint-receipt.json),
[axiom audit](verification/canonical-and-axioms.log),
[kernel replay](verification/kernel-all-new-modules.log) and
[verification scope](verification/README.md) record these checks.

The starting point is the locally verified, pending [tracker PR #90](https://github.com/GTimG/QuasiRiemannTracker/pull/90),
`8739461/10000000`. The merged tracker record at the inspected base remains
Jacob Sussman's [PR #86](https://github.com/GTimG/QuasiRiemannTracker/pull/86),
`4369779/5000000`. Pending results are not described as admitted records.

| Round | Exact boundary | Decimal | Gain over preceding point | Change |
|---|---|---|---|---|
| 1 | `873945927/1000000000` | 0.873945927 | `173/1000000000` | Count chain: 124 steps, Lambda decrement `1/800`; jointly select the terminal source and return height |
| 2 | `436972827/500000000` | 0.873945654 | `273/1000000000` | Physical chain: 77 steps, decrement `1/400`; retain round 1's count source |
| 3 | `436972809/500000000` | 0.873945618 | `9/250000000` | Count chain: 249 finer steps, decrement `1/1600`; retain round 2's physical source |
| 4 | `436972583/500000000` | 0.873945166 | `113/250000000` | Prove a smaller LOW reserve `1/10000` suffices; retune both chains |

The total gain over #90 is exactly `467/500000000 = 0.000000934`.
The chronological [ledger](ledger.json) binds each round to exact source
and return receipts. Its four completion timestamps precede the recorded
start of Lean work. Numerical optimization selected rational candidates;
acceptance used exact arithmetic. No optimality claim is made.

## Final construction

The final count source is
`G(97697347983/100000000000, 4370501/2000000, 1/10)`.
It follows from #86's final source by 125 transitions of Lambda decrement
`1/800`. The separate physical source is
`G(6195261783/6250000000, 2379/1000, 1/10)`, obtained by 77 transitions
of decrement `1/400` from #86's boot source
`G(99999/100000, 5143/2000, 1397/10000)`.

Each transition has 14 strict scalar gates and three positive denominators:
2,828 gates and 606 denominators in the final two chains. The LOW and
selection-derivative identities hold exactly. Count admission uses 16
windows and 240 guards. The scalar return certificate covers the entire
parameter rectangle with 97 rectangles, checking all four conductor edges
on each. The Lean generator uses the inherited compact 32-row edge layout,
subdivided into 38 positive polynomial certificates, plus the 240 admission
identities and a proved closed cover. These are two covers of the same
inequalities, not equal counts of proof objects.

The [LOW payment proof](low-reserve/LOW-PAYMENT.md) explains the fourth
advance. Replacing the profile coefficient `999/1000` by `9999/10000`
preserves the payment argument with reserve `1/10000`. The affected formal
definitions and identities are in `Source/HybridGates.lean`; the sole
payment-premise change is in `Density/StepGates.ds_low_aux`. The proof body
of that lemma is unchanged. The unrelated small-height bounds `e < 1/1000`
are retained. The natural constant `9/2`, row coefficient `3/4`, count cap,
physical cap and final return reserve `1/100000000` are retained.

The final submission includes the required widened-density API from
[tracker #89](https://github.com/GTimG/QuasiRiemannTracker/pull/89), with
separate module and declaration namespaces. It depends only on merged
submissions. No preprint estimate is strengthened or edited; the advance
changes the auxiliary density profile inside the existing source-step proof.
See the [proposal and affected proof locations](../proposals/2026-10-28-density-batch.md).

## Replay

With Python and SymPy installed, run these commands from this directory:

```sh
python certify_source.py round1/count.json
python certify_source.py round2/physical.json
python certify_source.py round3/count.json
python low-reserve/low_payment.py
python low-reserve/certify_source.py round4/count.json
python low-reserve/certify_source.py round4/physical.json
python certify_return.py round1/candidate.json
python certify_return.py round2/candidate.json
python certify_return.py round3/candidate.json
python certify_return.py round4/candidate.json
python source/generate_lean.py round4 generated/Source
QRH_LEAN_OUTPUT=generated/Return python return/generate_lean.py return/candidate.json
```

The source commands overwrite their adjacent receipt, including elapsed
time, so a fresh receipt's byte hash can differ from the archived ledger.
Its exact cases and bounds should agree. Shared sources need one replay:
round 2 retains round 1's count, and round 3 retains round 2's physical.
Round 1's physical source is the already verified #86 step-38 source,
exposed in #90. Each original source/receipt hash is preserved in the ledger.

The two `scalar.py` versions deliberately retain their separate reserve
values. Use `certify_source.py` for rounds 1–3 and
`low-reserve/certify_source.py` for round 4. They are finite arithmetic
certifiers; the complete analytic endpoint additionally requires Lean.
The generators produce arithmetic modules and source chains; the submitted
analytic templates are identified by the formal source commit and
[template review](verification/inherited-proof-review.json).

[Verification scope](verification/README.md) distinguishes local native
Lean checks from the tracker's separate admission process.

## Credit

Contributed by **SovereignSteak**, with substantial **OpenAI Codex**
assistance in research, search, exact certification and formalization.
Builds on **OpenAI**, **Hailey Collet**, **Sil**, **ArviFoxy**,
**Jacob Sussman** and **Rohan Arun**, and the preceding #89/#90 results.
Inherited authorship and Apache-2.0 notices in the formal proof are retained.
This research bundle follows this repository's contribution license.

The advisory claim is [research issue #35](https://github.com/rohanarun/quasi-rh-hillclimb/issues/35).
Immutable source pins and publication links are recorded in
[provenance.json](provenance.json).

[Complete locally verified formal source](https://github.com/SovereignSteak/QuasiRiemannTracker/tree/c67a1450476b10e200e1bc095748dc4889ba40d5/submissions/2026-10-28-density-batch).
The published Git tree matches the checked source exactly.
