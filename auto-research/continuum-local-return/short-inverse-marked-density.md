# A complete eighteenth moment using a prime forced by the short inverse

Assume the preprint’s $7/8$ theorem and the inverse and ordinary moments used in tracker #143. Let $M_z(u)$ be a genuine centrally normalized Eisenstein Möbius polynomial of norm length $U^z$ on the full element shell $Nu\asymp U$, with its fixed finite ray twist, literal zero extensions and smooth norm-annulus profile. For every $\epsilon>0$,
$$
 \sum_{Nu\asymp U}|M_z(u)|^{18}\ll_\epsilon
 \begin{cases}
 U^{1.02814+\epsilon},&0\le z\le.09862,\\
 U^{1.02838+\epsilon},&0\le z\le.0987.
 \end{cases}                                                        \tag{1}
$$
The physical factor satisfies $z<1.22654-1.12796+4\cdot10^{-5}=.09862$. The estimate allows its bounded real norm power and norm height, with the source’s polynomial height cost. When that cost is absorbed into $U^\epsilon$, the positive height exponent is chosen after $\epsilon$. The unmarked density estimate gave $1.03970$ over the wider range, or $1.03945$ after using the sharper physical length cap. The sufficient physical price is $1.00029$. [Short physical inverse](short-physical-inverse.md) · [Unmarked density estimate](short-inverse-density.md) · [Inverse with two short labels](balanced-composite-inverse.md) · [Inverse and ordinary moments with a composite mark](inverse-composite-mark.md)

## Outer sixth powers and amplitude bins

Write $u=u_0v^6$, fix the outer primary $v$, its dyadic log-norm $\nu$, finite unit and ray choices, and put $H=1-6\nu$, $V\asymp U^H$, $L=9z$. The short inverse on the sixth-power-free core $u_0$ retains the puncture at every prime dividing $v$. Write $(L_*,E)=(.88758,.02814)$ or $(.8883,.02838)$. For $V\le U^{.01}$ the global $7/8$ bound and the number of lifts already cost less than $U^{1+\epsilon}$. On the larger cores the unmarked calculation in a buffered bin of zero-real-part parameter $\delta=2a-1$ gives the full dyadic exponent
$$
 1+\delta(L-C(\delta))+\nu(-5+6\delta C(\delta)),\qquad C(d)=10/(15-6d).
