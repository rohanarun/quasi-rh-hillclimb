# A Gauss witness survives the joint projection in the full row norm

The [isolated-shell witness](projected-gauss-obstruction.md) concerns one signed high-frequency block. There is also a coefficient-uniform obstruction for the full smooth row sum on the complement of the [asymmetric joint projection](asymmetric-joint-projection.md). It holds for a vector satisfying the detector's pointwise coefficient-size bound. The construction uses the orientations and norm cutoffs of that specific projection.

The [small-radical extension](small-radical-primal-gauss.md) includes the witness below in its enlarged phased family. The calculation here concerns the earlier norm-only cutoff.

## A primal Gauss vector

Take the column scale \(X=U^{1.129}\) and the block with no additional moving deletion. Enlarge the fixed good-prime exclusions as allowed in the Gauss Gram formula. Choose a good primary prime \(\pi\) with \(P=\mathrm N\pi\asymp U^{0.038}\). On a fixed column ray block modulo \(36\), use the squarefree vector
\[
 b(n)=X^{-1/2}W(\mathrm Nn/X)(\mathrm Nn/X)^{-1/2}
              \overline{G(n,1)}\,\overline{\chi_n(\pi)} .
\]
Here \(W\) is a fixed smooth nonnegative nonzero profile supported inside the projection annulus, and \(G\) is the normalized sextic Gauss sum. The label zero at \(\pi\) is retained. The vector has bounded squared mass and pointwise size \(O(X^{-1/2})\).

Let \(T\) send a column vector to its character polynomial on the original element rows with a nonnegative smooth radial weight of norm scale \(U\), including the square root of that weight in the norm. It is enough for the weight to dominate a fixed nonzero annular bump of the kind used in [Xu–Sang, §3](https://arxiv.org/html/2610.17675v2#S3), after a constant rescaling. Use their Proposition 3.1 at row scale \(U\), column scale \(X\), with external label \(\pi\), whose local digit is one. The factor \(\Omega\) at this prime is comparable to \(P^{-5/6}\). The squarefree-column correction of Lemma 4.2 and Corollary 4.3 retains that external factor in every powerful-column main term. With the fixed prime cutoff chosen so their \(C_0-1<1/4\), the same triangle argument as in the [twisted shell construction](projected-gauss-obstruction.md) gives
\[
 \|Tb\|^2\gg U^{5/6}X^{1/3}P^{-5/6}=U^{1.178}
\]
up to fixed scale constants. Its squared error after normalizing the vector is
\[
 O_\epsilon\bigl(U^\epsilon\{U(1+(X^2/U)^{1/12})+PX\}\bigr).
\]
The exponents of the two largest errors are \(1.104833\ldots\) and \(1.167\), both below the main exponent. The positivity and the fixed prime cutoff are applied before any projection. [Xu–Sang, Lemma 4.2 and Corollary 4.3](https://arxiv.org/html/2610.17675v2#S4.SS2).

## The witness has small joint projection

Use exactly the joint space from the asymmetric projection, with unphased norm cutoff \(D_0=U^{0.199}\), phased norm cutoff \(D_1=U^{0.184}\), divisor cutoff \(L=U^{1/100000}\), and sufficiently slowly growing smooth modes. Denote its orthogonal projector by \(\Pi\). The test vector uses the negative symbol of \(\pi\), whereas the phased family uses positive symbols.

In the phased overlaps the Gauss factors cancel. The remaining label product has a nonzero digit at \(\pi\), since its cancellation would require a phased label divisible by \(\pi^5\), of norm comparable to \(U^{0.190}>D_1\). Its conductor norm is at most \(PD_1\). The squarefree completion bound of the [column Gram estimate](column-gauss-projection.md) gives the per-entry bound \(U^\epsilon X^{-1/2}(PD_1)^{1/4}\), up to a polynomial in the number of modes. Counting those labels therefore gives squared overlap mass
\[
 O_\epsilon\bigl((1+M)^C U^\epsilon X^{-1}P^{1/2}D_1^{3/2}\bigr).
\]

For an unphased overlap, multiply its vector by the conjugate of \(b\). After extracting the branch divisor \(h\), an expanded divisibility term and an Euler-deletion divisor, write \(n=zv\) as in the asymmetric cross-Gram estimate. The surviving symbol \(\chi_v(\pi)\) is \(\overline{\chi_v(\pi^5)}\) on the units. Its zero at \(\pi\) is kept, including when combined with the other label. The good numerator is therefore bounded by \((\mathrm Nd_0)P^5(\mathrm Nz)^4\). At primes whose exponents reduce to zero, take digit six if a zero is needed. The raw positive exponents there already total at least six. The shortening to \(X/\mathrm Nz\) and the branch factor \((\mathrm Nh)^{1/2}\) are the same as in that estimate. Using the [primitive sextic Gauss bound of Gao–Zhao](https://arxiv.org/pdf/2201.01885v2#page=6), and counting only the unphased labels, gives overlap-vector norm at most
\[
 (1+M)^C U^\epsilon\left[
    X^{-1/2}D_0^{7/4}P^{5/4}L^{3/2}W_F^{1/2}
   +X^{-1/3}D_0^{7/6}P^{5/6}L
 \right],
\]
where \(W_F\) bounds the radical norm of the common deletion. Here \(W_F\) is fixed in the witness block. The fixed additional prime exclusions have subpower cost. The notation \(W_F\) is separate from the profile \(W\).

The larger exponent in the unphased bound is less than \(-0.112\). The full joint Gram inverse has subpower norm, so, taking the mode exponent and preliminary losses small enough,
\[
 \|\Pi b\|_2\ll U^{-0.11}.
\]
The full smooth sextic sieve gives \(\|T\|^2\ll_\epsilon U^{1/6+\epsilon}X\). The squared norm of \(T\Pi b\) is therefore at most \(U^{1/6+1.129-0.22+\epsilon}\), smaller than \(U^{1.178}\). By the triangle inequality, the orthogonal residual \(b-\Pi b\) still has squared row norm \(\gg U^{1.178}\).

## Retain the pointwise coefficient size

For fixed \(n\), only one branch \(h=(n,\operatorname{rad}d_0)\) is active for each unphased label. Group by \(h\mid n\). The number of \(d_0\) of norm at most \(D_0\) divisible by \(h\) is \(O(D_0/\mathrm Nh)\), so the sum of the active \(\mathrm Nh\)'s is \(O_\epsilon(D_0 U^\epsilon)\). The centered divisibility variables satisfy \(|R_m(n)|^2\le\mathrm Nm\), and the sum over \(m\) of norm at most \(L\) costs \(O(L^2)\). Thus the sum of squared basis values at \(n\) is
\[
 O_\epsilon((1+M)^C U^\epsilon X^{-1}(D_0L^2+D_1)).
\]
The coefficients of \(\Pi b\) in the joint basis have the same norm bound \(U^{-0.11}\), up to preliminary subpowers, by the Gram estimates above. Cauchy–Schwarz then gives \(|(\Pi b)_n|\ll X^{-1/2}\), with room since \(0.11>0.199/2+1/100000\). Therefore the residual itself has the pointwise coefficient-size bound \(O(X^{-1/2})\). The [Lean replay](ContactFactorization.lean) checks the exponent comparisons.

This obstruction is for the full smooth majorant and for arbitrary coefficients of that size. It applies after all signed frequency blocks have been recombined. The detector's Möbius–ordinary factorization and restriction to its actual rows remain available for a sharper argument.

Prepared with OpenAI Codex assistance.
