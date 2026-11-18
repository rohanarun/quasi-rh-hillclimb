# Reflecting the surviving physical numerator

Assume the preprint's 7/8 theorem, the physical estimates of tracker #143 and de Faveri's sixth-order large sieve. Write $q_a$ for the norm of an ideal and $q_u=|u|^2$ for an Eisenstein element. Fix one critical physical bin, including its amplitude mask. The short-dilation reduction leaves a large-radical contribution with coefficient scales $T\ge c_0U^{.5748}$, for a constant $c_0>0$ independent of the row. Either the small-amplitude argument already saves on a row or some such scale satisfies
$$
 |S_u(T)|\ge U^{.08516},\qquad
 S_u(T)=T^{-1/2}\sum_{(n,S)=1}\psi_u(n)W(q_n/T).
$$
Here $W$ is the fixed smooth annular physical numerator weight and $\psi_u$ is its original nonprincipal character presentation. All good ramified primes retain their zero extensions. The goal is to count these large amplitudes, uniformly even when a different coefficient scale is chosen on every row. [Original amplitude and surviving scales](short-dilation.md)

Fix $0<\sigma<1$ and put $H=U^{.4252+\sigma/16}$. The remaining hypothesis is a single signed sum, already averaged over the dyadic scales and norm-twist heights. Take a fixed real nonnegative smooth bump $\omega$ supported on $[1/2,2]$ with $\sum_{j\ge0}\omega(x/2^j)=1$ for $x\ge1$. One choice is $\omega(x)=f(x)-f(2x)$ for a smooth decreasing cutoff $f$ equal to one below one and zero above two. Use a separate, fixed nonnegative smooth radial weight $W_{\rm row}(q_u/U)$ majorizing the row dyad. Define
$$
 P_u(N,v)=\sum_{(a,S)=1}\psi_u(a)q_a^{-1/2-iv}\omega(q_a/N),
 \quad P_u(N,v)^4=\sum_n\lambda_n(N,v)\chi_n(u).
$$
Here $\psi_u(a)=\chi_a(u)$, with any common fixed ray twist incorporated in $\lambda_n$. The pair kernel $K(n,m)$ sums $W_{\rm row}(q_u/U)\chi_n(u)\overline{\chi_m(u)}$ over all sixth-power-free elements $u$ coprime to $S$, including their unit factors. For the actual fixed weight $W$ let $\widetilde W$ be its radial Fourier transform, $F(y)=e^{y/2}\widetilde W(e^y)$ and
$$
 w(v)=\frac{|\widehat F(v)|+|\widehat F(-v)|}{2\pi},\qquad
 \widehat w(\ell)=\int_{\mathbb R} w(v)e^{-iv\ell}\,dv .
$$
Both hats use the convention $\widehat f(v)=\int f(y)e^{-ivy}\,dy$. The proposed sufficient bound, with a constant independent of $U$, is
$$
 \sum_{\substack{U^{.303}<N\le H\\ N\ {\rm dyadic}}}
 \ \sum_{\substack{U^{31/20}<q_{d(n,m)}\le U^{3.4016+\sigma}\\
                 q_{d_6(n,m)}>U^{7/6}}}
 \lambda_n(N,0)\overline{\lambda_m(N,0)}\,K(n,m)\,
 \widehat w\!\left(\log\frac{q_n}{q_m}\right)
 \ \le C_{\epsilon,\sigma} U^{653/500+\epsilon}.                  \tag{1}
$$
Here $d(n,m)$ contains the primes where the two valuations differ modulo six, and $d_6(n,m)$ contains those where the difference is $1$ or $5$ modulo six. In particular $d_6$ is the product of the primes of local order six. Every column satisfies $q_n\le(2N)^4$. Hence $q_d\le(2H)^8=2^8U^{3.4016+\sigma/2}\le U^{3.4016+\sigma}$ for sufficiently large $U$. The [complete small-conductor estimates](eighth-conductor.md) cost at most $U^{125/96+\epsilon}$ on $q_d\le U^{31/20}$ and $U^{47/36+\epsilon}$ on the further range $q_{d_6}\le U^{7/6}$. Both fit below $653/500$. Estimate (1) remains open.

## Exact rowwise reflection

Let $\psi^*$ denote the primitive character of conductor ideal $\mathfrak f$ and norm $Q\ll_S U$ inducing $\psi_u$. A good prime dividing the sixth-power-free $u$ ramifies in $\psi^*$, since its local character has order $6/\gcd(6,v_p(u))>1$. Thus $\psi^*(n)=\psi_u(n)$ on all $(n,S)=1$, including the zeros at good primes. Write $S_0=\prod_{p\in S}p$. Inclusion–exclusion in the original sum gives
$$
 S_u(T)=\sum_{e\mid S_0}\mu(e)\psi^*(e)q_e^{-1/2}\,
       S_{\psi^*}(T/q_e;W),
