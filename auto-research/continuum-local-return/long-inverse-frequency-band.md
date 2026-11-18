# A Fourier interval for the long inverse at the continuum contact

Assume the preprint's $7/8$ theorem, its raw unmarked inverse moment, and the cited inputs to tracker #143. Let $U=Z^D$ and $A=U^r$ be the actual long inverse dyad in the [local count](crossing.md). Put
$$
 s=8\cdot10^{-7},\qquad e=6\cdot10^{-8},\qquad H=A/U^s,
 \qquad L=HU^e,\qquad H_1=A/U^e,
 \qquad T=H_1/H=A/L=U^{7.4\cdot10^{-7}}.
$$
The letter $s$ here measures the shortening of the row scale. The shift of the detector cutoff in the local count is $10^{-6}$. The critical lengths have $1.1279<r<1.1291$ and squared inverse amplitude at least $U^{\delta r-o(1)}$ in the sense of arbitrarily small detector losses. It suffices to prove the **one-sided** bound (3) below on a single genuine smooth Möbius column at length $A$. Its remaining pairs have ideal gcd norm $<T$. For each pair and divisor in the Poisson mask the ratio of the upper and lower frequency cutoffs is $O(T)$. Both cutoffs depend on the actual pair. The constants in $O(T)$ are independent of all scales. This gives a direct analytic condition for $t=17466917/20000000$. The estimate on the whole interval remains open. [Conditional endpoint](lean/TargetReturn.lean) · [Exact scalar replay](long_inverse_band.py)

## The row moment required at the shortened scale

Write $q_n=Nn$ for ideal norms and $q_v=|v|^2$ for elements. Use the good primary ideals of the source, a fixed admissible finite character $\nu$, and one sextic orientation. Denote the zero-extended symbol by $J_n(v)$ and write $\psi_v(n)=\nu(n)J_n(v)$, with conjugation of the symbol for the reverse orientation. The column is
$$
 M_v(A;W)=A^{-1/2}\sum_n\mu(n)\psi_v(n) W(q_n/A).
$$
The detector uses a fixed finite list of smooth annular profiles, bounded real powers and a small height parameter. Fixed Euler omissions can be included in the good support. All estimates carry the fixed finite seminorms and polynomial height dependence of the raw moment, also for the differentiated tests specified below. For a row ball of scale $K$ and column scales $B$ polynomial in $U$, the source gives
$$
 \sum_{0<q_v\le CK}\sup_{B'\le B}|M_v(B';W)|^2
 \ll_\epsilon U^\epsilon\max(K,B,1).                       \tag{1}
$$
Indeed enlarge the row ball to $\max(CK,B^{1+c},2)$ and choose $c>0$ sufficiently small after the desired loss. This holds with a puncture of polynomial norm by the inverse Euler correction described below. A radial Schwartz weight at scale $K$ is allowed as an absolute majorant by summing over $q_v/K$ in dyadic shells, using the original estimate with its dependence on the row radius. [Preprint, raw moment, scale supremum and height costs](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12343-L12476)

Suppose the full-length column at $H$ has all-element moment $\ll HU^{e+\epsilon}$ on $q_v\le CH$, with $C$ any fixed ball constant needed for the physical shell. Set $P=(H/U)^{1/6}$. There are $\gg P/\log P$ good prime ideals $p$ with $P/2\le q_p\le P$, by the prime ideal theorem for the fixed field. They may be chosen outside any fixed polynomial-norm puncture, which removes at most $O(\log U)$ primes. The exact sixth-power splitting at such a prime reads
$$
 M_u(A)=M_{up^6}(A)-\psi_u(p)q_p^{-1/2}M_{up^6}(A/q_p).
