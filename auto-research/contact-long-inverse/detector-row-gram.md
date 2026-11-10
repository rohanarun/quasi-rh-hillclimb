# Reduce the marked inverse moment to high-conductor row pairs

The [short-factor reduction](factorization.md) gives a sufficient saving on \(M_bQ_b\) on the actual joint saturation fibre. This note treats its row Gram matrix directly on that fibre. Large row gcds and small primitive ratio conductors fit the required budget. The remaining signed estimate only needs to be tested on the vector of actual marked inverse values.

## Row operator for the marked inverse product

Fix the common presentation, the selected prime slots, and a separated smooth test in the short-factor window. The marked product \(M_b Q_b\) is a polynomial with column length at most \(N=U^{0.8781}\), since its total marked length is at most \((1-b)/2\) and \(b<0.756+1/13000\). Its coefficient vector has squared mass \(O_\epsilon(U^\epsilon)\): the fixed number of divisor allocations is bounded by a divisor power, and central normalization supplies the bound \((\mathrm Nn)^{-1/2}U^\epsilon\) on each column. Use a smooth nonnegative radial column weight \(\varphi(\mathrm Nn/N)\) equal to one on its support. The operator \(T\) has entries \(\varphi(\mathrm Nn/N)^{1/2}\psi_u(n)\), where \(u\) ranges over the actual fibre. The coefficient vector \(a\) of the marked product then satisfies \(Ta=(M_b(u)Q_b(u))_u\). Common norm-height parameters can be fixed before applying the bound, with the inherited profile and height losses in a later Sobolev step.

In the Gram kernel \(TT^*\), allow all columns in the smooth cutoff. This makes each entry a plain character sum. The common finite twist \(\nu\) in the row presentation cancels in the ratio, with its Euler zeros retained as a fixed mask. Fix the bad-prime digits and unit data on the physical rows, so the good row ideals have norm comparable to \(U\) and are sixth-power-free. All gcds below are of these good ideals.

## Large common divisors of physical rows

For the exact row gcd \(g\), write \(u=ga,\ v=gb\), with \((a,b)=1\). The factor at \(g\) is exactly the puncture \((n,g)=1\). Open \((a,b)=1\) with \(\sum_{e\mid a,b}\mu(e)\) and write \(a=ea', b=eb'\). For any row test vector \(z\), the resulting term is a signed squared column norm of the row coefficients \(z_{gea'}\), with the puncture at \(ge\). The shortened rows remain sixth-power-free. This is an identity on the actual fibre: the coefficient is zero whenever the original row \(gea'\) does not belong to it. Keep the diagonal in this decomposition, since its exact good gcd has norm comparable to \(U\).

For fixed \(g,e\), put \(H\asymp U/(\mathrm Ng\,\mathrm Ne)\). By duality in the sextic sieve, the squared operator bound for sixth-power-free rows at \(H\) and all columns at \(N\) is, up to subpowers,
\[
 N+N^{1/6}H+H^{5/6}N^{1/3}+H^{1/3}N^{5/6}.
\]
To see the unrestricted-column term, split the good column into its sixth-power-free part and a sixth power. For a fixed root, its character is a zero mask on the row coefficients. The new column cutoff is \(N/(\mathrm N\text{root})^6\). Summing the four sieve terms over the roots changes the pure row term \(H\) into \(N^{1/6}H\), and the other three terms sum with a subpower cost. The finite bad-prime data can be separated at the outset. [De Faveri, Theorem 1.1](https://arxiv.org/html/2610.04045v1#Thmtheorem1).

For \(\mathrm Ng>U^{0.196}\) we have \(H\ll U^{0.804}\). All four displayed terms are strictly below \(U^{1-1/14000}\) in exponent. Sum the squared coefficient masses before bounding them: each row is counted in at most a divisor power of pairs \(g,e\), because \(ge\) divides its good ideal. The sum is therefore bounded by \(U^\epsilon\|z\|_2^2\). This proves that the signed Gram contribution of the entire large-gcd sector, including the true diagonal, is \(O_\epsilon(U^{1-1/14000+\epsilon}\|z\|_2^2)\).

## Small primitive ratio conductors

For a pair with smaller gcd, the two quotient ideals \(a,b\) are coprime, and the ratio character has good primitive conductor supported on \(\operatorname{rad}(ab)\), with every prime there active. It is nonprincipal at a good prime: if the quotient ideals were both units, the original gcd would already be in the large sector. Any canceled character at a prime of \(g\) still has the original zero there.

Let \(Q\) be the primitive ratio conductor norm. For the smooth entry in \(TT^*\), expand the extra punctures by divisors and complete the resulting sums of the primitive nonprincipal ratio. Each term is \(O(\sqrt Q)\) uniformly in the shortened scale. Indeed the zero frequency vanishes and the other complete sums have size at most \(\sqrt Q\); the planar lattice count with the smooth transform gives the bound at every scale. Fixed ray conditions only change the constant. The extra divisor count is a subpower. This is the same smooth completion used in the [centered shell calculation](centered-dual-shell.md).

The inherited fibre bound is \(O_\epsilon(U^{R_0+\epsilon})\), with \(R_0<0.636\) by \(R_0=1-\delta[p+(1-p)b_0]\), \(\delta\ge0.417,\ p\ge0.499,\ b_0>0.750\). For \(Q\le U^{0.727}\) the maximum absolute row sum of the restricted Gram matrix is therefore at most \(U^{0.636+0.727/2+\epsilon}\). The symmetric conductor and gcd restrictions give the same column sum bound. This exponent is below \(1-1/14000\). The [Lean replay](ContactFactorization.lean) checks this comparison and the large-gcd margins.

## A remaining estimate for the actual vector

Let \(K_{\rm rem}\) be the Gram kernel restricted to pairs with good gcd at most \(U^{0.196}\) and primitive ratio conductor above \(U^{0.727}\). It is sufficient to prove
\[
 |\langle K_{\rm rem} z,z\rangle|
     \ll_\epsilon U^{1-1/14000+\epsilon}\|z\|_2^2
       \qquad\text{for }z=Ta.
\]
Indeed \(\|z\|_2^4\le \|a\|_2^2\langle TT^*z,z\rangle\) by Cauchy–Schwarz. The two estimated sectors then give the desired marked moment with the usual subpower losses. The required input is a signed estimate on actual detector rows and their actual marked inverse values, with the same fibre and profile uniformity as in the short-factor reduction. The high-conductor, small-gcd sector remains open.

Prepared with OpenAI Codex assistance.
