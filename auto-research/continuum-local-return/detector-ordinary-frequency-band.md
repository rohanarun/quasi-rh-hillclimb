# A zero-mean test and a narrow spectral band for the detector ordinary anchor

Assume the preprint's $7/8$ theorem and the actual source estimates of tracker #143. Write $U=Z^D$, $\eta=10^{-7}$ and use its usual critical rectangle $.425\le\delta\le.4267$, $.49995\le p\le.5$. Set $q=\delta p$, $m=t_0/3$, $b=2m$, $k=1-p(1+2g_1)$ and $a_0=p(1+2g_0)$. The original count is $R=1-\delta(a_0+kb)$. The tangent mark capacity at a doubled ordinary width $R_0$ is
$$
 \sigma(R_0)=\frac{1-R_0}{2}+g_0-g_1R_0,\qquad
 R_0+2p\sigma(R_0)=a_0+kR_0.
$$
A one-sided estimate on the interval (1) below would provide the saved full-class count on this rectangle. The Mellin cancellation and both rational-divisor restrictions are proved here. The remaining signed estimate is open.

## Transferring the ordinary witness

Write $S_u(X;F)=X^{-1/2}\sum_n\psi_u(n)F(Nn/X)$ over the original good ideals, with all natural zeros. The fixed ray twist and either sextic orientation are those of the selected detector label. For the entire norm profile $F(x)=W(x)x^{-\sigma+it}$ of an ordinary centrally normalized dyad $S_u(X;F)$, set $\mathcal D F=F+xF'$. This includes the derivative of the actual complex norm power. Integration by parts gives $\int_0^\infty\mathcal DF(x)\,dx=0$. The sum is finite locally in $X$ and differentiation gives exactly
$$
 S_u(X;\mathcal DF)=(1/2-\partial_{\log X})S_u(X;F).
$$
Consequently for any $T>X$,
$$
 S_u(X;F)=(X/T)^{1/2}S_u(T;F)
            +\int_X^T(X/Y)^{1/2}S_u(Y;\mathcal DF)\frac{dY}{Y}.
$$
Suppose $|S_u(X;F)|\ge X^{\delta/2} U^{-\epsilon_1}$ and the buffered upper estimate is $|S_u(T;F)|\le T^{\delta/2}U^{\epsilon_2}$ including the chosen height cost. Taking $T=XU^\nu$ for any fixed $\nu>0$, and $\epsilon_1+\epsilon_2<(1-\delta)\nu/2$ with fixed slack, the first term accounts for less than half the spike for large $U$. Since $\int_X^T(X/Y)^{(1-\delta)/2}dY/Y\le 2/(1-\delta)$, some $X\le Y\le T$ obeys $|S_u(Y;\mathcal DF)|\gg Y^{\delta/2}U^{-\epsilon_1}$. The fixed smooth seminorms have polynomial order in $t$, chosen before the final buffer-height exponent. For parameters $s,t$, take the derivatives of $\mathcal D(W(x)x^{-s+it})$ as a whole. They are $\mathcal D$ applied to the corresponding signed log-norm profiles. Multiplying an already differentiated profile by $\log x$ alone need not preserve its zero. A derivative in $\log Y$ acts instead by $-1/2-x\partial_x$ on the full profile and commutes with $\mathcal D$. All of these are exact identities on smooth compactly supported tests. No approximation of a signed profile by a positive one is needed. In applying the buffered pointwise lemma, keep the original norm height at most $(3i+1)T_1$, and use the one common $T_1/2$ allowance for extra Mellin frequencies. The derivative of the norm power only introduces polynomial height coefficients. The ODE introduces no new norm frequency. [Original detector and pointwise Mellin estimates](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4280-L4509)

For any fixed $J$ one may iterate with $\mathcal D_j F=(1+j)F+x F'$, $j=0,\ldots,J$. The scale ODE has coefficient $j+1/2$, and each earlier zero is preserved by the Mellin multiplier $1+j-s$. Giving the iterations equal shares of a fixed total $\nu$ supplies a saturated witness of width at most $\log_U X+\nu$ annihilating all Mellin values $s=1,\ldots,J+1$. Its radial plane Fourier transform vanishes to order $2J+2$ at the origin, by Taylor expansion (the circular average kills odd degrees). Thus in direct ordinary Poisson summation the range more than a fixed positive power below the natural dual length has an arbitrarily large power saving on taking $J$ suitably large, with height and derivative budgets fixed afterwards. Only $J=0$ is required here.

