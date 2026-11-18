# Marked fourth moments confine the reflected physical dyad

Assume the preprint's 7/8 theorem and the physical and marked-source inputs of tracker #143. Set $t=17466917/20000000$, keep the tracker’s stationary conductor $h$, and fix a critical bin and its error mask. Write $U=Z^D$, $Y=U^{y/D}$ with $y=h-2(11/3-4t)$, $x_0=1-y/D$, $q=\delta p$ for the masked gain, and $R$ for the original bound on the row-count exponent. Put $\eta=10^{-7}$. The critical rectangle has $.425\le\delta\le.4267$ and $.49995\le p\le.5$. At source cost $0<s\le10^{-9}$, put $\lambda=2+10s$ and
$$
 z_0=\min\!\left(\frac3{40},\frac{1-s-2x_0}{\lambda}\right),
 \qquad E=\frac{3R+1}{4}-\frac{qz_0}{2}=R+v_0 .
$$
Throughout $h-10^{-5}\le D\le h+10^{-10}$, the affine branch is positive and strictly below $3/40$. In fact
$$
 .42505871<x_0<.42506577.
$$
Writing $k=D-h$, the expression $x_0=(2(11/3-4t)+k)/(h+k)$ decreases in $h$ and increases in $k$. Evaluating the corresponding corners with $.815324503<h<.815324505$ gives the stated rational bounds. The required saving in the physical mass is $3\eta/4$ before freely chosen losses. As in the original argument, suppress the common row-independent physical and prime-packet factors, including the upper product of main amplitudes. [Physical packet and normalization](central-values.md)

In the direct reflected reduction the remaining ordinary polynomial $P_u(N,v)$ has one fixed real dyadic bump, the physical numerator character, and a common norm twist. Put $n=\log_U N$. Up to negligible tails, the remaining dyads can be restricted to
$$
 x_0-10^{-6}<n\le x_0+0.80\cdot10^{-6}.                                      \tag{1}
$$
All dyads below this interval save by a marked fourth moment on the physical mass. The upper bound uses the existing weighted coefficient mass. One may restrict the positive dyadic eighth moment to (1) before its pair expansion, then ask for its one-sided bound with the same Fourier averaging and conductor cuts. In that formulation freeze the physical $U$ when the rows are split into shells $Nu\asymp V\le U$, and ask uniformly for those shells with the same $U,N$ (or for their sum). [Direct reflection and the eighth-moment estimate](eighth-short.md). The separate eighth-moment estimate for a full central $L$-value has its own dyadic range. An alternative for the physical contribution expands only the extra prime amplitudes in a fourth moment. [Extra prime factors and their reduced conductors](extra-marks.md).

## Actual source and slot selection

Use the larger admitted ordinary source face. If $M$ is a product of original canonical amplitude slots of total normalized width at most $w$, it supplies
$$
 \sum_{u\in\mathcal C}|P_u(N,v)|^4|M_u|^2
 \ll_\epsilon U^{1+\epsilon}(1+\mathrm{height})^J(1+|v|)^J
$$
when $n\in[0,1/2]$, $2n+\lambda w\le1-s$ and $w\le3/20-1000s/1143$. Each slot must have width below the selected source mesh. The fixed dyadic ordinary profiles for the source can be taken to be $x^{-1/2}\omega(x)x^{\pm iv}$, supported in $[1/2,2]\subset[1/4,9/4]$. This includes the centrally normalized coefficient $q_a^{-1/2-iv}$ up to a scalar of modulus one. The source's finitely many seminorms of these profiles cost a fixed polynomial in $v$. Its finite-pair lemma allows arbitrary profiles in that annulus and the actual physical slots. Norms are unchanged under conjugating the ordinary character and its profile together. The fixed-source and physical canonical prime factors are complex conjugates in that identity, so their absolute products agree coefficientwise, including their natural zeros. The keep condition holds for the large physical rows, as in the source Fourier transfer. Choose the fine mesh for this larger face before the physical data, taking the minimum with the meshes used for the other estimates. [The larger source and its restricted incumbent face](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveSource.lean#L14-L44) · [Specialization to the original physical ray and prime coefficients](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveAffineInput.lean#L24-L58) · [Arbitrary physical profile pair](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositivePhysicalPair.lean#L25-L80) · [Keep conditions and canonical-slot conjugation](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveFourier.lean#L53-L94)

