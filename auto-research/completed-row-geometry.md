# Completed-row loss when the probe length changes

Sagar Thakrar with Codex, substantially AI-assisted, 2026-10-23.

The existing completed-row argument extends to `M + ell != 1`, but its
dual-length comparison acquires an extra loss. Carrying that loss through
the low estimate gives the explicit allowance

$$
\rho=M+\ell-1,\qquad
L(\ell,\rho)=\frac{\rho_+}{2}
             +\frac{(5\ell-1-2\rho)_+}{8}.
$$

**Budget consequence.** If the existing row-count estimates are retained
and this low allowance is charged, either sign of nonzero `rho` makes the
high exponent strictly worse at the same proposed boundary. In particular,
this extension cannot improve the known frozen Track A obstruction
`(1507-2sqrt(921))/1653`. The result identifies what a useful new norm
estimate would need to improve; it is not an impossibility theorem for
different analytic estimates or actual zero-free regions.

[certify_completed_row_geometry.py](certify_completed_row_geometry.py)
checks the identities, sign decompositions, and exact examples using the
repository's existing SymPy dependency. The proof below is a deduction
from the preprint's reflected-energy and Gram bounds. No new zero-free
endpoint, complete analytic audit, or Lean theorem is claimed.

## Source and hypotheses

All preprint links pin `openai/math` commit
`1581d4cbdd69a0faf34b2089614fe2a814316a6a`, file
`preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex`
(Git blob `268c4e3206d460c617d3d2129742a72b831b3def`). The repository
baseline is [`e4cf5a2b1f967746b36606d3352549ee598e373f`][baseline].

Keep the same completed probe, fixed slot system, coefficient conventions,
and common-profile separation hypotheses. In particular, this uses `f=1`
and the trivial puncture (the source's `rho=1`, distinct from the surplus
defined here). Moving non-slot primes therefore belong to the powerful
row part, giving `2A_0<=O`. Retain the original zero masks and source dual
ideals; the actual row ball stays independent of surviving slots and dual
variables. A nontrivial puncture or new moving factor would require its
own length charges. These are the [source specialization hypotheses][row-overflow].
Take fixed lengths `ell>0`,
`ell_x`, `ell_y`, and put

$$
M=\ell_x+\ell_y,\quad b=\ell_y-\ell_x,\quad
h=1-\ell_x+\ell>0.
$$

The relation for `h`, and
`C(s)=s+ell_x/2-1+h/6`, are in the [general high-representation definition][stage].
They do not require `M+ell=1`. For the low estimate assume

$$
b>0,\qquad \ell_x>\ell,\qquad \ell_y>\ell,\qquad
\ell_y-\ell-\frac{11b}{6}>0.
$$

These ensure the positive lengths and Gram comparison used in the
[low-side proof][low]. In particular `M-2d>0` for `0<=d<=ell`,
`P_a` has exponent `b`, and `P_a^2/Y'` is absorbed by `P_a^(1/6)`.
All lengths range over fixed bounded sets. The analytic constants and
large-`Z` thresholds may depend on the fixed data, as in the source.

For a rescaled subset with total length `d`, write

$$
m=M-2d,\qquad l=\ell-d,\qquad 0\le d\le\ell.
$$

Here `d` indexes low-side subsets. The high-side row scale is denoted `dd`
below, and `delta` is the bin parameter; these are different variables.

## General completed-row bound

The source's reflected-energy exponent, including the powerful-row count,
is

$$
\begin{aligned}
E_{\rm ref}={}&O/2+\max(H,v+\ell_b)-S_0-B_0+z_a-u-\ell_b-2e/3\\
&-\tfrac12(T-v-3\ell_b-e)_+,\\
u={}&\min\{v,z_a,(v+z_a)/3\},\\
T={}&2H+2A_0+2z_a-1-l-N_0-3B_0.
\end{aligned}
$$

See [reflected energy][energy] and the [completed-row specialization][row-data].
At the level of principal exponents, its constraints are

$$
H=m-O-\Delta_H,\quad O,\Delta_H\ge0,\quad
2A_0\le O,\quad 0\le N_0\le A_0,\quad
0\le z_a\le l,\quad B_0,S_0,v,\ell_b,e\ge0.
$$

Retention gives `v+3ell_b+e<=T`, up to prescribed small losses.
The actual source permits bounded annular offsets and a small Gaussian
length displacement. All maxima, minima, and positive parts here are
Lipschitz in those variables, so those offsets are absorbed into the final
`epsilon`, in the same order as the source's proof. No positive power
depending on the slot mesh is introduced.

The exact dual-length identity is

$$
T-H=\rho-3d-\Delta_H-(O-2A_0)
                  -2(l-z_a)-N_0-3B_0.
$$

Thus, with `gamma=(rho-3d)_+`,

$$
\max(H,v+\ell_b)\le H+\gamma.
$$

