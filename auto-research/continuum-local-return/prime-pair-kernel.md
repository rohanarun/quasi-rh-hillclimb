# Sparse pairs in the marked Poisson kernel

Assume the preprint's $7/8$ theorem and the inputs of tracker #143. In the critical marked dyad let $U^\ell$ be the norm scale of one full physical column. A graph of surviving column pairs with at most $U^{.1825}$ partners at either end contributes
$$
 O_\epsilon(U^{.999895+\epsilon})
$$
to the complete all-element kernel. The same estimate holds for the sum over prime-ideal dual frequencies, including primes at the top reflected scale. For example, one may take all surviving pairs with $|Nc-Nc'|\le U^{.1825}$, allowing a divisor-bound $U^\epsilon$ in the degrees. These results use the original two ordinary profiles, their common height, and every selected prime slot. The bounds also hold with the fixed physical height factors of the marked reduction. [Original coefficients](marked-conductor.md#original-columns-and-rows) · [Surviving column pairs](near-squarefree.md#the-conductor-and-the-signed-estimate)

## Cancellation on unit orbits

Include $36\mathcal O$ in the fixed auxiliary identity-ray modulus, by taking a common multiple with the moduli of the prime filter. Each auxiliary prime $\mathfrak p$ then has a generator congruent to one modulo $36\mathcal O$, so $N\mathfrak p\equiv1\bmod36$. This choice concerns only the independent auxiliary filter. At a generator $\zeta$ of the six Eisenstein units, every good prime $\mathfrak l$ satisfies $\chi_{\mathfrak l}(\zeta)=\zeta^{(N\mathfrak l-1)/6}$ by the definition of the residue symbol. All good prime norms are one modulo six. Multiplication modulo $36$ therefore gives
$$
 \chi_c(\zeta)=\zeta^{(Nc-1)/6}.
