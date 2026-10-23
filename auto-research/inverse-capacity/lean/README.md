# Lean formalization of the inverse-capacity analysis

Subhanjan Das (@subhanjandas), with substantial assistance from Claude
(Anthropic). 23 October 2026. MIT License.

Lean `v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
the same toolchain and Mathlib revision as Hailey Collet's PR #8 archive.

## What is verified, and what is not

| Module | Theorem(s) | What it establishes | Hypotheses taken from outside Lean |
|---|---|---|---|
| `BranchAlgebra` | `first_margin_identity`, `second_margin_identity` | The two margin identities the preprint records at paper.tex 12206–12211, from its defining relations (11751, 11909) | The defining relations themselves (definitions, stated with line numbers) |
| `BranchAlgebra` | `column_branch_iff`, `row_branch_iff`, `mixed_branch_iff`, `capacity_unchanged` | At the initialization of `lem:marked`, the column-branch requirement is `r + 2z < m`; a structured mark saving `κz` relaxes only the row branch; both together are equivalent to `r + 2z < m` for every `κ ≥ 0` | That these inequalities are the requirements of the three terminal branches (derived in `../STRUCTURED_MARK.md` §3 from `old-eq:4.10`, `old-eq:4.11`, `eq:inverse-terminal-width`) |
| `GeometryFloor` | `theta_gt_13_15`, `theta_of_ell` | `ℓ = 11/3 − 4θ` and `ℓ < 1/5` force `θ > 13/15` | Collet's NR3 geometry |
| `GeometryFloor` | `gain_*`, `progress_below_seven_eighths` | Exact rational bookkeeping of the quoted gains | None |
| `CountAnatomy` | `crossing_weighted_mean`, `crossing_value` | The same-zero count is the reciprocal-slope weighted mean of the three witness-line intercepts | That the count is the crossing of those three lines (preprint `prop:detector-counts`) |
| `LemmaS` | `bilinear_bound`, `structured_mark_bound` | A factorized tuple coefficient whose kernel satisfies a large-sieve inequality obeys the bilinear bound `Δ‖α‖²‖β‖²` | Heath-Brown's cubic large sieve (as the hypothesis `LargeSieve K Δ`) and the residue-symbol factorization of the tuple coefficient (as `hA`) |
| `LemmaS` | `balanced_saving`, `saving_floor` | For balanced slot groups the saving is at least `z/3`, for every dual length | None |

The 19 theorems, all listed in `AxiomAudit.lean`:
`BranchAlgebra` (6): `first_margin_identity`, `second_margin_identity`,
`column_branch_iff`, `row_branch_iff`, `mixed_branch_iff`, `capacity_unchanged`;
`GeometryFloor` (7): `theta_gt_13_15`, `theta_of_ell`, `gain_over_pr27`,
`gain_pr27_over_pr26`, `gain_pr27_over_pr8`, `gain_adaptive_over_pr8`,
`progress_below_seven_eighths`;
`CountAnatomy` (2): `crossing_weighted_mean`, `crossing_value`;
`LemmaS` (4): `bilinear_bound`, `structured_mark_bound`, `balanced_saving`,
`saving_floor`.

**Not verified in Lean:** any zero-free region. In particular the
conditional θ = 0.87477127 (adaptive caps) and θ = 0.87477128 (PR #27)
are checked only by the exact rational Python replays; their Lean
endpoints would need Collet's full source/return formalization
re-instantiated with the new graphs (see the PR description).

## Reproduce

```sh
# Lean 4.34.1 (elan or the official release), then:
cd auto-research/inverse-capacity/lean
lake build                      # builds the needed Mathlib modules and QRHResearch
lake env lean AxiomAudit.lean   # every theorem: [propext, Classical.choice, Quot.sound] or fewer
lake env leanchecker --fresh QRHResearch   # fresh kernel replay
lake env lean controls/NegativeControls.lean   # must FAIL: both false statements rejected
```

The Mathlib download cache was not reachable from the build machine, so
the Mathlib modules were compiled from source; see `evidence/`.