$$
Choose the primary generator of $p$ in the row map. For sixth-power-free $(u)$ the map $(u,p)\mapsto up^6$ is injective by valuations modulo six and the generator convention, including when $p\mid u$. Since $\log_U P=(r-s-1)/6>.021$, one has $A/q_p\ll H$. Apply (1) including the scale supremum to the second term after averaging. The first term uses the proposed moment at the original $A$. Up to $U^\epsilon$ this gives
$$
 \sum_{q_u\asymp U}^{(6)}|M_u(A)|^2
 \ll U^\epsilon\left(\frac{HU^e}{P}+\frac{H}{P^2}\right)
 \ll U^{(1+5r)/6-5s/6+e+\epsilon}.                         \tag{2}
$$
Fixed-test moments suffice for row-dependent real powers and heights. Apply Sobolev in these parameters before selecting the value in each row, and use the moments for the derivatives with factors $\log(q_n/A)$ on the compact annulus. A bounded variation of a dyad center can be handled in the same way in $\log A$ with profile $-W/2-yW'$. Fixed height powers fit the source's subsequent small choice of the height exponent. Dividing (2) by the detector's squared lower bound gives the requested count $U^{1/6+(5/6-\delta)r-G+\epsilon}$ with $G=6\cdot10^{-7}$, since $5s/6-e-G=1/150000000>0$. The count applies to the selected fibres by positivity. The [shifted-cutoff calculation](crossing.md) and the [local return](lean/TargetReturn.lean) give the claimed implication. This argument uses only the native estimate at shorter scales in the lifting identity.

## Subtracting the known part before Poisson estimation

Choose a real nonnegative radial Schwartz majorant $\Phi(q_v/H)\ge1$ on the required ball whose planar Fourier transform has compact support. To construct its unscaled profile take the inverse transform of a radial smooth compactly supported bump with nonzero integral, dilate until its modulus is bounded below on that ball, and take a constant times its squared modulus. Write $\widehat\Phi(w)$ for its radial Fourier profile in squared-radius coordinates. Take a real smooth radial cutoff $\chi(w)$ equal to one near zero and zero for large $w$. Define the reference profile $G_1$ by
$$
 \widehat G_1(w)=\chi(w)\widehat\Phi((H/H_1)w).
$$
The inverse transforms are uniformly Schwartz for $0<H/H_1\le1$, since these transforms have a common compact support and uniform derivative bounds in the plane. The signed physical weight $G_1(q_v/H_1)$ is bounded in absolute value by common rapidly decreasing radial majorants. Hence the complete reference moment, multiplied by $H/H_1$, costs $O_\epsilon((H/H_1)A U^\epsilon)=O_\epsilon(HU^{e+\epsilon})$ by (1).

