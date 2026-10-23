# The dominant lever: slot capacity of the marked inverse moment

23 October 2026. Subhanjan Das (@subhanjandas), with substantial assistance from
Claude (Anthropic).

> **Update (see `STRUCTURED_MARK.md`).** The capacity (1−r)/2 is forced
> twice in the preprint's terminal estimate, by the row branch (cubic large
> sieve) and by the column branch (dual length). The payoff table below is
> what an improvement of *both* would buy.
**Status: analysis and proposal.** Nothing here is a proved improvement.
All θ values below are floating-point what-if estimates.

## 1. Where θ is decided

In Collet's return (PR #8, NR6), at the certified PR #27 point, the
largest term at the binding point (edge `new_top`, δ ≈ 0.458, p = 1/2)
is the same-zero count (3/4)·d·R\* ≈ 0.36. Lowering the return exponent
there by ε lowers θ by about 0.22ε (`auto-research/fine-step-source-chains/diagnostics/diagnostics.json` in [PR #27](https://github.com/rohanarun/quasi-rh-hillclimb/pull/27)).

R\* comes from three witness lines of the preprint's
Prop. `detector-counts` (paper.tex 15185–15475), used verbatim by
Collet's FR4/NR2:

| Line | Formula | Origin |
|---|---|---|
| Inverse | I(r) = 1 − δr − 2δp·z_M(r), z_M(r) = (1−r)/2 | `lem:marked` (9250) with prime slots |
| Plain | P(m) = 1 − 2δm − 2δp·z_P(m) | `lem:plain`, improved by Collet's source faces |
| Long | L(t) = 1 − α + (α − δ)t, α = 5/6 | `lem:inverse-amplification` (12362) |

Because the three lines are affine and meet at one point with r + m = t,
the count is a **weighted mean of their intercepts, with weights equal to
the reciprocals of their slopes** (exact identity: `scripts/weights.py`; Lean: `lean/QRHResearch/CountAnatomy.lean`):

| Line | Weight at the binding point |
|---|---:|
| Inverse | **0.506** |
| Long (sixth power) | 0.309 |
| Plain (source faces) | 0.185 |

So the inverse line carries half the weight, and its slope is set by the
capacity z_M(r) = (1−r)/2. This explains two facts already observed: the
source chains (plain line) and the sixth-power slope α move θ very little.

## 2. Where the coefficient 2 comes from (exact location)

`lem:marked` requires, at row width m,

  r + 2z ≤ m − c₁,  2r + 8z ≤ 3m − c₂.

At m = 1 the first condition gives the capacity z_M(r) = (1−r)/2.

The proof of `lem:marked` (paper.tex 11601–12340) applies one Poisson
transformation and passes to the canonical family of
`lem:canonical-moment` (9296), whose invariant (`eq:invariant`, 9317) is

  q_ρ ≤ Z^{F₀ − M − z₀ − c*},  3M + 6z₀ + c* ≤ 4F₀.

At initialization the column length is D′ = r + z − 2G, the mark cap is
z₀ = z − G, the dual row length is M = 2D′ − m − 2P₁ (`eq:inverse-initial-row`,
11751) and F₀ = D′ − P₁. The paper records the resulting margins
explicitly (12206–12211):

  F − M − (P₁ + G) − z₀ = m − r − 2z + 2G,
  4F − 3M − 6z₀ = 3m − 2r − 8z + 10G + 2P₁.

**The slot length z is charged once through the column length D′ and a
second time as the mark cap z₀ in the canonical invariant.** That second
charge is the whole source of the coefficient 2. An optimal large-sieve
heuristic (rows ≥ total column length) would give r + z ≤ m, i.e.
coefficient 1.

For comparison, the general sextic large sieve the paper also proves
(`lem:sextic-large-sieve`, 4707: K + D + (KD)^{2/3}) gives only
r + z ≤ m/2 here. The marked moment already beats it by exploiting the
Möbius/product structure; the open question is whether it can stop
charging the mark twice.

## 3. Payoff

Model: `scripts/lam_whatif.py` recomputes R\* from the three lines with slot
coefficient λ (λ = 2 in the preprint) for all count candidates (both
source faces and the old natural count), keeps the prime-supply cap
z ≤ ℓ/d, scans all conductor endpoints and optimizes h. The preprint's
second condition 2r + 8z ≤ 3 is handled in two ways: **relaxed** (it
improves together with the first; then the supply cap binds before it,
so this equals dropping it) and **fixed** (only the first condition
improves). Source faces are held at PR #27's values,
and the source chains themselves (whose HIGH facets use the same
capacity, Collet HF3) are **not** re-run, so the gains are underestimates
in that respect. Admission windows are not modelled, which makes the
λ = 2 value 3·10⁻⁷ lower than the exact model; differences are reported
against the model's own λ = 2 value.

| Slot coefficient λ | Second condition | θ (model) | Gain over model λ = 2 | What binds next |
|---|---|---:|---:|---|
| 2 (preprint) | — | 0.8747710 | — | inverse capacity (1−r)/2 |
| 1.75 | relaxed with λ | 0.8741504 | 6.2·10⁻⁴ | inverse capacity |
| 1.5 | relaxed with λ | 0.8731508 | 1.62·10⁻³ | inverse capacity (binding δ moves to 0.38) |
| 1.25 or 1 | relaxed with λ | 0.8728094 | 1.96·10⁻³ | **prime supply** z ≤ ℓ/d |
| 1.5 or 1 | fixed (2r + 8z ≤ 3) | 0.8732702 | 1.50·10⁻³ | **second condition** z ≤ (3 − 2r)/8 |

For scale: all progress below 7/8 to date (0.875 → 0.87477128) is
2.29·10⁻⁴, so these gains are 2.7 to 8.6 times everything achieved so
far; all remaining finite tuning is about 10⁻⁸. Raw logs and
`results/lambda_payoff.json` are in `results/`.

Hand check at the old binding point (`scripts/weights.py`, exact rationals, caps
ignored): R\* falls by 0.0016, 0.0046, 0.0119, 0.0254 and 0.0589 for
λ = 1.9, 1.75, 1.5, 1.25 and 1.

## 4. Needed statement (proposal)

**Target lemma (marked inverse moment with improved slot capacity).**
For some fixed λ < 2: under r + λz ≤ m − c₁ (and the second condition
unchanged or similarly relaxed),

  Σ_{0<q_u≪Z^m} |M_u(Z^r; W) Q_u|² ≪ Z^{m+ε},

with exactly the coefficient, mask, puncture, profile and height
conventions of `lem:marked`.

A sufficient route is a canonical estimate (`lem:canonical-moment`)
whose puncture/row invariant charges the mark cap only partially:
q_ρ ≤ Z^{F₀ − M − (λ−1)z₀ − c*}. Any such λ feeds both the return count
(Collet FR4/NR2: z_* = (1−r)/λ) and the HIGH facets of the source rule
(Collet HF3: z_I = min(S, (Q−r)/λ)).

## 5. Why this is plausible, and what argues against it

For: the prime slots are products of short prime sums with fixed
coefficients; in the dual (after Poisson) they need only be carried as
a mark. The overlap case already earns +2G back in the margin, showing
the accounting is not tight for every configuration. The no-slot case
already reaches the optimal r ≤ m.

Against: Dunn, de Faveri and Hoffstein (arXiv 2607.07911, July 2026)
prove that the cubic and quartic large sieves are **not** perfectly
orthogonal; the obstruction is the bias of Gauss sums (Kubota/Patterson
series). A sextic analogue would bound how far general-coefficient
sieves can go. The marked moment uses Möbius-type coefficients, which
are not expected to correlate with theta coefficients, so the
obstruction does not obviously apply, but this needs checking.

## 6. Status

- Proved here: nothing new analytically. The weight identity and the
  location of the coefficient 2 are exact readings of the published
  statements.
- Numerical: the payoff table above.
- Next mathematical step: re-run the initialization accounting
  (paper.tex 11601–12340) with the mark kept on the row side of the
  first Poisson step, and see whether the canonical recursion
  (9783–11600) closes with invariant M + μz₀ ≤ F₀ for some μ < 1.
