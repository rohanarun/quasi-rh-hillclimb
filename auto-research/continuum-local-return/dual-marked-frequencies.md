# Dual frequencies of the remaining marked columns

Assume the preprint's 7/8 theorem, the cited cubic and Hecke character large sieves and the physical inputs to tracker #143. This is the Poisson expansion of the remaining *full-column* estimate on the all-element row measure. For each nonzero dual frequency $h$, write $(h)=h_0v^6$ with $h_0$ sixth-power-free. The contribution from the union of the following three ranges is $O_\epsilon(U^{1+10^{-7}+\epsilon})$, up to the inherited height factor.
$$
 Nh\le U^{.3082},\qquad N\operatorname{rad}(h_0)\le U^{.199},\qquad
 N v\le U^{10^{-7}}\ \text{and}\ N\operatorname{rad}(h_0)\le U^{.46252}.
$$
A further estimate covers every $Nh\le U^{.46252}$ and every $h$ for which the product of the primes occurring exactly once in $(h)$ has norm at most $U^{.0748}$. This includes every powerful ideal, with arbitrary sixth-power part. [Proof using the cubic sieve in the conductor aspect](powerful-marked-frequencies.md). For the open complement, smooth decay allows the upper cutoff $Nh\le U^{.850146}$. These are restrictions on the Fourier frequency, distinct from the conductor of the pair in the original row sum. The estimates below retain the original coefficients, their common ordinary height, all fixed degeneracies and the signed row filter. [Near-squarefree columns](near-squarefree.md) · [All-element row kernel](prime-row-filter.md#the-complete-shifted-kernel).

Here $L=N^2 U^w$ is the *norm scale* of one column, $\ell=\log_U L$, $N=U^n$ and $w$ is the total width of its prime slots. Write $q_h=Nh=|h|^2$ on elements. The bounds on the selected widths give $.92505870<\ell<.92506758$, $.425<n<.42506657$ and $w<.076$. The parameters $a=10^{-6}$, $\gamma=1.01\cdot10^{-6}$, $\kappa=2.02\cdot10^{-6}$ and $0<s\le10^{-9}$ are as in the column proof.

## The reflected scale

Write $k=K(c)=\prod p^{\lfloor v_p(c)/2\rfloor}$, $k'=K(c')$, $G=(c,c')$. The native removals leave $Nk,Nk'<U^\gamma$ and $NG<U^\kappa$, with $\gamma=1.01\cdot10^{-6}$ and $\kappa=2.02\cdot10^{-6}$. Write $f=c/k^2$, $f'=c'/k'^2$ and $g=(f,f')$. For the usual reduced conductor $d$ and its local order-six part $d_6$ one has
$$
 cc'/d_6\mid k^3 k'^3 G^2,\qquad d/d_6\mid\operatorname{rad}(kk'),\qquad
 cc'/d\mid k^2 k'^2 g^2 .
$$
For the first assertion use $m\le3\lfloor m/2\rfloor+1_{m=1}$ at each valuation. A missing unit exponent on just one nonzero side is in $d_6$; when both sides are nonzero the factor $G^2$ covers the possible loss. A prime of $d/d_6$ has valuation at least two in some column. For the last assertion, if exactly one original valuation is odd, the difference is nonzero modulo six. Two odd valuations give a prime of $g$. Every prime of a nonunit row mask outside $d$ has total column valuation at least two, hence $E^2\mid cc'/d$ for the squarefree product $E$ of these primes.

After opening the row mask at $j\mid E$ the scale is $Y=V/Nj$. The near-radical physical rows allow $U^{1-10^{-5}}\ll V\ll U$. Since $Nc,Nc'\asymp L$, the actual unshifted dual length satisfies
$$
 2a-4\gamma-2\kappa-s(1+10b)-2\mu+o(1)
 \ \,\le\log_U\frac{Nd}{YN^2}\le\ 2a+10^{-5}+o(1).
$$
For the upper bound use $Nj\le N(cc'/d)$. For the lower use $Nj\ge1$ and the last divisibility. The baseline exponent is $2n+2w-1=2a-s(1+10b)-2(b+a-w)$. Fixed positive $s$ and $\mu$ occur explicitly. A fixed number of auxiliary prime shifts of polylogarithmic norm can change either bound only by $o(1)$. In particular $Nd/Y\le U^{.8501452}$ for large $U$. For $Nh>U^{.850146}$ an arbitrarily high fixed Schwartz order gives a negligible tail after all polynomially bounded sums. The lower bound here concerns the scale of the Fourier weight; frequencies of smaller norm still occur.

## Uniformly summing the two columns at small dual norms

Fix a term in the expansion of a filtered all-element row kernel. Each auxiliary prime affects only its own local character or nonunit mask. Include these primes in $B=\operatorname{rad}(kk'g\prod p_{\rm aux})$. Extract the entire parts $e_1,e_2$ of $f/g,f'/g$ supported on $B$. Then
$$
 c=D_1r,\quad c'=D_2r',\qquad D_1=k^2g e_1,\quad D_2=k'^2g e_2,
$$
where $e_i\mid B$, $r,r'$ are squarefree, $(rr',B)=1$ and $(r,r')=1$. At fixed $k,k',g,e_1,e_2$ the small square-part and common-divisor cutoffs, all auxiliary prime effects, and all valuation consistency conditions are fixed. All remaining pair cutoffs have already been imposed on the frozen factors.

The resulting primitive character has squarefree conductor $d_F rr'$ and is $\theta_F\chi_r\overline{\chi_{r'}}$, where $d_F\mid B$ and $\theta_F$ is fixed. Its remaining nonunit mask is supported on $B$ outside $d_F$. For each extracted $j\mid E$, the scalar $\theta(j)$ splits into multiplicative twists on $r,r'$ and a frozen bounded scalar. All physical weights and row norm twists remain in the original $\lambda_c(v),\lambda_{c'}(v)$. Since $r,r'$ are of growing norm here, the character is nonprincipal. Complete element Poisson has prefactor $Y/\sqrt{Nd_F Nr Nr'}$ and dual weight $\widetilde W(Y Nh/(Nd_F Nr Nr'))$. CRT splits the Gauss factor into $\gamma(\theta_F)\gamma_1(r)\gamma_{-1}(r')$, separate multiplicative twists and the opposite-column reciprocity phase fixed by the two ray classes. For the cross term the two orientations give the ratio of $(r/r')_6$ and $(r'/r)_6$ up to conjugation. On coprime $r,r'$ their ratio is constant on fixed primary ray classes by sextic reciprocity. Terms involving $d_F$ give one twist on each side. The value at $h$ also splits. These are raw elements, allowing all six units. The number of dual $h$ of norm at most $U^t$ is $O(U^t)$.

Use a global cutoff $Nh\le U^t$ independent of $r,r'$ and keep each such $h$ fixed. On the fixed annuli $Nc/L,Nc'/L\asymp1$, remove the prefactor $(ND_1 ND_2)^{1/2}/L$ from $(Nr Nr')^{-1/2}$. Separate its residual annular powers and the dual weight by smooth Fourier inversion in the two log norms. At fixed Fourier variables their modulus is bounded by $C_J(1+|t_1|+|t_2|)^{-J}$ uniformly in $h$, for each fixed $J$. This common integrable majorant is also used when averaging in $h$ below. Derivatives in these two logarithms are bounded by the supremum norms of $x^m\widetilde W^{(m)}(x)$ and the fixed annular cutoff derivatives. All bounds are uniform for every possible $h,j,D_i,d_F$. This also treats an arbitrarily small argument of $\widetilde W$ without a moving truncation.

Use $1_{(r,r')=1}=\sum_{v\mid r,r'}\mu(v)$. The separated phase product just described supplies an extension to noncoprime $r,r'$, agreeing with the original one on coprime pairs. In each term $r=vx$, $r'=vx'$ with squarefree $v$, and $(x,vB)=(x',vB)=1$. The individual Gauss factors at $vx$ split into a fixed scalar, the Gauss factor at $x$ and a bounded multiplicative twist after ray subdivision. On side $i$, assign the full prime powers of $D_i v$ among the original two ordinary and selected prime labels. There are at most $\tau(D_i v)^{O(1)}$ assignments. Extract these factors from the labels. A prime label receiving a specified nonunit is fixed or empty. On an ordinary label the remaining ideal has the original smooth profile at the shortened scale and its central coefficient gains the extracted inverse square root. The product of the extracted factors contributes $(ND_i Nv)^{-1/2}$. Every residual factor avoids $vB$.

Group the first remaining ordinary factor alone and all other residual factors together, into squarefree indices $x_1,x_2$. The group lengths are $X\ll N$ and $Z\ll N\prod P_j<U^{.502}$, before or after the shortenings. Also $XZ\ll L$. Each group's vector, with its inverse root norm included, has squared norm $O_\epsilon(U^\epsilon)$ by the fixed divisor bound on its annulus. On coprime groups the CRT phase in $\gamma_1(x_1x_2)$ is a fixed ray phase times the cubic symbol $(x_1/x_2)_3$. This symbol is zero on noncoprime pairs, as required by squarefreeness of $x$. The negative Gauss orientation gives the conjugate cubic symbol. Apply Cauchy and the squarefree cubic large sieve. Before the extracted scalar, the square of each one-sided sum is at most
$$
 U^\epsilon(X+Z+(XZ)^{2/3})\ll U^\epsilon L^{2/3}.
$$
The inequality uses $.502<2(.9247)/3$. It is valid when one residual scale is bounded and when prime windows overlap. The power allocation is exact because the residual $x$ is coprime to $D_i v$. [Sextic Gauss multiplication and cubic bilinear estimate](column-correlations.md#testing-the-actual-divisor-weights-against-sextic-gauss-sums) · [Squarefree cubic sieve in these ideal conventions](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7486-L7508).

Multiplication of the two sides with the full Poisson prefactor gives at most
$$
 U^\epsilon\frac{Y}{L\sqrt{Nd_F}}\frac{L^{2/3}}{Nv}.
$$
Sum $1/Nv$ harmonically. The choices of $e_1,e_2,j$ are divisor-bounded. The crude count of the choices of $k,k',g$ is $O(U^{2\gamma+\kappa})$. The fixed number of auxiliary prime averages either costs a subpower or has bounded normalized coefficient mass. Thus the full contribution from the fixed set $Nh\le U^t$ is
$$
 O_\epsilon\!\left(U^{1-\ell/3+t+2\gamma+\kappa+\epsilon}\right).
$$
For $t=.30$ the exponent is below $.992$. For $t=.3082$ it is still less than $1$. The estimate takes absolute values at a frequency after summing the two original columns. It also works for any subset with $O_\epsilon(U^{.3082+\epsilon})$ frequencies in the nonnegligible range. In particular, the number of $h$ with $Nh\le H_0$ and $N\operatorname{rad}(h_0)\le R_0$ is $O_\epsilon(H_0^{1/6} R_0^{5/6+\epsilon})$. For each squarefree radical $r$ the sixth-power-free core has at most $5^{\omega(r)}$ choices and norm at least $Nr$; count the remaining sixth powers and the six units. Here $.850146/6+5(.199)/6<.3082$. This proves the second stated range up to the negligible tail.

## Average over primitive characters at low radical

In this paragraph call the common divisor inserted between $r,r'$ above $t$, and write $(h)=h_0v^6$. First fix $v$, the finitely many unit and fixed bad-prime choices for $h_0$, the frozen data $D_i,d_F$, and $t$. Let $R_i=L/ND_i$. After separating the annular functions as above, the vector at $x$ on side $i$ has squared norm $O_\epsilon(U^\epsilon/(ND_i Nt))$. Indeed $\lambda_{D_i t x}$ has the divisor envelope $(ND_i Nt Nx)^{-1/2}U^\epsilon$ on the annulus $Nx\asymp R_i/Nt$. The fixed normalized Gauss factors, stable ray phases and the coprimality restrictions preserve this bound. The sixth power from $v$ retains $1_{(x,v)=1}$ as an individual column mask. All dependence on $h_0$ inside each column is now its sextic character on $x$ or its conjugate. Scalars depending only on the row have modulus at most one.

The conductor norm of the induced primitive Hecke character is $O_S(N\operatorname{rad}(h_0))$. Every good prime dividing $h_0$ ramifies since its exponent is in $\{1,\ldots,5\}$, so its nonunit zeros on good columns are exactly the original zeros there. For a fixed conductor there are at most $U^\epsilon$ choices producing any one primitive character, by the $5^{\omega}$ local exponent bound, the fixed bad-prime parts and units. Finite reciprocity phases can be fixed in ray classes. The ordinary primitive character large sieve at conductor norm at most $B$ gives a factor $O_\epsilon(U^\epsilon(B^2+R_i))$ on a vector supported on $Nx\ll R_i$. This uses the larger length even when $t$ is large and retains the smaller true vector norm. The bound is uniform under additional restrictions on the set of $h_0$ before applying Cauchy–Schwarz. [Hecke character large sieve, Lemma 2.2](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/An-unconditional-first-moment-for-cubic-Gauss-sums-September-25-2026/build/sections/background-type1.tex#L175-L232) · [Primitive local conductors](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4244-L4268).

Take $B\ll_S U^{.46252}$. Since $ND_i\le U^{4\gamma+2\kappa+o(1)}$ and $.92505870-4\gamma-2\kappa>2(.46252)$, one has $B^2\ll R_i$ on both sides. Cauchy in $h_0$ and the two sieves bound the product sum by
$$
 U^\epsilon\frac{L}{ND_1 ND_2 Nt}.
$$
Multiply by the separated Poisson factor $Y\sqrt{ND_1 ND_2}/(L\sqrt{Nd_F})$. As $\sqrt{ND_1 ND_2}\ge Nk Nk' Ng$, the sums over $k,k',g,t$ now cost at most a harmonic divisor sum. The remaining $e_i,j$ have divisor-bounded multiplicity. This gives $O_\epsilon(U^{1+\epsilon})$ for each fixed $v$. Summing $Nv\le U^{10^{-7}}$ gives the required $U^{1+10^{-7}+\epsilon}$, proving the third range. When $h$ is sixth-power-free and powerful one has $N\operatorname{rad}(h)\le (Nh)^{1/2}\le U^{.425073}$ below the cutoff. For the union, split the three frequency sets into disjoint parts first. All the estimates allow further restrictions on the frequency alone.

After also applying the [exact-valuation-one estimate](powerful-marked-frequencies.md), it suffices to bound the signed Poisson sum on the complementary frequencies, with the same columns, three-term prime filter, zero masks and height weight. The [unit-orbit cancellation and sparse-pair estimate](prime-pair-kernel.md) also remove pairs with unequal norm residues modulo $36$ and graphs of degree at most $U^{.1825}$. Frequencies which are prime ideals of norm near $U^{.85}$ remain on the dense equal-residue pairs. For example, on the unshortened annulus $Y=U$, put $H=2\ell-1$ so that $U^H$ is the dual length. Applying de Faveri's general sextic sieve to the column vectors includes a term $U^{H/3+5\ell/6}$. With the Poisson factor $U^{1-\ell}$ its exponent is $1+(3\ell-2)/6>1.1286$, which exceeds the budget. This comparison leaves open the additional cancellation available from the actual coefficients and the signed prime filter. [Sextic large sieve, Theorem 1.1](https://arxiv.org/html/2610.04045v1#S1.SS1) · [Exact exponent checks](column_divisors.py).

Prepared with OpenAI Codex assistance.
