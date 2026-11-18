# Locating a cluster from the physical prime frequency

Assume the 7/8 theorem and the physical analytic inputs of the [local return](../proposals/2026-11-17-local-continuum-return.md). Fix one external tuple in a retained full prime-amplitude bin on $P$. Let $t_{\rm p}=-\Im z_{\rm phys}$, common to every row in this sum, and let $a=(1+\delta)/2$. For any fixed $\xi>0$, outside $O(U^{R-10^{-7}})$ rows, some character of the form $\theta\overline{\chi_\bullet(u)}$, $\theta\in\widehat T$, has a primitive inducing function with at least $10^{-8}\log U$ zeros, counted with multiplicity, satisfying

$$
 a-1/100<\Re\rho<a+2e,\qquad |\Im\rho-t|<3/250
$$

for some $|t-t_{\rm p}|\le U^\xi$. If the actual physical prime windows are chosen of Gevrey order two in the logarithmic norm variable, the last bound improves to $C(\log U)^2$. The detector tests can always be so chosen. The latter conclusion is stated for physical windows with this regularity. The finite ray label and $t$ may vary by row. Only the center $t_{\rm p}$ of the search is common. Here $R$ is the original #143 count exponent in the bin. This gives a counting problem at a prescribed external height and for numerator ray twists. [Physical prime sets](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6868-L6883) · [Amplitude, ray expansion, and height convention](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L14995-L15094).

## A zero near the external height

At least one positive width slot has $g_j\ge q=\delta p$. Its original normalized prime sum has magnitude at least $P_j^{g_j}$ and
$g_j\ge a-1/2-.4267(.00005)$. Expand the indicator of $1_T$ by characters of the fixed finite group. Each resulting character has the stated form and the literal zero extension of the physical symbol. Uniformly on this bin, at least one of their primitive functions has a zero $\rho_1=\sigma+i\gamma_1$ with

$$
 \sigma>a-d,\qquad |\gamma_1-t_{\rm p}|\le H+2,\qquad d=1/40000.
$$

For general smooth windows take $H=\min(T_1/100,U^\xi/10)$. For Gevrey windows one can use $H=C_1(\log U)^2$. To prove the assertion, suppose none has a zero in that rectangle (including its vertical height edges). On $\Re s=a-.000024$ and at heights within $H$ of $t_{\rm p}$ the logarithmic derivatives are $O(\log U)$. Indeed the disks centered at $2+i\Im s$ with left edge $a-d$ are zero-free and have radii less than $3/2$. The target line is a fixed $10^{-6}$ to the right of the disk edge. The primitive growth bound, Euler logarithm near the center, Borel–Carathéodory and Cauchy's estimate give the derivative bound on the smaller disk. Zeros exactly on the left boundary cause no problem in the open disk. The finite removed Euler factors also have logarithmic derivative $O(\log U)$ on this line.

Apply Mellin inversion to each corresponding von Mangoldt sum with the annular weight divided by $\log(P_j x)$. Move the truncated contour and bound the horizontal joins inside the same zero-free disks. The prime power terms cost $P_j^{o(1)}$ after central normalization, and omitting the fixed set $S$ respects the original presentation. This gives an upper bound $P_j^{a-1/2-.000024+o(1)}$ for all these prime sums, contradicting the slot lower bound since $.4267(.00005)<.000024$. All slot widths are positive and fixed before taking $U$ large. Thus logarithms of $U$ and fixed constants can be absorbed in the slot exponent. For smooth windows the omitted absolute-line tails and horizontal joins are controlled to arbitrary negative $U$-power by choosing the derivative order after $\xi,\tau$. For Gevrey windows, division by $\log(P_j x)$ has uniform analytic derivative bounds on the fixed log-annulus for large $P_j$. The Fourier-tail argument of [the local disk lemma](zero-clusters.md) applies also at the joins, with the actual physical frequency kept in the $L$-argument.

## Using the externally located zero in the longer detector

The common retained height allocation bounds $|t_{\rm p}|$ by $T_1/2$. The zero just found lies inside the bin guard, and its inducing character is nonprincipal at these growing physical conductors. Use it in the actual two-factor zero detector with cutoff $2.159$. Its imaginary part leaves ample height for the outer separation, the inner factorization and the later pointwise estimates. The global buffered bin and the original full prime amplitude $q$ are retained. [Detector proof](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4548-L4679) · [Cumulative external height budget](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6061-L6083).

For the resulting inverse length $r$ and ordinary length $y$ the support gives $r+y\ge2.159-O(1/\log U)$ and $r\le2.159+O(1/\log U)$. In the product lower bound the exponent is $2\sigma-1\ge\delta-2d$. All preliminary losses other than this explicit debit may be taken arbitrarily small. Comparing the product to the usual pointwise upper bounds gives, for $y>1/2$,
$2(\delta-d)y\le\delta+2dr+\epsilon$ for a prescribed arbitrarily small $\epsilon$. Thus $y<.501$ and $r+y<2.7$ eventually. Both squared factors individually retain exponent $\delta$ times their length with a debit at most $2d\cdot2.7+\epsilon<.000136$. These statements use the bin pointwise bounds for the actual presentation. Requiring $\sigma>.51$ for the Gamma shift holds with ample room.

Apply the [coarse single-factor counts](long-blocks.md). If $r\ge1.96$, its original block admits the exact smooth three-factor decomposition of that proof, and each new squared factor inherits the same debit $.000136$ after requesting the preliminary errors sufficiently small. The debit is paid once in the original product and dividing by pointwise upper bounds adds only freely chosen losses. A fourth moment charges it at most twice. The same maximum charge works when the outer ordinary has $y\ge.4398$. The original moment margins are all greater than $.001$ and reserve $.0005$ already suffices for ancillary losses. Thus both discarded classes have count $O(U^{R-10^{-7}})$. On the surviving rows $r<1.96$ implies $y>.198$, and the outer ordinary magnitude is $\gg U^{(a-1/2)y-.000070}$.

## Cluster at the physical frequency

Apply the proof of the [disk lemma](zero-clusters.md) to this specific ordinary witness at $k=.01$, with the candidate zero-density coefficient decreased to $c'=10^{-6}$. The proof on a sparse disk then gives
$\log|L(s,\psi^*)|\le[(51c')^2(7/2)]^{1/3}k\log U<.0021k\log U$ on $\Re s=a-k/16$. Request the smaller right-hand subpower bound $U^{c'k/100}$ at the start. Including the deletions costs another $.001k$ in the exponent. For $y>.198$ this contour saves more than $.198k/16-(.0021+.001)k>.000070$ in the normalized magnitude. This contradicts the weak ordinary spike if every disk in its retained Mellin range is sparse. Hence one disk contains at least $c'k\log U=10^{-8}\log U$ zeros, with the asserted real and imaginary parts. The first prime search, the outer detector separation and the final ordinary Mellin integral each cost at most $H$ (with a fixed increase of $C_1$ if needed). Finite support buffers fit inside the stated distance.

All numerical comparisons in this argument have [a rational replay](zero_clusters.py). The remaining estimate must count these physical rows uniformly in $t_{\rm p}$, with all the original prime-amplitude restrictions. A zero count summed over arbitrary ordinates or merely divided by the cluster size gives no power gain by itself. The all-moduli endpoint remains open.

Prepared with substantial OpenAI Codex assistance.
