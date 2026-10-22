# A constructive frequency extension from the actual prime-supply gap

2026-10-23 — Sagar Thakrar (@thakrarsagar), with Codex (AI-assisted).

**Result.** In the selected high-row ranges, the fixed reserve `ℓ/d>1/5`
can be replaced by a reserve computed from `ℓ/h−7/37`. Given a strict
uniform endpoint margin and `1/2≤h<1`, a positive extension preserving
prime supply above `7/37` exists **if and only if `37ℓ>7h`**. The proof
below gives explicit rational extension and slot parameters. It also
checks the large-row tail and buffered-height dependencies in the paper.

This is a proved frequency/supply lemma under the stated budget and moment
hypotheses. Its application to the preprint route remains conditional on
the preprint's 7/8 theorem and applicable [audit edits](../AUDIT_SUMMARY.md).
It does not prove an improved moment estimate, a new zero-free endpoint,
or a Lean theorem. The existing `certify.py` and historical audits retain
their conservative `h<5ℓ` check.

## Hypotheses and explicit construction

Fix rational `ℓ>0`, `1/2≤h<1`, and `γ>0`. For each floor, adaptive or
`δ=5/6` bin, let `E_j(d)` be the high exponent **after the target comparison
and any capacity allowance**, but before the remaining small real losses.
Assume uniformly that `E_j(h)≤−γ` and

$$
E_j(d)=E_j(h)+(d-h)s_j,\qquad 0\le s_j\le1.
$$

The next section verifies this slope hypothesis for the stated row formulas.
Assume the selected moments are available whenever prime supply exceeds
`7/37` by a fixed positive amount, with arbitrarily small prescribed losses
and a sufficiently fine positive slot mesh, as in Proposition
`detector-counts`. Let `η_mesh,b_round>0` be rational thresholds supplied
by those analytic lemmas; this result does not compute their analytic sizes.

Put

$$
S=37\ell-7h>0,\qquad G=\frac S{74},\qquad
\zeta_0=\min\left\{\frac S{14},\frac{1-h}{2},\frac\gamma2\right\}>0.
$$

Any `0<ζ≤ζ₀` has the following properties for `1/2≤d≤h+ζ`:

1. `h+ζ<1`, retaining the buffered-height range.
2. `ℓ/d−7/37>G`, a uniform strict prime-supply reserve.
3. `E_j(d)≤−γ/2`, a uniform high-exponent saving before remaining losses.

For (2), supply is decreasing in `d` and the endpoint identity is

$$
\frac{\ell}{h+\zeta}-\frac7{37}-G
 =\frac{(S-14\zeta)+S(1-h-\zeta)}{74(h+\zeta)}>0.
$$

The first numerator term is nonnegative and the second is strictly positive.
For (3), `d≤h` gives `E_j(d)≤−γ` by the nonnegative slope. Above `h`, the
cost is at most `ζ≤γ/2`. Further real losses can be chosen below `γ/4`
to retain a strict saving; no particular analytic loss threshold is assumed.

Define

$$
t=\min\{\eta_{\rm mesh},b_{\rm round},G/2\},\qquad
K=2\left(\left\lfloor\frac\ell t\right\rfloor+1\right),\qquad
\ell_i=\ell/K.
$$

Then `K` is a finite positive even integer and, for every selected range,

$$
w_i=\frac{\ell_i}{d}\le\frac{2\ell}{K}<t,
\qquad \delta\max_i w_i<t\quad(0\le\delta\le5/6).
$$

This meets the mesh, rounding and half-supply-gap bounds. Disjoint physical
windows and the even-`K` normalizer can be chosen exactly as in the paper.
`G` is fixed before `ζ`, so the slot system can still precede the final
choice of extension. If the other real-loss allocations require a smaller
extension, choose any smaller positive `ζ`; all these conclusions persist.

Conversely, if `37ℓ≤7h`, every positive extension has
`ℓ/(h+ζ)<ℓ/h≤7/37`. It cannot preserve the prescribed strict supply above
`7/37`. This necessity concerns that uniform supply requirement, not every
possible prime-selection scheme or a smaller capacity bound.

## Uniform slopes, including the capacity allowance

For `α=5/6`, `0≤δ≤α` and `0≤x≤1/2`, write the existing adaptive formula as

$$
D=3-17x/9,\quad P=(2-8x/9)(1-x),\quad
J=(\alpha-\delta)D+\delta P,
\quad R_*=1-\delta+\frac{(\alpha-\delta)\delta P}{2J}.
$$

Here `D≥37/18`, `P≥7/9`, and `D−P=1+x(1−8x/9)≥1`. Consequently
`J≥35/54>0` and `J≥(α−δ)P`, giving

$$
1-\delta\le R_*\le1-\delta/2.
$$

Allow the adaptive count `R=R_*+u` with `0≤u≤1/8`. Its frequency slope is

$$
\frac{73}{300}\le R+\delta/2-\frac{17}{50}
 \le\frac{33}{50}+u\le\frac{157}{200}<1.
$$

The paper's allowance `u=Δ/4` satisfies this whenever `0≤Δ≤1/2`.
The floor slope is `67/100`; the `δ=α`, `R=1−α` endpoint slope is
`73/300`. Thus all three ranges meet the lemma's slope hypotheses. The
bound is uniform over `q`, and subtracting a target-dependent constant
from the exponent does not affect its slope.

