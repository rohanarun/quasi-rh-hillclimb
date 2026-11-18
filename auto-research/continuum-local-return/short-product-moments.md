# Complete moments of products of short sextic character sums

The physical application assumes the preprint's $7/8$ theorem and the estimates of tracker #143. There is a full twelfth-moment bound at the [required short inverse length](short-physical-inverse.md). For $X=U^z$, $.09755<z<.0987$, it gives
$$
 \sum_{u\in\mathcal O} W_{\rm row}(Nu/U)|M_u(X,t)|^{12}
 \ll_\epsilon U^{1+\epsilon}.
$$
It also gives the full eighteenth moment at this price for $z\le 2/29$. The endpoint application needs an eighteenth moment of price $1.00029$ at the longer physical length.

## Product estimate

Work over the Eisenstein integers. Let $W_{\rm row}$ be a fixed nonnegative smooth radial norm-shell weight. Fix the number of labels. At label $i$ take any row-independent coefficients $|c_i(n)|\le1$ on an ideal annulus $Nn\asymp Y_i$, outside the fixed bad primes of the sextic symbol. Write
$$
 P_i(u)=Y_i^{-1/2}\sum_n c_i(n)\chi_n(u)^{\pm} .
$$
Here the common orientation is the symbol itself or its complex conjugate, always zero on nonunits. Fixed finite ray characters, the Möbius coefficients, finite prime omissions, norm twists and bounded annular profiles can be included in the $c_i$. Put $w=\max_i\log_U Y_i$ and $\ell=\sum_i\log_U Y_i$, using nonnegative exponents (bounded unit annuli may be enlarged by constants). The estimate is
$$
 \sum_{u\in\mathcal O} W_{\rm row}(Nu/U)\left|\prod_i P_i(u)\right|^2
 \ll_\epsilon U^{1+\epsilon}
 \qquad (3\ell+2w\le 2).
$$
A second sufficient range for any fixed number of labels is $w\le.0987$, $\ell\le14/23$. Both assertions also hold if the product inside the row square is restricted to tuples with squarefree rational total norm. All implied constants may depend on the number of labels, the fixed support constants, arithmetic data, weight and $\epsilon$. The estimates are uniform in the bounded coefficients. In particular, using the log-norm profiles gives the fixed-height derivative estimates needed for the physical height supremum.

### Squarefree norms and the dual character

