# Extend the column projection to the full smooth row average

The [column Gauss projection](column-gauss-projection.md) bounded the removed vector on the actual sixth-power-free detector rows. The same projection, with labels of norm at most \(D=U^{0.197}\), fits the varying mixed-moment budget on the full smooth average used in the first Poisson step. The additional rows are handled by separating the one possible exceptional label at each row. The unit label requires a sharper comparison with the varying budget.

## Coefficients of the projection

Use the same lengths \(A=U^\beta,\ B=U^\gamma,\ X=AB\), ray block, smooth profile, and deletion as in the column projection. Put \(\theta_0=8749/10000\). The finite-order Hecke half-plane of [Liu, arXiv:2610.26835v2](https://arxiv.org/abs/2610.26835v2) has boundary below \(\theta_0\), including over the Eisenstein field. Use this inherited bound only in the reciprocal estimate for the inverse overlap. The contour argument in the previous note now gives \(O_\epsilon(U^\epsilon (A')^{\theta_0-1/2})\) on a shortened inverse length \(A'\). The ordinary estimates are unchanged. The squared overlaps acquire \(A^{-2(1-\theta_0)}\) in place of \(A^{-1/4}\).

Write the projected vector in the original basis as \(\sum_d c_d b_d\). Define
\[
 K=A^{-2(1-\theta_0)},\qquad
 E=B^{-11/10}D^{31/20}+X^{-1}D^{3/2}.
\]
The same Schur complement argument gives \(\sum_{d\ne1}|c_d|^2\ll_\epsilon U^\epsilon K E\). To return to the original basis, subtract the \(b_1\) components of the vectors \(b'_d\). Their squared coefficients against \(b_1\) sum to \(O_\epsilon(U^\epsilon X^{-1}D^{3/2})\) by the stronger Gram entry at label \(1\). Since both terms in \(E\) have negative exponents in the detector window, Cauchy–Schwarz gives \(|c_1|^2\ll_\epsilon U^\epsilon K\).

## Separate exceptional labels in the full average

Let \(w\) be the fixed nonnegative smooth row majorant of the signed range argument. Write the good part of each nonzero row \(u\) as \(d_u j^6\), with \(d_u\) sixth-power-free. The \(d\)-polynomial has a nonprincipal inducing character at a good prime whenever \(d\ne d_u\), even after a fixed ray expansion. Keep the original zeros at \(j\) and at all other deleted primes. On these regular pairs the same zero-slot ordinary moment used in the column projection applies on the full smooth row range. The unit label has squared row norm \(O_\epsilon(U^{1+\epsilon})\), and the sum of the squared regular norms over the other labels is \(O_\epsilon(U^{1+\epsilon}D^2)\). Thus the total regular contribution has squared norm
\[
 \ll_\epsilon U^{1+\epsilon}K(1+D^2 E).
\]
It still fits the fixed \(U^{1.104+\epsilon}\) budget from the previous note.

For a fixed exceptional label \(d\), the number of rows with \(d_u=d\) and norm \(O(U)\) is \(O_\epsilon(U^{1/6+\epsilon}(\mathrm Nd)^{-1/6})\). Indeed, count the sixth roots at norm at most a constant times \((U/\mathrm Nd)^{1/6}\) and sum the finitely supported bad-prime powers and units. The trivial normalized polynomial bound is \(O(X^{1/2})\) on each row. Each row belongs to at most one exceptional label, so no Cauchy–Schwarz factor for the number of labels is needed on this part. Its squared norm for \(d\ne1\) is at most
\[
 U^{1/6+\epsilon}XKE
 =U^{1/6+\epsilon}\left(
 A^{2\theta_0-1} B^{-1/10} D^{31/20}
 +A^{-2(1-\theta_0)}D^{3/2}\right).
\]
Both exponents are less than \(1.104\), using \(0.749<\beta<0.757,\ \gamma>0.374\). The exceptional unit label has the larger bound \(O_\epsilon(U^{1/6+\epsilon}A^{2\theta_0-1}B)\).

## Compare the unit label with the varying count budget

The sufficient exponent for this shortened mixed block is
\[
 \mathcal B = R_0-\eta+\delta(\beta+\gamma)
             =\frac16+\frac56 t_0-\eta+\delta(\beta+\gamma-t_0).
\]
The unshortened block has at least this budget. The earlier whole-window calculation also gives \(\mathcal B>1.104\) with the small powerful cutoff included, as checked below. The two crossing identities \(I(b_0)=P(c_0)=R_0\) imply
\[
 (1-p)(b_0-2c_0)
 =\frac{2p}{\Lambda}\left(
    B_{\rm face}-1-\frac{\Lambda-2}{2}(1-2c_0)\right).
\]
In the replay \(B_{\rm face}=1-10^{-10},\ \Lambda=2+10^{-9}\). Hence \(b_0-2c_0\ge-10^{-8}\). The short-factor windows and the powerful-part cutoff imply \(\beta-2\gamma>-0.00033\) and \(\beta+\gamma\le t_0+1/13000+1/26000\), up to the allowed vanishing losses.

With \(V=5/6-\delta\), the difference between the available exponent and the unit-label bound is exactly
\[
 \mathcal B-\bigl[1/6+(2\theta_0-1)\beta+\gamma\bigr]
   = 2(7/8-\theta_0)\beta
      +(\beta-2\gamma)/12
      +V(t_0-\beta-\gamma)-\eta .
\]
Using the preceding inequalities and \(\beta>0.749\) leaves more than \(1/20000\) before the preliminary losses. The [Lean replay](ContactFactorization.lean) checks these rational margins and the separate nonunit estimates.

## Bound the original mixed polynomial on short-core rows

The same exceptional calculation also applies directly to the original mixed coefficient, before taking the projection. On a row \(u\) with good core \(d_u\), the sixth root only supplies a moving deletion of polynomial norm. The product of the two factor estimates in the [column overlap calculation](column-gauss-projection.md) is valid with this deletion and without the extra \(X^{-1/2}\) from the test vector. In particular, at \(d_u=1\) its squared size is \(O_\epsilon(U^\epsilon A^{2\theta_0-1}B)\), so the aggregate has the same unit-label bound as above. At \(d_u\ne1\) its squared size is
\[
 O_\epsilon\bigl(U^\epsilon A^{2\theta_0-1}B^{-1/10}(\mathrm Nd_u)^{11/20}\bigr).
\]
Here the primitive character is nonprincipal at a good prime. Summing over \(d_u\) of norm at most \(J\), with the sixth-root count for each label, gives the squared moment bound
\[
 \ll_\epsilon U^{1/6+\epsilon}A^{2\theta_0-1}B^{-1/10}J^{83/60}.
\]
At \(J=U^{0.293}\) its exponent is strictly below \(1.104\) on the detector window. Together with the unit-label comparison, this controls the entire full-average contribution from rows with good sixth-power-free core of norm at most \(U^{0.293}\) for the original mixed polynomial.

Consequently the removed column projection fits the varying squared moment budget on the full smooth row average. The same smooth majorant can be used for the orthogonal complement. A bound on that complement is still needed, in particular after the exact gcd decomposition. Estimates which used the original Möbius–ordinary factorization on each shortened column require separate justification if applied to the projected residual.

Prepared with OpenAI Codex assistance.