$$
Its coefficient of $\nu$ is negative. Write $J(l)=(\sqrt{15l}-\sqrt{10})_+^2/6$. For $z\le.0945$ use $J(9\cdot.0945)<E$. For $\nu\ge.0035$, put $\nu=.0035$ in the last display and optimize to get $1-.0175+.979J(L_*/.979)<1+E$. Off $.16\le\delta\le.50$, the unmarked term $\delta(L_*-C(\delta))$ is increasing to the lower endpoint and decreasing from the upper one, and both endpoint values are below $E$. The near-$1/2$ floor and the finitely many principal inducing rows have the bounds in the unmarked calculation. On every remaining core the tested inverse length at base $V$ is $x=z/H$, with $.0945<x<.101$. [Unmarked core and floor estimates](short-inverse-density.md#the-unmarked-dynamic-count)

Stratify the squared amplitude as $V^{\alpha x}\le |M_z|^2\le V^{\alpha x+O(\epsilon_1)}$. Buffered logarithmic control bounds $\alpha\le\delta$ after arbitrarily small bin errors. The bottom amplitude bin costs a prescribed power loss directly. For all other bins take the lower endpoint $\alpha$ positive, freeze it, and apply the finite Euler product for the *tested* inverse through its top norm cutoff on the line $\sigma_0=(1+\alpha-\kappa)/2$, where $0<\kappa<\alpha/2$ can be chosen arbitrarily small. The contour shift has positive margin $\kappa x/2$. The omitted prime factors remain omitted. Higher prime powers are absolutely summable on this line. Prime dyads with center at most $(\log V)^2$ contribute $o(\log V)$ since $\sigma_0>1/2$ by a fixed amount. Hence some common good-prime dyad $P>(\log V)^2$, with $b=\log_V P\le x+o(1)<.101$, has weighted raw sum of magnitude
$$
 \gg P^{\sigma_0}\log V/(1+\log P)^2.
$$
Use its full weighted interval with the original top cutoff. The complex power consists of one real part in $[\sigma_0,2]$ and one allowed norm height. The constants may depend on the fixed mesh and $\kappa$. [Truncated Euler product and distinct-prime estimate](short-inverse-primes.md)

## Applying the mark to the detected factors

At the detected primitive zero use the source cutoff
$$
 t=\frac{5/6+E-\delta L_*}{5/6-\delta}\in[1,3/2].
$$
The detector supplies a true inverse of width $r\le t+o(1)$ and an ordinary dyad of width $m\ge t-r-o(1)$, with squared exponents at least $\delta r$ and $\delta m$ up to freely small losses. For $r\ge1$, sixth-power amplification bounds the count by the exponent $1/6+(5/6-\delta)t=1+E-\delta L_*$. For $r\le1$ the unmarked inverse second and ordinary fourth moments save $\delta r$ and $2\delta m$. They suffice if $r\ge Y$ or $2m\ge Y$, where $Y=L_*-E/\delta$. In the remaining range $r_B=t-Y/2\le r\le Y$ up to freely small errors, $.70<r<.832$, and $1/6<2m<Y<.832$. The two presentations can have different fixed ray twists. Conjugate the entire mark when needed to match orientations, placing its fixed ray and outer puncture in its coefficients. [Detector and rowwise heights](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4510-L4681)

Set $\tau=10^{-6}$. If $b<\tau$, use each of the following two available widths:
$$
 w_I=2(1-r)/7,\qquad w_O=(5/6-2m)/4 .
$$
For either width $w_0$ take $h=\lfloor(w_0-4\tau)\log V/\log(2P)\rfloor$. The elementary symmetric sum of $h$ distinct primes supplies a squarefree polynomial with actual width $w\in[w_0-5\tau-o(1),w_0-4\tau+o(1)]$ after partition into fixed-ratio annuli, and normalized squared exponent at least $(\alpha-\kappa)w-o(1)$. The estimate is uniform down to $P>(\log V)^2$: the collision error $h^2P/|S|^2\ll (1+\log P)^2P^{-(\alpha-\kappa)}$ tends to zero, and $h(1+\log\log(2P))=o(\log V)$.

For the detector inverse, factor each squarefree product deterministically into the first $\lfloor h/2\rfloor$ primes in a fixed ordering and the remaining primes. Partition the two products into smooth norm annuli separately. These logarithmically many pairs leave one mark with the stated lower bound. The joint coefficient has magnitude bounded by a constant and counts each squarefree product once before the partition. Each individual width is at most $(w_I-4\tau)/2+\tau/2+o(1)$ because the larger group has $\lceil h/2\rceil$ primes of norm at most $2P$. Thus $r+w+5\max(w_1,w_2)\le 1-23\tau/2+o(1)$, which gives natural price for the inverse and this joint mark. [Inverse with two short labels](balanced-composite-inverse.md)

For the ordinary factor partition only the entire product into annuli. Pair one mark of total width $w\le w_O-4\tau+o(1)$ with two copies of the *actual* ordinary detector polynomial. Its widths satisfy $2m+4w<5/6$ and $2m+5w<1$, since $2m>1/6$. The mixed moment costs $V^{1+\epsilon}$. The two choices may use different product dyads from the same raw prime spike. Pigeonholing them costs a power of the logarithm. [Ordinary moment with a composite mark](inverse-composite-mark.md)

If $b\ge\tau$, use only the inverse with native prime slots. Set $w_N=(1-r)/(4-\delta)$ and take $h=\max(1,\lceil w_N/b\rceil)$, bounded independently of $V$. The total nominal width is $B=hb$. Enlarge the row-ball exponent to $\max(1,r+2B)+5\cdot 10^{-7}$. This meets both native conditions. Indeed $B\le\max(2w_N,.101)$, and $2r+8B<3$ follows from $.70<r<.832$ and $\delta\le.50$. The extra count charge is at most $(r+2B-1)_++10^{-6}$. To enforce disjoint prime lists, color the primes uniformly and independently with $h$ colors. The elementary symmetric sum equals $h^h/h!$ times the color expectation of the product of all color sums. Jensen and the uniform marked moment give the bound after positive row summation. The normalized lower bound is $(\alpha-\kappa)B-o(1)$ in the squared exponent. [Native disjoint-prime moment](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9220-L9269)

For the growing degrees, remove the common scalar $(V_0/P^h)^{-s}$ before Sobolev. Here $V_0\gg P^h$ is the product-annulus center, or the product of the two centers after the balanced split. Its size is bounded and the remaining real-power and height derivatives see only $\log(Nn/V_0)$ on the annulus. For bounded degrees there are finitely many differentiated color profiles with fixed cost. All dyadic scales, including the two detector widths, have logarithmically many choices. Apply the source height bounds after fixing scales, integrating on parameter boxes before the rowwise supremum. Choose the original and additional height exponents sufficiently small for the prescribed loss. [Product normalization and heights](short-inverse-primes.md#products-of-distinct-primes)

## Exact comparison at the observed amplitude

The required core count exponent in an amplitude bin is $1+E-\alpha L_*$. To check a marked comparison it suffices to set $\alpha=\delta$ and drop $\kappa$ at a freely small loss. Indeed each bound has saving $D+\alpha w-c$, where $D$ comes from the detector and $c$ is the moment charge. Reducing $\alpha$ from $\delta$ improves the margin over $\alpha L_*-E$ by $(\delta-\alpha)(L_*-w)\ge0$. All marks above have $w<.18<L_*$.

For $b<\tau$ the two choices at $\alpha=\delta$ yield a saving at least $\delta$ times the larger of
$$
 (2+5r)/7,\qquad \tfrac32(t-r)+5/24
$$
less $5\tau\delta$ and freely small losses. Here the ordinary capacity $2m+(5/6-2m)/4$ increases with $m$. Their convex combination with weights $21/31,10/31$ equals $(97+180t)/372$ independently of $r$.

For $b\ge\tau$ define $f(B)=\delta B-(r+2B-1)_+$. On $[w_N,2w_N]$ this concave function equals $\delta w_N$ at both endpoints, by the definition of $w_N$. If $b<w_N$, the ceiling places $B$ in that interval. Otherwise $B=b\in[w_N,.101]$ and concavity again puts the minimum at an endpoint. Including both cases, the saving is at least the smaller of
$$
 \delta\left(r+\frac{1-r}{4-\delta}\right)-10^{-6},\qquad
 \delta(r+.101)-(r+.202-1)_+-10^{-6}
$$
up to freely small losses.

The exact replay divides $.16\le\delta\le.50$ into rational intervals $[d_0,d_1]$ of width $1/50000$. Monotonicity gives $t\ge t(d_0)$ and $t(d_0)-Y(d_1)/2\le r\le Y(d_1)$. The packed native capacity increases with $r$ and $\delta$, and the single-prime expression is concave in $r$, so the interval endpoints suffice. For each fixed capacity from these bounds the remaining comparison is affine in $\delta$. All three savings exceed $\delta L_*-E$ with strict slack. Finally, multiplying the core count by the amplitude bound and summing outer lifts gives
$$
 \nu+H(1+E-\alpha L_*)+\alpha L_*\le1+E
$$
since $1+E-\alpha L_*>1/6$. This proves (1).

At the sufficient physical price the same comparison leaves a concrete gap. Consider $\delta=\alpha=1/3$, $L=.88758$ and $E=.00029$ in the complete moment. The amplified long branch requires $t\le161329/150000$. Even at this largest cutoff the two small-prime expressions coincide at $r=3225409/4650000$, $m=t-r=59193/155000$. Their common value is $726487/930000$, while $Y=L-E/\delta=.88671$. This gives a deficit of $981533/27900000$ in the row-count saving before rounding. The intersection value $(97+180t)/372$ increases with $t$, and the intersection stays inside the admissible widths for $1\le t\le161329/150000$. The gap measures what these inequalities alone can certify for the complete moment. [Exact price and cutoff comparisons](marked_density.py)

Prepared with OpenAI Codex assistance.
