# Frequency sectors in the balanced long-inverse Gram

Assume the preprint's $7/8$ theorem and its completed cubic reflection estimate. Put $s=8\cdot10^{-7}$, $A=U^r,\ H=A/U^s,\ H_1=A/U^e$, where $0\le e\le s$, with $r\ge1$ in a fixed bounded range. For the unprojected Eisenstein row Gram of a genuine smooth Möbius polynomial of norm length $A$, consider the ordinary ideal gcd $g$ of its two squarefree columns. On $Ng\le U^{s+o(1)}$, the signed contribution from first Poisson frequencies $h\ne0$ satisfying
$$
  NE(h)\le U^{.04r},\qquad E(h)=\prod_{v_p((h))=1}p
$$
is $O_\epsilon(HU^\epsilon)$. This includes all powerful frequencies. The same price holds for the union with the [sixth-power sector](#a-large-sixth-power-divisor-and-a-hybrid-range) below, in particular whenever the maximal sixth-power divisor is $v^6$ with $Nv\ge U^{2r/67+s}$. The assertion holds for the raw Gram at $H$ and the comparison Gram at $H_1$ multiplied by $H/H_1$, either separately on this nonzero-frequency sector or in their difference. The Gram uses a fixed smooth radial Schwartz row majorant, a comparison with uniformly bounded radial Schwartz seminorms at its own scale, a fixed smooth annular inverse profile, the original zero extensions, and may include a fixed independent inverse puncture of polynomial norm. Admissible separated norm heights carry fixed polynomial costs. The claim does not assume a projection to squarefree rational norms.

Use the condition on the **bare Fourier frequency** immediately after the first masked Poisson, while the residual columns are still coprime. It depends only on $h$, so it has the same meaning in every term of the later coprimality inversion. It imposes no condition on either input column. The proof uses only the upper frequency cutoff. The unestimated frequencies include generic squarefree $h$ near the full dual length.

To obtain the smooth difference explicitly, write $F(v)$ for the radial Fourier profile of the $H$-kernel, in the squared-radius coordinate of the primitive Poisson formula. Take a fixed radial smooth cutoff $\chi$ equal to one on $[0,1]$ and zero on $[2,\infty)$. For $\lambda=H/H_1\le1$, choose the comparison Fourier profile $F_{1,\lambda}(v)=\chi(v)F(\lambda v)$. Its inverse radial Fourier transform has uniformly bounded Schwartz seminorms in the normalized $H_1$ coordinates, by compact support and uniform derivative bounds. A signed comparison profile is allowed when its raw Gram is bounded by a positive Schwartz majorant. For coprime residual columns $n_1,n_2$ put $D=Nn_1\,Nn_2$. The two Poisson terms have the same prefactor and their difference profile is
$$
  [1-\chi(H_1 Nh/(JD))]\,F(H Nh/(JD)),\qquad J=Nj.
$$
Fixed trace-dual units or scaling constants can be absorbed in both profiles. The difference vanishes at $Nh\le JD/H_1$; for $Nh>(JD/H)U^\epsilon$, Schwartz decay gives any fixed power saving after increasing the decay order. For the [compact Fourier majorant in the physical application](long-inverse-frequency-band.md), the upper cutoff is exact at a fixed multiple of $JD/H$. On a common norm dyad $Nn_i\asymp R$, a retained bare-frequency dyad therefore has center $\gg JR^2/H_1$ and $\ll (JR^2/H)U^\epsilon$, with constants determined by the fixed annuli. Keep the actual smooth profiles through logarithmic Fourier separation. In normalized log coordinates all derivatives are uniformly bounded also at an endpoint transition, so rectangle cutoffs can be taken before evaluating the individual ideals. The lower restriction is unnecessary when bounding either raw kernel separately.

## Exact child polynomial

Set $G=Ng,\ R=A/G$ in a fixed dyadic block. For a fixed divisor $j\mid g$, $J=Nj$, masked primitive Poisson gives the nonzero frequency range
$$
 Nh\ll (JR^2/H)U^\epsilon
$$
and exterior multiplier $H/(JRG)$ for the centrally normalized residual columns. This multiplier is the same for the comparison after multiplying its original Gram by $H/H_1$. Its frequency range is only smaller. Expand residual coprimality by $\sum_{m\mid(n,n')}\mu(m)$, put $B=Nm$, and write each squarefree residual as $ma$. Then $(m,g)=1$, the free column length is $R/B$, and the common exterior multiplier becomes $H/(JRGB)$. As usual, the finite rays and smooth norm kernels are Fourier separated and Cauchy bounds the two sides by the arithmetic mean of their one-sided energies. The normalization of the complete original square is $A^{-1}$. These are the empty-short-label formulas in the [first Poisson reduction](inverse-composite-mark.md#reducing-the-columns). The primitive kernel, bounds on the nonprincipal tail, and the unit-pair convention are in [the source Poisson lemma](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9722-L9776). Restricting an artificially restored unit pair to this sector only reduces its absolute bound.

The $a$-factor before conjugation is $\mu(a)\gamma_1(a)J_a(jm^2)\overline{J_a(h)}$, besides its finite character, smooth test and the inherited exclusions. Conjugate the one-sided polynomial and apply the [squarefree signal identity](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L10775-L10792). Up to fixed finite ray factors, which are expanded into multiplicative characters, the column is $a_0(a)=\bar\alpha(a)\gamma_2(a)$. The new row and label are $k=jh,\ f=jm$. The product $J_a(k)J_a(f)^4$ has precisely the powers $J_a(h)J_a(j)^5J_a(m)^4$ and retains their common nonunit zeros. The remaining gcd exclusion is at $g/j$; the phases at $j,m$ already supply their exclusions. Fix generators and the finitely many unit/ray sectors throughout. Conjugating the full original polynomial deals with the opposite initial orientation.

For a further fixed inverse omission $P$ of polynomial norm, insert $\sum_{l\mid(a,P)}\mu(l)$ with the *same* $P$ on every row. Terms with $(l,f)>1$ vanish identically. For $a=l n$ with $l$ squarefree and $(l,n)=1$, the fixed data and $a_0$ factor with the new cross phase $J_n(l)^4$. That phase extends the result to all squarefree $n$ with its actual zero on $(l,n)>1$. The scalar containing $J_l(k)$ is a contraction, and fixed cuts on $l$ can be retained. The new label $f=jml$ is squarefree, and the new normalized column length is $X=R/(B Nl)$. Its multiplier in the row Hilbert norm is $(Nl)^{-1/2}$, with subpower total mass since $l\mid P$. Keep $g/j$ as a fixed puncture $\rho$. With no extra omission use $l=1$. [Squarefree extraction of $a_0$](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L10850-L10879)

The price needed for each fixed $g,j,m,l$, prior to the harmonic and puncture sums, is $JR\,U^\epsilon$ for the one-sided sum of centrally normalized squares over the restricted $h$. Denote base-$U$ log norms by
$$
 G_0=\log_U G,\quad j_0=\log_U J,\quad d=\log_U(B Nl),\quad
 x=r-G_0-d,\quad V=j_0+d,\quad Q=\log_U N\mathfrak r_\rho\le G_0.
$$
Thus $0\le j_0\le G_0\le s+o(1)$, and the required exponent $r-G_0+j_0$ is at least $r-s-o(1)$. On a bare-frequency dyad let $M_h=\log_U Nh+O(1/\log U)$ denote its center. Its cutoff gives $M_h\le r+s-2G_0+j_0+O(\epsilon)\le r+s+O(\epsilon)$. The map $h\mapsto k$ is injective. Put $\xi=\log_U NE(h)\le.04r$, up to dyadic endpoint errors. All estimates below permit such errors.

## Cube completion at the true column

The exact [cube-completion inversion](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9840-L9862) expresses this squarefree polynomial, normalized at $X$, as a sum over $c$ of the completed $a_0$-sum at $X/(Nc)^3$, multiplied by a row contraction and $1/Nc$. The dyadic and total sums of these positive weights are $U^{o(1)}$. Apply triangle in the Hilbert norm over the specified $h$-set, then fix $c$ and put $c_0=\log_U Nc$. Only polynomially sized nonempty ranges occur.

For $d+3c_0\le .235r$, apply the source's unmarked [completed reflection and width bound](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7985-L8059). This is the estimate for the *completed sum*, before the canonical induction, and requires neither numerical margin of the canonical induction theorem. On a dyad where the maximal powerful part of $k$ has exponent $O$, the price exponent is at most
$$
 O/2+\max\{M_k-O,\ 2M_k-O+Q+V-(x-3c_0)\}+O(\epsilon),
 \qquad M_k=M_h+j_0.
$$
One can enlarge to all rows $k$ in the corresponding ball having that powerful-part dyad. For each source row, every valuation at least two in $h$ remains at least two in $jh$, so $O\ge M_h-\xi-O(\epsilon)$. This elementary containment persists as a numerical dyad condition on the enlarged set. Primes at which $j$ and $h$ meet only increase the allowed lower bound. The two displayed branches are therefore at most
$$
 M_h/2+j_0+\xi/2,\qquad
 3M_h/2+3j_0+Q+G_0-r+2d+3c_0+\xi/2
$$
up to the freely small errors. Since $2d+3c_0\le.47r$, both are bounded by $.99r+6.5s+O(\epsilon)$. This is strictly below $r-s$. The reflected estimate includes every nonzero element row in the chosen powerful-part dyad, even if the moving presentation induces a fixed character. At each good prime the source combines the exponents of $k,f,\rho$ modulo six while retaining the nonunit zero. For exponent zero it sums the active and inactive mask choices. For exponent four it includes the small Ramanujan term and both divisibility choices. The local width inequality $N(k)^2 N(f)N(\mathfrak r_\rho)/N(k_{\rm pow})$ quoted above already includes these branches and their intersections. The unit and bad-prime valuation classes and the finitely many fixed cusp characters are those of the reflection theorem; the possible bounded negative ramified valuation costs $O(1/\log U)$ in the exponent. No nonprincipal-row projection is required. The completed Dirichlet product is entire for the source's specified coefficient $a_0$, including these arithmetic choices. The original Poisson diagonal at zero frequency is outside the present statement. [Completed reflection and its entire continuation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1665-L1760) · [Bad-prime sectors and literal masks](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7329-L7351)

For $d+3c_0\ge .235r$, reopen the [completed coefficient formula](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7283-L7351). Fix its independent cube variable $c'$ by triangle, with multiplier $1/Nc'$ and another row contraction. No coprimality between $c'$ and the squarefree index is assumed. The remaining squarefree column length satisfies
$$
 U^\lambda\asymp X/(N(cc'))^3,\qquad
 \lambda\le .765r+O(\epsilon).
$$
Its normalized squared coefficient norm is $O(U^\epsilon)$. The fixed $j,f,\rho$ factors, norm tests and true Gaussian all go in this coefficient, independent of the remaining variable $h$. Any bounded nonempty scales below one are included with $\lambda=O(\epsilon)$.

## The two sieves on the shortened squarefree column

Write $(h)=e\,a^2 b^3 v^6$, with $e=E(h)$, $a$ cubefree, $b$ squarefree. Choose $b$ to contain each odd valuation at least three in $(h)/e$; split the residual square root into its cubefree part $a$ and a cube $v^3$. The latter three ideals may overlap. Set $\alpha=\log_U Na,\ \beta=\log_U Nb,\ \nu_v=\log_U Nv$; these nonnegative exponents satisfy
$$
 2\alpha+3\beta+6\nu_v\le M_h-\xi+O(\epsilon).
$$
Fix $e,v$, respecting the finite unit and ray sectors. Their total count costs $U^{\xi+\nu_v+O(\epsilon)}$, and the $v$-factor is just the actual fixed exclusion $1_{(v,n)=1}$. Freeze $b$ and sieve over the cubefree $a$ by the cubic sieve, or freeze $a$ and sieve over the squarefree $b$ by the quadratic sieve. On both branches the free column $n$ is squarefree. Zero extensions give the literal product $J_n(a)^2J_n(b)^3$ even when $a,b,v$ share primes. Factors involving the frozen row labels are legal fixed column coefficients. The bounded bad-prime parts of $e,a,b$ and the unit choices cost finite changes of twist; the $v$-restriction is on the column. These are precisely the supported power-residue families in [de Faveri, Theorem 1.1 and Example 2.2](https://arxiv.org/html/2610.04045v1#S2.SS4).

The two admissible exponents are
$$
 \begin{split}
 C_3&=\xi+\nu_v+\beta+
       \max\{\alpha,\lambda,2(\alpha+\lambda)/3\},\\
 C_2&=\xi+\nu_v+\alpha+\max\{\beta,\lambda\}.
 \end{split}
$$
Their minimum is bounded by the maximum of the following three quantities:
$$
 (M_h+\xi)/2,\qquad
 \lambda+M_h/5+4\xi/5,\qquad
 2\lambda/3+M_h/3+2\xi/3 .
$$
Indeed the common counting term is bounded using $2\alpha+2\beta+2\nu_v\le M_h-\xi$. The better linear term uses $5\min(\alpha,\beta)\le 2\alpha+3\beta$. The cubic remainder satisfies $(2/3)\alpha+\beta+2\nu_v\le(M_h-\xi)/3$. Thus the price is at most the maximum of
$$
 .52r+s/2,\quad .997r+s/5,\quad .87r+s/3
$$
up to arbitrarily small errors. Each is strictly below $r-s$ for the stated $s,r$.

This pays $JR\,U^\epsilon$ on each of the one-sided energies. The summed cube and puncture weights in the Hilbert norm are $U^{o(1)}$, as are all retained ray and dyadic choices and the smooth Fourier integrations with the source's fixed polynomial height costs. The exterior multiplier now gives $H/(GB)$. The $m$ and $g$ sums are harmonic, including $j\mid g$ and any divisor weights. This proves the stated natural-price sector. The same argument applies on any fixed subcollection of these bare frequencies selected independently of the column ideals.

## A large sixth-power divisor and a hybrid range

Write $(h)=v^6(h_0)$ using the maximal sixth-power divisor, so $(h_0)$ is sixth-power-free. Fix a generator of $v$ and retain the unit of the element $h_0$. Use the exact logarithmic sizes
$$
 \nu_v=\log_U Nv,\qquad \omega=\log_U N((h_0)_{\rm pow}),
$$
where $(h_0)_{\rm pow}$ includes the *full* prime powers at all valuations at least two in $(h_0)$. There is also a bound $O_\epsilon(HU^\epsilon)$ for the bare frequencies satisfying
$$
 \nu_v\ge2s,\qquad 35\nu_v+\omega/2\ge r+19s,\qquad
 67\nu_v+5\omega/2\ge2r+56s.                                      \tag{1}
$$
In particular $\nu_v\ge 2r/67+s$ suffices for every sixth-power-free core. Another sufficient pair of conditions is $\nu_v\ge.025r$ and $\omega\ge.255r$. This second range includes sizes $\nu_v=.025r,\ \omega=.26r$, for which the bare valuation-one width can reach $.59r$ on disjoint prime supports. The earlier $.04r$ condition does not cover such a box. The union costs the same exponent: apply the two sector proofs to disjoint bare-frequency subsets, removing their overlap once, before the residual coprimality inversion.

Keep the first Poisson comparison at $H_1$ with its uniformly Schwartz profiles as above. Freeze the dyads of $\nu_v,\omega$ and the ideal $v$ before estimating the one-sided energy. The number of such $v$ costs at most $U^{\nu_v+O(\epsilon)}$. Even when $(v,h_0)>1$, the exact factor on the free column is
$$
 J_n(jh)=J_n(jh_0)\,1_{(n,v)=1}.
$$
Enlarge the fixed omission $P$ in the divisor expansion above to $P\operatorname{rad}(v)$, and use the same symbol $l$ for its squarefree divisor. For each fixed $v$ the multiplier mass $\sum_{l\mid P\operatorname{rad}(v)}(Nl)^{-1/2}$ is $U^{o(1)}$ uniformly. Treat its Hilbert norm before summing the distinct $v$. This makes $k=jh_0$ and keeps the squarefree label $f=jml$, $x=r-G_0-d$, $V=j_0+d$, $d=\log_U(BNl)$. The only fixed puncture charge is still $Q\le G_0-j_0$. The source square-root multiplier containing $J_l(jh_0)$ is a contraction and no row-dependent deletion remains in the column. For fixed $j,v$ the map from $h_0$ to $k$ is injective.

Use the same exact completion divisor $c$, and set $w=d+3c_0$, $w_*=11\nu_v/2+\omega/4-4s$. For $w\le w_*$, apply the completed reflection bound to $k$ with
$$
 M_k\le r+s-2G_0+2j_0-6\nu_v+O(\epsilon),\qquad O\ge\omega-O(\epsilon).
$$
Indeed multiplication by integral $j$ preserves every powerful prime power of $h_0$. After paying for $v$, the two branches are bounded, up to $O(\epsilon)$, by
$$
 r+s-5\nu_v-\omega/2,\qquad
 r+4s-11\nu_v-\omega/2+2w .
$$
For the second bound one initially obtains $r+2s-3G_0+5j_0+Q-11\nu_v-\omega/2+2d+3c_0$. Use $Q\le G_0-j_0$, $j_0\le G_0\le s+o(1)$ and $2d+3c_0\le2w$. The first branch is at most $r-s$ under (1), and the second is at most $r-4s$. The same local branches and zero masks as in the completed estimate above are included.

For $w\ge w_*$, reopen the completion. At each fixed second cube divisor, the squared-normalized squarefree column has length $\lambda\le r-w_*+O(\epsilon)$, and the sixth-power-free row $h_0$ has log norm at most $m_0=r+s-6\nu_v+O(\epsilon)$. All $j,f,\rho$ factors are now fixed column phases and masks. The multiplier at each fixed cube divisor has modulus at most its harmonic scalar. Apply de Faveri's sixth-power sieve to the positive $h_0$-energy with its squarefree column. Its exponent is $\Phi(m_0,\lambda)=\max(m_0,\lambda,5m_0/6+\lambda/3,m_0/3+5\lambda/6)$. The finite unit and bad-prime data of $h_0$ are separated as in the original sieve family; at the fixed bad primes its valuations are at most five. The common fourth-power label is fixed here, so the sieve coefficient is independent of $h_0$. [De Faveri, Theorem 1.1 and the Hecke character family](https://arxiv.org/html/2610.04045v1#S1.SS1) · [Sieve orientation and zero extensions](eighth-conductor.md)

After adding $\nu_v$, the four terms are at most
$$
 r+s-5\nu_v,\qquad r-9\nu_v/2-\omega/4+4s,\qquad
 7r/6-35\nu_v/6-\omega/12+13s/6,\qquad
 7r/6-67\nu_v/12-5\omega/24+11s/3
$$
up to the freely small losses. Conditions (1) put all of them at most $r-s$. Equality costs only $U^\epsilon$, as do bounded endpoint effects and dyad choices. The frozen $g,j,m$ sums therefore have the same harmonic prices as above. This proves (1) at both raw scales and for their signed smooth difference. Squarefree $h$ near full norm has $\nu_v=\omega=0$ and remains outside the two proved sectors.

Prepared with OpenAI Codex assistance.
