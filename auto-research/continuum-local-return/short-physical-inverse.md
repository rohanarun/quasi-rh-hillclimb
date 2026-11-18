# A short inverse factor of the physical denominator

Assume the preprint's $7/8$ theorem and the physical and marked estimates of tracker #143. Consider the remaining physical integral at the proposed endpoint $17466917/20000000$. The [physical denominator reduction](physical-denominator.md) gives a normalized inverse dyad of length $U^r$ for the actual denominator presentation, with
$$
 1.22649<r<1.22654,\qquad |M_u(r;s)|\ge U^{\delta r/2-\eta},\qquad \eta=10^{-7}.
$$
On the remaining rows one can replace this condition by one involving a much shorter inverse of that same presentation, of length $U^z$ with $.0974<z<.0987$. In particular an **unmarked** mixed moment of exponent $1.009$ involving this short inverse and the actual reflected numerator would suffice for the proposed endpoint. A sufficient estimate involving the short inverse alone is an eighteenth moment of exponent $1.00029$. These moment estimates remain open.

## Localization by the exact inverse identity

Use the source cutoff $t_0$ on the original physical bin and put $b=2t_0/3$, $m=t_0/3$, $\lambda=10^{-5}$ and $A=U^{t_0-2\lambda}$. Write $f(n)=\psi_u(n)$, $h(n)=\mu(n)\psi_u(n)$ and $h_A(n)=h(n)V(Nn/A)$, where $V$ is smooth, equals one up to one and vanishes from two onwards. These are ideal coefficients with the literal original nonunit zeros, so $h*f=\boldsymbol1$ with $\boldsymbol1$ the convolution identity. Consequently
$$
 h=h_A-(f*h_A-\boldsymbol1)*h .
$$
The coefficients of $f*h_A-\boldsymbol1$ vanish for norm at most $A$. Choose a smooth function $G$ equal to zero up to $1/2$ and one from one onwards. Then $f*h_A-\boldsymbol1$ is exactly $(f*h_A)(n)G(Nn/A)$ coefficientwise. In the dyad at $U^r$ the $h_A$ term vanishes, since $U^r/A$ tends to infinity. This leaves three factors in which the first inverse and the ordinary factor have product norm greater than $A/2$. The second inverse is unrestricted.

Insert a smooth annular dyadic partition in the three variables, including the unit dyad. Write $x,y,z$ for their log lengths in that order. Each nonzero triple satisfies
$$
 x\le t_0-2\lambda+O(1/\log U),\quad
 x+y\ge t_0-2\lambda-O(1/\log U),\quad
 x+y+z=r+O(1/\log U).
$$
Separate the original smooth total-norm profile and $G$ by Fourier inversion in the logarithms of the total norm and the first two norms' product. Insert fixed compact smooth cutoffs equal to one on the dyadic supports. The rescalings of $G$ and $V$ have uniformly bounded fixed log derivatives there: outside their transition they are constant. The original real norm power is bounded on the total annulus. The original imaginary twist appears on all three factors. The two Fourier shifts are common to the first two factors and only the total-norm shift acts on the short inverse. Choose each truncation at $T_1/16$ and then a sufficiently large fixed tail order. The source norms are polynomially bounded, and the original height is at most $T_1/4$. Normalizing at the three dyadic centers changes the scalar by bounded factors. These are the same separations used in the [ordinary and inverse factor proof](long-blocks.md#smooth-factorization-and-the-three-spikes).

There are $O((\log U)^3)$ triples. The triangle inequality, the bounded Fourier masses, and the lower bound on $|M_u(r;s)|$ therefore give some triple and frequencies with product magnitude at least $U^{\delta r/2-\eta-o(1)}$. The buffered pointwise bounds on the three factors, with arbitrarily small preliminary losses, give on this same triple
$$
 |M_u(x)|\ge U^{\delta x/2-1.5\eta},\qquad
 |S_u(y)|\ge U^{\delta y/2-1.5\eta},\qquad
 |M_u(z)|\ge U^{\delta z/2-1.5\eta}.
$$
Here and below preliminary losses can be chosen smaller than the fixed slack in these inequalities for all sufficiently large $U$. [Pointwise estimates and allowed heights](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4388-L4499)

