# Verification record and limits

23 October 2026. Run for Subhanjan Das with Claude (Anthropic) assistance.
Python 3.13.17 with SymPy 1.14.0 (exact checks); NumPy 2.5.3 and SciPy 1.18.1
(floating-point models). Lean 4.34.1, Mathlib `d13f23b`.

| Command | Result | What it establishes |
|---|---|---|
| `cd lean && lake build` | 1,537 jobs, no errors or warnings | All four modules compile |
| `cd lean && lake env lean AxiomAudit.lean` | 19/19 theorems depend only on `propext`, `Classical.choice`, `Quot.sound` ([log](lean/evidence/axiom-audit.log)) | No `sorry`, no extra axioms |
| `cd lean && lake env leanchecker --fresh --verbose QRHResearch` | Exit 0 ([log](lean/evidence/kernel-replay.log)) | Fresh Lean kernel replay of the whole closure |
| `cd lean && lake env lean controls/NegativeControls.lean` | Both false statements rejected ([log](lean/evidence/negative-controls.log)) | The checks are not vacuous |
| `python scripts/branch_algebra.py` | Passes its assertions | SymPy cross-check of the branch algebra |
| `python scripts/weights.py` | Weights 0.506 / 0.185 / 0.309 | Exact rational anatomy at the binding point |
| `python scripts/lam_check.py` | Generic three-line count equals Collet's N/J at λ = 2 | Validates the what-if model |
| `python scripts/lam_whatif.py --second {none,fixed} λ` | Saved in `results/` | Floating-point payoff estimates only |

Source hashes and the build environment: [`lean/evidence/environment.json`](lean/evidence/environment.json).
The Mathlib download cache was unreachable from the build machine, so the
imported Mathlib modules were compiled from source at the pinned revision.

## Not established here

- No zero-free region, new θ or Lean endpoint is claimed by this folder.
- Heath-Brown's cubic large sieve and the residue-symbol factorization of
  the reflected tuple coefficient are hypotheses of the Lean statements;
  the factorization is a written argument from the preprint's formulas.
- That the formalized inequalities are the requirements of the preprint's
  terminal branches is a written derivation (paper.tex 9884–9935); the
  preprint's analytic inequalities themselves are not formalized.
- The λ payoff numbers come from a floating-point model with sources held at
  PR #27's faces, a δ grid of 0.01 and no admission windows.
- Independent human review has not taken place.

## Bookkeeping

Base: upstream `main` at `e4cf5a2`. `README.md`, `auto-research.md`,
`auto-research/results.md` and `CONTRIBUTORS.md` are updated together; no
existing row, audit file or other PR is modified. No `[claim]` issue was
opened, because this session has no write access to the upstream tracker.
