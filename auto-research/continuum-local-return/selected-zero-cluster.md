# A cluster centered on each selected zero

Assume the preprint's 7/8 theorem and the physical and inverse-moment inputs of tracker #143. Fix a critical physical amplitude class with $\delta\in[.425,.4267]$, $p\in[.49995,.5]$, original count exponent $R>.62567$, and $a=(1+\delta)/2$. Fix $0<d\le1/100$ and put
$$
 k=10^{-3},\quad K=k/d,\quad H=d/8,\quad D=KH^2/100=kd/6400,\quad c=10^{-200},\quad \eta=10^{-7}.
$$
Fix the allowed moment loss $\epsilon>0$ and choose the preliminary bin mesh $e<D/100$ and the height and source losses as below. The exceptional set has size $O_\epsilon(U^{.61525+\epsilon})$, hence $O(U^{R-\eta})$ upon choosing a sufficiently small loss. On each retained row every zero $\rho=\sigma+i\gamma$ of every admitted primitive presentation satisfying
$$
 a\le\sigma<a+e,\qquad |\gamma|\le3iT_1
$$
has at least $cd\log U$ zeros of that same primitive presentation in the open disk $|s-\rho|<d$, with multiplicity. In particular this disk is centered at the very zero selected by the buffered detector. The exceptional count is taken once on the original rows, independently of the choice of zero. The bin guard still places all these zeros to the left of $a+2e$. The statement supplies a necessary condition on the remaining rows; their count is open. [Buffered bin and original presentations](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4280-L4362) · [Previous ordinary-witness disks](zero-clusters.md)

## A fixed interval of inverse dyads

Write $T=\log U$, $y=.94$ and $X=U^y$. Fix a smooth annular dyadic partition of unity with bump $W$. On dyads of center $R_0=U^r$, $.91\le r\le .97$, discard the rows on which the centrally normalized inverse sum with this bump and an allowed norm height exceeds $U^{(a-1/2)r-.001}$ in magnitude. The unmarked inverse second moment costs $U^{1+\epsilon}$ in this length range, including the rowwise height supremum by the usual Sobolev argument and its fixed polynomial price. The finite presentations, logarithmically many dyads and the height cost fit in a freely chosen $U^\epsilon$. The exceptional count is thus at most $U^{1-.425(.91)+.002+\epsilon}=U^{.61525+\epsilon}$, well below $U^{R-\eta}$. One may allow $|t|\le(3i+1)T_1$ in this test, with the same fixed height accounting. On a surviving row, a multiplier $x^{-b}$ on the supported annulus, for $b$ in any fixed compact real interval, preserves this bound up to a constant and negligible tails at heights $|t|\le(3i+1/2)T_1$. Indeed multiply $x^{-b}$ by an auxiliary smooth compact cutoff identically one on the bump's support and Fourier invert in $\log x$. Its transform has uniformly bounded $L^1$ norm. Beyond added height $T_1/4$ choose the fixed tail order after the height exponent to absorb the trivial dyadic bound. All these estimates apply to the original inverse coefficients $\mu(\mathfrak n)\psi(\mathfrak n)$ with their literal zeros. [Unmarked inverse interval and uniform height control](long-blocks.md#counting-one-factor) · [Inverse moment](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12343-L12469)

