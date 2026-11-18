# A complete eighteenth moment using a prime forced by the short inverse

Assume the preprint’s $7/8$ theorem and the inverse and ordinary moments used in tracker #143. Let $M_z(u)$ be a genuine centrally normalized Eisenstein Möbius polynomial of norm length $U^z$ on the full element shell $Nu\asymp U$, with its fixed finite ray twist, literal zero extensions and smooth norm-annulus profile. For every $\epsilon>0$,
$$
 \sum_{Nu\asymp U}|M_z(u)|^{18}\ll_\epsilon
 \begin{cases}
 U^{1.02694+\epsilon},&0\le z\le.09862,\\
 U^{1.02718+\epsilon},&0\le z\le.0987.
 \end{cases}                                                        \tag{1}
$$
The physical factor satisfies $z<1.22654-1.12796+4\cdot10^{-5}=.09862$. The estimate allows its bounded real norm power and norm height, with the source’s polynomial height cost. When that cost is absorbed into $U^\epsilon$, the positive height exponent is chosen after $\epsilon$. The unmarked density estimate gave $1.03970$ over the wider range, or $1.03945$ after using the sharper physical length cap. The sufficient physical price is $1.00029$. [Short physical inverse](short-physical-inverse.md) · [Unmarked density estimate](short-inverse-density.md) · [Inverse with two short labels](balanced-composite-inverse.md) · [Inverse and ordinary moments with a composite mark](inverse-composite-mark.md)

## Outer sixth powers and amplitude bins

Write $u=u_0v^6$, fix the outer primary $v$, its dyadic log-norm $\nu$, finite unit and ray choices, and put $H=1-6\nu$, $V\asymp U^H$, $L=9z$. The short inverse on the sixth-power-free core $u_0$ retains the puncture at every prime dividing $v$. Write $(L_*,E)=(.88758,.02694)$ or $(.8883,.02718)$. For $V\le U^{.01}$ the global $7/8$ bound and the number of lifts already cost less than $U^{1+\epsilon}$. On the larger cores the unmarked calculation in a buffered bin of zero-real-part parameter $\delta=2a-1$ gives the full dyadic exponent
$$
 1+\delta(L-C(\delta))+\nu(-5+6\delta C(\delta)),\qquad C(d)=10/(15-6d).
