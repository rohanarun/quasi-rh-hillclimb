# Track A: a rational certificate within 10⁻¹² of the budget obstruction

Date: 2026-10-22. Sagar Thakrar (@thakrarsagar), with Codex (AI-assisted).
This second iteration starts from the N = 5824 contribution at commit
`9fa86113ccf025d53812e9a540ad928d2a53ab0f` and uses Rohan Arun and Claude's
unchanged budget and Bernstein formulas. The algebraic obstruction below
was already reported by Daugherty, Ryan and Ward in
[issue #4](https://github.com/rohanarun/quasi-rh-hillclimb/issues/4).
Its verification here is supporting evidence, not a new discovery of that
constant. The new contribution is the sharper rational certificate and its
reproducible proximity and audit checks.

**Status: certified, final section only; conditional on the preprint's 7/8
theorem and the edits in `AUDIT_SUMMARY.md`.**

\[
N=\frac{1250000000}{214651},\quad
\ell=\frac16+\frac1N=\frac{625643953}{3750000000},\quad
h=\frac{8119602997}{10000000000},\quad
\sigma_0=\frac{4374785349}{5000000000}=0.8749570698.
\]

The improvement over N = 5824 is exactly
`20383/23296 - sigma0 = 1991/455000000000`, about `4.376e-9`.
The independent source-moment endpoint `0.8747729897` remains stronger.

## Reproduction and exact certificate

With the repository's documented Python dependencies installed, run:

```sh
python certify.py 1250000000/214651 8119602997/10000000000 --maxdepth 34
python auto-research/edge_certificate.py
python auto-research/audit_5824.py 1250000000/214651 8119602997/10000000000
```

`certify.py` now accepts rational N and an explicit `--maxdepth`. Its default
point and default depth 22 are unchanged from the first iteration. The
audit script retains its historical filename and N = 5824 defaults, with
optional N and h so both results use the same audit formulas.

The new certificate needs depth 33 and succeeds with limit 34. It uses
**38 boxes**, with exact minimum Bernstein coefficient
`889511697/1717986918400000000 > 0`. This bounds the polynomial
`F = 108 J (-E_*)`; it is not directly a bound on `-E_*`. The denominator
is positive on the whole rectangle. The edge script asserts these facts,
the total subdivision area `5/12`, and positivity of all 12 side constraints.

Output of the first command:

```text
ell = 625643953/3750000000  h = 8119602997/10000000000  ->  sigma0 = 4374785349/5000000000 = 7/8 - 214651/5000000000  (~0.87495707)
check paper point: sigma0(1/6) = 7/8
J>0 on box: True
adaptive endpoint F>0 on delta in [0,5/6], y in [0,1/2]: True  (38 boxes)
   smallest Bernstein lower bound among boxes: 5.178e-10
   OK  floor bin (delta0=1/50, R=1, q=delta0/2): -E(h): 4409468407/750000000000 (~0.00588)
   OK  delta=5/6 endpoint (R=1-delta, q=delta/2): -E(h): 867640499/12000000000 (~0.07230)
   OK  intermediate d=1/2, delta=1/50: 25787123041/120000000000 (~0.21489)
   OK  intermediate d=1/2, delta=5/6: 23923430593/9000000000000 (~0.00266)
   OK  small rows: -(h(z0-1/6) - l_y/2 + 2 d_min): 39200988551/500000000000 (~0.07840)
   OK  prime supply at d=h: ell/h - 7/37: 1334449741/81934175697 (~0.01629)
   OK  extension room: 5 ell - h (paper uses zeta < 5ell-h): 666949129/30000000000 (~0.02223)
   OK  b > 0: 123405437/1000000000 (~0.12341)
   OK  low side: l_x - ell: 1880397003/10000000000 (~0.18804)
   OK  low side: l_y - ell - 11b/6: 639013771/7500000000 (~0.08520)
   OK  low side: M - 2 ell = 1 - 3 ell: 624356047/1250000000 (~0.49948)
   OK  high margin coefficient 1 - h/4: 31880397003/40000000000 (~0.79701)
paper point (1/6, 13/16) certifies: True
```

Executed with Python 3.13.5 and SymPy 1.14.0. No floating-point comparison
is used to establish positivity, the improvement, or proximity to the
obstruction.

## Exact obstruction in the frozen model

Keep the plain capacity `2/9`, amplification slope `5/6`, probe relations,
and boundary `sigma0 = 11/12 - ell/4` fixed. At `x = 1/2`, hence `y = 0`,
the balanced count and denominator reduce to

\[
108J=185-138\delta,\qquad
R_* = \frac{185-288\delta+96\delta^2}{185-138\delta}.
\]

The denominator is at least 70 for `0 <= delta <= 5/6`. Substitution in
`high_exponent` gives the following polynomial, with arbitrary ell and h:

\[
F(\delta,0)=(207\ell-96h+69)\delta^2
 +(-174\ell+196h-150)\delta
 -\frac{555\ell}{4}-\frac{185h}{3}+\frac{925}{12}.
\]

Let

\[
r=\sqrt{921},\quad \delta_*=(49-r)/48,\quad
\ell_*=11/551+8r/1653,\quad K=(2293+663r)/128.
\]

Since `30 < r < 31`, the point delta-star lies inside the allowed interval
and K is positive. The coefficient of h vanishes there, and exact
simplification yields

\[
F(\delta_*,0)=K(\ell_*-\ell).
\]

Consequently every strictly feasible point in this budget, **for any h**,
must satisfy

\[
\ell<\ell_*,\qquad
\sigma_0>\sigma_{\rm floor}:=\frac{1507-2\sqrt{921}}{1653}.
\]

This is a necessary bound; it does not assert that a point with equality
certifies. For positive N, it is equivalent to
`N > 2910 + 96 sqrt(921)`, which lies strictly between 5823 and 5824.
Together with the first iteration's certificate, this proves that
**5824 is the smallest feasible integer N**. Further progress in this
parameter family requires fractional N.

For candidate selection, the simultaneous boundary stationary point has
`h_* = 254/551 + 5869 sqrt(921)/507471`, approximately `0.8119602996992595`.
The script verifies that the delta derivative of F vanishes at
`(delta_*, ell_*, h_*)`; the submitted h is a rational approximation.
The full two-variable positivity claim still comes from the Bernstein
certificate, not merely this boundary stationary calculation.

The proximity estimate is also exact. Put
`q_lo = (1507 - 1653 sigma0)/2` and
`q_hi = q_lo + 1653/(2·10^12)`. Rational arithmetic proves
`0 < q_lo` and `q_lo^2 < 921 < q_hi^2`, hence

\[
0<\sigma_0-\sigma_{\rm floor}<10^{-12}.
\]

Thus less than `10^-12` of further boundary improvement is possible without
changing this budget. The claim is specific to this frozen Track A model;
it is not a restriction on other analytic methods or the separate tracker
and source-moment constructions.

## Audit margins, affected lines, and remaining obligations

The third reproduction command asserts **21/21 positive exact margins**
using the formulas and line coordinates recorded in the
[first iteration](track-a-5824.md#recomputed-numerical-margins-and-paper-locations).
Representative new values are listed below; the script prints all 21.
Coordinates refer to the preprint's
[`build/paper.tex`](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex)
as used by the existing audits.

| Paper lines / dependence | New exact value or margin |
|---|---|
| 4056, 4171–4185: extended Euler region | Good-prime margin below -1: `4074785349/5000000000`; tail margin above 4/5: `74785349/5000000000` |
| 9052–9074, 15553–15620: compensated Euler errors | Margin below `-sigma0` for `301/100 - 5 sigma0`: `612285349/1250000000` |
| 8116–8325: completed-row norm | Supremum of the clipped loss envelope: `(6 ell - 1)/4 = 643953/2500000000` |
| 8626–8632: corrected low exponent | `1 - 5 ell = 124356047/750000000 > 0` ensures negativity of the clipped low branch for d > 0 |
| 8593–8597: positive lengths | `M' >= 624356047/1250000000`; `l_y - d >= 3114451373/10000000000`; margins above 3/16 and 1/12 are `5397003/10000000000` and `4671257/2500000000` |
| 8641–8648, 15511–15521, 15644–15647: Mellin and low scales | `C(s) = s - 1374468479/2000000000`; `C(sigma0) = l_x/2 + b/12 = 1877228303/10000000000` |
| 15172–15180: plain capacity | Still `2/9`, using kappa = 3/4 and the preprint's 7/8 theorem |
| 15994–16072: balanced endpoint | The 38-box certificate covers the full delta/y rectangle |
| 16114–16126: supply and extension | `ell/h - 8/39 = 3337792/9595894451 > 0`; `5 ell - h - 1/48 = 13983043/10000000000 > 0` |
| 15613–15619, 16304–16306: principal price | `sigma0 - 7/16 = 2187285349/5000000000 > 0` |

The earlier loss bounds `3/11800` and `3/11648` must not be reused at this
point. Historical reports and result rows are retained as records of their
own points.

The interpretation as a zero-free half-plane remains conditional on the
preprint's 7/8 theorem and every applicable edit in `AUDIT_SUMMARY.md`:
the lower second Euler region, the clipped row-norm loss, and the use of
`Delta' = beta* - sigma0` and `C(sigma0)`. Recomputing numerical margins
does not re-audit every use of an analytic lemma. No patched preprint,
complete endpoint audit, audit of lines 1–3723, or Lean proof is supplied.
The audited point remains N = 5900.

Validation also preserved the old N = 5824 certificate transcript exactly,
passed the N = 5900 and N = 5826 certificates and the paper anchor, passed
the original audit defaults, and checked rational CLI input, depth control,
and rejection of zero/negative or malformed input where disallowed.
