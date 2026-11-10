# A high-frequency Gauss witness survives the projection

The [growing-divisor projection](growing-divisor-projection.md) removes smooth modes for labels of norm at most \(U^{0.199}\). The complement can still have large signed high-frequency energy with arbitrary coefficients. A label just beyond the cutoff gives a witness even after exact column coprimality and the radial Poisson weight are imposed.

## A twisted witness in a fixed high shell

Take \(H=U^{1.240},\ Y=U^{1.129}\). Choose a good primary prime \(\pi\) with \(P=\mathrm N\pi\asymp U^{0.041}\), which is possible by prime ideal counting, and use the label \(d_*= \pi^5\). Its norm is of order \(U^{0.205}\), while its moving radical has norm \(P\). Enlarge the fixed bad-prime set \(S\) by a sufficiently large fixed prime cutoff. Use one fixed column ray class, a nonnegative nonzero profile \(W\) supported in \((1/2,1)\) inside the smooth projection annulus, and a fixed nonnegative radial frequency profile \(w(k/\sqrt H)\) supported on a compact annulus of that scale.

For good squarefree columns \(n\), the normalized Gauss test vector of [Xu–Sang, §3](https://arxiv.org/html/2610.17675v2#S3) has coefficient
\[
 x(n)=Y^{-1/2}W(\mathrm Nn/Y)(\mathrm Nn/Y)^{-1/2}
          \overline{G(n,1)}\,\overline{\chi_n(d_*)},
\]
with a fixed ray phase if needed. Its norm is bounded. Here \(G(n,1)\) is the normalized sextic Gauss sum, and the chosen orientation gives the polynomial with symbol \(\chi_n(k)\) in the row. Conjugating both factors of the form gives the other orientation. The symbol of \(d_*\) keeps the puncture at \(\pi\).

Proposition 3.1 gives the all-column main term for this profile. The local exponent in \(\Omega\) at \(\pi\) is \(-5\bmod 6=1\), so \(\Omega_* \asymp P^{-1/6}\). The squarefree-column argument of Corollary 4.3 applies to the same external twist: Lemma 4.2 keeps that twist's \(\Omega_*\) in every powerful-column component, and bounds the sum of nonunit components by \(C_0-1<1/4\) times the main norm plus the uniform error. Thus the weighted energy of \(x\) has a lower bound by a positive fixed multiple of
\[
 H^{5/6}Y^{1/3}\Omega_* .
\]
The squared error scale after normalizing the vector is
\[
 U^\epsilon\{H(1+(Y^2/H)^{1/12})+PY\},
\]
which has smaller exponent. [Xu–Sang, Lemma 4.2 and Corollary 4.3](https://arxiv.org/html/2610.17675v2#S4.SS2).

## Impose exact coprimality

Open the condition \((n,n')=1\) by the Möbius projector. For its term at squarefree \(e\) of norm \(E\), write \(n=ev,\ n'=ev'\). Terms with \(\pi\mid e\) vanish. The factor \(\chi_e(k)\) supplies a row mask of modulus at most one. Gauss CRT on the coprime factors \(e,v\) gives a bounded fixed scalar and a twist supported on \(e\), in addition to the original \(d_*\) twist. The vector in \(v\) has the same profile at scale \(Y/E\), with an extra \(E^{-1/2}\) in its normalization. Apply Lemma 4.2 at that scale. Its main squared contribution is bounded by
\[
 C\,E^{-4/3}H^{5/6}Y^{1/3}\Omega_* .
\]
The local factors at the added primes have modulus at most one and preserve the \(\Omega_*\) factor since \((e,\pi)=1\). More precisely \(C\) may be taken to be \(2C_0^2 C_{S,w}\mathcal I(W)^2\), with the notation of the source. The total squared errors after summing \(e\) are
\[
 O_\epsilon\!\left(U^\epsilon\{H(1+(Y^2/H)^{1/12})+PY\}\right).
\]
Indeed the two row-scale terms have at least the weight \(E^{-1}\), and the moving-support term \((PE)(Y/E)\) has the extra normalization \(E^{-1}\). This makes its sum harmonic. Empty column scales contribute zero.

By increasing the fixed prime cutoff, \(\sum_{e>1}E^{-4/3}\) over good \(e\) can be made arbitrarily small. The \(e=1\) main lower bound can be taken to be a fixed fraction of \(C_{S,w}\mathcal I(W)^2\), by the preceding squarefree argument. Hence the sum of the other projector terms has insufficient magnitude to erase it. The signed exact-coprime Gram form on \(x\) is still at least a positive multiple of \(H^{5/6}Y^{1/3}\Omega_*\). This form has no diagonal on the annulus.

## Project out the known modes

Apply the growing-divisor projection in the ungauged column space at \(X=Y\), with \(D=U^{0.199}\) and divisors of norm at most \(L=U^{1/100000}\). Let \(b(n)=Y^{-1/2}W(\mathrm Nn/Y)\overline{\chi_n(d_*)}\), and let \(\Pi\) denote that projection. The weight \((\mathrm Nn/Y)^{-1/2}\) used in \(x\) is deliberately kept outside \(b\), so the projection can be imposed before the Poisson normalization.

For every basis vector the overlap with \(b\) is a nonprincipal squarefree character sum. Expand its centered divisibility polynomial and factor out the forced divisor \(z\) and the branch \(h\), as in the projection proof. On consistent terms the quotient character has conductor at most \(PD\). It is nonprincipal at some good prime because \(d_*\) has digit five at \(\pi\) and no allowed label can have that digit there. Terms forcing \(\pi\mid n\) vanish. The squarefree completion bound, including the branch normalization \((\mathrm Nh)^{1/2}\), gives the per-vector overlap bound
\[
 O_\epsilon((1+M)^C U^\epsilon Y^{-1/2}(PD)^{1/4}L^{1/2}).
\]
Here the factor \(\sqrt{\mathrm Nh/\mathrm Nz}\) from the shortened count is at most one. Counting the basis vectors and using the inverse Gram bound gives
\[
 \|\Pi b\|_2^2\ll_\epsilon (1+M)^C U^\epsilon
                   Y^{-1}P^{1/2}D^{3/2}L^2 .
\]
This saves more than \(U^{0.8}\) in squared mass with sufficiently small mode loss. The sieve upper bound for all element frequencies of norm \(O(H)\), obtained by separating their sixth powers, has exponent
\[
 \tau=5(1.240)/6+1.129/3 .
\]
The extra term \(H^{1/6}Y\) is smaller. This also bounds the exact coprime bilinear form and the form with any bounded row multiplier, by opening the projector and summing the shortened coefficient masses with the divisor bound, as in the [centered sieve obstruction](centered-sieve-obstruction.md). Therefore replacing \(b\) by \(b-\Pi b\) in the Gauss form changes it by a smaller power. Multiplication by the Gauss phase and by \((\mathrm Nn/Y)^{-1/2}\) is bounded on the annulus. The residual input is orthogonal to the enlarged projection by construction.

## Restore the radial Poisson kernel

For the undilated block with these column lengths, the first Poisson Fourier kernel has argument \(U\mathrm Nk/(\mathrm Nn\,\mathrm Nn')=O(U^{-0.018})\) in radial norm coordinates. Its zero value is positive for the original nonnegative row majorant. Subtract that constant and separate the two column log norms, as in the centered obstruction. The error multiplier has integrated supremum \(O(U^{-0.009})\), using smoothness in the lattice Fourier variable. The coprime upper bound gives total error \(O_\epsilon(U^{\tau-0.009+\epsilon})\) before the scalar \(U/Y\). This is smaller than the main term, whose loss from \(\Omega_*\) is \(0.041/6\). The factor depending on the two column norms in the Poisson scalar is exactly the bounded multiplier already kept outside \(b\).

The resulting signed high-shell form on the projected residual can therefore have size at least
\[
 U^{1-1.129+\tau-0.041/6-o(1)}
 =U^{1.273833\ldots-o(1)} .
\]
The [Lean replay](ContactFactorization.lean) checks the exponent comparisons. This rules out a coefficient-uniform \(1.104\) estimate for the isolated high shell based only on the current projection. It concerns a constructed Gauss vector. The actual Möbius–ordinary coefficients and cancellation with other signed blocks remain available for a stronger argument.

Prepared with OpenAI Codex assistance.
