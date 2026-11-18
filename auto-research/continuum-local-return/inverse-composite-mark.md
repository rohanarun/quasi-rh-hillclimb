# A genuine inverse with one arbitrary short ideal coefficient

Assume the preprint's 7/8 theorem and its unmarked all-element inverse estimate. Over the Eisenstein integers let $A=U^r$, $D_0=U^w$. Use a fixed finite ray character $\nu$, one common sextic orientation, and the literal zero-extended symbols $J_n(u)=(u/n)_6$ on good indices. Let $W$ be a fixed smooth compactly supported norm-annulus test and let $|b_d|\ll_\epsilon U^\epsilon$ be arbitrary row-independent coefficients on $Nd\asymp D_0$. Then
$$
 \sum_{0<Nu\ll U}
 \left|\frac1{\sqrt A}\sum_n\mu(n)\nu(n)J_n(u)W(Nn/A)
        \ \frac1{\sqrt {D_0}}\sum_d b_dJ_d(u)\right|^2
 \ll_\epsilon U^{1+\epsilon},\qquad r+5w<1.                       \tag{1}
$$
One may insert an independent puncture in the inverse of polynomial norm. Finite Fourier subdivisions, ray selections and norms raised to fixed imaginary powers are allowed with the polynomial height cost of the source inverse estimate. Any nonseparable angular or arithmetic weight on the short ideal is already covered by $b_d$. The inverse keeps the phase and test for which the native estimate holds. An angular factor on the inverse would require the native estimate for that same factor. Complex conjugation gives the reverse common orientation. If the original orientations differ, first conjugate the entire short factor, including its coefficients. This preserves its modulus and puts both symbols in the displayed orientation.

The bound is uniform over any fixed finite list of short coefficient tests satisfying this envelope, including their required Sobolev derivatives. More generally suppose $b_d(\mathbf t)$ is the sum over a parametrization of $d$ with divisor-bounded fibres, and each summand and the finitely many required derivatives in $\mathbf t$ have modulus $\ll_\epsilon U^\epsilon(1+\|\mathbf t\|)^C$. Summing within each fibre preserves the envelope with that polynomial height cost. Apply (1) to each differentiated coefficient at fixed $\mathbf t$, and integrate the finitely many resulting estimates on unit parameter boxes before taking the Sobolev supremum. A growing family of boxes contributes its covering number. An offset norm phase on the short coefficient itself needs no smoothness in $d$.

The native estimate needed in the proof is
$$
 \sum_{0<Ny\le V}\sup_{0<X'\le A}|M_y(X';W)|^2
 \ll_{c,\epsilon} U^\epsilon \max(V,A^{1+c}),                    \tag{2}
$$
where $M$ has the genuine Möbius and finite ray coefficients, its usual central normalization, and either zero-extended orientation. Enlarge the row ball before using the preprint's scale supremum. At a puncture $B_0$ of polynomial norm, expand the inverse Euler correction to express the punctured inverse as a sum of unpunctured inverse polynomials at scales $X'/Nt$, each with multiplier of modulus at most $(Nt)^{-1/2}$, where all prime divisors of $t$ divide $B_0$. The sum of these multipliers on the polynomial range is $U^\epsilon$, uniformly by the divisor-product estimate. Indeed $\sum_{t:\,p\mid t\Rightarrow p\mid B_0}(Nt)^{-1/2}=\prod_{p\mid B_0}(1-(Np)^{-1/2})^{-1}\ll_\epsilon (2NB_0)^\epsilon$. Thus even a varying puncture costs at most $U^\epsilon$ times the same unpunctured supremum pointwise, after every remaining coefficient has this form. It applies to the Fourier-shifted smooth tests below, with a fixed polynomial cost in the shift. [Preprint, raw inverse and scale supremum](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12343-L12469)

## Reducing the columns

Extract the entire powerful ideal part $d_0$ of $d$ (all prime powers of exponents at least two), so $d=d_0d_1$, $d_1$ squarefree and prime to $d_0$. At fixed $d_0$, the scalar in the moment norm is $(Nd_0)^{-1/2}$ and the outer row phase has modulus at most one. The sum of these scalars is $O_\epsilon(U^\epsilon)$ by powerful ideal counting. Next fix $l=(n,d_1)$, with $n=l n_1$, $d_1=l d_2$. The column scalar is $(Nl)^{-1}$, summable with divisor weights on polynomial ranges. Remove the exterior row phase by positivity. At this stage each joint column $C=n_1d_2$ is squarefree, and the factorization has exact internal condition $(n_1,d_2)=1$. Original fixed and extracted exclusions are individual punctures. After these Minkowski steps it suffices to use the same notation $n,d,A,D_0$ for the shortened labels. Their scales only decrease. Condition (1) persists.