Apply the [single-factor comparisons](four-factors.md) with the present $\lambda$. Excluding $b+\lambda\le x\le t_0-\lambda$ or $y\ge m+\lambda$ costs $O(U^{R-\eta})$ original rows, where $R$ is the physical class-count exponent. Indeed the unsaturated debit on a fourth moment is at most $6\eta$, and on a second moment at most $3\eta$. At the tangent edges the margins are at least $\delta k\lambda$ and $2\delta k\lambda$, where $k=1-p(1+2g_1)$. The amplified inverse edge has margin at least $(5/6-\delta)\lambda$. These and all fixed fallback margins exceed $10\eta$ on the full rectangle. The anchor lengths are a fixed distance below the cutoff of $h_A$, so the inverse profile there is the original bump. The other moments accept its uniformly smooth norm factor, equivalently separated by a further Fourier shift within the height budget. The rowwise height suprema and the logarithmic number of dyads are covered as in the source. This exclusion applies to the fixed denominator orientation even if another presentation supplied the original detector zero. Hölder in the original marked fourth moment handles these excluded rows in the physical return.

All remaining triples satisfy
$$
 b-4\lambda<x<b+\lambda,\qquad m-4\lambda<y<m+\lambda,\qquad
 r-t_0-3\lambda<z<r-t_0+4\lambda .
$$
This follows by subtraction in the three support inequalities, absorbing each fixed support error by taking $U$ large. The parameter bounds $1.12796<t_0<1.12903$ give the asserted short interval for $z$. The selected short inverse is an original smooth dyad of the physical denominator with a norm twist of size at most $T_1/2$. [Exact parameter and loss checks](four_factors.py)

## A sufficient unmarked moment

