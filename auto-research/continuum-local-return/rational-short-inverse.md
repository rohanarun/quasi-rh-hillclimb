# A short inverse with squarefree rational norm

Assume the preprint's $7/8$ theorem and the physical inputs of tracker #143. Write $X=U^z$, $.09755<z<.0987$, for the [short inverse of the actual physical denominator](short-physical-inverse.md). The target $17466917/20000000$ follows if the squared moment below has price $U^{1.00029+\epsilon}$. Its column index is a **squarefree rational integer supported on split rational primes**. This replaces the ninth power of the short inverse in a sufficient estimate for the physical contribution.

Choose a fixed finite set $B$ of rational primes containing those below the original exceptional primes and every prime with $18p^{-1/2}>1/2$. On a physical row let $\psi$ be the original denominator character, with its zero extensions. For good split $p=\mathfrak p\bar{\mathfrak p}$ put
$$
 A_u(p)=\psi(\mathfrak p)+\psi(\bar{\mathfrak p}),\qquad
 A_u(n)=\prod_{p\mid n}A_u(p)
$$
on squarefree products of these primes. Use $W_t(v)=W(v)v^{-it}$ for the short test, absorbing its fixed real norm power into $W$. For $Y_i\le X$ and $L=\prod_{i=1}^9 Y_i$, put
$$
 D_{\boldsymbol Y,t}(n)=
 \sum_{n_1\cdots n_9=n}\prod_{i=1}^9 W_t(n_i/Y_i),\qquad
 G_u(\boldsymbol Y,t)=L^{-1/2}
 \sum_{\substack{n\ \mathrm{squarefree}\\p\mid n\ \Rightarrow\ p\ \mathrm{split},\ p\notin B}}
       \mu_{\mathbb Z}(n)D_{\boldsymbol Y,t}(n)A_u(n).
$$
The ordered divisors $n_i$ here are positive rational integers. The common height factors out as $(n/L)^{-it}$. It suffices to bound $\sum_u W_{\rm row}(Nu/U)|G_u(\boldsymbol Y,t)|^2$ by $O_\epsilon(U^{1.00029+\epsilon}(1+|t|+H)^J)$ for the smooth all-element majorant of the physical norm shell, also with the single extra multiplier $\log(n/L)$ on the summand. Only the scales
$$
 X^9 U^{-1/100000}<L\le X^9
$$
are needed. In particular each $Y_i>XU^{-1/100000}$. Expansion of $A_u(n)$ counts all prime orientations with their original coefficients. This rational sum retains the nine smooth divisor restrictions. [Source pointwise bounds and height convention](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4385-L4499)

## Removing repeated rational primes

Let $F_u(\boldsymbol Y,t)$ be the product of the nine unrestricted, normalized inverse dyads. At a rational prime $p$ use a distinct formal variable $T_{i,\mathfrak p}$ for every ideal prime $\mathfrak p\mid p$ and coordinate $i$. Its unrestricted factor is
$$
 F_p=\prod_{i,\mathfrak p\mid p}(1-T_{i,\mathfrak p}).
$$
At split $p\notin B$ put $G_p=1-\sum_{i,\mathfrak p\mid p}T_{i,\mathfrak p}$. Put $G_p=1$ at all other primes. These factors allow a rational prime in at most one of the nine ideals, at a single place above it and with exponent one. Grouping the resulting product by its rational norm gives exactly $G_u$ above, including when one of the two places is ramified in the row character.

