# Dual frequencies for the squarefree detector row Gram matrix

The [weighted row Gram reduction](weighted-detector-row-gram.md) is on the actual detector rows and uses a column cutoff of norm \(N=U^\nu\), \(\nu=0.8445\). On its squarefree good rows the ratio character has a squarefree primitive modulus. A Poisson expansion in the column variable gives an estimate for a substantial part of its signed frequency range, with no enlargement of the original detector fibre.

## Exact gcd and column Poisson

Restrict the row operator to the squarefree good ideals in the fibre and fix one of their finitely many ray classes. The squared row norm adds over these classes and over the complementary nonsquarefree rows. Use the test vector \(z\) of actual marked inverse values and absorb the outside prime marks into \(D^*z\) as in the weighted reduction. Write this latter vector as \(c\); then \(\|c\|^2\ll_\epsilon U^{0.014616+\epsilon}\|z\|^2\).

The large-gcd sector has already been bounded. For \(\mathrm Ng<U^{0.1555}\), write the two good rows as \(ga,gb\), with \(a,b\) coprime and prime to \(g\). On this squarefree sector the good primitive ratio conductor is \(\mathrm N(ab)\), which is of order \(U^2/(\mathrm Ng)^2\). Thus these pairs are in the high-conductor range of the weighted reduction, and both lower-order components have support of this same size. Their ordinary column kernel has the extra Euler zeros at \(g\). Open them by \(\ell\mid g\) and put the column index equal to \(\ell\) times the new column variable. The fixed bad-prime masks and ray factors only introduce fixed lattice factors.

Poisson summation has zero complete mean for the primitive nonprincipal ratio, and its nonzero terms have scalar
\[
 \frac{N}{LY_0},\qquad L=\mathrm N\ell,\quad Y_0\asymp U/\mathrm Ng .
\]
On a frequency dyad of norm \(H\) put \(y=\log_U Y_0,\ \lambda=\log_U L,\ \kappa=\log_U(H/L)\). Fourier decay gives \(\kappa\le 2y-\nu+O(\epsilon)\) on the retained range. This is the primitive Gauss-sum Poisson identity used in the [signed column calculation](signed-range.md), with row and column roles interchanged. On coprime pairs CRT separates the Gauss factors and character values of the frequency. The radial kernel is separated in the two normalized quotient norms with an integrable Fourier majorant, as in the [dual sieve](dual-sieve.md).

Insert the exact coprimality projector and write \(a=ev_1,\ b=ev_2\). For a fixed \(e\) the column length of each separated dual polynomial is \(Y_0/\mathrm Ne\). Each has squared coefficient mass at most a profile bound times \(\sum_v|c_{gev}|^2\); the actual fibre is retained in this sequence. Keep the frequency zeros at \(e\) and all the original Euler zeros. In summing \(g,e,\ell\), each physical row is counted at most a divisor power, so the sum of these masses costs only \(U^\epsilon\|c\|^2\). Cauchy–Schwarz applies to the two separated positive frequency norms.

## The generic dual range

Write the good frequency as \(k_0j^6\) with \(k_0\) sixth-power-free and \(\mathrm Nj\) at dyadic exponent \(f\). For fixed \(j\) apply the sextic sieve of [de Faveri, Theorem 1.1](https://arxiv.org/html/2610.04045v1#Thmtheorem1) at frequency cutoff \(H/U^{6f}\) and column cutoff \(Y_0/\mathrm Ne\), keeping the puncture at \(j\). Count \(O(U^f)\) choices. After multiplication by the Poisson scalar, the four sufficient exponents, before the outside-weight cost, are bounded by
\[
 \nu+\kappa-y-5f,\quad
 \nu+f-\lambda,\quad
 \nu+5\kappa/6-2y/3-4f,\quad
 \nu+\kappa/3-y/6-f .
\]
The last two omit nonpositive multiples of \(\lambda\) and \(\log_U\mathrm Ne\). Fixed bad-prime powers only shorten the good frequency scale.

Using \(y\ge(\nu+\kappa)/2-O(\epsilon)\) and \(6f\le\kappa+\lambda\), these are bounded by
\[
 (\nu+\kappa)/2,\qquad \nu+\kappa/6,\qquad
 2\nu/3+\kappa/2,\qquad 11\nu/12+\kappa/4 .
\]
After adding \(0.014616\) for \(\|c\|^2/\|z\|^2\), all four fit \(1-1/14000\) for \(\kappa\le0.844\). This includes arbitrary sixth-power parts and frequencies with \(H<L\). In the sixth-power-free good sector, when \(y\ge0.990\), the original four expressions with \(f=0\) give the same margin for \(\kappa\le0.916\).

## Additional power layers at the Fourier cutoff

One can also use the lower-order sieves on the dual frequencies. Write the good frequency as \(j^6 m d^v\). For the cubic sieve take \(v=2\), let the cube-free \(d\) combine the square and fourth-power layers, and freeze the other layers in \(m\). For the quadratic sieve take \(v=3\), let squarefree \(d\) be the cube layer, and freeze its complement in \(m\). Put \(a_0=\log_U\mathrm Nd,\ r=\log_U\mathrm Nm,\ c_0'=\log_U\mathrm N\operatorname{rad}(m)\). The \(O(U^{c_0'+f})\) frozen choices only multiply the sieve bound. The moving character on the shortened row coefficients now has order three or two. This is the [lower-order dual calculation](lower-order-dual.md) with the new Poisson scalar.

The row-length and column-length terms have exponents \(\nu-y-\lambda+c_0'+f+a_0\) and \(\nu-\lambda+c_0'+f-\log_U\mathrm Ne\). In the cubic case there is also the term \(\nu-y-\lambda+c_0'+f+\tfrac23(a_0+y-\log_U\mathrm Ne)\). Use Fourier support \(va_0+r+6f\le 2y-\nu+\lambda+O(\epsilon)\). The row-length term is then at most \(\nu/2+c_0'\) for the cubic grouping and \(2\nu/3+c_0'\) for the quadratic grouping. The cubic mixed term is at most
\[
 2\nu/3+y/3+c_0'-r/3-f+O(\epsilon).
\]
It follows that \(c_0'+f\le0.140\) suffices for the quadratic grouping at every retained frequency. The cubic grouping also requires \(c_0'-r/3-f\le0.088\). For example, pure square and cube layers with no sixth-power part fit all the way to the Fourier cutoff. The [Lean replay](ContactFactorization.lean) checks the margins with the outside prime weight included.

This isolates the unresolved high-frequency sectors for the squarefree detector row norm. The remaining signed estimate still uses the actual weighted marked inverse vector. Rows with repeated good primes require their own bound or a version retaining the different primitive ratio moduli.

Prepared with OpenAI Codex assistance.
