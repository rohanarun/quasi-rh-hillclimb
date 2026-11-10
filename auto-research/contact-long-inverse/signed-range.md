# Localize the signed coprime-column moment

This continues the [squarefree mixed-moment route](squarefree.md) to the conditional scalar target \(\theta=0.87338\). It removes ranges of the squared row norm from the open estimate. The remaining signed cancellation is open.

Fix one of the small powerful parts, its allocation and a common separated profile as in the squarefree reduction. Write the resulting polynomial as
\[
 F(u)=\sum_{\substack{n\ \mathrm{squarefree}\\\mathrm Nn\asymp X}}a_n\chi_n(u),\qquad X=U^s.
\]
The fixed ray twist on the columns is included in \(a_n\), which is \(O_\epsilon(X^{-1/2}U^\epsilon)\) by divisor counting. Both coefficient factors and the moving common deletion are still those of the mixed polynomial. The allocation and squarefree conditions are imposed before collecting coefficients. The length satisfies \(s\le 1.134+1/13000+1/26000\), from the two crossing enclosures and the upper endpoints in the [factorization window](factorization.md). The squared norm budget is \(U^{138/125+\epsilon}\) for a full smooth moment. A row-restricted proof can use the varying budget \(U^{R_0-\eta+\delta s_{\rm original}+\epsilon}\) before the small powerful parts are removed.

## Exact common-divisor decomposition

In the squared norm, let \(g=(n_1,n_2)\). For a fixed \(g\), write \(n_1=ga,n_2=gb\). Both residual columns are prime to \(g\), and \((a,b)=1\). Open this last condition by the Möbius projector and write \(a=ev_1,b=ev_2\). With \(v_i\) squarefree and prime to \(ge\), the contribution from this \(g\) is a signed sum, over \(e\), of squared row norms of the coefficient sequence \(a_{ge v}\), with coefficient \(\mu(e)\) and the row restriction \((u,ge)=1\). Indeed the common character factor has squared absolute value equal to precisely that restriction. The sequence has squared coefficient mass \(O_\epsilon((\mathrm Ng\,\mathrm Ne)^{-1}U^\epsilon)\) and residual length \(X/(\mathrm Ng\,\mathrm Ne)\). The identity includes the diagonal. It is valid on any row subset with a nonnegative weight.

### On the actual detector rows

Use the old \(t_0\) detector count \(O_\epsilon(U^{R_0+\epsilon})\) on the whole amplitude bin. For each \(g,e\), allocate \(ge\) between the two original column factors. This gives the same coprime squarefree mixed polynomial with a common deletion and a shorter combined length, multiplied by \((\mathrm Ng\,\mathrm Ne)^{-1/2}\) and bounded character and Möbius factors. The allocation costs a divisor bound. The pointwise argument in the [squarefree reduction](squarefree.md) bounds the corresponding squared row norm by
\[
 \ll_\epsilon \frac{U^{R_0+\delta s+\epsilon}}{(\mathrm Ng\,\mathrm Ne)^{1+\delta}}.
\]
It applies to the shortened annuli and their masks. Summing \(e\) and then \(\mathrm Ng>U^{1/20000}\) bounds that part of the **signed** quadratic form in absolute value by \(U^{R_0+\delta s-\delta/20000+\epsilon}\). This fits the varying budget since \(\delta/20000>\eta\) uniformly. The diagonal separately costs \(U^{R_0+\epsilon}\).

A proof on the detector rows therefore needs only the signed part with \(\mathrm Ng\le U^{1/20000}\). This does not allow enlarging just that part to a smooth full row average. The truncated signed form need not be nonnegative.

### On the full smooth average

