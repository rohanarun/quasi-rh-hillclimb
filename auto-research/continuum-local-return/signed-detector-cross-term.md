# The signed Möbius–ordinary cross term at the critical total norm

Assume the preprint's $7/8$ theorem and the actual pointwise and marked-moment estimates of tracker #143. Fix its critical buffered bin and original prime-amplitude class. Use $a=(1+\delta)/2$, $q_0=a-1/2$, $m=t_0/3$, $b=2m$, $\lambda=10^{-5}$, $\eta=10^{-7}$ and the original class-count exponent $R$. In particular $t_0>1.12796$. The character below is the original zero-extended presentation $\psi$ of the selected detector zero. The detector can use the physical denominator when that presentation has an eligible zero. All comparisons use one and the same $\psi$ within a product.

**Result.** Outside $O(U^{R-\eta})$ rows, every selected zero $\rho=\sigma+i\gamma$ with $a\le\sigma<a+e$ and $|\gamma|\le3iT_1$ supplies a total dyadic center $Z=U^\ell$ with
$$
t_0-\lambda-o(1)\le\ell\le t_0+2\lambda+o(1).
$$
At that center there are two specified sums $A,B$ of ideal coefficients, defined below. Their normalized magnitudes exceed $Z^{q_0}/(C\log U)^2$ for sufficiently large $U$, and
$$
 |A+B|\ll Z^{q_0}U^{-\eta},\qquad
 -\Re(A\overline B)\ge |A|^2/2 .
$$
The common norm twist in these sums is the selected zero ordinate $\gamma$. There is no intervening selection of frequencies for their definitions. The pairs inducing the principal good sextic character, and separately all pairs of equal rational norm, each contribute $O_\epsilon(U^{-.0468+\epsilon})$ per row. A lower bound for the complementary real cross term on the surviving class would suffice for a saved count. That bound is open.

## Definition and localization

Fix smooth dyadic partitions in total norm and in each of the two variables, including the bounded unit variable. Write $W_Z(d)=W(d/Z)$ for the total partition bump, and $W_D,W_N$ for the independent partitions. For a scalar variable $s_*=\sigma+it$ define
$$
 H_{D,N}(Z;s_*)=Z^{-1/2}\sum_{l,k}\mu(l)\psi(lk)W_D(Nl)W_N(Nk)W_Z(N(lk))\,(N(lk)/Z)^{-s_*} .
$$
The letter $N$ as an argument of $W_N$ denotes a dyadic center, and $Nl$ denotes ideal norm. Write $x=\log_U D$, $y=\log_U N$. On a nonempty sum $x+y=\ell+O(1/\log U)$. Define $A$ by summing $H_{D,N}$ over $x<b+\lambda$, $y<m+\lambda$. Define $B$ by summing over $x>t_0-\lambda$, $y<m+\lambda$. Boundary equalities can be assigned to the excluded factors. Both choices depend only on the fixed bin and scales. Each is a full sum over its indicated pair of length ranges; their signed relation does not assert that two separately selected individual dyads have opposite phases.

Use the single-factor comparisons of [the four-factor reduction](four-factors.md) with this $\lambda$ and their numerical slack as in [the physical denominator factorization](short-physical-inverse.md). Remove any rows with an inverse dyad at $b+\lambda\le x\le t_0-\lambda$ or an ordinary dyad at $y\ge m+\lambda$ of magnitude at least its pointwise exponent $U^{q_0x}$ or $U^{q_0 y}$ times $U^{-1.5\eta}$. Use the standard finite list of bumps for both the truncated and full inverse constructions, with the bounded cutoff where present, over all common dyadic scales and all heights needed for these separations and the zero evaluations. These are the original single-factor count comparisons with fourth-moment debit $6\eta$ or second-moment debit $3\eta$. Each retains the saved count uniformly in the bounded real powers, the allowed heights and the finitely many presentations. The logarithmic number of additional scales fits in their fixed slack. This removal used heights only when bounding an error. The actual signed sums still use the common original height.

