# Verification record and limits

23 October 2026. Checks run for Subhanjan Das with Claude (Anthropic)
assistance on Python 3.13.17 and SymPy 1.14.0 (exact checks), with NumPy
2.5.3 and SciPy 1.18.1 for the optional search and diagnostics. Pinned
inputs are in `INPUTS.json`. Saved outputs are in `evidence/`.

| Command (from this directory unless noted) | Result | What it establishes |
|---|---|---|
| `python replay.py` | Passed; regenerated receipt equals `certificate.json` ([log](evidence/replay.log)) | Every finite NF premise of the 20,527-stage graph and every finite return premise at θ = 0.87477128, h = 0.80008777 |
| `python check_controls.py --slow` | Six controls passed ([log](evidence/negative-controls.log)) | Self-dependency, invalid face, missing and duplicated cover boxes, and Python `-O` are rejected; the same graph is **rejected at θ = 0.87477127** |
| `python certify.py` (repository root) | Passed: adaptive `True`, all `OK` ([log](evidence/root-certify.log)) | Unchanged Track A baseline only |
| `python return_budget.py --baseline` | Passed; 2,688 coefficients equal Collet's archived Lean coefficients ([log](evidence/collet-baseline.json)) | The return transcription is faithful at Collet's old point; it says nothing formal about the new point |
| `generate.md` commands | Regenerated `sources.json` is byte-identical ([log](evidence/regeneration.log)) | The graph comes from the stated search; the search itself is not proof evidence |
| `python diagnostics/run_diagnostics.py` | Completed ([log](evidence/diagnostics.log), [data](diagnostics/diagnostics.json)) | Floating-point estimates only: refinement table, break-even slopes, failed alternatives, leverage |
| SHA-256 of reused files | Equal to PR #26's files (`INPUTS.json`) | `nf_source.py`, `return_budget.py`, `search.py`, `search_model.py`, `combine.py` are unchanged |
| New Lean compilation, axiom audit, kernel replay | **Not done** | No formal verification of the changed endpoint is claimed |

## Exact counts from the receipt

| Item | Count |
|---|---:|
| Source stages (count + physical) | 20,527 (10,763 + 9,764) |
| Width endpoints | 41,054 |
| Strict scalar gates | 656,864 |
| Weak LOW-cap guards | 41,054 |
| Cubic density polynomials, each with an interpolation cross-check | 369,486 (no subdivision needed) |
| Return boxes / coefficients | 224 / 2,688 |
| Admission windows | 49 |
| Scalar reserves | 33 |
| Smallest return coefficient | ≈ 7.81·10⁻⁹ |
| Smallest admission coefficient | ≈ 1.96·10⁻⁵ |
| Smallest scalar reserve | 10⁻⁶ (both cap margins) |

Canonical graph SHA-256: `aa8595bd4dc44f9c2e4b98985eea03aec0817702ad8f9e5220f5b4a230eabec7`.

## Why the checks are exact

All parameters are parsed as `Fraction`s. Each density polynomial is built
directly and also rebuilt from four point values, and both Bernstein
forms must agree. Positive Bernstein coefficients prove positivity on the
whole closed interval; gates are affine in the width, so the two width
endpoints cover each cell. Return polynomials use tensor Bernstein
coefficients on closed rectangles; the cover is checked for containment,
exact total area and disjoint interiors. The verifiers refuse to run
under `python -O`, so assertions cannot be silently skipped.

## Not discharged here

- That Collet's analytic NF step theorem and parameterized return apply,
  with all their quantifiers, to these 20,527 faces and this return.
  This is the same obligation as for PR #26.
- The inherited preprint and Hecke inputs.
- A compiled Lean endpoint: admitted windows, all-conductor bounds,
  `PhysicalSchedule`, the literal numerator and the canonical theorem,
  followed by axiom audits and a kernel replay.
- Independent human review. Tracker admission is a separate process.

## Bookkeeping

- Base: upstream `main` at `e4cf5a2`. Nothing from PR #26 or any other
  open PR is modified; the reused verifier files are copies.
- `README.md`, `auto-research.md` (current-state table),
  `auto-research/results.md` (new row appended) and `CONTRIBUTORS.md`
  (new row) are updated together. Old rows and audit files are unchanged.
- Advisory `[claim]` issue: not opened, because this session has no write
  access to the upstream issue tracker. The work is small and fully
  delivered in this PR.