$$
The same unit character $\chi_c\overline{\chi_{c'}}$ occurs in each of the three auxiliary terms, even if the auxiliary prime divides a column. Whenever $Nc\not\equiv Nc'\pmod {36}$, summing over each unit orbit gives zero. This holds in the complete filtered element sum and in its dual on every union of complete associate orbits, including the six generators of each prime ideal. The physical prime-slot ray masks belong to column coefficients. The Fourier weight is radial and there is no angular restriction on the frequency. If computations have separated the unit choices, regroup them before using this cancellation. [The three shifted kernels and their masks](prime-row-filter.md#the-complete-shifted-kernel) · [Residue-symbol conventions](https://arxiv.org/html/2610.04045v1#S2.SS2)

## A fixed pair at all frequencies and at prime frequencies

Fix an original surviving pair $c,c'$, an auxiliary prime and one of its three terms, with shifted ideals $l,l'$. Let $d$ be its primitive element conductor, $D=Nd$, $E=\operatorname{rad}(ll')/d$. Open the remaining nonunit mask at $j\mid E$ and put $Y=V/Nj$, where $V\ll U$ is the physical shell. The conductor bounds before the auxiliary shift and the polylogarithmic size of that shift give
$$
 U^{1.8501072-o(1)}\le D\ll U^{2\ell+o(1)},\qquad T=D/Y\gg1 .
$$
In particular $d$ has good ramification outside any fixed set. Up to a fixed lattice constant, the term in complete-element Poisson has the form
$$
 \frac{Y}{\sqrt D}\,u_{c,c',j}
       \sum_{h\in\mathcal O\setminus\{0\}}
         \overline{\theta(h)}\,\widetilde W(Nh/T),
       \qquad |u_{c,c',j}|\le1 .
$$
Here $\theta$ is the primitive residue character of $l,l'$, extended by zero on nonunits of $d$. The scalar includes the normalized Gauss sum, the extracted divisor value and the Möbius sign. Any fixed rescaling of the Fourier argument is included in the Schwartz function $\widetilde W$. The Gauss sum at $h$ is its value at one times $\overline{\theta(h)}$, including when this value is zero. In the equal-unit block, $\psi((h))=\overline{\theta(h)}$ defines an ideal character since the field has class number one and $\theta$ is trivial on global units. Its nontrivial local characters at the primes of $d$ make it a primitive nonprincipal finite-order Hecke character. Each nonzero ideal has six generators. [Primitive element Poisson](eighth-conductor.md#separate-the-small-reduced-conductors) · [Reflected scale](dual-marked-frequencies.md#the-reflected-scale)

Set $b=.873346$. The tracker proves that the **Hecke** zero supremum is at most the exact contact, which is strictly below $87334587/10^8<b$. For any fixed small $\delta>0$, on $\Re s=b+\delta$ the preprint bounds $|L(s,\psi)|\ll_{\epsilon,\delta}(2D(3+|\Im s|)^2)^\epsilon$ and $|L'/L(s,\psi)|\ll_\delta\log(2D(3+|\Im s|)^2)$. Both functions are holomorphic through the contour shift from two. [Hecke endpoint and its rational upper enclosure](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/ExactEndpoint.lean#L119-L131) · [Preprint logarithmic control](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1531-L1599)

Take a fixed smooth dyadic partition of the nonzero norms, at scale $X$. On each annulus combine its bump with $\widetilde W(Xx/T)$ in the normalized variable $x=N(h)/X$. Its fixed derivative seminorms are $O_M((1+X/T)^{-M})$ for arbitrarily large $M$. Mellin inversion with $L(s,\psi)$ bounds the sum of $\psi$ on this dyad by $O_{\epsilon,M}((2DX)^\epsilon X^b(1+X/T)^{-M})$, choosing the contour shift and the conductor loss inside the stipulated $\epsilon$. For the prime sum use $-L'/L$ and additionally divide the test by $\log(Xx)$ for $Xx\ge2$. This gives the unweighted sum over primes after removing the prime powers of exponent at least two. Their absolute cost is $O_M(X^{1/2}\log(2X)(1+X/T)^{-M})$, by ideal counting. The bounded initial annuli can be handled directly.

A sharp lower or upper norm endpoint in a dyad gives the same bound. Place each transition halfway between consecutive integer norms and smooth it on an interval of width at most $1/2$ in the unscaled norm. This preserves every term of the sum. In the normalized variable the resulting test has first derivative of bounded $L^1$ norm and second derivative of $L^1$ norm $O(X)$, both times $O_M((1+X/T)^{-M})$. Its Mellin transform on the shifted line is thus bounded by that common decay times
$$
 O\big(\min(1,(1+|t|)^{-1},X(1+|t|)^{-2})\big).
$$
The integral against either logarithmic-control bound costs $O_\epsilon((2DX)^\epsilon)$ after decreasing the preliminary exponent. This proves the estimate on any one norm interval, including a sharply cut prime dyad. A restriction to an arbitrary subset of primes has no such contour representation.

Summing dyads and multiplying by the Poisson prefactor bounds each complete or prime-frequency pair correlation by
$$
 O_\epsilon\big(U^\epsilon Y^{1-b} D^{\,b-1/2}\big)
 \ll_\epsilon U^{1-b+(2b-1)\ell+\epsilon}.
$$
The choices of $j$ are divisor-bounded, and the three absolute auxiliary coefficients have normalized total mass two. Since $\ell<.92506758$, the pair exponent is at most $.81739456144536$. Using only $b=7/8$ gives $1/8+3\ell/4$, which also suffices for degree exponent $.181$.

## Summing the graph and its intersection with the known frequencies

The divisor envelope $|\lambda_c|\ll_\epsilon U^\epsilon (Nc)^{-1/2}$ on $Nc\asymp U^\ell$ gives $\sum_c|\lambda_c|^2\ll_\epsilon U^\epsilon$. For a graph with both degrees $O_\epsilon(U^{\theta+\epsilon})$, Cauchy–Schwarz on its edges yields $\sum_{(c,c')}|\lambda_c\lambda_{c'}|\ll_\epsilon U^{\theta+\epsilon}$. This graph is on the original columns and may be intersected with any further pair restriction. For the norm-difference example, each integer norm $m$ supports at most $\tau(m)$ ideals, by the split, inert and ramified Euler factors of the quadratic field. Each column has $O_\epsilon(U^{.1825+\epsilon})$ partners. Adding $.1825$ to the fixed-pair exponent gives $.99989456144536<.999895$.

For the signed remainder one may remove the sparse graph together with the frequency ranges already estimated on all pairs. To check their intersection, first discard the rapid-decay tail at $Nh>U^{H}$, $H=.850146$. Its absolute bound remains valid on every subgraph. Within this cutoff the previously treated union has $O_\epsilon(U^{.463+\epsilon})$ frequencies. Indeed the small norm range has exponent $.46252$. For the exact-valuation-one product $e$ of norm at most $U^{.0748}$, the remaining ideal is powerful. Every powerful ideal has a representation $a^2j^3$ with $j$ squarefree. Summing $(Nj)^{-3/2}$ shows that there are $O(X^{1/2})$ such ideals of norm at most $X$. Summing over $e$ now gives exponent $(H+.0748)/2=.462473$. For the other radical ranges write $(h)=h_0v^6$ with $h_0$ sixth-power-free. At each fixed radical $r$ there are at most $5^{\omega(r)}$ cores. When $Nv\le U^{10^{-7}}$ and $N\operatorname{rad}(h_0)\le U^{.46252}$, direct counting costs exponent $.4625201+\epsilon$. When $N\operatorname{rad}(h_0)\le U^{.199}$, summing $(U^H/Nr)^{1/6}$ over the radicals costs exponent $H/6+5(.199)/6+\epsilon<.309$. The six unit choices cost a constant. [Known dual ranges](dual-marked-frequencies.md) · [Exact-valuation-one range](powerful-marked-frequencies.md)

Every individual frequency costs $O(Y/\sqrt D)$ per pair. Thus even an arbitrary subset of the intersection of those frequencies and the sparse graph contributes in absolute value at most
$$
 O_\epsilon\big(U^{1-1.8501072/2+.463+.1825+\epsilon}\big)
 =O_\epsilon(U^{.7204464+\epsilon}).
$$
Subtracting this intersection uses only counting. In particular the sharp prime estimate applies to all top primes on the graph, and the all-frequency estimate removes the graph from the earlier signed remainder. The dense equal-residue pairs at the remaining frequencies still require a bound to improve the all-moduli endpoint.

Prepared with OpenAI Codex assistance.