For any pair of lengths having one of these excluded factors, the entire coupled total-norm test costs $O(Z^{q_0}U^{-1.25\eta})$ on the surviving rows. Indeed Fourier-separate its smooth part in $\log(N(lk)/Z)$ on the independent dyads. This gives a single common added frequency in $l,k$ and bounded $L^1$ mass. The other factor costs its usual pointwise bound $U^{q_0 x+\epsilon_1}$ or $U^{q_0 y+\epsilon_1}$. The central normalizations agree up to fixed constants. Choose the preliminary powers inside the $0.25\eta$ reserve and the Fourier tail order after the height exponent. The same conclusion holds with the total test multiplied by a fixed power of $\log(N(lk)/Z)$ and with the smooth total transitions of the Gamma detector present. After summing logarithmically many error pairs the bound is $O(Z^{q_0}U^{-\eta})$. The tests have fixed compact total log-norm support. For the untruncated complete convolution at any nonunit total center, $\sum_{D,N}H_{D,N}=0$ exactly by $\mu*1=\boldsymbol1$. Thus for every $Z$ in the displayed interval and all retained heights and bounded real powers,
$$
 A(Z;s_*)+B(Z;s_*)=O(Z^{q_0}U^{-\eta}).                                  \tag{1}
$$
It suffices that $Z$ is separated from the unit annulus for this particular inequality.

At $\rho$ run the source Gamma detector with inverse cutoff $D_*=U^{t_0-5\lambda}$. Its unit-calibrated tail equals $-1+o(1)$. First partition in total norm $Z$ and then in $D,N$ while retaining the sums over $D,N$ within each $Z$-term. The original outer factors of this term are $Z^{1/2-\rho}$ times center phases of modulus one; the normalized test includes $1-V_{\le}(2N(lk)/D_*)$, the Gamma exponential, and the terminal cutoff at $U^{21}$. The inverse cutoff $V_{\le}(Nl/D_*)$ forces $x\le t_0-5\lambda+o(1)$. The calibrated tail forces $\ell\ge t_0-5\lambda-o(1)$. The excluded pairs across *all* total centers contribute $O(U^{-\eta+o(1)})$ after restoring the power $Z^{1/2-\sigma}$, since $\sigma\ge a$. The remaining pairs lie in $A$ with the common detector total test. On these pairs $V_{\le}(Nl/D_*)=1$ identically because $b+\lambda<t_0-5\lambda$. They give $\ell\le t_0+2\lambda+o(1)$. Among the $O(\log U)$ possible total centers at least one therefore has normalized signed magnitude $\gg Z^{\sigma-1/2}/\log U$. Apply the same full-convolution identity (1) with that identical total test reinserted. If $\ell<t_0-\lambda-O(1/\log U)$, the other range $B$ is absent, contradicting this lower bound. Consequently the selected center has $\ell\ge t_0-\lambda-o(1)$ as asserted. The sharp cutoff factor is now identically one on that entire total annulus, as is the terminal cutoff. The Gamma exponential at this center can be replaced by one with negligible error even by absolute ideal counting. For example $|1-\exp(-N(lk)/U^{20})|\ll U^{-18}$ throughout. The resulting $A$ has the claimed magnitude and (1) now gives both the bound for $B$ and the inequality for the real cross term.

## The full principal-character diagonal

Use $l,n$ for one $A$ term (inverse and ordinary) and $c,d$ for one $B$ term (inverse and ordinary). A nonzero cross term has $l,c$ squarefree. All ideals avoid the same fixed excluded set. The support at the selected $Z$ gives $Nn\asymp Y$ with $\log_U Y\ge m-3\lambda-o(1)$ and $Nd\ll U^{4\lambda}$, allowing fixed annular constants. The two total norms $N(ln),N(cd)$ are comparable to $Z$.