The endpoint margin must correspond to the **actual** count being used.
If only a zero-allowance adaptive margin `γ₀` is known, an allowance at
most `u_max` costs at most `h*u_max` at `d=h`, before any target-comparison
gain. Use a proved positive margin for the resulting exponent; do not feed
`γ₀` unchanged into the construction. In particular, the demonstration
below makes no assertion about a capacity-to-target comparison at a new
analytic boundary.

## Exact demonstrations in the frozen budget

The [standalone certificate](certify_frequency_extension.py) uses the unchanged `certify.high_exponent`,
`adaptive_poly` and Bernstein implementation. For `F=−108J E_*`, it proves
`F≥f_min>0` on the whole adaptive rectangle and `108J≤270`. The common
endpoint margin is the minimum of `f_min/270` and the exact floor and
`δ=5/6` margins. These examples use **zero capacity allowance**.

| Geometry | Bernstein boxes | `γ` | `ζ₀` | Old `5ℓ−h` |
|---|---:|---|---|---|
| Audited baseline: `ℓ=2953/17700`, `h=405989/500000` | 18 | `372913/652492800000` | `372913/1304985600000` | `1964947/88500000 > 0` |
| Witness outside the old reserve: `ℓ=31/200`, `h=4/5` | 2 | `161/28800` | `161/57600` | `−1/40 < 0` |

Both points pass all eleven other existing side checks. The second point
therefore shows that this extension relaxation is nonvacuous: its old
check fails, yet the adaptive, floor and alpha exponents stay negative
throughout the new interval and prime supply remains strictly adequate.
Its frozen-budget boundary `2107/2400` is **weaker than 7/8**; it is a
demonstration of the extension lemma, not an endpoint improvement.

For that witness, `G=27/14800` and the actual supply gap at `h+ζ₀` is
`6649/1710917>G`. Supplying the illustrative thresholds
`η_mesh=b_round=1/1000` gives `K=340` and `2ℓ/K=31/34000<27/29600=G/2`.
These threshold values are arithmetic examples, not claims that an analytic
moment lemma admits that mesh. The formula works with any smaller positive
thresholds those lemmas supply.

## Source audit and replacement instructions

All references below are to OpenAI's `paper.tex` at commit
`1581d4cbdd69a0faf34b2089614fe2a814316a6a`, blob
`268c4e3206d460c617d3d2129742a72b831b3def`, in
`preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/`.

| Source lines | Dependency and replacement |
|---|---|
| [15185–15219](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15185-L15219) | Proposition `detector-counts` requires an arbitrary fixed positive supply gap above `7/37`, not the particular reserve `1/5`. Its analytic moment hypotheses remain assumptions here. |
| [15372–15390](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15372-L15390) | The inverse capacity is at most `7/37` and the plain capacity is smaller for sufficiently small losses. Replace the numerical geometry's supply comparison by the gap `G`. |
| [15723–15738](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15723-L15738) | The first high-exponent formula is affine in `d`, with slope `R+δ/2−17/50`; target comparison adds a constant. |
| [16114–16143](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16114-L16143) | Replace `ζ<5ℓ−h` and the fixed `1/5` supply reserve by `ζ≤ζ₀` and `G`. The stated row formulas have slopes below one; the paper's coarser cost `2ζ` also remains valid. |
| [16202–16204](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16202-L16204), [16239–16278](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16239-L16278) | In the order-of-choices statement use the positive construction instead of `1/48`; replace the mesh cutoff `1/185` by `G/2`. Keep the other supplied mesh/rounding thresholds, disjoint windows and fixed-`K` error absorption. |
| [16326–16335](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16326-L16335) | To keep the paper's existing real-loss allocation, choose `0<ζ<min(ζ₀,m_high/16)`. Then the original `2ζ<m_high/8` bound still holds. |
| [15898–15918](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15898-L15918) | The absolute large-row tail has the term `−ζ z_infinity`. Any fixed positive `ζ` permits choosing a sufficiently large fixed `z_infinity` afterwards, before the target. |
| [16408–16416](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16408-L16416) | Buffered moderate ranges require `h+ζ<1`, which is explicitly retained. |

Small and intermediate row ranges use no selected primes and are not changed
by this lemma. The standalone construction does not remove their constraints,
change the low estimate, or supply the rest of a geometry-specific audit.

Rohan Arun and Claude supplied the generalized budget and historical audit.
[PR #15](https://github.com/rohanarun/quasi-rh-hillclimb/pull/15) distinguished
the exact floor-bin bounds with the old extension rule retained or dropped.
This contribution supplies a constructive replacement for that rule in the
frequency/supply argument. It does not assert that the weaker floor-only
bound is feasible for the full budget. The independent contribution starts
from main and does not require PR #15's code or documentation.

## Reproduction

```sh
python auto-research/certify_frequency_extension.py
```

The certificate checks the symbolic slope and supply identities, exact
Bernstein bounds, both examples, strict mesh rounding at an integer quotient,
and rejection of boundary cases with no supply, height, endpoint or mesh
room. All 73 checks pass with Python 3.13.5 and SymPy 1.14.0 against the
unchanged budget from main commit `e4cf5a2b1f967746b36606d3352549ee598e373f`.
All computations are rational; any failed check raises an error even
under Python `-O`. No sampling is used to prove a continuum inequality.
