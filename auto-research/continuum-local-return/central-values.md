# A central-value test for the physical numerator

Assume the preprint's 7/8 theorem and the inputs to [tracker #143](https://github.com/GTimG/QuasiRiemannTracker/pull/143). In the critical conductor band of [the local return](../proposals/2026-11-17-local-continuum-return.md), put $U=Z^D$. Fix the original physical parameters, an error-slot mask, a nonempty finite prime-amplitude class $\mathcal C$, and its masked parameters $(\delta,p)\in[.425,.4267]\times[.49995,1/2]$. Set $q=\delta p$. Write $R=1-\delta C$ for the original exact marked count exponent at these parameters, and $z$ for the scheduled zero-dilation physical capacity at the chosen source cost. Here $0\le z\le3/40$ on the critical band. The original estimate gives $\#\mathcal C\ll U^{R+\epsilon}$. A count at the full mean transfers to this masked mean by the original antitonicity. Any original polynomial factor in the external tuple height is retained throughout, or absorbed by choosing the source height power after the finite moment orders are fixed.

For $u\in\mathcal C$ use the **actual character of the numerator's ordinary polynomial**, denoted $\psi_u$. It is nonprincipal and retains the original Euler deletions. This choice is fixed by the physical numerator on each row and precedes any choice of a zero-detector presentation or height. Define
$$
 v_0=\frac{1-R}{4}-\frac{qz}{2},\qquad \eta=10^{-7}.
$$
The following statements concern the physical contribution of the class. They apply also after the large-radical restriction.

* The rows whose weighted central-line integral defined below is at most $U^{v_0-\eta}$ already give the required saving. The rows with $|L_{\rm orig}(1/2+it,\psi_u)|>U^{.0936}$ at any of the common sample heights below do as well.
* To handle the remainder it suffices, at **each fixed sample height** $t$, to bound the number of rows with
$$
 U^{v_0-2\eta}\le |L_{\rm orig}(1/2+it,\psi_u)|\le U^{.0936}
$$
by $O_\epsilon(U^{R-2\eta+\epsilon}(1+|t|)^J)$ for a fixed height degree $J$. The lower threshold is greater than $U^{.08516}$. The count can also impose a cluster of zeros of the actual numerator with real part greater than $7/10$ in a half-unit interval. [Proof on the remaining coefficient scales](short-dilation.md). The same predetermined height grid works for every row. There are $O((\log U)^3)$ points when the ordinary numerator profile has Gevrey order two in log norm. For general fixed smooth profiles the grid has $O(U^\xi\log U)$ points, where $\xi>0$ can be arbitrarily small and is chosen after $J$.
* An alternative sufficient estimate is the unmarked moment $\sum_u |L_{\rm orig}(1/2+it,\psi_u)|^{9/2}\ll_\epsilon U^{101/100+\epsilon}(1+|t|)^J$ for the actual physical row family. Even this larger family requires no selection of a prime amplitude or a witness height in the moment. Both this estimate and the middle-range count above remain open.

## A common scalar for all coefficient scales

Write $W$ for the fixed smooth annular test in the ordinary factor of the physical packet. For every real $T>0$, its centrally normalized sum $S_u(T)=T^{-1/2}\sum_n\psi_u(n)W(Nn/T)$ obeys
$$
 |S_u(T)|\le B_u:=\frac1{2\pi}\int_{\mathbb R}
 |\widehat W(1/2+iv)|\,|L_{\rm orig}(1/2+iv,\psi_u)|\,dv .
$$
Here $\widehat W(s)=\int_0^\infty W(x)x^{s-1}dx$. Mellin inversion on the absolute line followed by a shift gives the assertion. The moving scale contributes $T^{iv}$ of modulus one. The function is entire and of fixed polynomial growth in height and row conductor. All deleted Euler factors stay in the integrand. In particular the center of the tested height range is zero, independently of both external physical heights. [Source strip bound](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1426-L1449) · [Original presentation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4218-L4268).

In the physical packet $T=Y/N$ can vary with both the row and its coefficient index. The actual mass estimate bounds the sum of $|A_u(e)|N^{-1/2}$ by its bound with the additional weight $\max(1,L_uN)^{\delta/2}\ge1$. Thus the row contribution is at most the original mass and normalization factors times $B_u$ and the product of the main physical prime amplitudes. In the chosen bin that last product is $\ll U^{q\ell_t/D+\epsilon}$. In what follows suppress these same common factors, including $Y^{-1/2}$ and the error-slot prime powers. The inherited marked packet then has exponent
$$
 E=\frac{3R+1}{4}-\frac{qz}{2}=R+v_0.
