# Roadmap (ranked by leverage)

All θ figures are floating-point model estimates unless marked exact.
"Status" says what is proved.

| # | Target | Where it bites | Leverage on θ | Status |
|---|---|---|---|---|
| 1 | **Column-branch estimate**: in `lem:reflected-energy`, a bound whose dual-length term grows by less than 2z_a in the active mark length | Initialization of `lem:marked`; it is the remaining reason for the inverse capacity (1−r)/2 | Together with Lemma S: capacity (1−r)/(5/3), θ ≈ 0.87387 (model); full removal of the mark charge: θ ≈ 0.8728 (prime supply then binds) | Open. Two routes in `STRUCTURED_MARK.md` §4 |
| 2 | Row-branch saving for structured marks (Lemma S) | Terminal reflected energy, row branch | Needed together with #1 | **Proved here** (unconditional, uses Heath-Brown's bilinear cubic sieve on the pairwise mark phases) |
| 3 | Coupled inverse × plain moment | Replaces the minimum of separate witness counts | Comparable to #1 (hand estimate) | Open; earlier work identified it |
| 4 | Second marked condition 2r + 8z ≤ 3m | Becomes binding once λ ≤ 1.5 | Caps gains at 1.5·10⁻³ | Comes from the mixed branch (`old-eq:4.11`); would need the same treatment as #1 |
| 5 | Prime supply ℓ/d | Binds once λ ≤ 1.25 | Caps gains at 2.0·10⁻³ | Tied to the probe geometry (θ = 11/12 − ℓ/4, ℓ < 1/5) |
| 6 | Finite tuning (steps, caps, chain ends) | Source chains | ≈ 10⁻⁸ left | Exhausted (exact θ = 0.87477127 certified) |
| 7 | Geometry floor | Any member of this probe family | θ > 13/15 ≈ 0.8667 | Exact algebra; needs a new probe to cross |

## Floors

The lowest value in the λ what-if is θ ≈ **0.8728** (0.8728094), where the
prime supply binds. Any θ below 13/15 ≈ 0.8667 is impossible in this probe
family (`lean/QRHResearch/GeometryFloor.lean`, `theta_gt_13_15`).

## Suggested next mathematical step

Write the column branch of `lem:reflected-energy` for a single active
slot of length z and a residual row length H < v, and test whether
Poisson summation in the mark variable (modulus P) before the large
sieve shortens the dual length by z. That is the smallest self-contained
question whose positive answer, combined with Lemma S, would move θ by
about 10⁻³.
