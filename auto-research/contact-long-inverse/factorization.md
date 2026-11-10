# Short inverse products at the long detector contact

This is a source-based reduction of the open estimate in [the return certificate](README.md). It gives a second, short-moment input sufficient for the same conditional scalar target \(\theta=0.87338\), and an obstruction to trying to prove it using separate magnitude estimates. No new zero-free boundary is established.

## Exact asymmetric splitting

Write \(M_{A}\) for the ideal Möbius function cut off at norm \(U^A\), with a smooth profile equal to one below the cutoff. Dirichlet convolution gives
\[
 \mu-M_A-M_B+M_A*M_B*1=(\mu-M_A)*(\mu-M_B)*1 .
\]
The right side has no coefficients below \(U^{A+B}\). On an annulus beyond the two individual cutoffs and below their product, the long inverse coefficient therefore equals \(-M_A*M_B*1\). Fixed support constants can be included by taking the product of the two cutoffs just beyond the annulus. This is the asymmetric two-factor form of the truncated inverse identity. It remains exact after twisting by a common Hecke character, including its zero extension. The identity does not impose any new coprimality condition on the factors. See [Helfgott–Thompson, equation (2.1)](https://doi.org/10.1007/s40993-022-00408-8).

Use the same \((\delta,p,d)\) window, \(s=1/8750\), \(\eta=1/64000\), and the C branch of the [return certificate](README.md). Denote its inverse and ordinary crossings by \(b_0,c_0\), with \(b_0+c_0=t_0\). Write \(V=5/6-\delta\) and \(A_C=2-4p/\Lambda\). The short marked inverse exponent at length \(b\) is \(I(b)=1-\delta[p+(1-p)b]\), and the local uncapped plain exponent is \(P(c)=1-\delta[2c+2p(B_{\rm face}-2c)/\Lambda]\). At the crossings \(I(b_0)=P(c_0)=L(t_0)=R_0\).

Let \(r\) be the long inverse witness length. The inherited long count handles \(r\le t_0-\eta/V\) up to the permitted losses. The cutoff \(t_0+s\) gives \(r\le t_0+s+o(1)\). Split the remaining witness using cutoff exponents \(1/5900\) and \(r-1/5900\). On dyadic factors the identity gives lengths \(a,b,c\) with \(a+b+c=r+o(1)\), \(a\le 1/5900+o(1)\), and \(b\le r-1/5900+o(1)\). Here \(a,b\) belong to inverse factors and \(c\) to a full ordinary factor.

The passage to a large product uses the usual smooth dyadic partition and Mellin separation of the common annular profile. The two cutoff profiles stay attached to their inverse factors. All three factors keep the original presentation and its zero extension. The extra Mellin frequency can be truncated at a small positive power by rapid profile decay, after the fixed derivative orders are chosen. The existing buffered pointwise estimates apply with these additional norm twists inside the height margin. In a fibre where the long inverse witness is large, some such product is large up to an arbitrarily small power loss. Each factor must then reach its corresponding pointwise exponent up to such a loss. In particular \(c\le 1/2+o(1)\) by reflection of the full ordinary factor. The analogous factorwise saturation argument is used for a cubic family in [bramble_trace, §5](https://rstation.ai/problems/riemann_hypothesis/papers/52/v4). Its cubic mixed moments do not cover the sextic family in this return.

## What the inherited moments cover

The long second factor \(b\ge1\) already gives the desired count since \(V(1/5900-s)>\eta\) throughout the window. For \(b<1\), the inherited short inverse bound suffices if \(b\ge b_0+\eta/[\delta(1-p)]\). The ordinary bound suffices if \(c\ge c_0+\eta/(\delta A_C)\). The shifted crossing checks in [the replay](replay.py) keep these thresholds inside the admitted window. Monotonicity and the inherited natural tail handle larger ordinary lengths.

Consequently the remaining product witnesses are contained in the following relative windows, with room for small losses.

| Factor | Range |
| --- | --- |
| \(a\) | \(0\le a\le 1/5850\) |
| \(b\) | \(b_0-1/4000\le b\le b_0+1/13000\) |
| \(c\) | \(c_0-1/3500\le c\le c_0+1/26000\) |

For the lower endpoints, use \(a+b+c=r+o(1)\) and \(r\ge t_0-\eta/V\). For example, \(b\ge b_0-[1/5900+\eta/V+\eta/(\delta A_C)]-o(1)\). The other lower endpoint uses \(\delta(1-p)\) in place of \(\delta A_C\). The bounds use \(\delta\ge417/1000\), \(\delta(1-p)\ge417/2000\), \(V\ge239/600\), and \(A_C\ge1\). The replay checks that \(b_0\in(0.750,0.756)\) and \(c_0\in(0.375,0.378)\) on the whole rectangle.

A sufficient open input is the inherited marked second moment of the medium inverse factor, improved on the common saturation fibres of \(M_a,M_b,S_c\):
\[
 \sum_{u\ \mathrm{in\ a\ common\ saturation\ fibre}}
         |M_b(u)Q_b(u)|^2 \ll_\epsilon U^{1-1/14000+\epsilon}.
\]
Here \(Q_b\) is the selected prime product from the inherited short inverse argument, of total length just below \((1-b)/2\), with the usual fixed coefficient labels and buffered profile and height uniformity. The saturation conditions concern the factor lengths in the table and the same row, presentation and separated norm twists. Proving the estimate for the larger subfamily defined only by saturation of \(M_b,S_c\) would also suffice. Compared with the original open long mean square, this input is a power saving on a short marked moment after restricting to a joint large-value fibre.

The count after this saving is at most \(I(b)-1/14000\), up to small losses. The worst permitted drop in \(b\) costs at most \(\delta(1-p)/4000\), and \(1/14000>\eta+\delta(1-p)/4000\) on the whole window. Thus this estimate would supply \(R_0-\eta\) for the long detector branch in the original return. Its arithmetic margins, including a buffer, are checked by [ContactFactorization.lean](ContactFactorization.lean) with Lean 4.34.1 and Std. The analytic estimate and its integration remain open.

[The squarefree reduction](squarefree.md) gives an alternative moment on the same fibres. It removes large repeated factors and fixes a sufficient exponent for the residual mixed polynomial.

## Why positive factorization alone stalls

The following extends the scalar simultaneous witness in [Liu §6.7](https://hexagonmath.org/pdf/2611.00082v1) to **every finite asymmetric choice of inverse cutoffs**. It concerns magnitude bounds and the existence of a saturated factorization. It imposes no signed convolution equations between the modeled polynomials.

At the ideal contact, let
\[
 \delta_*=(61-\sqrt{1081})/66,\qquad
 t_*=(5-3\delta_*)/(5-4\delta_*),\quad
 b_*=2t_*/3,\quad c_*=t_*/3 .
\]
Then \(p=1/2\), \(R_*=1-\delta_*(1/2+c_*)=1/6+(5/6-\delta_*)t_*\), \(c_*<1/2<b_*<1\), and \(2b_*>3/2\). For the last strict inequality, \(\delta_*>5/12\) implies \(t_*>9/8\). Use an abstract row set of size \(\lfloor U^{R_*}\rfloor\) with the same magnitudes on every row. Give the inverse polynomial squared magnitude \(U^{\delta_* r}\) for \(0\le r\le b_*\) and \(t_*\le r\le3/2\), and zero at other lengths. Give each prime slot squared magnitude \(U^{\delta_* z}\) at length \(z\), and set the ordinary squared magnitude at length \(m\) to \(U^{s(m)}\), where
\[
 s(m)=\min\{\delta_*m,\delta_*(1-m),\delta_*(c_*+m)/2,(1-R_*)/2\}.
\]

All separate moment constraints used in the comparison hold in this model. The short inverse moment with marked width \(z\le(1-r)/2\) follows from \(r\le b_*\) on its nonzero support and \(R_*+\delta_* (1+b_*)/2=1\). The unmarked long inverse estimate follows from \(r\ge t_*\) and the increasing slope \(5/6-\delta_*\). The ordinary moment for any two factors and marked length \(z\) follows from \(m_1+m_2+2z\le1\) and \(R_*+\delta_*(c_*+1/2)=1\). For zero marked length the separate cap \(s(m)\le(1-R_*)/2\) handles unrestricted ordinary lengths. The model saturates the ordinary pointwise exponent on \(0\le m\le c_*\). For every detector cutoff \(t\in[1,3/2]\), either \((b_*,c_*)\) when \(t\le t_*\) or \((t,0)\) when \(t\ge t_*\) is a saturated witness.

Now take any saturated inverse length \(r\) and any \(k\ge2\) nonnegative cutoff lengths with sum at least \(r\). Decrease the cutoffs if necessary so they sum to \(r\). In the term using all \(k\) inverse factors of the order-\(k\) truncated inverse identity there are \(k-1\) full ordinary factors. The asymmetric identity follows by expanding \((\mathop{*}_{i=1}^k(\mu-M_{A_i}))*1^{*(k-1)}\), whose coefficients below the product of cutoffs vanish. If all the decreased cutoffs lie in the saturated inverse ranges, take each inverse length equal to its cutoff and the ordinary lengths zero. Otherwise at most one cutoff is outside those ranges, since \(r\le3/2<2b_*\). That cutoff lies strictly between \(b_*\) and \(t_*\). Reduce its inverse factor length to \(b_*\) and put the excess, less than \(t_*-b_*=c_*\), into one ordinary factor. All chosen factors then saturate and their lengths sum to \(r\). The same construction works if an inverse factor is split again.

Thus positive factorization and the separate bounds above admit all these witnesses simultaneously at the contact. The construction gives no character family and does not obstruct estimates that retain the signed sum or prove new correlations. It explains why the restricted short moment above needs input beyond factorization and the known separate moments.

Prepared with OpenAI Codex assistance. This note uses the count and return of [tracker #103](https://github.com/GTimG/QuasiRiemannTracker/pull/103), Liu's simultaneous witness, and the standard truncated inverse identity.
