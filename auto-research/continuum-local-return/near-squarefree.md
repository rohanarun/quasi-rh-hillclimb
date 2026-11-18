# The remaining pair has almost the full column conductor

Assume the preprint’s 7/8 theorem and the marked source used in tracker #143. For the target $17466917/20000000$, consider the critical reflected interval $x_0-10^{-6}<n=\log_U N\le x_0+.80\cdot10^{-6}$. Use the complete columns from the two ordinary factors and the prime factors selected on the physical class. Two applications of the existing source give the following reduction.

* The column sum over $c$ with $N K(c)\ge U^\gamma$ already has squared row norm $O_\epsilon(U^{1+\epsilon})$, where $K(c)=\prod_{\mathfrak p}\mathfrak p^{\lfloor v_{\mathfrak p}(c)/2\rfloor}$ and $\gamma=1.01\cdot10^{-6}$.
* In the squared norm of the complementary column sum, the signed contribution from pairs with $N(c,c')\ge U^\kappa$ has absolute value $O_\epsilon(U^{1+\epsilon})$, where $\kappa=2.02\cdot10^{-6}$.
* On every remaining pair, the norm of the product $d_6$ of local order-six conductor primes satisfies $U^{1.8501072}<Nd_6\le Nd<U^{1.8501352}$ for sufficiently large $U$. The proof below also gives the interval at each fixed dyad. The remaining one-sided bound at price $U^{1+10^{-7}+\epsilon}$ is open.

The estimates retain the fixed polynomial factors in the external heights. One may use either the complete sixth-power-free shell at the surviving scales $V\gg U^{1-10^{-5}}$ or the all-element row measure with smooth radial weight and arithmetic prime filter described in the companion proof. With a fixed radial support bounded away from zero, these sixth-power-free shells omit the finitely many fixed-inducing rows for large $U$, since such a row can have prime divisors only in a fixed set. In both cases the same measure is used for all terms after expanding a square. These statements concern the physical mass. [Dyadic localization](marked-window.md) · [Slot selection and transfer to the physical mass](extra-marks.md) · [All-element row measure](prime-row-filter.md).

## A divisible column costs less ordinary or prime length

Set $a=10^{-6}$, $c_0=10^{-7}$, $\lambda=2+10s$, with $0<s\le10^{-9}$, and $b=(1-s-2n)/\lambda$. Select the distinct original prime slots of total width $w\le b+a$ from the extra-mark proof. The chosen widths are at most $\mu<10^{-9}$ each. In fact $b+a-\mu<w$. The total supply $L>1/5$ and the pointwise bound $g_j\le\delta/2$ imply that the positive-gain slots alone have width at least $2qL/\delta=2pL>.19$, whereas the quota is below $.076$. All the slots and the two ordinary profiles are fixed across the class.

Write $F(u)=\sum_c\lambda_c\chi_c(u)=P_u(N,v)^2\prod_j\overline{Q_j(u)}$ in the physical orientation. Each column factors as $c=m_1m_2\prod_j p_j$. Both ordinary profiles are smooth, supported on $[1/2,2]$, with the common norm height $v$. The prime coefficients include the complete original ray, annular and height weights. They have modulus $O((Np_j)^{-1/2})$. All column ideals avoid the fixed excluded primes and all row characters retain their zeros. [Column identity](marked-conductor.md#original-columns-and-rows).

Let $\|\cdot\|$ denote the square-root norm for the chosen positive row measure. For $F_h(u)=\sum_{h\mid c}\lambda_c\chi_c(u)$ and $Nh\ge U^\kappa$ we claim
$$
 \|F_h\|\ll_\epsilon U^{1/2+\epsilon}\tau(h)^B (Nh)^{-1/2}.             \tag{1}
$$
Here and below the source’s fixed height polynomial is suppressed. The constant $B$ depends only on the fixed number of slots. To see exactly which polynomials enter (1), at each $\mathfrak p^e\Vert h$ expand the indicator $1_{v_1+\cdots+v_m\ge e}$ in the independent tests $\prod_i 1_{v_i\ge j_i}$. The coefficient at $j$ is its mixed backward difference, taking the function to be zero outside the nonnegative orthant. With $t=\sum j_i$ and $r=\#\{i:j_i>0\}$, it is zero unless $e\le t<e+r$, and otherwise equals $(-1)^{t-e}\binom{r-1}{t-e}$. This follows by summing $(-1)^i\binom ri$ through $t-e$. Summing all the differences over $j_i\le v_i$ recovers the indicator by telescoping. For fixed $m$ the sum of their absolute values is at most $(e+1)^B$. Multiplication over primes gives independent tests $d_i\mid m_i$ or $d_j\mid p_j$, with $h\mid\prod d_i$ and total absolute coefficients at most $\tau(h)^B$.

An ordinary factor with $d_i\mid m_i$ is the original smooth polynomial at the shorter scale $N/Nd_i$, with an extracted scalar of modulus at most $(Nd_i)^{-1/2}$ and its row character. If $1/2\le N/Nd_i<1$, rescale its test to length one. The new support lies in $[1/4,2]$ and its fixed seminorms stay uniformly bounded by the same type of polynomial in $v$. Smaller scales give zero. A prime slot with nonunit $d_j$ either vanishes or has the single fixed value $p_j=d_j$. Remove that slot and retain its scalar and character with all zeros. The remaining prime slots have exactly their original coefficients. No moving ray restriction or squarefree condition enters the native estimate.

The total source length (the sum of the ordinary lengths plus $\lambda$ times marked width) drops by at least $\log_U Nh-O(1/\log U)$. Freezing a prime of norm $\asymp U^{w_j}$ removes $\lambda w_j$ with $\lambda\ge1$. The original excess over the admissible boundary $1-s$ was at most $\lambda a$, and $\kappa>\lambda a$ by a fixed amount. The width-only cap also holds, since $b+a<.076$. Apply the existing two-profile marked source to each term and the triangle inequality to their sum to obtain (1). The product of extracted norm factors is at most $(Nh)^{-1/2}$. The argument applies to every $h$ with this norm threshold, uniformly through the fixed profile controls. [Admissible native fourth moment](marked-window.md#actual-source-and-slot-selection) · [Literal two-profile source](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositivePhysicalPair.lean#L25-L80).

## Remove the large square parts before expanding the square

For $T\ge1$ put $b_T(d)=\sum_{j\mid d}\mu(d/j)1_{Nj\ge T}$. Möbius inversion gives
$$
 1_{NK(c)\ge T}=\sum_{d^2\mid c} b_T(d),\qquad
 b_T(d)=0\ (Nd<T),\qquad |b_T(d)|\le\tau(d).
$$
For $T=U^\gamma$ and every term on the right, $Nd^2\ge U^{2\gamma}=U^\kappa$. Estimate (1), Minkowski and $\sum_{Nd\le U^{O(1)}}\tau(d)^{O(1)}/Nd\ll_\epsilon U^\epsilon$ give the claimed squared norm. Let $F^<$ denote the column sum that remains. Bounding $\|F^<\|^2$ at price $U^{1+c_0+\epsilon}$ suffices by Minkowski.

For $Ng\ge U^\kappa$, restrict $F^<$ to multiples of $g$. Its exact polynomial is
$$
 F_g^<=F_g-\sum_d b_{U^\gamma}(d)F_{\operatorname{lcm}(g,d^2)}.
$$
Each modulus qualifies for (1). The norm factor for the least common multiple equals $(Ng)^{-1/2}\sqrt{N(g,d^2)}/Nd$. Uniformly for $Ng\le U^{O(1)}$,
$$
 \sum_{Nd\le U^{O(1)}}\tau(d)^B\frac{\sqrt{N(g,d^2)}}{Nd}
 \ll_\epsilon U^\epsilon\tau(g)^{O_B(1)}.
$$
Indeed, the part of $d$ away from $g$ gives a harmonic divisor sum. At $\mathfrak p^f\Vert g$ the local series is $\sum_{e\ge0}(e+1)^B(N\mathfrak p)^{\min(f/2,e)-e}\le(f+1)^{O_B(1)}$, by its geometric tail. Also $\tau(\operatorname{lcm}(g,d^2))\le\tau(g)\tau(d)^2$. This proves (1) for $F_g^<$ with a possibly larger divisor exponent. In the squared norm of $F^<$ the contribution with $N(c,c')\ge U^\kappa$ is exactly $\sum_g b_{U^\kappa}(g)\|F_g^<\|^2$. Its absolute value is bounded by the asserted $U^{1+\epsilon}$ after the harmonic sum over $g$. This proof uses the sign to write the pair restriction as a combination of positive norms.

## The conductor and the signed estimate

Let $d$ contain the primes where the signed valuations of $c,c'$ differ modulo six, and let $d_6$ contain those where the difference is $1$ or $5$. Write $G=(c,c')$. Define $P_+$ as the product of primes occurring exactly once in $c$ and absent from $c'$, and define $P_-$ with the two columns exchanged. Then $P_+P_-\mid d_6$ and
$$
 c/P_+\mid K(c)^3G,\qquad c'/P_-\mid K(c')^3G,\qquad
 d/d_6\mid \operatorname{rad}(K(c)K(c')).
$$
For the first two relations a solitary occurrence on both sides is accounted for by $G$, while each exponent $j\ge2$ satisfies $j\le3\lfloor j/2\rfloor$. For the last relation the absolute difference in valuations is at least two. Consequently, for $L=2n+w$ and any fixed slack $\xi>0$, the surviving pairs satisfy, for sufficiently large $U$,
$$
 2L-6\gamma-2\kappa-\xi < \log_U Nd_6\le\log_U Nd<2L+\xi,
 \qquad \log_U N(d/d_6)<2\gamma.                                        \tag{2}
$$
Both columns lie on fixed multiples of the annulus of norm $U^L$. Combining the preceding length bounds with $.42505871<x_0<.42506577$ gives the uniform rounded interval in the introduction. For each dyad the loss from the full column product in (2) is at most $6\gamma+2\kappa=1.01\cdot10^{-5}$ in the exponent, apart from arbitrarily small fixed slack.

Let $K_{\mathrm{row}}(c,c')$ be the complete correlation for the chosen row measure. It suffices to bound
$$
 \operatorname{Re}\sum_{\substack{NK(c),NK(c')<U^\gamma\\N(c,c')<U^\kappa}}
 \lambda_c\overline{\lambda_{c'}}\,K_{\mathrm{row}}(c,c')
 \ \ll_\epsilon U^{1+c_0+\epsilon}(1+H+|v|)^J.                       \tag{3}
$$
Here $H$ is the bound on the original external heights. The exact sum is real by symmetry. It is enough to bound its fixed physical Fourier average for a given shell and dyad, because Hölder also holds for that positive finite measure. Keep $U$ and $N$ fixed over any subdivision of row shells. There is no assertion of an absolute bound on the individual correlations in (3). The proof of the extra-mark estimate’s transfer with $a=10^{-6}$, $c_0=10^{-7}$ leaves a margin of $6.239375\cdot10^{-9}$ beyond the required physical saving. [Physical damping and the height integral](extra-marks.md#the-gain-after-physical-damping).

One exact parametrization exhibits the coprime squarefree variables. Write $c=k^2 f$, $c'=k'^2 f'$ with $k=K(c)$, $k'=K(c')$ and set $g=(f,f')$. Remove from $f/g,f'/g$ their parts $e,e'$ supported on $kk'g$. Then $c=k^2 g e r$, $c'=k'^2g e' r'$ with $r,r'$ coprime squarefree and $(rr',kk'g)=1$. Here $Nk,Nk'<U^\gamma$, $Ng<U^\kappa$, and $e,e'$ divide $\operatorname{rad}(kk'g)$. Keep the exact restrictions in (3), the coefficients $\lambda_{k^2ger},\lambda_{k'^2ge'r'}$, the row’s coprimality with $g$, and the sextic phases from the frozen factors. This specifies the original signed sum with two coprime squarefree residual ideals.

On the all-element measure, Poisson summation and the cubic and ordinary character large sieves already bound three explicit ranges of the dual frequency in (3). [Dual frequency ranges and the remaining signed estimate](dual-marked-frequencies.md).

Run `python3 -OB auto-research/continuum-local-return/column_divisors.py` for the rational comparisons and finite checks of the divisor identities. Prepared with OpenAI Codex assistance.
