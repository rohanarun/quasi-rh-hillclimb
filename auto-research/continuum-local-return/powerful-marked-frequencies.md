# Small dual frequencies and the product of primes of valuation one

Assume the preprint's 7/8 theorem, the physical inputs of tracker #143 and the Hecke and cubic large sieves cited below. For a nonzero dual element $h$ let $E(h)=\prod_{v_p((h))=1}p$. In the complete marked-column Poisson expansion, the union of $NE(h)\le U^{.0748}$ and $Nh\le U^{.46252}$ contributes $O_\epsilon(U^{1-10^{-6}+\epsilon})$, up to the inherited physical height factor. This includes every powerful dual ideal, even when it contains a large sixth-power factor. The bound permits further restrictions on the frequencies after the columns have been summed. The complementary signed estimate remains open. [Dual sum, physical weights and frequency cutoff](dual-marked-frequencies.md)

Use $N\mathfrak a$ for ideal norms and write $L=U^\ell$ for the scale of either complete column. The preceding reduction gives $Nh\le U^{H}$ with $H=.850146$, up to a negligible tail. The two ordinary widths are both $n$ and the selected physical prime width is $w$, so $\ell=2n+w$. Its bounds give $\ell>.92505870$ and $w>.0747$ (use $n<.42506657$). The maximal slot width is $\mu<10^{-9}$. [Scale and filled quota](dual-marked-frequencies.md#the-reflected-scale)

## Factoring the frequency and the columns

Write uniquely
$$
 (h)=E A^2 J^3 V^6,
$$
with $E=E(h)$, $A$ cubefree, $J$ squarefree, and $(E,AJV)=1$. In $(h)/E$ put one factor of $p$ into $J$ at each odd valuation, which is at least three. The remaining ideal is a square. Split its square root into a cubefree factor $A$ and a cube $V^3$. The ideals $A,J,V$ may share primes. For a fixed prime away from $E$, the six possible values of $2v_p(A)+3v_p(J)$ are $0,2,3,4,5,7$, distinct modulo six. The factor $V$ in this convention can differ from the largest sixth-power divisor root of $(h)$. Write $\xi,\alpha,\beta,\nu$ for the base-$U$ logarithms of the respective dyadic norms of $E,A,J,V$. Bounded dyadic endpoint factors can be absorbed in $U^\epsilon$. On each nonempty box,
$$
 \xi,\alpha,\beta,\nu\ge0, \qquad \xi+2\alpha+3\beta+6\nu\le H+o(1).
$$

Freeze the same data as in the dual sum. On side $i$, let $D_i$ be its fixed column factor and let $t$ be the Möbius divisor inserted between the two residual squarefree columns. Allocate the prime powers of $D_i t$ among the original labels as there. The extracted scalar is $O_\epsilon(U^\epsilon/(ND_i Nt)^{1/2})$. Divide the remaining labels into two groups, of squarefree products $x,z$. If their original widths are $p_0$ and $\ell-p_0$, then $Nx\ll U^{p_0}$ and $Nz\ll U^{\ell-p_0}$. Extracting an assigned divisor shortens its group, including when an entire prime label has been fixed. On their actual norm annuli both grouped coefficient vectors have squared norm $O_\epsilon(U^\epsilon)$ after the extracted scalar. This follows from inverse square-root normalization, the fixed number of labels and ideal counting. These facts allow the group split to depend on the frequency box. [Exact allocations and cubic Gauss factor](dual-marked-frequencies.md#uniformly-summing-the-two-columns-at-small-dual-norms)

Put $J_m(y)=(y/m)_6$, zero on nonunits. On the positive Gauss orientation, CRT inside the column gives the cubic factor $J_z(x)^2$ up to fixed ray phases. The frequency contributes $\overline{J_x(h)J_z(h)}$. The negative Gauss orientation is handled by conjugation with its fixed unit phases. Subdivide into the fixed primary ray classes and fix the six unit choices for $h$. The parts of $E,A,J$ supported on the fixed excluded set have bounded exponents, so they give finitely many further twists. Fix $V$ before applying a sieve. Its sixth power retains the masks $(V,xz)=1$. Fixed phases on each group, including the Gauss sums of $x,z$ and the separated norm heights, are bounded individual coefficients. A Fourier coefficient depending on $h$ is bounded by the common integrable majorant from the dual sum before Cauchy–Schwarz in $h$. Thus both group profiles are fixed across each row average. [Separated Fourier weight and frozen phases](dual-marked-frequencies.md#uniformly-summing-the-two-columns-at-small-dual-norms)

For either argument below, suppose the squared sum on one side, after the stipulated frequency average and before application of the extracted scalar, costs $U^{M+\epsilon}$. Use Cauchy–Schwarz in $h$ on the two-sided expression. The two extracted scalars combine with the Poisson factor $Y\sqrt{ND_1ND_2}/(L\sqrt{Nd_F})$ to give at most $U^{1-\ell+\epsilon}/Nt$, since $Y\ll U$. The $t$ sum is harmonic. The frozen square roots and common divisor cost at most $U^{f+\epsilon}$, where $f=2\gamma+\kappa=.00000404$. The other frozen divisors have divisor-bounded multiplicity. The normalized auxiliary prime averages, dyadic boxes, ray classes and Fourier integrals fit in $U^\epsilon$. It suffices to show $M+f<\ell-10^{-6}$ with a fixed positive margin.

## Small sixth-power factor

Let $\nu\le .0743$ and set $\delta=.0000055$. Choose a group of original prime slots alone with width $p_0$ between $\nu+\delta$ and $\nu+\delta+\mu$. A prefix first reaching the requested width exists since $w>.0747$. Put both ordinary factors and the other primes in the $z$ group.

At fixed $V$, dualize the squared norm over $(E,A,J)$ by pairing with an arbitrary vector of squared norm one. Combine that vector with the $x$ coefficient and the bounded factor $\overline{J_x(h)}$. Terms meeting $(x,EAJ)>1$ vanish. On $z$, the remaining character is the product with numerator $x^2$ and the conjugate numerator $EA^2J^3$. On the good primary ray classes reciprocity makes this a residue character of $z$ with primitive modulus $\operatorname{rad}(x E A J)$, up to a fixed factor at the excluded primes. Indeed every prime of $x$ has signed exponent $2$, each prime of $E$ has exponent $-1$, and the other signed exponents are the negatives of $2,3,4,5,7$. All are nonzero modulo six. The character therefore has precisely the required good nonunit zeros. This includes the zero of the original cubic factor when $(x,z)>1$.

For a given primitive character, its good local exponents determine the tuple with divisor-bounded multiplicity. At each prime choose whether it belongs to $x$, to $E$, or to $AJ$. In the last case the residue determines the two valuations uniquely from the six possibilities above. Thus the multiplicity is at most $3^{\omega(\mathfrak q)}$ up to the fixed ray choices for modulus $\mathfrak q$. Cauchy within each such fibre gives a combined character vector of squared norm $O_\epsilon(U^\epsilon)$, since the squared masses of the dual vector and the $x$ vector multiply. Write $\rho=\log_U N\operatorname{rad}(EAJ)$. Within the dyadic box, take an upper bound uniform in the frequencies for $\rho$. The modulus norm is $\ll U^{p_0+\rho}$, and $\rho\le\xi+\alpha+\beta+o(1)$. Apply the ordinary primitive-character large sieve, or its transpose, against the $z$ vector. The squared cost after summing the $O(U^\nu)$ possible $V$ has exponent at most
$$
 M=\nu+\max\{\ell-p_0,\,2(p_0+\rho)\}.
$$
The first term plus $f$ is at most $\ell-\delta+f=\ell-.00000146$. For $NE\le U^{.0748}$, use the frequency budget to bound the second term plus $f$ by
$$
 H+\xi-\beta-3\nu+2(\delta+\mu)+f+o(1)
 \le .924961042+o(1)<\ell-10^{-6}.
$$
For $Nh\le U^T$, with $T=.46252$ and unrestricted $E$, the divisibility $\operatorname{rad}(EAJ)\mid (h)/V^6$ gives $\rho\le T-6\nu+o(1)$. This remains true when the latter quotient contains a prime to the seventh power. In this range the second term plus $f$ is at most
$$
 2T+2(\delta+\mu)-9\nu+f+o(1)
 \le .925055042+o(1)<\ell-10^{-6}.
$$
Both conductor estimates apply to further restrictions on the triples by restricting the dual vector. [Primitive character sieve over the Eisenstein lattice](power-components.md#the-product-of-the-primes-of-valuation-one) · [Hecke character large sieve, Lemma 2.2](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/An-unconditional-first-moment-for-cubic-Gauss-sums-September-25-2026/build/sections/background-type1.tex#L175-L232)

## Large sixth-power factor

Let $\nu>.0743$. For $Nh\le U^{.46252}$ the number of eligible frequencies in this range is $O_\epsilon(U^{.46252-5(.0743)+\epsilon})$. Indeed for each $V$ there are $O(U^{.46252}/(NV)^6)$ possible remaining ideals, including the six unit choices at constant cost. Summing $(NV)^{-6}$ over $NV\gg U^{.0743}$ gives the exponent above. This count is at most $U^{.09102+\epsilon}$. The individual cubic bound in the dual note therefore gives $O_\epsilon(U^{1-\ell/3+.09102+f+\epsilon})$, below the claimed price. [Individual-frequency bound with physical columns](dual-marked-frequencies.md#uniformly-summing-the-two-columns-at-small-dual-norms)

It remains to treat $NE\le U^{.0748}$ with $\nu>.0743$. Put one ordinary slot in each group and split the original prime slots within $\mu$ of half their total width. Both $x$ and $z$ then have upper norm exponent at most $p=\ell/2+\mu$, including after divisor allocation. Freeze $E,J,V$, retaining all their twists and masks, and dualize over $A$. In the $z$ variable the cubic part is
$$
 J_z(x)^2\overline{J_z(A)^2}=(x A^2/z)_3
$$
with its natural zero extension. The factors depending jointly on $A,x$, in particular $\overline{J_x(A)^2}$, have modulus at most one. Pairing the dual vector on $A$ with the $x$ coefficients costs squared norm $O_\epsilon(U^\epsilon)$. Cauchy–Schwarz over $(x,A)$ reduces the remaining squared estimate to de Faveri's conductor-aspect cubic sieve for $\sum_{z\ {\rm squarefree}} b_z (x A^2/z)_3$. Its two outer ideals may be unrestricted. Hence one may enlarge the positive row norm to the stated sieve domain, retaining the common $z$ profile. The use of good primary symbols agrees with the Kummer character convention on fixed ray classes. [De Faveri, Proposition 8.1](https://arxiv.org/html/2610.04045v1#S8)

The three terms in that proposition for row lengths $X_1,X_2$ and column length $Q$ are $X_1X_2$, $\min(X_1,X_2)^{2/3}\max(X_1,X_2)^{1/3}Q$, and $\min(X_1,X_2)^{1/3}\max(X_1,X_2)^{2/3}Q^{2/3}$. They increase in each length, so one may use upper exponents $\alpha,p,p$ for $A,x,z$, even when an allocated divisor greatly shortens one group. Here $\alpha\le H/2+o(1)<p$. Including the $E,J,V$ choices, the respective upper exponents are
$$
 \begin{split}
  &p+(H+\xi)/2-2\nu,\\
  &4p/3+H/3+2\xi/3-\nu,\\
  &4p/3+H/3+2\xi/3-\nu ,
 \end{split}
$$
up to $o(1)$. For the last bound use $\beta+\alpha/3\le(2\alpha+3\beta)/3$. For $\xi\le .0748+o(1)$, $\nu>.0743$ and $\ell>.92505870$, the first expression is below $\ell-.14$ and both remaining ones are below $\ell-.049$. These margins absorb $f$ and the stipulated losses. For the union of the two frequency ranges, apply the bounds to disjoint subsets. The open signed sum can still receive frequencies for which both the norm and the valuation-one product exceed the respective cutoffs. [Exact exponent checks](column_divisors.py)

Prepared with OpenAI Codex assistance.