$$
where the sum defining $S_{\psi^*}$ runs over all nonzero integral ideals. The extracted factors belong to a fixed finite set. [Ramification and primitive presentations](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4220-L4271)

The primitive character on ideals induces the periodic element character $a\mapsto\psi^*((a))$ of conductor $\mathfrak f$, extended by zero on nonunits modulo $\mathfrak f$. This character is trivial on the six global units. Coset Poisson summation and the primitive Gauss identity therefore give exactly
$$
 S_{\psi^*}(Y;W)=\gamma_u S_{\overline{\psi^*}}(Q/Y;\widetilde W),
 \qquad |\gamma_u|=1.
$$
Here $\widetilde W(|z|^2)$ is the planar Fourier transform of $W(|z|^2)$ in the preprint's self-dual measure. The unnormalized prefactor is $Y/\sqrt Q$. Division by $\sqrt Y$ gives $(Q/Y)^{-1/2}$. The zero frequency vanishes by nonprincipality and the six generators of each ideal occur on both sides. For arbitrary primitive moduli the finite identity follows by orthogonality: the Gauss transform on a unit is the conjugate character times its value at one, and at a nonunit a unit stabilizing the additive frequency with nontrivial character value forces vanishing. Such a unit exists by primitivity. Plancherel gives magnitude $\sqrt Q$ at one. [Unit-trivial raw character of the primitive presentation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1454-L1474) · [Radial Poisson normalization](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4831-L4874)

Write a dual ideal uniquely as $ba$ with $b$ supported on $S$ and $(a,S)=1$. This supplies scalar $q_b^{-1/2}\overline{\psi^*(b)}$ and leaves the good polynomial
$$
 X^{-1/2}\sum_{(a,S)=1}\overline{\psi_u(a)}\,\widetilde W(q_a/X),
 \qquad X=\frac{q_eQ}{Tq_b}\ll_{S,c_0}U^{.4252}.
$$
The absolute masses in $b$ sum to at most $\prod_{p\in S}(1-q_p^{-1/2})^{-1}$. The scale $X$ is allowed to be arbitrarily small.

Define $F(y)=e^{y/2}\widetilde W(e^y)$. Radial smoothness at zero and the Schwartz derivative bounds at infinity imply that $F$ and all its derivatives decay faster than every power of $|y|$ at both ends. In particular $\widehat F$ is a fixed Schwartz function. The normalized dual weight is exactly $q_a^{-1/2}F(\log q_a-\log X)$. Insert the fixed nonnegative partition $\sum_{N=2^j,\,j\ge0}\omega(q_a/N)=1$. Every dyad with $N>H$ lies at $q_a>H/2$ and its total tail, summed over all such dyads, is bounded for each $L>1$ by
$$
 C_{L,W}H^{1/2}(2X/H)^L .
$$
This follows by summing the ideal-count bound on dyads and using $|F(\log(r/X))|\ll_L (X/r)^L$ there. As $X/H\ll_{S,c_0} U^{-\sigma/16}$, the tail is $O_{\sigma,A}(U^{-A})$ for any fixed $A$, uniformly in the row, $e,b$ and every allowed $T$.

On the retained dyads Fourier-invert $F$. The scale $X$ occurs only in the row scalar $X^{-iv}$ of modulus one. Since $\omega$ is real, conjugating the polynomial with $\overline{\psi_u}$ changes only the sign of its norm height. The nonnegative even weight $w$ above majorizes either orientation of the inverse Fourier density and satisfies $\int w(v)(1+|v|)^J\,dv<\infty$ for every fixed $J$. Up to the fixed normalization of the Fourier transform and the sum of the fixed $e,b$ weights, this proves the pointwise uniform inequality
$$
 \sup_{T\ge c_0U^{.5748}}|S_u(T)|
 \ll_{W,S,c_0}
  \sum_{N\le H \ {\rm dyadic}}\int_{\mathbb R}w(v)|P_u(N,v)|\,dv
  +O_{\sigma,A}(U^{-A}).                                               \tag{2}
$$
The right-hand side is defined on the complete sixth-power-free dyad. Thus the restriction to large-radical physical rows or their individually chosen scales precedes bounding by a sum on the complete dyad.

## Small dyads and count transfer

For $N\le U^{.303}$ expand $P_u(N,v)^3$ as a column of length $L\ll N^3$ bounded coefficientwise by $d_3(n)q_n^{-1/2}$ on $q_n\asymp N^3$. The sign and height twists are fixed across rows. Applying de Faveri's sixth-order large sieve on the complete sixth-power-free physical row dyad gives
$$
 \sum_u W_{\rm row}(q_u/U)|P_u(N,v)|^6
 \ll_\epsilon U^\epsilon\bigl(U+N^3+U^{5/6}N+U^{1/3}N^{5/2}\bigr)
 \ll_\epsilon U^{5/6+.303+\epsilon}.