Alternatively, majorize the original nonnegative norm by a smooth sum over all element rows of norm \(O(U)\). For \(\mathrm Ng>U^{13/40}\), the residual length after opening the projector is at most \(U^{81/100}\), with room for fixed dyadic constants. The sextic sieve on sixth-power-free rows and columns has terms \(A+Y+A^{5/6}Y^{1/3}+A^{1/3}Y^{5/6}\) at scales \(A,Y\). For the full average, split the rows into a sixth-power-free part and a sixth power. At a sixth-root dyad \(H\), the available row scale is \(U/H^6\) and the number of roots is \(O(H)\). The extra term after summing is \(U^{1/6}Y\). The common root contributes only an Euler deletion, which does not increase the column coefficient norm. Thus the four resulting terms are \(U,\ U^{1/6}Y,\ U^{5/6}Y^{1/3},\ U^{1/3}Y^{5/6}\), up to small powers. Each fits \(U^{138/125+\epsilon}\) for \(Y\le U^{81/100}\). Summing the dyadic \(g,e\) costs only small powers because of the factor \(1/(\mathrm Ng\,\mathrm Ne)\) in the squared mass. The diagonal costs \(U^{1+\epsilon}\). [Sextic sieve and residue-symbol conventions](https://arxiv.org/html/2610.17675v2#S2.SS2).

For the remaining full-average pairs retain **exact** \(g\) and keep the residual columns \(a,b\) coprime. Open the row deletion \((u,g)=1\) by summing \(\ell\mid g\) and put \(u=\ell v\). The product character on \(v\) is primitive of modulus \(ab\) for an off-diagonal pair. The factors at the fixed bad primes can be separated into a fixed number of residue classes, or absorbed into the fixed lattice conventions. Poisson summation on the Eisenstein lattice gives zero at frequency zero and a coefficient of size
\[
 \ll \frac{U}{\mathrm N\ell\sqrt{\mathrm N(ab)}}
\]
per frequency, before the bounded transform of the smooth row weight. The transform is rapidly decreasing beyond \(\mathrm Nk\asymp \mathrm N(ab)\mathrm N\ell/U\). Keep the phase of the primitive Gauss sum and of the row dilation in the signed remainder. This is the standard primitive Gauss-sum Poisson expansion. [Xu–Sang's first Poisson step](https://arxiv.org/html/2610.17675v2#S3.SS1).

Frequencies with \(0<\mathrm Nk/\mathrm N\ell\le U^{103/1000}\) fit the budget even in absolute value. In a dyad \(\mathrm Ng\asymp G\), there are \(O(G)\) choices of \(g\), \(O((X/G)^2)\) residual pairs, a subpower number of \(\ell\)'s, and \(O(U^{103/1000}\mathrm N\ell)\) frequencies. Since \(\sqrt{\mathrm N(ab)}\asymp X/G\) and \(|a_{ga}\overline{a_{gb}}|\ll X^{-1}U^\epsilon\), the product of these factors is \(O_\epsilon(U^{1+103/1000+\epsilon})\). The diagonal and both eliminated full-average ranges have strict exponent margins, checked in [the Lean replay](ContactFactorization.lean).

Thus a sufficient full-average estimate is signed cancellation at scale \(U^{138/125+\epsilon}\) for
\[
 \mathrm Ng\le U^{13/40},\qquad
 U^{103/1000}<\mathrm Nk/\mathrm N\ell\ll_\epsilon X^2/(U(\mathrm Ng)^2)\,U^\epsilon,\qquad \ell\mid g .
\]
The norm over the original detector rows is controlled if the **whole** smooth majorant is bounded. The exact-gcd, small-frequency calculation uses a different decomposition from the Möbius opening used to bound large \(g\).

## Coefficients for the remaining Gauss sum

When allocating a squarefree residual column \(n'=i'j'\) between its inverse and ordinary factors, \(\mu(i')=\mu(n')\mu(j')\). This lets the \(\mu(n')\) term enter the usual sextic-to-cubic Gauss conversion for a coprime quotient column. It leaves \(\mu(j')\) on the divisors assigned to the ordinary factor, together with their profile and coprimality restrictions. Common divisors and row deletions are retained as above. The known cubic-theta estimates for a single inverse column do not directly bound this divisor-weighted, signed average. A bound for that remainder, or a detector-row estimate with its smaller common-divisor range, remains necessary before the candidate can be claimed.

Prepared with OpenAI Codex assistance.