$$
Its coefficient of $\nu$ is negative. Write $J(l)=(\sqrt{15l}-\sqrt{10})_+^2/6$. For $z\le.094$ use $J(9\cdot.094)<E$. For $\nu\ge.004$, put $\nu=.004$ in the last display and optimize to get $1-.020+.976J(L_*/.976)<1+E$. Off $.15\le\delta\le.51$, the unmarked term $\delta(L_*-C(\delta))$ is increasing to the lower endpoint and decreasing from the upper one, and both endpoint values are below $E$. The near-$1/2$ floor and the finitely many principal inducing rows have the bounds in the unmarked calculation. On every remaining core the tested inverse length at base $V$ is $x=z/H$, with $.094<x<.1012$. [Unmarked core and floor estimates](short-inverse-density.md#the-unmarked-dynamic-count)

Stratify the squared amplitude as $V^{\alpha x}\le |M_z|^2\le V^{\alpha x+O(\epsilon_1)}$. Buffered logarithmic control bounds $\alpha\le\delta$ after arbitrarily small bin errors. The bottom amplitude bin costs a prescribed power loss directly. For all other bins freeze the lower endpoint $\alpha$. At fixed $v$ the tested inverse has the omission $1_{p\nmid v}$, and the symbol retains its zeros at $p\mid u_0$. Define $\gamma=\delta-9.4(\delta-\alpha)$. When $\gamma$ exceeds a prescribed positive mesh floor, separating primes at $V^{.051}$ supplies one of two witnesses. The first is a weighted prime sum of width $b=\log_V P\le.051+o(1)$ with $P>(\log V)^2$ and raw magnitude at least
$$
 cP^{(1+\gamma-\kappa)/2}\log V/(1+\log P)^2
$$
for fixed arbitrarily small $\kappa>0$ below that floor. The second is a centrally normalized smooth prime sum of width $.084\le b\le .1012$ with squared exponent at least $\delta b-(\delta-\alpha)x$ up to freely small losses. The first witness comes either from the Euler product with the smooth cutoff, or from the residual genuine inverse after separating a larger prime. The case of small or negative $\gamma$ is handled below by the unmarked inverse. [Cutoff identity, common-height prime upper bound and Euler extraction](short-inverse-prime-cutoff.md)

## Applying the mark to the detected factors

At the detected primitive zero use the source cutoff
$$
 t=\frac{5/6+E-\delta L_*}{5/6-\delta}\in[1,3/2].
$$
The detector supplies a true inverse of width $r\le t+o(1)$ and an ordinary dyad of width $m\ge t-r-o(1)$, with squared exponents at least $\delta r$ and $\delta m$ up to freely small losses. For $r\ge1$, sixth-power amplification bounds the count by the exponent $1/6+(5/6-\delta)t=1+E-\delta L_*$. For $r\le1$ the unmarked inverse second and ordinary fourth moments save $\delta r$ and $2\delta m$. They suffice if $r\ge Y$ or $2m\ge Y$, where $Y=L_*-E/\delta$. In the remaining range $r_B=t-Y/2\le r\le Y$ up to freely small errors, $.70<r<.84$, and $1/6<2m<Y<.84$. The two presentations can have different fixed ray twists. Conjugate the entire mark when needed to match orientations, placing its fixed ray and outer puncture in its coefficients. [Detector and rowwise heights](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4510-L4681)

Set $\tau=10^{-6}$. For the first witness with $b<\tau$, the available inverse and ordinary mark widths are
$$
 w_I=2(1-r)/7,\qquad w_O=(5/6-2m)_+/4 .
$$
If $w_0\le5\tau$ use the corresponding unmarked moment at loss at most $5\tau\delta$ in the comparison. For a larger width $w_0$ take $h=\lfloor(w_0-4\tau)\log V/\log(2P)\rfloor$. If rounding gives $h=0$, the unmarked comparison costs at most $(5\tau+o(1))\delta$. Otherwise the elementary symmetric sum of $h$ distinct primes supplies a squarefree polynomial with actual width $w\in[w_0-5\tau-o(1),w_0-4\tau+o(1)]$ after partition into fixed-ratio annuli, and normalized squared exponent at least $(\gamma-\kappa)w-o(1)$. The estimate is uniform down to $P>(\log V)^2$: the collision error $h^2P/|S|^2\ll (1+\log P)^2P^{-(\gamma-\kappa)}$ tends to zero, and $h(1+\log\log(2P))=o(\log V)$.

For the detector inverse, factor each squarefree product deterministically into the first $\lfloor h/2\rfloor$ primes in a fixed ordering and the remaining primes. Partition the two products into smooth norm annuli separately. These logarithmically many pairs leave one mark with the stated lower bound. The joint coefficient has magnitude bounded by a constant and counts each squarefree product once before the partition. Each individual width is at most $(w_I-4\tau)/2+\tau/2+o(1)$ because the larger group has $\lceil h/2\rceil$ primes of norm at most $2P$. Thus $r+w+5\max(w_1,w_2)\le 1-23\tau/2+o(1)$, which gives natural price for the inverse and this joint mark. [Inverse with two short labels](balanced-composite-inverse.md)

For the ordinary choice with a positive packed degree, partition only the entire product into annuli. Pair one mark of total width $w\le w_O-4\tau+o(1)$ with two copies of the *actual* ordinary detector polynomial. Its widths satisfy $2m+4w<5/6$ and $2m+5w<1$, since $2m>1/6$. The mixed moment costs $V^{1+\epsilon}$. The two choices may use different product dyads from the same raw prime spike. Pigeonholing them costs a power of the logarithm. [Ordinary moment with a composite mark](inverse-composite-mark.md)

For the first witness with $\tau\le b\le .051+o(1)$, set $W=Y-r$ and $h=\lceil(W+\tau)/b\rceil$. Its total width $B=hb$ satisfies $B\ge W+\tau$ and $B\le W+\tau+.051+o(1)<(1-r)/2$ with fixed slack by the replay. Also $2r+8B<4-2r<3$. Thus the native inverse moment costs $V^{1+\epsilon}$. The degree is bounded independently of $V$. The elementary symmetric sum has squared normalized exponent at least $(\gamma-\kappa)B-o(1)$. To enforce disjoint prime lists, color the primes uniformly and independently with $h$ colors. That sum equals $h^h/h!$ times the color expectation of the product of all color sums. Jensen and the uniform marked moment give the bound after positive row summation. [Native disjoint-prime moment](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9220-L9269)

For the second witness $.084\le b\le.1012$, use this single actual smooth prime factor with the detector inverse. Enlarge the raw row exponent to $\max(1,r+2b)+5\cdot10^{-7}$; the second native condition holds with fixed slack since $r<.84$. Sixth-power amplification on the core gives the extra count charge $(5/6)(r+2b-1)_++10^{-6}$. The amplifier prime avoids the active window so the prime coefficients, including the frozen $v$-puncture, are identical on each lift. [Amplification with genuine prime marks](sixth-free-marked-amplification.md)

For the growing degrees, remove the common scalar $(V_0/P^h)^{-s}$ before Sobolev. Here $V_0\gg P^h$ is the product-annulus center, or the product of the two centers after the balanced split. Its size is bounded and the remaining real-power and height derivatives see only $\log(Nn/V_0)$ on the annulus. For bounded degrees there are finitely many differentiated color profiles with fixed cost. All dyadic scales, including the two detector widths, have logarithmically many choices. Apply the source height bounds after fixing scales, integrating on parameter boxes before the rowwise supremum. Choose the original and additional height exponents sufficiently small for the prescribed loss. [Product normalization and heights](short-inverse-primes.md#products-of-distinct-primes)

## Exact comparison at the observed amplitude

The required core count exponent is $1+E-\alpha L_*$. First consider $\alpha=\delta$. The unmarked inverse leaves a needed mark width $W=Y-r$. The replay gives $0\le W<.0833$ on every active interval. For $\tau\le b\le .051+o(1)$ the native construction supplies the full needed width. For the second witness, the saving from a single prime is
$$
 \delta(r+b)-\tfrac56(r+2b-1)_+-10^{-6}
$$
up to freely small losses. This exceeds $\delta L_*-E$ at all four corners of the box in $r$ and $b$ on each density interval. The expression is concave separately in $r$ and $b$, so the conclusion holds throughout the box.

For $b<\tau$, the two mark choices yield a saving at least $\delta$ times the larger of
$$
 (2+5r)/7,\qquad \tfrac32(t-r)+5/24
$$
less $5\tau\delta$ and freely small losses. The ordinary capacity $2m+(5/6-2m)_+/4$ is at least $3m/2+5/24$ for all actual $m$ in the range. The convex combination with weights $21/31,10/31$ equals $(97+180t)/372$ independently of $r$. The replay checks its power saving against $\delta L_*-E$ with strict slack.

To return to the actual $\alpha$, notice that the required saving decreases by $(\delta-\alpha)L_*$. For the single large prime the available saving decreases by at most $(\delta-\alpha)x$. For a small prime witness use the lower squared slope $\gamma=\delta-9.4(\delta-\alpha)$. In the bounded-degree case $B\ge W+\tau$, and for positive $\gamma$ we can retain only width $W+\tau$ in its lower bound. In the tiny-prime case select the inverse when $r\ge r_c=(252t-13)/372$, where its displayed capacity is larger. Its mark width is at most $2(1-.70)/7$. Below $r_c$ select the ordinary moment; $m\ge t-r_c-o(1)\ge133/372-o(1)$ bounds its mark width by $(5/6-2(133/372))/4+o(1)$. The largest of all three retained widths times $9.4$ is strictly less than $L_*$. Thus the decreased target pays every mark-slope debit, including the case of freely small $\kappa$ and dyadic losses. If $\gamma$ is below a small positive floor $\xi$, use only the unmarked inverse: $(\delta-\alpha)L_*\ge(\delta-\xi)L_*/9.4\ge\delta W-O(\xi)$, which suffices. Choose $\xi$ within the requested loss and then choose smaller preliminary errors.

The exact replay divides $.15\le\delta\le.51$ into rational intervals $[d_0,d_1]$ of width $1/50000$. Monotonicity gives $t\ge t(d_0)$ and $t(d_0)-Y(d_1)/2\le r\le Y(d_1)$. The small-prime ceiling uses the fact that $(1-r)/2-(Y-r)$ increases with $r$. For each fixed capacity used in the remaining comparisons the saving margin is affine in $\delta$. Finally, multiplying the core count by the amplitude bound and summing outer lifts gives
$$
 \nu+H(1+E-\alpha L_*)+\alpha L_*\le1+E
$$
since $1+E-\alpha L_*>1/6$. This proves (1).

At the sufficient physical price the same comparison leaves a concrete gap. Consider $\delta=\alpha=1/3$, $L=.88758$ and $E=.00029$ in the complete moment. The amplified long branch requires $t\le161329/150000$. Even at this largest cutoff the two small-prime expressions coincide at $r=3225409/4650000$, $m=t-r=59193/155000$. Their common value is $726487/930000$, while $Y=L-E/\delta=.88671$. This gives a deficit of $981533/27900000$ in the row-count saving before rounding. The intersection value $(97+180t)/372$ increases with $t$, and the intersection stays inside the admissible widths for $1\le t\le161329/150000$. The gap measures what these inequalities alone can certify for the complete moment. [Exact price and cutoff comparisons](marked_density.py)

Prepared with OpenAI Codex assistance.
