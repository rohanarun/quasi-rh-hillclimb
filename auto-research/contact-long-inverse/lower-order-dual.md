# Lower-order sieves for the dual frequency layers

The [dual sextic sieve](dual-sieve.md) and [cubic reflection](cubic-small-core.md) leave some large-core frequencies at the Fourier cutoff. Some of these can be estimated by the cubic or quadratic large sieve. In particular, a frequency whose good part is the square or cube of a squarefree ideal can be handled at the full Fourier cutoff, even when its sixth-power-free core is large.

## Freeze the complementary prime exponents

Keep the Poisson scalar \(U/(LY_0)\), the common-divisor dyad \(G\), the opened coprime-projector dyad \(E\), and \(Y_0=X/G=U^y\) from the [dual sieve](dual-sieve.md). Put \(e_0=\log_U E\) and \(\lambda=\log_U L\). Each separated column has length \(Y=Y_0/E\) and squared mass \(O_\epsilon((GE)^{-1}U^\epsilon)\). Counting the \(g,e\) dyads again cancels \(1/(GE)\).

After separating the fixed bad-prime part and unit, write the good part of the nonzero frequency uniquely as
\[
 k_{\rm good}=j^6h_1h_2^2h_3^3h_4^4h_5^5.
\]
The \(h_i\) are pairwise coprime and squarefree, and \(j\) can share primes with them. Freeze \(j\) in a dyad of exponent \(f=\log_U(\mathrm Nj)\), up to fixed dyadic constants. There are two ways to group the remaining factors:

| Sieve | Vary \(d\) | Freeze \(m\) | Representation |
| --- | --- | --- | --- |
| Cubic | \(h_2h_4^2\) | \(h_1h_3^3h_5^5\) | \(j^6md^2\) |
| Quadratic | \(h_3\) | \(h_1h_2^2h_4^4h_5^5\) | \(j^6md^3\) |

Use \(a=\log_U(\mathrm Nd)\), \(r=\log_U(\mathrm Nm)\), and \(c=\log_U(\mathrm N\operatorname{rad}(m))\) for the dyadic exponents. There are \(O(U^{c+f})\) frozen choices, by counting each squarefree factor and \(j\) at its own norm scale. For \(v=2\) or \(3\) in the two representations, Fourier support gives
\[
 va+r+6f\le 2y-1+\lambda+O(\epsilon).
\]
Fixed bad-prime powers only shorten the available scale.

For fixed \(j,m\), their symbols on the shortened columns are fixed weights of modulus at most one. Keep the original zeros, including the puncture at \(j\) and the common character zero at \(e\). The varying symbol is the cubic or quadratic residue symbol of \(d\), or its conjugate. The row constraints and the common zero at \(e\) can be dropped from the positive norms after Cauchy–Schwarz, since their weights have modulus at most one. CRT and the smooth column separation are unchanged. Thus the Gauss factors stay in the column coefficients, and their dependence on those columns does not affect an arbitrary-coefficient sieve. The column deletions still bound the coefficient mass from above.

In the cubic case \(d\) is cube-free. The cube-free version is needed to apply one sieve to both \(h_2\) and \(h_4\). It gives \(D+Y+(DY)^{2/3}\) at \(D=U^a\) by [de Faveri, Theorem 1.1](https://arxiv.org/html/2610.04045v1#Thmtheorem1). The quadratic case has squarefree \(d\) and gives \(D+Y\) by [Goldmakher–Louvel](https://arxiv.org/abs/1112.1642). Fixed ray refinements implement the primary residue-symbol conventions. For the quadratic symbol the necessary reciprocity phases are fixed on the ray fibres, so the symbol with \(d\) in the numerator also uses this bound. These applications enlarge only the two positive norms, with squarefree shortened columns in both cases.

## Sum the dyads

Multiplying the appropriate sieve bound by \(U^{1-y-\lambda+c+f}\) gives the following exponents for the signed contribution of a dyad, with arbitrarily small losses:
\[
 \begin{aligned}
 R_D&=1-y-\lambda+c+f+a,\\
 R_Y&=1-\lambda+c+f-e_0,\\
 R_{\rm mix}&=1-y-\lambda+c+f+\tfrac23(a+y-e_0)
       &&\text{(cubic case only).}
 \end{aligned}
\]
Any dyad where the applicable exponents are all strictly below \(1.104\) with a uniform margin fits the mixed-moment budget. For simple uniform sufficient ranges, impose \(c+f\le0.103\). Then \(R_Y\le1.103\). In the cubic case Fourier support gives \(R_D\le \tfrac12+c-r/2-2f-\lambda/2+O(\epsilon)\), and in the quadratic case \(R_D\le \tfrac23-y/3+c-r/3-f-2\lambda/3+O(\epsilon)\). Both bounds leave room. In the cubic case Fourier support also gives
\[
 R_{\rm mix}\le \tfrac23+y/3+c-r/3-f-\tfrac23(\lambda+e_0)+O(\epsilon).
\]
The detector windows give \(y<1.135\), so this is at most \(1.103+O(\epsilon)\) when \(c-r/3-f\le0.058\).

Thus the quadratic bound permits a squarefree cube layer with a complement of radical exponent \(c\le0.103-f\) at every retained frequency. The cubic bound permits a combined square and fourth-power layer when both displayed conditions on its complement hold. For example, with \(f=0\), every cubic-sieve complement of norm at most \(U^{0.087}\) is allowed, since \(c\le r\) gives \(c-r/3\le2r/3\). The bounds also cover much larger complement norms when most of the complement lies in higher powers. The [Lean replay](ContactFactorization.lean) checks the rational margins.

At \(y=1.129,\ \lambda=e_0=0\) and Fourier exponent \(1.258\), a pure square layer with \(a=0.629,\ c=r=f=0\) gives \(R_{\rm mix}<1.044\). Its sixth-power-free core can have norm on the full \(U^{1.258}\) scale, while the generic dual sextic bound has a term above \(1.104\) there. Pure squarefree cube layers also fit the quadratic estimate there. In contrast, a high squarefree sextic frequency has \(c=r\) equal to its full norm exponent in both groupings. That sector still requires a bound using additional structure in the columns or the signed frequency sum.

Prepared with OpenAI Codex assistance.
