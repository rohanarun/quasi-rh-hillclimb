# Counting the rational norm presentation on opposite common primes

Assume the preprint’s $7/8$ theorem and the physical and unmarked inverse inputs of tracker #143. Start with the true uncolored rational-squarefree ninth-power coefficients and the [opposite-place factorization](short-inverse-opposite-primes.md). Write $\gamma=\log_U Ng$, $\kappa=\log_U Nk$, $s=\ell-\gamma-\kappa$ and $\ell\le.8883$. Smooth product cutoffs on $Nk$ and $Ng\,Nk$ are allowed. The original row ball has norm scale $B=U$; on the restored absolute-frequency shell put $B=U^v=V$, $v\ge1-o(1)$, with external scalar $U/V$ and $b=\log_U Nj$. The normalized comparison below includes this scalar. On the original ball take $b=0$. All conclusions permit bounded annular support transitions and arbitrarily small preliminary powers.

The two-bin argument removes the sector with $Nk\ge U^{.08679}$ at price $U^{1.00029+\epsilon}$, or $Nk\ge U^{.08749}$ at unit price. The rational Poisson estimate below improves the two cutoffs to $.06454$ and $.06490$, respectively. A smooth deletion can be chosen to equal one above the displayed threshold and zero below half the threshold. The signed sum on the complementary pairs remains open.

## Two zero bins on one physical row

Put $R(x)=1-10x/(15-6x)$ for $0\le x\le3/4$. A floor bin takes parameter zero, with arbitrarily small losses in exponents. In the physical ball $Nu\ll B$ the original inverse-presentation bin of parameter $\delta$ has at most $B^{R(\delta)+\epsilon}$ rows, after discarding its small primitive cores. The inverse product of the two complete sides then costs $U^{\delta s+\epsilon}$ pointwise. For each retained common cell also form a buffered bin for the finite list of norm presentations $k\mapsto\theta_{ij}(k)J_k(Nu)$ and their conjugates, with the original primary/ray refinements. The fixed $\theta_{ij}$ are the products of the two target twists contributed by opposite orientations. Use the same floor convention and denote its parameter by $e$. Every nonprincipal ordinary smooth polynomial of norm length $K$ in this cell, normalized by $1/K$, costs $U^\epsilon K^{-(1-e)/2+\epsilon}$. This is the ordinary Mellin-line estimate at $\Re z=(1+e)/2+\epsilon$ inside the buffered rectangle. The nonprincipal presentations have no pole. Fourier shifts of the original smooth tests remain in the small external height budget; common shifts from the two orientations cancel on matching ordinary labels. Punctures of polynomial norm have subpower Euler-factor cost. The density count uses the fixed underlying presentations before inserting any such punctures. [Pointwise inverse and ordinary estimates](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4388-L4499)

