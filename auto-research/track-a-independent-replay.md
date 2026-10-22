# Independent exact replay of Track A certificates

Sagar Thakrar with Codex, substantially AI-assisted, 2026-10-23.

[verify_track_a.mjs](verify_track_a.mjs) reproduces four **existing** Track A
final-section certificates with Node.js `BigInt` rational arithmetic. It
imports only `node:assert/strict`; no Python, SymPy, or package installation
is needed. Its independent conversion uses exact interpolation in the
Bernstein basis instead of the existing symbolic power-coefficient method.
Run from the repository root:

```sh
node auto-research/verify_track_a.mjs
```

Tested with Node.js 22.23.4. Invoking the script by absolute path from outside
the repository produces identical output. Every rational operation and
proof decision is exact; ordinary JavaScript numbers are used only for small
integer inputs, array indices, and depths. Unsafe integer inputs are rejected.

This verifies the adaptive rectangle and twelve side constraints under the
shared exponent-budget formulas. It does not establish the analytic lemmas,
complete endpoint audit, edited preprint, or a Lean theorem. Application to
the zero-free problem retains the preprint/audit conditions. In particular,
the historical full audit concerns `N=5900`; replaying the other points does
not extend that audit. See [AUDIT_SUMMARY.md](../AUDIT_SUMMARY.md).

## Existing points and exact receipts

| Point | `ell` | `h` | `sigma0` | Boxes | Maximum depth | Minimum leaf Bernstein coefficient of `F` |
| --- | --- | --- | --- | ---: | ---: | --- |
| Paper | `1/6` | `13/16` | `7/8` | 12 | 7 | `5/384` |
| Audited `N=5900` | `2953/17700` | `405989/500000` | `20649/23600` | 18 | 13 | `372913/2416640000` |
| PR #12 integer `N=5824` | `2915/17472` | `405967/500000` | `20383/23296` | 26 | 21 | `564781781/229008998400000` |
| PR #12 near edge | `625643953/3750000000` | `8119602997/10000000000` | `4374785349/5000000000` | 38 | 33 | `889511697/1717986918400000000` |