The paired character is principal on good units precisely when $(ln)/(cd)=(v/w)^6$ for coprime integral ideals $v,w$. Here equality and products refer to ideals. At a prime dividing $w$, the prime valuation of $d$ is at least $6v_{\mathfrak p}(w)-1\ge5v_{\mathfrak p}(w)$, using squarefreeness of $c$. Hence $w^5\mid d$ and $Nv\asymp Nw\ll (Nd)^{1/5}$. Write $d w^{-6}v^6=e'/w'$ in lowest terms with coprime integral $e',w'$. Thus $c=w' l n/e'$. Put $k=(l,e')$, $l=k l_0$, $n=(e'/k)n_0$ and $c=w' l_0 n_0$. Squarefreeness gives, wherever the coefficient is nonzero,
$$
 \mu(l)\mu(c)=\mu(k)\mu(w')\mu^2(l_0)\mu(n_0),
 \qquad (n_0,w'l_0)=1 .
$$
The other conditions from these substitutions concern only the frozen $d,v,w,k,l_0$. The original row zeros either kill the term or add the mask $(n_0,uS)=1$. On the remaining support the ratio of the moving sextic phases equals one. The fixed ray ratio is the fixed character of $(v/w)^6$. The two norm heights cancel in $n_0$ and leave the bounded phase $(Nv/Nw)^{-6it}$. The remaining smooth real annular profiles, including either derivative test, have uniformly bounded fixed log derivatives on the true $n_0$ annulus of center $Y'=Y/N(e'/k)$. Empty annuli are omitted. Since $Ne'\le Nd\,(Nv)^6\ll (Nd)^{11/5}$, this scale grows as a fixed positive power of $U$.

For any such smooth weight the true remaining sum in $n_0$ is $O_\epsilon((Y')^{7/8+\epsilon}U^\epsilon)$. Its Dirichlet series before inserting smooth norm weights is $1/\zeta_{\mathbb Q(\omega)}(s)$ multiplied by $\prod_{\mathfrak p\mid w' l_0 u S}(1-(N\mathfrak p)^{-s})^{-1}$. The radical has polynomial norm in $U$, so on $\Re s=7/8+\epsilon$ these factors cost $O_\epsilon(U^\epsilon)$, by a fixed finite-prime split or the divisor-product bound. The preprint's $7/8$ theorem and its logarithmic-control bound for the reciprocal of the fixed zeta function allow the Mellin shift; the profile pays every fixed height power. This signed Möbius cancellation holds on each individual physical row, also for a rowwise choice of the common height.

There are $O_\epsilon(U^\epsilon)$ choices of $k\mid e'$ and $O(1+D_l/Nk)$ choices of $l_0$ at prefix scale $Nl\asymp D_l$. Nonempty terms have $D_l/Nk\gg1$. Since $Z\asymp D_lY$, the product of the two central normalizations times the $l_0,n_0$ sums is $O_\epsilon(U^\epsilon Y^{-1/8})$ for fixed $d,v,w$, even dropping the denominators from the shortened scales. The number of choices of $d,v,w$ is $O_\epsilon(U^{(7/5)(4\lambda)+\epsilon})$ by ideal counting. The number of dyadic length quadruples is logarithmic to a fixed power. Finally $(m-3\lambda)/8-(7/5)(4\lambda)>.0468$ by $t_0>1.12796$. This proves the stated principal-sector bound. For literal equality of the two columns with $d=1$, the diagonal already reduces to $\mu^2(l)\mu(n)$ on $(l,n)=1$.

## All pairs of equal rational norm, including opposite split primes

There is a different signed estimate which covers every pair with $N(ln)=N(cd)$, irrespective of the ideal-ratio conductor. More generally fix a reduced positive rational ratio $A_0/B_0=N(ln)/N(cd)$, so $A_0\asymp B_0$. On each of the four fixed dyadic label annuli write $X\asymp Nl$, $Y\asymp Nn$, and $E\asymp Nd$, with $XY\asymp Z$. For this ratio the whole signed contribution per row has magnitude
$$
 \ll_\epsilon U^\epsilon\min\{A_0^{-1},\ E Y^{-1/8} A_0^{-7/8}\}.                    \tag{3}
$$
The first term is absolute: the two total norms are $A_0 j,B_0 j$ with $j\ll Z/A_0$, and each integer norm supports a divisor-bounded number of ideals and their ordered two-factor decompositions. Both column coefficients together cost $O(1/Z)$. The second term uses the arithmetic signs. At $A_0=B_0=1$ it saves $U^{-.0468}$ after all dyads, including when the two columns use conjugate primes above the same rational prime and the paired sextic character is nonprincipal.

To prove the second term freeze $l,d$. Put $G=\gcd_{\mathbb Z}(B_0Nl,A_0Nd)$, $d'=A_0Nd/G$ and $l'=B_0Nl/G$. The equality of rational norms is equivalent to $Nn=d' j$, $Nc=l' j$ with $j$ a positive integer and $\gcd(d',l')=1$. The common norm twist in the cross product is the constant $(A_0/B_0)^{-it}$. The remaining smooth weight in $j$ is supported at scale $Y/d'$ and has bounded fixed log derivatives, including the extra real powers and the log tests. All phases at $l,d$ are fixed. For the coefficient of $j$ set
$$
 a_j=\left(\sum_{Nn=d'j}\psi(n)\right)
      \left(\sum_{Nc=l'j}\mu(c)\overline{\psi(c)}\right),\qquad
 \theta(I)=\psi^*(I)\,\overline{\psi^*(\overline I)}
$$
away from the conductors, with $\psi^*$ the original primitive inducing character. The latter is a finite-order Hecke character, induced by a primitive $\theta^*$ with conductor norm $O_S(U^2)$ since the primitive conductor of $\psi$ has norm $O_S(U)$. The row need not have any zero-free bin for $\theta^*$; the global $7/8$ theorem applies.

The Dirichlet series $\sum_{j\ge1} a_j j^{-s}$ factors as an exact product over rational primes by independent ideal factorization at every place. A bad local constant may vanish. No division by that constant is involved. At $p\nmid d'l'Nu$ outside the rational primes under the original exclusions and conductors, the local constant is one. A split prime $p=\mathfrak p\overline{\mathfrak p}$ has degree-one coefficient
$$
 -|\psi(\mathfrak p)+\psi(\overline{\mathfrak p})|^2
 =-2-\theta(\mathfrak p)-\theta(\overline{\mathfrak p});
$$
an inert prime has degree-one coefficient zero. Consequently the first-degree terms are those of $[\zeta_K(s)L_K(s,\theta^*)]^{-1}$. The local sequence has degree at most two since $c$ is squarefree. Its other good coefficients are absolutely bounded. Dividing these good local polynomials by the indicated reciprocal Euler factors gives $1+O(p^{-2\Re s})$ uniformly on $\Re s\ge 7/8$. At exceptional primes keep the full polynomial: at degree $j_p\le2$ its absolute coefficient is $O(v_p(d')+3)$, using at most $v_p(d')+j_p+1$ ideals on the ordinary side and at most two squarefree ideals of the prescribed norm on the inverse side. If $v_p(l')>2$, the local polynomial can be zero. The bounded number of primitive Euler factors needed to pass to the full reciprocal cost at most $(1-p^{-\Re s})^{-4}$ there. The product of these bounds over the exceptional primes costs $O_\epsilon(U^\epsilon)$ because $d'l'Nu$ and the two conductor norms grow at most polynomially in $U$. This proves a uniform continuation and bound for the coefficient series on $\Re s=7/8+\epsilon$ using the assumed zero-free theorem and the preprint's logarithmic control (with its principal regularization if necessary). Mellin shifting the true $j$-sum gives $O_\epsilon(U^\epsilon(Y/d')^{7/8+\epsilon})$, also for bounded nonempty scales by absolute summation. The result applies on every individual row.

Since $G\le Nd\gcd(B_0Nl,A_0)=Nd\gcd(Nl,A_0)$, we have $d'\ge A_0/\gcd(Nl,A_0)$. The elementary norm-count estimate gives
$$
 \sum_{Nl\asymp X}\gcd(Nl,A_0)^{7/8}
 \ll_\epsilon U^\epsilon\sum_{h\mid A_0,\,h\ll X} h^{7/8}X/h
 \ll_\epsilon XU^\epsilon.
$$
Count the $O(E)$ choices of $d$ and divide by $Z\asymp XY$ for the normalizations. This proves (3). For a collection of ratios one may sum (3) over its members. For the overlap with the principal sextic sector, restrict its proof to the allowed ratios. In the latter sector the rational ratio is fixed already by $v,w$, so its earlier signed proof applies to the restricted collection. To remove a union, subtract this intersection only once. The arithmetic term in (3) improves on the absolute bound for ratios with $A_0$ below $Y/E^8$. In particular the equal-norm assertion costs $O_\epsilon(U^{-.0468+\epsilon})$ where literal absolute counting only gave $O_\epsilon(U^\epsilon)$.

## The sector of small primitive quotient conductors

Let $\mathfrak q$ be the good primitive conductor of the paired moving sextic character. Without a rational-height restriction, all pairs with $N\mathfrak q\le K$, $K\ge1$, have signed cost per row
$$
 \ll_\epsilon U^\epsilon\min\{K^{1/2},\ E Y^{-1/8}K^{9/16}\} .                    \tag{4}
$$
Here $Y,E$ are the respective long and short ordinary dyadic scales as above; logarithmically many dyads cost $U^\epsilon$. This includes a signed negative power for $K\le U^{.08}$, and a bound $O_\epsilon(U^{.201+\epsilon})$ for $K\le U^{.44}$, throughout the selected interval. The second bound is smaller than the elementary absolute $O_\epsilon(U^{.22+\epsilon})$ at the latter cutoff. The signed estimate improves on absolute counting for $K<Y^2/E^{16}$.

Take the canonical expression of the *reduced* ideal quotient
$$
 (ln)/(cd)=\mathfrak a v^6/(\mathfrak b w^6),\qquad
 (\mathfrak a v,\mathfrak b w)=1,
$$
where $\mathfrak a,\mathfrak b$ are sixth-power-free. Each nonzero residue at a good prime ramifies in the primitive sextic quotient. Thus $\mathfrak q=\operatorname{rad}(\mathfrak a\mathfrak b)$. Use $A_1=N\mathfrak a$, $B_1=N\mathfrak b$. The total annuli imply $Nv\asymp(B_1/A_1)^{1/6}Nw$. On the denominator side every $p^e\Vert w$ forces $p^{6e}\mid cd$ since this is the reduced quotient. As $c$ is squarefree, $w^5\mid d$.

Freeze $\mathfrak a,\mathfrak b,v,w,d$. In the earlier principal-sector substitution now take $w'/e'$ to be $\mathfrak b w^6/(\mathfrak a v^6 d)$ in lowest terms. Canonical coprimality gives $e'=\mathfrak a v^6d/(\mathfrak b w^6,d)$, hence $Ne'\ge A_1(Nv)^6$. Set $k=(l,e')$ and write $l=kl_0$, $n=(e'/k)n_0$ and $c=w'l_0 n_0$. The fixed ratio of the two ideal columns makes their character ratio a fixed scalar once the nonunit masks are imposed. This includes the nonprincipal Kummer phases at $\mathfrak q$. The common norm twist is fixed as well. The identical Möbius cancellation in $n_0$ applies with the mask at $w'l_0uS$. Keeping the shortened-scale denominator this time, the cost for each $k\mid e'$ is
$$
 \ll_\epsilon \frac{U^\epsilon}{XY}\frac{X}{Nk}
       \left(\frac{Y Nk}{Ne'}\right)^{7/8}
 \le U^\epsilon Y^{-1/8} A_1^{-7/8}(Nv)^{-21/4}.
$$
The cases of empty annuli and bounded occupied centers are included. All auxiliary integers have polynomial size. Sum over the divisor-bounded choices of $k$. The possible $v$ lie on a norm annulus $V\asymp(B_1/A_1)^{1/6}Nw$, containing $O(V)$ ideals when nonempty. The remaining factor after this summation is
$$
 A_1^{-7/8}V^{-17/4}
 \ll (A_1B_1)^{-7/16}
         (A_1/B_1)^{13/48}(Nw)^{-17/4}
 \ll (A_1B_1)^{-7/16}.
$$
For the last inequality $Nw\ge1$ and nonemptiness gives $Nw\gg(A_1/B_1)^{1/6}$. At a fixed $d$, $w^5\mid d$ offers only divisor-boundedly many $w$. Count $O(E)$ short $d$. Each squarefree conductor $\mathfrak q$ allows at most $10^{\omega(\mathfrak q)}$ choices of $\mathfrak a,\mathfrak b$, since a prime is put on one side with exponent from one through five. Also $A_1B_1\ge N\mathfrak q$. The sum of $(N\mathfrak q)^{-7/16}$ through $K$ gives the asserted signed bound.

For the absolute bound in (4) fix $\mathfrak a,\mathfrak b,v,w$. The pair of total ideals has the form $\mathfrak a v^6 j,\mathfrak b w^6 j$. Their $O_\epsilon(U^\epsilon)$ factorizations and the $1/Z$ normalization bound their aggregate absolute mass by
$$
 \ll_\epsilon U^\epsilon/(\sqrt{A_1B_1}(NvNw)^3).
$$
Indeed $Nj\ll Z/(A_1(Nv)^6)$ and $A_1(Nv)^6\asymp B_1(Nw)^6$. The two sixth-root sums converge and the conductor sum of $(N\mathfrak q)^{-1/2}$ through $K$ is $O(K^{1/2})$. The signed proof permits any further restriction on $\mathfrak a,\mathfrak b,v,w,d$, independent of $n_0$. In particular the rational norm ratio is determined by these fixed ideals, so the small-conductor and equal-rational-norm sectors may be combined without losing either estimate. For the open signed test one may remove any such union whose cost meets its price.

## What is needed to count the rows

The sign refers to the *aggregate* on each of the two length ranges, including its actual coupled total test. There is no sign assertion term by term. It is also possible to use fixed sample heights without retaining the row-selected $\gamma$ inside the arithmetic sum. Let $\mathcal S$ be the original surviving class above, independent of the evaluation coordinates after its uniform exclusions, and let $A_j,B_j$ use the total bump multiplied by $(\log(N(lk)/Z))^j$, with the analogous argument $N(cd)/Z$ on the other side. A sufficient new arithmetic estimate would be, uniformly on this class, in $Z$ in its displayed range, for $j=0,1,2$, bounded $\sigma\in[a,a+e]$ and common $t$ in the buffered height interval,
$$
 -\Re\sum_{u\in\mathcal S} (A_j\overline {B_j})_{\rm nonprincipal}(Z;\sigma+it)
       \ll U^{R-2\eta+\epsilon} Z^{\delta}(1+H+|t|)^J .                 \tag{2}
$$
Here $H,J$ denote the customary external-height parameter and a fixed degree. Fix each original presentation label throughout the rectangle and use (1) for each of these tests. The finite union over eligible labels can be taken after obtaining positive squared bounds. The identity $|A_j|^2\le |A_j+B_j|^2-2\Re(A_j\overline{B_j})$ and the original bound on $\#\mathcal S$ pay the error square at $U^{R-2\eta+\epsilon}Z^\delta$. The principal part is smaller. The union of the equal-rational-norm pairs and the pairs of primitive conductor norm at most $U^{.44}$ can also be removed here. Its cost per row is $O_\epsilon(U^{.201+\epsilon})$, well below $Z^\delta U^{-2\eta}$. Integrate the resulting positive squared estimate in the real and imaginary coordinates of $s_*$ and apply one-dimensional Sobolev on their respective intervals, twice in succession. The two derivatives and the mixed derivative cost exactly the log tests of orders through two; the constants may depend on the fixed bin mesh. The height power is chosen after the fixed moment degree, using the original height guard with a bounded enlargement. Summing over the fixed presentations and the logarithmically many possible $Z$ and using the lower bound on $A$ gives a saved count after the freely small losses. One may alternatively prove (2) on the *entire original buffered amplitude class* before these single-factor exclusions. Indeed the physical-window comparison margins exceed $10\eta$ before a debit of at most $6\eta$. The excluded rows therefore have count $O(U^{R-3\eta})$ after allowing the original fixed small losses. On these rows the buffered pointwise bounds alone give $|A_j|+|B_j|\ll Z^{q_0}U^{\epsilon_1}$, including the total weight by Fourier separation. Their cross contribution is below the price in (2). This argument does not allow an unrestricted complete signed row measure in place of the buffered class.

[The original unit-calibrated detector](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4510-L4681) · [Physical single-factor comparisons](four-factors.md) · [Preprint logarithmic control](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1531-L1620).

Prepared with OpenAI Codex assistance.
