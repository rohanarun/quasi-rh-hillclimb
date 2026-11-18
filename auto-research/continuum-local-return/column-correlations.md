# Correlations of the squarefree detector columns

Assume the preprint's 7/8 theorem and the cited physical estimates of tracker #143. Let $q_n=Nn$ for ideals of the Eisenstein integers. Fix a shift, fixed labels, dyadic scales and the powerful row part $w$ from the [squarefree column reduction](coprime-columns.md). Write $X=U^x$, $Y=U^y$, $L=XY=U^s$ for the shifted lengths. A fixed column before the varying sextic symbol is applied has the form

$$
 \lambda_n=L^{-1/2}1_{n\ {\rm squarefree}}\sum_{ab=n}\alpha(a)\beta(b).
$$

The two annular coefficients include their original bumps, Möbius signs where appropriate, real norm powers in the scaled variables, heights and the full factor $\nu(n)\chi_n(\xi w)^{\varsigma}$ from the row decomposition, including its moving phases and zeros. They are bounded and supported at $q_a\asymp X$, $q_b\asymp Y$. Fixed small-prime exclusions enter in both. For applications to a particular row use its own norm parameters. The moving row symbol is $J(k,n)=(k/n)_6$ or its complex conjugate, extended by zero at nonunits. Write $P_k=\sum_n\lambda_nJ(k,n)$ in the chosen orientation. The [four-factor estimates](four-factors.md) require a second moment of price $U^{553/500+\epsilon}$ for a mixed column or $U^{63/50+\epsilon}$ for a two-inverse column.

## Large common divisors on the buffered rows

For a squarefree ideal $d$ write $P_{d,k}=\sum_{d\mid n}\lambda_nJ(k,n)$. On each buffered row,

$$
 |P_{d,k}|\ll_\epsilon U^\epsilon L^{\delta/2}q_d^{-(1+\delta)/2}.
$$

Each term assigns every prime of $d$ to exactly one of $a,b$. For a fixed assignment $d=d_1d_2$ extract the two ideal factors. This costs $q_d^{-1/2}$ in central normalization. The residual squarefree coprime column at $X/q_{d_1},Y/q_{d_2}$ has the additional exclusion of all primes of $d$. The character and Möbius factors at $d_i$ have magnitude at most one. The reverse Euler identity of the [coprime column proof](coprime-columns.md) bounds the residual by $U^\epsilon(L/q_d)^{\delta/2}$. In that identity the restricted local polynomial becomes one at primes of $d$. Its ratio to the unrestricted local factor has absolute series norm at $3/5$ bounded by $(1-q_p^{-3/5})^{-2}$ there. The product over $p\mid d$ is $O_\epsilon(q_d^\epsilon)$, by splitting off a fixed finite set of small primes. This also covers primes already excluded by the row. Unit-sized scales use the bounded-support convention of the same proof. There are at most $\tau(d)$ assignments and nonempty terms have $q_d\ll L$. All small powers can therefore be included in the prescribed loss. This argument allows different heights for the two blocks.