Use a smooth positive row majorant at $U$ and expand the square. The total coefficient on a squarefree $C$ has absolute value $\ll U^\epsilon(AD_0)^{-1/2}$ by the divisor bound, so identical columns cost $O_\epsilon(U^{1+\epsilon})$. On unequal columns freeze $g=(C,C')$, put $G=Ng$, and assign each prime of $g$ to a label on each side. There are $\tau(g)^{O(1)}$ assignments. Put $R=AD_0/G$ and write $C=g u_1,C'=g u_2$. The residuals $u_1,u_2$ are squarefree, prime to $g$ and coprime to one another. The paired character is primitive on $u_1u_2$ with an extra mask exactly at $g$. Expand that mask over $j\mid g$, $J=Nj$. The literal character at the resulting multiple of $j$ contributes $J_{u_1}(j)\overline{J_{u_2}(j)}$. Lattice Poisson, with a fixed trace-dual generator and radial test, gives prefactor $U/(J\sqrt{Nu_1 Nu_2})$ and Schwartz weight at $U Nh/(JNu_1Nu_2)$ for $h\ne0$. For coprime residuals the Gauss multiplier is $\gamma(u_1)\overline{\gamma(u_2)}$ times a fixed ray factor, and the frequency contributes $\overline{J_{u_1}(h)}J_{u_2}(h)$. Here $\gamma$ is the normalized primitive Gauss factor for $J$. The opposite-orientation CRT cross factor is fixed by sextic reciprocity. Unit corrections, parity and the trace-dual fixed data require only finite ray refinements. Pull out $1/R$, separate the residual log norms in the test, and truncate the nonzero frequency at $H=(JR^2/U)U^\epsilon$ with arbitrary tail order. If $H<1$ the nonzero-frequency term is negligible using an arbitrarily small preliminary buffer. [Masked primitive Poisson and the principal-frequency convention](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9722-L9787) · [Primary reciprocity and Gauss sums](https://arxiv.org/pdf/2308.10602#page=3)

Enforce $(u_1,u_2)=1$ by signed Möbius inversion on the just-separated expression, extended to all squarefree $u_1,u_2$. Freeze the divisor $m\mid u_1,u_2$, with norm $M$, and assign its primes to the two residual labels independently on each side. The original product of the two label normalizations now supplies $1/(GM)$ times the two normalized free label vectors on either side. On one side write $u_i=m a d$, where $a$ is the true free inverse label, $d$ the free short label, and their norm scales are $X,D$. Thus
$$
 XD=R/M
$$
up to fixed annular constants. They are coprime because the joint column is squarefree, and each avoids $mg$. At fixed $g,m$ and their assignments, the Möbius factor on $a$ is exactly $\mu(a)$ times a fixed scalar. Its norm test is $W(Na/X)$ and its coefficient character is the original $\nu$, after finite ray subdivision and a separated norm twist. Gauss multiplication on the squarefree support yields
$$
 \gamma(mad)=\gamma(m)\gamma(a)\gamma(d)
 J_a(m)^2 J_d(m)^2 J_a(d)^2\cdot\varepsilon_{\rm ray}.
$$
Consequently the remaining $a$-character equals
$$
 J_a(jm^2)\,\overline{J_a(h d^4)} .
$$
The product agrees including zero whenever $(a,d)>1$, so the internal $a,d$ coprimality can now be extended without coloring. All other factors involving $d$ have modulus at most $U^\epsilon$ and do not involve $a$. They may depend on $h$, since Cauchy is used separately for each $h$. In particular the arbitrary original weight is just its value at the corresponding multiple of $d$.

Cauchy in the normalized short sum costs $\sum_{Nd\asymp D}|b'_d(h)|^2/D\ll U^\epsilon$. For a fixed nonzero $k$ the number of pairs $(h,d)$ with $k=h d^4$ is divisor bounded, using primary generators and finitely many units. The remaining sum on one side is therefore bounded by
$$
 E(K,p)=\sum_{0<Nk\le K}
 \left|X^{-1/2}\sum_a\mu(a)\nu'(a)\gamma(a)J_a(p)
 \overline{J_a(k)}W_1(Na/X)1_{(a,P)=1}\right|^2,
 \qquad p=jm^2,\quad K=H D^4 .
$$
Here $P$ contains the frozen individual punctures, and $W_1$ is a finitely controlled test with a Fourier shift. The two sides of the original square have potentially different $X,D,K$ because their assignments can differ. Cauchy across $h$ and the arithmetic–geometric mean bound the two-sided quantity by the mean of the two such one-sided estimates. Their common exterior factor before summing $m$ is $U/(J R G M)$, up to $U^\epsilon$ and the divisor weights.

## Returning to the genuine inverse

Smoothly majorize the $k$ ball before opening $E$. The diagonal costs $O_\epsilon(KU^\epsilon)$. For a distinct pair $a=f c,a'=f c'$ with $f=(a,a')$, put $F=Nf$ and expand the mask via $e\mid f$, $E_0=Ne$. Both $c,c'$ are squarefree, coprime to $f$ and each other. On their common scale $X/F$, the two original $a$ normalizations supply $1/F$ after extracting $f$. The second Poisson prefactor is $K/(E_0\sqrt{Nc Nc'})$, of scale $KF/(E_0 X)$. Their product is $K/(E_0 X)$.

The second Poisson uses $\overline{J_c}$ on this side. Its normalized Gauss coefficient cancels $\gamma(c)$ up to $J_c(-1)$. The only cross phase between $c,c'$ is fixed once their ray classes are fixed. The numerator on $c$ is now
$$
 J_c(p)J_c(f)^2\overline{J_c(e)}J_c(h')=J_c(y),
 \qquad y=p(f^2/e)h',\qquad h'\ne0 .
$$
The equality is first used on $(c,f)=1$. Its extension to all $c$ retains the exact punctures; in particular $f\mid(y)$ also when $e$ contains a prime of $f$. The conjugate side gives the conjugate expression. Fixed additive conventions give equivalent unit twists after a finite subdivision. This computation uses both individual normalized Gauss factors before taking any absolute values. The Fourier weight truncates $Nh'\ll U^\epsilon E_0(X/F)^2/K$. Consequently
$$
 Ny\ll U^\epsilon\frac{Np\,X^2}{K}
      \ll U^\epsilon U/D^6,
 \qquad  m\mid(y),\quad f\mid(y),\quad Np=JM^2 .
$$

Fourier-separate the two remaining residual log norms and impose $(c,c')=1$ by a second signed Möbius inversion with divisor $z$. Splitting $c=z c_1,c'=z c_2$ supplies $1/Nz$ from their two central normalizations. The surviving column on either side is the genuine inverse $\mu(c_i)\nu''(c_i)J_{c_i}(y)$ at a scale comparable to $X/(F Nz)$ with individual punctures from $P,f,z$. There is no variable angular Gauss phase or coefficient on $c_i$ after cancellation. Use Cauchy on the row product and majorize any of these punctures by the scale supremum in (2). Divisibility of $y$ by $m$ and $f$ follows from its value as the actual frequency and holds independently of the nonunit restrictions and of the restored test. For fixed $m,f,e$ the map $h'\mapsto y$ is injective up to the bounded unit convention.

There are two principal-pair conventions in this separation. The first off-diagonal sum excludes $u_1=u_2=1$, and the second excludes $c=c'=1$. One may add and remove these unit pairs from the separated nonzero-frequency sums. For any fixed radial Schwartz function $\Phi$ and all $t>0$, lattice counting and rapid decay give $t\sum_{h\ne0}|\widehat\Phi(tNh)|\ll_\Phi1$. Thus the second unit pair costs $O_\epsilon(U^\epsilon/X)$ per $f$ with $Nf\asymp X$, after summing the divisors $e\mid f$. Its sum over $f$ is $O_\epsilon(U^\epsilon)$, covered by $K U^\epsilon$ since $K\ge1$ on retained balls. At the first separation the same argument with $t=U/J$ and the total squared coefficient mass over $g$ controls its unit pair by $O_\epsilon(U^\epsilon)$. The actual diagonal terms were bounded separately before either extension.

## Summing the moving data

For each dyadic $D$, the multiplying factor for the restored rows at fixed $g,m,f,e,z$ is
$$
 \frac{U}{J RGM}\frac{K}{X E_0 Nz}
 \ll U^\epsilon\frac{D^5}{G E_0 Nz}.
$$
This follows by substituting $K=(JR^2/U)D^4 U^\epsilon$ and $R=M X D$. In particular there is no factor $M$ in the weight. Sum **first over the divisors $m,f$ of each actual restored row**; there are divisor-boundedly many, with the allocations to the labels and $e\mid f$ costing another divisor power. The first $j\mid g$ can remain fixed. Drop $1/E_0\le1$. The variable $z$ can be summed harmonically at polynomial norm. Inverse scales vary with the allocations, $f,z$, but are all $\ll A$, and their punctures have polynomial norm. Apply the pointwise Euler correction preceding (2) before interchanging the divisors with the row sum. The unpunctured scale supremum then has the same fixed profiles and finite family of ray phases for all these choices. Estimate its row sum by (2). Thus the restored contribution at fixed $g,j$ and $D$ is
$$
 \ll_\epsilon \frac{U^\epsilon}{G} D^5
     \max(U/D^6, A^{1+c})
 \le \frac{U^\epsilon}{G}(U/D+A^{1+c}D^5).
$$
To control constants in this interchange, at each Poisson split insert compact smooth cutoffs equal to one on the original log annuli. All derivatives of the scaled Fourier kernels are uniformly bounded by Schwartz bounds, with a rapidly decreasing factor beyond each frequency cutoff. After integration by parts each two-variable Fourier measure has an integrable common majorant with arbitrarily many polynomial moments. The extra log-frequency tests on $a,c$ are normalized $(Na/X)^{it}$ or $(Nc/(X/F))^{it}$ and the fixed original inverse bump at the corresponding shifted scale. After extracting $z$ this remains the same fixed test at $X/(FNz)$, up to fixed annular factors and phase scalars of modulus one. One may therefore take the scale supremum at each fixed pair of Fourier frequencies and integrate its fixed polynomial height cost. First and second Möbius variables never enter these common Fourier frequencies. This also explains why an arithmetic restriction on the original $b_d$ creates no moving coefficient in the restored inverse.

For the selected diagonal contribution use $K/(JR)\ll U^\epsilon R D^4/U\ll U^\epsilon A D_0^5/U$, so $K\ll U^\epsilon JR$ in the stated range. Its total scalar is then at most $U^{1+\epsilon}/(GM)$ and both divisor sums are harmonic. For the restored contribution choose $c>0$ with $(1+c)r+5w<1$. The bound above is $O_\epsilon(U^{1+\epsilon}/G)$ since nonempty bounded short scales may be set equal to one. The sum over $g$ with divisor weights is harmonic, and the selections of $D$ and other dyadic scales cost $U^\epsilon$. This proves (1) including its diagonal. If $r+6w<1$, the $A^{1+c}$ enlargement in (2) can be avoided wherever $D$ is near its largest scale.

## Two ordinary factors with one arbitrary short coefficient

Let $S_{u,i}(A_i)$ be centrally normalized ordinary ideal sums with fixed smooth annular profiles, finite ray twists and the same moving sextic symbol, with $A_i=U^{x_i}$ for $i=1,2$. Allow independent punctures of polynomial norm. Put $r=x_1+x_2$ and use the short coefficient polynomial $Q_u(D_0)$ from (1). Uniformly with the same height and derivative conventions,
$$
 \sum_{0<Nu\ll U}|S_{u,1}(A_1)S_{u,2}(A_2)Q_u(D_0)|^2
 \ll_\epsilon U^{1+\epsilon},
 \qquad r+5w<1,\quad r+4w<5/6.                                    \tag{3}
$$
The two restrictions account for the selected diagonal and for principal rows after the second Poisson transformation.

First extract the entire powerful part of each of the three input ideals, leaving the three individual residuals squarefree. The scalar per extracted ideal $d_0$ is $(Nd_0)^{-1/2}$ in the moment norm, with subpower sum by powerful-ideal counting. The short coefficient remains arbitrary after this extraction. On the two ordinary labels it leaves their original shifted annular tests, finite character twists, squarefreeness and the individual exclusions from their extracted parts. Next assign each prime shared by two or three squarefree residuals to the subset $I$ of labels containing it. Write $l_I$ for the ideal made up of primes with this exact subset. Freeze the pairwise coprime $l_I$ for $|I|\ge2$. Their scalar is $\prod_I(Nl_I)^{-|I|/2}$, which has subpower sum on polynomial scales. Exterior row phases have modulus at most one. The remaining joint column is squarefree with three pairwise coprime labels.

Use the first Poisson formula in the proof of (1) with $A=A_1A_2$, treating the product of the two ordinary labels as its main ideal. At fixed $g,m$, allocate their prime factors among all three labels on each side. Their assignment counts are bounded by divisor powers. The Gauss multiplication and the absorption of $d^4$ use only the aggregate squarefree ideal $a$ of the two free ordinary labels. Its coefficient is the divisor convolution of their two normalized profiles restricted to squarefree product. The zero on shared primes in $J_a(h d^4)$ again removes its coprimality to $d$ after selection. In the second Poisson step allocate $f$ and then $z$ among the two ordinary labels independently on each side. Each has at most divisor-boundedly many allocations. Every norm scalar is the same as for the aggregate ideal in (1). For example, extracting $f$ from both sides supplies $1/F$ whatever the two allocations. The fixed ray twists from multiplicativity and Gauss cancellation act on the true ordinary labels. The restored column is therefore their original product with joint ideal-squarefree restriction, shifted scales and individual punctures. Both actual diagonals and the two unit-pair corrections have the bounds proved above, as the number of representations of a squarefree aggregate by these labels is divisor bounded.

To restore the ordinary product, at one good prime use formal variables $X_1,X_2$ for its contributions to the two ordinary series. On squarefree joint support the local series is $1+X_1+X_2$. Its quotient by the unrestricted ordinary local series is
$$
 (1+X_1+X_2)(1-X_1)(1-X_2)
 =1-X_1^2-X_2^2-X_1X_2+X_1^2X_2+X_1X_2^2 .
$$
Its first nonconstant terms have total degree two, so the absolute Euler product converges when both real exponents exceed $1/2$. On bounded polynomial scales the centrally normalized total variation is $O_\epsilon(U^\epsilon)$ by moving each absolute exponent to $1/2+\epsilon'$. At a prime individually omitted on one side set its formal variable to zero. Ordinary punctures themselves are removed by the finite factors $1-X_i$, whose absolute Euler correction is a subpower for a polynomial-norm puncture. These coefficientwise convolutions preserve the literal moving characters at nonunits. Termwise the remaining shifts only shorten the two smooth norm scales. Thus a pointwise upper bound by the product of two unpunctured scale suprema, times $U^\epsilon$, is uniform before summing $m,f\mid(y)$. All Fourier twists in this step have the fixed common majorants described in the proof of (1).

For $0<Ny\le V$ those suprema have squared-product moment
$$
 \ll_\epsilon U^\epsilon\left(V+V^{1/6}A_1A_2\right),\qquad V\ge1.           \tag{4}
$$
On rows where both inducing characters are nonprincipal, Cauchy reduces this to the ordinary fourth moment of each presentation. The source's empty-slot bound holds on all nonprincipal element rows, with no restriction on the two bounded length exponents. Apply it to two copies of each same profile. Sobolev in the log scale gives the same estimate for the scale supremum, since its derivative is a fixed smooth test of the same type. The true heights retain the source's polynomial cost. One may use $V$ as base when $V\ge U^{\epsilon'}$ with any fixed $\epsilon'>0$. For smaller $V$ the elementary bound $O(V A_1A_2)$ differs from the second term in (4) by at most $U^{5\epsilon'/6}$. Choose $\epsilon'$ within the reserved loss. If either presentation is principal, the good prime valuations of $(y)$ are all multiples of six. A nonzero good valuation modulo six would force ramification at that place. Freezing the finitely many bad valuations modulo six and the unit, one counts $O_S(V^{1/6})$ sixth-power multiples. On these rows the squared product is $O_\epsilon(U^\epsilon A_1A_2)$ by absolute counting. This proves (4) for the finite twists and the permitted derivative tests. [Nonprincipal rows and the zero-slot fourth moment](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12518-L12579)

The common restored weight is still $D^5/G$ and the nonzero rows obey $Ny\ll U^{1+\epsilon}/D^6$. If this upper bound is below one the retained sum is empty. Otherwise (4), followed by the same divisor sums, gives at most
$$
 \frac{U^\epsilon}{G}\left(\frac U D+U^{1/6}A_1A_2D^4\right).
$$
The second inequality of (3) pays for the second term because $D\ll D_0$. The first inequality pays for the selected diagonal by $K/(JR)\ll U^\epsilon A_1A_2D_0^5/U$. All prior extractions reduce the label scales. Harmonic summation proves (3).

Prepared with OpenAI Codex assistance.