The total slot supply is $\ell/D>1/5$ on this conductor patch. The common bin assigns a lower gain $g_j\in[0,\delta/2]$ to each positive-width slot and sets the gains on error slots to zero in the masked mean $q$. For a positive gain the original amplitude has modulus at least $U^{w_jg_j}$, with widths in $U$ units. To fill any quota $0<w<\ell/D$, sort the positive-gain slots by decreasing gain and take the prefix before the quota. If all positive gains fit, their total gain is at least $qw$. Otherwise fractional filling would give at least $qw$, and dropping the boundary slot loses at most $(\delta/2)\max_j w_j$. This proves the needed lower bound $|M_u|\ge U^{qw-\epsilon}$ uniformly on the bin after selecting the mesh small. The original problem's number of slots, bin choices and resulting constants are fixed before taking $U$ large. The same argument on all slots, including their true gains in the error positions, permits the full mean $q_{\rm full}\ge q$. [Original whole-slot comparison](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveWholeSlots.lean#L24-L71) · [Original masked mean and physical amplitudes](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveAmplitudeClass.lean#L42-L114)

## The short side and the upper Fourier tail

For $n\le x_0-10^{-6}$ take $w=z_0+.9\cdot10^{-6}$. This is less than $.076$ and fits the larger cap and the prime supply. Also $2x_0+\lambda z_0\le1-s$ and $2\cdot10^{-6}>\lambda(.9\cdot10^{-6})$. Divide the marked fourth moment by the square of the common lower mark and use Hölder on $\#\mathcal C\ll U^{R+\epsilon}$. The exponent for the resulting sum of ordinary amplitudes is at most
$$
 \frac{3R+1}{4}-\frac{qw}{2}
 = E-\frac{q(.9\cdot10^{-6})}{2}.
$$
The last saving exceeds $3\eta/4$ by at least $329847/16000000000000>2\cdot10^{-8}$. Multiplying by the original upper main-amplitude product and coefficient-mass bound, integrating the fixed rapidly decaying Fourier weight, and summing $O(\log U)$ dyads preserves the saving on the physical mass. The external physical height power can be chosen small after the fixed source height degree. This argument applies on the entire short part of every surviving row and requires no new count for rows with a large short polynomial.

For the upper end use the existing dilation variable $\max(1,L_iK)$ for an actual coefficient norm $K$, where $L_i=C_i/(C_0q_u)$ and the combined presentation conductor $C_i$ bounds the primitive conductor $Q_i$. A dilation exponent $v_{\rm dil}$ saves at least $\delta v_{\rm dil}/4$ before the arbitrarily small original mesh and annular losses. Taking the discard at $v_{\rm dil}>.75\cdot10^{-6}$ therefore saves more than $3\eta/4$ since the margin is at least $3/640000000$. For the retained terms the reflected scale, including a fixed divisor $e$ of the excluded primes and an arbitrary dual $S$-part $b$, is
$$
 X=\frac{q_e Q_i K}{Yq_b}
 \ll_S \frac{C_iK}{Y}\ll U^{x_0+.75\cdot10^{-6}} .
