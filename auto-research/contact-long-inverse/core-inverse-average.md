# Average the inverse factor at the core scale

The [primitive-conductor estimate](primitive-conductor-ordinary.md) bounded both factors pointwise on short-core rows. The inherited unmarked inverse mean square gives a larger range when applied at the norm of the sixth-power-free core. The full smooth mixed moment fits the required budget on every row with good core of norm at most \(U^{0.783}\).

## Freeze the sixth root and open column coprimality

Use the same mixed block of lengths \(A=U^\beta,\ B=U^\gamma\), deletion, and common row character as in the primitive-conductor calculation. Write the good part of a nonzero row as \(u_{\rm good}=j^6v\), where \(v\) is sixth-power-free. On a dyad put \(\mathrm Nv\asymp U^t\) and let \(U^r\) be the dyadic norm of \(\operatorname{rad}(v)\). In particular \(r\le t\). Fixed bad-prime powers and units are separated into dyads and finite ray data. Treat \(v\ne1\) here, so the row character is nonprincipal at a good prime. The unit core has already been bounded at the varying budget in the [full projection calculation](full-column-projection.md).

For each fixed \(j\), the sixth power contributes only the deletion at primes of \(j\). Keep that deletion in both factors, including when \(j\) and \(v\) have common primes. Open the coprimality of the inverse and squarefree ordinary factors by the Möbius projector. The term indexed by the common divisor \(g\) has a scalar bounded by \(1/\mathrm Ng\), a centrally normalized inverse sum at \(A/\mathrm Ng\), and a centrally normalized squarefree ordinary sum at \(B/\mathrm Ng\). The two residual factors have common deletions at \(g\), \(j\) and the original block mask. The equality is the same as in the [squarefree reduction](squarefree.md). The scalar can contain the row symbol at \(g\), whose zeros are kept.

Apply the inherited unmarked inverse moment with sixth-power amplification at the core scale \(U^t\). For fixed \(g,j\) it gives the squared bound
\[
 U^\epsilon\left(U^t+U^{t/6}(A/\mathrm Ng)^{5/6}\right).
\]
To account for the additional Euler deletions, expand their geometric inverse factors. The expansion shifts the inverse length further down. Its central coefficients have total absolute mass bounded by a product of \((1-(\mathrm Np)^{-1/2})^{-1}\) over the deleted primes, hence by a subpower uniformly over polynomial norms. Minkowski and monotonicity of the displayed bound handle the shifted sums. The new deletions are fixed throughout each core average. A positive core norm restriction or a bounded row scalar may be dropped after taking the squared inverse norm. [OpenAI, sixth-power amplification](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12362).

## Use the two ordinary bounds at the shortened length

Let \(\theta_0=8749/10000,\ \alpha=(1-\theta_0)/2,\ \lambda=\theta_0-1/2\). For the normalized squarefree ordinary sum at length \(T=B/\mathrm Ng\), the [primitive-conductor estimate](primitive-conductor-ordinary.md) gives \(U^\epsilon T^{-\alpha}U^{\theta_0 r/4}\). The same Mellin integral on \(\Re s=\theta_0\) gives \(U^\epsilon T^\lambda\), because both the numerator and the reciprocal denominator cost subpowers there. The inducing conductor is at most a fixed multiple of \(U^r\), and the zero extensions cost subpowers on both lines. Nonempty annuli with subunit length are comparable to unit length. Thus the pointwise ordinary bound is the smaller of the two displayed powers, with uniform subpower losses.

Take the square root of the inverse bound and use Minkowski over \(g\). For the part \(U^{t/2}\), the harmonic sum over \(g\) costs a logarithm and the supremum of the ordinary bound over \(T\ll B\). The two ordinary powers intersect at \(T=U^{r/2}\), since \(\lambda+\alpha=\theta_0/2\). This gives the upper bound
\[
 U^\epsilon U^{t/2}\min\{B^\lambda,U^{\lambda r/2}\}.
\]
For the part \(U^{t/12}A^{5/12}\), use each ordinary bound separately and then take the smaller result. The weights in \(g\) are summable for both, including the factor \((\mathrm Ng)^\alpha\) in the negative ordinary power, since \(5/12>\alpha\). The resulting upper bound is
\[
 U^\epsilon U^{t/12}A^{5/12}
        \min\{B^\lambda,B^{-\alpha}U^{\theta_0r/4}\}.
\]
This treats the common-divisor projector before taking the square of the combined norm.

## Sum the sixth roots

There are \(O_\epsilon(U^{(1-t)/6+\epsilon})\) possible roots \(j\) on the row dyad. The fixed bad-prime part only shortens that range. Squaring the two bounds and summing over the frozen roots gives the sufficient exponents
\[
 \begin{aligned}
 E_1(t,r)&=\tfrac16+\tfrac56t+
             \min\{(2\theta_0-1)\gamma,\ (\theta_0-\tfrac12)r\},\\
 E_2(r)&=\tfrac16+\tfrac56\beta+
             \min\{(2\theta_0-1)\gamma,\ -(1-\theta_0)\gamma+\theta_0r/2\}.
 \end{aligned}
\]
The terms are for the actual mixed coefficients with their full column coprimality and moving zeros. Dyadic losses are subpowers.

Using \(\beta<0.757,\ \gamma<0.379\), the first option in \(E_2\) fits \(1.104\) throughout the detector window. The first option in \(E_1\) fits \(1.104\) for \(t\le0.783\), including squarefree cores. The second option also covers some larger cores of smaller radical. For example \(t=0.9,\ r=0.42\) fits both bounds. The [Lean replay](ContactFactorization.lean) checks the rational margins. The short-core bound applies to the smooth row norm before Poisson summation. The large-core row contribution still needs a sharper joint estimate.

The [lower-order inverse averages](lower-order-primal.md) handle additional large-core rows with dominant square, cube or fourth-power layers.

Prepared with OpenAI Codex assistance.
