# Cubic reflection handles the small-core dual frequencies

This uses the actual Möbius coefficient in the [signed dual moment](dual-sieve.md). It bounds high as well as low frequencies in the sector with a small sixth-power-free core, including pure sixth powers. The other high-frequency sectors remain open.

Use the full smooth row average and the exact coprime projector of the dual sieve argument. Write \(G=\mathrm Ng\) for the original common-divisor dyad, \(E=\mathrm Ne\) for the divisor opened in the coprimality projector, and \(L=\mathrm N\ell\) for the row dilation with \(\ell\mid g\). The small powerful part frozen in [the squarefree reduction](squarefree.md) has norm \(W\le U^{10^{-6}}\); choose the preliminary witness losses relative to this fixed cutoff. Write \(X=U^s\) for the length after removing it and \(Y_0=X/G\). If \(k\) is the Poisson frequency, factor its good part uniquely as \(k_0j^6\), with \(k_0\) sixth-power-free, and use dyads \(\mathrm Nk_0\asymp K_0,\ \mathrm Nj\asymp J\). Fixed bad-prime powers only give bounded fixed ray data after their exponents are reduced modulo six. Write \(g_0,e_0,\lambda,w_0,k_*,j_*\) for the base-\(U\) exponents of \(G,E,L,W,K_0,J\), and set \(y=s-g_0\).

## Pointwise bound after the Gauss conversion

The coprimality projector leaves squarefree columns \(e v\) with \(v\) prime to \(ge\). Allocate the frozen squarefree ideal \(ge\) between the original inverse and ordinary factors. The remaining column is \(v=ib\), with \(i,b\) coprime, squarefree and prime to the frozen deletions. Let \(A',B'\) be the two shortened lengths, so \(A'B'\asymp X/(GE)\). The normalized column carries a factor \((GE)^{-1/2}\) from removing the allocated ideals. At this point the column profile has been separated as in [the dual sieve](dual-sieve.md). For each fixed \(b\), the inverse profile remains smooth on its fixed annulus, with the permitted separated frequencies.