All twelve side margins are strictly positive at each point. The two last
points are credited to [PR #12][pr12], pinned at
[`359cdb4a586046e7e8b32bd7938abbeeb8820d67`][pr12-head]. This contribution
claims no new endpoint. The minima in this table are lower bounds for `F`,
not necessarily attained values of `F` or margins for the high exponent.

## Formula and source check

The baseline is repository commit
[`e4cf5a2b1f967746b36606d3352549ee598e373f`][baseline]. The preprint citations
below pin `openai/math` commit `1581d4cbdd69a0faf34b2089614fe2a814316a6a`,
file `preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex`
(Git blob `268c4e3206d460c617d3d2129742a72b831b3def`).

The generalized geometry and boundary are

$$
\ell_x=1+\ell-h,\quad \ell_y=h-2\ell,\quad
b=2h-1-3\ell,\quad M=1-\ell,\quad
\sigma_0=\frac{11}{12}-\frac\ell4.
$$

The boundary solves `C(sigma0)=ell_x/2+b/12`, where
`C(s)=ell_x/2+s-1+h/6`. These generalize the [paper's fixed geometry][paper-geometry]
and [low-side normalization][paper-low]; compare [certifier geometry][certifier-geometry].
Use `dd` for row scale and `delta` for the bin parameter. Replacing `a-7/8`
by `a-sigma0` in the [first source high-exponent expression][paper-high],
setting `a=(1+delta)/2`, and substituting the geometry gives

$$
E(dd)=-\frac5{12}+\frac\delta2
 +\ell\left(\frac34+\delta+q\right)
 +h\left(z_0-\frac23-\frac\delta2\right)
 +dd\left(R+\frac\delta2-z_0\right),\qquad z_0=\frac{17}{50}.
$$

Symbolic subtraction from `certify.high_exponent` gives zero. This is the
generalized expression: changing the boundary adds
`7/8-sigma0=(ell-1/6)/4` to the source exponent. The preprint's simplified
second line with fixed `C0=-1/48` cannot be reused at general `ell,h`.

For the [balanced cutoff][paper-cutoff], put

$$
\alpha=\frac56,\quad x=\frac12-y,\quad
D_x=\frac{37+34y}{18},\quad P_x=\frac p9,\quad
J=(\alpha-\delta)D_x+\delta P_x,
$$
$$
p=7+18y+8y^2,\qquad
j=108J=185+170y+\delta(-138+12y+96y^2),
\qquad R_*=1-\delta+\frac{(\alpha-\delta)\delta P_x}{2J}.
$$

Substituting `dd=h`, `q=delta(1/2-y)`, and `R=R_*` cancels `z0` and yields
the evaluator used by the new script:

$$
F=j(-E(h))=
\left[\frac5{12}-\frac\delta2
 -\left(\frac34+\delta\left(\frac32-y\right)\right)\ell
 +h\left(\delta-\frac13\right)\right]j
 -6h\left(\frac56-\delta\right)\delta p.
$$

The factor `6` follows from `j P_x/(2J)=6p`. This agrees identically with
[certify.adaptive_poly][certifier-adaptive]. At the paper point, the
[preprint's displayed polynomial][paper-balanced] is `96F`, because its
normalization is `10368J(-E_*)` instead of `108J(-E_*)`.

For fixed `ell,h`, the bracket has bidegree at most `(1,1)`, `j` at most
`(1,2)`, and the subtracted term at most `(2,2)`. Thus `F` has degree at
most two in `delta` and three in `y`. Its `delta^2 y^3` coefficient is
`96ell`. An affine box substitution preserves the degree bounds. Twelve
evaluations would not determine an arbitrary function: this degree proof
is an essential precondition of the interpolation step.

On the closed rectangle `0<=delta<=5/6`, `0<=y<=1/2`,

$$
j-70=(5/6-\delta)(138-12y-96y^2)+180y+80y^2\ge0.
$$

Here `138-12y-96y^2>=108`; the coefficient of `delta` in `j` is negative,
so also `j<=185+170y<=270`. Consequently `70<=j<=270`, consistent with
the [source bounds][paper-cutoff]. The script independently obtains a
Bernstein minimum of `70` for `j` on the whole rectangle. Thus `F>0`
implies `E(h)<0`; a bound `F>=m>0` implies `-E(h)>=m/270`.

This is the frozen plain-capacity `2/9` formula (`kappa=3/4` in the search
model). Its balanced cutoff already lies in `1<=t<=3/2`, since
`0<=delta P_x<=J`; no clipping branch is added. Replacing the count formula
or introducing clipping would require a fresh identity and degree argument.

## Independent coefficient conversion and coverage

Write `B_i^n(t)=binom(n,i)t^i(1-t)^(n-i)`. The degree-two Bernstein
coefficients from samples `(a,b,c)` at `(0,1/2,1)` are

$$
(a,\;2b-(a+c)/2,\;c).
$$

The degree-three coefficients from samples `(a,b,c,d)` at
`(0,1/3,2/3,1)` are

$$
(a,\;-5a/6+3b-3c/2+d/3,\;a/3-3b/2+3c-5d/6,\;d).
$$

These maps are the exact inverses of the respective Bernstein evaluation
matrices. On each box the verifier evaluates the `3 x 4` tensor grid,
applies the quadratic map to each column, then the cubic map to each row.
It never imports or generates SymPy's monomial coefficient arrays.

On the **closed** unit square the tensor weights
`B_i^2(u)B_j^3(v)` are nonnegative and sum to one. The reconstructed
polynomial is therefore at least the minimum coefficient, including at
edges and corners. The script accepts a box only when that minimum is
strictly positive. Affine substitution transfers this proof to each box.

Otherwise it bisects the longer physical side, with ties on `delta`, and
requires successful certificates from **both** children. The two closed
children have exactly their parent as union. Induction on the completed
subdivision tree therefore proves full coverage; no partial-success log is
accepted. The exact area sum `5/12` is an additional check, not the coverage
proof by itself. Depth starts at zero, and the coefficient test precedes
the depth-34 limit. Reaching that limit throws an explicit uncertified
error; a nonpositive coefficient alone is not a disproof of positivity.

These rules reproduce the baseline partitions. The existing Python default
limit of 20 is insufficient for the last two points; the comparison used
`maxdepth=34`. Counts and coefficient minima can change under other valid
partitions. See [the original conversion and subdivision][certifier-bernstein].
The Bernstein lemma above is a mathematical argument, not a Lean proof.

## Twelve side constraints

The independently rearranged high exponent supplies the first four
margins below. These are precisely [certify.side_constraints][certifier-sides].
Every margin must be strictly positive.

| ID | Margin | Source |
| --- | --- | --- |
| M1 | `-E(h)` at `delta=1/50,q=1/100,R=1` | [Floor bin][paper-floor] |
| M2 | `-E(h)` at `delta=5/6,q=5/12,R=1/6` | [Large delta][paper-endpoint] |
| M3 | `-E(1/2)` at `delta=1/50,q=1/100,R=1` | [Intermediate rows][paper-intermediate] |
| M4 | `-E(1/2)` at `delta=5/6,q=5/12,R=103/225` | [Intermediate rows][paper-intermediate] |
| M5 | `49h/150-ell-1/50` | [Small rows][paper-small], including `2d_min=1/50` |
| M6 | `ell/h-7/37` | [Prime supply][paper-supply] |
| M7 | `5ell-h` | [Extension room][paper-supply] |
| M8 | `2h-1-3ell` | [Geometry][paper-geometry] |
| M9 | `1-h` | [Low-side lengths][paper-low], [audit B][audit-b] |
| M10 | `11/6+5ell/2-8h/3` | [Low-side lengths][paper-low], [audit B][audit-b] |
| M11 | `1-3ell` | [Low-side lengths][paper-low], [audit B][audit-b] |
| M12 | `1-h/4` | [Capacity-loss comparison][paper-high-margin] |

| ID | Paper | Audited `N=5900` | PR #12 integer | PR #12 near edge |
| --- | --- | --- | --- | --- |
| M1 | `7/1200` | `519949/88500000` | `82433/14000000` | `4409468407/750000000000` |
| M2 | `7/96` | `12800053/177000000` | `19735241/273000000` | `867640499/12000000000` |
| M3 | `1033/4800` | `1901868451/8850000000` | `18802337/87500000` | `25787123041/120000000000` |
| M4 | `49/14400` | `71041819/26550000000` | `108052493/40950000000` | `23923430593/9000000000000` |
| M5 | `63/800` | `115654733/1475000000` | `267517489/3412500000` | `39200988551/500000000000` |
| M6 | `23/1443` | `43284629/2658821961` | `133628501/8201345334` | `1334449741/81934175697` |
| M7 | `1/48` | `1964947/88500000` | `6076393/273000000` | `666949129/30000000000` |
| M8 | `1/8` | `1820851/14750000` | `11225113/91000000` | `123405437/1000000000` |
| M9 | `3/16` | `94011/500000` | `94033/500000` | `1880397003/10000000000` |
| M10 | `1/12` | `1883923/22125000` | `46558471/546000000` | `639013771/7500000000` |
| M11 | `1/2` | `2947/5900` | `2909/5824` | `624356047/1250000000` |
| M12 | `51/64` | `1594011/2000000` | `1594033/2000000` | `31880397003/40000000000` |

For intermediate rows, `E(1/2)` with `R=76/75-2delta/3,q=delta/2` is
affine in `delta`, so the endpoint checks cover that interval. The scale
slope `101/150-delta/6` is positive. The floor slope is `67/100>0`;
for the adaptive count, `R_*>=1-delta` makes the scale slope positive
throughout the rectangle. Positive `ell,h` hold at all four supplied
points. These are deductions from the stated budget, not proofs of the
underlying row estimates. The rectangle through `delta=5/6` is the existing
certifier's conservative domain; under the historical audit's contradiction
`sigma0<beta_*<=7/8`, physical bins have `delta<=3/4`.

## Negative control and validation

The control uses `ell=1/6+1/5823`,
`h=8119602997/10000000000`, `delta=48573/125000`, and `y=0`. Direct exact
evaluation gives

$$
F=-\frac{4970643260483831}{2369384765625000000000}<0,
\qquad j=\frac{8210963}{62500}>0.
$$

Thus `E(h)>0` at an actual point in the rectangle. This rejects this
particular parameter pair, rather than inferring failure from a coefficient
or depth limit. It does not prove failure for every `h` at `N=5823`; the
stronger integer obstruction is part of [PR #12][pr12].

The script always runs self-checks for rational normalization and division,
zero denominators, exact integers beyond `2^53`, and rejection of unsafe
JavaScript integer inputs. It reconstructs all twelve tensor Bernstein
basis functions on both unit and fractional boxes, checks a positive
quadratic requiring subdivision, and rejects zero and negative polynomials.

The completed implementation was compared against the unchanged Python
3.13.5/SymPy 1.14.0 certifier at the pinned baseline. All **48 side values**
and **94 leaf certificates** agree exactly, including every rational box,
coefficient bound, and depth. The negative control agrees exactly too.
The receipt and margin tables above record those results. A separate
source/specification audit checked the algebraic identities and degree,
inverted both evaluation matrices, independently reconstructed every leaf
minimum using `fractions.Fraction`, checked leaf containment and disjoint
interiors, and recovered total area `5/12` for every partition. Its separate
Node calculation also checked all twelve monomial images of the tensor map.

The implementation is independent at the arithmetic and coefficient-conversion
level. It deliberately shares the analytic formulas and known candidate
points; agreement between implementations does not verify those analytic
inputs. The historical low-side expression
`-dd+max((dd-1+5ell)/8,0)` is zero at `dd=0` and strictly negative for
`dd>0` at these points, so its endpoint must not be described as strict.

## Attribution

Rohan Arun and Claude supplied the original exponent budget, rational
Bernstein certifier, and audit. OpenAI's preprint supplies the underlying
analytic argument and compensated endpoint. [PR #12][pr12] supplies the
two newer rational points; [PR #13][pr13] is the separate source-audit
follow-up for `N=5824`. The limiting obstruction belongs to Daugherty,
Ryan, and Ward's [issue #4][issue4], with global sharpness treated in
[PR #14][pr14]. This contribution, tracked in [issue #18][claim], adds a
second arithmetic implementation and its reproduction/source note.
The preprint is OpenAI's work and is not covered by the repository's MIT license.

[baseline]: https://github.com/rohanarun/quasi-rh-hillclimb/tree/e4cf5a2b1f967746b36606d3352549ee598e373f
[audit-b]: https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/audit/B_6807-8651.md
[certifier-geometry]: https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/certify.py#L1-L25
[certifier-adaptive]: https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/certify.py#L27-L40
[certifier-bernstein]: https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/certify.py#L42-L68
[certifier-sides]: https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/certify.py#L70-L87
[paper-geometry]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6857-L6867
[paper-low]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8582-L8648
[paper-high]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15726-L15736
[paper-floor]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15843-L15851
[paper-small]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15855-L15890
[paper-endpoint]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15927-L15947
[paper-cutoff]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15962-L15992
[paper-balanced]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15994-L16075
[paper-high-margin]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16081-L16110
[paper-supply]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16112-L16126
[paper-intermediate]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16127-L16185
[claim]: https://github.com/rohanarun/quasi-rh-hillclimb/issues/18
[issue4]: https://github.com/rohanarun/quasi-rh-hillclimb/issues/4
[pr12]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/12
[pr12-head]: https://github.com/thakrarsagar/quasi-rh-hillclimb/blob/359cdb4a586046e7e8b32bd7938abbeeb8820d67/auto-research/track-a-5824.md
[pr13]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/13
[pr14]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/14