To count this second bin let $n=Nu=m^6d$, $d$ sixth-power-free as a rational integer. Freeze the part of $d$ at the fixed bad rational primes, with each exponent in $\{0,\ldots,5\}$. Its Kummer factor changes only the fixed ray data. The remaining good integer $d_0\asymp D$ gives a sixth-power-free Eisenstein ideal $(d_0)$ of norm $d_0^2\asymp D^2$. Distinct positive $d_0$ give distinct ideals. The ordinary presentation on $k$ is that of this element, up to a bounded unit/fixed twist and the extra zero mask at the primes of $m$. Thus the nonfloor detector count over all Eisenstein cores at norm scale $D^2$ bounds the number of these rational cores by $O_\epsilon(D^{2R(e)+\epsilon})$. The elementary integer count also gives $O(D)$. Each $d_0$ admits $O((B/D)^{1/6})$ choices for $m$, and each positive norm has $O_\epsilon(B^\epsilon)$ Eisenstein element representatives, by unique factorization or the ideal divisor bound. Since $\min(1,2R(e))\ge4/7>1/6$, the complete nonfloor norm bin has at most $B^{\min(1,2R(e))+\epsilon}$ rows. The floor follows from the ordinary count. The two events on the same row therefore have at most $B^{r+\epsilon}$ representatives with
$$r=\min(R(\delta),2R(e)).$$
The proof allows taking a finite union over the particular character supplying each buffered-bin zero independently. [Unmarked zero count for the fixed-presentation bin](https://arxiv.org/html/2610.17675v2#S6)

For clarity, all small-core cases may be removed together. With threshold $B^{.01}$ in Eisenstein ideal norm, the physical small-core count is $O_\epsilon(B^{1/6+.01(5/6)+\epsilon})$ from sixth-power removal. For the norm presentation, $D^2\ll B^{.01}$ gives $O_\epsilon(B^{1/6+.01(5/12)+\epsilon})$ rows by the preceding count of $m$. This includes any principal norm presentation, since otherwise a good rational prime of nonzero valuation modulo six forces local ramification. On both small sets the normalized ordinary labels are bounded trivially, and the global inverse-line bound on both sides costs $U^{(3/4)s+\epsilon}$. Their combined cost after the external $U/B$ remains below unit price by a fixed power for $v\ge1-o(1)$ and $s\le.8883$. For $Q>B^{.01}$ the original choice of small external height power works for either core after a fixed reduction. On a restored Schwartz ball truncate at $B U^\epsilon$ by an arbitrarily high fixed tail order; the same ball counts apply. For the physical core of norm $Q$ the ball-count factor from sixth powers is $(B/Q)^{1/6}$ and $R(\delta)>1/6$, so summation gives the same physical exponent without an annular lower cutoff.

The ordinary labels from the exact opposite-place convolution have product scale $U^\kappa$. The extracted shift mass remains subpower when the saving $K^{-(1-e)/2}$ is applied: the net divisor exponent on each ordinary variable is $-(1+e)/2$, and on each inverse variable it is $-(1+\delta)/2$. Both permit the same absolutely convergent mixed kernel at $1/2+\epsilon$ on bounded polynomial scales. For the restored $j$-sum write $g=jg_1$, hold $g_1$ fixed and first sum over rows, then over $j\mid(u)$. The factor $1/Nj$ and the divisor bound give the same $U^{-b+\epsilon}$ as in the opposite-place proof. This use of a pointwise bound is uniform in the allocations, masks and tests. Consequently the two-bin excess over $U^{1-b}$ is at most
$$
 \max_{0\le\delta,e\le3/4}
 \{v(r-1)+\delta s-(1-e)\kappa/2\}+o(1).
$$
Its largest possible value occurs at $v=1$, $s=.8883-\kappa$. At a fixed $\delta$ the maximum in $e$ occurs at
$$ e_*(\delta)=\min\{3/4,(75+20\delta)/(130-32\delta)\}. $$
Indeed the objective increases up to $2R(e)=R(\delta)$ and strictly decreases thereafter since $2R'(e)+\kappa/2<0$. The two branches meet at $\delta=45/88$. The excess is thus bounded by the maximum of
$$f(\delta)=\delta(.8883-\kappa)-10\delta/(15-6\delta)-(1-e_*(\delta))\kappa/2.$$
It decreases with $\kappa$ at each $\delta$. At either proposed two-bin cutoff, $f''\le-1/2$ on its smooth branches and its derivative jumps down at the joining point. This follows from $-1800/(15-6\delta)^3$ for the second derivative of the rational saving and $e_*''\le320000/106^3$ on its nonconstant branch. At $c=.24$ the quadratic tangent bound is $f(c)+f'(c)^2$. Exact arithmetic gives values below $.000286646$ and $-.000002951$ at $\kappa=.08679,.08749$, respectively.

## A high moment on rational arguments

For fixed ordinary labels and their combined product scale $K$, write their product, after extracting its $L^1$ normalization, as
$$A(n)=K^{-1}\sum_{NC\asymp K} a_C J_C(n),\qquad |a_C|\ll_\epsilon U^\epsilon.$$
The fixed number of labels, their heights, ray projections, target coefficients and independent punctures are included in $a_C$. The arithmetic norm argument is the **positive rational integer** $n=Nu$. For each fixed positive integer $t$ one has, uniformly on a ball of radius $B$ in norm,
$$
 \sum_{0<Nu\le B}|A(Nu)|^{2t}\ll_\epsilon U^\epsilon(BK^{-t}+K^t).
$$
To prove this, bound the multiplicity of each rational $n$ by $U^\epsilon$ in the positive sum and sum over $1\le n\le B$. After opening, the product of $2t$ column characters is an ordinary Dirichlet character on the rational integers, with primitive modulus times extra coprimality radical dividing the product of their rational norms and hence $\ll K^{2t}$. If nonprincipal its interval sum is $O_\epsilon(U^\epsilon K^t)$ by primitive finite Fourier completion (the nonzero additive coefficients are normalized Gauss sums) and divisor inversion at the excluded primes. The complete coefficient $L^1$ mass after the $K^{-2t}$ normalization is $O_\epsilon(U^\epsilon)$. In a principal tuple the rational norm product is powerful away from the fixed excluded set: a solitary rational prime must split and supplies one primitive sextic factor or its conjugate on $\mathbb F_p^\times$. All fixed excluded primes are absent in the complete polynomials or can be frozen at subpower cost. Powerful integers up to $O(K^{2t})$ number $O_\epsilon(K^{t+\epsilon})$, for example by writing each as $a^2b^3$ with $b$ squarefree. The number of ideal tuples above each such integer is bounded by a fixed divisor power. The principal tuples therefore have total absolute normalized mass $O_\epsilon(U^\epsilon K^{-t})$. This proves the asserted moment. When $j\mid(u)$ the rational norm is a multiple of $Nj$; one can use $B/Nj$ in the first term by writing $n=(Nj)n'$ and incorporating $J_C(Nj)$ in the coefficients.

Let $c_t=1-1/(2t)$. At a given physical bin apply Hölder, the physical count $B^{R(\delta)+\epsilon}$, and this positive moment; no norm bin is required. The inverse factors cost the original $U^{\delta s}$ pointwise. In the unrestricted row ball the resulting worst excess is
$$
 c_t J(s/c_t)-\kappa/2+(\kappa-1/(2t))_+
$$
at $v=1$. For $v\ge1$ the physical-count term $v c_t(R(\delta)-1)$ and the second-moment correction $(\kappa-v/(2t))_+$ both decrease with $v$, so the same bound suffices. In deriving the $J$ expression its global tangent inequality bounds $\delta(s-c_t C(\delta))$ even when $s/c_t>.8883$; no application of a complete inverse-product theorem at that enlarged length is needed. In the independent Euler shifts the savings on ordinary variables cost at most the extracted scalar to exponent $-1/2$ (in the $K^t$ branch they cost less). The inverse-variable shifted exponents are unchanged. A factor-dependent Fourier cutoff can be integrated using the uniform positive moment at fixed frequencies.

On the restored shell one can discard the $j$ gain for this numerical result: bound the positive $2t$ moment for each $j$ using all $u$, and sum $1/Nj$ harmonically; the physical zero-count bound is uniform. More precisely, in the combined weighted sum over $u,j$ the Hölder count factor gains $-b c_t$ by $j\mid(u)$ and divisor counting. On its high-moment factor the $B/Nj$ version above gives weight $-b/(2t)$ in the natural branch. Thus the total refined excess adds $-b+(\kappa-(v-b)/(2t))_+$ instead of the unconditioned correction $(\kappa-v/(2t))_+$. Either version proves the cutoff. The small physical cores are harmless by the previous global estimate even when their ordinary factors are bounded trivially.

At $t=7$ this excess is below $.00029$ at $\kappa=.06929$ and below zero at $.06964$; it remains below the respective bound up to $.075$. At $t=6$ the bound stays below zero from $.075$ through $.101$. Each function is convex on the interval because $J$ and the positive-part correction are convex, so it suffices to check their endpoints. Above $.101$ the ordinary $7/8$ bound in the [opposite-place factorization](short-inverse-opposite-primes.md) suffices. Thus the rational-moment cutoffs also follow independently of the second zero bin. [Exact rational checks](short_inverse.py)

## Rational Poisson and the cubic cross phase

For ideals $C$ prime to the fixed bad set on $NC\asymp L$, let $|c_C|\ll_\epsilon U^\epsilon L^{-1/2}$ with $B,L\ll U^{O(1)}$. On rational integer arguments the zero-extended symbol satisfies
$$
 \sum_{1\le n\le B}\left|\sum_C c_C J_C(n)\right|^2
 \ll_\epsilon U^\epsilon(B+L^{5/3}).                                      \tag{1}
$$
The coefficients may contain arbitrary fixed masks, complex phases and finite ray projections. Conjugating a symbol on rational arguments is equivalent to conjugating its denominator, so products with either orientation have the same divisor envelope. Baier–Young's Theorems 1.4 and 1.5 give a stronger operator bound on squarefree rational arguments. Here the norm $n=Nu$ can have arbitrary rational prime powers. [Baier–Young, Theorems 1.4 and 1.5 and the unrestricted cubic argument in §4.4](https://arxiv.org/pdf/0804.2233)

First suppose $NC$ is a squarefree rational integer. Every prime splits and occurs in exactly one orientation. The restrictions $J_C|_{\mathbb Z}$ are distinct primitive Dirichlet characters of modulus $NC$, since their two local choices at $p$ are conjugate and have order six. Majorize the interval by a fixed nonnegative smooth weight $W(n/B)$ on the full integer lattice and open the square. The principal pairs are equal columns and contribute $O_\epsilon(BU^\epsilon)$. In any other pair write uniquely
$$
 C=g k r,\qquad C'=g\bar k r',
$$
where $g$ records equal places and $k$ records opposite places over common rational primes. The rational supports of $g,k,r,r'$ are pairwise disjoint. On rational arguments the paired character has primitive modulus $Q=Nk\,Nr\,Nr'$. Its local exponent on $k$ is two because $J_{\bar k}(n)=\overline{J_k(n)}$. The extra nonunit mask is precisely at $Ng$. Expand it over rational integer divisors $j\mid Ng$ and put $Y=B/j$. The fixed twist at $j$ separates. Rational Poisson contributes $Y/\sqrt Q$, normalized primitive Gauss factors, and $\widehat W(hY/Q)$ at nonzero integers $h$. The primitive character vanishes on nonunit frequencies. [Dirichlet parametrization, Gauss sums and reciprocity, Gao–Zhao, §§2.1–2.4](https://arxiv.org/pdf/2308.10602#page=3)

In the Gauss multiplication law the only cross factor involving both free indices is
$$
 J_r(Nr')\overline{J_{r'}(Nr)}
  =\varepsilon_{\rm ray}\,J_r(\bar r')^2 .
$$
Indeed $J_r(r')\overline{J_{r'}(r)}$ is fixed by the primary ray classes. Conjugation gives $\overline{J_{r'}(\bar r)}=J_{\bar r'}(r)$, which equals $J_r(\bar r')$ up to a second fixed reciprocity factor. Unit corrections for primary generators are absorbed by the same finite subdivision. All twists from $k,j,h$ and the two individual Gauss factors separate between $r$ and $r'$. Thus the joint phase is a cubic residue symbol with the second ideal conjugated.

Write $G=Ng$, $K_0=Nk$ and $R=L/(G K_0)$. At fixed $g,k,j$ each vector on the residual annulus has squared norm $\ll_\epsilon U^\epsilon/(G K_0)$. Impose disjoint rational supports between $r,r'$ by assigning independently one of two colors to each rational prime. Require each side to use its own color and assign it the weight $2^{\omega(Nr)}$ or $2^{\omega(Nr')}$. Expectation restores the original indicator and each compensator is divisor bounded. Pull $1/R$ from $(Nr\,Nr')^{-1/2}$ on these annuli. A Fourier expansion in their two log norms separates the remaining smooth test. For each fixed $A>2$ its Fourier $L^1$ norm is $\ll_A(1+|h|/H)^{-A}$, $H=K_0R^2/Y$, by mixed log differentiation of the Schwartz transform on compact annuli. Heath–Brown's squarefree cubic large sieve and Cauchy give bilinear norm $\ll_\epsilon U^\epsilon(R+R+(R^2)^{2/3})^{1/2}\ll_\epsilon U^\epsilon R^{2/3}$, with bounded annuli costing a constant. The sum of the Fourier weights over $h\ne0$ is $O(H)$ even for $H<1$. The fixed contribution is therefore bounded, up to $U^\epsilon$, by
$$
 \frac{Y}{\sqrt{K_0}R}\,H\,\frac{R^{2/3}}{G K_0}
 =\frac{L^{5/3}}{G^{8/3}K_0^{13/6}} .
$$
The sums over $g,k$ converge with divisor factors, and there are at most $\tau(G)$ choices for $j$. [Squarefree cubic large sieve, equation (9)](https://arxiv.org/pdf/0804.2233#page=3)

For general $C$, extract its entire ideal part $d$ over the rational primes having $v_p(NC)\ge2$. The residual column has squarefree rational norm, and its coprimality to $Nd$ is an individual mask. The operator multiplying by $J_d(n)$ has norm at most one. Ideals $d$ of any fixed norm have divisor-bounded multiplicity, and their norms are powerful integers. Counting these by $a^2 b^3$ gives $O_\epsilon(L^\epsilon)$ for the sum of $(Nd)^{-1/2}$ up to $O(L)$. Minkowski, extracting $(Nd)^{-1/2}$ from the coefficients and applying the squarefree-column estimate at $L/Nd$, proves (1) with all original zeros.

Apply (1) to $A(n)^t$ at $L=K^t$. The fixed convolution has divisor-bounded coefficients on a bounded number of comparable annuli and exterior scalar $K^{-t/2}$. Counting Eisenstein elements of each norm in the positive sum gives
$$
 \sum_{0<Nu\le B}|A(Nu)|^{2t}
 \ll_\epsilon U^\epsilon\big(BK^{-t}+K^{2t/3}\big).
$$
At fixed $j\mid(u)$ one can again replace $B$ by $B/Nj$ by placing $J_C(Nj)$ in the coefficient. On the restored ball it suffices to discard divisibility inside the high moment and sum the external $1/Nj$ harmonically as above. Hölder now gives worst excess
$$
 c_t J(s/c_t)-\kappa/2+(5\kappa/6-1/(2t))_+
$$
at $v=1$. For $v\ge1$ both $v c_t(R(\delta)-1)$ and $(5\kappa/6-v/(2t))_+$ decrease with $v$. The shift sums converge under the same bounds: a shortening of the ordinary product by a divisor of norm $D$ can increase its normalized Hölder bound by at most $D^{1/2}$, from the $K^{-t}$ term. The $K^{2t/3}$ term decreases on shortening. At $t=9$ the excess is below $.00029$ at $\kappa=.06454$ and below zero at $.06490$. Convexity and the endpoint check at $.08749$ give both bounds through that endpoint. Above it the two-bin estimate applies. [Exact rational checks](short_inverse.py)

Prepared with OpenAI Codex assistance.