Use the orientation \(\gamma_{-1}(eib)\) by conjugating the whole column if needed. CRT multiplication contributes \(\chi_i(eb)^{-2}\) up to fixed ray factors, by sextic reciprocity. The remaining Poisson character on \(i\) is \(\chi_i(k/\ell)\) or its conjugate, with the quotient interpreted only on units at \(\ell\). Keep all the original zeros. A nonzero term has \(eb\) prime to \(k\ell\): the \(b\)-factor gives a zero at \(k\), the common \(e\)-factor also gives a zero at \(k\), and \(eb\) is prime to \(g\). Thus the good primes in \(eb\) really have local exponent \(4\bmod 6\), regardless of the orientation of the frequency. The identity
\(\mu(i)\gamma_{-1}(i)=\overline{\alpha(i)}\gamma_2(i)\chi_i(-1)\overline{G(i)}\)
makes the inverse factor an actual cubic-theta column with fixed ray data and these moving twists. [OpenAI's Gauss conversion](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L10769).

Complete the cubes as in [OpenAI's completed reflection](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1673). At a completed primal length \(T\), a term with active conductor norm \(D\) has reflected length \(D^2/T\), up to the fixed bad-prime factor. The reflected coefficient support has the form \(\lambda_0^m u a c^3\), with \(\lambda_0\) the fixed ramified prime, \(a\) squarefree, and coefficient magnitude at most a constant times \(3^{m/6}\sqrt{\mathrm Nc}\). For any good squarefree divisor \(Q\), the absolute sum of the reflected coefficients with the central normalization and \(Q\mid a c\), smoothed at length \(Z\), is
\[
 \ll_\epsilon Z^{1/2}(\mathrm NQ)^{-1} U^\epsilon.
\]
To see this, distribute each prime of \(Q\) to \(a\) or to \(c\). In the first case the sum of \((\mathrm Na)^{-1/2}\) in a progression of multiples gains the reciprocal of the assigned divisor norm. In the second case, the \(a\)-sum at length \(Z/(\mathrm Nc)^3\) leaves the weight \(\sqrt Z/(\mathrm Nc)^2\), giving at least the same gain on \(c\). The fixed ramified powers sum geometrically. The rapid tail of the reflected profile preserves the same bound, also when the first dyad is empty.

It follows that a \(j_p=4\) prime costs only \((\mathrm Np)^{-1/2}\) beyond the reflected-length factor: the local term \((\mathrm Np)^{-1/2}(-1+(\mathrm Np)1_{p\mid\mu})\) is bounded by splitting the two terms and using the divisor gain. An active \(j_p=0\) prime contributes the same square-root loss directly; an inactive one adds no conductor. Hence their net cost including the length factor is at most a square root of the prime norm. The primes with the arbitrary twist from \(k_0,\ell\) may cost a full prime norm. The completed sum at \(T\) is therefore bounded, up to subpowers and profile seminorms, by
\[
 \min\{\sqrt T,\ D_{\rm eff}/\sqrt T\},
 \qquad D_{\rm eff}=K_0\,(B' E G W J L)^{1/2}.
\]
In this upper bound the pure masks at \(g,w,j\) are counted by their radicals. A prime of \(g\) that becomes active with a nonzero \(\ell\)-twist can cost its other half power through \(L^{1/2}\). Any remaining nonzero \(k_0\)-twists are covered by \(K_0\), including overlap with those masks. The \(eb\)-primes use the square-root cost just proved. The number of local branches is a subpower.

Remove the completed cubes by the exact inversion
\(\sum_d\mu(d)\overline{\alpha(d)}^3\Psi(d)^3(\mathrm Nd)^{-1}\mathcal C(A'/(\mathrm Nd)^3)\).
The weights and masks are multiplicative, so this is valid with the common Euler zeros. At a dyad of cube roots the sum of \(1/\mathrm Nd\) is bounded. The minimum of the two displayed bounds for \(\mathcal C(T)\) is at most \(\sqrt{D_{\rm eff}}\) at every scale \(T\). Consequently the normalized inverse Gauss sum is \(O_\epsilon(U^\epsilon\sqrt{D_{\rm eff}})\). Trivial summation over the remaining ordinary factor contributes \((B')^{1/2}\). This proves a bound of
\[
 U^\epsilon B^{3/2} K_0(EG W J L)^{1/2}
\]
for the squared mixed column size before the external \(1/(GE)\), where \(B\) is the original ordinary scale and \(B'\le B\). The alternative trivial squared bound before that external factor is \(X/(GE)\). The cube inversion and central normalization are as in [OpenAI's cube-removal formula](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/build/paper2.tex#L427).

## Sum the small-core dyads

The Poisson scalar is \(U/(LY_0)\), there are \(O(K_0 J)\) frequencies in a core and root dyad, and counting the \(g,e\) dyads cancels the external \(1/(GE)\) as in [the dual sieve](dual-sieve.md). Use \(\gamma\) for the original ordinary length exponent. The two bounds for the full contribution have exponents
\[
 1+k_*+j_*-\lambda-e_0,\qquad
 1-y+3\gamma/2+2k_*+3j_*/2+(e_0+g_0+w_0)/2-\lambda/2 .
\]
If the first exceeds \(1.103\), use \(e_0<k_*+j_*-\lambda-0.103\) in the second. Fourier support gives \(k_*+6j_*\le2y-1+\lambda+O(\epsilon)\). Dropping the resulting nonpositive \(\lambda\) term bounds the second exponent by
\[
 \frac23-\frac{0.103}{2}-\frac{s}{3}+\frac{3\gamma}{2}
 +\frac{w_0}{2}+\frac{5g_0}{6}+\frac{13k_*}{6}+O(\epsilon).
\]
The already certified detector windows give \(s>1.124,\ \gamma<0.379,\ w_0\le10^{-6}\). This fits the \(1.104\) budget whenever \(5g_0/6+13k_*/6\le0.293\). In particular it covers all \(\mathrm Nk_0\le U^{0.01}\) throughout the retained \(g_0\le13/40\) range, and extends to \(k_*\le0.135\) at \(g_0=0\). The strict rational margins are checked in [the Lean replay](ContactFactorization.lean).

This removes those small-core frequencies from the sufficient full smooth moment, including frequencies above the generic dual-sieve cutoff. The ordinary factor was summed absolutely here. A stronger estimate using cancellation in that factor or in the remaining signed frequency average is still needed for the larger cores. No new zero-free endpoint follows yet.

The [primal Gauss phase projection](primal-gauss-phase-projection.md) uses the same reflection for overlaps in the original column space.

Prepared with OpenAI Codex assistance.