Fix such a row, an admitted presentation $f=L_{\rm orig}(s,\psi)$, and a zero $\rho$ as in the assertion. In the whole disk, $\Re s>1/2$, so the deleted Euler factors have no zeros there. Its primitive and original multiplicities coincide. Throughout the closed disk one has $|f|\le U^d$ for sufficiently large $U$. Indeed its left edge is at or to the right of $a-d$. Interpolation on the buffered strip has affine exponent of slope of magnitude at most $.51$, rising leftwards from $a+6e$; $.51(d+6e)<.52d$. Choose the subpower and height losses, including the original Euler deletions, small compared with $d$. Points to the right of that boundary have the stronger bound directly. The buffer gives $|f|,|1/f|\ll U^{\epsilon_1}$ for $\Re s\ge a+6e$ at heights $|\Im s|\le(3i+2)T_1$ with any prescribed $\epsilon_1>0$. Choose the preliminary exponent small enough to have both bounds $\le U^{cd}$ there. [Local growth and subpower input](zero-clusters.md#uniform-upper-bounds-at-the-disk-boundaries) · [Deleted Euler factors](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1603-L1619)

## Removing all local poles except one

Suppose the disk contains $N<cdT$ zeros. Write $w=(s-\rho)/d$ and their coordinates as $w_1=0,w_2,\ldots,w_N$, repeating multiplicities even at zero. Define
$$
 F(w)=\frac{f(\rho+dw)}{\prod_{j=1}^N(w-w_j)},\qquad
 P(z)=\prod_{j=2}^N(z/d-w_j).
$$
The quotient $F$ is analytic and nonvanishing on the open unit disk. Removing the disk Blaschke product shows $|F(w)|\le U^d4^N$ on $|w|\le3/4$. The Blaschke quotient has maximum modulus at most $U^d$ on the full disk, and $|1-\overline{w_j}w|\ge1/4$ on the indicated subdisk. Boundary zeros may stay in the numerator. Thus $\log|F|\le3dT$ there. On $|w-1/4|\le1/8$ all $|w-w_j|$ lie in $[1/10,2]$ by $\Re w_j<2e/d$, and $\Re(\rho+dw)>a+6e$. Consequently $|\log|F||\le4cdT$ there.

Choose an analytic logarithm $g=\log F$ with $|\Im g(1/4)|\le\pi$. For large $U$, $|g(1/4)|\le5cdT$. On concentric disks about $1/4$, Borel–Carathéodory with radii $(1/16,1/8)$ gives $\max_{1/16}|g|\le23cdT$. With radii $(7/16,1/2)$ it gives $\max_{7/16}|g|\le43dT$. Hadamard's three-circles theorem on radius $3/8$ gives the inner bound weight $\log(7/6)/\log7>1/16$, since $\log(7/6)\ge1/7$ and $\log7<2$. In particular
$$
 \max_{|w-1/4|\le3/8}|g(w)|\le43d(23c)^{1/16}T<(D/100)T .
$$
This bounds $F$ and its reciprocal even if the original zeros have arbitrarily small spacings.

## A Gaussian test for the reciprocal

On the absolute line form
$$
 I=\frac{1}{2\pi i}\int_{\Re z=2-\sigma}
       \frac{P(z)}{f(\rho+z)}\exp\big(T(yz+Kz^2)\big)\,dz .
$$
To record the cost of the degree of $P$, for real $u,t$ one has
$$
 |P(u+it)|\le(1+|u|/d)^N e^{N|t|/d}.
$$
The Gaussian absorbs the last factor since $N/T<cd$ and $c|t|\le Kt^2/2+c^2d/(2k)$. In particular on $u=D$ the extra exponent outside that half Gaussian is at most $cd\log(1+D/d)+c^2d/(2k)<D/1000$.

Move the contour for $|\Im z|\le T_1/4$ to $\Re z=D$. The joins stay in the zero-free buffered region because $\sigma+D>a+6e$. The Gaussian makes the joins and remaining absolute-line tails negligible to any fixed power. More explicitly, at height $t$ there the extra polynomial costs at most $\exp(O_d(cdT)+cT|t|)$ and the Gaussian supplies $\exp(-KTt^2)$; the bounded real range and $X$ cost a fixed $U$-power. On the new line discard $H\le|\Im z|\le T_1/4$. Using the buffer there, the exponent of this integral is at most
$$
 yD+KD^2-KH^2/2+cd\log(1+D/d)+c^2d/(2k)+cd+o(1)<-2D .
$$
The Gaussian tail integral has this exponent, for instance by the elementary bound $\int_H^\infty e^{-KTt^2/2}dt\le e^{-KTH^2/2}/(KTH)$.

Move the remaining local segment left to $\Re z=-D$. The local rectangle satisfies $|z/d-1/4|<3/8$ since $H/d=1/8$ and $D/d<1/100$. On it $P(z)/f(\rho+z)=1/[(z/d)F(z/d)]$. There is exactly one pole after cancellation, with residue $d/F(0)$, regardless of the original multiplicity. The two horizontal joins have exponent at most $yD+KD^2-KH^2+D/100$, and the left edge has exponent at most $-yD+KD^2+D/100$. The fixed factors $d/D$ and $d/H$ are harmless. Both exponents are below $-D/2$. The residue has modulus at least $d U^{-D/100}$; hence for all sufficiently large $U$,
$$
 |I|\ge (d/2)U^{-D/100}.                                      \tag{1}
$$

## Opening the same test in inverse coefficients

Expanding the original reciprocal on the absolute line gives
$$
 I=\sum_{\mathfrak n}\mu(\mathfrak n)\psi(\mathfrak n)
       (N\mathfrak n)^{-\rho}\,k_U(r_{\mathfrak n}),\qquad
 r_{\mathfrak n}=\log_U N\mathfrak n ,
$$
where $k_U(r)$ is the inverse integral of $P(z)\exp(T((y-r)z+Kz^2))$. This integrand is entire. On its saddle line $u=(r-y)/(2K)$ the Gaussian gives $U^{-(r-y)^2/(4K)}e^{-KTt^2}$. The polynomial's extra exponent after integrating the Gaussian is at most $cd\log(1+|r-y|/(2k))+c^2d/(2k)$. Use $\log(1+v)\le v$ and $c|r-y|/(2k)\le(r-y)^2/(8k)+c^2/(2k)$ to get the uniform bound
$$
 |k_U(r)|\ll_K U^{-d(r-y)^2/(8k)+c^2d/k}.
$$
When $|r-y|\ge .025$ the saving in the quadratic term is at least $.078125d$. This estimate also applies after taking absolute values in the saddle integral.

Set $C(d)=100(1+K)$. An ideal on any omitted dyad of center exponent $r>C(d)$ has $r_{\mathfrak n}\ge50(1+K)$ for large $U$. Here $r_{\mathfrak n}-y\ge.98r_{\mathfrak n}$, so $(r_{\mathfrak n}-y)^2/(8K)>6r_{\mathfrak n}$. The preceding estimate at $r_{\mathfrak n}$ is consequently $O(U^{-4}(N\mathfrak n)^{-2})$. Inserting the fixed annular partition and omitting these dyads costs $O(U^{-4})$ by convergent ideal counting.

For every other center $R_0=U^r$, $0\le r\le C(d)$, use the **common** saddle $u=(r-y)/(2K)$ for all ideals of that dyad in the entire kernel. One may begin the partition at the unit dyad. Writing $x=N\mathfrak n/R_0$, the resulting integral has scalar modulus, up to a constant,
$$
 U^{(1/2-\sigma)r-(r-y)^2/(4K)}e^{-KTt^2}|P(u+it)|
$$
times the modulus of the centrally normalized inverse dyad with original character, fixed bump $W(x)$, real multiplier $x^{-\sigma-u}$ and height $\gamma+t$. The common phases have modulus one. Throughout this range $|u|\le (1+C(d))/(2K)$ is bounded for fixed $d$. For $|t|>T_1/4$ the trivial bound for the dyad of length at most $U^{C(d)}$ and the Gaussian estimate give a negligible error, uniformly in the data.

For $|t|\le T_1/4$, the dyads with $.91\le r\le.97$ satisfy the saved inverse bound from the row selection, so their total is $\ll U^{-.001+c^2d/k+o(1)}$. On **all other dyads up to $C(d)$**, use the ordinary buffered pointwise estimate for the inverse. For any fixed $\epsilon_0>0$ it bounds a normalized dyad by $O(U^{(a-1/2)r+\epsilon_0})$ on this entire fixed length range, with bounded real powers. Choose $\epsilon_0\le d/1000$, and choose the initial mesh below the threshold required by the pointwise estimate for that range. Concretely its contour at $a+6e$ charges at most $6eC(d)$ beyond the baseline power; take $6eC(d)<\epsilon_0/4$ and ask for sufficiently small subpower and height losses. The original height is $|\gamma+t|\le(3i+1/4)T_1$. The extra Mellin frequencies for this pointwise argument can be cut at $T_1/4$, and its remaining tails on the absolute line are negligible by a fixed derivative order chosen after the positive height exponent. This use is independent of the earlier contour expansion. [Buffered pointwise inverse on bounded length ranges](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4388-L4466)

Since $\sigma\ge a$ and $|r-y|\ge .025$ outside the saved window, these remaining dyads total $\ll U^{-.078125d+d/1000+c^2d/k+o(1)}$ after the Gaussian bound. The number of dyads is $O_d(\log U)$. Both exponents are strictly below $-D/100$, contradicting (1). The row dependence of the polynomial canceling the zeros occurs only in the scalar Fourier weight; the source sees the fixed bump and bounded real and height parameters. This proves the linear lower count $cd\log U$ at every selected zero.

## Companions in disjoint annuli about the same zero

Put $r=cd/40$. It satisfies $0<r<d/2$ since $c=10^{-200}$. Further require $e<r/100$ and reduce the preliminary subpower and height losses so their combined boundary contribution is below $.01r$. Center a disk of radius $4r$ at $z_*=\rho+2r$. The disk $|s-\rho|<r$ lies inside $|s-z_*|<3r$. On the outer disk the real part is at least $a-2r$. The buffered reflected-strip interpolation and Euler deletion bound again give $\log|f|\le2r\log U$ throughout: the distance left of $a+6e$ is at most $2r+6e$, and the magnitude of the affine slope is at most $.51$. At the center the reciprocal subpower bound gives $\log|f(z_*)|\ge-.01r\log U$ since $\Re z_*>a+6e$. Jensen's formula bounds the number of primitive zeros in $|s-\rho|<r$ by
$$
 \frac{2.01r}{\log(4/3)}\log U<9r\log U<(cd/4)\log U .
$$
Here $\log(4/3)\ge1/4$, and radii below $4r$ followed by a limit handle zeros on the outer circle. This upper bound uses the buffered bin alone. [Reflected-strip slope and height guard](zero-clusters.md#uniform-upper-bounds-at-the-disk-boundaries)

Subtracting from the outer count gives at least $(3cd/4)\log U$ companions, counted with multiplicity, in $cd/40\le |s-\rho|<d$ on precisely the same surviving rows. Their locations differ from $\rho$, regardless of its multiplicity. For any prescribed positive integer $j_0$, set $d_1=d$ and $d_{j+1}=cd_j/80$ for $j<j_0$. The annuli are disjoint since the next outer radius is half the preceding inner radius. Fix this finite list before choosing the mesh, height order, source losses and the lower threshold on $U$. The inverse exceptional set uses the same dyadic window and fixed bump at every step. For every selected zero on a surviving row, each of these annuli about that center therefore contains at least $(3cd_j/4)\log U$ zeros of the same presentation. For sufficiently large $U$ these give at least $j_0$ distinct locations different from the center. The constants and threshold for $U$ depend on $j_0$ and the prescribed radii.

## A packet with arbitrarily small real-part depth relative to its radius

Fix any $0<\theta\le1$, and start the preceding sequence at any fixed $0<d_1\le1/100$. Take
$$
 m=1+\left\lceil\frac{16000}{c\theta}\right\rceil .
$$
First fix $d_1,\ldots,d_m$, and only then choose the mesh below all the preceding thresholds as well as $\min(\theta d_m/100,cd_m/1000)$. For each selected zero on any surviving row, **some** $d_j$ in this fixed list satisfies
$$
 \#\{\beta+i\gamma' : cd_j/40\le |\beta+i\gamma'-\rho|<d_j,\quad
           a-\theta d_j<\beta<a+2e\}\ \ge\ (cd_j/2)\log U .
$$
These zeros belong to the same primitive presentation and are counted with multiplicity. The index can depend on the zero. If $\theta\le c/100$, at least $(cd_j/4)\log U$ of them lie on one side of $\gamma$ at distances $cd_j/50<|\gamma'-\gamma|<d_j$ in ordinate. Thus a packet with real-part depth an arbitrarily small fixed fraction of its radius occurs without any extra exceptional set.

To bound the zeros that lie farther left, put $s_*=a+8e+i\gamma$, $z_0=2+i\gamma$, and $R_*=7/4$. On $|s-z_0|\le15/8$, the strip bound, absolute Euler convergence to the right, and the original deletion bound give $|f|\le U^2$ at the buffered heights for large $U$. This disk stays in $\Re s\ge1/8$. The Euler product at $z_0$ gives $|f(z_0)|^{\pm1}\ll1$ uniformly. Jensen on the radii $7/4,15/8$ gives at most $45\log U$ zeros in the open smaller disk, since $\log(15/14)\ge1/15$. There are no deleted-factor zeros in either disk. Every zero in the smaller disk has $\beta<a+2e$: those with $\beta\ge.51$ satisfy the buffered upper guard, and the rest satisfy this bound immediately.

Remove those zeros by the radius-$R_*$ disk Blaschke product centered at $z_0$. Write $G$ for the zero-free quotient. It has $|G|\le U^2$, and at the center $|G(z_0)|\ge |f(z_0)|\gg1$. Choose its logarithm with imaginary part of modulus at most $\pi$ there. Borel–Carathéodory on radii $3/2,7/4$ gives $|\log G|\le63\log U$ on the $3/2$ disk (coefficients $12$ and $13$). Since $|s_*-z_0|<1.3$, Cauchy's inequality gives $|G'/G(s_*)|\le315\log U$. For each removed zero $\alpha=\rho'-z_0$ in centered coordinates its Blaschke logarithmic derivative is
$$
 \frac1{s_* -\rho'}+\frac{\overline\alpha}{R_*^2-\overline\alpha(s_*-z_0)} .
$$
The second term has magnitude at most $1/(R_*-1.3)<3$. Finally $|f'/f(s_*)|\le\log U$: on the disk of radius $e$ about $s_*$ use the buffered bounds $|f|,|1/f|\le U^{e/100}$ by a further prescribed choice of subpower. Borel–Carathéodory on its half radius followed by Cauchy at its center bounds the derivative by $(16/100)\log U$ for large $U$. These fixed-height neighborhoods all fit in the original buffer. The decomposition and positivity of each real summand now give the uniform budget
$$
 0\le\sum_{|\rho'-z_0|<R_*}
    \frac{a+8e-\Re\rho'}{|s_* -\rho'|^2}
 \le(1+315+3\cdot45)\log U<1000\log U .
$$
This local argument needs no information about zeros at ordinates beyond that buffer. [Original primitive growth and deleted Euler products](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1423-L1619)

Every annulus about $\rho$ above lies in this sum. A zero there with real part at most $a-\theta d_j$ contributes at least $\theta/(4d_j)$, since $|s_*-\rho'|\le d_j+8e<2d_j$. If every annulus contained at least $(cd_j/4)\log U$ such zeros, their disjoint union would cost at least $(mc\theta/16)\log U>1000\log U$. At some index fewer than this many are deep. Subtract them from the annular lower bound to get the claim. For $\theta\le c/100$, each of the remaining zeros differs from $\rho$ in real part by at most $\theta d_j+2e\le .012cd_j$; its distance from $\rho$ is at least $.025cd_j$. The ordinate separation follows from $.025^2-.012^2>.02^2$ and subdivision by the sign of $\gamma'-\gamma$.

For any prescribed positive integer $q_0$, take $0<\theta\le c/(1000q_0)$ before fixing the finite list. In the one-sided shallow packet put $r_0=cd_j/(1000q_0)$, so its centers have $\Re\rho'\ge a-r_0$, its total real-part width is less than $1.02r_0$, and $e<r_0/100$. At each such center the shifted Jensen argument gives fewer than $9R'\log U$ zeros within distance $R'$ for either $R'=r_0$ or $R'=2r_0$. Indeed the circle of radius $4R'$ about $\rho'+2R'$ lies to the right of $a-3R'$, and the exponent $.51(3R'+6e)$ and retained losses are less than $2R'$. The center of this circle lies to the right of $a+6e$, where the reciprocal costs less than $U^{.01R'}$. The fixed displacement of its ordinate fits in the same buffered heights. Jensen now applies with the same radii ratio $4/3$.

Choose a zero of this packet and erase all packet zeros at distance less than $2r_0$, repeating on the remaining points. Fewer than $18q_0 r_0\log U< (cd_j/4)\log U$ zeros, counted with multiplicity, are removed in $q_0$ steps. This yields $q_0$ distinct locations on the same ordinate side of the selected zero. Their pairwise distances are at least $2r_0$, and their ordinates differ pairwise by more than $r_0$ since $4-(1.02)^2>1$. This is a statement for each fixed $q_0$, with the above parameter order.

The conclusion controls the number of zeros with multiplicity and their real-part depth. The divided-difference condition also depends on the phases $\exp(iB\gamma'\log U)$ for the detector length $B$. For example, distinct points on the vertical line $\Re s=a$ with successive ordinate gaps $2\pi/(B\log U)$ have linear density in every fixed interval. Their scaled nodes $z_j$ have constant $e^{Bz_j}$. For every packet of at least two such points, interpolation of the constant polynomial gives $\sum_j e^{Bz_j}/\prod_{k\ne j}(z_j-z_k)=0$. This configuration of points illustrates the phase requirement left open for actual Hecke zeros. All radii, including the smallest one, remain fixed before taking $U$ large. [Divided-difference criterion](detector-spacing.md) · [Exact numerical comparisons](zero_clusters.py)

Prepared with OpenAI Codex assistance.
