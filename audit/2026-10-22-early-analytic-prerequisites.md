# Early analytic prerequisites for the lowered Track A boundary

**Status: bounded, author-checked audit; no new zero-free endpoint.** This note
checks the continuation contract before the existing A–F audit, and follows its
quantifiers through the late-height lemma. The original Track A application
remains conditional on the preprint's 7/8 theorem and the other edits in
[`AUDIT_SUMMARY.md`](../AUDIT_SUMMARY.md). It does not audit all of lines 1–3723,
reprove the Hecke functional equation, or verify the full analytic construction.

The selected early lemmas need no additional fixed 7/8 hypothesis. The audit
also makes two steps explicit: a uniform three-circles exponent gap of
`196*e/303`, and a strict integer choice for the late external order. Both
retain the source's analytic inputs and quantifier order.

Project base: `e4cf5a2b1f967746b36606d3352549ee598e373f`.
All preprint line references below refer to
[`build/paper.tex` at openai/math `1581d4cbdd69a0faf34b2089614fe2a814316a6a`][paper],
SHA-256 `42a5ee0febca59fd1def55cfd6c6808c322ef4237d7726303ea52f711deac6a3`.
This complements [PR #13](https://github.com/rohanarun/quasi-rh-hillclimb/pull/13),
which audits the later Euler-region and exponent-budget changes. It is not a
replacement for that audit or for the completed-row work in issue #21.

## 1. The continuation proposition already has the required boundary range

The proposition at [lines 400–502][continuation] assumes only
`1/2 < sigma0 < 1`, `Delta' = beta* - sigma0 > 0`, and `C(s) = s + c`
with fixed real `c`. Its hypotheses distinguish:

- **Common before the target:** `0 < omega < Delta'` and `sigma > 0`.
- **Allowed to depend on the target:** the finite excluded set, `H_eta`,
  implied constants, and sufficiently large lower thresholds.
- **Analytic contract:** `H_eta` is holomorphic on `Re(s) > sigma0` and
  `|H_eta - 1| <= 1/2` throughout that half-plane. The same deleted L-function
  and correction occur in the Mellin signal and the high comparison.

No occurrence of 7/8 in this proposition must be relaxed. Its proof still gives

```
epsilon_* = min(Delta' - omega, sigma) > 0,
|f_eta(Z)| <<_eta Z^(C(beta*) - epsilon_*).
```

Here `epsilon_* < Delta'`, so `beta* - epsilon_* > sigma0`. The proof has
three analytically distinct steps:

1. Shift the defining signal contour **to the right**, from 2 to any fixed
   `B > 2`. The reciprocal Euler product is bounded there; the Gaussian
   controls horizontal sides. Thus `f_eta(Z) = O_{eta,B}(Z^(B+c))` as
   `Z -> 0`. This does not move a contour through a hypothetical zero.
2. Combine that arbitrary small-Z decay with the large-Z saving. The Mellin
   transform converges locally uniformly on `Re(s) > beta* - epsilon_*`.
   With `Z = exp(u)`, both sides of the Fourier identity at real part 2 are
   integrable: at `u -> +infinity` the exponent is
   `beta* - epsilon_* - 2 < 0`, and at `u -> -infinity` take `B > 2`.
   Fourier inversion identifies the transform on that line, and the identity
   theorem identifies it on `Re(s) > 1`.
3. Divide by the nonvanishing Gaussian and `H_eta` to continue the reciprocal
   to `Re(s) > beta* - epsilon_*`. Since the same positive `epsilon_*`
   works for every target, the definition of the supremum supplies a target
   zero in this half-plane. The supremum need not be attained. Deleted Euler
   factors are nonzero there. A principal pole at 1 causes a zero of the
   reciprocal, not a pole, and does not obstruct this argument.

The geometry changes the affine intercept as well as the boundary. From the
general geometry used in [`certify.py`](../certify.py),

```
l_x = 1 + ell - h,          b = 2*h - 1 - 3*ell,
sigma0 = 11/12 - ell/4,
c = l_x/2 - 1 + h/6 = -1/2 + ell/2 - h/3,
C(sigma0) = 5/12 + ell/4 - h/3 = l_x/2 + b/12.
```

The [double-residue expression][residue]
`c = -5/6 + l_x/3 + ell/6` gives the same intercept; the
[low normalization][low-normalization] states the other formula.
Thus the paper's illustrative `C(s)=s-11/16` at lines 514–515 must be
replaced in the new application. Merely lowering its argument from 7/8 while
keeping that intercept would generally give the wrong low-side exponent.
The proposition itself requires no change. The exact coefficient identities
and an incorrect-intercept failure control are checked by the replay below.

## 2. Where reciprocal control is available

The early growth and logarithmic lemmas are at [lines 1415–1600][growth],
and the deleted-factor lemma is at [lines 1602–1646][deletions]. Their relevant
domains do not impose a 7/8 lower bound:

- Strip growth concerns `-1/10 <= Re(s) <= 11/10`. The principal character
  uses `(s-1)*zeta_F(s)/(s+1)`, with its removable value at 1; an upper bound
  for this regularized function is not an upper bound for zeta at its pole.
  The damped-rectangle proof first fixes the conductor Q and the damping,
  sends the rectangle height to infinity, and then removes the damping
  (1496–1528). Fixed-Q growth constants disappear; the uniform boundary
  constant remains. Uniform convergence of the horizontal sides in Q is
  not needed.
- Logarithmic control has `a in [1/2,1]` and `0 < e < 1/1000`, but **requires
  a zero-free disk first**. For its global specialization, choose
  `b >= beta*`, not `b = sigma0`. The larger disk then lies in
  `Re(s) > b + 2*e > beta*`, where zero-freeness follows from the definition
  of `beta*` and absolute Euler convergence. Choosing an internal width
  smaller than `v/8` supplies the bounds on `Re(s) >= b+v`.
- The smaller disk radii remain separated throughout `a in [1/2,1]`:
  `r0=49/100 < R6`, `R4-R6=2*e`, `R6-R8=2*e`, where `Rj=2-a-j*e`.
  Borel–Caratheodory and three-circles are applied to a holomorphic logarithm
  only after the zero-free-disk hypothesis.
- Deleted factors and their inverses cost any positive small power on a
  **fixed positive** half-plane. If the deletion radical satisfies
  `q_R <= Z^B` with fixed `B > 0`, request a factor exponent smaller than
  the intended Z-loss divided by B. This is not a conductor-independent
  constant for an arbitrary, unaccounted moving deletion set.

### Explicit uniform gap in the three-circles exponent

The compactness step at [1574–1583][three-circles] admits the following
nonoptimal but explicit bound, valid over its entire stated parameter range:

```
vartheta = log(R6/r0) / log(R4/r0),
1 - vartheta >= 196*e/303 > 0.
```

Indeed, `r0 < R6 < R4 <= 3/2`. The elementary inequalities
`-log(1-x) >= x` for `0<x<1` and `log(y) <= y-1` for `y>1` give

```
1 - vartheta = log(R4/R6) / log(R4/r0)
             >= (2*e/R4) / (R4/r0 - 1)
             = 2*e*r0 / (R4*(R4-r0)).
```

The denominator is positive, and its exact bound follows from

```
303/200 - R4*(R4-49/100) = (3/2-R4)*(R4+101/100) >= 0.
```

Substituting `r0=49/100` proves the claimed rational coefficient. For the
analytic deduction, retain the source's **Euler-normalized logarithm**, its
uniformly bounded inner-disk maximum at r0 (1570–1573), and its
`O_e(log C)` outer maximum at R4. Three-circles then gives the source's
bound with an explicit exponent:
`|log Lcal| <<_e (log C)^(1-196*e/303)` on radius R6, where
`C=2*Q*(3+|t|)^2 >= 18`. For fixed e and every positive epsilon this still
gives `exp(C_e*(log C)^(1-196*e/303)) <<_{e,epsilon} C^epsilon`.
The zero-free disk, prior growth bound, and principal regularization remain
hypotheses. Zero-freeness and an outer `O(log C)` bound alone would not
supply the bounded inner logarithm. This is an explicit version of an existing interpolation step,
not a stronger zero-free result. No uniform limit as `e -> 0` is asserted.

In particular, under `sigma0 < beta* <= 7/8`, a reciprocal on
`Re(s) = beta* + e` is controlled without assuming the desired theorem.
The initial principal contour move explicitly uses that line
([6230–6241][principal]); the small-row argument also keeps the reciprocal
there ([6403–6423][small-rows]). Lowering the Euler correction's domain to
`sigma0` is a separate obligation: it does **not** move the denominator's
known zero-free line to `sigma0 + e`.

The reflected numerator requires another distinction: on
`Re(w)=1-a-6*e`, use the **forward** deleted-factor bound; use its inverse
only on the positive reflected line `Re(1-w)=a+6*e`
([8835–8868][reflected]). The general inverse bound cannot extend to real
part zero: the single norm-three factor `1-3^(-s)` already vanishes at zero.

## 3. An explicit witness for the late-height quantifiers

The [late-height lemma, lines 6520–6580][height], is already stated for
`sigma0 in (1/2,1)`. Suppose its hypotheses have been established, including
the estimate

```
|J_eta - f_eta| <<_{eta,N}
    Z^(C(beta*)-m) * (1+T1)^A_eta + Z^B_eta * T1^(-N).
```

Here `m > 0` is common; `A_eta >= 0`, `B_eta`, and `tau0_eta > 0` are
fixed for the target before N; and both functions are independent of T1.
The following makes the integer choice in the proof explicit:

```
tau_eta = min(d_min/100, tau0_eta, m/(4*(A_eta+1))),
Q_eta = (B_eta - C(beta*) + m/2) / tau_eta,
N_eta = max(0, floor(Q_eta) + 1).
```

Every minimum entry is positive, and `A_eta*tau_eta < m/4`. For `Z >= 1`,
`(1+Z^tau_eta)^A_eta <= 2^A_eta * Z^(m/4)`; its constant may depend on
the target. The first term has at least `3*m/4` saving. The floor choice
gives the **strict** inequality
`B_eta - N_eta*tau_eta < C(beta*) - m/2`, including when Q is an integer
or is negative. The lower threshold is selected after these choices. Hence
the resulting `sigma = m/2` is common although tau, N, and the constants
are not. No uniform bound on conductor, A, B, N, or threshold is required.

For the lowered-boundary application set `omega = Delta'/2`. The resulting
continuation saving is explicitly `min(Delta'/2, m/2)`. This does not supply
m: the earlier estimates must first prove a common positive m. The
[final order of choices, lines 16312–16452][order], separates real margins
from target-dependent height orders and supplies the hypotheses in the
original application. Carrying those estimates and the other audit edits to
the new geometry is still required. In particular, increasing N may change
external test seminorms and thresholds, but not A, B, the real margins, or
the already fixed height ceiling.

This independence is substantive. If A were instead `A_N=N` and
`B=C(beta*)+m`, the displayed two-term bound could hold for the unsaved
quantity `Z^C(beta*)` for every N and `T1>=1`: after division, its right
side is at least `Z^(-m)*T1^N + Z^m*T1^(-N) >= 2`. Finiteness of A for
each separate N therefore cannot replace independence of N. The earlier
[smooth-calculus lemma, 1199–1209][smooth-tail], explicitly fixes the
arithmetic height/scale orders before raising external test derivatives;
this note does not verify every later use of that separation.

## 4. Failure controls: two tempting shortcuts are invalid

**Targetwise positive savings are insufficient.** This is visible in an
explicit toy family; these functions are **not Hecke L-functions**. Set
`theta=3/4`, `beta=7/8`, `rho_n=beta-1/(n+8)` for integers `n>=1`,
`L_n(s)=s-rho_n`, `H_n(s)=1`, `C(s)=s`, and `J_n(Z)=0`. Define the signal
by the paper's Gaussian inverse Mellin integral with L_n in the denominator.
Its zeros have supremum beta and exceed theta. The contour can be shifted
from 2 to `beta-1/(2*(n+8))`, which is still to the right of rho_n. Gaussian
decay then gives

```
|J_n(Z)-f_n(Z)| <<_n Z^(beta-sigma_n),
sigma_n = 1/(2*(n+8)) > 0,
```

while the low bound holds trivially for the common `omega=(beta-theta)/2`.
To see that a stronger common saving is actually impossible, shift instead
to `r_n=(theta+rho_n)/2 < rho_n`. The sole crossed pole gives

```
f_n(Z) = exp((rho_n-5/6)^2)*Z^rho_n + O_n(Z^r_n).
```

The leading coefficient is positive. For any proposed common `sigma > 0`,
some n has `rho_n > beta-sigma`, contradicting the proposed high bound as
Z grows. The same example also tests the low quantifier: set `J_n=f_n`.
Then the high error is zero, but the low bound has only the targetwise
`omega_n=beta-theta-sigma_n < beta-theta`, with no common positive
`(beta-theta)-omega_n`. Either weakening breaks the family-wide conclusion.
This checks the quantifier in the abstract continuation argument; it is not
a counterexample to the preprint's common-saving proposition.

**The desired boundary cannot replace beta* in global logarithmic control.**
In the same toy family, choose `a=theta` and `e=1/2000`. Already for n=1,
the zero rho_n is inside the radius `2-a-2*e` disk centered at 2. Thus the
zero-free-disk hypothesis fails. Taking `a=beta` puts the disk strictly to
the right of every rho_n. The exact replay checks these containments.

## Replay and limits

```
python3 verification/early-analytic/check.py
python3 -O verification/early-analytic/check.py
python3 certify.py
```

The new replay uses only Python's standard library and exact rational
arithmetic. It checks polynomial coefficient identities, endpoint disk
geometry and the rational interpolation-gap bound, explicit height witnesses
(including all three active ceilings, exact-integer and negative
floor cases), invalid-hypothesis controls, and the toy-family containment
and nonuniformity examples. The height inputs are illustrative finite
orders, not measured analytic constants for an actual Hecke character.
The symbolic arguments above, rather than the finite examples, establish
the general statements. No numerical integration is used as analytic proof.

The unchanged default `certify.py` was rerun using Python 3.13.5 and SymPy
1.14.0: the adaptive endpoint was True on 18 boxes, all 12 side checks
were OK, and the paper-point sanity check was True. This is a positive
control only; it is neither a new result nor a check of these analytic lemmas.

**Not checked:** the arithmetic/Gauss/reflection lemmas elsewhere in
1–3723; the foundational functional equation and its literature references;
all contour and external-tail interfaces; the complete lowered-boundary
construction of H_eta and the common high margin; a patched preprint;
or Lean formalization. No accepted-result file is changed.

**Next question:** does the fixed-bin contour interface preserve its scale
exponent when the external tail order increases? Start with lines 5808–5896,
the external-tail lemma ending at 5801, and the smooth-calculus statement
at 1199–1209. Separate retained arithmetic orders from external test
derivatives, including the pointwise horizontal-join bound. Success is a
source-pinned dependency list showing that B_eta and the retained height
orders stay fixed for every requested N, or a precise missing implication.
This checks one input to the final application at 16312–16452; it does not
require a full patched preprint or a new endpoint.

Prepared by Sagar Thakrar with substantial Codex assistance. Builds on
OpenAI's preprint and Rohan Arun and Claude's original geometry, certifier,
and A–F audit. Research and internal cross-checks remain author checking,
not external review or formal verification.

[paper]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex
[continuation]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L400-L502
[residue]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6273-L6283
[low-normalization]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8634-L8648
[growth]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1415-L1600
[three-circles]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1574-L1583
[deletions]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1602-L1646
[reflected]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8835-L8868
[principal]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6230-L6241
[small-rows]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6403-L6423
[height]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6520-L6580
[smooth-tail]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1199-L1209
[order]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16312-L16452
