# A diagonal-order eighteenth moment through log length 50/621

Assume the preprint’s $7/8$ theorem and its inverse and ordinary moment inputs. For a genuine centrally normalized smooth Möbius polynomial $M_u(U^z)$ of a fixed admissible Eisenstein sextic presentation, one has
$$
 \sum_{0<Nu\asymp U}|M_u(U^z)|^{18}\ll_\epsilon U^{1+\epsilon},
 \qquad 0\le z\le 50/621 .
$$
The sum includes every element row and its original nonunit zeros. A common Euler omission of polynomial norm is allowed. The estimate permits the norm-height and bounded real powers in the original test, with their stipulated height cost. The previous density bound gave this exponent through $z=2/27$. At the physical length $.0974<z<.09862$ the available bound is larger. [Mixed inverse moment](inverse-composite-mark.md) · [Earlier density estimate](short-inverse-density.md) · [Estimate at the physical length](short-inverse-marked-density.md)

## The sixth-power-free estimate

Use $V$ for the sixth-power-free row scale and $x$ for the length exponent of the tested inverse. For $0<x\le1/8$ the same reasoning proves
$$
 \sum_{Nu_0\asymp V}^{(6)} |M_{u_0}(V^x)|^{2k}\ll_\epsilon V^{1+\epsilon}
 \quad\text{if}\quad 0< k\le9,\qquad kx\le L_0=50/69.
