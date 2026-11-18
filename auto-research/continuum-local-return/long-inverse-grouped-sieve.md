# A conductor sieve for grouped factors of the first Poisson frequency

Assume the preprint's $7/8$ theorem and its completed cubic reflection estimate. In the [balanced long-inverse Gram](long-inverse-frequency-sectors.md), put $s=8\cdot10^{-7}$ and $r\ge1$ in the same fixed bounded range. On $Ng\le U^{s+o(1)}$, the nonzero bare first Poisson frequencies satisfying
$$
 NE(h)\le U^{.199995r},\qquad E(h)=\prod_{v_p((h))=1}p ,
$$
contribute $O_\epsilon(HU^\epsilon)$ to the raw Gram and, separately, to the rescaled comparison Gram. The same bound holds for their signed difference. More generally, the proof covers
$$
 5\xi-12\nu\le r-28s, \qquad \xi=\log_U NE(h),                 \tag{1}
$$
where $\nu$ is the sixth-power factor defined below. All these statements concern the original smooth Möbius polynomial with its prescribed profiles, fixed puncture and zero extensions. The cut is on the bare frequency before residual coprimality inversion. The estimate holds on an arbitrary subset of this sector selected independently of the columns. It can therefore be combined with the [large sixth-power sector](long-inverse-frequency-sectors.md#a-large-sixth-power-divisor-and-a-hybrid-range) by assigning their overlap once. Generic squarefree frequencies near the top dual dyad remain outside the estimate.

## Removing a sixth power before reflection

Use the unique decomposition $(h)=e a^2 b^3 v^6$ with $e=E(h)$. Away from $e$, place in the squarefree $b$ each prime of odd valuation at least three, take the square root after dividing by $b^3$, and split that root as a cubefree $a$ times $v^3$. Write $\alpha=\log_U Na$, $\beta=\log_U Nb$, $\nu=\log_U Nv$ and $M=\log_U N(h)$ on the bare dyad. Then
$$
 \xi+2\alpha+3\beta+6\nu=M,\qquad M\le r+s+O(\epsilon).
$$
At a prime away from $e$ the residual valuation of $a^2b^3$ is in $\{0,2,3,4,5,7\}$. With $h_*$ a generator of $e a^2 b^3$, its product of primes of exact valuation one is still $e$. In particular its powerful part, including each full local power at an exponent at least two, has log norm $M-6\nu-\xi$. This convention can leave a valuation seven in $h_*$. It fixes which $v$ is used in (1).

Work in fixed norm dyads and the finitely many unit and bad-prime sectors. At each fixed $v$ the identity $J_n(h)=J_n(h_*)1_{(n,v)=1}$ holds with the unit of $h_*$ chosen consistently. Add $\operatorname{rad}(v)$ to the existing fixed puncture **before** applying cube completion. Its expansion over squarefree divisors $l$ carries normalized Hilbert multipliers $(Nl)^{-1/2}$ of total mass $U^{o(1)}$, uniformly in $v$. The fixed phases and masks from $j,m,l$ stay in the exact polynomial; an extracted row scalar has modulus at most one inside the positive square. The squared row sums at fixed $v$ are then added over $O(U^{\nu+O(\epsilon)})$ possible ideals $v$. A dyadic upper endpoint in any length changes exponents by $O(1/\log U)$. [Exact child and puncture expansion](long-inverse-frequency-sectors.md#exact-child-polynomial) · [Freezing a sixth-power factor in the actual row mask](long-inverse-frequency-sectors.md#a-large-sixth-power-divisor-and-a-hybrid-range)

Use the notation of that reduction. The required one-sided squared price at fixed $g,j,m,l$ and completion variables, after allowing for the distinct $v$ in the dyad, is at most $U^{r-s+O(\epsilon)}\le JR\,U^{O(\epsilon)}$. Here $R=A/Ng$, $J=Nj$, $G_0=\log_U Ng$, $j_0=\log_U J$, $d=\log_U(Nm\,Nl)$ and $0\le j_0\le G_0\le s+o(1)$. Put $c_0=\log_U Nc$ for the first completion divisor and $w=d+3c_0$. Split at
$$
 w_*=(r-\xi)/4+4\nu-4s .
$$
This split depends on frozen sizes only. Freeze $\xi,\nu$ together with the bare frequency dyad when applying the price.

For $w\le w_*$ use the completed reflection bound at $k=jh_*$, with fixed label $jml$ and residual puncture $g/j$. At fixed $v,j$ the original frequency determines $k$ injectively. The powerful exponent of $k$ is at least $M-6\nu-\xi$, since multiplication by the integral ideal $j$ preserves each such power. The two branches of the completed bound, including the count of $v$, are at most
$$
 \frac{M+\xi}{2}+j_0-2\nu,\qquad
 \frac{3M+\xi}{2}+3j_0+Q+G_0-r-8\nu+2d+3c_0,                 \tag{2}
$$
up to $O(\epsilon)$, where $Q\le G_0$ is the log norm of the puncture radical. Indeed $M_k=M-6\nu+j_0$ in the two branches $M_k-O/2$ and $2M_k-O/2+Q+(j_0+d)-(r-G_0-d-3c_0)$, and the count adds $\nu$. From (1) the first term of (2) is at most $.6r+1.5s$ after dropping negative terms. The second is at most $r/2+\xi/2+6.5s-8\nu+2w\le r-1.5s$. This applies directly to the signed completed coefficient with the source's archimedean seminorms and all its local branches. [Completed width and powerful-part bound](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7985-L8059)

## The sieve after reopening the completed column

For $w\ge w_*$, reopen the coefficient and fix the second cube divisor. At every nonempty scale the centrally normalized squarefree column has log length
$$
 \lambda\le \Lambda+O(\epsilon),\qquad \Lambda=3r/4+\xi/4-4\nu+4s .
$$
Indeed its length is at most $r-w$ before harmless endpoint errors. One also has $\Lambda>0$ since $6\nu\le r+s-\xi+O(\epsilon)$. The squared norm of its coefficient is $O_\epsilon(U^\epsilon)$. The fixed $j,m,l$, the cube factors, their contractions and the finite separated rays are treated as in the [coefficient expansion](long-inverse-frequency-sectors.md#cube-completion-at-the-true-column). In particular the smooth Fourier measures and the harmonic Hilbert multipliers can be used uniformly before summing $v$.

Fix $e,v$ and sum jointly over $a,b$. Reciprocity on each fixed good ray identifies the varying column character, up to an independent fixed twist and unit phase, with $n\mapsto(n/(a^2b^3))_6$ or its conjugate. At a good $p$ its local exponent is $2i+3j\bmod6$ for $0\le i\le2$, $0\le j\le1$. The six choices give six distinct residues. The only trivial choice is $i=j=0$. The primitive good conductor is therefore exactly $\operatorname{rad}(ab)$, and its zero extension already imposes both moving nonunit masks, including primes shared by $a,b$. At fixed orientation the local character determines $(i,j)$ since the prime residue character has order six. Thus grouping by the actual primitive character has bounded multiplicity after the fixed unit, ray and bad-prime subdivisions. The $e$ factor and the $v$-puncture are fixed column coefficients. Restricting the positive norm to the originally permitted intersections only reduces the sieve majorant. [Zero-preserving reciprocity and the conductor calculation](power-components.md) · [Sextic reciprocity and unit conventions](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4781-L4834)

At conductor norm $\ll U^{\alpha+\beta}$ the primitive character large sieve costs $O_\epsilon(U^\epsilon(U^{2\alpha+2\beta}+U^\lambda))$ times the squared column norm. Summing the counts of $e,v$ gives the exponent
$$
 \max\{\xi+\nu+2\alpha+2\beta,\ \xi+\nu+\lambda\}.
$$
The first term is at most $r+s-\beta-5\nu+O(\epsilon)$. By (1) the second is at most $3r/4+5\xi/4-3\nu+4s\le r-3s+O(\epsilon)$. Hence if $\beta+5\nu\ge2s$, both meet the price $r-s+O(\epsilon)$. [Primitive character conductor sieve, Lemma 2.2](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/An-unconditional-first-moment-for-cubic-Gauss-sums-September-25-2026/build/sections/background-type1.tex#L175-L232)

If $\beta+5\nu<2s$, freeze $b$ as well and use the cubefree cubic sieve over $a$ against the same squarefree column. Its three exponents, including all three frozen counts, are
$$
 \xi+\nu+\beta+\alpha,\qquad
 \xi+\nu+\beta+\lambda,\qquad
 \xi+\nu+\beta+\tfrac23(\alpha+\lambda).
$$
The first is at most $(M+\xi)/2$. Here (1) and $\nu<2s/5$ give $\xi\le r/5$, so it is at most $.6r+s/2+O(\epsilon)$. The second is at most $r-3s+\beta+O(\epsilon)\le r-s+O(\epsilon)$. For the third use $2\alpha=M-\xi-3\beta-6\nu$ to obtain the upper bound
$$
 5r/6+5\xi/6-11\nu/3+3s+O(\epsilon)
 \le r-5s/3+O(\epsilon),
$$
where the last inequality is (1). [Cubefree cubic sieve, Theorem 1.1 and Example 2.2](https://arxiv.org/html/2610.04045v1#S2.SS4)

Both post-completion cube divisors have their original harmonic Hilbert multipliers. For fixed $v$, first apply triangle in the row Hilbert norm to the uniform divisor expansions and then square. The costs $U^\nu$ and, in the reopened branch, $U^\xi$ and possibly $U^\beta$ are counts in **squared** energy. The reference calculation (2) instead pays only $U^\nu$. The bounds are uniform in the puncture divisor and include these counts once, so the fixed $g,j,m$ energy is within $JR\,U^{O(\epsilon)}$. Its exterior normalization gives $H/(Ng\,Nm)$, whose remaining sums are harmonic, including the choices $j\mid g$. This proves the claim for each smooth Gram and for the signed difference. The uniform numerical cutoff follows from $1-5(.199995)=.000025>28(8\cdot10^{-7})$ and $r\ge1$.

At zero source loss the simple conductor-and-cubic comparison reaches the boundary $\xi=r/5$. For example at $\xi=r/5,\ \alpha=2r/5,\ \beta=\nu=0$, on the common cutoff $w=r/5$ the column length can approach $4r/5$. Both the grouped conductor price and the cubic price are then $r$. This identifies equality in these estimates at those normalized sizes.

Prepared with OpenAI Codex assistance.
