# A saturated ordinary sum forces a cluster of primitive zeros

The application to the proposed zero-free boundary assumes the preprint's 7/8 theorem and the marked estimates in tracker #143. This lemma concerns the same primitive Hecke function that supplies the ordinary witness. It gives an alternative counting problem on the critical rows.

Fix any $0<k\le 1/100$ independently of $U$ and put $c=1/40000$. In a critical buffered bin write $a=(1+\delta)/2$, where $.425\le\delta\le.4267$. On each surviving row of the [four-factor argument](four-factors.md), choose its **outer ordinary witness** and the zero $\rho_0$ used by that detector. For all sufficiently large $U$, with the preliminary losses chosen after $k$, there is a real $t$ such that the primitive function inducing that witness has at least $ck\log U$ zeros, counted with multiplicity, in

$$
 a-k<\Re\rho<a+2e,\qquad |\Im\rho-t|<6k/5.
$$

Here $e$ is the source's bin mesh, chosen at most $k/10000$. The height $t$ lies within $T_1/4$ of $\Im\rho_0$. With the smooth tests specified below, one can take $|t-\Im\rho_0|\le C(\log U)^2$ for a fixed $C$. For general fixed smooth tests and any fixed $\xi>0$, the weaker bound $|t-\Im\rho_0|\le U^\xi$ holds. All constants may depend on the fixed choices and arithmetic data. This statement counts multiplicities, so it makes no simplicity or spacing assumption. The proof uses only the outer ordinary witness of normalized length $U^y$ with $y>37/100$, its saturation and the physical bin bounds. [Preprint, buffered bins and actual presentations](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4222-L4376).

## Uniform upper bounds at the disk boundaries

Let $f=L(s,\psi^*)$ be the nonprincipal primitive function of the chosen presentation, and set $h_0=c/100$. Throughout the buffered height range the source gives $|f|,|1/f|\le U^{h_0k}$ on $\Re s\ge b=a+6e$ for sufficiently large $U$. Request the subpower exponent $h_0k/2$ to absorb the fixed constant. On the reflected border $l=1-a-6e$, the primitive functional equation and the same bound for the conjugate primitive character give $|f|\le U^{1.02(a-1/2)}$. Indeed the source charges at most $a-1/2+12e$ in the conductor exponent, plus arbitrarily small subpower and fixed polynomial height costs. Here $a-1/2\ge.425/2$, $12e\le12/10^6$, and the height exponent may be chosen small as in the physical source. The primitive strip growth bound throughout this bounded strip is polynomial in $U$ at the required heights. All these estimates hold for $|\Im s|\le(3i+2)T_1$. [Primitive growth and logarithmic control](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1435-L1609) · [Reflected estimate and height range](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4305-L4362).

For $|t|\le(3i+1)T_1$ put $z_0=a+k/5+it$. On its disk of radius $6k/5$ one has $|f|\le U^{.55k}$. Take the rectangle with vertical borders $l,b$ and horizontal borders $t\pm T_1/2$. Let $E$ be the real affine function interpolating the exponents on the vertical borders, extended affinely to complex arguments. The magnitude of its slope is at most $1.02(a-1/2)/(b-l)\le.51$. Apply the maximum principle to $f(s)U^{-E(s)}\exp((s-it)^2)$. The exponential is bounded on the vertical boundaries and suppresses the polynomial growth on the horizontal boundaries. On the part of the disk in the rectangle, $E(\Re s)\le h_0k+.51(k+6e)<.52k$, and removing the damping costs a fixed constant. Points to the right of $b$ have the stronger bound directly. This proves the disk bound. The smaller disk of radius $19k/100$ lies in the right-hand region since its left edge is $a+k/100>b$.

## Removing the zeros locally

Write $w=s-z_0$, $R=6k/5$, and include every zero $\alpha$ of $w\mapsto f(z_0+w)$ in the open disk $|w|<R$ with its multiplicity. The bin guard gives $|\alpha|\ge k/5-2e\ge.1998k$. Form the finite disk Blaschke product $B$ from the factors

$$
 b_\alpha(w)=\frac{|\alpha|}{\alpha}\frac{R(\alpha-w)}{R^2-\overline\alpha w}.
$$

The modulus is one on $|w|=R$, at most one inside, and greater than $1/150$ on $|w|\le 19k/100$. The last inequality follows from $R(|\alpha|-.19k)/(R^2+R\cdot.19k)\ge1.2(.1998-.19)/(1.44+1.2\cdot.19)$. Also $|b_\alpha(0)|>.16>1/7$. The quotient $f/B$ extends across the removed zeros and is zero-free in the open disk. Its modulus is at most $U^{.55k}$ by the boundary bound. Zeros exactly on the boundary do not affect the assertion about the open disk.

Suppose the number $N$ of these zeros is smaller than $ck\log U$. Take an analytic branch $g=\log(f/B)$ on the open disk, choosing $|\Im g(0)|\le\pi$. For sufficiently large $U$ we have $|g(0)|\le2.02ck\log U$ by the center bounds on $f$ and $B$, using $\log 7<2$ and $\pi\le .01ck\log U$. On $|w|\le19k/100$, $\Re g\le6.01ck\log U$ since $\log150<6$. Borel–Carathéodory on radii $57k/400,19k/100$ gives $\max_{57k/400}|g|\le51ck\log U$. The same inequality on $9k/10,6k/5$ gives $\max_{9k/10}|g|\le(7/2)k\log U$. In both applications the ratio of radii is $3/4$, giving coefficients $6$ on the upper real-part bound and $7$ on $|g(0)|$. For the outermost disk take radii below $R$ and pass to the limit. Here $\max_r$ means the maximum on the closed disk of radius $r$.