In $|P_k|^2$ let $E_{>W,k}$ be the signed sum of the terms with $q_{(n,n')}>W$, for $W\ge1$. Möbius inversion on ideals gives

$$
 E_{>W,k}=\sum_d c_W(d)|P_{d,k}|^2,\qquad c_W=\mu*1_{q>W}.
$$

Here $c_W(d)=0$ for $q_d\le W$ and $|c_W(d)|\le\tau(d)$. Only squarefree $d$ contribute. Ideal counting and the last estimate give

$$
 |E_{>W,k}|\ll_\epsilon U^\epsilon L^\delta W^{-\delta}.
$$

For example, sum $q_d^{-1-\delta}$ dyadically past $W$ and absorb divisor bounds for $q_d\ll L$ in $U^\epsilon$. The original bin has $O(U^{R+\epsilon})$ rows by #143. Uniformly on each retained fibre, summing absolute errors thus costs at most $U^{R+\delta s+\epsilon}W^{-\delta}$. With $t_0$ and $\ell_0=10^{-6}$ the cutoff and length tolerance of the four-factor argument, the mixed case has $s\le t_0+2\ell_0$ and the two-inverse case $s\le4t_0/3+2\ell_0$. Substitution in $R=1/6+(5/6-\delta)t_0$ gives the following sufficient cutoffs. The strict inequalities have [rational guards](four_factors.py).

| Column | $W$ | Bound for the aggregate large-gcd error, with a strict exponent margin |
|---|---|---|
| Inverse and ordinary | $U^{1/250}$ | $<U^{553/500}$ |
| Two inverses | $U^{1/50}$ | $<U^{63/50}$ |

With the smaller choice $W=U^{1/100000}$ there is a different conclusion. On rows selected for the given shifted spike, $|P_k|^2\gg U^{-\epsilon}L^\delta$. Choosing the aggregate losses below $\delta/100000$ gives $|E_{>W,k}|\le |P_k|^2/2$ for sufficiently large $U$. Hence the complementary signed sum is positive and at least half the squared spike **on these rows**. Its sum over each selected subfibre at the original moment price would suffice in the previous count. An estimate for a signed sum over an enlarged row set does not bound its restriction by positivity.

## Testing the actual divisor weights against sextic Gauss sums

Let $G(n,1)$ be the centrally normalized sextic Gauss sum of Xu and Sang. On squarefree good ideals it has modulus one. Consider

$$
 v_n=L^{-1/2}1_{n\ {\rm squarefree}}G(n,1)\xi(n)V(q_n/L),
$$

where $V$ is a fixed smooth annular function and $\xi$ is completely multiplicative with $|\xi|\le1$. A fixed ray-class restriction, the conjugate Gauss sum and additional individual prime exclusions are allowed. For every such vector the actual divisor coefficients satisfy

$$
 |\langle\lambda,v\rangle|^2
 \ll_\epsilon U^\epsilon\big(X^{-1}+Y^{-1}+L^{-1/3}\big).
$$

Indeed, split $a,b$ into finitely many ray classes. On each piece, the Chinese remainder formula for $G(ab,1)$ leaves a fixed phase times $G(a,1)G(b,1)(a/b)_6^2$. For noncoprime squarefree $a,b$ the cubic symbol is zero, precisely the required exclusion. Separate $V(q_aq_b/L)$ by Fourier inversion in the log norm. Its Fourier transform is integrable, and each norm phase separates with modulus one. The resulting bilinear form has independent coefficient vectors of squared norms $O(X)$ and $O(Y)$. Cauchy–Schwarz and Heath-Brown's cubic large sieve bound its square by $O_\epsilon(U^\epsilon XY[X+Y+(XY)^{2/3}])$. The two central normalization factors supply $1/L^2$ after squaring. The conjugate orientation has the same estimate. Moving twists, including $J(h,n)$ for arbitrary fixed $h$, stay in the bounded individual coefficients. The underlying cubic bilinear method also appears in Subhanjan Das's earlier estimate for prime marks. [Gauss product formula, §4](https://arxiv.org/html/2610.17675v2#S4) · [Cubic sieve with these squarefree ideal conventions](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7486-L7508) · [Das's mark calculation](../inverse-capacity/STRUCTURED_MARK.md).

This also bounds part of the row moment. Fix the norm parameters and a family of $J_0$ such vectors, independently of the row, with uniformly bounded profile seminorms and positive definite Gram matrix of least eigenvalue $h$. Let $E$ be their span and $\Pi_E$ its orthogonal projection. For $J_0/h\le U^{4/25}$ the contribution $\sum_{k\ {\rm sf},q_k\ll U}|\sum_n(\Pi_E\lambda)_n J(k,n)|^2$ is strictly below the required price in both columns. Indeed the squared projection norm is at most $h^{-1}\sum_v|\langle\lambda,v\rangle|^2$. De Faveri's squarefree sextic sieve costs at most $U^{1/3+5s/6+\epsilon}$ for $1<s<2$. Thus the moment exponent is at most

$$
 1/3+5s/6+4/25-\min(x,y,s/3)+\epsilon.
$$

The length and shift ranges give $\min(x,y,s/3)>0.375$ in the mixed case and $>0.500$ for two inverses. The [exact replay](four_factors.py) compares the resulting upper bounds to both prices. For a rowwise choice of the norm exponents and heights, hold $E$ fixed when applying Sobolev on their compact real ranges and unit height intervals. Each mixed first derivative just inserts bounded log weights on the scaled annuli. The same uniform bound applies after projection, since the projection is fixed. Summing the height intervals costs the prescribed polynomial factor, absorbed by the physical small-height choice. This proves that one may subtract these projected columns before seeking the remaining moment, using the triangle inequality in the row norm. The estimate gives no description of the full large-eigenvalue subspace of the sextic sieve. [De Faveri, Theorem 1.1](https://arxiv.org/html/2610.04045v1#S1) · [Sextic normalization, equation (1.2)](https://arxiv.org/html/2610.17675v2#S1.SS1).

## Dual frequencies in the complete squarefree row moment

Here is an application that needs no hypothesis on a Gram matrix. Work with fixed norm parameters, $w$ and dyads. Majorize the full positive squared sum on the selected squarefree rows by the complete squarefree sum with a fixed smooth nonnegative radial majorant at $K\asymp U/q_w$. Split the columns into the finitely many primary classes modulo $36$ using Cauchy–Schwarz before opening each square. A column product then has the same class on its two sides, as required in the preprint's pair Poisson formula. We retain the original column coefficients. The fixed good-row exclusion $S$ can be imposed explicitly. Additional row restrictions may be dropped in this positive majorization.

Write $B_0=U^b$, taking $b=81/100$ for the mixed column and $b=111/100$ for the two-inverse column. In the expansion over the complete squarefree rows the terms with $q_{(n,n')}>L/B_0$ are already below the respective moment prices. To see this use $c_{L/B_0}$ from the large-gcd proof and bound the resulting nonnegative squares separately. At $d\mid n$ the shortened coefficients are $\lambda_{da}$, the row symbol at $d$ has modulus at most one and the column cutoff is $O(L/q_d)$. The total coefficient mass satisfies
$$
 \sum_d\tau(d)\sum_a|\lambda_{da}|^2
 \ll U^\epsilon\|\lambda\|_2^2\ll U^\epsilon
$$
by the divisor bound and the annular ideal count. De Faveri therefore bounds the magnitude of this part by $U^\epsilon(U+B_0+U^{5/6}B_0^{1/3}+U^{1/3}B_0^{5/6})$. This use of complete rows has its own cutoff, larger than the one available on the buffered rows.

For the remaining terms let $g=(n,n')$, $L'=L/q_g\ge B_0$ and write $n=ga$, $n'=ga'$ with $(a,a')=1$. Squarefreeness of the indices is built into the coefficients. The common row factor at $g$ is $1_{(k,g)=1}$. Write $1_{k\ {\rm squarefree}}=\sum_{j^2\mid k}\mu(j)$ and impose the mask $(k,gS)=1$ by restricting $(j,gS)=1$ and using $r\mid g\prod_{p\in S}p$ in the quotient. The coefficient is $\mu(j)\mu(r)$. Then $k=j^2 r m$ and the complete smooth row scale is $M=K/(q_j^2q_r)$. The phases from $j^2r$ enter separately on the two sides. The remaining row sum over $m$ is the source's unit-trivial paired ideal character, with its conductor and zero extension intact. On good rows it agrees with the original pair; using this extension to all ideals after inverting the good-row mask is the source's construction. Nonempty radial row ranges have $M\gg1$. Since $L'\ge B_0$ and $q_a,q_{a'}\asymp L'$, every coprime pair here is nonprincipal for large $U$.

Poisson summation now gives nonzero dual ideals $h$ with $q_h\ll U^\epsilon (L')^2/M$ after a rapidly decreasing tail. The dual summand has prefactor $O(M/L')$ and separate unit Gauss factors on $a$ and $a'$ with multiplicative twists from $h$. The smooth Fourier weight in $Mq_h/(q_aq_{a'})$ separates by Mellin inversion on a small positive line with integrable vertical transform. The normalized annular powers and the small real shift cost at most $U^\epsilon$. This assertion uses the separated arithmetic factors themselves before the source takes its arbitrary-coefficient bound. All operations before Mellin separation have polynomially many terms of polynomial size, so the transform tail can be made negligible after their summation. [Paired Poisson formula and coefficient factors](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4813-L4953) · [Common-divisor mask in the same formula](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4961-L4986).

For clarity, enforce $(a,a')=1$ inside each separated dual summand by Möbius inversion in $d\mid(a,a')$. On one side $a=dc$. The resulting column sum has coefficients $\lambda_{gdc}$ times the normalized Gauss factor at $dc$, a bounded multiplicative twist, and separated annular powers. For nonempty terms $gd$ is squarefree. Assign its primes to the two original column factors as above, which gives scales $X'',Y''$ with $X''\le X$, $Y''\le Y$ and $X''Y''=L' /q_d$. The Gauss factor at $dc$ splits by CRT into the Gauss factor at $c$, a bounded scalar and a multiplicative twist on $c$, upon subdivision into the fixed ray classes. All primes in $gd$ are excluded from $c$. By the preceding cubic bound, with the testing vector's factor $(X''Y'')^{-1/2}$ removed, this one-sided sum has magnitude at most
$$
 U^\epsilon (q_gq_d)^{-1/2}\sqrt{X+Y+(L')^{2/3}} .
$$
There are divisor-boundedly many assignments, and nonempty annuli of scale below one are bounded below by a fixed constant. The bound applies to both sides and to all the Mellin phases. Summing the products over $d$ costs $O(U^\epsilon)$ beyond the factor $q_g^{-1}$ since $\sum_{q_d\ll L'}1/q_d\ll\log(2L')$.

Write $h=h_0 v^6$ with $h_0$ sixth-power-free. Among $q_h\le H$ there are $O_\epsilon(H^{1/6} V^{5/6+\epsilon})$ ideals with $q_{\operatorname{rad}(h_0)}\le V$, for $H,V\ge1$. For each squarefree $a=\operatorname{rad}(h_0)$ there are at most $5^{\omega(a)}$ exponent choices, each with $q_{h_0}\ge q_a$. Sum $(H/q_a)^{1/6}5^{\omega(a)}$ over $q_a\le V$ by ideal counting. This includes any primes of $S$. On multiplying the per-frequency bound by this count at $H\ll U^\epsilon (L')^2/M$, these terms cost at most
$$
 U^\epsilon\frac{M^{5/6}V^{5/6}}{q_g}
 \left(1+\frac{X+Y}{(L')^{2/3}}\right).
$$
This estimate bounds the absolute value after summing the two columns at each frequency. For the remaining sums use $\sum_j q_j^{-5/3}<\infty$, the divisor bound on the choices of $r$, and $\sum_{q_g\ll L}1/q_g\ll\log(2L)$. Put $z=\log_U V$. Since $K\ll U$ and $L'\ge B_0$, the total exponent is at most
$$
 5/6+5z/6+\max(0,\max(x,y)-2b/3)+\epsilon.
$$

| Column | $b$ | Radical of the sixth-power-free dual core covered | Price |
|---|---|---|---|
| Mixed | $81/100$ | $q_{\operatorname{rad}(h_0)}\le U^{7/100}$ | $553/500$ |
| Two inverses | $111/100$ | $q_{\operatorname{rad}(h_0)}\le U^{49/100}$ | $63/50$ |

The [rational checks](four_factors.py) verify strict margins for both the large-gcd and dual-core parts. These bounds apply also to the derivative columns when first using Sobolev to majorize rowwise choices by integrals of fixed-parameter positive squares. In using the reduction, take a complete positive majorant before estimating signed parts. What remains is to bound the signed contribution of the larger dual cores in that complete moment (or directly the original, smaller physical fibre). A bound on the full sum of their *absolute* contributions would suffice but is stronger than required. The variable in this cutoff is precisely the dual ideal in the paired Poisson formula after removing the indicated row and common-column divisors.

## Exact coprimality for general coefficients

The distinction between the structured and general coefficient problems persists even with exact coprimality *across* the square. Here is a consequence of Xu and Sang's lower bound. Fix $1<s<2$ and $\eta>0$. For all sufficiently large $U$ there exist complete squarefree row and column annuli with upper endpoints between $U^{1-\eta}$ and $O(U)$, and between $U^{s-\eta}$ and $O(U^s)$ respectively, and a nonzero coefficient vector $b$ on the column annulus such that
$$
 |C(I,H;b)|\ge U^{1/3+5s/6-\eta}\|b\|_2^2,\qquad
 C(I,H;b)=\sum_{k\in I}^{\rm sf}\sum_{(a,a')=1}
 b_a\overline{b_{a'}}J(k,a)\overline{J(k,a')}.
$$
All ideals are good primary ideals in the fixed base family. At these lengths the form contains no diagonal pairs. The assertion is about its absolute value with unrestricted coefficients. [Xu–Sang, Theorem 1.1](https://arxiv.org/html/2610.17675v2#S1.SS1).

Write $D(A,B)=A+B+A^{5/6}B^{1/3}+A^{1/3}B^{5/6}$. First, $|C|\ll_\epsilon (AB)^\epsilon D(A,B)\|b\|_2^2$ for any row subset up to $A$ and column support up to $B$, with $A,B\ge2$. Expand $1_{(a,a')=1}$ by Möbius inversion, remove the row mask at the extracted divisor in each nonnegative square, and apply de Faveri as in the complete high-gcd bound. The total shortened squared norms cost at most a divisor bound times $\|b\|_2^2$.

Start from the full positive square at cutoffs $U,U^s$ realizing the Xu–Sang lower bound up to an arbitrarily small power loss. Dyadically partition the column vector by Minkowski and Cauchy–Schwarz, then subdivide the positive row sum. Some pair of annuli $I_0,H_0$ and a vector $\lambda$ there retain the exponent $f=1/3+5s/6$ up to an arbitrarily small loss relative to $\|\lambda\|_2^2$. The possible unit ranges may be included separately. Open the square and extract the exact ideal gcd $g$. On squarefree rows the remaining mask $1_{(k,g)=1}$ can be removed without a permanent restriction on the row set. The ideal identity is
$$
 \mu^2(k)1_{(k,g)=1}
  =\sum_{v m=k,\ \operatorname{rad}(v)\mid g}(-1)^{\Omega(v)}\mu^2(m).
$$
Locally at $p\mid g$ this is $(1+T)^{-1}(1+T)=1$. Multiply the identity by the completely multiplicative paired symbol, retaining its zeros. The original dyadic energy is exactly the sum over $g,v$ of
$$
 (-1)^{\Omega(v)} C(I_0/q_v,H_0/q_g;b^{g,v}),\qquad
 b^{g,v}_a=\lambda_{ga}J(v,a),\quad \operatorname{rad}(v)\mid g .
$$
For $q_v\ll U$, $q_g\ll U^s$, the number of such $v$ for each $g$ is $O_\epsilon(U^\epsilon)$, by Rankin's inequality at an arbitrarily small positive abscissa and $\prod_{p\mid g}(1-q_p^{-t})^{-1}\ll_{t,e}q_g^e$ for every $t,e>0$. Since $\sum_g\sum_a|\lambda_{ga}|^2\ll U^\epsilon\|\lambda\|_2^2$, one unpunctured annular form has absolute value at least $U^{f-o(1)}$ times its squared coefficient norm, in the sense of any fixed exponent loss. At $(A,B)=(U,U^s)$ the last monomial in $D$ strictly exceeds all the others. Shrinking either length exponent by $\eta$ costs at least $\eta/3$ on this last monomial. Applying the upper bound for $C$ with a sufficiently small preliminary loss proves the stated length localization. Unit ranges fail the same comparison. The rational replay checks that $f$ exceeds both proposed moment prices on the respective physical length intervals. The lower bound supplies neither the detector's divisor weights nor the selected physical rows.

The target all-moduli boundary remains open. Prepared with OpenAI Codex assistance, building on the cited work of OpenAI, Heath-Brown, de Faveri, Xu, Sang, Das, Collet, Sil, Bebel and Arun.
