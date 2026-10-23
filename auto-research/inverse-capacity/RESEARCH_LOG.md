# How we got here: research log

23 October 2026. Subhanjan Das (@subhanjandas), with substantial assistance from
Claude (Anthropic). Chronological account of the work in this PR, including
the dead ends. Numbers marked "model" are floating-point estimates; numbers
marked "exact" come from rational-arithmetic certificates; "Lean" means checked
by the Lean kernel.

## 0. Starting point

- [PR #26](https://github.com/rohanarun/quasi-rh-hillclimb/pull/26):
  role-specific source chains in Collet's PR #8 framework, conditional
  θ = 0.87477137 (exact finite premises).
- [PR #27](https://github.com/rohanarun/quasi-rh-hillclimb/pull/27):
  the same chains with Λ steps of 1/8000, conditional θ = 0.87477128 (exact),
  plus a research log showing that finite tuning converges to about
  0.87477126 (model) and that the chain ends already sit at the break-even
  slopes.

## 1. Last finite lever: adaptive per-stage caps (exact)

Collet's NF rule (PR #8, `feedback.tex` NF8) lets every stage carry its own
width cap; her own graph used caps from 0.029 to 0.055, but #26/#27 used one
cap per chain. We gave each intermediate stage the cap (previous crossing +
3·10⁻⁵) and the last stage the cap the return needs, with Λ steps of 1/16000.

- Count face B rises by 1.83·10⁻⁶ at equal Λ; the margin value does not matter.
- Exact: the 41,056-stage graph certifies θ = **0.87477127** and is rejected at
  0.87477126. See [`../adaptive-caps/`](../adaptive-caps/README.md).
- Conclusion: finite tuning is exhausted at the 10⁻⁸ level.

## 2. Where θ is decided (model, then exact)

Using a floating-point model of Collet's return (validated to 10⁻⁸ against
the exact certificates of PR #8, #26 and #27):

- The binding point is edge `new_top` (d = h), count branch C, δ ≈ 0.458,
  p = 1/2; the count term (3/4)·d·R\* ≈ 0.36 dominates the return exponent.
- Lowering the exponent by ε there lowers θ by only 0.223ε.
- The count R\* is the crossing of three witness lines and equals the mean of
  their intercepts weighted by reciprocal slopes (Lean: `CountAnatomy`). The
  weights are inverse **0.506**, long (sixth power) 0.309, plain 0.185
  (exact: `scripts/weights.py`). This explains why the source faces (plain
  line) and the sixth-power slope α move θ so little.

## 3. The lever: the inverse slot capacity (model)

The inverse line's slope is set by the marked inverse moment's capacity
z_M(r) = (1−r)/2 (preprint `lem:marked`, r + 2z ≤ m). We wrote a generic
three-line count model (`scripts/lam_model.py`), checked that at λ = 2 it
reproduces Collet's closed form N/J exactly (`scripts/lam_check.py`), and
scanned the slot coefficient λ (`scripts/lam_whatif.py`).

A correction during this step: the first scan's code did not impose the
preprint's second condition 2r + 8z ≤ 3m, although its docstring said it did.
The consolidated model now has explicit modes `none`/`fixed`/`scaled`. The
`none` results equal "second condition relaxed together with λ" because the
prime-supply cap binds first; the `fixed` runs keep the preprint's condition.

| λ | Second condition | θ (model) |
|---|---|---:|
| 2 (preprint) | — | 0.8747710 |
| 1.75 | relaxed | 0.8741504 |
| 5/3 | fixed | 0.8738728 |
| 1.5 | relaxed | 0.8731508 |
| ≤ 1.25 | relaxed | 0.8728094 (prime supply binds) |
| ≤ 1.5 | fixed | 0.8732702 (second condition binds) |

All progress below 7/8 so far is 2.29·10⁻⁴ (Lean: `progress_below_seven_eighths`).

## 4. Where the "2" comes from (exact reading of the preprint)

`lem:marked` (9250) ← initialization margins (12206–12211) ← canonical invariant
(9807) ← reflected-energy terminal step (`lem:reflected-energy`, 7747; mark
saving u = min{v, z_a, (v+z_a)/3}, `old-eq:4.7`) ← `lem:hybrid-energy` (7510) ←
Heath-Brown's cubic large sieve (7491), whose (UV)^{2/3} term is exactly the
source of u. Lean checks the preprint's margin identities
(`BranchAlgebra.first/second_margin_identity`).

## 5. A barrier from the literature

Dunn, de Faveri and Hoffstein (arXiv:2607.07911, July 2026, Thm 1.1) prove
Heath-Brown's cubic large sieve is sharp for arbitrary coefficients. So no
general-coefficient improvement of the sieve can lower the 2. The remaining
idea was to use the *structure* of the actual slot coefficients.

## 6. Two structural ideas

- **Zero-free-region bootstrap** (closed): bounding each slot sum by an earlier
  zero-free region θ_I gives a saving of about z/4, but after reflection the
  slot factors carry Gauss-type phases, and in any case see §7.
- **Lemma S** (proved): after reflection the slot-tuple coefficient contains a
  cubic-residue phase (q/p)₃² between every two slot primes (paper.tex 2271,
  7446). Splitting the slots into two balanced groups and applying Heath-Brown's
  *bilinear* sieve gives a saving of z/3 for every dual length, where the
  preprint's saving vanishes for short duals. Lean checks the analytic core
  with Heath-Brown's theorem as a hypothesis (`LemmaS`).

## 7. The obstruction (exact, Lean)

Redoing the terminal estimate's three branches at the initialization node with
the paper's own relations (`scripts/branch_algebra.py`, Lean `BranchAlgebra`):

- row branch: r + (2 − κ)z < m for a mark saving κz (Lemma S: κ = 1/3);
- **column branch: r + 2z < m whatever the coefficients**, because active slot
  primes enter the reflection conductor squared and the dual length grows by
  2z;
- mixed branch: 2r + 8z ≤ 3m.

So Lemma S alone cannot move λ (Lean: `capacity_unchanged`). The remaining
target is a column-branch estimate (`STRUCTURED_MARK.md` §4). With it and
Lemma S, the model gives θ ≈ 0.87387.

## 8. Lean formalization

Lean 4.34.1 and Mathlib `d13f23b` (the toolchain of PR #8). The Mathlib
download cache was unreachable, so the 1,536 imported Mathlib modules were
compiled from source on a 2-core machine. Result: 19 theorems, all using only
`propext`, `Classical.choice` and `Quot.sound`; a fresh `leanchecker` replay
passes; two negative controls are rejected. See [`lean/README.md`](lean/README.md).

## 9. Where this leaves things

- Finite tuning: done (≈10⁻⁸ left).
- Analytic: the column-branch estimate is the single precise target that,
  together with Lemma S, would move θ by about 10⁻³.
- The probe geometry cannot go below θ = 13/15 (Lean: `theta_gt_13_15`).
- Next steps are listed in [`ROADMAP.md`](ROADMAP.md) and the README.