## Restoring the exceptional rows

The ordinary anchor's raw source excludes zero and those nonzero elements whose primitive inducing character has conductor dividing a fixed ideal. This ideal may depend on the frozen detector label and the original finite ray data. On those rows the sixth-power-free part is supported on a fixed set of primes. In fact a good nonzero exponent modulo six forces ramification there beyond every fixed inducing conductor. Thus the product $B$ of all additionally omitted good primes on an exceptional row $u$ is $O((Nu)^{1/6})$ in norm up to fixed factors. For $Nu\le U^{11/10}$ and $Y=U^{.375+O(.002)}$ all divisors $d\mid B$ yield $Y/Nd\gg U^{.18}$. Expand the imprimitive mask over $d\mid B$. At each shifted scale use elementary planar Poisson on the finitely many residue classes of the fixed primitive character. For nonprincipal fixed characters the constant term vanishes. For the principal character, its constant is a fixed scalar times $\int\mathcal DF=0$. Smooth decay on all nonzero frequencies then gives an arbitrarily large power saving, with a fixed polynomial in the height for each selected decay order. The original mark product has polynomial size by trivial counting. Thus these exceptional rows can be added back to the positive ordinary energy at negligible cost, uniformly for the differentiated zero-mean tests. Rows outside the cutoff $U^{11/10}$ cost a negligible amount with the rapidly decreasing row weights at $U$ and $U^{1+6\cdot10^{-6}}$. This produces a true all-element Poisson expansion with the original marks and no auxiliary prime. [Initial keep predicate](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-10-06-openai-baseline/src/Submissions/openai_baseline/OAI/NumberTheory/DirichletL/Moments/DetectorEnergyInitialState.lean#L21-L23) · [Actual ordinary anchor contract](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorExtension/Library/MarkedAnchor/Interface/Contract.lean#L428-L450)

## Isolating the ordinary branch

