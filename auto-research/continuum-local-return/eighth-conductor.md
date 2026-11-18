# Reduced conductors in the common-height physical numerator

Assume the preprint's 7/8 theorem, the physical inputs to tracker #143 and de Faveri's sixth-order large sieve. Write $q_n=Nn$ for an ideal and $q_u=|u|^2$ for an Eisenstein element. Fix the original finite excluded set $S$, which contains the primes above 6. Take a complete dyad of sixth-power-free elements $u$ with $q_u\asymp U$, including their units and their sixth-power-free factors supported on $S$. Use a fixed nonnegative $W\in C_c^\infty((0,\infty))$ such that the radial weight $W(q_u/U)$ majorizes the dyad indicator. The physical numerator is the actual presentation $\psi_u(n)=\chi_n(u)$ on ideals outside $S$, extended by zero at the original nonunits. A fixed finite ray twist, or conjugating every symbol, gives the same argument. [Physical element rows](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7256-L7266)

For each fixed sample height $t$, the eighth moment on this complete dyad reduces to one signed sum over column pairs whose reduced character conductor has norm greater than $U^{31/20}$ and whose product of local order-six conductor primes has norm greater than $U^{7/6}$. The first excluded range costs $O_\epsilon(U^{125/96+\epsilon})$ and the additional excluded range costs $O_\epsilon(U^{47/36+\epsilon})$, uniformly in $t$. The reduction uses a common Dirichlet polynomial constructed below. The physical row is summed inside each pair correlation.

## Common polynomial and the remaining target

Put $X=U^{12}$, and let
$$
 P_u(t)=\sum_{q_n\le U^{13},\ (n,S)=1}e^{-q_n/X}q_n^{-1/2-it}\psi_u(n).
$$
For all sufficiently large dyads the rows here are nonprincipal, since the sixth-power-free elements supported on $S$ form a finite set, and every other row has a good prime ramified in its presenting character. The original primitive conductor is $O_S(U)$ and the norm of the deleted Euler radical is polynomial in $U$. Mellin inversion of the exponential and shifting the gamma contour to $-1/4$ gives
$$
 L_{\rm orig}(1/2+it,\psi_u)=P_u(t)+O_S(U^{-2}(1+|t|)^2).
$$
Indeed the displaced integral costs at most $X^{-1/4}U^{3/5+\epsilon}(1+|t|)^2$ by the strip bound and the deleted Euler bound on real part $1/4$. The omitted tail is exponentially small by ideal counting. This uses one cutoff and weight for all rows and keeps the original zero extension. [Physical presentations and ramification](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4220-L4271) · [Strip and deleted-factor bounds](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1423-L1545)

Write $P_u(t)^4=\sum_n\lambda_n(t)\chi_n(u)$, with the common fixed twist included in $\lambda_n$ when present. The coefficients are the exact ideal Dirichlet convolution of four original weights. They vanish at ideals meeting $S$, are supported on $q_n\le U^{52}$, and satisfy $|\lambda_n|\le d_4(n)q_n^{-1/2}$. In particular every forced zero at a good prime of $u$ is still in $\chi_n(u)$. Define
$$
 d(n,m)=\prod_{p: v_p(n)-v_p(m)\not\equiv0\bmod 6}p,\qquad
 K(n,m)=\sum_{u\ (6\text{-free})}W(q_u/U)\chi_n(u)\overline{\chi_m(u)}.
$$
Let $d_6(n,m)=\prod_{p:\,\gcd(6,v_p(n)-v_p(m))=1}p$, the product of primes of local character order six. Define $H_{>}(U,t)$ as the sum of $\lambda_n(t)\overline{\lambda_m(t)}K(n,m)$ over pairs satisfying both $q_{d(n,m)}>U^{31/20}$ and $q_{d_6(n,m)}>U^{7/6}$. This is real by interchanging $n,m$. The bounds below treat its complement, with one dyadic estimate for each excluded range. It therefore suffices to prove the following one-sided estimate.
$$
 H_{>}(U,t)\ \le\ C_\epsilon U^{653/500+\epsilon}(1+|t|)^J.                              \tag{1}
