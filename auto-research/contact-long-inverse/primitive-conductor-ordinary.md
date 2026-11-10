# Use the primitive conductor in the squarefree ordinary factor

The [full column projection](full-column-projection.md) used ordinary convexity on the line \(9/20\). The earlier Hecke zero-free half-plane also gives a smaller conductor exponent for the numerator of the squarefree series. Using the primitive conductor then separates the cost of repeated primes from the norm of the sixth-power-free core.

## A pointwise estimate with the zero-free half-plane

Keep \(\theta_0=8749/10000\), strictly to the right of the earlier zero-free boundary in [Liu, arXiv:2610.26835v2](https://arxiv.org/abs/2610.26835v2). Let \(\psi^*\) be a nonprincipal primitive finite-order Eisenstein Hecke character of conductor norm \(Q\). The logarithm argument in the [column overlap estimate](column-gauss-projection.md) bounds both \(L\) and its reciprocal by an arbitrarily small power of \(Q(2+|t|)^2\) on \(\Re s=\theta_0\). Its functional equation gives the bound \(Q^{\theta_0-1/2+\epsilon}\) with polynomial height dependence on \(\Re s=1-\theta_0\). Interpolating in this fixed strip gives
\[
 |L(\sigma+it,\psi^*)|
 \ll_\epsilon Q^{(\theta_0-\sigma)/2+\epsilon}(2+|t|)^C,
 \qquad 1-\theta_0\le \sigma\le\theta_0.
\]
Indeed the two conductor exponents are on the affine line \((\theta_0-\sigma)/2\). One can divide by a fixed power of \(s+2\) when applying the strip estimate to absorb the polynomial height bounds. The use of a nonprincipal numerator makes the entire strip holomorphic.

For the squarefree ordinary polynomial use \(L(s,\psi^*)/L(2s,(\psi^*)^2)\) with the exact Euler deletions. If the square character is imprimitive, its primitive inducing character has conductor dividing the original conductor. Its extra Euler factors have subpower cost on the line used below. If that inducing character is principal, the reciprocal is holomorphic at its pole. Shift the squarefree series to \(\sigma=\theta_0/2\), where the denominator is in the inherited zero-free region. The normalized bound at length \(B'\) is
\[
 O_\epsilon\bigl(U^\epsilon (B')^{-(1-\theta_0)/2}Q^{\theta_0/4}\bigr).
\]
Euler deletions on the squarefree factor multiply the series by factors of the form \((1+\psi^*(\mathfrak p)(\mathrm N\mathfrak p)^{-s})^{-1}\) and preserve the estimate. All conductor norms, deletion norms and lengths here lie in fixed powers of \(U\). Smooth Mellin tails absorb polynomial norm heights as before.

Combine this with the normalized inverse bound \((A')^{\theta_0-1/2}U^\epsilon\) and open the coprimality of the inverse and ordinary factors. Shortening both factors by a common divisor \(g\) contributes a summable weight, with exponent \(1+\theta_0-1/2-(1-\theta_0)/2>1\). This yields the squared pointwise estimate
\[
 |F(u)|^2\ll_\epsilon U^\epsilon A^{2\theta_0-1} B^{-(1-\theta_0)} Q^{\theta_0/2}
\]
for the original mixed squarefree block \(F\), whenever its inducing character is nonprincipal. The zero extensions at all row primes and at the common moving deletion are retained.

## Sum the row layers

Write the good part of an element row as \(j^6\prod_{i=1}^5 h_i^i\), with the \(h_i\) squarefree and pairwise coprime. Put \(x_i=\log_U\mathrm Nh_i,\ r=\sum_i x_i,\ t=\sum_i i x_i\) on dyads. On the nonunit-core sector, the inducing character is nonprincipal at a good prime, and \(Q\ll U^r\). The count of frozen cores is \(O(U^r)\), and the sixth roots have count \(O(U^{(1-t)/6})\) up to fixed factors and subpowers. A prime shared by the sixth root and a core factor retains its zero and does not increase the conductor. Thus the full smooth contribution of a dyad has exponent at most
\[
 \frac16+(2\theta_0-1)\beta-(1-\theta_0)\gamma
        +(1+\theta_0/2)r-t/6 .
\]
In particular, since \(t\ge r\), this fits \(1.104\) when \(t\le0.327\), uniformly for \(\beta<0.757,\ \gamma>0.374\). The unit core is already covered at the varying budget in the [full projection calculation](full-column-projection.md). The dyad criterion can reach much larger core norms when they contain repeated primes. For example, \(x_2=0.24,\ x_3=0.16\) with the other \(x_i=0\) gives \(r=0.4,\ t=0.96\), and the displayed bound still fits \(1.104\). These are restrictions on actual element rows in the smooth average.

## Enlarge the column projection

For the overlap with \(b_d\), \(d\ne1\), use \(Q\ll \mathrm N d\le D\). The squared overlap is at most
\[
 U^\epsilon A^{-2(1-\theta_0)} B^{-(2-\theta_0)} D^{\theta_0/2}.
\]
The Gram and Schur complement arguments of the previous notes are unchanged. With \(K=A^{-2(1-\theta_0)}\), replace \(E\) there by
\[
 E_{\rm new}=B^{-(2-\theta_0)}D^{1+\theta_0/2}+X^{-1}D^{3/2}.
\]
The regular row contribution is bounded by \(U^{1+\epsilon}K(1+D^2E_{\rm new})\). The nonunit exceptional labels still have disjoint row support and contribute at most \(U^{1/6+\epsilon}X K E_{\rm new}\). All of these terms fit \(1.104\) for \(D\le U^{0.207}\), while the unit label retains its previous varying-budget bound. The Gram error is still below the diagonal. The [Lean replay](ContactFactorization.lean) checks the exponent comparisons.

This extends both the primal short-core estimate and the number of Gauss directions that can be removed before the first Poisson step. The estimate for the high-frequency complement remains open.

Prepared with OpenAI Codex assistance.
