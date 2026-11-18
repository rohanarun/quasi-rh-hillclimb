# Zeros of the numerator on the remaining coefficient scales

Assume the preprint's 7/8 theorem and the physical inputs of tracker #143. In the critical class of the [central-value reduction](central-values.md), all contributions except a portion already satisfying the required saving come from rows with the following property. The primitive function $f=L(s,\psi_u^*)$ of the **actual numerator** has at least $10^{-220}\log U$ zeros, counted with multiplicity, with real part greater than $7/10$ in a single interval of length $1/2$. Its center belongs to the fixed grid $(1/16)\mathbb Z\cap[-H-1,H+1]$. Here $H=C_W(\log U)^2$ for a Gevrey-two ordinary profile and $H=\min(U^\xi,T_1/4)$ for a fixed smooth profile, for any fixed $\xi>0$. Thus the remaining fixed-height central-value count can also impose this zero condition on the same rows. The interval may vary by row and may differ from the interval at the central sample.

## From the physical coefficient to a reflected value

The [dilation estimate](central-values.md#which-coefficient-scales-still-contribute) discards the large-dilation part of the sum. On each remaining large-radical row, every contributing scale is $T=Y/N\gg U^{.5748}$, since $Y=U^{(h-2\ell_t)/D}$ and $N\ll U^{11/10^6}$. If every such scale on a row satisfies $|S_u(T)|<U^{v_0-\eta}$, the coefficient mass and original count bound the sum on those rows by exponent $E-\eta$ up to freely chosen losses. On every remaining row there is an actual coefficient scale with $|S_u(T)|\ge U^{.08516}$, since $v_0-2\eta>.08516$. This argument uses no relation between the selected scales on different rows.

Take $r=.7002$. Shift the numerator Mellin integral to $1-r$. The primitive functional equation at $1-r+iv$ uses $|f(r+iv)|$ at the same ordinate since $L(r-iv,\bar\psi_u^*)=\overline{f(r+iv)}$. It costs $O(Q^{r-1/2}(3+|v|)^{2r-1})$ with $Q\ll U$. The original deleted factors at $1-r>0$ cost an arbitrarily small power, uniformly in $v$. If $|f(r+iv)|\le U^{.000015}$ at all $|v|\le H$, then
$$
 |S_u(T)|\ll T^{1/2-r} U^{r-1/2+.000015+\epsilon}+O(U^{-2})
 \ll U^{.08514004+\epsilon}.
$$
Here $.4252\cdot.2002+.000015=.08514004$. The fixed Mellin weight integrates the gamma polynomial. Outside the chosen range, use strip growth and rapid decay, choosing the order after the positive height powers have been fixed. The Gevrey estimate uses exponential decay in $\sqrt{|v|}$. This contradicts the physical lower bound after choosing $\epsilon$ small enough. [Functional equation and Euler deletions](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1423-L1619) · [Ordinary polynomial and buffered heights](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4272-L4499).

## A disk at the reflected height

Write $a=(1+\delta)/2$, choose the bin mesh $e\le10^{-6}$ and take $|v|\le H$. Use coordinates $w=s-(2+iv)$ and set the outer, inner and target radii to $R=1.3$, $r_i=1.2866$, $r_*=1.2998$. The disk of radius $r_i$ lies inside the source disk of radius $2-a-6e$. There the source's Euler-normalized primitive logarithm is $o(\log U)$ uniformly. On the disk of radius $R$ one has $\log|f|\le M\log U$ with $M=.007$. Indeed the buffered right edge $a+6e$ has an arbitrarily small power bound. Its reflected left edge $1-a-6e$ has exponent at most $1.02(a-1/2)$ after the source height power is chosen small. Affine strip interpolation on a rectangle of height $T_1$ with the Gaussian damping $\exp((s-iv)^2)$ then gives upper exponent $10^{-5}+.51(a+6e-\sigma)$ for $\sigma\le a+6e$ on the disk. This is less than $.007$ since $\sigma\ge.7$ there. To the right use the buffered bound. The disk's heights fit inside the buffer. [Primitive logarithm on the inner disk](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1546-L1619) · [Strip interpolation](zero-clusters.md#uniform-upper-bounds-at-the-disk-boundaries).

Remove all zeros $\alpha$ in $|w|<R$ by the disk Blaschke product $B$ used in the [central sample proof](central-values.md#zeros-of-the-sampled-numerator-near-the-sample-height). Its factors have modulus one on the circle and are positive at the center. The quotient has a holomorphic logarithm $g$ in the open disk with $\Re g\le M\log U$. Choose the branch agreeing on the inner disk with the source logarithm minus the individual factor logarithms real at zero. Since every zero satisfies $|\alpha|\ge 2-a-2e\ge 2-.713352$, the absolute value of each factor logarithm on the inner disk is bounded by
$$
 \log\frac{R}{|\alpha|}-\log(1-r_i/|\alpha|)-\log(1-r_i/R)<16 .
$$
The inequality follows by expanding the logarithms of the numerator and denominator of each factor. Suppose the disk contains fewer than $c\log U$ zeros, with $c=10^{-220}$. The inner maximum of $|g|$ is at most $17c\log U$ for sufficiently large $U$. The holomorphic function $h=g/(2M\log U-g)$ has modulus at most one on the open disk and less than $10^{-216}$ on the inner disk. Three circles at $r_*$ gives an inner weight
$$
 \frac{\log(R/r_*)}{\log(R/r_i)}\ge
 \frac{(R-r_*)r_i}{R(R-r_i)}>1/70
$$
by taking outer radii increasing to $R$. Thus $|h|<10^{-3}$ there and $|g|\le(2M/999)\log U<.000015\log U$. Since $|B|\le1$, the required small bound on $f(r+iv)$ follows on every sparse disk.

At least one disk therefore contains the claimed zeros. They have $\Re\rho>2-R=.7$. The buffer gives $\Re\rho<a+2e\le.713352$, so their imaginary parts differ from $v$ by less than $\sqrt{R^2-(2-.713352)^2}<.20$. Rounding $v$ to the nearest multiple of $1/16$ introduces at most $1/32$, leaving all the zeros within a quarter-unit of the same grid point. The numerical bounds have an [exact rational replay](four_factors.py). A power saving for the number of rows carrying these zeros and the required central values remains open.

Prepared with OpenAI Codex assistance, building on the preprint and tracker #143.