Hadamard's three-circles theorem at the intermediate radius $21k/80$ weights the inner bound with exponent

$$
 \lambda=\frac{\log((9/10)/(21/80))}{\log((9/10)/(57/400))}>2/3 .
$$

As $51c<7/2$, the resulting bound is at most $[(51c)^2(7/2)]^{1/3}k\log U<(k/50)\log U$. Since $|B|\le1$, this proves $|f(a-k/16+it)|\le U^{k/50}$ whenever the disk contains fewer than $ck\log U$ zeros. The deleted Euler factors in the original physical presentation cost at most another $U^{k/1000}$ after reducing the preliminary exponent. [Deleted Euler factors](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1603-L1619).

## Contradiction with the ordinary witness

The centrally normalized outer witness $S$ satisfies $|S|\gg U^{(a-1/2)y-k/1000}$ after the preliminary losses are reduced. Write its actual profile as a fixed smooth annular test times the compact real norm power and the original norm twist of height $h=\Im\rho_0-\nu$. Its first separation can be truncated to $|\nu|\le H$, where $H=\min(T_1/16,U^\xi/4)$, by increasing the order of the Fourier tail after $\tau,\xi$ are fixed. The initial tail has polynomially bounded unseparated lengths. In the ordinary block move the Mellin contour to $\Re s=a-k/16$ for the original $L$-argument. This shift is permitted on the entire line since the row is nonprincipal and has polynomial vertical growth. The part at added frequency greater than $H$ in absolute value is $O(U^{-2})$ after increasing the smooth tail order. The bounded real power stays with the test and only changes its Mellin transform by a bounded horizontal shift. With the convention for the witness in the source, the effective $L$-heights are $h+v$, $|v|\le H$ (reversing the integration variable gives the same interval). [Original Mellin arguments](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4414-L4498) · [Witness profiles](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4639-L4678).

If every disk at these heights has fewer than $ck\log U$ zeros, the Mellin integral with its uniformly bounded $L^1$ weight gives
$|S|\ll U^{(a-1/2)y-ky/16+21k/1000}+O(U^{-2})$.
This contradicts the lower bound since $y>37/100$. Some disk therefore contains the asserted number of primitive zeros. Its geometry gives the lower bound on their real parts, and the bin guard gives the upper bound. The proof works with multiplicities throughout.

## Polylogarithmic distance from the selected zero

The second detector permits a free choice of its dyadic windows and truncations. Choose them of Gevrey order two in the logarithmic norm variable. Concretely, $b(x)=e^{-1/x}$ for $x>0$ extended by zero for $x\le0$ satisfies $|b^{(j)}(x)|\le C^{j+1}(j!)^2$. Cauchy's estimate on $|z-x|=x/2$ bounds the derivative by $j!(2/x)^j e^{-c_0/x}$, whose maximum gives that inequality. Products, fixed dilations and integrals of the compact bump $b(x)b(1-x)$ produce the annular and transition tests. A difference of two translated smooth transitions gives a telescoping dyadic partition of unity. Nonnegative bumps and the interval on which each cutoff is one can be retained.

In the preprint's separation the test of the logarithmic product $v$ is a product of a compact annular cutoff, translates of fixed transitions, and $\exp[-(DN/Y_*)e^v]$. The last factor is bounded by one throughout $|\Im v|<\pi/4$ for every $DN/Y_*>0$, so it has uniform analytic derivative bounds. The Leibniz rule gives uniform logarithmic derivatives $\le C^{j+1}(j!)^2$ for the separating test, with support of fixed length. The same derivative bound holds for the outer ordinary Mellin test on the compact real strips used above, after multiplying by its bounded real norm power in logarithmic coordinates. Its imaginary norm power remains in the $L$-argument.

Integrating by parts $j$ times and taking $j$ proportional to $\sqrt{|v'|}$ with a sufficiently small constant gives Fourier tails $O(\exp[-c_1\sqrt{|v'|}])$ at frequency $v'$, also after integrating against any of the fixed polynomial growth weights. Thus $H=C_1(\log U)^2$ suffices in both the initial product separation and the final Mellin integral. Choose $C_1$ to dominate the finitely many absolute growth powers. This $H$ is eventually below $T_1/16$. The intermediate inverse factorization may retain its original cutoff, since its frequency does not enter the outer ordinary height. The fixed-profile marked estimates admit the chosen dyadic bumps. This proves the stated polylogarithmic bound. [Detector test and separation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4560-L4659).

Consequently all rows in this critical patch failing the cluster condition lie in the already counted exceptional set $O(U^{R_{\rm count}-10^{-7}})$. A count of the rows carrying such a cluster, with the original full-amplitude restrictions and the same exponent, would suffice for the remaining count. A first moment over the number of zeros divided by $ck\log U$ saves only a logarithm. Using the physical prime sums also gives a [prescribed-height cluster for a numerator ray twist](physical-prime-cluster.md). The inverse moment gives a separate count in disks [centered at the selected zero itself](selected-zero-cluster.md). The required power saving for cluster-bearing rows and the all-moduli endpoint remain open. [Rational guards](zero_clusters.py) · [Physical conjecture and return](../proposals/2026-11-17-local-continuum-return.md).

Kerr, Klurman and Thorner also relate large partial sums to local zero counts. In their Corollary 1.1 the required sum has size $x/N$, with $N$ bounded by a small power of $\log x$. Here the input has unnormalized size $x^{a-o(1)}$ with $a$ near $.713$, and the stated disk estimate uses the row's buffered control at $a+6e$. [Kerr, Klurman and Thorner](https://doi.org/10.1007/s00208-026-03542-1).

Prepared with substantial OpenAI Codex assistance.
