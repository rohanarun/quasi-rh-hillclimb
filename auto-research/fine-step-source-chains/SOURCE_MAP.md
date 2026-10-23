# Pinned source map

Base: upstream `main` at `e4cf5a2b1f967746b36606d3352549ee598e373f`.
This directory changes **no** analytic statement. It instantiates the
same interfaces as PR #26 with a finer finite graph. Hashes of every input
are in `INPUTS.json`.

## Analytic interface (Collet's manuscript, unchanged)

Paths under `submissions/hailey-collet-1252270103/paper/`:

| File and lines | Statement | Use here |
|---|---|---|
| `feedback.tex` 254–271 | NF1–NF2 | Ordinary-source domain; natural premise G(1, 4.4973108, 11/200) |
| `feedback.tex` 274–325 | NF4, NF8–NF10 | Per-stage parameters, parent crossing, scalar gates, weak LOW-cap guard |
| `feedback.tex` 327–404 | NF11–NF15 | Regular and special HIGH gates, cubic Bernstein density certificate |
| `feedback.tex` 406–430 | Accounting, induction | Tight schedule (e, r, f) = (1e-17, 1e-12, 1e-10); finite acyclic induction |
| `return.tex` 10–46 | NR1–NR2 | Same-zero witnesses; affine/capped counts; admissions |
| `return.tex` 48–95 | NR3–NR7 | Geometry, capacities, joins, six endpoints, return positivity |
| `return.tex` 97–147 | NR8–NR10 | Shortenings, shifts, contrary supremum, Mellin contradiction |

## Original preprint (inherited context only)

`openai/math` revision `fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb`,
`preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex`:

| Lines / label | Role |
|---|---|
| 8111–8325, `lem:probe-row-norm` | Compensated row norm, inherited through Collet |
| 12531–12579, `lem:plain` | Short-prime plain moment, inherited |
| 15994–16048, `lem:balanced-endpoint` | Original Track A endpoint; **not** reused for this point |

No line of `paper.tex` is edited by this proposal.

## Lean interfaces (for the remaining formal work)

Inside the unchanged `lean-sources.zip`, under
`src/Submissions/hailey_collet_1252270103/`:

| File | Declaration |
|---|---|
| `Record1252270103Finite/SourceFormulas.lean` | `SourceValid` |
| `Record1252270103Graph/GraphContract.lean` | `P`, `NFAccounting`, `NFStep` |
| `Record1252270103Source/Core/Endpoint.lean` | `nf_step` |
| `Record1252270103Return/Geometry.lean` | `Geometry.Parameters` |
| `Record1252270103Return/AdmittedWindow.lean` | `AdmittedWindow` |
| `Record1252270103Return/Schedule.lean` | `PhysicalSchedule` |
| `Record1252270103Return/Transport/FinalCommonProbe.lean` | `beta_le_theta_of_finite_numerator` |

These are the declarations a Lean endpoint for this graph would
instantiate. No Lean file is generated or compiled here.

## Python transcription

`nf_source.py` transcribes NF4/NF8/NF10–NF15 (32 strict scalar gates, two
weak guards and 18 cubic density polynomials per stage, each cross-checked
against an independent four-point interpolation). `return_budget.py`
transcribes NR1–NR7 and reads Collet's closed cover from
`certificates.tex`, pinned by SHA-256. `certify.py` refines that cover
where needed, recomputes admissions and positivity at the new geometry,
and substitutes both actual source caps into the final reserves.