Keep the physical numerator $P_u(N,v)$ and its original reflected dyad $x_0-10^{-6}<\log_U N\le x_0+.80\cdot10^{-6}$. Let $M_u(Z',t)$ denote a normalized inverse of the physical denominator at the common dyadic scale $Z'=U^z$, with the fixed smooth partition profile and norm twist $t$. It suffices, uniformly at fixed heights $t,v$ and the indicated dyads, to prove
$$
 \sum_u |P_u(N,v)|^4 |M_u(Z',t)|^2
 \ll_\epsilon U^{1.009+\epsilon}(1+|v|+|t|+H)^J .
$$
Here $H$ bounds any fixed external parameters and $J$ is a fixed height degree. One may sum over the original critical physical rows. An estimate over all nonprincipal physical rows in the norm dyad also suffices by positivity. Allow the fixed short test and its first log-norm multiple. Sobolev's inequality on the interval $|t|\le T_1/2$, enlarged by one, bounds the squared height supremum by the integral of $|M|^2+|\partial_t M|^2$. Using the normalized twist $(Nn/Z')^{-it}$ makes the derivative exactly the second test up to a scalar of modulus one. The fixed height powers are paid by the original choice of $T_1$ and the rapid weight in $v$. The short witness can thus be selected separately on each row. Summing over its possible dyads costs $O(\log U)$.

On those rows the proposed moment bounds the ordinary fourth moment by $U^{1.009-\delta z+3\eta+\epsilon}$ up to those height factors. The class count and Hölder give a physical exponent at most $(3R+1.009-\delta z+3\eta)/4$. The inherited exponent is $(3R+1)/4-qz_0/2$, where $q=\delta p$ and $z_0\le3/40$ is the original physical prime width. The required gain is $3\eta/4$, and the comparison has room because
$$
  \delta z-2qz_0-.009-6\eta
 \ge .425(.0974)-.4267(.075)-.009-6\eta>.00039 .
$$
The coefficient-dilation damping is nonpositive in the exponent and can be dropped. All discarded dyads, height tails, original filters and coefficient masses retain their [physical bounds](marked-window.md). This proves the implication without altering either physical character. The known unmarked fourth moment for two ordinary factors does not supply the third, Möbius-weighted factor in this estimate.

## A sufficient fourth moment for one presentation

The same localization gives an alternative involving only the physical denominator. Take its actual ordinary dyad $S_u(y)$ and short inverse $M_u(z)$ from the triple above, with their respective norm heights. An upper bound
$$
 \sum_u |S_u(y)M_u(z)|^4
 \ll_\epsilon U^{1.028+\epsilon}(1+|t_1|+|t_2|+H)^J
$$
at the indicated lengths and fixed heights would suffice. As above one may enlarge to the whole nonprincipal physical family. The estimate should cover each fixed smooth test and its first log-norm multiple in both variables. Apply the one-dimensional $W^{1,4}$ inequality to each factor on an interval of length one and multiply the two integral bounds. Integrating over both height ranges gives the rowwise height suprema at the cost of a fixed polynomial in $T_1$. The product is large on every remaining row. Its fourth power is at least $U^{2\delta(y+z)-12\eta}$. The lower bounds on $R,t_0$ and the two lengths give
$$
 R+2\delta(y+z)
 > .62567+2(.425)(1.12796/3-4\lambda+.0974)>1.028014 .
$$
The proposed upper bound therefore counts these rows within $O(U^{R-\eta})$, with room for all fixed debits and preliminary losses. Applying the original marked fourth moment on this small set saves the required $3\eta/4$ in the physical mass. This alternative needs one character presentation and no prime factors in its summand. Its ordinary and Möbius factors carry distinct coefficient sequences and can have different norm heights. The mixed fourth moment at this price is open. Its second moment over all element rows has the diagonal-order bound $O_\epsilon(U^{1+\epsilon})$. Apply the two-ordinary-factor theorem with one ordinary factor at $y$, the unit term as the other factor, and the short inverse as the coefficient polynomial at $z$. The length guards give $y<1.12903/3+10^{-5}$ and $z<.09862$, so $y+5z<1$ and $y+4z<5/6$. The corresponding application to the fourth moment would use widths $2y,2z$, outside these ranges. [Mixed moment proof](inverse-composite-mark.md#two-ordinary-factors-with-one-arbitrary-short-coefficient) · [Exact length comparisons](short_inverse.py) · [Required fourth-moment price](four_factors.py)

## A sufficient moment of the short inverse alone

One can also dispense with the ordinary factor in the proposed estimate. The exact relation $R=1-\delta C$ relates the necessary row count to the physical amplitude. In the notation of the [continuum count](long-blocks.md), $C<.877245$ and
$$
 t_0=1+\frac{\delta(1-p A)}{3(5/6-\delta)+2\delta(1-p B)},\qquad
 A=1+6g_0-4g_1,\quad B=1+2g_1 .
$$
The fraction increases with $\delta$ because the constant term in its denominator is $5/2$ and $1-pA>0$. It decreases with $p$ since $A(3(5/6-\delta)+2\delta)>2\delta B$. Decreasing $g_0$ or increasing $g_1$ increases it. At the corresponding bounds $\delta=.4267$, $p=.49995$, $g_0=.05805911$, $g_1=.07599620$, this gives
$$
 t_0\le17856999704356711/15817939984357080<1.12891,\qquad
 z>1.22649-1.12891-3\lambda=.09755 .
$$
In particular $R+9\delta z>1+.425(9(.09755)-.877245)=1.000299625$. A sufficient estimate at a common height for this physical denominator alone is therefore
$$
 \sum_u |M_u(Z',t)|^{18}
 \ll_\epsilon U^{1.00029+\epsilon}(1+|t|+H)^J .
$$
Allow the original smooth test and its first log-norm multiple. The one-dimensional $W^{1,18}$ bound on an interval of length one, followed by height integration, gives the required rowwise supremum. The eighteenth power on a surviving row is at least $U^{9\delta z-27\eta}$, so the stated moment saves more than $\eta$ in the count even after the fixed amplitude debit. The preceding physical Hölder estimate then applies. This formulation involves a single short smooth Möbius polynomial, with no prime amplifier, numerator, selected zero or phase condition in its summand. Its ninth power has combined column length below $U^{.889}$ for sufficiently large $U$. Its coefficient retains all nine dyadic divisor restrictions, so the currently available second moment of one long inverse dyad does not give the stated estimate. [Exact arithmetic checks](four_factors.py)

### Terms already bounded in the eighteenth moment

For this sufficient estimate one can enlarge the positive row measure to all Eisenstein elements on a smooth norm shell of scale $U$. Choose a fixed nonnegative smooth radial weight dominating the physical annulus. The resulting square of the ninth power has column coefficients $\lambda_C$ from nine copies of the short dyad. Absorb the fixed target character, original excluded primes and norm twists in them. They satisfy $|\lambda_C|\ll_\epsilon U^\epsilon (NC)^{-1/2}$ by the fixed divisor bound and are supported on $NC\ll U^{9z}$, with $9z<.8883$. For the log-norm test needed by Sobolev the same bound holds, since its argument stays on a fixed annulus. The row dependence is a single sextic symbol $\chi_C(u)$ or its conjugate. On this larger measure the following parts already have squared cost $O_\epsilon(U^{1+\epsilon})$.

* First remove columns whose largest square divisor has square root of norm at least $U^{.1942}$. For a fixed ideal $g$ of norm at least $U^{.3884}$, the columns divisible by $g$ give a polynomial of squared row norm $\ll_\epsilon U^{1+\epsilon}/Ng$. Indeed remove the common factor $\chi_g(u)$ by its modulus bound. The remaining vector is supported on norms $\ll U^{.8883}/Ng\ll U^{1/2}$, with coefficient bound $U^\epsilon(Ng\,Nn)^{-1/2}$. This applies to every column projection obeying the same envelope. Decompose the variable columns as $n=j^6 n_0$ and the rows as $(u)=v^6 u_0$, with $n_0,u_0$ sixth-power-free. For fixed $j,v$ the two sixth powers give separate coprimality masks. The $n_0$ vector norm is $\ll U^\epsilon/[(Ng)^{1/2}(Nj)^3]$, and Minkowski sums the $j$ cost. At $Nv\asymp U^\nu$, use de Faveri's sieve at row length exponent $1-6\nu$ and column length exponent at most $1/2$. The maximum of the four upper exponents, including the $v$ count, is $\nu+\Phi(1-6\nu,1/2)$, where $\Phi(A,B)=\max(A,B,5A/6+B/3,A/3+5B/6)$. This convex function is at most one at both ends of $0\le\nu\le1/6$. Bounded endpoint factors, units and good primary ray subdivisions are harmless. At the fixed bad primes the sixth-power-free parts have bounded exponents and can be fixed before applying the sieve. Möbius inversion of the large-square-root indicator now gives a sum of the polynomials with $g=d^2$, $Nd\ge U^{.1942}$, with coefficients bounded by $\tau(d)$. The triangle inequality and the harmonic sum of $\tau(d)/Nd$ prove the claim. Reinsert this block using the triangle inequality in the row norm, which bounds its cross terms along with its square. [Sixth-power-free sieve](https://arxiv.org/html/2610.04045v1#S1.SS1) · [Square-divisor projection](near-squarefree.md#remove-the-large-square-parts-before-expanding-the-square)
* In the square of the remaining polynomial remove pairs with $N(C,C')\ge U^{.3884}$. Möbius inversion of this indicator gives a sum of squared norms of the projected polynomials divisible by $g$, with $Ng\ge U^{.3884}$ and coefficients bounded by $\tau(g)$. The preceding estimate and harmonic summation again cost $O_\epsilon(U^{1+\epsilon})$.
* On the residual pairs write $d$ for the primitive conductor at the good primes of $\chi_C\overline{\chi_{C'}}$ and $E=\operatorname{rad}(CC')/d$ for its extra nonunit mask. When $d=1$, the columns have the same sixth-power-free part. Writing them as $j^6 a,k^6 a$ bounds their total absolute coefficient mass by $U^\epsilon\sum_{Na\ll U^{.889}}(Na)^{-1}\big(\sum_j(Nj)^{-3}\big)^2\ll_\epsilon U^\epsilon$. Their row count is $O(U)$. When $d\ne1$ and $N\operatorname{rad}(CC')\le U^{.9999}$, expand the mask at $l\mid E$ and sum the primitive character by lattice Poisson at scale $U/Nl$. Its zero frequency vanishes and $U/(Nl\,Nd)\ge U^{.0001}$. Rapid decay gives any fixed power saving after the polynomial number of choices, uniformly on arbitrary subsets of these pairs. [Primitive element Poisson and masks](eighth-conductor.md#separate-the-small-reduced-conductors)

Thus a single signed sum over the complementary pairs, evaluated with the nine actual short-inverse coefficients and the smooth all-element row kernel, suffices at price $U^{1.00029+\epsilon}$. This use of the enlarged positive row measure requires no auxiliary prime filter. The sum on the complementary pairs is open. [Rational cutoff checks](four_factors.py)

The [all-element product estimates](short-product-moments.md) prove the full twelfth moment at the required length and the eighteenth moment at shorter scales. For the single physical inverse the forced prime sum gives a sharper eighteenth-moment bound throughout its required range. [Unmarked product estimate](short-inverse-density.md) · [Physical eighteenth moment](short-inverse-marked-density.md) · [Diagonal-order range](short-inverse-natural-range.md) A further reduction at the target price restricts each column to a [squarefree rational norm](rational-short-inverse.md) at nine slightly shortened scales. The square of this polynomial admits [dual-frequency estimates](short-inverse-frequencies.md), including all powerful dual ideals. Independently, [differencing a nonprincipal pair of the original columns](short-inverse-pairs.md) bounds any graph with at most $U^{.2041}$ partners per column for the complete row kernel.

Prepared with OpenAI Codex assistance.
