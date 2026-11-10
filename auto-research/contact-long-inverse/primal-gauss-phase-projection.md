# Project onto Gauss phases using the actual Möbius factor

The [projected high-shell witness](projected-gauss-obstruction.md) separates two issues. A smooth profile can survive because its label is absent from the projection. On the original row average the known Gauss test vectors also carry a phase in the input coefficient. The latter vectors can be priced directly for the actual detector coefficients by cubic reflection.

## Gauss phases in the original column space

Use the same good squarefree mixed block \(a\) of lengths \(A=U^\beta,\ B=U^\gamma,\ X=AB\). The fixed deletion has radical norm at most \(W\le U^{10^{-6}}\). On a fixed ray block take the smooth vectors from the [profile projection](smooth-gauss-profiles.md), now multiplied by the normalized one-column Gauss phase. Use the orientation appropriate to the primal Gauss test in [Xu–Sang, §3](https://arxiv.org/html/2610.17675v2#S3). Up to the fixed ray sign this is \(\gamma_{-1}(n)\). Its modulus is one on the column support. Include all good sixth-power-free labels \(d\) with \(\mathrm N\operatorname{rad}d\le D\). Their number is \(O_\epsilon(D^{1+\epsilon})\), since each squarefree radical has at most five choices per prime. Keep the zeros at primes of \(d\).

The common Gauss phase cancels from their Gram matrix. The earlier smooth-profile Gram estimate therefore holds with this radical cutoff. For distinct labels the ratio has a good conductor at most \(D^2\) and is nonprincipal at a prime where their digits differ. For \(D\le U^{0.184}\), the off-diagonal norm \(O_\epsilon(X^{-1/2}D^{3/2}U^\epsilon)\) for one profile is smaller than the diagonal. A growing number of smooth modes as in the earlier projection costs only a polynomial in the mode cutoff and retains the strict margin.

## Price the overlaps with the phase

After taking an overlap, conjugate the entire sum if needed so that the Gauss phase on the mixed coefficient is \(\gamma_{-1}(ib)\), with \(i\) the inverse index and \(b\) the ordinary index. Separate the two norm profiles. For fixed \(b\), Gauss CRT contributes the moving twist \(\chi_i(b)^{-2}\). A nonzero column is prime to \(d\), so the good primes of \(b\) have the local exponent \(4\) in the cubic reflection. The factor \(\mu(i)\gamma_{-1}(i)\) is converted by the same Hasse identity as in the [small-core reflection estimate](cubic-small-core.md).

Complete and remove the cubes as in that estimate. Each prime of \(b\) costs at most a square root of its norm in the effective reflected length scalar. Pure deletions have the same square-root cost. Primes of \(d\) have arbitrary nonzero local exponents and can be counted once in the conductor, so their total cost is at most \(\mathrm N\operatorname{rad}d\). Thus the effective scalar in the bound \(\min(\sqrt T,D_{\mathrm{eff}}/\sqrt T)\) is at most
\[
 D_{\mathrm{eff}}\ll (\mathrm N\operatorname{rad}d)\,(BW)^{1/2}
\]
on each ordinary dyad. The cube removal still costs subpowers. Summing the normalized ordinary factor absolutely contributes \(B^{1/2}\); the test vector contributes \(X^{-1/2}\). The squared overlap is consequently
\[
 \ll_\epsilon U^\epsilon X^{-1}B^{3/2} W^{1/2}
                   \mathrm N\operatorname{rad}d .
\]
The same bound holds for a fixed number of norm derivatives with the corresponding finite seminorm costs. It uses the Möbius coefficient in the inverse factor.

By the inverse Gram bound, the squared column mass of the removed projection is at most \(U^\epsilon X^{-1}B^{3/2}W^{1/2}D^2\). The generic sextic sieve on the full smooth row average has squared operator norm \(O_\epsilon(U^\epsilon U^{1/6}X)\) in this window. Indeed splitting off sixth powers gives \(U,\ U^{1/6}X,\ U^{5/6}X^{1/3},\ U^{1/3}X^{5/6}\), of which the second is largest for \(X>U\). The removed component therefore has full squared row norm at most
\[
 O_\epsilon(U^{1/6+\epsilon}B^{3/2}W^{1/2}D^2).
\]
At \(D=U^{0.184}\) this fits \(1.104\), even with a small fixed power loss for growing smooth modes, since \(\gamma<0.379\). The [Lean replay](ContactFactorization.lean) checks the exponent margins. This is a separate projection in the original coefficient space. The argument does not bound the Gram cross terms between this phase-bearing family and the unphased family, so their two projections are available separately.

## Index the unphased projection by radicals

The [growing-divisor projection](growing-divisor-projection.md) also works when its label condition is changed to \(\mathrm N\operatorname{rad}d\le U^{0.199}\). Its Gram, overlap and ordinary-moment bounds use the conductor and the number of labels, both of which have the same exponents with this indexing. The branch index remains a divisor of the radical. The exceptional sixth-root count only used the uniform upper bound \(O_\epsilon(U^{1/6+\epsilon})\), so the larger possible norm of \(d\) costs nothing there. The example with \(d_*=\pi^5,\ \mathrm N\pi\asymp U^{0.041}\) is now approximated to arbitrary power accuracy by the enlarged smooth family.

The same obstruction proof also supplies an example outside this enlarged family. Set \(h=1.188,\ y=1.129,\ p=0.200\), so the high frequency length is \(U^h\), the column length is \(U^y\), and the chosen prime has norm comparable to \(U^p\). The fifth-power label again costs \(p/6\) in the Gram main exponent. Put \(\tau=5h/6+y/3\). The two squarefree Gauss error exponents \(h+(2y-h)/12\) and \(p+y\) are below \(\tau-p/6\). The radial Poisson error saves \((2y-1-h)/2>p/6\). The exact coprimality argument is unchanged. The radical-indexed projection has a power-saving squared overlap with this constructed vector, using the same Gram completion and the fact that its prime radical lies beyond the cutoff. The resulting coefficient-uniform obstruction is \(U^{1-y+\tau-p/6-o(1)}=U^{1.204-o(1)}\). Thus the extension removes the earlier example but the isolated signed high shell still requires a bound that uses the actual coefficients or cancellation between blocks.

Prepared with OpenAI Codex assistance.
