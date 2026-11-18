# A joint moment of the physical numerator and denominator

Assume the preprint's $7/8$ theorem and the physical and marked estimates of tracker #143. For the proposed endpoint $17466917/20000000$, let $P_u(n,v)$ be the reflected numerator dyad and $S_u(y,t)$ the ordinary dyad extracted from the **same row's physical denominator**. On a fixed critical prime-amplitude class $\mathcal C$, the two separate fourth moments prove
$$
 \sum_{u\in\mathcal C}|P_u(n,v)S_u(y,t)|^2
 \ll_\epsilon U^{1-q(W_P+W_S)+\epsilon}(1+|v|+|t|+H)^J.       \tag{1}
$$
Here $H$ bounds the fixed external heights, $q=\delta p$ is the masked prime gain, and $W_P,W_S$ are the respective marked widths defined below. An improvement of $8\cdot10^{-6}$ in the exponent of (1) would suffice throughout the remaining physical window. A second sufficient estimate requires cancellation only in the expansion of extra prime factors of total width $3\cdot10^{-5}$. The grouped two-coordinate estimate gives a proposed proof of the first saving. Its two-character transfer and application to the physical integral are described separately. The signed estimate on the extra factors remains open. [Grouped estimate](asymmetric-root.md). [Reflected numerator window](marked-window.md) · [Denominator witness and its localization](short-physical-inverse.md#localization-by-the-exact-inverse-identity)

## Witnesses on the same row

Write $\eta=10^{-7}$, $\lambda=10^{-5}$, $m=t_0/3$ and $n_0=1-\log_U Y$ for the unshifted dual length. On the retained dyads,
$$
 n_0-10^{-6}<n\le n_0+.8\cdot10^{-6},\qquad
 m-4\lambda<y<m+\lambda,\qquad
 |S_u(y,t_u)|\ge U^{\delta y/2-1.5\eta}.                       \tag{2}
$$
The last height $t_u$ may depend on the row. The denominator identity gives (2) after separating its three factors and excluding the already bounded length ranges. The dyadic choices are logarithmically many. The reflected numerator has the original $\chi_\bullet(u)$ orientation up to whole-factor conjugation. The denominator is $\eta_{\rm ray}\overline{\chi_\bullet(u)}$, with its original excluded-prime factors. Both retain their zeros on nonunits. On retained large rows their inducing characters ramify outside the fixed bad set, so the ordinary keep conditions hold for both. No condition equates their heights or fixed twists. Freeze the original dynamic bin, error mask, external parameters and prime-amplitude class before using the moments. [Physical numerator and denominator](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L5472-L5488) · [Eligibility, heights, and the exact coefficients after conjugation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15137-L15170)

Use the original bound $\#\mathcal C\ll U^{R+\epsilon}$ with
$$
 R=1-\delta C,\qquad C=p(1+2g_0)+2km,\qquad k=1-p(1+2g_1).
$$
Here $.425\le\delta\le.4267$, $.49995\le p\le.5$, $1.12796<t_0<1.12903$ and $.42505871<n_0<.42506577$. For a fixed native source cost $0<\sigma\le10^{-9}$ put
$$
 W_P=\frac{1-\sigma-2n}{2+10\sigma},\qquad
 z_0=\frac{1-\sigma-2n_0}{2+10\sigma},\qquad
 W_S=\frac{1-2y}{2}+g_0-2g_1y .
$$
The numerator is on the affine branch. The denominator has $1467/2000<2y<311/400$, inside the improved anchor. Thus for original positive prime products $B$ and $BD$ of widths at most $W_P$ and $W_S-\xi$, respectively, the available sources bound
$$
 \sum_{\mathcal C}|P_u|^4|B_u|^2,\qquad
 \sum_{\mathcal C}|S_u|^4|B_uD_u|^2
 \quad\ll_\epsilon U^{1+\epsilon}(1+|v|+|t|+H)^J.             \tag{3}
$$
The positive decrement $\xi$ and mesh can be arbitrarily small. For the denominator use the two copies of its own dyadic profile in the anchor, with the relative ray coefficient of its presentation in each physical slot. A whole-product conjugation preserves the absolute square and the zero extensions. Smooth real norm powers on the fixed annulus and the first log-norm test are included by the underlying ordinary rectangle, or by the common Fourier separation of the original dyad. These bounds apply independently of which presentation provided the detector zero. [Numerator physical source](marked-window.md#actual-source-and-slot-selection) · [Tracker's improved ordinary rectangle](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/ContactSource.lean#L34-L48) · [Selected slots and log tests](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/AffineFiber.lean#L41-L58)

## The direct joint price

Order the original positive-gain slots by decreasing lower gain $g_j$. A slot of width $w_j$ has $|Q_j(u)|\ge U^{w_jg_j}$ on $\mathcal C$. Take a prefix $B$ up to $W_P$ and then a disjoint continuation $D$ up to total width $W_S-\xi$. The width ordering and total supply $W_P<W_S<1/5<\ell/D_{\rm row}$ follow from the source bounds, where $D_{\rm row}=\log_Z U$. Each prefix has gain at least $q$ times its quota, up to $O(\xi+\max_j w_j)$. Indeed a fractional prefix has mean at least the full masked mean. If it exhausts the positive slots their full gain is $q\ell/D_{\rm row}$, and rounding a boundary slot costs at most $(\delta/2)\max_j w_j$. Cauchy applied to (3) now gives
$$
 \sum_{\mathcal C}|P_uS_u|^2|B_u|^2|D_u|\ll U^{1+\epsilon}(1+|v|+|t|+H)^J .
$$
Dividing by the common lower bound for $|B_u|\,|B_uD_u|$ proves (1). This construction uses distinct original slots and only the lower bins. On the fixed class there is also a polynomial representation of the middle weight to arbitrary power accuracy. For positive-gain slots the two-sided bins give $\log_U|Q_j|=w_jg_j+O(\epsilon w_j)$. Take a prefix $F\subseteq D$ up to half $\sum_{j\in D}w_jg_j$. It follows that $|F_u|^2/|D_u|=U^{O(\epsilon+\max_j w_j)}$ uniformly on the class. Thus $|B_uF_u|^2$ can replace $|B_u|^2|D_u|$ in this positive estimate on $\mathcal C$. [Whole-slot comparison and original amplitude bins](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveAmplitudeClass.lean#L41-L114)

More generally suppose the unmarked joint moment on $\mathcal C$ has exponent $1+e-2qW$ at the indicated fixed heights, for the dyadic denominator test and its first log-norm multiple. Apply the one-dimensional Sobolev inequality on intervals of length one to the normalized twist $(N\mathfrak a/U^y)^{-it}$. Its derivative inserts the log-norm test. Integrate over $|t|\le T_1/2+1$ on the fixed class before restricting to the rows with a witness at some height there. A factor polynomial in $T_1$ is paid by the height choice after $J$ is fixed. The remaining common Fourier integral in $v$ has rapid decay. With (2) and Cauchy against the count of the witness rows this gives the physical mass exponent
$$
 E_1=\frac{R+1+e-\delta y+3\eta-2qW}{2}.
$$
The coefficient-dilation damping can only lower this exponent. The original exponent $E_0=(3R+1)/4-qz_0/2$ must be improved by $3\eta/4$. On subtracting, the sufficient comparison is
$$
 \delta[2y+4pW-2pz_0-C]\ \ge\ 2e+9\eta .                      \tag{4}
$$
Choose all freely selectable losses inside a strict margin in (4). For $W=(W_P+W_S)/2$ the bracket is exactly $2k(y-m)+2p(W_P-z_0)$. It vanishes at $y=m,\ n=n_0$. Throughout (2) it is at least $-8k_{\max}\lambda-.8\cdot10^{-6}$ since $2p\le1$ and $W_P-z_0=-2(n-n_0)/(2+10\sigma)$. At $e=-8\cdot10^{-6}$ the spare physical power after the required saving is greater than $7.07\cdot10^{-8}$. This proves the asserted implication for (1). Logarithmically many dyads and fixed profile families fit in this margin. The row count of the whole original amplitude class is used only as the first Cauchy factor.

The mean width exceeds the limiting total-length affine width $(1-n-y)/2$ by $(g_0-2g_1y)/2$, between $.00042$ and $.00047$, as $\sigma\to0$. The two separate moment bounds allow equality at the flat stationary bin. Assign formal amplitudes $\log_U|S|=\delta m/2$, $\log_U|P|=(1-R-2qz_0)/4$, and $\log_U|Q_j|=qw_j$ on $U^R$ rows. Both bounds (3) then have limiting exponent one at their full respective widths. Positive interpolation of those two scalar constraints gives their mean with no further saving.

## A sufficient signed estimate on extra prime factors

Set $a=3\cdot10^{-5}$ and $c=3\cdot10^{-6}$. In decreasing order of positive binned gain choose consecutive disjoint groups $E,B,D$, with respective width caps $a,W_P,W_S-W_P-\xi$. At each cut take the largest prefix that fits and start the next group at the first unused slot. The two nested prefixes $EB$ and $EBD$ have gains at least $q(a+W_P)-O(\xi+\max_jw_j)$ and $q(a+W_S)-O(\xi+\max_jw_j)$. This follows from the same fractional-prefix argument, with at most three unfilled slot widths. Both quotas are below the total supply. Write $G_L=\sum_{j\in L}w_jg_j$ and $K=2G_B+G_D$. Then
$$
 K+2G_E\ge q(2a+W_P+W_S)-O(\xi+\max_jw_j).
$$
The base marks $B,BD$ still meet (3), so $\sum_{\mathcal C}|P_uS_u|^2\ll U^{1-K+\epsilon}$ with the stated height factors.

Write $E_u=\sum_A d_A\overline{\chi_A(u)}$ in the physical orientation. For the fixed list of original slots, $NA\ll U^a$ and $|d_A|\ll_\epsilon U^\epsilon(NA)^{-1/2}$. Let $d$ be the good reduced conductor of $\overline{\chi_A}\chi_{A'}$ and $d_6$ its product of local order-six primes. For fixed data let
$$
 T(A,A')=\sum_{u\in\mathcal C}|P_u(n,v)S_u(y,t)|^2
                  \overline{\chi_A(u)}\chi_{A'}(u).
$$
A sufficient open input is the **one-sided** upper bound
$$
 \sum_{Nd_6>U^{2c}}d_A\overline{d_{A'}}\,T(A,A')
 \ \ll_\epsilon U^{1-K+c+\epsilon}(1+|v|+|t|+H)^J.              \tag{5}
$$
The sum is real by exchanging the columns. The extra conductor satisfies $U^{.000006}<Nd_6\le Nd\ll U^{.000060}$. Every pair uses the same fixed physical class, zero masks and ordinary profiles, including the denominator log test when taking its height supremum.

For $Nd_6\le U^{2c}$ the absolute coefficient mass is $O_\epsilon(U^{c+\epsilon})$. Write $A=g i^6 A_0$, $A'=g j^6 A'_0$ after removing the common gcd $g$, with coprime sixth-power-free $A_0,A'_0$. The normalized coefficient product is at most $U^\epsilon/[Ng\,(Ni\,Nj)^3\sqrt{NA_0\,NA'_0}]$. Summing $g,i,j$ costs a subpower. For $d=d_6d_0$ the remaining factor is at most $(Nd_6)^{-1/2}(Nd_0)^{-1}$, since every prime of $d_0$ has residual exponent at least two. There are at most $10^{\omega(d)}$ assignments of sides and valuations. The $d_6$ sum costs $U^{c+\epsilon}$ and the $d_0$ sum costs a subpower. Taking $|T(A,A')|\le\sum_{\mathcal C}|PS|^2$ retains the zeros at the common and removed primes. [Original prime coefficients and pair decomposition](extra-marks.md#expand-only-the-extra-factors)

Adding (5) therefore bounds the positive sum $\sum_{\mathcal C}|P_uS_uE_u|^2$ at the price in (5). Divide by the lower bound for $|E_u|^2$ on $\mathcal C$. In (4) one can now use $W=(W_P+W_S)/2+a$ and $e=c$, up to freely chosen losses. With $\delta_{\min}=.425$, $p_{\min}=.49995$ and $k_{\max}=1-p_{\min}(1+2\cdot.07599618)$, the spare physical power is at least
$$
 \frac{\delta_{\min}[4p_{\min}a-8k_{\max}\lambda-.8\cdot10^{-6}]-2c-9\eta}{4}
 >9.59\cdot10^{-7}.
$$
This implication takes fixed-height sums on $\mathcal C$ and uses Sobolev only after reconstructing the positive moment. Enlarging the row set inside an individual signed pair would change (5).

## The existing selected-Poisson inequalities

The total ordinary length $L=n+y$ exceeds $7/9$ by more than $.02322$, beyond the improved total-length anchor range. Liu's unequal-moment comparison includes independent fixed unitary twists and provides a simultaneous scalar model for its positive estimates. One can also see the limitation directly on the top unshortened side of the selected-Poisson return. Write $W$ for the root mark width, $u$ for the selected width, $H'=1-6u$ for the side scale, and $s'=W-u$ for the remaining width. If $W\ge(1-L)/2$, the volume gate $1-L-W-4u>0$ in Proposition 8.11 forces
$$
 H'-2n>(1+3y-5n)/4>.00055.
$$
Both actual unshortened factors are below the half-length at the maximal side conductor. At the allowed high-value class $\nu=e'=1/2$, the short and long excesses in (48)–(49) satisfy, at every cutoff $w$,
$$
 A_s\ge(L-H'w)/2,\qquad
 A_l\ge-5H'/6+H'w/2+(L+s')/2 .
$$
Here $\min(s',H'\sigma(w))\le s'$ in the short expression and the long cutoff is at least $3w/2$. Averaging eliminates $w$ and gives
$$
 \inf_w\max(A_s,A_l)-u
 \ge L/2+W/4-5/12+5u/4
 \ge (9L-7)/24+5u/4 > .00870+5u/4 .
$$
The side allowance in that argument is $u$. This calculation concerns its pointwise treatment of the unshortened factors on the top side. Equations (1) and (5) use the actual two ordinary polynomials jointly. [Liu, §§7.2 and 8.6–8.9](https://hexagonmath.org/pdf/2611.00421v1)

Run the [exact rational checks](asymmetric_ordinary.py) with `python3 -OB auto-research/continuum-local-return/asymmetric_ordinary.py` from the repository root. Prepared with OpenAI Codex assistance.
