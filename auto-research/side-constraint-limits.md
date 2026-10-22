# Exact limits from the retained side constraints

Date: 2026-10-23. Sagar Thakrar (@thakrarsagar), with Codex (AI-assisted).

Status: exact algebraic audit of explicitly restricted exponent models; AI-assisted. This is not a new zero-free theorem. Any proposed analytic application remains conditional on the preprint's 7/8 theorem and on the additional proof obligations below. The algebraic implications themselves require only the displayed inequalities.

Repository baseline: `e4cf5a2b1f967746b36606d3352549ee598e373f`, branch `research/exact-side-constraint-limit`. All preprint references below are to `openai/math` commit `1581d4cbdd69a0faf34b2089614fe2a814316a6a`, file `preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex` (Git blob `268c4e3206d460c617d3d2129742a72b831b3def`), retrieved through the GitHub tools.

## Result and scope

Keep the geometry and every side constraint in [`certify.side_constraints`](https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/certify.py#L70-L87), and allow only the adaptive high-row count to improve. The exact obstruction is

$
 \ell<\frac{4112}{24039},\qquad
 \sigma_0=\frac{11}{12}-\frac\ell4>
 \frac{84031}{96156}\approx0.8739028245767295.
$

This is sharp as an infimum for the idealized model that substitutes `R = 1 - delta` in the adaptive high-row endpoint while retaining the floor count `R = 1` and the intermediate count `R = 76/75 - 2 delta/3`. Equality is excluded by the strict side inequalities.

The result depends on checking the intermediate range through `delta = 5/6`. If its upper endpoint is instead the physically sufficient `delta = 3/4`, with the other listed sides retained, the corresponding sharp idealized infimum is

$
 \ell<\frac{18706}{105507},\qquad
 \sigma_0>\frac{368153}{422028}
 \approx0.8723425933824296.
$

Neither bound limits all structural approaches. Changing the intermediate estimate, detector floor, contour, low estimate, or scale relations changes the system under discussion.

This builds on Rohan Arun and Claude's exponent budget and original `167/192` obstruction. It complements [PR #15](https://github.com/rohanarun/quasi-rh-hillclimb/pull/15), which changes the low estimate: here the original low estimate and `sigma0 = 11/12 - ell/4` stay fixed. The exact frozen Track A limit in [PR #14](https://github.com/rohanarun/quasi-rh-hillclimb/pull/14) retains the actual adaptive count and concerns a different system. This work addresses [claim #16](https://github.com/rohanarun/quasi-rh-hillclimb/issues/16).

## Primary-source audit

The pinned paper uses its original fixed geometry, whereas `certify.py` generalizes the exponent expressions to variable `(ell, h)`. The rational bounds above are deductions from that generalized model, not constants asserted in the paper.

| Source | What it establishes |
| --- | --- |
| [Paper lines 6857–6866](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6857-L6866) | Original geometry `ell = 1/6`, `h = 13/16`, `b = 1/8`, `l_x = 1 + ell - h`, `l_y = l_x + b`, and `M + ell = 1`. |
| [Paper lines 15726–15736, equation `eq:common-high-exponent`](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15726-L15736) | First-line high exponent underlying `certify.high_exponent`. The paper has `7/8`; the generalized model substitutes `sigma_0`. Its second line already specializes the geometry and must not be reused unchanged. |
| [Paper lines 15843–15851, equation `eq:floor-bound`](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15843-L15851) | Floor `a = 51/100`, `delta_0 = 1/50`, `R = 1`, `q <= delta_0/2`; positive frequency slope makes `d = h` the worst frequency up to `h`. |
| [Paper lines 16146–16165, equation `eq:adaptive-intermediate`](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16146-L16165) | For `d_min <= d <= 1/2`, use no selected primes and the common exponent `76/75 - 2 delta/3`. Its frequency slope is positive; evaluate at `d = 1/2`, `q = delta/2`. The last inequality explicitly uses `delta <= 5/6`. |
| [Paper lines 6812–6830](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6812-L6830) and [15097–15108](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15097-L15108) | The actual bin ceiling is `a <= beta_*`, hence `delta <= 2 beta_* - 1`. In the paper's original contradiction, `kappa = 3/4 + 2 Delta <= 5/6`; `alpha = 5/6` is the sixth-power slope. These lines do **not** literally assert `kappa = 3/4`. |
| [Paper lines 12559–12573](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12559-L12573) | The plain moment estimate accepts `beta_* <= (1 + kappa)/2` and is uniform for `kappa` in `[3/4, 1]`; equality with `beta_*` is not required. |

Consequently, **after assuming the 7/8 theorem**, `beta_* <= 7/8` implies `delta <= 3/4`, and choosing the fixed admissible moment parameter `kappa = 3/4` is justified. This is the conditional reinterpretation recorded in [audit F](../audit/F_14985-16677.md), not the original paper's dynamic-bootstrap setting. Meanwhile [`certify.py` lines 75–78 and 97–101](https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/certify.py#L75-L101) retain checks through `5/6`. Those sufficient rectangle checks cannot be promoted to necessary conditions on the physical bins.

## Exact elimination

Use the repository's relations

$
 l_x=1+\ell-h,\quad l_y=h-2\ell,\quad
 b=2h-1-3\ell,\quad M=1-\ell,\quad
 \sigma_0=11/12-\ell/4.
$

Substitution into [`high_exponent`](https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/certify.py#L21-L25) gives the floor margin

$
 -E(h;1/50,1/100,1)=\frac A{150},
 \qquad A=61-117\ell-50h.
$

For the unchanged intermediate count, define

$
 I(\delta):=-E(1/2;\delta,\delta/2,76/75-2\delta/3)
 =\frac{24-225\ell+98h+\delta(150h-450\ell-125)}{300}.
$

It is affine in `delta`, so the two endpoints suffice; no assumption about the sign of its slope is needed.

At `delta = 5/6`, `I = B/1800`, where

$
 B=1338h-3600\ell-481,\qquad
 669A+25B=28784-168273\ell.
$

Thus `A > 0` and `B > 0` force `ell < 4112/24039`. Their simultaneous zero is

$
 P_{5/6}=\left(\frac{4112}{24039},\frac{4379}{5342}\right).
$

At `delta = 3/4`, `I = C/1200`, where

$
 C=842h-2250\ell-279,\qquad
 421A+25C=18706-105507\ell.
$

Thus `A > 0` and `C > 0` force `ell < 18706/105507`. Their simultaneous zero is

$
 P_{3/4}=\left(\frac{18706}{105507},\frac{18877}{23446}\right).
$

## All remaining sides at the two limits

Direct exact substitution into `side_constraints` gives the following. Only the upper intermediate endpoint is changed in the second column; even the redundant ideal high endpoint at `delta = 5/6` remains positive.

| Margin | At `P_(5/6)` | At `P_(3/4)` |
| --- | --- | --- |
| Floor `A/150` | `0` | `0` |
| Ideal high endpoint, `delta = 5/6` | `6515/96156` | `20245/422028` |
| Intermediate, `delta = 1/50` | `28609/133550` | `239659/1172300` |
| Upper intermediate endpoint for the indicated model | `0` | `0` |
| Small rows | `36887/480780` | `138661/2110140` |
| Prime supply `ell/h - 7/37` | `28411/1458207` | `194993/6286041` |
| Extension room `5 ell - h` | `1709/48078` | `17167/211014` |
| `b` | `1012/8013` | `2756/35169` |
| `l_x - ell` | `963/5342` | `4569/23446` |
| `l_y - ell - 11b/6` | `3607/48078` | `1439/11106` |
| `1 - 3 ell` | `3901/8013` | `16463/35169` |
| `1 - h/4` | `16989/21368` | `74907/93784` |

There is therefore no additional blocker among the retained sides in the `3/4` model. However, `I(5/6) = -3283/140676` at `P_(3/4)`: that point does fail the original rectangle model, as it must.

## Sharpness for hypothetical perfect adaptive counts

This section substitutes `R = 1 - delta` only for the adaptive high-row estimate. It does not assert that such a uniform counting theorem is available, and it does not apply that count to the floor bin.

For `ell > 0`, the high exponent increases with `q`, so `q = delta/2` is the worst amplitude. At `d = h`, the idealized exponent becomes

$
 E_{\rm ideal}(h)
 =-\frac5{12}+\frac{3\ell}4+\frac h3
   +\delta\left(\frac12+\frac{3\ell}2-h\right).
$

At both limiting points its `delta` coefficient is negative. On the enlarged interval starting at `delta = 0`, the minimum margin is therefore

$
 \min(-E_{\rm ideal})=
 \begin{cases}
 485/32052,&P_{5/6},\\
 2155/140676,&P_{3/4}.
 \end{cases}
$

Both are strictly positive. The actual high-row range is smaller. Also `R + delta/2 - 17/50 = 33/50 - delta/2 >= 73/300 > 0` for `delta <= 5/6`, so evaluating at `d = h` controls the high-row frequencies below `h`.

Let `P_0 = (1/6, 13/16)` and set `P_t = (1-t) P_0 + t P_*`, for rational `0 <= t < 1` and either limiting point `P_*`. At `P_0` every listed side is strictly positive (the smallest original margin is `49/14400`), and `-E_ideal` is at least `1/48` on the rectangle. Every side is affine in `(ell, h)` except the prime-supply quotient; because `h > 0`, its positivity is equivalent to the affine condition `37 ell - 7 h > 0`. For each fixed `delta, q`, the ideal high exponent is also affine in `(ell, h)`. The tables and these observations prove strict feasibility throughout the segment and convergence to the stated infimum. This is an exact sharpness proof for each specified idealized inequality system, not a numerical extrapolation or an attained strict certificate at its endpoint.

The floor and intermediate margins tend to zero as `t -> 1`. Any analytic error allowances, height reserves, and extension width must be chosen after fixing `t < 1`; there is no uniform positive reserve at the limit. The strictly positive extension-room values allow a sufficiently small width at each such fixed point.

As a negative control, the script checks the present adaptive polynomial at `delta=2/5, y=0`. It equals `-580891/801300` at `P_(5/6)` and `-6466133/3516900` at `P_(3/4)`, with positive denominator `108J=649/5`. Both limiting pairs therefore fail the present adaptive estimate. They are not new certified Track A points.

## Reconciliation with the README's `167/192`

The [README's perfect-row-count obstruction](https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/README.md#L115-L120) is a weaker statement requiring only the unchanged floor and `b > 0`:

$
 A+25b=36-192\ell>0
 \quad\Longrightarrow\quad
 \ell<\frac3{16},\qquad \sigma_0>\frac{167}{192}.
$

Hence `167/192` is a lower bound on the infimum even if the intermediate estimate improves or is replaced. It is not the sharp infimum when either of the present intermediate constraints is retained. The simultaneous floor/`b` boundary is `(ell,h) = (3/16,25/32)`, but there

$
 I(5/6)=-\frac{1771}{28800},\qquad
 I(3/4)=-\frac{689}{19200}.
$

Both unchanged intermediate estimates therefore block that boundary. Calling adaptive high-row improvement alone sufficient to approach `167/192` would be incorrect. Conversely, the floor/`b` argument continues to apply regardless of intermediate changes only while its own floor treatment and geometry are retained. The README's non-strict `>=` is consistent with a limiting lower bound; every strictly feasible point obeys `>`.

## Useful next proof obligations

1. Keep the rectangle and conditional physical-range variants distinct. The certificate verifies the two systems specified above; it does not replace the existing certifier's domain or default checks.
2. An actual improvement requires a proved uniform adaptive row-count estimate on the relevant amplitude, frequency, and moving-label ranges. `R = 1 - delta` here is an idealization, not a source-backed new estimate.
3. Going below `84031/96156` while preserving the current rectangle sides is impossible. Restricting the intermediate interval to the conditional physical ceiling removes that particular obstruction, but preserving its estimate still imposes `368153/422028`. Passing that second infimum requires changing at least one of the floor or intermediate constraints (or the geometry producing them).
4. Using the physical ceiling analytically requires carrying the assumed `beta_* <= 7/8` through the bin ceiling and moment hypotheses. Do not cite paper lines 15106–15108 as if the original proof already fixed `kappa = 3/4`.
5. Any claimed zero-free improvement must still supply the changed-geometry analytic arguments, including the second Euler region and completed-row norm issues recorded in [AUDIT_SUMMARY.md](../AUDIT_SUMMARY.md), and the contour, error, and parameter-order accounting. Exact final-section feasibility alone does not verify those arguments.

## Reproduction and checks

With the existing SymPy dependency installed, run:

```sh
python auto-research/certify_side_constraint_limits.py
```

The script checks the elimination identities against `certify.high_exponent` and `side_constraints`, verifies every limiting side margin, proves ideal adaptive positivity on the full rectangle, and checks the affine interpolation identities. Its parameter is `tau=1-t`, so its strict segment is `0<tau<=1`. All points on that segment with rational `tau` have rational parameters. Decimal output is for orientation only; every proof decision uses exact arithmetic. Python `-O` is rejected because it disables assertions.

Validated with Python 3.13.5 and SymPy 1.14.0, including invocation from outside the repository. Existing `budget.py`, `certify.py`, `whatif.py`, defaults and historical audit reports are unchanged.

Used `PYTHONDONTWRITEBYTECODE=1 /tmp/quasi-rh-venv/bin/python` with exact `Fraction` and SymPy arithmetic to independently expand all three margins, verify all elimination identities, solve both simultaneous-zero systems, evaluate every side in the table, and verify the ideal high-row endpoint signs. The baseline `certify.py` run reported `True` for the denominator, adaptive rectangle, and original paper point, with every side `OK`. No floating-point optimization is used in the proofs above.
