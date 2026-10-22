# The sharp infimum of the frozen Track A budget

Date: 2026-10-22. Sagar Thakrar (@thakrarsagar), with Codex (AI-assisted).

**Result.** For the adaptive inequality on the full rectangle and all twelve
side constraints in `certify.py`, with plain capacity `2/9` and the other
structural choices frozen, the infimum of the strictly feasible boundaries is

$$
\sigma_* = \frac{1507-2\sqrt{921}}{1653}
          = 0.874957069799168740018340\ldots.
$$

Every feasible boundary is strictly greater than this number, but strictly
feasible rational parameters approach it arbitrarily closely. The infimum
is not attained. This is an exact statement about the finite budget, not a
new zero-free theorem, endpoint audit, or Lean proof.

Daugherty, Ryan and Ward already reported the formula in
[issue #4](https://github.com/rohanarun/quasi-rh-hillclimb/issues/4); the
[maintainer's reply](https://github.com/rohanarun/quasi-rh-hillclimb/issues/4#issuecomment-6317170231)
confirms the plain-capacity scope. Their linked preprint was not used as a
proof source here. The concurrent
[PR #12](https://github.com/rohanarun/quasi-rh-hillclimb/pull/12), checked at
[`359cdb4`](https://github.com/thakrarsagar/quasi-rh-hillclimb/tree/359cdb4a586046e7e8b32bd7938abbeeb8820d67),
already verifies the necessary obstruction, integer optimality at `N=5824`,
and a rational point within `10^-12` of the bound. This contribution adds
the **global nonnegative certificate at the algebraic limit and the proof
of arbitrarily close strict feasibility**, using Rohan Arun and Claude's
existing budget and Bernstein routines.

## Fixed model and the necessary bound

Use the model at repository revision
[`e4cf5a2`](https://github.com/rohanarun/quasi-rh-hillclimb/tree/e4cf5a2b1f967746b36606d3352549ee598e373f):
`alpha=5/6`, plain capacity `2/9`, `M=1-ell`, `l_x=1+ell-h`,
`l_y=h-2ell`, `b=2h-1-3ell`, and `sigma0=11/12-ell/4`.
The remaining floor, contour and scale choices are those of
[`high_exponent` and `side_constraints`](https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/certify.py#L21).
Write `y=1/2-x` and

$$
\begin{aligned}
B&=[0,5/6]\times[0,1/2],\\
p(y)&=7+18y+8y^2,\\
j(\delta,y)&=108J=185+170y+(-138+12y+96y^2)\delta,\\
t&=1+\frac{6\delta p}{j},\qquad
R_*=1-\delta+(5/6-\delta)(t-1).
\end{aligned}
$$

Exact Bernstein bounds give `70 <= j <= 270` on `B`. Moreover,
`j-12 delta p = (5-6 delta)(37+34y) >= 0`; hence `1 <= t <= 3/2`.
Thus the clipping in
[`budget.Rstar`](https://github.com/rohanarun/quasi-rh-hillclimb/blob/e4cf5a2b1f967746b36606d3352549ee598e373f/budget.py#L22)
does not alter this balanced formula anywhere on the rectangle. The
certificate verifies that `F=-j E_*` agrees with `adaptive_poly`. Both
expressions are affine in `(ell,h)`, so comparison at `(0,0)`, `(1,0)` and
`(0,1)` checks every parameter pair.

Let

$$
r=\sqrt{921},\qquad \delta_*=(49-r)/48,\qquad
\ell_*=(33+8r)/1653.
$$

At `y=0`,

$$
R_*(\delta,1/2)=\frac{185-288\delta+96\delta^2}{185-138\delta},
\qquad R_*(\delta_*,1/2)=\frac23.
$$

Substitution into the high exponent cancels the coefficient of `h`:

$$
E_*(\delta_*,1/2;\ell,h)
=\left(\frac34+\frac{3\delta_*}{2}\right)(\ell-\ell_*).
$$

The witness has `1/3 < delta_* < 3/4` and its coefficient is positive.
Consequently `E_*<0` on the rectangle requires `ell<ell_*` for **every h**,
equivalently `sigma0>sigma_*`. Equality cannot pass the strict constraint.

## Global certificate at the limiting parameters

Take

$$
h_* = \frac{254}{551}+\frac{5869r}{507471}
     =0.811960299699259497555422\ldots.
$$

The script forms `F_* = F(ell_*,h_*)` exactly and checks the decomposition

$$
F_*(\delta,y)=a(\delta-\delta_*)^2
              +yq_1(\delta)+y^2q_2(\delta)+y^3q_3(\delta),
\qquad a=\frac{15912}{551}-\frac{18344r}{169157}>25.
$$

All coefficients belong to `Q(sqrt(921))`. To certify their signs using
the existing rational Bernstein implementation, first prove by rational
squaring that

$$
\frac{30347981810987}{10^{12}}<r<
\frac{30347981810988}{10^{12}}.
$$

For each coefficient `u+v*r`, substitute the lower root bound if `v>=0`
and the upper bound otherwise. This gives a rational lower polynomial
because `delta,y>=0`. Its Bernstein coefficients establish:

| Region | Exact certified lower bounds |
|---|---|
| `0 <= delta <= 1/3`, `0 <= y <= 1/2` | `F_* > 7/100`, using three boxes |
| `1/3 <= delta <= 5/6` | `q1 > 3/10`, `q2 > 4`, `q3 > 1`, each on one interval |

On the second region the square term is nonnegative and every `qk` is
positive. Therefore `F_*>=0` on all of `B`, with equality **only** at
`(delta,y)=(delta_*,0)`. Since `j>0`, the limiting adaptive exponent is
nonpositive everywhere. The same exact root enclosure proves that all
twelve side constraints are strictly positive at `(ell_*,h_*)`.

## Strict feasibility arbitrarily close to the limit

The existing paper point `(ell_0,h_0)=(1/6,13/16)` satisfies `F_0>0` on
the whole rectangle, as verified again by the script. For `0<tau<=1`, set

$$
(\ell_\tau,h_\tau)
 =(1-\tau)(\ell_*,h_*)+\tau(\ell_0,h_0).
$$

Affineness gives the exact identity
`F_tau=(1-tau)F_*+tau F_0>0` everywhere on `B`. All side margins are
affine except the prime-supply margin `ell/h-7/37`. Multiplying that one
by positive `h` gives the affine margin `ell-7h/37`. The script checks
strict positivity of each affine margin at both ends of the segment,
so every interpolated point satisfies all twelve side constraints.

As `tau` decreases to zero, the feasible boundaries decrease to
`sigma_*`. This proves sharpness over real parameters. For each positive
`tau`, compactness of `B` supplies a uniform positive adaptive margin;
the side margins are also strict and continuous. A sufficiently small
perturbation of `(ell_tau,h_tau)` therefore remains feasible. Density of
the rationals gives rational parameter pairs approaching the same limit.
For points sufficiently close to the limit, `ell>1/6`, so these pairs
also have positive rational `N=1/(ell-1/6)`.

This argument concerns feasibility of the inequalities. It does not
promise that a fixed Bernstein recursion depth will certify arbitrarily
nearby rational points.

## Reproduction and scope

With the repository's existing SymPy dependency installed:

```sh
python auto-research/certify_track_a_limit.py
```

The script asserts the symbolic identities, clipping bounds, rational
root enclosure, limiting positivity, twelve side margins, paper point
and interpolation identity. It exits unsuccessfully if a check fails
and refuses Python's `-O` mode, which would remove assertions. Decimal
output is displayed only after the exact proof checks. Verified with
Python 3.13.5 and SymPy 1.14.0, also when invoked from outside the repo.

No preprint lemma, existing certifier, default point or historical audit
is changed. The result applies to this frozen capacity and geometry;
it does not bound methods with changed moment inputs or the separate
tracker/source-moment constructions. The independently checked
source-moment endpoint `0.8747729897` remains stronger. Interpreting any
individual Track A point as a zero-free theorem still requires the
preprint and the applicable analytic edits and audit obligations.
