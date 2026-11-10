# Include the primal Gauss witnesses with small radicals

The [full-row obstruction](full-joint-gauss-obstruction.md) uses a primal Gauss vector whose inverse label has norm above the phased cutoff and small radical. Separating the two size restrictions in the [asymmetric projection](asymmetric-joint-projection.md) admits that vector and every label in the same main-term dominance range of the Gauss Gram formula.

## Add a second phased label range

Keep the unphased divisor basis with label norm at most \(D_0=U^{0.199}\), divisors of norm at most \(L=U^{1/100000}\), and the same smooth modes and fixed ray blocks. On the phased side retain all original labels of norm at most \(U^{0.184}\). Also include all good sixth-power-free labels \(d_1\) with
\[
 \mathrm N d_1\le U^{0.350},\qquad
 \mathrm N\operatorname{rad}d_1\le U^{0.120}.
\]
Take the union with no repetitions and use the same positive symbol \(\chi_n(d_1)\) and phase \(\overline{G(n,1)}\).

For a phased subfamily with label norm at most \(N_1\) and radical at most \(D_1\), there are \(O_\epsilon(D_1^{1+\epsilon})\) labels. In the cross Gram calculation the raw numerator still has norm at most \(D_0N_1(\mathrm Nz)^4\), where \(z\) is the forced divisor in the unphased expansion. The shorter Gauss sum is at \(X/\mathrm Nz\), and the branch normalization is the same. The pointwise Gauss series bound is [Gao–Zhao, Lemmas 2.6 and 3.4](https://arxiv.org/pdf/2201.01885v2#page=6). Counting the labels by their radicals at the Frobenius step gives
\[
 \|C\|\ll_\epsilon (1+M)^C U^\epsilon\left[
 X^{-1/2}D_0^{7/4}N_1^{1/4}D_1^{1/2}L^{3/2}W^{1/2}
 +X^{-1/3}D_0^{7/6}N_1^{1/6}D_1^{1/2}L
 \right].
\]
Here \(W\le U^{10^{-6}}\) bounds the common moving deletion. This is the same proof as before, with the two roles of the phased cutoff kept separate. It preserves the quotient zeros, including at shared label primes. For the added subfamily the two cross exponents are less than \(-0.023\) using \(X>U^{1.123}\). Together with the original subfamily this retains the joint cross bound \(O(U^{-0.018})\) after the allowed preliminary losses.

The full phased family still has radical cutoff \(U^{0.184}\) and at most \(O_\epsilon(U^{0.184+\epsilon})\) labels. Its diagonal Gram estimate and its actual mixed-coefficient overlap bound use the radical, so both are unchanged at the power level. In particular the additional subfamily alone contributes squared overlap mass at most
\[
 O_\epsilon(U^\epsilon X^{-1}B^{3/2}W^{1/2}U^{0.240})
\]
up to the small mode costs. This fits within the previous phased mass bound. The joint Schur complement and the full smooth moment calculation therefore carry over unchanged. The [Lean replay](ContactFactorization.lean) checks the new cross comparisons.

## Range of Gauss witnesses now included

Write an external good sixth-power-free Gauss label \(d_*\) with digit \(e_{\mathfrak p}\in\{1,\ldots,5\}\) at its primes. The coefficient vector of its primal Gauss test has the negative symbol \(\overline{\chi_n(d_*)}\) and the phase \(\overline{G(n,1)}\). Its positive-symbol label is
\[
 d_1=\prod_{\mathfrak p\mid d_*}\mathfrak p^{6-e_{\mathfrak p}}.
\]
These symbols agree with the same zero extension. Write \(r=\log_U\mathrm N\operatorname{rad}d_1\), \(j=(\log_U\mathrm Nd_1)/6\), and \(x=\log_U X\). In the [Gauss Gram formula](https://arxiv.org/html/2610.17675v2#S3), the normalized main exponent at row scale \(U\) is \(5/6+x/3-j\), while the moving-support error has exponent \(r+x\), up to subpowers. Therefore the range where the stated main term dominates that error requires
\[
 r+j<5/6-2x/3.
\]
The other stated errors can only restrict this main-dominance range further. Since \(r/6\le j\le5r/6\) and \(x>1.123\), these labels satisfy \(r<0.073\) and \(6j<0.231\). In particular they are contained in the new range \(r\le0.120,\ 6j\le0.350\). This includes the specific vector of the full-row obstruction, whose positive label has radical exponent \(0.038\) and norm exponent \(0.190\).

On an interior annulus the smooth-profile approximation makes every such primal test orthogonal to the enlarged residual up to arbitrary power accuracy. The result handles the directions certified by the source main term in this range. It leaves open an upper bound for the full orthogonal complement, including directions for which that main term and error comparison gives no lower bound.

Prepared with OpenAI Codex assistance.
