# Verification record and limits

23 October 2026. AI-assisted checks prepared for Subhanjan Das.
Python 3.12.14, SymPy 1.14.0. Exact input identities and pinned revisions
are in INPUTS.json. Floating numerical search is optional and separate.
Its smoke check used NumPy 2.3.5 and SciPy 1.17.0.

| Command / check | Result | What it establishes |
|---|---|---|
| `python certify.py` | Passed: adaptive `True`, 18 boxes, all 12 side conditions, paper point | Unchanged repository Track A baseline only |
| `python auto-research/role-source-caps/return_budget.py --baseline` | Passed; 2,688 normalized coefficients agree exactly with archived Lean source coefficients | Independent Python transcription of Collet's old finite return; no new Lean build |
| `python auto-research/role-source-caps/replay.py` | Passed; complete regenerated receipt equals certificate.json | New graph and specified finite return premises |
| `python auto-research/role-source-caps/flow_check.py` | Passed; three symbolic identities and all 3,911 strict necessary crossing checks | Exact diagnostic algebra, not a limiting or endpoint theorem |
| `python auto-research/role-source-caps/check_controls.py` | Five negative controls passed | Self-dependency, invalid face, missing/duplicate rectangle and Python `-O` are rejected |
| `python auto-research/role-source-caps/search.py --steps 2 --output ...` | Passed | Standalone optional search imports/run; not a proof or full-search reproduction |
| Source-only Lean generator and export checker | Passed as Python generation/fidelity checks | 3,911 exact data/parent translations and 251 generated-file hashes, not Lean semantics |
| Ruff and `git diff --check` | Passed | Code hygiene and whitespace, not mathematical correctness |
| New Lean compilation, transitive axiom audit, kernel replay | **Not completed** | No formal verification of the changed endpoint is claimed |

Saved outputs are in `evidence/`. The exact candidate graph and receipt
are in this directory. The saved numerical diagnostics are explicitly
noncertified and need not be bitwise reproducible across numerical stacks.

## Why these checks are exact

All saved decimal parameters are parsed as fractions. Density polynomials
are constructed directly and cross-checked against a separate cubic
interpolation formula at both width endpoints. Positive Bernstein
coefficients certify the whole closed density interval. Return
polynomials and admissions use exact tensor Bernstein coefficients over
closed rectangles. The cover checker retains domain containment, exact
area and pairwise interior disjointness; it does not replace the rectangle
domain by a grid of sampled points.

The old baseline comparison reads the pinned manuscript cover and original
Lean coefficient expressions. It does not execute or trust an old compiled
object to establish our changed endpoint. The new candidate's receipt
correctly reports zero archived Lean coefficient comparisons: the new
return coefficients differ and are checked by the new rational replay.

The source and return modules refuse Python `-O`. Assertions are therefore
active whenever these scripts claim success. All five rejection controls
are software controls rather than new analytic results.

## Preconditions not discharged by the finite replay

The inherited analytic NF source rule and parameterized physical/Mellin
return must apply uniformly to the actual rows, natural zeros, fixed
twists, independent heights, profiles, source caps, restored coefficients
and common permitted meshes. Their original preprint/Hecke dependencies
remain explicit. The exact graph is not a replacement proof of those
analytic statements.

The source-only Lean exporter is uncompiled. The new admitted windows,
all-conductor bounds, physical schedule, literal numerator and canonical
nonvanishing endpoint still require formal integration. A native Lean
startup failure occurred in the research environment; the unmodified
compiler's executable-path lookup was denied. That does not explain away
the remaining proof work. The supplied handoff must be tested and corrected
against a working pinned compiler before it can count as evidence.

Before describing the changed endpoint as Lean-verified, require successful
compilation of the complete closure, an independently stated canonical
target with no new mathematical assumptions, transitive axiom reports
containing only the intended standard foundations, and fresh kernel replay.
Tracker admission and independent mathematical/semantic review are
separate checks and have not occurred for this candidate.

## Contribution bookkeeping

The proposal follows all five fields in the repository template; README,
the current-state table, append-only ledger and contributor credits are
updated together. Historical audit files, baseline budget code and the
existing independently checked endpoint are unchanged. Current issues,
PR bodies and the results ledger were checked for scope overlap.

The advisory upstream claim-issue request was attempted on 23 October 2026
but GitHub returned `403: Resource not accessible by integration`; no issue
number or successful claim is asserted. This is a focused research handoff
and draft-PR submission. It does not request tracker record admission or
sponsorship redemption. Contact and follow-up can use the submitting
GitHub account; no private contact email is published.