This is the changed step: the [original proof][row-overflow] uses
`M'+ell'-1=-3d` to replace that maximum by `H`. Dropping `gamma` when
`rho>0` would understate the inherited bound.

In the branch `u=z_a`, all remaining losses have the correct sign and

$$
E_{\rm ref}\le m+\gamma-O/2-\Delta_H\le m+\gamma.
$$

Otherwise `u>=v/2`. With `y=v+3ell_b+e`, the elementary identity

$$
u+\ell_b+2e/3+(T-y)_+/2-T/4
=(u-v/2)+v/4+\ell_b/4+5e/12+|T-y|/4
$$

has a nonnegative right side. Hence the [second source branch][row-branches]
gives

$$
\begin{aligned}
E_{\rm ref}
&\le O/2+H+\gamma-S_0-B_0+z_a-T/4\\
&=m+\gamma+\frac{1+3l-2m}{4}
 -\frac{\Delta_H}{2}-\frac{l-z_a}{2}
 -\frac{2A_0-N_0+B_0+4S_0}{4}\\
&\le m+\gamma+\frac{1+3l-2m}{4}.
\end{aligned}
$$

Combining the two branches proves the following carried-over estimate:

$$
\sum_{0<q_k\ll Q}|B^J_{k,\sigma}(Z)|^2
\ll Z^{M-2d+e(d)+\epsilon},\qquad
e(d)=(\rho-3d)_+
       +\left(\frac{5\ell-1-2\rho+d}{4}\right)_+.
$$

The Gaussian truncation, Fourier separation, and summation over actual
row and dual dyads proceed as in the [source norm proof][row-proof].
This is a valid uniform upper bound; no claim is made that it is sharp
for every `d` or every choice of lengths. When `rho=0`, it recovers the
corrected audit bound `((d-1+5ell)/4)_+` in [audit B][audit-b].
Retention also forces `0<=T<=2m+l-1` at the principal-exponent level.
If `2m+l<1` with a fixed gap, that dyad is absent once the small losses
are sufficiently small. At `d=ell`, `l=z_a=0`, so only the first hybrid
branch occurs. A positive formal second clip at that endpoint is therefore
not an attainment claim.

## Low-side deduction and an equality example

The [Cauchy–Schwarz and tuple-count calculation][low] adds

$$
f(d)=-d+e(d)/2
$$

to `ell_x/2+b/12`. It is the maximum of the four affine functions

$$
-d+\frac{a(\rho-3d)}2
    +\frac{c(5\ell-1-2\rho+d)}8,\qquad a,c\in\{0,1\}.
$$

Their slopes are `-1`, `-7/8`, `-5/2`, and `-19/8`. Consequently

$$
f(d)\le f(0)-7d/8=L(\ell,\rho)-7d/8,
$$

and the low bound is `Z^(ell_x/2+b/12+L+epsilon)`. The empty subset
`d=0` occurs, so the supremum of this inherited exponent bound is exactly
`L`. At `rho=0` and `ell<=1/5`, it gives `L=0`, with strict improvement
for `d>0`; the endpoint `d=0` has equality.

There is also an equality family in the **reflected-energy relaxation**.
For `0<ell<=1/5`, `rho>=0`, and `d=0`, take

$$
m=1-\ell+\rho,\quad H=m,\quad z_a=\ell,\quad
v=T=m+\rho,\quad O=\Delta_H=A_0=N_0=B_0=S_0=\ell_b=e=0.
$$

Then `v>=2ell`, so `u=ell`, and the displayed energy is exactly
`m+rho`. The carried-over row loss is also `e(0)=rho`. Thus simply
deleting the overflow term cannot be justified by these exponent
inequalities. This family does not prove that actual analytic sums
attain the bound, or that every relaxed endpoint is an actual dyad.

For example, `ell=1/6`, `h=13/16`, and `rho=1/100` satisfy the low
length conditions. The row loss is `1/100`, the low allowance is `1/200`,
and the corrected boundary is `1057/1200`, rather than the paper's `7/8`.

## Comparison at the same boundary

In terms of `ell,h,rho`, the geometry is

$$
\ell_x=1+\ell-h,\quad \ell_y=h-2\ell+\rho,\quad
b=2h-1-3\ell+\rho.
$$

Solving `C(sigma)=ell_x/2+b/12+L` gives

$$
\sigma=\frac{11}{12}-\frac\ell4+\frac\rho{12}+L
       =\frac{11}{12}-\frac{\ell_{\rm eff}}4,\qquad
\ell_{\rm eff}=\ell-\rho/3-4L.
$$

Let `E_gen` be the [general high exponent][high] at this geometry and
boundary, and let `E_0` be the frozen exponent at `(ell_eff,h)`. For the
same `delta,q,R,dd`, exact subtraction gives

$$
E_{\rm gen}-E_0
=-\frac\rho6(2+\delta-2q)+L(2+4\delta+4q).
$$

For `delta>=0` and `0<=q<=delta/2` this is nonnegative. More explicitly:

