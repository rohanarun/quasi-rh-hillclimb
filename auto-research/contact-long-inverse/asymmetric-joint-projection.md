# Combine the divisor projection with oppositely oriented Gauss vectors

The [joint projection](joint-gauss-projection.md) used a difference of label exponents in its cross Gram block. Using the opposite residue-symbol orientation on the phased side gives a sum of exponents instead. With norm cutoffs this reduces the numerator size enough to keep the [growing-divisor family](growing-divisor-projection.md) on the unphased side.

Work on the same column ray blocks modulo \(36\) and common Euler deletion \(F\), of radical norm at most a fixed multiple of \(W\le U^{10^{-6}}\). Use the original unphased divisor basis with \(\mathrm Nd_0\le D_0=U^{0.199}\), \(L=U^{1/100000}\), and smooth modes. Use phased vectors
\[
 X^{-1/2}\phi_k(\mathrm Nn/X)\overline{G(n,1)}\,\chi_n(d_1),
 \qquad \mathrm Nd_1\le D_1=U^{0.184},
\]
with sixth-power-free good labels and their natural zeros. The Gauss phase differs from \(\gamma_{-1}\) by a fixed ray sign. The [phased overlap bound](primal-gauss-phase-projection.md) applies to this orientation, since its proof uses only the radical and allows either sign of the label twist. Its diagonal Gram bound is also unchanged. These are norm cutoffs. In particular the phased family here uses the positive symbol on its allowed labels.

## Cross terms with a forced divisor

For an unphased basis vector, let \(h=(n,\operatorname{rad}d_0)\) be its branch. Its symbol is \(\overline{\chi_{n/h}(d_0)}\) and its normalization is \((\mathrm Nh/X)^{1/2}\). Expand its centered divisibility variable as a sum of \(1_{\ell\mid n}\), \(\ell\mid m\), with coefficient mass at most \(U^\epsilon L^{1/2}\). Open the common deletion by divisors \(e\mid\operatorname{rad}F\). On a consistent term set \(n=zv\), with \(z=h\ell e\). These factors are pairwise coprime. Indeed \(m\) is prime to \(d_0F\), and the branch \(h\) is prime to \(F\). If \(\ell\) or \(e\) has a label prime inconsistent with the branch or with the phased zero, the term vanishes.

Multiply the unphased vector by the conjugate of the phased one. The surviving symbols on \(v\) are both conjugated, so their numerator is the product \(d_0d_1\), up to the Gauss CRT correction at \(z\). The character at \(z/h\) in the first symbol and at \(z\) in the second contributes only a fixed scalar. Gauss CRT inserts the square of the \(z\)-symbol, so it costs a numerator power of \(z\) of at most four when put into the conjugated symbol. More explicitly, use the added digit four at each prime of \(z\), then reduce modulo six, choosing six for a zero digit when the prime must remain deleted. The raw sum of digits at such a prime is positive, so this choice never increases the raw norm bound. The new numerator satisfies
\[
 \mathrm Nr\le \mathrm N(d_0d_1)(\mathrm Nz)^4
\]
and its primitive zero conditions enforce the branch exclusions on \(v\), including those at \(z\). Fixed ray phases and the new ray of \(v\) are still handled modulo \(36\).

Apply the same primitive sextic Gauss estimate as in the [previous cross Gram argument](joint-gauss-projection.md), at length \(X/\mathrm Nz\). With the factor \((\mathrm Nh)^{1/2}/X\) from the two vector normalizations, its two terms are bounded by
\[
 \begin{aligned}
 &U^\epsilon X^{-1/2}(\mathrm N(d_0d_1))^{1/4}
                    (\mathrm Nh)\,L^{1/2}W^{1/2},\\
 &U^\epsilon X^{-1/3}(\mathrm N(d_0d_1))^{1/6}
                    (\mathrm Nh)^{1/2}.
 \end{aligned}
\]
For the first bound use \(\mathrm Nz\le\mathrm Nh\cdot L W\). For the second, the shortening \((\mathrm Nz)^{-2/3}\) cancels the \(z\)-cost from the residue bound. All bounds allow polynomial seminorm losses in the mode cutoff. The squarefree support of the primitive series and the kept numerator zeros enforce the original conditions on the residual column.

Now include the expansion mass \(L^{1/2}\), sum the divisors of \(F\) at subpower cost, and take the Frobenius bound over the two families. The result is
\[
 \|C\|\ll_\epsilon (1+M)^C U^\epsilon
 \left[
 X^{-1/2}(D_0D_1)^{3/4}D_0 L^{3/2}W^{1/2}+
 X^{-1/3}(D_0D_1)^{2/3}D_0^{1/2}L
 \right].
\]
The number of branches \(h\) for a given label costs a subpower. The two displayed exponents are below \(-0.019\) at \(X>U^{1.123}\). Choose the mode exponent small enough to retain \(\|C\|\ll U^{-0.018}\).

## Bound the joint removed component

The diagonal Gram blocks have subpower inverse norms. Put \(\theta_0=8749/10000,\ K=A^{-2(1-\theta_0)}\) and \(K_G=X^{-1}B^{3/2}W^{1/2}D_1^2\). Before solving the Gram system the unphased squared overlap mass is \(O_\epsilon(U^\epsilon KL^2)\) by the divisor projection estimates, and the phased mass is \(O_\epsilon(U^\epsilon K_G)\), including the admissible small mode losses.

Eliminate the unphased block as before. The Schur complement and the cross bound show that the difference between the joint and separate unphased projections has squared column mass at most
\[
 O_\epsilon\bigl(U^\epsilon(K_G+U^{-0.036}KL^2)\bigr).
\]
This includes the phased component and the change in the unphased coefficients. Charge it by the generic full smooth operator bound \(U^{1/6+\epsilon}X\). The two exponents are strictly below \(1.104\), using the detector windows. The separate unphased projection is already bounded at the varying unit-label budget and the fixed nonunit budget. Thus the joint projection, with these orientations and norm cutoffs, fits the full budget. The [Lean replay](ContactFactorization.lean) checks the exponent margins.

The residual retains quotient orthogonality for the unphased family under the growing-divisor conditions. It also has phased orthogonality on the original annulus. This argument leaves the high-frequency bound on that residual open.

The [Poisson transfer](projection-poisson-transfer.md) bounds the removed vector in the separated column energies and carries the existing positive-energy sectors over to the residual.

The [small-radical extension](small-radical-primal-gauss.md) adds the phased labels in the Gauss Gram main-dominance range while retaining the unphased quotient conditions.

Prepared with OpenAI Codex assistance.
