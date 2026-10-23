# Pinned source map

This proposal is based on upstream revision
`e4cf5a2b1f967746b36606d3352549ee598e373f`. The original research checkout
began at `fb86f0d7a31c912d87df05371c9218d49f0c5346`; relevant inherited
manuscript/archive hashes are pinned in INPUTS.json. Existing audit reports
are preserved unchanged and are not claimed to cover the changed endpoint.

## Original preprint: inherited context, no new patch

Revision `fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb`,
`preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex`,
Git blob `268c4e3206d460c617d3d2129742a72b831b3def`:

| Lines / label | Role here |
|---|---|
| 8111–8325, `lem:probe-row-norm` | Inherited compensated-row machinery; the historical correction is discussed in AUDIT_SUMMARY.md, not reproved here |
| 12531–12579, `lem:plain` | Original short-prime moment, inherited through Collet's stronger source framework |
| 15172–15180, `eq:plain-zero-loss-capacity` | Background capacity accounting; not an independent certificate for this graph |
| 15994–16048, `lem:balanced-endpoint` | Original frozen Track A endpoint; this source/return proposal does not merely rerun it at a new parameter |

The original preprint can be inspected at its
[pinned revision](https://github.com/openai/math/blob/fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex).

## Direct analytic interface: Collet's manuscript

Paths below are under `submissions/hailey-collet-1252270103/paper/` at
the pinned upstream revision:

| File and lines | Statement | Use |
|---|---|---|
| `feedback.tex` 254–271 | NF1–NF2 | Full globally downward ordinary-source domain and independent natural premise |
| `feedback.tex` 274–325 | NF4, NF8–NF10 | Source parameters, parent crossing, affine scalar gates and weak LOW-cap guard |
| `feedback.tex` 327–404 | NF11–NF15 | All regular/special HIGH gates, positive denominators and cubic Bernstein certificate |
| `feedback.tex` 406–430 | Accounting and induction | Fixed positive losses and common permitted meshes; no new infinite induction |
| `return.tex` 10–46 | NR1–NR2 | Same-zero witness, affine/capped counts and admissions |
| `return.tex` 48–95 | NR3–NR7 | Geometry, capacities, fixed joins, six endpoints and exact return positivity |
| `return.tex` 97–147 | NR8–NR10 | Shortenings, shifts, contrary-supremum comparison and Mellin return |

## Lean interfaces: source-only handoff, not a new checked proof

Paths are inside the unchanged `lean-sources.zip`, under
`src/Submissions/hailey_collet_1252270103/`:

| File and line | Declaration |
|---|---|
| `Record1252270103Finite/SourceFormulas.lean:83` | `SourceValid` |
| `Record1252270103Graph/GraphContract.lean:11,15,28` | `P`, `NFAccounting`, `NFStep` |
| `Record1252270103Graph/FinalSources.lean:10` | `final_natural_cap` |
| `Record1252270103Source/Core/Endpoint.lean:13` | `nf_step` |
| `Record1252270103Return/Geometry.lean:5` | `Geometry.Parameters` |
| `Record1252270103Return/TransportGeometry.lean:9` | `Geometry.Bounds` |
| `Record1252270103Return/AdmittedWindow.lean:10` | `AdmittedWindow` |
| `Record1252270103Return/Schedule.lean:29` | `PhysicalSchedule` |
| `Record1252270103Return/PhysicalDirect/ChosenSource.lean:79` | `chosen_initial_source_of_uniform_faces` |
| `Record1252270103Return/Transport/FinalCommonProbe.lean:35` | `beta_le_theta_of_finite_numerator` |

The source-only exporter calls these inherited source interfaces. The
new return instantiation and final canonical theorem remain unfinished.
Successful old endpoint receipts or similarly named new files are not
evidence that the changed endpoint has compiled.

## Python transcription and extraction

`nf_source.py` transcribes the NF scalar and density gates. It computes
polynomials directly and separately reconstructs the cubic coefficients
from values at `0,1,-1,2`, following the archived Lean evaluation interface.
The equality of both Bernstein representations is checked at every saved
stage and width endpoint.

`return_budget.py` reconstructs the inherited NR budget and original
closed cover, binding `certificates.tex` by SHA-256. Its `--baseline`
mode additionally checks the unchanged Lean archive and exact normalized
coefficients. `certify.py` adapts admissions and return positivity to the
new selected sources, substitutes their actual global caps, and restores
module parameters after use. These modules were extracted from our earlier
private replay so this submission has no dependency on unpublished sibling
research directories.