$$
Then $\sum_u W(q_u/U)|L_{\rm orig}(1/2+it,\psi_u)|^8\ll_\epsilon U^{653/500+\epsilon}(1+|t|)^{\max(J,16)}$, by the eighth-power triangle bound and the approximation error. On the critical rectangle the physical reduction has $R>.62567$, $v_0-2\eta>.08516$, $\eta=10^{-7}$. At this fixed height Markov would give exponent at most $653/500-8(.08516)=.62472<R-2\eta$ for rows above $U^{v_0-2\eta}$. The original height-grid argument would then supply the necessary saving in the **physical mass**. Rows with small central samples already save by their amplitude. The tracker's raw SavedClassCount, which asks for the cardinality of the full bin without the central sample condition, is a separate open estimate. Estimate (1) remains open. [Thresholds and common-height sampling](central-values.md)

## Separate the small reduced conductors

Write $n=g i^6 a, m=g j^6 b$ after first taking $g=(n,m)$, and then removing the complete sixth powers from the two coprime quotients. The ideals $a,b$ are coprime and sixth-power-free, and $d=\operatorname{rad}(ab)$. The resulting zeros at the other primes are the mask $(u,gij)=1$. Where this mask holds the pair character is exactly $\chi_a(u)\overline{\chi_b(u)}$, with its nonunit zeros at $d$. The weight bound is
$$
 |\lambda_n\lambda_m|\ll_\epsilon
 U^\epsilon(q_g q_i^3q_j^3\sqrt{q_aq_b})^{-1}.
$$
The outer sums with the displayed $g,i,j$ weights cost $O_\epsilon(U^\epsilon)$, by ideal counting and $q_g\le U^{52}$. For $d=1$ the row count is $O(U)$ and this treats the entire sixth-equivalent diagonal.

For $d>1$, let $d_+,d_-,d_0$ be the pairwise coprime factors of $d$ at which the signed valuation $v_p(a)-v_p(b)\bmod6$ is respectively $1,5$, or $2,3,4$. Use dyadic norm sizes $D_+,D_-,D_0$, and let $D=D_+D_-D_0$. The pointwise weight $1/\sqrt{q_aq_b}$ is $\ll(D_+D_-)^{-1/2}D_0^{-1}$. For fixed $d_+,d_-,d_0$ there are at most $10^{\omega(d)}\ll_\epsilon U^\epsilon$ assignments of local primes and exponents to $a,b$. The local powers 2, 3 and 4 on $d_0$ determine its actual residue character. Freeze $d_0$ and its local factors before varying $d_+$ or $d_-$. On $d_+$ and $d_-$ the character depends only on the indicated signed residue, so large local valuations on either side do not change it. Dyadic boxes intersecting $q_d\le U^{31/20}$ have $D\ll U^{31/20}$. The exact conductor cut can be kept until nonnegative majorization.

Expand $1_{u\ (6\text{-free})}=\sum_{v^6\mid (u)}\mu(v)$. For fixed $g,i,j$ put $E=\operatorname{rad}(gij)$. This is the nonunit mask left by the good column factors after their common and sixth-power parts are removed. Sixth-power divisors at primes in $S$ are included in the row expansion. If a separate application restricts rows to $(u,S)=1$, include $\prod_{p\in S}p$ in $E$ for that application. Restrict $(v,E)=1$, then expand the quotient mask with $e\mid E$. Using arbitrary fixed generators for $e$ and $v$, write $u=v^6 e k$. The character at the extracted elements is a scalar of modulus at most one, with value zero when the extracted factor meets $d$. For the remaining element sum put $Y=U/(q_v^6 q_e)$. Nonempty original sums have $Y\gg1$. The number of $e$'s for each frozen $E$ is $O_\epsilon(U^\epsilon)$. The ideals $v$ in a dyad number $O((U/Y)^{1/6})$. Keep all unit factors by summing over elements $k$. The inner sum is
$$
 T_d(Y)=\sum_{k\in\mathcal O}W(q_k/Y)\chi(k),\qquad
 \chi=\chi_{d_+}\overline{\chi_{d_-}}\chi_0 .
