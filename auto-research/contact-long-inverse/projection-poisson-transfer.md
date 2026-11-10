# Transfer the signed Poisson estimates to the projected residual

The [asymmetric joint projection](asymmetric-joint-projection.md) was charged in the full row norm. For the signed Poisson analysis one also needs to control its contribution after separating the frequency blocks and taking absolute values. A divisor-weighted coefficient estimate gives this control at the varying count budget. It transfers the previously bounded frequency sectors whenever the argument bounded the separated positive column norms.

## A universal bound for the separated column energies

Fix a good squarefree column annulus of scale \(X=U^x\) in the detector window, and a coefficient vector \(c=(c_n)\) on it. Use the exact common divisor \(g\) and row deletion \(\ell\mid g\) in the [signed reduction](signed-range.md), and the opened coprimality divisor \(e\) in the [dual sieve](dual-sieve.md). Let \(G=\mathrm Ng,\ E=\mathrm Ne,\ L=\mathrm N\ell,\ Y_0=X/G,\ Y=Y_0/E\), up to the dyadic scale constants. Put \(y=\log_U Y_0,\ \lambda=\log_U L\).

After the norm-profile separation the two column sums may have different weights and conjugations. For either side, take its squared norm in \(k\), retaining its original zero masks, and use a common integrable majorant for the separating kernel. Include the scalar \(U/(LY_0)\). Sum these nonnegative energies over \(g,e,\ell\), the frequency dyads and the separating parameters. Denote the result for either side by \(\mathcal E_\pm(c)\). The same definition can be restricted to any set of blocks. Cauchy–Schwarz over this common measure bounds a bilinear signed remainder with column vectors \(c,c'\) by \(\mathcal E_+(c)^{1/2}\mathcal E_-(c')^{1/2}\).

At frequency length \(H\) the full element-row sextic sieve has four terms
\[
 H,\quad H^{1/6}Y,\quad H^{5/6}Y^{1/3},\quad H^{1/3}Y^{5/6}.
\]
This follows by freezing the sixth root and applying the sixth-power-free sieve, with all moving zeros retained. [Xu–Sang, §2.2](https://arxiv.org/html/2610.17675v2#S2.SS2). The squarefree shortened column has squared mass bounded by \(\sum_{v}|c_{gev}|^2\), times the squared profile bounds. The scalar remains \(U/(LY_0)\) even after shortening by \(e\). With \(h=\log_U H\), Fourier support gives \(h\le 2y-1+\lambda+O(\epsilon)\). Multiplying each of the four terms by the scalar gives exponents bounded above by
\[
 y,\qquad \tfrac56+y/3,\qquad \tfrac16+y,\qquad \tfrac23+y/2
\]
up to subpowers, since all omitted terms involving \(\lambda\) and \(\log_U E\) are nonpositive. All four fit \(1/6+x\), using \(y\le x\) and \(x>1\). This argument also includes the nonzero frequencies below \(L\). Rapid Fourier decay handles the exterior shells, as in the dual sieve.

The column masses must be summed before estimating them by a dyadic supremum. For each \(n\), the number of pairs \(g,e\) with \(ge\mid n\) is at most \(\tau(n)^2\), and \(\ell\mid g\) adds another divisor bound. Thus the total coefficient mass is at most \(U^\epsilon\|c\|_2^2\). The dyads and integrated profile bounds cost subpowers. We obtain, for either side and for every restriction to a set of blocks,
\[
 \mathcal E_\pm(c)\ll_\epsilon U^{1/6+\epsilon}X\|c\|_2^2.
\]
The physical diagonal separately has the smaller coefficient-uniform bound \(O_\epsilon(U^{1+\epsilon}\|c\|_2^2)\). The assertion about the energies concerns the off-diagonal Poisson decomposition.

## Pay for the removed vector in these energies

Let \(a\) be the actual mixed coefficient and \(p=\Pi a\) the vector removed by the asymmetric joint projection. Put \(\theta_0=8749/10000\), \(K=A^{-2(1-\theta_0)}\), and retain \(L_{\rm div}=U^{1/100000}\) for the cutoff of the divisor basis. The separate unphased projection has squared coefficient mass at most \(U^\epsilon K L_{\rm div}^2\): its nonunit coefficient estimate is \(U^\epsilon K L_{\rm div}^6 E_{\rm lab}\), with
\[
 E_{\rm lab}=B^{-(2-\theta_0)}D_0^{2-\theta_0/2}+X^{-1}D_0^{3/2},
 \qquad D_0=U^{0.199}.
\]
Both terms in \(L_{\rm div}^4 E_{\rm lab}\) have strictly negative exponents. The diagonal Gram upper bound turns these coefficient estimates into the same estimates for column mass. The correction for adding the phased family costs
\[
 U^\epsilon\left(K_G+U^{-0.036}K L_{\rm div}^2\right),\qquad
 K_G=X^{-1}B^{3/2}W^{1/2}D_1^2,\quad D_1=U^{0.184}.
\]
Here \(K_G/K\) has exponent at most
\[
 (1-2\theta_0)(0.749)+0.379/2+2(0.184)+10^{-6}/2<0.
\]
Choose the smooth mode exponent sufficiently small that its polynomial cost in these bounds is at most \(U^{1/100000}\), as allowed by the joint projection. Hence
\[
 \mathcal E_\pm(p)\ll_\epsilon
 U^{1/6+\epsilon}XK\,U^{3/100000}.
\]
The exponent of \(U^{1/6}XK\) is the unit-label exponent
\(\tfrac16+(2\theta_0-1)\beta+\gamma\).
It lies more than \(1/20000\) below the varying budget
\(\mathcal B=R_0-\eta+\delta(\beta+\gamma)\), by the [full projection calculation](full-column-projection.md). Thus both full separated energies of the removed vector fit the budget, with a fixed margin. The [Lean replay](ContactFactorization.lean) checks the coefficient comparisons and the extra mode and divisor costs.

## Transfer the sectors with positive energy bounds

Let \(\mathcal S\) be a frequency sector where both \(\mathcal E_\pm(a;\mathcal S)\) fit the budget. For \(a-p\), the squared energy in each sign is bounded by twice the sum of the corresponding energies of \(a\) and \(p\). Hence the signed estimate holds on the same sector for the residual. Equivalently, expanding the signed form gives two mixed terms, each controlled by the geometric mean of one original and one projection energy. This argument never requires a Möbius factorization of \(p\) or of \(a-p\).

The [small-core cubic reflection sector](cubic-small-core.md) is an example: the pointwise column argument there bounds each separated squared norm after summation, so it transfers even though the residual coefficients no longer have the Möbius–ordinary form. The generic and lower-order dual-sieve sectors transfer by the same argument. A sector controlled only by cancellation in a signed sum, with no separate energy estimates, requires a different transfer argument. The remaining high-frequency energy of the actual residual is still open.

Prepared with OpenAI Codex assistance.
