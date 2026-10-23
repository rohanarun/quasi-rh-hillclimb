# Inverse slot capacity: Lemma S and the column-branch obstruction

**Subhanjan Das (@subhanjandas) · 23 October 2026**

Prepared with substantial assistance from Claude (Anthropic).

> **Status: proposal (structural) with a proved partial lemma and a proved
> obstruction.** No new zero-free boundary is claimed. Lemma S is proved
> (written proof; analytic core checked in Lean with Heath-Brown's cubic large
> sieve as an explicit hypothesis). The obstruction is exact algebra checked in
> Lean. The needed column-branch estimate is **not** proved.

Supporting documents: [account](../inverse-capacity/README.md) ·
[research log](../inverse-capacity/RESEARCH_LOG.md) ·
[Lemma S and the obstruction](../inverse-capacity/STRUCTURED_MARK.md) ·
[anatomy and payoff](../inverse-capacity/INVERSE_CAPACITY.md) ·
[cubic-sieve trace and barrier](../inverse-capacity/CUBIC_SIEVE_BARRIER.md) ·
[verification](../inverse-capacity/VERIFICATION.md) ·
[Lean](../inverse-capacity/lean/README.md) ·
[roadmap](../inverse-capacity/ROADMAP.md) ·
[failed branches](../inverse-capacity/FAILED_BRANCHES.md)

Line numbers refer to `openai/math` revision
`fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb`, `build/paper.tex`
(git blob `268c4e3206d460c617d3d2129742a72b831b3def`).

## 1. Change

The input that changes is the **slot capacity of the marked inverse moment**,
z_M(r) = (1−r)/2, which comes from the first condition r + 2z ≤ m − c₁ of
`lem:marked` (9250). It enters the same-zero count through
`prop:detector-counts` (15185, capacity text just before it) and, in Collet's
framework (PR #8), through FR4/NR2 and the HIGH facets HF3.

Its proof chain: initialization of `lem:marked` (11601–12340; margins at
12206–12211) → canonical invariant `eq:inverse-fixed-invariant` (9807) →
terminal reflected energy `lem:reflected-energy` (7747, `old-eq:4.6`/`4.7`,
row branch 9901–9906, column branch `old-eq:4.10` at 9910 with
`eq:inverse-terminal-width` at 9884) → `lem:hybrid-energy` (7510) → Heath-Brown's
cubic large sieve `eq:cubic-large-sieve` (7491).

## 2. Needed statement

**Proved here (Lemma S).** After cubic reflection the tuple coefficient of the
active slot primes has the form A(P) = ∏ c(p) · ∏_{p<q} (q/p)₃^{±2}
(`eq:reflection-cross-prime-phase` 2271, `eq:reflection-pair-phase` 7446).
Splitting the slots into two groups of lengths z₁ + z₂ = z_a, for every column
ideal j in the reduction of `lem:hybrid-energy`,

  |Σ_{P'} A(P') q_{P'}^{−1/2} χ_{P'}(j)^{−2}|² ≪_ε Z^ε (Z^{z₁} + Z^{z₂} + Z^{2z_a/3}).

For balanced groups this is a saving of at least z_a/3 for every dual length,
whereas `old-eq:4.7` gives u = min{v, z_a, (v+z_a)/3}, which vanishes as v → 0.

**Needed (open): the column-branch estimate.** In `lem:reflected-energy`, for
retained dyads whose dual length exceeds the residual row length, a bound whose
dual-length term grows by less than 2z_a in the active mark length, uniformly
with the preprint's masks, punctures, profiles and heights. Together with
Lemma S it would give the capacity (1−r)/λ with λ = 5/3. A full removal of the
mark charge would give λ = 1.

## 3. Payoff

Floating-point what-if (`scripts/lam_whatif.py`, Collet's return with sources at
PR #27's faces; model value at λ = 2 is 0.8747710):

| λ | Second condition 2r + 8z ≤ 3m | θ (model) | Gain |
|---|---|---:|---:|
| 5/3 (column target + Lemma S) | kept | 0.87387 | 9.0·10⁻⁴ |
| 1.5 | relaxed with λ | 0.87315 | 1.62·10⁻³ |
| ≤ 1.25 | relaxed with λ | 0.87281 | 1.96·10⁻³ (prime supply binds) |
| ≤ 1.5 | kept | 0.87327 | 1.50·10⁻³ (second condition binds) |

All θ values are conditional on the preprint's 7/8 theorem. All progress below
7/8 to date is 2.29·10⁻⁴. `whatif.py` does not apply: this
is Collet's source/return budget, not the frozen Track A model. Any θ below
13/15 is impossible in this probe family (Lean: `theta_gt_13_15`).

## 4. Evidence

- **Lemma S**: written proof (`STRUCTURED_MARK.md` §2); Lean
  `LemmaS.structured_mark_bound`, `balanced_saving`, `saving_floor`.
- **Obstruction**: Lean `BranchAlgebra.capacity_unchanged`,
  `column_branch_iff`, `row_branch_iff`, `mixed_branch_iff`, and the
  preprint's own margin identities `first/second_margin_identity`; SymPy
  cross-check `scripts/branch_algebra.py`.
- **Anatomy**: Lean `CountAnatomy.crossing_value`; exact weights
  `scripts/weights.py`.
- **Lean evidence**: 19 theorems, standard axioms only, fresh `leanchecker`
  replay exit 0, negative controls rejected (`lean/evidence/`).
- **Barrier**: Dunn–de Faveri–Hoffstein, arXiv:2607.07911, Thm 1.1 (Heath-Brown's
  cubic sieve is sharp for arbitrary coefficients).

Why the column target is plausible, and what argues against it, is discussed
in `STRUCTURED_MARK.md` §4 (cancellation in twisted cubic theta coefficients;
keeping marks out of the conductor) and `CUBIC_SIEVE_BARRIER.md`.

## 5. What breaks

Nothing in the preprint or in Collet's proof changes from this contribution.
A future column-branch estimate would change: the canonical invariant
(9807) and its preservation through the recursion (9945–11600, e.g. 11094);
the initialization margins (12206–12211); `lem:marked`'s first condition and
hence `prop:detector-counts`; Collet's FR4/NR2 counts, FR8 admission windows
and HF3 facets, with every finite source and return certificate recomputed.
The second marked condition (`old-eq:4.11`) becomes binding at λ ≤ 1.5 and
would need the same treatment.

## Credits, AI disclosure and licensing

OpenAI (preprint), Hailey Collet (PR #8 framework and return), D. R. Heath-Brown
(cubic large sieve), A. Dunn, A. de Faveri and J. Hoffstein (sharpness), Rohan
Arun and the repository's contributors (audit and tools), PR #26/#27 (verifiers
and return model). These credits do not imply review or endorsement.
**Subhanjan Das** directed the research and submits it; **Claude (Anthropic)
substantially assisted** with the analysis, proofs, Lean formalization, code
and writing. Independent mathematical review is outstanding. MIT License for
new material; see `../inverse-capacity/NOTICE.md`.
