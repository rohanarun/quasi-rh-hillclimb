# Ten cumulative density-source and return improvements

The final boundary is **theta = 2731076077/3125000000 = 0.87394434464**, a gain of
**10267/12500000000 = 0.00000082136** over the previous
[tracker PR #91](https://github.com/GTimG/QuasiRiemannTracker/pull/91).
Every analytic conclusion remains **conditional on the preprint's 7/8 theorem**
and the inherited source/count/return framework. The target is nonvanishing
of every Dirichlet L-function for `Re(s) > theta`, excluding the principal pole.
This is not yet an admitted tracker record. The earlier #91 boundary passed
the tracker admission checks and remains unmerged at the final frontier check.

Exact certificates pass for all ten rounds.

The complete local Lean 4.34.1 endpoint, canonical statement and seventeen
standard-axiom audits pass. A fresh native-kernel replay accepts all **749
submitted modules plus the canonical audit**. Inherited dependencies are
reused; tracker Comparator/NanoDa/con-ron admission remains separate and
pending. [Endpoint receipt](verification/endpoint-receipt.json),
[axiom audit](verification/canonical-and-axioms.log),
[kernel replay](verification/kernel-all-new-modules.log) and
[verification scope](verification/README.md) record these checks.

The work is by SovereignSteak, substantially assisted by OpenAI Codex, building
on **OpenAI, Hailey Collet, Sil, ArviFoxy, Jacob Sussman and Rohan Arun**.
It extends the wider-density and separate-source work in tracker #89/#90/#91.
Inherited authorship and licenses are retained. The new proof depends only on
merged submissions, including Sussman's [tracker #86](https://github.com/GTimG/QuasiRiemannTracker/pull/86).

Immutable formal source: [complete verified submission](https://github.com/SovereignSteak/QuasiRiemannTracker/tree/4f4e626c1e754a8eec830b991c38f4e1a295cac7/submissions/2026-10-28-density-ten).
The published Git tree equals the locally checked tree; see the
[publication receipt](verification/formal-source.json).

## Ten successive exact improvements

Lower theta is stronger. Each row passed its own source and return certificates
before the next row was registered. All ten were registered before any new Lean
source was generated or checked: see [ledger.json](ledger.json), including
receipt hashes and completion times. The original baseline is
`436972583/500000000 = 0.873945166`.

| Round | Exact theta | Decimal | Gain over previous row | Change |
|---|---|---|---|---|
| 1 | `17478902521/20000000000` | 0.87394512605 | `799/20000000000` | Refine the count chain to Lambda decrement 1/1600 at LOW reserve 1/10000 |
| 2 | `436972497/500000000` | 0.873944994 | `2641/20000000000` | Refine the physical chain to Lambda decrement 1/800, retaining round 1 count source |
| 3 | `87394498959/100000000000` | 0.87394498959 | `441/100000000000` | Reduce the numerical source-gate margins from 2e-6 to 2e-7, with all strict gates exactly rechecked |
| 4 | `87394494041/100000000000` | 0.87394494041 | `2459/50000000000` | Reduce the LOW profile reserve from 1/10000 to 1/100000 and retune both source chains |
| 5 | `43697231383/50000000000` | 0.87394462766 | `1251/4000000000` | Reduce the floor-row proof reserve from 1/200 to 1/250 using the proved transport-loss bound |
| 6 | `87394441941/100000000000` | 0.87394441941 | `833/4000000000` | Increase the physical numerator slot cap from 3/50 to 61/1000 within the proved source cap |
| 7 | `87394435183/100000000000` | 0.87394435183 | `3379/50000000000` | Refine the physical source chain again, to Lambda decrement 1/1600 |
| 8 | `8739443501/10000000000` | 0.8739443501 | `173/100000000000` | Reduce the exact return reserve from 1/100000000 to 1/500000000 while retaining the 1/1000000000 row fee |
| 9 | `21848608627/25000000000` | 0.87394434508 | `251/50000000000` | Reduce the LOW profile reserve from 1/100000 to 1/1000000 and retune both source chains |
| 10 | `2731076077/3125000000` | 0.87394434464 | `11/25000000000` | Reduce the numerical search margin for non-LOW gates to 2e-8, use denser sampling and finer rational parameters, then recheck every source gate exactly |

These are progressively refined constructions. No optimality is claimed.
The final formal endpoint also gives the nine preceding weaker boundaries as
corollaries; the intermediate source chains are recorded as exact arithmetic
certificates, not nine separate full Lean endpoint builds.

## Final construction

The **255-step count chain** starts at #86's final source
`G(9888151/10000000,4683001/2000000,1/10)` and ends at
`G(9767125183289/10000000000000,4364251/2000000,1/10)`.
The **314-step physical chain** starts at #86's boot source
`G(99999/100000,5143/2000,1397/10000)` and ends at
`G(396418568023/400000000000,9501/4000,1/10)`.
Both use Lambda decrement `1/1600` and the proved wider density range `q >= 1/2`.

The final LOW reserve is `1/1000000`; the [LOW-payment argument](low-reserve/LOW-PAYMENT.md)
allows this choice without changing the analytic estimate. Every other source
gate is rechecked. The source certificates cover **7,966 strict gates and 1,707
positive denominators**, with exact LOW and derivative identities.

The return uses height `8059999999/10000000000`, count cap `9999/100000`,
physical source cap `31/500`, numerator slot cap `61/1000`, and certificate
reserve `1/500000000`, strictly exceeding the unchanged row fee `1/1000000000`.
All **240 guards in 16 admission windows**, exact geometry, and **99 rectangles
on four conductor edges** pass. Lean uses a compact 32-row closed cover,
240 admission identities and 40 edge-margin identities.

The [floor-reserve proof](floor-reserve-proof.md) replaces the auxiliary
floor-row margin `1/200` by `1/250`. Existing transport parameter choices charge
at most `11313/500000000000`, below the new reserve. Geometry and loss-budget
uses are changed together in **11 occurrences across eight modules**. The
small-conductor cutoff remains `1/200`; the coarse upper height bound remains
`806/1000`. A consistently renamed 119-module transport closure carries this
change to the endpoint. No preprint `build/paper.tex` lemma or line is changed.

## Exact replay and proof generation

From this directory, with NumPy, SciPy and SymPy installed:

```sh
python low-reserve/low_payment.py
python floor_reserve_check.py /path/to/pinned/tracker
python certify_source.py round10/count.json
python certify_source.py round10/physical.json
python certify_return.py round10/candidate.json
python source/generate_lean.py round10 generated/Source
QRH_LEAN_OUTPUT=generated/Return python return/generate_lean.py round10/candidate.json
```

Replace `round10` by an earlier round for its exact replay. The general
source and return certifiers read each round's own reserves. Full replays do
not require prefix reuse. `certify_derived.py` additionally supports checked
reuse of byte-identical source prefixes, as recorded in rounds 5 and 6.

Source receipts are stored as deterministic `.receipt.json.gz` files; the
SHA256 values in the ledger refer to **decompressed original JSON bytes**.
Identical receipts use relative symlinks. The portable source generator reads
either fresh uncompressed output or the stored compressed receipt. See
[storage manifest](verification/receipt-storage.json).

The numerical search is in [search/](search/README.md). Floating-point results
only select candidates; all claims above use exact certificates and the proved
LOW/floor arguments. [Generation audit](verification/generation-receipt.json)
compares all 593 regenerated Lean files byte for byte. The remaining 156
modules are reviewed transformations of inherited templates.

[Verification scope](verification/README.md) distinguishes local source compilation,
axiom checking and native kernel replay from the tracker's independent admission.