Use $t=t_0-4\cdot10^{-7}$ with arbitrarily small witness losses. Witness geometry gives $r\le t+\gamma$, where the choice of $\gamma>0$ is arbitrarily small. Thus the native long price $1/6+(5/6-\delta)r$ bounds the count of all long inverse witnesses $r\ge1$ by $R-(5/6-\delta)4\cdot10^{-7}+o(1)$ in the exponent, sufficient by a margin greater than $6.2\cdot10^{-8}$. At $b+10^{-6}\le r<1$ the short inverse comparison and its existing upper-window fallbacks suffice. The tangent margin is $\delta k10^{-6}>1.80\cdot10^{-7}$. On the remainder the ordinary width is $y\ge m-1.4\cdot10^{-6}-o(1)$, and $y\ge m+10^{-6}$ was already saved by the existing ordinary comparisons. The zero-mean transformation with $\nu=10^{-7}$ furnishes a similarly saturated ordinary witness $Y=U^{y'}$ on
$$
 m-1.41\cdot10^{-6}\le y'\le m+1.11\cdot10^{-6}.
$$
The original arbitrarily small losses are chosen below these fixed reserves. This is the detector ordinary width near $.376$, distinct from the reflected numerator near $.425$. [Witness cases and guard comparisons](crossing.md) · [Tangent source](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/ContactTangent.lean)

Select a whole positive prime list at target $w=\sigma(2y')+3\cdot10^{-6}$, with the usual arbitrarily small mesh loss. At $H_1=U^{M_j}$, $M_j=1+6\cdot10^{-6}$, its scaled tangent capacity is
$$
 M_j\sigma(2y'/M_j)=\sigma(2y')+(M_j-1)(1/2+g_0)>\sigma(2y')+3.3483\cdot10^{-6}.
$$
The doubled ordinary width at the new base remains strictly inside the tangent interval, and the available positive prime supply exceeds $w$. Exact $3.48\cdot10^{-7}$-sized slack allows strict rectangle decrements. Use the decreasing-gain positive prefix from the original fixed amplitude bin. Its width is at most the quota. Its gain is at least $qw$ up to one slot loss, including when all positive gains are exhausted. The near-maximal masked mean in this rectangle actually forces more positive width than the quota: if their total width is $P_+$ then $(\delta/2)P_+\ge q\ell/D$, hence $P_+\ge 2p\ell/D> .1999$, while $w<.13$. Thus its actual width $W$ is $w$ up to one mesh loss. Use a fixed finite net of anchor locations with strict decrements, made finer than the displayed reserve. Take the minimum of the corresponding source meshes before the physical schedules. [Original slot selection](marked-window.md#actual-source-and-slot-selection) · [Anchor rectangles and strict decrements](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorExtension/Library/MarkedAnchor/Interface/Contract.lean#L522-L552) For a continuous $Y$ selected by the ODE, locate its scale in a fixed-ratio window when choosing the physical list. Freeze the selection at a representative log-scale in that window and allow its $O(1/\log U)$ width error. There are $O(\log U)$ windows. On each use Sobolev in the bounded log-scale coordinate, the bounded real parameter and the original height interval before summing rows. Expanding the finitely many parameter derivatives of $S_u^2$ gives products of two fixed zero-mean profiles, possibly different, controlled by the arbitrary-profile positive ordinary rectangle. Integrate the fixed-parameter bounds. The height interval and derivatives have polynomial cost, covered by the subsequent small choice of height exponent. Every comparison below uses these same products at fixed parameters. The root that selected a row need not persist for a different row or scale: the ODE starts from its actual witness, and the buffered upper bound holds for its same presentation on the whole short scale interval.

## The signed frequency interval

Use a fixed nonnegative radial Schwartz majorant at row scale $U$ with compact radial plane Fourier transform $F_0(N\xi)$ (for instance a squared inverse transform of a sufficiently narrow radial bump). For $\lambda=U/H_1$ take a signed comparison at $H_1$ with radial plane transform $\chi(v)F_0(\lambda v)$, $v=N\xi$, where $\chi$ is one near zero and compactly supported. This family has uniformly bounded Schwartz seminorms. Its absolute energy, times $\lambda$, costs $O(U^{1+\epsilon})$. Indeed dyadic majorants and the enlarged source give $O(H_1U^\epsilon)$ on the filtered rows, and the exceptional estimates above apply. At larger fixed-multiple row balls use the same anchor rectangle with the physical scales divided by the larger base. The dyadic supremum of a Schwartz majorant has arbitrary polynomial decay in the ratio of the shell scale to the base. Summing it against the linear row bound converges, and beyond $U^{11/10}$ use trivial estimates and the chosen Schwartz order. The fixed source data determine the polynomial height orders, and the resulting small choice of the height exponent precedes the large-$U$ estimate.

Write $d$ for the norm of the primitive paired column conductor, $J$ for the norm of a divisor used to expand the residual coprimality mask, and $h$ for the dual lattice index. Primitive pair Poisson leaves
$$
 [1-\chi(c H_1 Nh/(Jd))]F_0(c U Nh/(Jd)).
$$
Here $c>0$ is the fixed dual-lattice normalization. The remaining frequencies satisfy
$$
                 Jd/H_1\ll Nh\ll Jd/U. \tag{1}
$$
Both comparisons use fixed support constants. The prefactor on both Poisson kernels is the same because $\lambda H_1=U$. Fixed ray factors, the primitive Gauss phase, the divisor coefficient $\mu(j)\psi(j)/J$, the dual character and its natural zeros all remain the original ones. For example the primitive normalization has prefactor $c_0U\gamma(\psi)/\sqrt d$, with the same lattice constant $c_0$ on both terms. [Primitive paired Poisson normalization](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9722-L9776) The original column is the product of two actual zero-mean ordinary profiles and the canonical prime marks. The fixed presentation is handled in its own ray character and sextic orientation, conjugating whole factors if needed. Retain the selected prime slot in that relative character. [Physical selected slots for either detector presentation](asymmetric-ordinary.md#witnesses-on-the-same-row) A bound $O(U^{1+4\cdot10^{-7}+\epsilon})$ on the full real signed remainder for each fixed profile and the finitely many required derivatives would suffice. No absolute termwise bound or unrestricted signed truncation is asserted. Accordingly one may retain every pair, interpreting the principal pairs by ordinary Poisson with the full remaining zero mask.

At the prescribed full price the marked count is at most
$$
 1+4\cdot10^{-7}-2\delta y'-2q w+\epsilon
 \ \le R-\{2q(3\cdot10^{-6})-4\cdot10^{-7}-2\delta k(1.41\cdot10^{-6})\}+\epsilon .
$$
The braces exceed $3.646\cdot10^{-7}$, using $g_1>.07599617$. This would pass the required $10^{-7}$ saving after the separate original errors. At ideal-coprime squarefree typical columns the root log widths are $2y'+w\simeq.877$ and $(2(2y'+w)-1)\simeq.754$ for the central dual norm. The exact filtering below confines every surviving pair to this same dual region within the stated bounds. Sixth-power amplification on the enlarged fifth-sixth slope alone costs too much: infinitesimally its moment fee is $(5/6)dM$ while the flat measured gain from the added tangent capacity is $2q(1/2+g_0)dM<.24dM$.

## Rational-divisor projections inside the interval

Fix the two ordinary profiles and the retained list of prime slots. Index a column by its tuple and let $C$ be the product of its two ordinary ideals and all its primes, counting repetitions. Let $c=2y'+W$ with $W$ the actual width of the prefix, so $NC\asymp U^c$. Constants may depend on the finite list. Use either signed kernel separately for all positive norm estimates below. More precisely the measures are the absolute radial majorants at $U$ and $H_1$, with the second multiplied by $U/H_1$. Write $\|\cdot\|_2$ for either resulting norm.

For a positive integer $l$ let $P_l$ denote the column sum restricted to $l\mid NC$. Uniformly for $U^{6\cdot10^{-6}}\le l\ll U^c$,
$$
                      \|P_l\|_2\ll_\epsilon U^{1/2+\epsilon}/\sqrt l .       \tag{2}
$$
The constants allow the fixed height and profile controls above. To see this, write the norm valuation at each rational $p\mid l$ as $\sum_i f_i v_i$, over the ideal places and labels with residue degrees $f_i=1$ or 2. Express $1_{\sum f_i v_i\ge e}$, $e=v_p(l)$, in the coordinatewise basis $1_{v_i\ge d_i\ (\forall i)}$ by finite differences, taking the predicate to be zero at negative coordinates. Its coefficients have modulus at most $2^{\#i}$ and vanish unless $e\le\sum_i f_i d_i<e+\sum_i f_i$. There are $O((e+1)^B)$ choices per prime, including the fixed bound on the number of labels. After multiplication the sum of the absolute coefficients is $\ll\tau(l)^{O(1)}$, and each selected divisibility tuple has extracted ideal norms with product at least $l$.

For an ordinary label, extracting an ideal $d_i$ gives the exact multiplier $\psi_u(d_i)/\sqrt{Nd_i}$ times the original annular polynomial at $Y/Nd_i$, with its entire original profile. For a prime slot a nonunit requirement forces its single prime, or gives zero. Its scalar is $O((Np)^{-1/2}U^\epsilon)$ with the original row character and natural zeros. Remove that slot from the remaining product. These scalar estimates are only used inside a positive norm. Let $a$ be the total log-norm extracted from ordinary factors and $b$ the sum of the removed slot widths, in base $U$. Then $a+b\ge\log_U l-O(1/\log U)$ with a fixed-list constant. Lengths below one are clamped to zero exponents. In any nonempty annulus this changes them by $O(1/\log U)$.

At row base $U$, if $2y'-a\ge3/4$ then the gained mark room over the required retained width is at least
$$
    (1/2+g_1)a+b-3\cdot10^{-6}-O(1/\log U)>4\cdot10^{-7}.
$$
If $2y'-a<3/4$, use the downclosed rectangle at $3/4$ with a small upward shift of its anchor location to allow the source's strict length decrement. In fact $2y'>.7519$ and $\sigma(3/4)-\sigma(2y')>(1/2)(.0019)$. The retained width is at most $\sigma(2y')+3\cdot10^{-6}+O(1/\log U)$. In both cases a fixed finite net of anchor locations, shifted slightly to the right, and a sufficiently small common positive decrement fit both inequalities simultaneously. At larger row bases all upper constraints on the two ordinary exponents and the mark width in this rectangle are preserved, which also proves the required estimates against the absolute radial majorants.

On an excluded row of norm at most $U^{11/10}$, if $a\le1/20$ both shortened ordinary scales divided by the radical of the omitted primes exceed $U^{.14}$. The exceptional-row Poisson argument above applies verbatim. If $a>1/20$, use the trivial square of the whole remaining product, $\ll U^{c-a-b+\epsilon}$ after the displayed scalar normalization. In a row ball of norm $V\ge U$, the number of exceptional elements is $O(V^{1/6})$ since the sixth-power-free cores form a fixed finite set. As $c<.878$ and $c-1/20<5/6$, this energy is $O(VU^\epsilon)$ before multiplying by the product of inverse extracted norms. Schwartz tails past $U^{11/10}$ can be discarded to any fixed power by trivial bounds. The row at zero contributes zero to the original projected columns since each original column contains a nonunit. This proves (2) by the triangle inequality.

Define $s(n)=\prod_p p^{\lfloor v_p(n)/2\rfloor}$ for a positive rational integer $n$. In the sufficient signed estimate one may impose all three conditions
$$
 s(NC),s(NC')<U^{3\cdot10^{-6}},\qquad
 \gcd_{\mathbb Z}(NC,NC')<U^{6\cdot10^{-6}} .                   \tag{3}
$$
For the first two, put $K=U^{3\cdot10^{-6}}$, $B_K=\mu_{\mathbb Z}*1_{[K,\infty)}$ on the positive integers. The column omitted by $s(NC)\ge K$ equals $\sum_{j\ge K}B_K(j)P_{j^2}$. Since $|B_K(j)|\le\tau(j)$, (2) and the harmonic sum bound its norm by $O(U^{1/2+\epsilon})$ in either measure. Thus the moment upper target for the retained column implies the same exponent for the full column by the triangle inequality. Likewise at $H_1$ the retained reference has absolute cost $O(U^{1+\epsilon})$ by the bound for the full reference. These statements do not require a pointwise lower bound for a projected polynomial.

For the cross gcd work with the retained column in each of the two physical kernels before imposing (1). For $k\ge K^2$ its further projection $k\mid NC$ is
$$
 P_k-\sum_{j\ge K} B_K(j)P_{\operatorname{lcm}(k,j^2)} .
$$
Every subscript here is at least $K^2$. Uniformly for $k\ll U^c$, $X\ll U^c$,
$$
 \sum_{j\le X}\frac{\sqrt{\gcd(k,j^2)}}j\ll_\epsilon U^\epsilon.
$$
Indeed split $j$ into a part supported on $k$ and a coprime harmonic part. At $p^e\Vert k$ the unrestricted local sum is
$\sum_{m\ge0} p^{\min(e/2,m)-m}\le 1+e+2/(1-p^{-1})$.
Its product is $\ll\tau(k)^{O(1)}$, and the coprime part is $O(1+\log(2X))$. Integer divisor weights incur an arbitrarily small further power. By (2) the projected retained norm is $O(U^{1/2+\epsilon}/\sqrt k)$. Apply the inversion coefficients $B_{K^2}(k)$ in the pair variable: the sum over all $k$ of the projected square with these coefficients selects the pairs with cross gcd at least $K^2$. Its signed contribution has absolute value $O(U^{1+\epsilon})$ in each kernel by the harmonic sum of $\tau(k)/k$. This proves the simultaneous reduction (3).

The product of rational primes occurring with total valuation exactly one across $NC,NC'$ is at least
$$
 \frac{NC\,NC'}{s(NC)^3s(NC')^3\gcd(NC,NC')^2}.
$$
Check this at each prime: an exponent $v\ge2$ is at most $3\lfloor v/2\rfloor$, and when both valuations are positive the smaller valuation controls the remaining unit exponents. Away from the fixed primes each such solitary prime splits and contributes a nontrivial primitive sextic character at its unique place. Thus the product lower-bounds $d$ up to a fixed constant. Also $Jd\ll NC\,NC'$ since conductor and deleted good places are disjoint and tame, and each divides the ideal product. Hence (1) and (3) jointly imply
$$
    U^{2c-1-36\cdot10^{-6}}\ll Nh\ll U^{2c-1}.
$$
On this smaller set the required aggregate real upper bound remains $U^{1+4\cdot10^{-7}+\epsilon}$. No cancellation estimate reaching it is supplied here.

Run `python3 -OB auto-research/continuum-local-return/detector_ordinary_frequency_band.py` from the repository root for the rational guards and finite-difference checks. Prepared with OpenAI Codex assistance.
