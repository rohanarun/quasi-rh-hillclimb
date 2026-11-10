# Dual sieve bounds for the signed frequency range

The [signed range reduction](signed-range.md) bounded very low Poisson frequencies by absolute counting. A second use of the sextic sieve bounds a larger range, including all frequencies with \(\mathrm Nk/\mathrm N\ell\le U^{0.618}\). This is a bound for part of the full smooth row average in the conditional route to \(\theta=0.87338\).

## Separate the dual columns before applying the sieve

Use the notation of the signed reduction. Freeze a dyad \(\mathrm Ng\asymp G\) for the exact common divisor of the two original squarefree columns. Write \(n_1=ga,\ n_2=gb\), with \(a,b\) coprime, squarefree and prime to \(g\), and put \(Y_0=X/G\). Freeze a row deletion divisor \(\ell\mid g\), with \(L=\mathrm N\ell\). In a nonzero dual dyad \(\mathrm Nk\asymp H\), put
\[
 y=\log_U Y_0,\quad \lambda=\log_U L,\quad
 \kappa=\log_U(H/L).
\]
Smooth Fourier decay lets us assume \(\kappa\le2y-1+O(\epsilon)\), after cutting a negligible tail. We need only \(\kappa\ge0\) here, since smaller frequencies are covered by the previous absolute estimate.

For coprime \(a,b\), CRT expresses the normalized primitive Gauss sum for \(\chi_a\overline{\chi_b}\) as two one-column normalized Gauss sums, a factor from sextic reciprocity, and the characters of \(k\). The reciprocity factor depends only on the fixed ray classes. The dilation by \(\ell\) gives fixed column twists. The radial Fourier kernel is a smooth function of the two column norms and the dual norm. Separate the two normalized column norms by Fourier inversion in their logarithms on fixed annuli. The resulting two one-column profiles are fixed for each Fourier integration variable, with a common integrable weight, uniformly on each retained dyad. Outer shells give arbitrary additional decay. This is the separation used in [Xu–Sang, §3.1–3.2](https://arxiv.org/html/2610.17675v2#S3.SS1), with the two actual column coefficients retained here.

Extend the separated tensor to all \(a,b\) and impose their coprimality with the exact Möbius projector. In the term indexed by \(e\), write \(a=ev_1,\ b=ev_2\); the \(v_i\) are squarefree, prime to \(ge\), and have length \(Y=X/(G\mathrm Ne)\). The Gauss factors depending on \(ev_i\) and the fixed ray factors are bounded column weights. The common character at \(e\) is kept with its zero. After taking absolute values of the signed divisor contributions, Cauchy–Schwarz over \(k\) permits two applications of the sextic sieve. We do not estimate a signed form by enlarging its row set. Only the positive norms resulting from Cauchy–Schwarz are enlarged.

Each shortened column has squared coefficient mass \(\ll_\epsilon (G\mathrm Ne)^{-1}U^\epsilon\). Summing the \(g,e\) dyads cancels that factor by ideal counting. The choices of \(\ell\mid g\) cost a subpower, with no extra factor of \(L\). The Poisson scalar remains \(U/(L Y_0)\). In particular it uses \(Y_0\), the scale before opening the coprimality projector. Frozen powers at the fixed bad primes of \(k\) can be separated into logarithmically many branches; they only shorten the good frequency scale and add bounded column twists.

## Account for the sixth-power part of the frequency

The [sextic sieve](https://arxiv.org/html/2610.17675v2#S2.SS2) for sixth-power-free rows and columns at lengths \(A,Y\) gives the four terms \(A,Y,A^{5/6}Y^{1/3},A^{1/3}Y^{5/6}\) up to subpowers. Write the good part of \(k\) as \(k_0 j^6\) with \(k_0\) sixth-power-free. For \(\mathrm Nj\asymp U^f\), freeze \(j\), retain its zero mask, and apply the sieve at row length at most \(H/U^{6f}\). The \(O(U^f)\) possible \(j\)'s multiply that bound. Using \(Y\le Y_0\) and the scalar \(U/(LY_0)\), the following exponents bound the contribution, with subpower losses and nonpositive multiples of \(\lambda\) omitted:
\[
 1+\kappa-y-5f,\qquad
 1+f,\qquad
 1+5\kappa/6-2y/3-4f,\qquad
 1+\kappa/3-y/6-f.
\]
Here \(6f\le \kappa+\lambda\), so the second exponent when \(\lambda\) is kept is \(1+f-\lambda\le1+\kappa/6\). For the sixth-power-free good frequency sector the second exponent is at most one.

Using \(y\ge(1+\kappa)/2-O(\epsilon)\) from the Fourier support, the first, third and fourth exponents are bounded by \((1+\kappa)/2,\ 2/3+\kappa/2,\ 11/12+\kappa/4\), respectively. Thus the full smooth moment budget \(U^{138/125+\epsilon}\) holds on each of these ranges:

| Dual frequency sector | Sufficient range |
| --- | --- |
| All good sixth-power factors allowed | \(\kappa\le 0.618\) |
| Sixth-power-free good part | \(\kappa\le 0.748\) |
| Sixth-power-free good part with \(y\ge 1.12\) | \(\kappa\le 0.870\) |
| Any fixed tower dyad | All four displayed exponents, including the available \(\lambda\) terms if needed, lie strictly below \(138/125\) |

The first three ranges have strict uniform margins checked in [the Lean replay](ContactFactorization.lean). The third uses \(y\ge1.12\) directly in the fourth term. All computations apply to the projected and shortened column coefficients from the original mixed moment. They do not require extending the ordinary moment to Gauss-weighted coefficients.

The high-frequency corner remains. At \(y=1.129,\ \kappa=2y-1=1.258,\ f=\lambda=0\), even the fourth term in this sieve estimate has exponent above \(138/125\). The generic dual estimate therefore localizes the signed cancellation still needed. It does not bound the full mixed moment or the complementary row projection.

Prepared with OpenAI Codex assistance.