$$
On $B_u\le U^{v_0-\eta}$ the direct mass bound and original count give exponent $E-\eta+\epsilon$. On any subset of cardinality $\ll U^{R-\eta+\epsilon}$ the inherited marked fourth-moment argument gives $E-3\eta/4+\epsilon$. It applies with the original exterior data, coefficient choices and selected slots: their lower bounds persist on restriction, and their fourth moment is a positive sum. These are precisely sufficient gains for the critical physical row in the localized return. The minimum with every previously available bound is still valid. [Actual coefficient series and ordinary polynomial](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveLabelPacket.lean#L90) · [Physical row bound at a supplied cardinality](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveAmplitudeClass.lean#L25).

## Which coefficient scales still contribute

Write $C_i$ for the primitive conductor norm times the redundant-prime norm of the physical presentation, and $L_i=C_i/(C_0 N u_i)$ for the original dilation. The terms with $\max(1,L_iN)>U^{10^{-6}}$ already gain more than $3\eta/4$ in the physical estimate. Indeed, in a dilation bin with lower exponent $v$ and mesh $\xi_0$, the weighted coefficient mass supplies $U^{-\delta v/2}$. At effective displacement $t=v+\xi_0+\mathrm{ann}$ the selected capacity $z_t$ is the affine expression of slope $-2/(2+10s)$ clipped to $[0,3/40]$, where $s\ge0$ is the source cost. Thus $z-z_t\le t$ and the change to the pre-loss exponent is at most
$$
 -\delta v/2+q(z-z_t)/2\le-\delta v/4+q(\xi_0+\mathrm{ann})/2 .
$$
Insert the indicator of the stated range before summing the bins. The original weighted mass and moment are uniform under this restriction: the active-box proof uses the supremum over the allowed coefficient scales and the sum of the absolute weighted masses. Every nonempty restricted bin has $v\ge10^{-6}-\xi_0$. Since $.425\cdot10^{-6}/4>3\eta/4$, the mesh, annulus and other preliminary losses can be taken smaller than the fixed difference. [Weighted physical bin before the damping is discarded](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveBins.lean#L18) · [Scheduled capacity](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveSelection.lean#L18).

On the remaining large-radical rows $N\operatorname{rad}(u_i)>U^{1-10^{-5}}$, each prime outside the fixed set $S$ dividing $u_i$ ramifies in the primitive numerator. Consequently $C_i\gg_S U^{1-10^{-5}}$, whereas $Nu_i\asymp U$. The remaining coefficient norms obey $N\ll U^{11/10^6}$ and their ordinary scales satisfy $Y U^{-11/10^6}\ll Y/N\le Y$. All constants are uniform on the physical dyad. [Ramification in the actual primitive presentation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4244-L4268).

## Central fourth moment and the height grid

For the complete nonprincipal physical family of rows of norm $\ll U$, the unmarked fourth moment gives
$$
 \sum_u |L_{\rm orig}(1/2+it,\psi_u)|^4\ll_\epsilon U^{1+\epsilon}(1+|t|)^{J_4}
$$
with a fixed height degree for each prescribed loss. Here is a direct reduction to the preprint's polynomial estimate. Put $X=U^{12}$ and approximate the value by the ordinary Dirichlet polynomial with weight $e^{-Nn/X}(Nn)^{-1/2-it}$, truncated at $Nn\le U^{13}$. Moving the Mellin variable of the exponential to $-1/4$ crosses only the residue at zero. The primitive strip bound gives $O(U^{3/5}(1+|t|)^2)$ on the displaced line, up to $U^\epsilon$ for the original deleted factors at real part $1/4$. Gamma decay makes the approximation error $O(U^{-2}(1+|t|)^2)$ after the exponentially small cutoff tail. For the fourth moment, use a smooth terminal cutoff equal to one up to $U^{13}$ and zero above $2U^{13}$, which changes the polynomial by an exponentially small amount. On each dyad of scale $D_0$, the normalized test includes the bounded real factor $(Nn/D_0)^{-1/2}$; the norm twist costs a fixed polynomial in the height. All smooth seminorms required by the estimate are uniformly bounded for the remaining profile because the dyadic argument stays away from zero and derivatives of $e^{-b x}$ are bounded there uniformly for $b\ge0$. There are $O(\log U)$ dyads of bounded length exponents. Apply the unmarked two-ordinary estimate to two identical factors and sum by the triangle inequality in the fourth moment norm. Its physical presentation has row scale $U$ and fixed auxiliary phase data. Finite primary classes and dyads do not change the exponent. [Unmarked fourth moment, arbitrary bounded lengths](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12531-L12579).

Let $P_u(t)$ denote the polynomial with the sharp terminal cutoff used above. Fix $0<\xi<1/10$ and set $H=U^\xi$. In $B_u$ the integral over $|v|>H/2$ is $O(U^{-1})$ by strip growth and rapid Mellin decay, choosing the tail order after $\xi$. For a Gevrey-two profile take $H=C_W(\log(2U))^2$ instead, using the Fourier bound $O(e^{-c_W\sqrt{|v|}})$ and choosing $C_W$ sufficiently large. The polynomial approximates the value within $O(U^{-1})$ on $[-H,H]$.

Use the sample spacing $d=1/(20\log(2U))$. Choose a smooth compactly supported Fourier cutoff in $(-\pi,\pi)$ equal to one on $[-1,1]$, with inverse Fourier transform $K$. For every real $t$ Poisson summation gives
$$
 P_u(t)=\sum_{j\in\mathbb Z}P_u(jd)K(t/d-j).
$$
Indeed this identity holds for each exponential $e^{-it\log Nn}$ because $d\log Nn\le13/20$ and all nonzero $2\pi$ translates lie outside the cutoff. The translates of $K$ have a bounded sum of absolute values. For $|t|\le H/2$, discarding $|jd|>H$ costs $O(U^{-1})$: the global trivial bound $|P_u|\ll U^7$ is paid by an arbitrarily large Schwartz tail order. For logarithmic $H$ choose the Fourier cutoff of Gevrey order two as well. Then the translates beyond $H/(2d)$ cost $O(\exp(-c\sqrt{H/d}))$ up to a polynomial factor, which pays the same trivial bound.

It follows that $B_u\le C'_W\max_{|jd|\le H}|L_{\rm orig}(1/2+ijd,\psi_u)|+O(U^{-1})$. Any row above the low cutoff therefore has a sample at least $U^{v_0-2\eta}$. At any sample the count above $U^{.0936}$ is at most $O(U^{.6256+\epsilon}(1+|jd|)^{J_4})$ by the fourth moment. On the critical patch $R>.62567$. In the smooth case choose $(1+\max(J,J_4))\xi<\eta/4$ and all preliminary losses less than their allocated fractions of $\eta$. The high samples together have count smaller than $U^{R-\eta}$, as do the middle samples if the stated local count holds. The Gevrey case has only logarithmic losses. This deduction uses the same entire class before restriction and imposes no condition on the sampling phases of the different rows.

## The fractional moment budget

If the displayed $9/2$ moment holds with polynomial height growth, Minkowski's inequality in the finite row space gives $\sum_u B_u^{9/2}\ll U^{101/100+\epsilon}$ since the fixed Mellin weight decays rapidly. Hölder on $\mathcal C$ and the physical mass bound give exponent $7R/9+(2/9)(101/100)$. On the whole critical patch,
$$
 E-\left(\frac{7R}{9}+\frac{2}{9}\frac{101}{100}\right)
 =\delta\left(\frac{C}{36}-\frac{pz}{2}\right)-\frac1{450}>\frac{1}{10000}.
$$
The [exact comparisons](four_factors.py) also verify the row-count and amplitude thresholds used above. The gain is larger than the required $3\eta/4$ before the arbitrarily small physical losses. No fractional-moment estimate or full endpoint follows from the fourth moment alone.

## Zeros of the sampled numerator near the sample height

Assume the preprint's 7/8 theorem. Let $L_{\rm orig}(s)=L(s,\psi^*)D(s)$ be the actual nonprincipal physical numerator presentation on a row of scale $U$. Its primitive conductor satisfies $Q\ll U$, and the radical of its deleted Euler factors has polynomial norm in $U$. Put $c=10^{-60000}$. If $|t|\le U^{1/100000}$ and $|L_{\rm orig}(1/2+it)|\ge U^{17/200}$, then for all sufficiently large $U$ there is a $v\in[t-2,t+2]$ for which $L(s,\psi^*)$ has at least $c\log U$ zeros, counted with multiplicity, in
$$
 |s-(2+iv)|<1.331.
$$
Every such zero has real part strictly greater than $0.669$, and $|\Im s-v|<0.72$ by the 7/8 theorem. In particular one of the six unit intervals partitioning $[t-3,t+3]$ contains at least $c\log U/6$ such zeros. The interval can be chosen from this same fixed list on every row sampled at $t$. This is a necessary condition for a large sample. Counting the rows that satisfy it remains open. [Physical presentations and conductor bounds](https://arxiv.org/html/2610.17675v2#S6.SS1)

Write $f=L(s,\psi^*)$, $r=0.6695$ and $d=r-1/2=0.1695$. Fix $|v-t|\le2$, use coordinates $w=s-(2+iv)$, and set $R=1.331$, $r_*=2-r=1.3305$, $r_o=1.33075$. The Hecke strip growth bound $O(Q^{3/5}(3+|\Im s|)^2)$ up to real part $1.1$, and absolute Euler convergence farther right, give $|f|\le U$ throughout the disk for large $U$. Remove each zero $\alpha$ in the open disk, with multiplicity, by a disk Blaschke factor
$$
 b_\alpha(w)=\frac{|\alpha|}{\alpha}\frac{R(\alpha-w)}{R^2-\bar\alpha w}.
$$
For their product $B$, the function $f/B$ has maximum modulus at most $U$, since $|B|=1$ on the circle. Zeros on the circle may be left in $f/B$. Its logarithm $g$ is analytic in the open disk. Choose its branch to agree near zero with the Euler logarithm of $f$ minus the logarithms of the factors which are real at zero. [Strip growth, functional equation and Euler-factor bounds](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1423-L1619)

Every zero has $|\alpha|\ge1$ by absolute Euler convergence to the right of one. On $|w|\le1/2$ the chosen logarithm of each factor has modulus at most
$$
 \log R+\log 2-\log(1-1/(2R))<2.
$$
This follows by expanding $\log(1-w/\alpha)-\log(1-\bar\alpha w/R^2)$. The Euler logarithm of $f$ is uniformly bounded on that disk. If the number $N$ of removed zeros is smaller than $c\log U$, then $\max_{1/2}|g|\le3c\log U$ eventually. Here $\max_b$ denotes the maximum on $|w|\le b$. Borel–Carathéodory on $r_o<R$, using $\Re g\le\log U$ and $|g(0)|\le\log U$, gives $\max_{r_o}|g|\le10^5\log U$. The bound follows first with outer radii less than $R$, then by taking the limit. In the three-circles bound at $r_*$, the weight of the inner radius is
$$
 \lambda=\frac{\log(r_o/r_*)}{\log(r_o/(1/2))}>1/6000.
$$
Indeed the numerator is at least $(r_o-r_*)/r_o>1/6000$, and the denominator is less than one. Thus $\max_{r_*}|g|\le (3c)^\lambda(10^5)^{1-\lambda}\log U<10^{-4}\log U$. As $|B|\le1$, this gives $|f(r+iv)|\le U^{0.0001}$ on every sparse disk.

If every disk for $|v-t|\le2$ were sparse, the last estimate would hold on the right side of the rectangle $1-r\le\Re s\le r$, $|\Im s-t|\le2$. The functional equation gives $|f(1-r+iv)|\ll Q^d(3+|v|)^{2d}|f(r+iv)|$, using $L(r-iv,\bar\psi^*)=\overline{f(r+iv)}$. Hence the left side has exponent at most $d+0.00011$, including $2d/100000<0.000004$ and the fixed constants. Let $E(s)$ be real affine on the real axis, taking values $d+0.00011$ at $1-r$ and $0.0001$ at $r$, and extend it affinely to complex $s$. Apply the maximum principle to
$$
 f(s)U^{-E(s)}\exp\!\left[-10^{-5}\log U\,\cos\big(8(s-1/2-it)\big)\right].
$$
On the vertical sides the last factor has modulus at most one. On the horizontal sides its modulus is at most $U^{-10^{-5}\cos(8d)\cosh(16)}<U^{-1}$, since $\cos(8d)>0.2$ and $\cosh(16)>10^6$. This absorbs the strip growth there. At the sample the damping costs $U^{0.00001}$. The original deleted factors cost at most $U^{0.00001}$ for all sufficiently large $U$. Consequently
$$
 |L_{\rm orig}(1/2+it)|\le U^{(d+0.00011+0.0001)/2+0.00002}
 =U^{0.084875}<U^{0.085},
$$
which proves the assertion.

Prepared with OpenAI Codex assistance, building on OpenAI, Collet, Sil, Bebel and the authors credited in tracker #143.