First expand the two physical moments. Write $\lambda_n=A^{-1/2}\mu(n)\nu(n)W(q_n/A)$. At a pair $n=ga,n'=gb$ let $g=(n,n')$, $(a,b)=1$, and $d=q_{ab}$. Since both columns are ideal-squarefree, $a,b,g$ have disjoint ideal support. Write $\psi=J_a\overline{J_b}$ in the row variable, with the corresponding common conjugation for the other orientation. On unequal columns it is primitive of modulus $ab$, with the extra zero mask exactly at $g$. For $j\mid g$ put $J=q_j$. The normalized primitive Gauss sum is $\gamma(\psi;ab)$. Fix the same trace-dual and primary conventions on both kernels. After removal of the large-gcd terms as below, the required upper estimate is
$$
 \operatorname{Re}\sum_{\substack{n,n'\,;\;q_{(n,n')}<T}}\lambda_n\bar\lambda_{n'}
 \frac{H\gamma(\psi;ab)}{\sqrt d}
 \sum_{j\mid g}\frac{\mu(j)\psi(j)}{J}
 \sum_{h\ne0}\bar\psi(h)
 \big[1-\chi(H_1 q_h/(Jd))\big],\widehat\Phi(H q_h/(Jd))
 \ \ll_\epsilon HU^{e+\epsilon}.                              \tag{3}
$$
This is an upper bound on the aggregate real part with the displayed arithmetic coefficients and signs. It is required for the actual tests just described. In the reference term the Poisson prefactor is $(H/H_1)H_1=H$, so the subtraction cancels the low frequencies identically at every $j,d$. The nonzero multiplier implies
$$
       cJd/H_1\ \le q_h\le C Jd/H.
$$
The surviving conductors have $d\asymp (A/q_g)^2\gg L^2$. Thus globally $q_h\gg A^2/(T^2H_1)$ and $q_h\ll A^2/H$, using $1\le J\le q_g$. For large $U$ all principal pairs $n=n'$ satisfy $q_g\asymp A>T$. The physical row $v=0$ makes no contribution because every original column on these annuli contains a prime and its symbol vanishes there. The same statements hold for either admissible common orientation. [Masked primitive Poisson and Fourier normalization](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9722-L9776)

The two radial kernels also permit summation over the six units. For the sextic generator $\zeta_6$ this kills every pair with $J_n(\zeta_6)\ne J_{n'}(\zeta_6)$. At each good prime $p$, $J_p(\zeta_6)=\zeta_6^{(q_p-1)/6}$. All $q_p$ are $1\bmod 6$, so multiplication of their norms adds the exponents modulo six. Consequently (3) may also require $q_n\equiv q_{n'}\pmod {36}$. The frequency annulus and its valuation restrictions are invariant under these unit rotations.

## Removing large ideal gcds

Perform this step on the two physical moments separately before restricting the dual frequencies. On ideals define $f_T(l)=1_{q_l\ge T}$ and let $b_T=\mu*f_T$. Summing $b_T(l)$ over $l\mid n,n'$ gives $1_{q_g\ge T}$ exactly. We have $|b_T(l)|\le\tau(l)$ and $b_T(l)=0$ for $q_l<T$. For a squarefree $l$, requiring $l\mid n$ turns the polynomial into
$$
 \frac{\mu(l)\psi_v(l)}{\sqrt{q_l}}M_v^{(l)}(A/q_l;W),
$$
where the superscript omits primes dividing $l$ in the residual column, in addition to its fixed exclusions. At the level of each row the punctured inverse expands into unpunctured inverses at scales further divided by $q_b$, with $b$ supported on $l$ and multipliers of modulus at most $q_b^{-1/2}$. Their total mass is at most $\prod_{p\mid l}(1-q_p^{-1/2})^{-1}\ll_\epsilon(2q_l)^\epsilon$, uniformly on these polynomial scales. Thus (1) bounds the projected square at $H$ by $O_\epsilon(HU^{e+\epsilon}/q_l)$ because $A/q_l\le L$. At $H_1$, including the multiplier $H/H_1$, the same price follows from $A/q_l\le A$. Summing the projections with their divisor weights is harmonic, since $q_l\ll A$ and $\sum_{q_l\ll A}\tau(l)/q_l\ll_\epsilon U^\epsilon$. This proves the claimed deletion, including its principal terms. [Puncture identity and native test bounds](inverse-composite-mark.md)

On the remaining pairs the frequencies with $NE(h)\le U^{.199995r}$ cost $O_\epsilon(HU^\epsilon)$; here $E(h)$ is the product of prime ideals of valuation exactly one in $(h)$. The same price covers every $h=v^6h_0$ with sixth-power-free $h_0$ and $Nv\ge U^{2r/67+s}$. Each proof permits restrictions on the bare frequency independently of the column ideals, so the union meets that price. These sets include all powerful frequencies and allow arbitrary sixth powers in the first estimate. The open sum in (3) can be taken on their common complement. A second formulation projects the original inverse onto squarefree rational norms and keeps both frequency deletions, leaving a product $\gg L^2$ of solitary split primes in the conductor of the paired character on rational arguments. [Grouped conductor sieve](long-inverse-grouped-sieve.md) · [Sixth-power divisor estimate](long-inverse-frequency-sectors.md) · [Simultaneous rational conductor restriction](long-inverse-rational-conductor.md)

Prepared with OpenAI Codex assistance.
