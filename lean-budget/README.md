# Lean proofs of structural budget lemmas

This standalone project formalizes the floor-bin obstructions from
[PR #15](https://github.com/rohanarun/quasi-rh-hillclimb/pull/15) and the constructive
frequency/supply extension from
[PR #19](https://github.com/rohanarun/quasi-rh-hillclimb/pull/19). It contains **31
theorems over the reals**, including the balanced-count slope bounds and an
explicit finite even slot count. It builds directly on main without either PR.

**Scope:** these are algebraic budget lemmas under their displayed hypotheses.
There is no new zero-free endpoint, formalized analytic moment estimate, proof of
an improved low estimate, or complete Quasi-RH theorem here. Applying these
lemmas to the preprint's argument remains conditional on that argument and the
written analytic audit. In particular, an endpoint margin supplied to the
extension theorem must already pay for every capacity allowance and target
comparison.

## Reproduce

With [elan](https://github.com/leanprover/elan) installed, run from the repository:

```sh
cd lean-budget
sha256sum -c SHA256SUMS
lake exe cache get
lake build
lake env leanchecker --fresh --verbose Audit
```

Lake uses the committed manifest to fetch the exact dependencies on the first
run. Do not run `lake update` to reproduce this revision. The official Mathlib
cache supplies compiled dependencies; the project sources are compiled locally.
The final command replays `Audit` and its imported declarations into an empty
Lean environment. This is a replay with Lean's own kernel, not an independent
implementation of the kernel or a source rebuild of all Mathlib.

Pins:

| Component | Revision |
|---|---|
| Lean | `leanprover/lean4:v4.31.0`, compiler commit `68218e876d2a38b1985b8590fff244a83c321783` |
| Mathlib | release `v4.31.0`, commit `fabf563a7c95a166b8d7b6efca11c8b4dc9d911f` |
| Other dependencies | exact commits in [lake-manifest.json](lake-manifest.json) |

[BudgetLemmas.lean](BudgetLemmas.lean) contains the proofs.
[Audit.lean](Audit.lean) is a default build target: its 31 `#guard_msgs` checks
require the axiom report for every public theorem to be exactly
`[propext, Classical.choice, Quot.sound]`. An added `sorryAx`, native computation
axiom, or other axiom fails the audit. The audit also checks eight concrete
equalities/inequalities, including the supply boundary and integer mesh case.
There are no new axioms, `sorry`, or `native_decide` proofs in this project.

Verified on Linux, 23 October 2026 (Asia/Kolkata):

| Check | Observed result |
|---|---|
| `lake build` | Exit 0; both project modules compiled; all 31 axiom guards and eight concrete checks passed. |
| `lake env leanchecker --fresh --verbose Audit` | Exit 0; `replaying Audit with --fresh`; fresh kernel replay of the module and its imported declarations passed. |
| Repository `python certify.py` | Exit 0; adaptive positivity `True` in 18 boxes, all 12 side checks `OK`, and the paper point certified. |

[SHA256SUMS](SHA256SUMS) binds the two checked source files and three build/pin
files. The original Python certificate is a regression check, not a new result.

## Formal statements

The namespace is `QuasiRhBudget`. All fractions below denote exact real
numbers. The definition `highExponent` transcribes the first high-bin formula
with `ly = h - 2 ell`, `z0 = 17/50`, and an explicit target `sigma`.
`high_exponent_affine` proves its affine dependence on frequency `d`.
`floor_specialization` substitutes `delta = 1/50`, `q = 1/100`, `R = 1-rho`:

$$
E(h)=\frac{51}{100}-\sigma+\frac{53\ell}{100}+\frac h3-h\rho.
$$

The two low thresholds are `sigmaOld ell = 11/12 - ell/4` and
`sigmaIdeal h = 1 - h/6`. The latter is hypothetical: removing the low-block
loss is not proved here. Write `b = 2h-1-3ell` and `z = 5ell-h`.

| Main theorem | Hypotheses and conclusion |
|---|---|
| `old_floor_obstruction` | At the original threshold, `E(h) < 0` and `b > 0` imply `sigmaOld > 167/192`. |
| `ideal_floor_obstruction` | At the hypothetical threshold, `E(h) < 0` and `z > 0` imply `sigmaIdeal > 1573/1818`. |
| `supply_floor_obstruction` | Replacing `z > 0` by `ell > 7h/37` gives `sigmaIdeal > 11513/13326`. |
| `target_floor_saving` | At `sigmaIdeal = 108/125`, `z > 0` and `E(h) < 0` with saving `rho` require `rho > 281/51000`. |

These are necessary conditions in the stated budget variants, not attainable
endpoints or universal limits for other proof architectures. The specialization
identities and the original low-threshold identity are also proved in Lean.

### Balanced row count

For the frozen plain capacity `2/9`, `0 <= delta <= 5/6`, `0 <= x <= 1/2`, define

$$
D=3-17x/9,\quad P=(2-8x/9)(1-x),\quad
J=(5/6-\delta)D+\delta P,
$$

$$
R_*=1-\delta+\frac{(5/6-\delta)\delta P}{2J}.
$$

`row_factor_bounds` and `row_denominator_lower` prove
`D >= 37/18`, `P >= 7/9`, `D-P >= 1`, and `J >= 35/54`.
`balanced_count_closed_form` identifies this formula with the preprint's
balanced-`t` expression. `balanced_count_bounds` proves
`1-delta <= R_* <= 1-delta/2`, including both delta endpoints.
Consequently `balanced_slope_bounds` gives, for `0 <= u <= 1/8`,

$$
\frac{73}{300}\le R_*+u+\delta/2-17/50\le\frac{157}{200}<1.
$$

The allowance `u` increases the endpoint exponent too; this slope bound does
not let it be added to a previously certified margin for free.

### Constructive extension and mesh

Assume `ell > 0`, `1/2 <= h < 1`, `gamma > 0`, and set

$$
S=37\ell-7h>0,\qquad G=S/74,\qquad
\zeta_0=\min\{S/14,(1-h)/2,\gamma/2\}.
$$

`constructive_extension` proves `zeta0 > 0`, `h+zeta0 < 1`, and, uniformly
for `1/2 <= d <= h+zeta0`,

$$
\ell/d-7/37>G>0,\qquad
e_i+(d-h)s_i\le-\gamma/2
$$

for **any indexed family** with `e_i <= -gamma` and `0 <= s_i <= 1`.
The underlying supply and affine lemmas also apply to smaller positive
extensions. `supply_extension_iff` proves that a positive extension satisfying
the strict `7/37` supply test exists exactly when `S > 0` (under
`1/2 <= h < 1`). This equivalence concerns supply only; exponent negativity
is a separate hypothesis.

For arbitrary positive mesh and rounding allowances `eta` and `b_round`, set

$$
t=\min\{\eta,b_{\rm round},G/2\},\qquad
K=2\bigl(\lfloor\ell/t\rfloor+1\bigr).
$$

`even_mesh` proves that `K` is positive and even and that `2ell/K` is strictly
below each allowance. `normalized_slot_width_lt` and `scaled_slot_width_lt`
give `ell/(Kd) < t` and `delta*ell/(Kd) < t` for the intended ranges
`d >= 1/2`, `0 <= delta <= 5/6`.

The audit checks the PR #19 witness `ell=31/200`, `h=4/5`: it has
`S=27/200 > 0` but `5ell-h=-1/40 < 0`. With the illustrative choices
`gamma=161/28800` and `eta=b_round=1/1000`, it gives
`zeta0=161/57600`, `t=27/29600`, and `K=340`.
The margin and analytic availability of these illustrative mesh allowances
are not proved by these numerical checks. At `t=31/200000`, the audit checks
`K=2002`; omitting the `+1` would give width exactly `t`, failing strictness.

## Source map and credits

The preprint source is pinned to
[`openai/math` commit `1581d4cbdd69a0faf34b2089614fe2a814316a6a`](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex),
`paper.tex` blob `268c4e3206d460c617d3d2129742a72b831b3def`.
No preprint text is changed by this contribution.

| Source lines | Connection to the formal statements |
|---|---|
| 5584–5592, 8564–8580 | Mellin and low exponents; original versus hypothetical low thresholds. |
| 15185–15219, 15372–15390 | Detector supply above `7/37`; a fixed positive reserve is required. |
| 15192–15206, 15950–15989 | Balanced-count factors, cutoff and row count. |
| 15723–15738, 15840–15853 | First high-bin exponent and floor data. |
| 16114–16143 | The old `h < 5ell` reserve and coarse frequency-slope argument. |
| 16239–16278 | Fixed mesh allowances, positive supply gap, and even slot normalization. |
| 16326–16335, 16408–16416 | Frequency extension and the buffered requirement `h+zeta < 1`. |

The outer tail, detector-counting theorem, analytic mesh thresholds, uniform
endpoint certificate, and all remaining low/high estimates are outside this
formalization. Their applicability is discussed in the
[written extension audit](https://github.com/rohanarun/quasi-rh-hillclimb/blob/54726d4e9c5243a2a57bd6ecd25bc98f48ca294b/auto-research/frequency-extension.md).
The earlier floor-bin analysis is
[pinned here](https://github.com/rohanarun/quasi-rh-hillclimb/blob/9611b860db9b7d3de1b0490d4e13a856a68590f8/auto-research/floor-bin-obstruction.md).
For other scopes, see the exact frozen-budget sharpness proof in
[PR #14](https://github.com/rohanarun/quasi-rh-hillclimb/pull/14) and the
retained-side-constraint limits in
[PR #17](https://github.com/rohanarun/quasi-rh-hillclimb/pull/17).

Prepared by Sagar Thakrar (@thakrarsagar), with substantial Codex assistance,
building on those two contributions, Rohan Arun's budget reconstruction and
the OpenAI preprint. Mathlib and Lean supply the general real arithmetic,
floor, tactic, and kernel infrastructure. This project retains their upstream
licenses; the new repository files are contributed under this repository's MIT
License. This work does not modify or reattribute the separate PR #8 proof.
