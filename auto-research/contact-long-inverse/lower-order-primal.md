# Lower-order inverse averages on the physical row layers

The [inverse average at core scale](core-inverse-average.md) covers every core of norm at most \(U^{0.783}\). On some larger cores the varying part of the row character has order three or two. A lower-order sieve on the inverse factor, paired with the conductor estimate for the ordinary factor, gives a bound at the required exponent in these sectors. This is an estimate on the original smooth rows before Poisson summation.

## Freeze the complementary layers

As before write the good row as \(j^6 h_1h_2^2h_3^3h_4^4h_5^5\). The \(h_i\) are pairwise coprime and squarefree, with dyadic norm exponents \(x_i\). Put \(t=\sum i x_i,\ r=\sum x_i\). Let \(f\) be the norm exponent of the sixth root \(j\), so \(t+6f\le1\) up to fixed dyadic constants. Separate the fixed bad-prime part. Use either of the following groupings.

| Sieve | Vary \(d\) | Freeze \(m\) | Good core |
| --- | --- | --- | --- |
| Cubic | \(h_2h_4^2\) | \(h_1h_3^3h_5^5\) | \(md^2\) |
| Quadratic | \(h_3\) | \(h_1h_2^2h_4^4h_5^5\) | \(md^3\) |

Put \(a=\log_U\mathrm Nd,\ c=\log_U\mathrm N\operatorname{rad}(m)\), up to the dyadic constants. For fixed \(j,m\) the moving character on an inverse index \(n\) is the cubic or quadratic symbol of \(d\). Their other character factors become column weights of modulus at most one. The sixth root keeps its Euler deletion. There are \(O(U^{c+f})\) choices of frozen labels. In either grouping \(r\le a+c\), and \(a\le(t-c)/2\) or \(a\le(t-c)/3\), respectively.

Open the coprimality of the inverse and ordinary columns with the exact projector, as in the [core-scale average](core-inverse-average.md). For each opened divisor \(g\), the scalar has modulus at most \(1/\mathrm Ng\) and the inverse length is \(A/\mathrm Ng\). The normalized inverse coefficient mass is bounded by a subpower, with all common masks included. The cubic sieve applies to cube-free \(d=h_2h_4^2\) and squarefree inverse indices. At \(D=U^a\) its three squared norm terms are \(D,\ A/\mathrm Ng,\ (DA/\mathrm Ng)^{2/3}\), by [de Faveri, Theorem 1.1](https://arxiv.org/html/2610.04045v1#Thmtheorem1). The quadratic sieve on squarefree \(d\) and inverse indices has the first two terms, by [Goldmakher–Louvel](https://arxiv.org/abs/1112.1642). Fixed ray conventions identify the residue symbols, and the remaining row restrictions may be dropped in the resulting positive norms. The common-divisor row scalar may also be dropped there. The original ordinary factor stays on the original row, with conductor at most a fixed multiple of \(U^r\).

## Keep the ordinary conductor through the divisor sum

Let \(\theta_0=8749/10000,\ \alpha=(1-\theta_0)/2,\ \lambda=\theta_0-1/2\), as in the [ordinary conductor bound](primitive-conductor-ordinary.md). On nonunit cores the normalized ordinary factor at length \(T=B/\mathrm Ng\) is bounded by
\[
 U^\epsilon\min\{T^\lambda,T^{-\alpha}U^{\theta_0r/4}\}.
\]
Use Minkowski in \(g\). For the row term \(D\) in the inverse sieve, the harmonic sum costs only a logarithm times the maximum of this ordinary bound, attained at or before \(T=U^{r/2}\). For the column and cubic mixed terms, the square roots of the inverse sieve terms give additional weights \((\mathrm Ng)^{-1/2}\) and \((\mathrm Ng)^{-1/3}\), respectively. Both are summable against the harmonic weights even after the negative ordinary power contributes \((\mathrm Ng)^\alpha\). Thus these terms may use the minimum of the two ordinary estimates at \(B\) itself.

Write \(\beta=\log_U A,\ \gamma=\log_U B\), and define
\[
 P=\min\{(2\theta_0-1)\gamma,\lambda r\},\qquad
 L=\min\{(2\theta_0-1)\gamma,-(1-\theta_0)\gamma+\theta_0r/2\}.
\]
After squaring and summing the frozen labels, the sufficient exponents are
\[
 c+f+a+P,\qquad
 c+f+\beta+L,\qquad
 c+f+\tfrac23(a+\beta)+L\quad\text{(cubic only)}.
\]
This estimate keeps the actual coprime mixed block and all its zeros. Only the inverse mean square uses the lower-order sieve.

## Uniform large-core sectors

Use \(\beta<0.757,\ \gamma>0.374,\ r\le a+c,\ f\le(1-t)/6\) in the three exponents. In the cubic grouping, use \(a\le(t-c)/2\). Each resulting upper bound is increasing in \(t\), so \(t\le1\) gives the respective bounds
\[
 \frac{1+\lambda}{2}(1+c),\qquad
 \beta-(1-\theta_0)\gamma+\frac{\theta_0}{4}
                       +(1+\theta_0/4)c,\qquad
 \frac23\beta-(1-\theta_0)\gamma+\frac13+\frac{\theta_0}{4}
                       +(2/3+\theta_0/4)c.
\]
All fit \(1.104\) for \(c\le0.106\). This covers pure square and fourth-power cores, together with the indicated complementary layers, at the full row length.

In the quadratic grouping use \(a\le(t-c)/3\). The row term is at most \((1+\lambda)(1+2c)/3\). The column term is at most
\[
 \frac16+\beta-(1-\theta_0)\gamma
       +\frac{\theta_0-1}{6}t+(1+\theta_0/3)c.
\]
For \(t\ge0.783\) both fit \(1.104\) for \(c\le0.188\). Smaller \(t\) was handled by the core-scale average. In particular the full-length pure cube core is covered. The [Lean replay](ContactFactorization.lean) checks the rational margins. Large cores with substantial squarefree sextic layers still need a joint estimate.

Prepared with OpenAI Codex assistance.