- If `rho>=0`, write `L=rho/2+k`, `k>=0`. The difference is
  `rho(4+11delta+14q)/6+k(2+4delta+4q)`.
- If `rho<=0`, write `rho=-t`, `t>=0`. The difference is
  `t(2+delta-2q)/6+L(2+4delta+4q)`.

It is strictly positive whenever `rho!=0`. This comparison is for the
high exponents. It does not assert that all the other side constraints
transfer to `(ell_eff,h)`. The sign proof uses only `L>=rho_+/2`, so
improving the second clipped term alone while retaining this floor does
not change the conclusion.

The unchanged adaptive count already supplies a necessary obstruction
independently of those other side constraints. At

$$
r=\sqrt{921},\quad \delta_*=(49-r)/48,\quad q=\delta_*/2,
\quad \ell_*=(33+8r)/1653,
$$

the frozen exponent has the exact identity

$$
E_0(h;\delta_*,q,R_*)=\frac{73-r}{32}(\ell_{\rm eff}-\ell_*).
$$

The coefficient is positive and the `h` coefficient vanishes. The known
obstruction is due to Daugherty, Ryan, and Ward, as recorded in
[issue #4][issue4]; [PR #12][pr12] verifies the obstruction and rational
approximations, while [PR #14][pr14] treats global sharpness.
The new comparison therefore gives these necessary inequalities for
strict adaptive feasibility:

$$
\sigma>\sigma_*+
\begin{cases}
\displaystyle\frac{1288-5\sqrt{921}}{3306}\,\rho,&\rho\ge0,\\[4pt]
\displaystyle\frac{73+\sqrt{921}}{1653}\,(-\rho),&\rho\le0,
\end{cases}
\qquad \sigma_*=\frac{1507-2\sqrt{921}}{1653}.
$$

Both penalty coefficients are positive. The witness `delta_*` lies below
`3/4`, so restricting the conservative `delta<=5/6` rectangle to the
physical range in the historical audit does not remove this obstruction.
These are necessary bounds, not claims of sharpness for nonzero `rho`.

As an exact rejection example, `ell=19/100`, `h=13/16`, `rho=1/100`
has `L=1/200` and the same proposed `sigma=7/8` as the paper point.
It satisfies the low length conditions, but at `delta=2/5`, `q=1/5`,
the unchanged adaptive count gives
`E_gen(h)=71663/3894000>0`. Increasing `ell` to offset the boundary cost
has not preserved the high estimate.

## Reproduction and scope

```sh
python auto-research/certify_completed_row_geometry.py
```

The script verifies the overflow and both energy-branch identities,
the four low-envelope slopes, comparison against `certify.high_exponent`,
nonnegative polynomial decompositions for both signs of `rho`, the exact
algebraic obstruction, and rational equality/rejection examples. It uses
explicit checks that remain active with Python `-O`.

Validated with Python 3.13.5 and SymPy 1.14.0: all 46 exact checks pass.
An optimized invocation by absolute path from outside the repository gives
identical output. Existing budget/search code and historical audits are unchanged.
An independent primary-source audit confirmed the inherited envelope,
geometry comparison, and analytic prerequisites, including the distinction
between relaxed exponent equality and actual sums.

The contribution proves a general norm/low-bound deduction from the stated
source estimates and a limitation of the resulting finite budget. A
stronger reflected-energy estimate, extra arithmetic restrictions that
remove the relaxed equality family, a different low estimate, or changed
row counts are outside this obstruction. Any improved zero-free theorem
would also need the Euler-region, contour, error, and parameter-order
arguments recorded in [AUDIT_SUMMARY.md](../AUDIT_SUMMARY.md).

This work is tracked in [issue #21][claim]. It is separate from
[PR #19][pr19]'s frequency/supply lemma, [PR #15][pr15]'s floor-bin
idealizations, [PR #17][pr17]'s side-constraint ceilings, and
[PR #20][pr20]'s arithmetic replay. Credit Rohan Arun and Claude for the
generalized budget and corrected norm audit, and OpenAI's preprint for the
reflected-energy and Gram arguments. The preprint is not covered by this
repository's MIT license.

[baseline]: https://github.com/rohanarun/quasi-rh-hillclimb/tree/e4cf5a2b1f967746b36606d3352549ee598e373f
[stage]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L5582-L5591
[energy]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7663-L7803
[row-data]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8073-L8082
[row-overflow]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8198-L8265
[row-branches]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8267-L8325
[row-proof]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8124-L8331
[low]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8578-L8648
[high]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6142-L6152
[audit-b]: https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/audit/B_6807-8651.md
[claim]: https://github.com/rohanarun/quasi-rh-hillclimb/issues/21
[issue4]: https://github.com/rohanarun/quasi-rh-hillclimb/issues/4
[pr12]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/12
[pr14]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/14
[pr15]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/15
[pr17]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/17
[pr19]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/19
[pr20]: https://github.com/rohanarun/quasi-rh-hillclimb/pull/20