$$
Here $k$ may be real. Uniformity for very small $x$ follows first by the trivial ideal count when $9x$ is below the requested power loss. On the remaining compact range fix all pointwise losses and the floor bin width sufficiently small after that split. The finitely many principal inducing rows can be bounded directly with the global inverse estimate of squared slope at most $3/4+\epsilon$. Its total exponent is at most $(3/4)L_0+\epsilon$. The near-$1/2$ floor likewise costs at most a prescribed extra power on top of the row count. For every nonfloor bin define $\delta=2a-1$ using the maximum real part of the primitive zeros in the original buffered height range. The normalized squared magnitude of the tested inverse has upper bound $V^{\delta x+\epsilon_1}$ even with the common omissions. [Buffered count and treatment of the floor](short-inverse-density.md#the-unmarked-dynamic-count)

Take a finite mesh in the squared amplitude slope. On each bin one may assume that the tested inverse has squared magnitude between $V^{\alpha x}$ and $V^{\alpha x+O(\epsilon_1)}$, with $0<\alpha\le\delta$. The initial bin of magnitudes below a prescribed tiny power of $V$ costs the allowed loss directly. Slope and moment errors in the other bins can be made arbitrarily small on the retained compact length range. A row count with exponent $1-L_0\alpha+O(\epsilon_1)$ then suffices. At the bin’s detected zero run the preprint’s unmarked detector with cutoff $t=1$. It supplies an inverse witness of width $0\le r\le1+o(1)$ and an ordinary witness of width at least $1-r-o(1)$. Their squared slopes are at least $\delta$ up to arbitrarily small exponent losses. The unmarked inverse second moment and the ordinary fourth moment therefore give respective savings $\delta r$ and $2\delta(1-r)$. In particular the desired count already holds if $r\ge L_0$ or $r\le1-L_0/2=44/69$. [Detector and unmarked moment inputs](short-inverse-density.md#the-unmarked-dynamic-count)

Consider $44/69\le r\le50/69$ and sufficiently small fixed $\tau>0$. A large value of the tested inverse forces a prime sum. Take the truncated Euler product through the upper support of $V^x$ on the line $\sigma_0=(1+\alpha-\tau)/2$. Slopes $\alpha\le2\tau$ already fit the power error. On the other bins $\sigma_0>1/2$ by a fixed amount, and the left edge saves $\tau x/2$ in the exponent relative to the observed inverse. The contour proof gives a good-prime dyad $P>(\log V)^2$ with raw magnitude at least $cP^{\sigma_0}\log V/(1+\log P)^2$ and width $b=\log_V P\le1/8+o(1)$. The constant may depend on the fixed lower bound on $x$ and on the mesh. The tested inverse and the detector may have different fixed presentations. Conjugating the whole prime sum when needed preserves its modulus, and the finite ray difference goes into its row-independent coefficients. [Prime extraction and products of distinct primes](short-inverse-primes.md)

If $b<\tau$, any fixed requested width $w$ bounded away from zero in this argument can be attained up to $O(\tau)$. Take $h=\lfloor(w-2\tau)\log V/\log(2P)\rfloor$. The elementary symmetric sum over $h$ distinct primes gives one bounded-coefficient polynomial at actual width in $[w-3\tau-o(1),w-2\tau+o(1)]$ with normalized squared magnitude at least $V^{\alpha w-O(\tau)-o(1)}$. Two different choices of $w$ may be used on the same row. Apply the two mixed moments at the following widths. [Mixed moment bounds and their common profile and height controls](inverse-composite-mark.md)

* With the detector inverse choose $w_I=(1-r)/5$. The resulting count saves at least $\alpha[r+w_I]-O(\tau)$, with $r+w_I=(1+4r)/5$.
* Write $m$ for the actual ordinary witness width. If $2m\ge L_0$ the unmarked fourth moment suffices. Otherwise choose $w_O=(5/6-2m)/4$ with two copies of that witness. Here $2m\ge2(1-r)-o(1)>1/6$. Thus $2m+5w_O<1$, and rounding the mark down gives fixed slack in $2m+4w\le5/6$. The saving is at least $\alpha[2m+w_O]-O(\tau)$, where $2m+w_O=3m/2+5/24\ge41/24-3r/2-o(1)$.

The increasing inverse expression and the decreasing ordinary expression intersect at $r=181/276$, where both equal $50/69$. Their maximum gives the claimed count.

If $b\ge\tau$ and $r<L_0$, use $h=\lceil(L_0-r)/b\rceil$ separate prime factors with the inverse witness. This $h$ is bounded independently of $V$. Their combined nominal width $B=hb$ is at least $L_0-r$ and at most $\max(1/8+o(1),2(L_0-r))$. Their native moment has fixed slack, since throughout the interval
$$
 r+2B\le\max(50/69+1/4,68/69)+o(1)<1,\qquad
 2r+8B\le\max(100/69+1,184/69)+o(1)<3.
$$
To meet its disjoint-list condition, color the primes independently and uniformly with $h$ colors. The elementary symmetric sum equals $h^h/h!$ times the color expectation of the product of the $h$ color sums. Jensen applied to the squared norm, then the native moment uniformly over these disjoint color supports, pays only a constant depending on $\tau$. The raw prime height and real part vary on the original bounded or polynomial height ranges, and their derivatives are handled by Sobolev at fixed dyads before choosing the row frequencies. The bounded degree and the dyadic partition have the uniformity established in the marked density argument. The saving is at least $\alpha(r+B)-O(\tau)\ge L_0\alpha-O(\tau)$. Choosing the fixed meshes and $\tau$ small in terms of the requested loss proves the sixth-power-free estimate, including its boundary. [Native marked moment and height argument](short-inverse-marked-density.md)

## The full row shell

Write $u=u_0 v^6$, with $Nv\asymp U^\nu$ and $V\asymp U^{1-6\nu}$. At each fixed $v$ the tested inverse acquires only its actual coprimality mask. Put $L=9z\le L_0$ and $H=1-6\nu$. First consider $\nu\ge1/200$. For cores above $U^{.01}$ the earlier unmarked calculation gives the exponent
$$
 1+\delta(L-C(\delta))+\nu(1-6R_0(\delta)),
 \qquad C(\delta)=10/(15-6\delta),\quad R_0(\delta)=1-\delta C(\delta).
$$
Its derivation directly counts the core and bounds the tested factors at their original scales. Since $R_0\ge2/7$, this is at most $1+J(L_0)-5\nu/7\le1$, where $J(l)=(\sqrt{15l}-\sqrt{10})^2/6$ for $l\ge2/3$ and $J(L_0)<(5/7)/200$. Small cores cost at most $U^{1/6+.01+(3/4)L+\epsilon}$ by the global inverse bound, and the floor costs an arbitrarily small loss. [Unmarked core calculation](short-inverse-density.md#all-element-rows-and-the-power-comparison)

For $\nu<1/200$ one has $x=z/H\le(50/621)/(1-6/200)<1/8$. Apply the primitive estimate with $k'=\min(9,L_0/x)$, taking $k'=9$ at $x=0$. Bound the residual power using the global inverse pointwise estimate, which has squared slope at most $3/4$ under the $7/8$ theorem. After summing the $O(U^\nu)$ choices of $v$, the exponent is at most
$$
 \nu+H+\tfrac34(L-HL_0)_+ +\epsilon
 \le 1-5\nu+\tfrac34 L_0(6\nu)+\epsilon\le1+\epsilon.
$$
Fixed annular constants, the finite units and logarithmically many dyads fit the requested loss. This proves the full moment bound. [Exact comparisons](short_inverse.py)

Prepared with OpenAI Codex assistance.