$$
Here $\chi_0$ is the frozen product of the nonprincipal good-prime characters on $d_0$. The raw residue character is primitive modulo the actual squarefree ideal $d$ because each local character has order $6/\gcd(6,v_p(a)-v_p(b))>1$. This is a statement about a character on elements, so no supplementary ray conductor is required for this Poisson step. No zero-frequency term occurs.

If $Y>\sqrt D$, coset Poisson gives
$$
 T_d(Y)=\gamma(\chi)\frac{Y}{\sqrt{q_d}}\sum_{h\in\mathcal O}
 \overline{\chi(h)}\widetilde W(Yq_h/q_d),\qquad |\gamma(\chi)|=1.
$$
The transform of the fixed radial bump is radial and Schwartz. The primitive Gauss identity and dual lattice used here follow by CRT and the self-dual Eisenstein trace pairing. They apply to each nontrivial local character, including the quadratic and cubic ones. If the character on units is nontrivial, the complete radial element sum vanishes, which is harmless. When $Y\le\sqrt D$ keep the direct sum. Thus $T_d(Y)/\sqrt Y$ is estimated using normalized polynomial blocks of length at most $B=\max(1,\min(Y,D/Y))$, up to $U^\epsilon$ in this length. More explicitly, on a reflected dyad $q_h\asymp H\ll U^\epsilon D/Y$ the factor outside the normalized polynomial is $O((HY/D)^{1/2})\ll U^\epsilon$. Beyond this range rapid decay absorbs all summations to arbitrary fixed power accuracy. For $D/Y<1$ the same assertion holds, keeping only $H\ll U^\epsilon$ when the sum is not negligible. Dependence on $q_d/D\asymp1$ separates with ordinary Fourier inversion in its logarithm on a fixed compact box. The resulting column profiles and character-sieve coefficients are common across the varying conductor factor. To verify uniformity, derivatives in $q_d/D$ are combinations of $x^j\widetilde W^{(j)}(x)$, uniformly bounded and rapidly decreasing for large $x$. A smooth compact cutoff in the box gives integrable absolute Fourier coefficients in supremum norm. The root number and the powers of $q_d/D$ are bounded row scalars. [Self-dual measure, character, and Gauss conventions](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L603-L645) · [Primitive radial Poisson formula](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4831-L4875)

## Sieve in one conductor factor

Let $A=\max(D_+,D_-)$. Freeze the smaller factor and $d_0$. The variable character in the direct or reflected polynomial on $h$ is $\chi_{d_*}(h)$ or its conjugate, with $q_{d_*}\asymp A$ and $d_*$ squarefree. The other local character is a fixed bounded column weight. De Faveri's large sieve now gives
$$
 \sum_{d_*}|T_d(Y)|^2\ \ll_\epsilon Y U^\epsilon\Phi(A,B),\qquad
 \Phi(A,B)=A+B+A^{5/6}B^{1/3}+A^{1/3}B^{5/6}.
