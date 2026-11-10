# Project the actual sparse detector vector away from smooth Gauss tests

The [weighted row Gram reduction](weighted-detector-row-gram.md) asks for a squared adjoint norm of size \(U^{1-1/14000+\epsilon}\|z\|^2\) on the actual detector vector. On the squarefree row block let \(c=D^*z\), where the outside slot bound is \(\|c\|^2\ll_\epsilon U^{0.014616+\epsilon}\|z\|^2\). Its support has cardinality at most \(U^{0.636+\epsilon}\). This sparsity bounds the size of the smooth Gauss components even though the entries of \(c\) contain an inverse polynomial and an amplitude restriction.

## One projection on the original squarefree row space

Fix the ray and bad-prime data as in the [squarefree row Poisson calculation](detector-dual-frequencies.md). Use a fixed annulus at \(X=U\) containing the row support in its interior. On all good squarefree rows in this annulus use the two families of [the asymmetric joint projection](asymmetric-joint-projection.md), with base norm cutoffs
\[
 D_0=U^{0.199},\qquad D_1=U^{0.140},\qquad L=U^{0.004}.
\]
The unphased family includes the centered divisibility indices of norm at most \(L\) and the branch \(h=(u,\operatorname{rad}d_0)\). The phased family is \(U^{-1/2}\phi_k(\mathrm Nu/U)\overline{G(u,1)}\chi_u(d_1)\) with the opposite symbol orientation, including its Euler zeros. Also include the phased labels of norm at most \(U^{0.350}\) and radical norm at most \(U^{0.075}\), using the two-cutoff version of the [same cross Gram estimate](small-radical-primal-gauss.md). This includes the positive label of norm \(U^{0.190}\) and radical norm \(U^{0.038}\) from the earlier [Gauss witness](full-joint-gauss-obstruction.md). The number of smooth modes can grow as a sufficiently small fixed power of \(U\). The deletion before projection is fixed; moving deletions will be kept in the adjoint and Poisson calculations.

The diagonal Gram blocks and the cross block are those of the earlier projections with \(X=U\). The unphased Gram error has exponent \(-1/2+2(0.199)+2(0.004)=-0.094\), and the phased error has exponent \(-1/2+3(0.140)/2=-0.290\). The two cross-block exponents, before mode losses, are
\[
 -\tfrac12+\tfrac34(0.199+0.140)+0.199+\tfrac32(0.004)
 =-0.04075,\qquad
 -\tfrac13+\tfrac23(0.199+0.140)+\tfrac12(0.199)+0.004
 <-0.0038.
\]
For the added phased subfamily the norm and radical exponents enter separately. The two cross exponents are bounded by
\[
 -\tfrac12+\tfrac74(0.199)+\tfrac14(0.350)+\tfrac12(0.075)+\tfrac32(0.004)
 =-0.02075,\qquad
 -\tfrac13+\tfrac76(0.199)+\tfrac16(0.350)+\tfrac12(0.075)+0.004
 <-0.0013.
\]
The full phased family's radical cutoff and count still have exponent \(0.140\). Thus the joint Gram inverse has subpower norm with sufficiently small mode loss. In this application the profile variable is the detector row norm, and the basis does not incorporate a factorization of the entries of \(c\).

## Price the projection using support size

Let \(P\) be the orthogonal projection and \(p=Pc\). For each fixed \(u\), only one branch per unphased label is active. Grouping by its value \(h\mid u\), the sum of branch weights \(\mathrm Nh\) is \(O_\epsilon(D_0 U^\epsilon)\): the number of labels divisible by \(h\) is \(O(D_0/\mathrm Nh)\). The centered divisibility variable satisfies \(|R_m(u)|^2\le\mathrm Nm\), so summing it over \(m\) costs \(O(L^2)\). The phased basis has modulus at most that of its smooth profiles, since its Gauss factor has modulus one and its symbols have modulus at most one. It follows that the sum of squared basis values at \(u\) is at most
\[
 U^{-1+\epsilon}(D_0 L^2+D_1)
\]
times the smooth mode loss. Cauchy–Schwarz on the support of \(c\), followed by summing the squared overlaps and using the inverse Gram bound, gives
\[
 \|p\|^2\ll_\epsilon
 U^{0.636-1+\epsilon}(D_0L^2+D_1)\|c\|^2
\]
with the same mode loss. This is a bound for the projection in the larger squarefree row space.

The [unrestricted-column sextic sieve](weighted-detector-row-gram.md) at \(N=U^{0.8445}\) gives the full squared adjoint norm at most \(U^{1+0.8445/6+\epsilon}\) times the squared coefficient mass. Applied to \(p\), the resulting exponent including the outside slot cost is at most
\[
 0.8445/6+0.636+0.199+2(0.004)+0.014616=0.998366.
\]
There is room to take the smooth mode loss at most \(U^{1/100000}\). Thus \(\|T_{\rm in}^*p\|\) fits the required budget. By the triangle inequality for the full adjoint, it is sufficient to estimate \(T_{\rm in}^*(c-p)\) on this squarefree block. The residual is defined in the larger annulus and can have nonzero entries away from the fibre. Its part away from the fibre is exactly \(-p\).

## Transfer the established frequency estimates

For any squarefree row vector in this annulus, apply the separated positive energy argument of the [squarefree Poisson calculation](detector-dual-frequencies.md) and sum the shortened coefficient masses over \(g,e,\ell\). The divisor multiplicity bound applies on the enlarged annulus as well. Put \(\nu=0.8445\) and use \(y\le 1\) and \(\kappa\le 2y-\nu+O(\epsilon)\). After freezing the sixth-power part, the four energy exponents are at most
\[
 y,\qquad 5\nu/6+y/3,\qquad \nu/6+y,\qquad 2\nu/3+y/2
\]
up to small losses. The second uses \(6f\le\kappa+\lambda\); the other terms follow by discarding nonpositive shortening and power-factor terms. The largest is at most \(1+\nu/6\). The conclusion applies separately to both positive energies and to any restriction of their blocks. In particular the projected vector's full separated energies fit the same \(0.998366\) bound, with the same mode loss as above.

On a block where the original vector's two positive energies have been estimated, those for \(c-p\) are bounded by twice the sum of the original and projection energies. This transfers, in particular, the [sparse large-sixth-power estimate](sparse-detector-frequencies.md), even though its support count was proved for \(c\). The full adjoint reduction uses the triangle inequality before requiring a bound for the residual, so it does not require estimating individual mixed terms on the still-open frequency blocks.

The residual is orthogonal to both chosen mode families. By the [divisor basis](growing-divisor-projection.md), the unphased tests include smooth quotient tests with all good sixth-power-free labels of norm at most \(U^{0.199}\), whenever the quotient divisor and any extra squarefree deletion together have norm at most \(U^{0.004}\). The phased tests cover the original annulus and the two label ranges stated above. Orthogonality extends to fixed smooth interior profiles up to arbitrary power decay by the [smooth approximation](smooth-gauss-profiles.md). The [Lean replay](ContactFactorization.lean) checks the Gram and norm margins. High-frequency cancellation for this specific residual and the complementary nonsquarefree row estimate remain open.

Prepared with OpenAI Codex assistance.
