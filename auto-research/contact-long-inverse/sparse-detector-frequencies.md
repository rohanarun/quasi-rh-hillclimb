# Sparse detector fibres and repeated row factors

The [squarefree row Poisson estimate](detector-dual-frequencies.md) applies to the weighted operator with column cutoff \(N=U^\nu\), \(\nu=0.8445\). Two further reductions use the actual detector row support. The required exponent is \(1-1/14000\) after including the outside slot cost \(w=0.014616\) in the squared norm. Write \(c=D^*z\) for the actual adjoint input.

## Large sixth-power factors in the frequencies

Use the exact \(g,e,\ell\) opening and the separated Poisson norms from the squarefree calculation. Write \(y=\log_U(U/\mathrm Ng)\), \(L=\mathrm N\ell\), \(\lambda=\log_U L\), and \(\kappa=\log_U(H/L)\) for a frequency dyad of norm \(H\). The retained Fourier support satisfies \(\kappa\le 2y-\nu+O(\epsilon)\). The already bounded large gcd range leaves \(0.8445\le y\le 1\), up to dyadic constants.

Write the good part of the frequency as \(k_0j^6\) and let \(\mathrm Nj\asymp U^f\). At fixed \(g,e,\ell\) either separated polynomial has at most \(O_\epsilon(U^{r+\epsilon})\) nonzero coefficients, where \(r=0.636\) is the detector fibre count from the [weighted row Gram reduction](weighted-detector-row-gram.md). Indeed, each surviving shortened index \(v\) comes from a distinct physical row \(gev\) in the same fibre. Pointwise Cauchy–Schwarz bounds the squared value by \(U^{r+\epsilon}\) times the squared mass of this sequence, with the smooth profile bounds kept. This estimate allows all the original zero masks.

There are \(O_\epsilon(U^\epsilon H U^{-5f})\) such frequencies in the dyad. One counts \(O(U^f)\) possible sixth roots and \(O(H U^{-6f})\) possible good primitive-power parts; the fixed bad-prime valuations and units cost subpowers. After multiplication by \(N/(L U^y)\), the separated squared energy has exponent, before the outside cost,
\[
 \nu+\kappa-y+r-5f\le y+r-5f+O(\epsilon).
\]
The same divisor multiplicity bound as before sums the shortened coefficient masses over \(g,e,\ell\). In particular \(f\ge 0.131\) fits the budget all the way to the Fourier cutoff. More generally, if \(k_0=\prod_{j'=1}^5 h_{j'}^{j'}\) has fixed dyadic layer sizes \(x_{j'}=\log_U\mathrm N h_{j'}\), the counting argument uses \(5f+\sum_{j'}(j'-1)x_{j'}\) in place of \(5f\). Consequently every block with this sum at least \(0.651\) also fits, independently of the primitive part's order.

For \(f\le 0.131\), use the four generic sieve terms from the squarefree calculation. Fourier support bounds their exponents by
\[
 y-5f,\quad \nu+f,\quad \nu/6+y-4f,\quad 2\nu/3+y/2-f.
\]
If \(f\ge y/2-0.4222\), the fourth is at most \(0.9852\), the third is at most \(\nu/6+4(0.4222)-y\le 0.98505\), and the first is no larger than the third. The second is at most \(0.9755\). Adding \(w\) leaves a strict margin. Together the two estimates cover the entire Fourier support when \(f\ge y/2-0.4222\). In particular the uniform cutoff \(f\ge 0.078\) suffices. These are bounds for the separated positive norms, so no cancellation among the large sixth-power frequencies is required.

## A fixed repeated part in the physical rows

For a sixth-power-free good row, write \(u=m v\), where \(m=\prod_{j=2}^5 m_j^j\) is the full repeated-prime part and \(v\) is squarefree and prime to \(m\). Work on a dyadic block of layer sizes. Put \(t=\log_U\mathrm Nm\) and \(\rho=\log_U\mathrm N\operatorname{rad}(m)\), so \(\rho\le t/2\) and the number of possible \(m\)'s is \(O_\epsilon(U^{\rho+\epsilon})\). Include the finite ray partition as before. Denote the corresponding restriction of the column operator by \(T_m\) and its actual input by \(c_m\). Then
\[
 \left\|\sum_m T_m^*c_m\right\|^2
 \ll_\epsilon U^{\rho+\epsilon}\sum_m\|T_m^*c_m\|^2.
\]
Thus a uniform bound for the fixed-\(m\) signed forms at the exponent reduced by \(\rho\) suffices for this block. The dyadic blocks themselves cost subpowers.

For fixed \(m\), the common column character factor from \(m\) leaves the exact mask \((n,m)=1\) in the column kernel. The remaining row indices \(v\) have scale \(U^{1-t}\). With exact gcd \(g\) between two such indices, the coprime quotients \(a,b\) are squarefree and prime to \(m g\). The coprime quotient pair has primitive ratio modulus \(ab\), and the ordinary column kernel has the additional deletion at \(m g\). In the Poisson calculation open it by \(\ell\mid\operatorname{rad}(m g)\). Use \(y=1-t-\log_U\mathrm Ng\). The same scalar, support condition and normalized frequency bounds apply with this \(y\) and the new \(\ell\). For fixed \(m\), summing the shortened masses costs only a divisor bound, since \(\ell\) divides the radical of the physical row and \(ge\) divides its squarefree quotient.

When \(t\le 0.030\), the four normalized bounds from the [squarefree Poisson calculation](detector-dual-frequencies.md) fit after adding \(\rho+w\) whenever
\[
 \kappa\le 0.844-6\rho.
\]
Their slopes in \(\kappa\) are \(1/2,1/6,1/2,1/4\), so the reduction by \(6\rho\) pays the full \(\rho\) for every term. In particular \(\kappa\le0.754\) works uniformly in this block. The absolute count for the large-power frequency layers also transfers: its upper exponent is \(y+r-5f+\rho+w\) with the same layer saving as above, and \(y+\rho\le1\).

For the same small-\(t\) block, the large gcd sector in the fixed-\(m\) signed forms is bounded for \(\mathrm Ng\ge U^{0.171}\). Apply the [unrestricted-column sieve](weighted-detector-row-gram.md) at shortened row length of exponent at most \(0.829-t\), retaining the common mask at \(m\). The four exponents including \(\rho\), before adding \(w\), are at most
\[
 \nu+0.015,\qquad \nu/6+0.829,\qquad
 \nu/3+5(0.829)/6,\qquad 5\nu/6+0.829/3+0.005.
\]
Here \(\rho\le t/2\) pays the shortening in the second and third terms, and the fourth uses \(t/6\le0.005\). All four have strict margins. This includes the physical diagonal.

The fixed-\(m\) reduction leaves the higher frequencies with small gcds inside each small repeated-part block. Larger repeated parts require a separate estimate. For squarefree rows the new large-sixth-power and layer-count estimates leave the high-frequency blocks with smaller power factors. The [Lean replay](ContactFactorization.lean) checks the rational margins.

Prepared with OpenAI Codex assistance.