$$
Write each nonzero element $h$ as a unit, an $S$-supported generator, and the primary generator of a good ideal. Fix the unit and the $S$-part. Their character values are row scalars, and extracting an $S$-part of norm $J$ costs $J^{-1/2}$ in the central normalization. The sum of these factors is finite since $S$ is fixed. For the good ideal $(h')$ use its primary generator. In de Faveri's definition take the ray modulus divisible by $3$ and the primary generators $m_E$ for the correcting ideals. In $(h')=(x)E\mathfrak g^6$ with $x\equiv1$ modulo the ray modulus, the primary fractional generator of $\mathfrak g$ then gives $h'=xm_E g^6$. As $\mathfrak g$ can be taken coprime to the evaluation ideal, de Faveri's character with index $(h')$, evaluated at $d_*$, equals the raw symbol $(h'/d_*)_6$ on coprime inputs. Both presentations vanish on the other inputs. Thus the desired kernel is the transpose of his matrix. Its norm is bounded by the same symmetric $\Phi$ using Theorem 1.1 with the sides exchanged. Complex conjugation preserves the norm. If the good column ideal has sixth-power part $h_1^6$, extract it first, with weight $q_{h_1}^{-3}$ and row restriction $(d_*,h_1)=1$. For each such term extend the surviving positive row second moment to all sixth-free rows of norm $O(A)$. Its good sixth-free column vector on the reduced scale has squared norm $O(1)$ by ideal counting. Emptiness or bounded scales have the same bound. Minkowski and $\sum_{h_1}q_{h_1}^{-3}<\infty$ reassemble the estimate. Restrictions on $d_*$ can be discarded at this positive second-moment step. [De Faveri, Theorem 1.1 and the Kummer convention](https://arxiv.org/html/2610.04045v1#S1.SS1) · [Sextic reciprocity and its finite ray factor](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1047-L1077)

Cauchy in $d_*$ and summation of the other two factors cost
$$
 U^\epsilon (U/Y)^{1/6}\sqrt Y (D_+D_-)^{1/2}
                 \bigl(\Phi(A,B)/A\bigr)^{1/2}.                       \tag{2}
$$
In fact there are $O(D_0\min(D_+,D_-))$ other choices, and the Cauchy factor is $O(A^{1/2})$. Multiplying by $(D_+D_-)^{-1/2}D_0^{-1}$ gives exactly the factor in (2). Sum the $O(\log^C U)$ dyads and the fixed extracted weights above.

Write $d=\log_U D, s=\log_U(D_+D_-),\ a=\log_U A, y=\log_U Y$. Bounded endpoint factors enter $U^\epsilon$. Put $b=\max(0,\min(y,d-y))$ and $\phi(a,b)=\max(a,b,5a/6+b/3,a/3+5b/6)$. The exponent in (2) is
$$
 1/6+y/3+s/2+\tfrac12(\phi(a,b)-a).
$$
The last parenthesis decreases with $a$, while $a\ge s/2$. After substitution the expression is increasing in $s$, hence bounded by its value at $s=d$. Since $b\le d/2$, we have $\phi(d/2,b)=\max(d/2,5d/12+b/3)$. The resulting expression increases in $y\in[0,1]$, since the downward slope of $b(y)$ has magnitude at most one. At $y=1$ it is at most 1 for $0\le d\le1$. For $1\le d\le31/20$ it is
$$
 \max(1/2+d/2,\ 1/3+5d/8)\ \le\ 125/96 <653/500.
$$
For the second exclusion allow arbitrary polynomial $D$ and restrict to $q_{d_6}\le U^{7/6}$. Here $d_6=d_+d_-$, so $s\le7/6$ up to constant dyadic endpoints. Formula (2) holds with the same constants on these polynomial ranges. Since $b\le y\le1$ and $\phi(a,b)-a$ decreases in $a$, its exponent is at most
$$
 1/2+s/2+\tfrac12(\phi(s/2,1)-s/2)
 =
 \begin{cases}
   1+s/4, &0\le s\le1,\\
   11/12+s/3,&1\le s\le7/6 .
 \end{cases}
$$
Indeed $\phi(s/2,1)=\max(1,5/6+s/6)$ on this interval. The maximum is $47/36<653/500$, independently of $d$. Apply this bound to the pairs with $q_d>U^{31/20}$ and $q_{d_6}\le U^{7/6}$, retaining these restrictions up to the nonnegative majorization just as with the first cutoff.

Run `python -OB eighth_conductor.py` to verify the maximum by exact vertex enumeration and replay the threshold comparisons.

Large-conductor pairs occur already with four disjoint pairs of distinct good prime factors in the two original four-fold columns. The preceding proof, which takes absolute values across reduced characters, no longer meets (1) in general. Its calculated bound reaches $19/12$ at $d=2,y=1,D_+\asymp D_-\asymp U$. This calculation measures the loss in the bound. The size of the corresponding physical correlations remains open. De Faveri's conductor-ordered sharp mean is stated for cubic characters in Theorem 1.2, while the generic ratio here has local order six. The remaining signed sum keeps the actual weights $q_n^{-it}$ and the exact four-fold coefficient phases.

Prepared with OpenAI Codex assistance.
