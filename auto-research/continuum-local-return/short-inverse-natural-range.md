# A diagonal-order eighteenth moment through log length 277/3348

Assume the preprint’s $7/8$ theorem and its inverse and ordinary moment inputs. For a genuine centrally normalized smooth Möbius polynomial $M_u(U^z)$ of a fixed admissible Eisenstein sextic presentation, one has
$$
 \sum_{0<Nu\asymp U}|M_u(U^z)|^{18}\ll_\epsilon U^{1+\epsilon},
 \qquad 0\le z\le 277/3348 .
$$
The sum includes every element row and its original nonunit zeros. A common Euler omission of polynomial norm is allowed. The estimate permits the norm-height and bounded real powers in the original test, with their stipulated height cost. A single undivided composite mark gave the previous endpoint $50/621$. At the physical length $.0974<z<.09862$ the available bound is larger. [Inverse with two short labels](balanced-composite-inverse.md) · [Two ordinary factors with a short label](inverse-composite-mark.md#two-ordinary-factors-with-one-arbitrary-short-coefficient) · [Earlier density estimate](short-inverse-density.md) · [Estimate at the physical length](short-inverse-marked-density.md)

## The sixth-power-free estimate

Use $V$ for the sixth-power-free row scale and $x$ for the length exponent of the tested inverse. For $0<x\le.085$ the same reasoning proves
$$
 \sum_{Nu_0\asymp V}^{(6)} |M_{u_0}(V^x)|^{2k}\ll_\epsilon V^{1+\epsilon}
 \quad\text{if}\quad 0< k\le9,\qquad kx\le L_0=277/372.
$$
Here $k$ may be real. The amplitude-bin argument below only uses $kx\le L_0$ and the uniform upper bound $k\le9$. Uniformity for very small $x$ follows first by the trivial ideal count when $9x$ is below the requested power loss. On the remaining compact range fix all pointwise losses and the floor bin width sufficiently small after that split. The finitely many principal inducing rows can be bounded directly with the global inverse estimate of squared slope at most $3/4+\epsilon$. Its total exponent is at most $(3/4)L_0+\epsilon$. The near-$1/2$ floor likewise costs at most a prescribed extra power on top of the row count. For every nonfloor bin define $\delta=2a-1$ using the maximum real part of the primitive zeros in the original buffered height range. The normalized squared magnitude of the tested inverse has upper bound $V^{\delta x+\epsilon_1}$ even with the common omissions. [Buffered count and treatment of the floor](short-inverse-density.md#the-unmarked-dynamic-count)

Take a finite mesh in the squared amplitude slope. On each bin one may assume that the tested inverse has squared magnitude between $V^{\alpha x}$ and $V^{\alpha x+O(\epsilon_1)}$, with $0<\alpha\le\delta$. The initial bin of magnitudes below a prescribed tiny power of $V$ costs the allowed loss directly. Slope and moment errors in the other bins can be made arbitrarily small on the retained compact length range. A row count with exponent $1-L_0\alpha+O(\epsilon_1)$ then suffices. At the bin’s detected zero run the preprint’s unmarked detector with cutoff $t=1$. It supplies an inverse witness of width $0\le r\le1+o(1)$ and an ordinary witness of width at least $1-r-o(1)$. Their squared slopes are at least $\delta$ up to arbitrarily small exponent losses. The unmarked inverse second moment and the ordinary fourth moment therefore give respective savings $\delta r$ and $2\delta(1-r)$. In particular the desired count already holds if $r\ge L_0$ or $r\le1-L_0/2=467/744$. [Detector and unmarked moment inputs](short-inverse-density.md#the-unmarked-dynamic-count)

Consider $467/744\le r\le277/372$ and sufficiently small fixed $\tau>0$. A large value of the tested inverse forces a prime sum. Take the truncated Euler product through the upper support of $V^x$ on the line $\sigma_0=(1+\alpha-\tau)/2$. Slopes $\alpha\le2\tau$ already fit the power error. On the other bins $\sigma_0>1/2$ by a fixed amount, and the left edge saves $\tau x/2$ in the exponent relative to the observed inverse. The contour proof gives a good-prime dyad $P>(\log V)^2$ with raw magnitude at least $cP^{\sigma_0}\log V/(1+\log P)^2$ and width $b=\log_V P\le.085+o(1)$. The constant may depend on the fixed lower bound on $x$ and on the mesh. The tested inverse and the detector may have different fixed presentations. Conjugating the whole prime sum when needed preserves its modulus, and the finite ray difference goes into its row-independent coefficients. [Prime extraction and products of distinct primes](short-inverse-primes.md)

If $b<\tau$, any fixed requested width $w$ bounded away from zero in this argument can be attained up to $O(\tau)$. Take $h=\lfloor(w-2\tau)\log V/\log(2P)\rfloor$. The elementary symmetric sum over $h$ distinct primes gives one bounded-coefficient polynomial at actual width in $[w-3\tau-o(1),w-2\tau+o(1)]$ with normalized squared magnitude at least $V^{\alpha w-O(\tau)-o(1)}$. Two different choices of $w$ may be used on the same row. Apply the two mixed moments at the following widths. [Mixed moment bounds and their common profile and height controls](inverse-composite-mark.md)

* With the detector inverse choose $w_I=2(1-r)/7$. In each squarefree product assign the first $\lfloor h/2\rfloor$ primes in a fixed order to one label and the rest to the other. The coefficient on the two labels imposes this choice, so no multiplicity is introduced. Split each label into fixed-ratio norm annuli, retaining one pair by pigeonholing at the cost of a power of $\log V$. If their widths are $w_1,w_2$, then $w_1+w_2\le w_I-2\tau+o(1)$ and $\max(w_1,w_2)\le (w_I-2\tau+b)/2+o(1)$. These follow from the bound $(2P)^h$ for the full product and $(2P)^{\lceil h/2\rceil}$ for each label. Converting from the normalization at $(2P)^h$ to the one at the actual product of the annular centers costs at most a fixed factor in the lower bound. Hence $r+w_1+w_2+5\max(w_1,w_2)\le1-9\tau/2+o(1)$, and the two-label inverse moment saves at least $\alpha[r+w_I]-O(\tau)$, with $r+w_I=(2+5r)/7$. The joint coefficient may encode the ordering, all prime exclusions and the original smooth total-norm cutoff. For annular centers $D_1,D_2$, remove the common scalar $(D_1D_2/P^h)^{-s}$ before taking the supremum over the prime height and real power. Its modulus is bounded since $D_1D_2\gg P^h$ on every nonempty pair. Derivatives of the surviving $(N(d_1d_2)/(D_1D_2))^{-s}$ use only a bounded normalized logarithm. [Two-label estimate](balanced-composite-inverse.md)
* Write $m$ for the actual ordinary witness width. If $2m\ge L_0$ the unmarked fourth moment suffices. Otherwise choose $w_O=(5/6-2m)/4$ with two copies of that witness. Here $2m\ge2(1-r)-o(1)>1/6$. Thus $2m+5w_O<1$, and rounding the mark down gives fixed slack in $2m+4w\le5/6$. The saving is at least $\alpha[2m+w_O]-O(\tau)$, where $2m+w_O=3m/2+5/24\ge41/24-3r/2-o(1)$.

The increasing inverse expression and the decreasing ordinary expression intersect at $r=239/372$, where both equal $277/372$. Their maximum gives the claimed count.

If $b\ge\tau$ and $r<L_0$, set $\Delta=L_0-r>0$ and $h=\lceil\Delta/b\rceil$. Use $h$ separate prime factors with the inverse witness, of nominal total width $B=hb\ge\Delta$. The number $h$ is bounded in terms of $\tau$. For a fixed $h$ the native marked estimate requires $r+2B<1$ and $2r+8B<3$ by fixed margins. Write $r_-=1-L_0/2$. The three rounding cases give the following upper bounds, up to $o(1)$ from the fixed annuli.

| Number of primes | Bound for $r+2B$ | Bound for $2r+8B$ |
| --- | --- | --- |
| $h=1$ | $L_0+2(.085)$ | $2L_0+8(.085)$ |
| $h=2$ | $L_0+3(.085)$ | $2L_0+14(.085)$ |
| $h\ge3$ | $3L_0-2r_-$ | $12L_0-10r_-$ |

For $h=2$, the ceiling implies $b<\Delta$, so $r<L_0-b$. For $h\ge3$, it gives $(h-1)b<\Delta$, hence $B<3\Delta/2$. Each entry in the middle column is strictly less than one, and each in the last is strictly less than three. In particular the tight middle entry for $h=2$ is $18593/18600$.

To meet its disjoint-list condition, color the primes independently and uniformly with $h$ colors. The elementary symmetric sum equals $h^h/h!$ times the color expectation of the product of the $h$ color sums. Jensen applied to the squared norm, then the native moment uniformly over these disjoint color supports, pays only a constant depending on $\tau$. The raw prime height and real part vary on the original bounded or polynomial height ranges, and their derivatives are handled by Sobolev at fixed dyads before choosing the row frequencies. The bounded degree and the dyadic partition have the uniformity established in the marked density argument. The saving is at least $\alpha(r+B)-O(\tau)\ge L_0\alpha-O(\tau)$. Choosing the fixed meshes and $\tau$ small in terms of the requested loss proves the sixth-power-free estimate, including its boundary. [Native marked moment and height argument](short-inverse-marked-density.md)

## The full row shell

Write $u=u_0 v^6$, with $Nv\asymp U^\nu$ and $V\asymp U^{1-6\nu}$. At each fixed $v$ the tested inverse acquires only its actual coprimality mask. Write $L=9z\le L_0$, $H=1-6\nu$, $\nu_0=1/500$ and $H_0=1-6\nu_0$. First consider $\nu\ge\nu_0$. For cores above $U^{.01}$ the unmarked calculation gives the exponent
$$
 1-5\nu+\delta\{L-(1-6\nu)C(\delta)\},\qquad C(\delta)=10/(15-6\delta).
$$
For each fixed $0\le\delta\le3/4$ this decreases with $\nu$, since $\delta C(\delta)\le5/7$. Replace $\nu$ by $\nu_0$ and $L$ by $L_0$ before optimizing in $\delta$. The resulting upper bound is
$$
 1-5\nu_0+H_0 J(L_0/H_0)<1,\qquad
 H_0 J(L_0/H_0)=\frac{(\sqrt{15L_0}-\sqrt{10H_0})^2}{6}.
$$
Indeed $L_0/H_0>2/3$, and the positive rational $15L_0+10H_0-30\nu_0$ has square less than $600L_0H_0$. Small cores cost at most $U^{1/6+.01+(3/4)L+\epsilon}$ by the global inverse estimate, and the floor costs an arbitrarily small loss. [Unmarked core calculation](short-inverse-density.md#all-element-rows-and-the-power-comparison)

For $\nu<\nu_0$ one has $x=z/H\le(277/3348)/H_0<.085$, with strict room for the bounded annular constants. Apply the primitive estimate with the real order $k'=\min(9,L_0/x)$, taking $k'=9$ at $x=0$. Its bulk cost is $U^{H+\epsilon}$. Apply the global inverse squared bound $U^{3z/4+\epsilon}$ to the remaining power $9-k'$, giving exponent $(3/4)(L-HL_0)_+$ since $x=z/H$. After summing $O(U^\nu)$ choices of $v$, the total exponent is at most
$$
 \nu+H+\tfrac34(L-HL_0)_+ +\epsilon
 \le 1-5\nu+\tfrac34 L_0(6\nu)+\epsilon\le1+\epsilon .
$$
Fixed annular constants, the finite units and logarithmically many dyads fit the requested loss. This proves the full moment bound. [Exact comparisons](short_inverse.py)

Prepared with OpenAI Codex assistance.
