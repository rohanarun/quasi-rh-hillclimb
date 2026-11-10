# Remove smooth Gauss directions in the column space

The [centered sieve obstruction](centered-sieve-obstruction.md) applies to arbitrary column coefficients. The mixed detector coefficients have small overlap with a growing family of smooth Gauss vectors. The removed component can be estimated on the actual detector rows using the ordinary moment. This is a column projection, separate from the [projection in the row space](gauss-projection.md).

## Vectors and Gram matrix

Fix one mixed squarefree block with lengths \(A=U^\beta,\ B=U^\gamma,\ X=AB\) and coefficient vector \(a\), including the centrally normalized Möbius and ordinary factors. Fix the common deletion \(F\) from the powerful-part reduction. The detector windows give \(\beta>0.749,\ \gamma>0.374\) after these short deletions. For a fixed nonzero smooth annular profile \(\Phi\), use the vectors
\[
 b_d(n)=X^{-1/2}\Phi(\mathrm Nn/X)\overline{\chi_n(d)}
\]
on the good squarefree columns in one fixed ray class and prime to \(F\). Outside that support take zero. The labels \(d\) are good sixth-power-free ideals of norm at most \(D\), including \(1\). Multiplication by the normalized one-column Gauss factor is unitary on this support. It sends these vectors to the corresponding smooth Gauss directions, and the same factor cancels from their overlaps with the transformed mixed coefficient vector. These are the smooth profile vectors used in the sharp sieve construction, with the factor depending smoothly on the column norm included in \(\Phi\). [Xu–Sang, §3](https://arxiv.org/html/2610.17675v2#S3).

For their Gram matrix, the diagonal is \(\gg_\epsilon U^{-\epsilon}\), from the squarefree count with the finite ray condition and the prime exclusions at \(Fd\). The lattice remainder is \(O_\epsilon(X^{-1/2}U^\epsilon)\) by square-divisor expansion. For two distinct labels \(d,d'\), their ratio induces a nonprincipal character at a good prime because their digits differ modulo six. Its good conductor norm \(Q\) is at most \(\mathrm Nd\,\mathrm Nd'\), and the canceled primes retain their zero masks. Expand the squarefree condition by \(j^2\) and the masks by divisors. At each \(j\), smooth completion bounds the unnormalized sum by \(O_\epsilon(\sqrt Q\,U^\epsilon)\). The trivial bound is \(O(X/(\mathrm Nj)^2)\) on nonempty annuli. Splitting at \(\mathrm Nj=X^{1/2}Q^{-1/4}\) gives the Gram entry bound
\[
 \left|\langle b_d,b_{d'}\rangle\right|
 \ll_\epsilon X^{-1/2}Q^{1/4}U^\epsilon.
\]
This is the same squarefree Gram calculation as in the [row projection](gauss-projection.md), at column scale \(X\). Fixed ray refinements and polynomial-norm zero masks have at most subpower cost. The full off-diagonal row sum is \(O_\epsilon(X^{-1/2}D^{3/2}U^\epsilon)\). Thus for \(D\le U^{0.197}\) the Gram matrix is invertible with inverse norm \(O_\epsilon(U^\epsilon)\). In the row indexed by \(1\) we have the stronger entry bound \(O_\epsilon(X^{-1/2}D^{1/4}U^\epsilon)\) against every nontrivial label.

## Overlaps with the mixed coefficient

Expand the fixed ray condition into its characters and separate the additional smooth profile in the logarithms of the two factor norms. The standard Mellin separation has an integrable weight in the extra norm modes. Open the coprimality of the two squarefree factors by the Möbius projector. A common divisor \(g\) carries the central weight \((\mathrm Ng)^{-1}\), leaves lengths \(A/\mathrm Ng,\ B/\mathrm Ng\), and adds a common Euler deletion. The overlap is \(X^{-1/2}\) times this sum of products of normalized inverse and squarefree ordinary sums, with the same character in both factors. The character is a finite fixed twist of \(\chi_n(d)\) or its conjugate. Its primitive conductor norm is \(O(D)\). For \(d\ne1\) it is nonprincipal because some good digit of \(d\) is nonzero.

The inherited \(7/8\) half-plane implies the uniform reciprocal bound \(1/L(\sigma+it,\psi^*)\ll_\epsilon (\mathrm N\mathfrak f_{\psi^*}(2+|t|)^2)^\epsilon\) for each fixed \(\sigma>7/8\). One way to obtain it is to take a holomorphic logarithm in the zero-free half-plane, normalizing a principal pole by \((s-1)/(s+1)\). On a disk centered at \(2+it\), the inner radius less than one gives a bounded logarithm by the Euler product, and a larger radius still in the half-plane gives \(O(\log(\mathrm N\mathfrak f_{\psi^*}(2+|t|)^2+2))\) by Borel–Carathéodory and the polynomial bound for \(L\). Three circles gives a power of that logarithm with exponent less than one at the desired intermediate radius. The reciprocal at a principal pole is zero. Finite Euler deletions have subpower cost on every fixed positive real line used here. A smooth inverse sum of length \(A'\) is therefore \(O_\epsilon(U^\epsilon(A')^{3/8})\) after shifting its Mellin contour. [OpenAI's inherited zero-free half-plane](https://github.com/openai/math/tree/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026).

For \(d=1\), bound the squarefree ordinary sum trivially by \(O((B')^{1/2})\). For \(d\ne1\), its series without extra deletions is \(L(s,\psi)/L(2s,\psi^2)\). Shift to \(\Re s=9/20\). The numerator is nonprincipal and obeys the fixed-field convexity bound \(D^{11/40+\epsilon}\) with polynomial norm-height cost. The reciprocal denominator is bounded by the preceding argument since \(2\Re s=9/10\). Removing a prime from this squarefree series multiplies it by \((1+\psi(\mathfrak p)(\mathrm N\mathfrak p)^{-s})^{-1}\), so the additional exclusions preserve the power bound. This gives \(O_\epsilon(U^\epsilon(B')^{-1/20}D^{11/40})\) for the normalized squarefree ordinary sum. Nonempty subunit scales are comparable to one. The common-divisor weights in both estimates are summable, since even in the latter case their exponent is \(1+3/8-1/20>1\). Consequently
\[
 |\langle a,b_1\rangle|\ll_\epsilon U^\epsilon A^{-1/8},\qquad
 |\langle a,b_d\rangle|\ll_\epsilon U^\epsilon A^{-1/8}B^{-11/20}D^{11/40}\quad(d\ne1).
\]

## Price the removed component on actual rows

Let \(T\) map a column vector to its character polynomial on the actual sixth-power-free detector rows of norm comparable to \(U\). The rows are in the original presentation, with the common fixed character factors. For \(b_d\) the resulting character is a fixed-ray twist times \(\chi_n(u)\overline{\chi_n(d)}\) in the compatible orientation. Its primitive character is nonprincipal on these rows. Equality of the good digits of \(u,d\) would force their good norms to agree, while the former is comparable to \(U\) and the latter is at most \(U^{0.197}\).

The zero-slot ordinary moment with moving radical at most \(\mathrm Nd\) bounds the squared row norm of \(Tb_d\) by \(O_\epsilon(U^{1+\epsilon}\mathrm Nd)\). To see the normalization directly, open the squarefree indicator by square divisors. For each divisor \(j\) the ordinary polynomial has length \(X/(\mathrm Nj)^2\), weight \(1/\mathrm Nj\), and a row scalar bounded by one. Fixed ray and Euler exclusions are allowed in the ordinary moment. Use a unit-length second factor supported only at the unit ideal and sum the harmonic weights by Minkowski. [Xu–Sang, Theorem 2.2 and Corollary 2.3](https://arxiv.org/html/2610.17675v2#S2.SS3).

Project first onto \(b_1\). Its contribution has squared row norm \(O_\epsilon(U^{1+\epsilon}A^{-1/4})\). For the other labels replace \(b_d\) by \(b'_d=(I-P_1)b_d\), where \(P_1\) is that first orthogonal projection. Their Gram matrix is the Schur complement of the \(1\) entry and has the same lower eigenvalue bound, by minimizing the full Gram quadratic form over the first coordinate. The squared mass of the overlaps with \(b'_d\) is at most
\[
 U^\epsilon A^{-1/4}\left(B^{-11/10}D^{31/20}+X^{-1}D^{3/2}\right).
\]
The second term uses the improved Gram entries against \(1\). The sum of the squared row norms of \(Tb'_d\) is \(O_\epsilon(U^{1+\epsilon}D^2)\), by the ordinary moment and the bounded projection coefficients against \(b_1\). Cauchy–Schwarz with the inverse Gram bound therefore gives the following squared row norm for the full removed component:
\[
 \ll_\epsilon U^{1+\epsilon}A^{-1/4}
          \left(1+B^{-11/10}D^{71/20}+X^{-1}D^{7/2}\right).
\]
All three exponents are strictly below \(1.104\) for \(D\le U^{0.197}\) in the detector window. The [Lean replay](ContactFactorization.lean) checks the margins.

The residual coefficient vector is orthogonal to these smooth directions. This estimate treats one fixed profile in a ray block and charges the removed vector on the actual sixth-power-free rows. It leaves the high-frequency estimate for the orthogonal complement open, including the effect of later column shortening by the exact gcd projector.

Prepared with OpenAI Codex assistance.