First prove the assertion for the restriction to squarefree rational norms. The two columns of the square have common norm scale $L=U^\ell$. Use the [exact common-factor decomposition and Poisson formula](short-inverse-frequencies.md#the-exact-common-factors-and-the-scale). These identities need only separate bounded weights on the original labels. Write $C_1=g k r_1$, $C_2=g\bar k r_2$, where $g$ records the common places, $k$ records opposite places over common rational primes, and $Nr_1,Nr_2$ are coprime. Fix the assignments of $g,k$ to the labels, at divisor-bounded cost. Put $s=\log_U(L/(Ng\,Nk))$, $\kappa=\log_U Nk$ and $b=\log_U Nj$ for $j\mid g$ in the nonunit mask. The principal pair contribution has size $O_\epsilon(U^{1+\epsilon})$ by the coefficient squared norm. For a nonzero dual element of log norm $a$ the rapid Fourier tail permits
$$
 2s+2\kappa+b\ge 1+a-o(1),\qquad a\le2\ell-1+o(1).
$$
Here and below one can use arbitrarily small fixed power buffers followed by sufficiently high fixed decay orders. In particular $\ell<1/2$ with a fixed margin leaves only the principal term. At the boundary the inequalities allow an arbitrarily small buffer. Rational-prime coloring separates the two residual columns. The two fixed primary ray classes make their opposite-orientation Gauss cross phase constant. In a bound $U^{M+\epsilon}$ for the squared sum over dual elements on each column, the required inequality is $M\le s+\kappa+b$ up to the freely chosen losses. The Poisson factor and the two extracted scalars then bound the contribution by $U^{1+\epsilon}/(Ng\,Nk)$. Summing these weights and their divisor factors costs $U^\epsilon$.

Write the dual ideal as $w_0 v^6$ with $w_0$ sixth-power-free and $Nv\asymp U^\nu$. Its good support and the finitely many unit and ray choices are understood. Fix $v$, retaining the mask at $v$. Suppose the residual widths of some subset of the labels have sum $p$, $0\le p\le s$. Use $x$ for their squarefree product and $y$ for the others. The vectors on each group have squared norm $O_\epsilon(U^\epsilon)$, since each normalized coefficient has the inverse-square-root envelope and a divisor-bounded number of representations. If necessary use an independent coloring to impose coprimality of rational norms between the groups. Any normalized Gauss factor internal to a group becomes part of that group's vector. Between groups, the sextic Gauss multiplication law and reciprocity give the cubic factor $J_y(x)^2$, where $J$ denotes the sixth-power residue symbol. On one orientation the dual character on $y$ is thus $J_y(x)^2\overline{J_y(w_0)}$. Its companion on $x$ enforces $(x,w_0)=1$. Conjugation gives the other orientation. All fixed good-prime masks remain in the vectors. [Gauss phases and their fixed-ray separation](column-correlations.md#testing-the-actual-divisor-weights-against-sextic-gauss-sums)

Dualize the norm over $w_0$ at fixed $v$ using a vector of squared norm one. The coefficients on $(w_0,x)$ are its entries times the normalized $x$ vector and a factor of modulus at most one. Freeze bad-prime parts of $w_0$ and primary ray classes. As a Hecke character of $y$, the induced primitive character has good conductor $\operatorname{rad}(xw_0)$, of norm $\ll U^{p+a-6\nu}$. Indeed the local exponents are $2$ on $x$ and $-v_{\mathfrak p}(w_0)\bmod 6$ on the disjoint good support of $w_0$. These describe all its nonunit zeros there. For a given primitive character, each good conductor prime offers at most two choices of side. Once assigned to $w_0$, its exponent in $\{1,\ldots,5\}$ is determined. Fixed reciprocity factors may be separated by the ray classes. Grouping the $(w_0,x)$ coefficients by primitive character therefore costs $U^\epsilon$ in squared norm. Apply Cauchy on that character family and the primitive Hecke large sieve to the $y$ vector of length $U^{s-p}$. Counting $v$ yields
$$
 M\le \nu+\max(s-p,\ 2p+2a-12\nu)+o(1).                    \tag{1}
$$
No positivity of the label coefficients is used. The class-number-one field has boundedly many generators up to units in the specified convention. For the unit conductor the same sieve includes the principal character. [Primitive Hecke character sieve, Lemma 2.2](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/An-unconditional-first-moment-for-cubic-Gauss-sums-September-25-2026/build/sections/background-type1.tex#L175-L232)

### Paying for all frequencies

Put $s_0=(1+a)/2$. The dual support gives $s_0\le s+\kappa+b/2+o(1)$. Both claimed ranges have $a\le1/3+o(1)$. If $s<\nu$ use the trivial squared column bound $U^{s+\epsilon}$ per frequency and count all $O(U^a)$ frequencies. Here $s<\nu\le a/6+o(1)$ gives $\kappa+b\ge s_0-s-o(1)\ge a-o(1)$.

If $s\ge\nu$, accumulate whole labels until their total width $p$ first reaches $\nu$. For $\nu=0$ take the empty group. Up to bounded annular errors, $\nu\le p\le\nu+w$. Thus (1) is at most $\max(s,2w+2a-9\nu)+o(1)$. When $3\ell+2w\le2$ the top bound $a\le2\ell-1+o(1)$ gives $4w+3a\le1+o(1)$, or $2w+2a\le s_0+o(1)$. This proves the first range including equality.

For the second range $a\le5/23+o(1)$. The same group pays when $a\le1/5$ or $\nu\ge.0027$, since then $2(.0987)+2a-9\nu\le s_0+o(1)$. On the rest, if $\kappa+b\ge\nu$, take $p=0$ in (1) and use $2a\le s_0+o(1)$. Otherwise
$$
 s\ge s_0-\nu-o(1)>.6-.0027-o(1)>6(.0987)+\nu.
$$
There is a group with width $\nu\le p\le s/7+o(1)$. If the labels of width below $\nu$ together have at least that width, stop their running sum at the first crossing, which is at most $2\nu<s/7$. Otherwise there are at least seven labels of width at least $\nu$, since six labels and the smaller labels could not reach $s$. Choose the smallest of those seven or more. In (1), $2a\le5(1+a)/14=5s_0/7$ follows from $a\le5/23$. Thus $2p+2a-11\nu\le 2s/7+5s_0/7\le s+\kappa+b+o(1)$. This proves the second range. All groups are chosen using fixed scales and allocations.

### Restoring every column

For each unrestricted tuple take the rational primes dividing $\prod_i Nn_i$ to total exponent at least two. In each $n_i$ extract the **entire** ideal factor $d_i$ supported above these rational primes. Include the primes below the fixed bad set in the extraction even if of exponent one. The remaining tuple has squarefree rational total norm and avoids the rational support of every $d_i$. Conversely these conditions give exactly the original split when the extracted tuple obeys the stated valuation restrictions. The row scalar at the extracted ideals has modulus at most one. The new coefficient at label $i$ is the original $c_i(d_i m_i)$ with the residual support restrictions, and the new annular center is $Y_i/Nd_i$. Bounded nonempty centers below one cost only support constants. Thus both the total and every individual width obey the original bounds up to $O(1/\log U)$.

Let $D=\prod_i Nd_i$. The central normalization gives an extracted scalar $D^{-1/2}$. Outside the fixed bad set the integer $D$ is squarefull. For every $\tau>0$ the sum of $D^{-1/2-\tau}$ over extracted tuples converges. At an unexceptional rational prime $p$ the multiplicity at exponent $e$ is bounded by a polynomial in $e$ depending only on the label count. The resulting local factor is $1+O_{\tau}(p^{-1-2\tau})$. At each fixed exceptional prime the sum still converges. Since $D\ll U^\ell$, the mass at $1/2$ is $O_\epsilon(U^\epsilon)$. Minkowski in the row norm now proves both estimates for the unrestricted original product.

### A bound above the natural range

For arbitrary bounded label coefficients, $w\le1/6$ and $\ell\le1$, the same complete squared moment is
$$
 \ll_\epsilon U^{1+D(\ell)+\epsilon},\qquad
 D(\ell)=\max\{0,(3\ell-2)/6,(5\ell-3)/18\}.
$$
At the physical ninth-power length this gives an exponent below $66649/60000<1.110817$, also for the fixed prime-color restrictions. The genuine smooth inverse admits the stronger density bound below.

Here are the two estimates on a dual box in the preceding proof. After fixing $v$, the full squarefree residual vector and the sixth-power-free dual rows give the sextic sieve price $\Phi(a-6\nu,s)$, where $\Phi(A,s)=\max(A,s,5A/6+s/3,A/3+5s/6)$. Since $\Phi(A,s)-s$ is decreasing and 1-Lipschitz, padding $s$ to $s_0$ when necessary costs at most $\kappa+b$. We have $a-6\nu\le a\le s_0$, so including the $v$ count leaves excess at most $E_1=\max(\nu,(3a-1)/12-\nu)$. Alternatively fix one frequency and split the labels into two groups by adding each label to the group of smaller width. Their widths differ by at most $w$. The [cubic bilinear sieve](short-inverse-frequencies.md#the-primes-of-valuation-one) and the trivial bound give squared price $m(s)=\min(s,\max((s+w)/2,2s/3))$ on one side. The function $m(s)-s$ is also decreasing and 1-Lipschitz, and $s_0\ge1/2\ge3w$ gives $m(s_0)-s_0=-s_0/3$. Counting $w_0,v$ costs $U^{a-5\nu+\epsilon}$ and leaves excess at most $E_2=(5a-1)/6-5\nu$. All masks and cubic phases are those already separated above. If $\nu>(5a-1)/36$ use $E_2$, otherwise use $E_1$. The excess is bounded by $\max(0,(3a-1)/12,(5a-1)/36)$. Substitution of $a\le2\ell-1+o(1)$ proves the claim. The restoration over shortened scales applies since $D$ is nondecreasing.

### The physical length and common divisors

Six copies of the actual short inverse have $3\ell+2w=20z<1.974$, so their squared norm gives the stated full twelfth moment. Nine equal copies have $3\ell+2w=29z$, giving the eighteenth moment through $z=2/29$. The elementary coefficient-independent sextic sieve alone gives a natural bound for a general combined vector only through $\ell=1/2$. Here the input is a product of independently weighted short labels. [Sextic sieve, Theorem 1.1](https://arxiv.org/html/2610.04045v1#S1.SS1)

At the longer physical length the rational-squarefree moment allows an improved gcd cutoff. For a squarefree split rational integer $d\ge U^{.2797}$, project to $d\mid NC$ and fix the orientation and label of each prime in $d$. There are at most $18^{\omega(d)}$ assignments. Each gives the scalar $d^{-1/2}$ and a product restricted to squarefree rational norm at the shortened scales. The residual coefficients include the mask at the rational primes dividing $d$. Their total width is at most $.8883-.2797=.6086<14/23$ and each is at most $.0987$, up to fixed annular constants. The second range therefore gives a squared cost $O_\epsilon(U^{1+\epsilon}/d)$ after the assignments are added in the row norm. This also applies to each fixed choice in the colored positive moment, whose extra weights are divisor bounded. Möbius inversion and harmonic summation over $d$ remove the signed sector $\gcd(NC,NC')\ge U^{.2797}$ at cost $O_\epsilon(U^{1+\epsilon})$. On every remaining pair the product of the rational primes occurring just once across both norms exceeds $U^{1.1964}$ for sufficiently large $U$. For the genuine uncolored Möbius factors the [bin-density argument](short-inverse-density.md) gives the stronger complete eighteenth-moment price $1.03970$ and removes common divisors down to $U^{.2040}$. For one genuine physical inverse, a forced prime sum improves the complete eighteenth moment. The signed estimate at price $1.00029$ remains open. [Marked density estimate](short-inverse-marked-density.md) · [Rational columns and orientation](rational-short-inverse.md) · [Exact margin checks](short_inverse.py)

Prepared with OpenAI Codex assistance.