For every $b>1/2$ the ideal-tuple coefficients $K$ of $\prod_p F_p/G_p$ and $K'$ of its inverse satisfy
$$
 \sum_{\boldsymbol v} (|K(\boldsymbol v)|+|K'(\boldsymbol v)|)V^{-b}<\infty,
 \qquad V=\prod_i N v_i .
$$
Indeed take the local absolute power-series norm with weight $(N\mathfrak p)^{-b}$ per variable. At each good split prime the linear terms cancel. Expanding the denominators bounds the norm of each quotient by $1+O(p^{-2b})$, since the norm of the sum of the 18 variables is at most $1/2$. At an inert prime even a single variable has weight $p^{-2b}$. At the fixed deleted primes the unrestricted polynomial and its reciprocal have finite norm for every $b>0$. This proves convergence with the **same** deleted set $B$ for all $b>1/2$.

Complete multiplicativity gives the coefficient identity
$$
 F_u(\boldsymbol Y,t)=
 \sum_{\boldsymbol v} K(\boldsymbol v)\,\psi(\textstyle\prod_i v_i) V^{-1/2}
        G_u((Y_i/Nv_i)_i,t)
$$
and the reverse identity with $K'$. Each profile is evaluated at exactly the same ratio before and after the rescaling. The original nonunit zeros are included. On the buffered physical rows the individual dyadic bound gives $|F_u(\boldsymbol Y,t)|\ll U^\epsilon L^{\delta/2}$ at every shortened scale. A nonempty annulus below unit scale has its center bounded below by a fixed positive constant. The reverse identity and the kernel norm at $a=(1+\delta)/2$ then give the same bound for $G_u$.

Put $\gamma=10^{-5}$ and apply the forward identity with all $Y_i=X$. At $V\ge U^\gamma$ the pointwise bound and the kernel norm at $b=.51$ give a total $O(U^{9\delta z/2+\epsilon-\gamma(a-.51)})$. On a surviving physical row some allowed height has $|F_u|\ge U^{9\delta z/2-13.5\eta}$, $\eta=10^{-7}$. The tail saves at least $6.75\cdot10^{-7}$ beyond this debit, before freely chosen losses. Thus the part with $V<U^\gamma$ has at least half the displayed lower bound there for sufficiently large $U$.

Take its row $\ell^2$ norm after the height supremum. Minkowski's inequality and $|\psi(\prod_i v_i)|\le1$ put each $G_u$ in a separate row norm at a fixed tuple of scales. For each such tuple the one-dimensional Sobolev inequality bounds the rowwise squared supremum by integrating the fixed-height moments with and without the multiplier $\log(n/L)$. The finite height degree is absorbed by the source's small height choice. The **sum of scalar masses** is $O_\epsilon(U^\epsilon)$, since for every $b'>1/2$ it is at most $U^{\gamma(b'-1/2)}\sum |K(\boldsymbol v)|V^{-b'}$. This avoids paying for the number of shift tuples. Under the proposed squarefree moment the count on this dyad is consequently $\ll U^{1.00029-9\delta z+27\eta+\epsilon}$. The previously proved $R+9\delta z>1.000299625$ leaves more than $\eta$ of saving. Sum the original dyads and apply the [physical return](physical-denominator.md). The small-shift assertion in this argument uses saturation on the buffered rows. [Exact price and projection comparisons](short_inverse.py)

## A positive moment with one orientation and one label per prime

There is a second sufficient bound which makes the paired conductor simpler. Independently at each relevant split rational prime, choose one of its two ideal primes and one of the nine factor labels, uniformly among the 18 choices. Only finitely many primes occur at fixed scales. For each tuple in the ideal expansion of $G_u$, keep it if every prime ideal and its factor label agree with the choices. Multiply its coefficient by $18^{\omega(n)}$, where $n$ is the total rational norm. Call the resulting polynomial $G_{u,c}$ for a choice $c$. Since $n$ is squarefree, the probability of retaining the tuple is exactly $18^{-\omega(n)}$. Thus $G_u=\mathbb E_c G_{u,c}$ and
$$
 |G_u|^2\le\mathbb E_c|G_{u,c}|^2 .
$$
The same argument works with the log-norm multiplier. A bound at price $1.00029$ for the averaged, positive all-element moment suffices. The vectors for a fixed choice have the same inverse-square-root envelope up to $U^\epsilon$. At most one ideal column and one ordered factorization occur at a given rational norm, and the selector is independent of the row.

In the square for each choice, if a rational prime divides both column norms it occurs at the same ideal place and in the same one of the nine slots on both sides. Equivalently the expected square retains exactly such compatible pairs, with the two original coefficients multiplied by $18^{\omega(\gcd(n,n'))}$. For other pairs the retention probability is zero. Thus, writing $g=(C,C')$, one has $Ng=\gcd_{\mathbb Z}(NC,NC')$ and the primitive conductor at the good places is exactly $(C/g)(C'/g)$. Its norm is $NC\,NC'/(Ng)^2$. Every rational prime therein is split, occurs at just one place, and has local order six on rational integers, since reduction of rational integers onto the residue field at that place is surjective. The remaining nonunit mask is exactly the set of places dividing $g$. These statements apply even to primes that divide an evaluated row. The original symbol then keeps its zero value. The section below removes large $Ng$ uniformly in the choice. This argument uses the average of positive squares and does not require an inequality comparing two signed pair terms.

## Removing large common rational divisors from the proposed moment

Expand each rational coefficient back into its prime-ideal orientations. The resulting ideal column $C$ has $NC\asymp L$, squarefree rational norm, and envelope $|\lambda_C|\ll U^\epsilon (NC)^{-1/2}$. In this all-element squared norm the signed contribution with $\gcd_{\mathbb Z}(NC,NC')\ge U^{.3875}$ is $O_\epsilon(U^{1.00027+\epsilon})$.

For an integer $d\ge U^{.3875}$ the restriction $d\mid NC$ is empty unless $d$ is squarefree and split-supported. Otherwise partition it according to the oriented ideal $v\mid C$ of norm $d$. There are $2^{\omega(d)}$ possible $v$. In the square norm for one orientation discard the common row multiplier $\chi_v(u)$ by its modulus bound. The residual vector is supported at norms $\ll U^{.8883}/d\le U^{.5008}$ and has squared norm $\ll U^\epsilon/d$. The arbitrary-vector sextic sieve on sixth-power-free indices applies to each sixth-power-free part of the row. Write $(u)=j^6 u_0$ and retain the coprimality mask at $j$ in the vector. On a dyad $Nj\asymp U^\nu$ the exponent including the $j$ count is bounded by
$$
 \nu+\max(1-6\nu,B_1,5(1-6\nu)/6+B_1/3,(1-6\nu)/3+5B_1/6),\qquad B_1=.5008 .
$$
It is convex on $[0,1/6]$ and both endpoint values are strictly below $1.00027$. Fixed bad-prime parts of $u_0$ have bounded valuations, and units and ray classes have bounded multiplicity. The constant-sized annular endpoints and the number of dyads fit within $U^\epsilon$. Minkowski over orientations yields squared cost $\ll U^{1.00027+\epsilon}/d$ for the rational projection. Möbius inversion of the large-gcd indicator on positive rational integers gives a linear combination of these squared norms, with coefficients of magnitude at most $\tau(d)$ and support $d\ge U^{.3875}$. Harmonic summation proves the estimate. The same reasoning applies to the total log-norm multiplier. [Sixth-order character sieve, Theorem 1.1](https://arxiv.org/html/2610.04045v1#S1.SS1)

For every remaining pair, each rational prime dividing exactly one of $NC,NC'$ supplies one good split place of local order six. The product of these rational primes is $NC\,NC'/\gcd(NC,NC')^2\gg L^2 U^{-.775}>U^{.9808}$ eventually, since $\log_U L>9(.09755)-.00001$. Each prime is at most a fixed multiple of $U^z$, because it occurs in an individual short factor. On the remaining pairs, the [dual frequency estimates](short-inverse-frequencies.md) also remove all dual norms up to $U^{5/23}$, the sixth-power-free dual norms up to $U^{.33448}$, and all powerful dual ideals. The [full short-product theorem](short-product-moments.md) lowers the rational gcd cutoff to $U^{.2797}$ for both positive moments. For the original uncolored coefficients the [density estimate](short-inverse-density.md) lowers it further to $U^{.2040}$ and handles all frequencies through $U^{.24069}$ and all sixth-power-free frequencies through $U^{.33783}$. The signed sum outside the proved ranges remains open. [Pairwise character estimate at these short scales](short-inverse-pairs.md)

Prepared with OpenAI Codex assistance.
