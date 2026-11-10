# Combine the phased and unphased column projections

The [Gauss phase projection](primal-gauss-phase-projection.md) and the [unphased smooth projection](smooth-gauss-profiles.md) were bounded separately. On column ray blocks carried by the fixed modulus \(36\), the sextic Gauss series gives a power-saving cross Gram bound. Both families can then be removed in one projection with labels of radical norm at most \(U^{0.136}\).

## A bound for the cross Gram block

Use the good squarefree mixed column block of scale \(X=AB\) and its moving deletion \(F\), with radical norm at most a fixed multiple of \(W\le U^{10^{-6}}\). Fix a ray class in the E-primary conventions modulo \(36\). The fixed conversion between primary and E-primary generators is absorbed in the ray phases. On this ray use the two smooth bases with the same annular support. One basis has the normalized Gauss phase and the other has none. Labels \(d_0,d_1\) in the two families are sixth-power-free with radical cutoffs \(D_0,D_1\).

A cross Gram entry, up to conjugation and a fixed ray factor, is a normalized smooth sum of one sextic Gauss phase times a residue symbol. At each prime of the two labels take the difference of the digits modulo six. If a common prime has difference zero, keep the original zero there by giving the numerator exponent six. The resulting good numerator \(r\) satisfies
\[
 \mathrm Nr\le (D_0D_1)^5 .
\]
The reason is that a prime occurring in both radicals has two factors in the right hand side, enough for a digit six. The fixed ray restriction is a finite expansion into characters modulo \(36\), as permitted by the sextic Gauss series.

The primitive series of [Gao–Zhao, Lemmas 2.6 and 3.4](https://arxiv.org/pdf/2201.01885v2#page=6) gives the normalized-coefficient smooth sum bound at length \(Y\)
\[
 O_\epsilon\bigl(U^\epsilon
   [Y^{1/2}(\mathrm Nr)^{1/4}+Y^{2/3}(\mathrm Nr)^{1/6}]\bigr),
\]
with finite profile seminorm dependence. The two terms come from the line \(1+\epsilon\) and the possible pole at \(7/6\) of the raw series. Its primitive restriction implies squarefree column support: for a unit numerator the additive Gauss sum at a prime-power modulus of exponent greater than one vanishes. Thus no independent squarefree expansion is needed for this sum.

For the extra moving deletion, expand \(1_{(n,F)=1}\) over \(e\mid\operatorname{rad}F\). Only \((e,r)=1\) contributes. Write \(n=ev\) with \(v\) coprime to \(e\). The normalized Gauss CRT identity moves the \(e\)-dependence on \(v\) into a symbol of exponent \(2\) or \(4\) at those primes, together with a fixed ray character and a scalar of modulus at most one. Hence it may be included in the numerator, and the primitive restriction on the new numerator enforces \((v,e)=1\). This gives a numerator bound \((D_0D_1)^5W^4\) and a length at most \(X\). The divisor sum costs subpowers. The same argument absorbs additional fixed good prime exclusions.

Divide by \(X\) for the two vector normalizations and take the Frobenius bound over labels and modes. The cross Gram operator norm is at most
\[
 (1+M)^C U^\epsilon\left[
     X^{-1/2}(D_0D_1)^{7/4}W
       +X^{-1/3}(D_0D_1)^{4/3}W^{2/3}\right].
\]
Here \(M\) bounds the smooth mode cutoff, and the fixed seminorm order can be chosen before its power of \(U\). With \(D_0=D_1=U^{0.136}\), \(X>U^{1.123}\), the two exponents are strictly below \(-0.01\). Choose the mode exponent and the preliminary losses sufficiently small, so that the cross block has norm \(O(U^{-0.01})\).

## Charge the change from the separate projection

Write \(G_0,G_1\) for the two diagonal Gram blocks and \(C\) for the cross block, in unphased–phased order. The diagonal blocks have subpower inverse norms by the earlier Gram estimates. The full Gram matrix also has a subpower inverse norm, since \(C\) is smaller than either diagonal lower bound.

Put \(\theta_0=8749/10000\), and let \(a_0,a_1\) be the overlap vectors of the actual mixed coefficient against the unphased and phased families. The previous overlap bounds give
\[
 \|a_0\|^2\ll_\epsilon U^\epsilon K,\qquad
 \|a_1\|^2\ll_\epsilon U^\epsilon K_G,
 \quad
 K=A^{-2(1-\theta_0)},\qquad
 K_G=X^{-1}B^{3/2}W^{1/2}D_1^2 .
\]
For \(a_0\), the nonunit overlap mass is smaller than \(K\) by a fixed power at this cutoff. Smooth modes add only small polynomial losses. The fixed margins below permit those losses.

Let \(c_0,c_1\) be the coefficients of the joint orthogonal projection. The Schur complement gives
\[
 \|c_1\|^2\ll_\epsilon U^\epsilon(K_G+U^{-0.02}K).
\]
The difference between \(c_0\) and the coefficients of the separate unphased projection is \(-G_0^{-1}Cc_1\), so its norm is no larger than a subpower times \(\|c_1\|\). The diagonal Gram upper bounds then give the same squared column-mass bound for the correction from the separate unphased projection to the joint one.

The [full smooth unphased estimate](full-column-projection.md), with the stronger ordinary bound and growing profiles, already charges the separate unphased projection at the varying budget. Charge the correction by the generic squared operator bound \(U^{1/6+\epsilon}X\). Its two resulting exponents are bounded above by
\[
 \tfrac16+\tfrac32\gamma+\tfrac12\log_U W+2(0.136),
 \qquad
 \tfrac16+\log_U X-0.02-2(1-\theta_0)\beta .
\]
Both lie below \(1.104\) in the detector window. The [Lean replay](ContactFactorization.lean) checks these margins and the cross-block comparison. The unit-label estimate of the separate projection is used only at its original varying budget.

The residual is orthogonal to both smooth families on the chosen ray and annulus. The result concerns the original column block and its common deletion. The earlier growing-divisor extension is available for the unphased family separately. A high-frequency estimate for the joint residual remains open.

Prepared with OpenAI Codex assistance.