$$
Here $W_{\rm row}$ is the fixed smooth nonnegative row majorant used in $K$. For exact applicability, split physical element units into their six choices and write the good row ideal with its primary generator. The unit contributes a common column phase. With the primary Kummer representatives from the reduced-conductor proof, $\chi_n(u)$ is the usual de Faveri character with index the row ideal and argument $n$. Fixed ray phases in the numerator are column weights. If $n=h^6 a$ with $a$ sixth-power-free, extract $q_h^{-3}$ from normalization and retain $(h,u)=1$ for this term. On its reduced annulus the remaining sixth-power-free column vector has squared norm $O_\epsilon(U^\epsilon)$ by ideal counting, the divisor bound and the original coefficient envelope. For each fixed $h$ drop the coprimality restriction only on the positive row norm, then sum in its square-root norm using $\sum_h q_h^{-3}<\infty$. This proves the displayed estimate uniformly in $v$ and includes bounded scales. [De Faveri, Theorem 1.1](https://arxiv.org/html/2610.04045v1#S1.SS1)

Call the two nonnegative parts of the majorant in (2) $B_{\mathrm{short}}$ and $B_{\mathrm{long}}$, split at $U^{.303}$. For either range $\mathcal N$ and $k=6$ or $8$, weighted Hölder on the product of its counting measure and $w(v)\,dv$ gives the pointwise estimate
$$
 \left(\sum_{N\in\mathcal N}\int w(v)|P_u(N,v)|\,dv\right)^k
 \le \left(\#\mathcal N\int w\right)^{k-1}
       \sum_{N\in\mathcal N}\int w(v)|P_u(N,v)|^k\,dv .
$$
The empty range contributes zero. The short sixth-moment bound now costs $U^{5/6+.303+\epsilon}$. On the long range expand the positive eighth moment only after this step. Multiplicativity of the norm gives $\lambda_n(N,v)=q_n^{-iv}\lambda_n(N,0)$, hence integration of each pair introduces exactly $\widehat w(\log(q_n/q_m))$. The pair and scale sums are finite and $w$ is integrable. All three cutoff conditions are independent of $v$. For the complementary pairs, integrate the two complete small-conductor bounds at each $N,v$ in absolute value and sum the $O(\log U)$ dyads. Their total cost is $O_\epsilon(U^{47/36+\epsilon})$. The remaining integral over all long dyads is the real signed sum in (1). Its one-sided bound suffices because this expansion started from a positive row eighth moment. After absorbing logarithms, the two conclusions are
$$
 \sum_u W_{\rm row} B_{\mathrm{short}}^6\ll_\epsilon U^{5/6+.303+\epsilon},
 \qquad
 \sum_u W_{\rm row} B_{\mathrm{long}}^8\ll_\epsilon U^{653/500+\epsilon}.
$$
Only the second uses (1). Uniform estimates at each frequency and scale would imply it, but the stated test requires only the single averaged total. On an actual row with a scale above $U^{.08516}$ in magnitude, one of the two majorants exceeds a fixed positive constant times $U^{.08516}$. Markov bounds the two counts by exponents
$$
 5/6+.303-6(.08516)=.62537333\ldots,\qquad
 653/500-8(.08516)=.62472 .
$$
Both are strictly below $R-2\eta>.6256698$ for $\eta=10^{-7}$. If the physical class contains several dyads $q_u\asymp V$ with $V\le U$, apply (1)–(2) on each dyad with $V$ as the scale. The tested lengths satisfy $T\ge c_0U^{.5748}\ge c_0V^{.5748}$ and the threshold $U^{.08516}$ is at least $V^{.08516}$. Summing the two dyadic count bounds costs a logarithm, and bounded dyads contribute $O(1)$. This gives the sufficient saved count on the rows with a surviving large physical coefficient. The inherited physical fourth moment then saves on their contribution. Rows with small coefficients already save by the elementary physical mass estimate. No common central $L$-value sample or height grid enters this implication. The full unconditioned marked-bin count and a full central $L$-function eighth moment remain separate open questions. [Physical transfer on subsets of the marked class](central-values.md)

At the surviving length $N=U^{2/5}$, the same unweighted sieve on the cube column gives sixth-moment exponent $4/3$. On the fourth-power column it gives eighth-moment exponent $5/3$, above the required $653/500$. These follow by substituting column-length exponents $6/5$ and $8/5$ in $\max(1,b,5/6+b/3,1/3+5b/6)$. The available ordinary fourth moment gives count exponent $1-4(0.08516)=0.65936$ at the physical threshold. The missing saving therefore concerns the signed sum in (1). [Exact comparisons](eighth_conductor.py) · [Sixth-order sieve](https://arxiv.org/html/2610.04045v1#S1.SS1).

Prepared with OpenAI Codex assistance.