$$
The annular Fourier tail of the direct proof allows any fixed additional power slack. Use $.05\cdot10^{-6}$ and select its fixed derivative order afterwards. This proves the upper endpoint in (1). [Original capacity-damping inequality with its mesh terms](central-values.md#which-coefficient-scales-still-contribute)

## A partition at the last dyad

The full prime amplitudes also dispose of some bins in (1). The width
$$
 w=z_0-.81\cdot10^{-6}
$$
is admissible throughout (1), since $\lambda(.81\cdot10^{-6})>2(.80\cdot10^{-6})$. Moreover $w>.0747$ by $x_0<.4252$. Whenever $q_{\rm full}-q\ge5\cdot10^{-6}$, the simple whole-slot construction yields gain at least $q_{\rm full}w$ up to an arbitrary mesh loss. In this case
$$
 \frac{q_{\rm full}w-qz_0}{2}\ \ge\
 \frac{5\cdot10^{-6}\cdot .0747-(.4267/2)(.81\cdot10^{-6})}{2}
 >3\eta/4+2.5\cdot10^{-8}.
$$
By the fourth-moment argument the entire remaining interval saves on this bin.

There is a stronger version for the admitted #143 source: replace $q_{\rm full}$ in this criterion by the largest original lower gain $g_*=\max_j g_j$ before masking. The source's uniform mesh precedes its arbitrary finite slot type. In its initial energy the common smooth prime profile can be reused, and the width, ray character and norm-twist parameters are assigned separately to each label. There is no distinct-window hypothesis. Use a newly labelled tuple of identical copies of the original maximizing slot $j$, at its same width $w_j$, height, physical canonical ray and coefficients. The finite physical-pair transfer with arbitrary finite slot type bounds the product of the normalized slots, which in this case is the power of that particular amplitude, including all repeated-prime terms. Concretely apply the uniform unit-face statement with an ambient type of size at least $1+\lceil 1/\min_j\ell_j\rceil$, where $\ell_j>0$ are the original finite $Z$-widths fixed before $U$. This suffices since $w_j=\ell_j/D$ and $D\le1$. The proof of the physical finite-pair transfer is unchanged under replacing its finite label type: its underlying finite-row comparison takes an arbitrary finite list of prime pools. For $r=\lfloor w/w_j\rfloor$ use $r$ labels, at total width at most $w$. Their gain is at least $g_*w-(\delta/2)\max_jw_j$. Constants are allowed to depend on the already fixed data and hence on this finite ambient type, and are uniform through all physical scales. Thus (1) also saves whenever $g_*-q\ge5\cdot10^{-6}$. This repetition argument uses the stronger admitted unit-face energy. The earlier paper's short-prime theorem with an explicit disjoint-support assumption alone does not supply it. [Unit-face quantifiers](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-10-21-hailey-collet-1252270103/src/Submissions/hailey_collet_1252270103/Record12518109Existence/UniformSource.lean) · [Initial-energy variables](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-10-21-hailey-collet-1252270103/src/Submissions/hailey_collet_1252270103/Record12518109Source/InitialMoment.lean) · [Physical finite-pair transfer](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositivePhysicalPair.lean#L27-L81)

## Why the flat stationary case persists

At the actual stationary top geometry $x_0\approx.4250657$ the affine budget branch sets $z_0<3/40$. At $n=x_0$ a flat bin with all positive gains equal to $q$ allows the same total marked gain $qz_0$ through this face even with arbitrary repetitions. This face gives exactly the inherited fourth-moment price at that flat gain.

For example, apply the coefficient-independent sixth-order sieve to $k$ copies of this ordinary polynomial and to any product of original prime marks of total width $w\ge0$, including repetitions, all in the same sextic symbol orientation after conjugation of whole factors when needed. At the level $|P|\ge U^{v_0}$ its standard count bound costs exponent
$$
 \Phi(1,kx_0+w)-2kv_0-2qw,\qquad
 \Phi(1,b)=\max(1,b,5/6+b/3,1/3+5b/6).
$$
The squared coefficient norm costs arbitrarily small powers for fixed $k$ and a fixed mark tuple by the divisor envelope and the summable sixth-power removal. Here $1/3<2q<5/6$, so optimization over $w\ge0$ uses $kx_0+w=\max(1,kx_0)$. At this geometry $v_0<.086$, $q\ge.425(.49995)$ and $x_0>.425$. For $kx_0\le1$ the resulting value is at least $7/6-2q>.73$, since $qx_0>v_0$. For integer $k$ with $kx_0>1$ we have $k\ge3$, and even the lower bound $1/3+k(5x_0/6-2v_0)$ exceeds $.87$. These estimates leave the stationary count near $.626$ open. The marked mass and bin partition above are strict arithmetic savings only in their stated ranges.

Run `python3 -OB auto-research/continuum-local-return/marked_window.py` from the repository root for the rational comparisons. Prepared with OpenAI Codex assistance.
