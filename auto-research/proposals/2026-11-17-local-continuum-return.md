# A localized long-inverse target below the continuum contact

The target is $t=17466917/20000000=0.87334585$. Let $\theta_*$ be Joseph Bebel's exact contact from tracker #143. Its published isolating interval gives $6\cdot10^{-9}<\theta_*-t<7\cdot10^{-9}$. The finite return at $t$ has a strictly positive margin under the local count estimate below. Proving the estimate for the actual detector rows and integrating it into the analytic return remain open. The proposed zero-free interpretation assumes the preprint's 7/8 theorem. [Tracker #143](https://github.com/GTimG/QuasiRiemannTracker/pull/143) · [pinned parameter enclosures and return proof](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum).

## The estimate to prove

Keep #143's stationary conductor $h$, tangent line, and exact marked count $R=N/J$. Set $u_0=T/J$ for its detector cutoff, $s=10^{-6}$, $G=6\cdot10^{-7}$, and $U=Z^D$. Use the actual common-witness fibres selected at cutoff $u_0+s$. For every allowed loss $\epsilon>0$, the new input is

$$
\#\mathcal F\ll_\epsilon U^{1/6+(5/6-\delta)r-G+\epsilon}
$$

under all of the following conditions.

| Parameter | Range |
|---|---|
| Density and amplitude $(\delta,p)$ | $P=[0.425,0.4267]\times[0.49995,1/2]$ |
| Conductor $D$ | $[h-10^{-5},h+10^{-10}]$, where $0.815324503<h<0.815324505$ |
| Inverse length $U^r$ | $u_0-s\le r\le u_0+2s$ |

The physical return only needs the new estimate on rows with $N\operatorname{rad}(u)>U^{1-10^{-5}}$. On the complementary rows, keeping the actual conductor through reflection saves enough when few slots carry errors. When many slots carry errors, their absence from the measured prime amplitude pays for the target shift. The reduction uses the existing moment estimates. Six Lean theorems check its coefficient mass, admissible dilation and shortened length at every coefficient scale. The later steps through the physical comparison have written proofs. [Kernel replay](../continuum-local-return/lean/README.md). For $N\operatorname{rad}(u)\le U^{5/8}$ the requested count itself follows by ideal counting. [Physical reduction](../continuum-local-return/physical-radical.md) · [Small-radical count](../continuum-local-return/radical.md).

A second detector can be run on the same buffered zero. Smoothly factoring a saturated Möbius sum into two truncated inverse factors and one ordinary factor proves the count $O(U^{R-10^{-7}})$ for inverse lengths from $1.96$ to $2.16$. After discarding rows already within that count, the detector at cutoff $2.159$ forces an additional ordinary witness of length greater than $0.198$ and an inverse witness of length between $1.719$ and $1.96$. Their actual squared amplitudes meet the detector lower bounds. The short detector still has its own critical inverse length near $1.1285$. [Factorization, moment estimates and second witness](../continuum-local-return/long-blocks.md).

Tuning that second cutoff to $2u_0-5s$ puts both inner inverse lengths within $[2u_0/3-9s,2u_0/3+s]$ and both ordinary lengths within $[u_0/3-9s,u_0/3+s]$ outside a set of count $O(U^{R-10^{-7}})$. The inverse factors share a norm-twist height and the same character with its original zeros. A uniform second moment of their product of size $O(U^{63/50+\epsilon})$ would give the required count directly. The radical condition lets this be asked on squarefree rows, even with the explicit moving-twist loss in the reduction. Both row and column indices can also be taken squarefree. After a short change of scales the remaining column has an explicit sum over its divisors. A second sufficient estimate uses just one inverse and one ordinary factor at price $553/500$ on the indicated fibres. The two uniform estimates with their allowed twist costs are still open. [Coprime columns and the two sufficient estimates](../continuum-local-return/coprime-columns.md). The discarded sets need only the $R-10^{-7}$ count for the return. [Four simultaneous witnesses](../continuum-local-return/four-factors.md) · [Squarefree rows and exact loss budget](../continuum-local-return/squarefree-rows.md).

A further restriction uses the primitive zeros of the outer ordinary witness. For each fixed $0<k\le1/100$ the surviving row has at least $k\log U/40000$ zeros counted with multiplicity in a rectangle of height $12k/5$ and real parts between $a-k$ and $a+2e$, where $a=(1+\delta)/2$. Suitable fixed smooth tests place its center within $O((\log U)^2)$ of the selected zero. The rows failing this condition are already in the exceptional count. Bounding the number of rows that carry the cluster gives a second route to the outstanding local count. [Disk argument, quantifiers and rational replay](../continuum-local-return/zero-clusters.md).

The required uniformity is that of the inherited long inverse count, including rowwise heights, profiles, fixed labels, presentations and small losses. The preprint derives the unmarked moment at lines 12363–12388 and applies it to subdivided fibres at 15252–15311. The proposed change is at the latter deduction. The physical row inequality descends from lines 15699–15736, with the original balanced comparison at 15994–16072 replaced here by #143's marked return. PR #40 introduces this localization idea at the earlier #103 crossing. Its conductor interval ends at 0.8096863501. [Pinned preprint](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15252-L15311) · [PR #40](https://github.com/rohanarun/quasi-rh-hillclimb/pull/40).

At the shifted cutoff the short marked crossing saves more than $\eta=10^{-7}$. The inherited long bound gives that saving below the new band. On the band the hypothesized $G$ pays for the shift and leaves $\eta$. The resulting available count on $P$ is $R-\eta$, up to the original arbitrarily small losses. The short-case fallbacks, mesh buffer, tangent enclosures and contact control have separate rational checks. [Derivation and witness hypotheses](../continuum-local-return/crossing.md).

At the critical density $q$ and amplitude $1/2$, the old count exceeds the marked value by more than $1/250$, and both native windows exceed it by more than $18/100000$. The full inherited envelope therefore has normalized margin $-(3+4q)(\theta_*-t)<0$ at fixed $h$. PR #40 also misses the critical inverse length by more than $1/2000$. [Proof and exact comparisons](../continuum-local-return/control.md).

## Paying for the changed geometry

Write $e=\theta_*-t$ and $K=2t-1$, with $\kappa=2\theta_*-1$. At fixed $h$, lowering the target increases $\ell$ by $4e$ and decreases $y=h-2\ell$ by $8e$. The upper capacity is $\min(3D/40,(2y-D)/2)$ and can fall by at most $8e$. The old capacity is $\min(D,2y-D)/(6\kappa)$. The numerator can fall by at most $16e$, and stays positive on $[1/200,19/25]$ since $y>0.4686$ before the shift. Replacing $\kappa$ by the smaller $K>7/10$ can only increase the resulting capacity. Thus the old capacity also falls by at most $8e$. The normalized margin (target minus row exponent) at fixed count loses at most

$$
(3+8\delta p)e\le 6e.
$$

Indeed, the fixed-capacity debit is $(3+4\delta p)e$ and a lost unit of capacity costs $\delta p/2$. These inequalities use #143's `ExactReturnEdges.price` and `ExactReturnRows`. [Pinned definitions](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum).

The scalar old count can also be evaluated at $K$. For $v=5/6-\delta>0$, $u=p/(3K)$, put $w=2(1-p)(1-u)/(3-p-2u)$. The old count is $1-\delta+\delta v w/[2(v+\delta w)]$. We have $0\le u\le5/21$ and positive denominators. The derivative of $w$ in $u$ is $-2(1-p)^2/(3-p-2u)^2$, and the count is nondecreasing in $w$. Hence lowering $K$ improves or preserves this branch. The native and marked branch values and availability are independent of $K$, so the minimum inherits the inequality. This comparison concerns the scalar schedule parameter. Applying the schedule at the actual zero supremum still requires the count bridge. [`ExactCountTransport`](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/ExactCountTransport.lean) · [`AffineScheme`](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/AffineScheme.lean).

## A positive margin on every conductor interval

Use the 57-cell partition proved in #143. For each of the 37 noncritical cells the replay reads the pinned lower polynomial and recomputes its Bernstein coefficients on the supplied rectangle. The least coefficient occurs on top-edge cell 28 and is exactly

$$
659124698952843505347578416271343917/
235929600001179648000000000000000000000000 > 1/500000 .
$$

On the upper-capacity switch edge ($D_m=19/25$), every coefficient exceeds $1/125$. These are unnormalized margins. Each denominator is positive and at most $5/2$. For old and native counts it is bounded by $3v+2\delta$ using the branch definitions, and the marked denominator is $3v+2\delta k$ with $k\le1$. Dividing by $5/2$ therefore gives valid lower bounds on the available normalized margins. [Interval-polynomial identities and strict cells](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/ExactReturnData.lean) · [denominator definitions](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/ExactReturnPolynomial.lean).

The 20 other cells are covered by the admitted critical rectangle. Outside $P$ its factorization supplies margin at least $\min((0.0008)^2/5,0.00005(189/512)/100)$ before division by $J$. Inside $P$ the inherited margin is nonnegative and the additional count saves $(3/4)h\eta$ after normalization. In both cases the normalized top margin exceeds $6e+10^{-9}$ before debiting the changed geometry. All four edges now have margin greater than $10^{-9}$ using the strengthened count only where available. [Critical rectangle and contact control](../continuum-local-return/crossing.md).

To justify the lower end of the new conductor band, use the inherited envelope on the entire upper interval first, at the original geometry. Its row is convex in $D$ for fixed $(\delta,p)$ because capacity is the minimum of two affine functions with nonpositive row coefficient. Its normalized margin is consequently concave. At $D=h-10^{-5}$ it is at least

$$
\frac{10^{-5}}{h-D_m}\,\frac{1/125}{5/2},
$$

using nonnegativity at $h$. This exceeds $6e+10^{-9}$. After shifting geometry, interpolate from the switch to this split using the inherited count. Above the split, use the minimum with the new branch when available. It can only improve the split margin and is constant in $D$ at fixed $(\delta,p)$ throughout that upper band. Convexity again covers the interval up to $h$. The old-capacity interval is covered by its two edges in the same way. This handles the discontinuity in availability at the conductor split.

The strengthened count can be retained up to $h+10^{-10}$ under the stated hypothesis. The zero-cost upper-row slope is at most $-9/100+3/4+(3/8)/4<1$ on either capacity branch because the envelope is at most the old count, which is at most 1 ($0\le w\le1$). For physical source cost $0\le c\le10^{-10}$ the second capacity branch becomes $(2y-(1+c)D)/(2+10c)$. Multiplication by its positive denominator gives capacity loss at most $5c$ for $y\le1,D\ge0$, also after taking the minimum. The extension and source cost consume at most $10^{-10}+(15/16)10^{-10}$ of the $10^{-9}$ margin. More than $5\cdot10^{-10}$ remains before mesh and analytic losses.

## Reproduce and interpret

From the repository root, run

```sh
curl -fsSL 'https://raw.githubusercontent.com/GTimG/QuasiRiemannTracker/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/ExactReturnData.lean' -o ExactReturnData.lean
python -OB auto-research/continuum-local-return/cover.py ExactReturnData.lean
python -OB auto-research/continuum-local-return/crossing.py
python -OB auto-research/continuum-local-return/control.py
python -OB auto-research/continuum-local-return/radical.py
python -OB auto-research/continuum-local-return/physical_radical.py
python -OB auto-research/continuum-local-return/long_blocks.py
python -OB auto-research/continuum-local-return/four_factors.py
python -OB auto-research/continuum-local-return/zero_clusters.py
```

The first replay checks the input's SHA-256 before parsing its rational data. The pre-existing Lean theorems supply the 57-cell cover, the polynomial identities, the root enclosure and the critical factorization. The new computations use rational arithmetic. The new analytic estimate, conductor-dependent branch admission, common mesh, geometry and physical transport at $t<\theta_*$ and endpoint verification remain open. In particular the upstream `beta_le_above` assumes $t>\theta_*$. The scalar certificates price the outstanding estimate. The analytic reductions above restrict the actual fibres on which cancellation still has to be proved.

Prepared with OpenAI Codex assistance, building on OpenAI, Hailey Collet, Sil, Joseph Bebel, Rohan Arun and the contributors credited in tracker #143.
