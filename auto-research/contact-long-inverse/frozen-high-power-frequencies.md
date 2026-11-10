# Freeze selected high power divisors of the dual frequencies

In the [squarefree detector row Poisson calculation](detector-dual-frequencies.md), the column cutoff is \(U^\nu\), \(\nu=0.8445\). On a frequency block the separated norms have scalar \(U^{\nu-y-\lambda}\) and shortened squarefree column length \(U^{y-e_0}\), where \(e_0=\log_U\mathrm Ne\) is the exponent of the coprimality-projector divisor. Use \(\kappa=\log_U(H/L)\) as there. The required bound before the outside weight is \(1-1/14000-0.014616\). Here a frequency may have both a large squarefree first-power layer and a sizable fifth-power layer, so that neither lower-order sieve sees a small complement.

## Separate selected fourth- and fifth-power divisors

Write the good frequency as \(j^6 h_1 h_2^2 h_3^3 h_4^4 h_5^5\) as in the [sparse detector estimate](sparse-detector-frequencies.md). Fix a dyad of \(j\) with norm exponent \(f\). Select \(d_4\mid h_4,\ d_5\mid h_5\) in prescribed dyads with exponents \(s_4,s_5\). The block can require either entire layers or just the existence of divisors in the prescribed dyads. In the latter case assign each frequency to one admissible pair, using a fixed ordering. This assigns each frequency exactly once. For fixed \(j,d_4,d_5\) the residual label is sixth-power-free, and its norm cutoff has exponent at most
\[
 a=\kappa+\lambda-6f-4s_4-5s_5.
\]
Fixed bad-prime powers can only shorten this length. Empty blocks are discarded.

The extracted character factor is a fixed multiplier of modulus at most one in the separated column coefficients. In particular, a sixth-power factor still imposes its Euler zero, and primes shared by that factor and the residual label retain their original zeros. Reciprocity phases are fixed on the ray pieces or absorbed into these coefficients, as in the original separation. For a fixed extracted factor the remaining label parametrizes the frequencies injectively, up to the fixed units and bad-prime pieces. The selection conditions and remaining row constraints can therefore be relaxed in each of the two positive norms. The test profiles remain in the same separated representation with the common integrable majorant. The [sextic sieve](https://arxiv.org/html/2610.04045v1#Thmtheorem1) applies at scales \(U^a,U^{y-e_0}\), with the same upper bound for the shortened column mass. Counting \(j,d_4,d_5\) costs \(U^{f+s_4+s_5+\epsilon}\), and summing \(g,e,\ell\) still uses divisor multiplicity on the original detector rows.

Put \(C=f+s_4+s_5\) and \(B=f+s_4/3+2s_5/3\). Multiplying the four sieve terms by the Poisson scalar and the count of extracted choices gives exponents at most
\[
\begin{aligned}
 &\nu+\kappa-y-5f-3s_4-4s_5,\\
 &\nu-\lambda-e_0+C,\\
 &\nu+5\kappa/6-2y/3-\lambda/6-e_0/3
                      -4f-7s_4/3-19s_5/6,\\
 &\nu+\kappa/3-y/6-2\lambda/3-5e_0/6-B.
\end{aligned}
\]
The third term saves at least \(4B\) and the first saves at least \(5B\). At the full Fourier cutoff \(\kappa\le 2y-\nu+O(\epsilon)\), these are bounded by \(y-5B,\ \nu+C,\ \nu/6+y-4B,\ 2\nu/3+y/2-B\), up to \(O(\epsilon)\). In the small-gcd squarefree calculation \(y\ge0.8445\). It therefore suffices that
\[
 C\le0.140,\qquad B\ge y/2-0.4222.
\]
The fourth term is then at most \(0.9852\). The third is at most \(\nu/6+4(0.4222)-y\le0.98505\), and the first is no larger than the third. The second is at most \(0.9845\). All four fit after adding the outside cost.

## A mixed block at the Fourier cutoff

For \(f=0\), a fifth-power divisor with norm exponent in \([0.117,0.140]\) suffices throughout the Fourier range, regardless of the first-power layer. Such a divisor exists, for example, if \(h_5\) has norm at least \(U^{0.117}\) and every prime of \(h_5\) has norm at most \(U^{0.020}\). Multiply successive prime factors until their norm first reaches \(U^{0.117}\). The overshoot puts the result below \(U^{0.137}\). The inequalities are stable under dyadic scale constants.

At \(y=1\) consider \(h_1\) of norm \(U^{0.400}\) and \(h_5\) of norm \(U^{0.150}\), with a divisor of norm \(U^{0.120}\) in \(h_5\) and all other layers trivial. For \(\lambda=e_0=0\), the frequency exponent is \(1.150\), within the \(1.1555\) cutoff. The previous generic estimate and the sparse layer count both exceed the budget on this block. Neither lower-order grouping gives a moving symbol of smaller order, and freezing the entire fifth layer makes the second sieve term exceed the budget. Selecting only the stated divisor gives \(C=0.120,\ B=0.080\). This block therefore fits, including its signed contribution after Cauchy–Schwarz in the two separated norms. The [Lean replay](ContactFactorization.lean) checks the numerical comparisons.

This estimate leaves high frequencies with insufficient extractable fourth- and fifth-power factors. In particular it does not supply the required cancellation for the high squarefree frequency block.

Prepared with OpenAI Codex assistance.
