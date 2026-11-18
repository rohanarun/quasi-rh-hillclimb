# Dual frequencies for the rational-squarefree ninth power

Assume the preprint's $7/8$ theorem and tracker #143's physical inputs. Consider the [rational-squarefree column](rational-short-inverse.md) at the nine allowed scales $Y_i\le U^z$, with $L=\prod_iY_i$, $.87794<\ell=\log_U L<.8883$, $z<.0987$. Use the smooth radial all-element row majorant and expand the two columns of its squared moment. One may first remove the pairs with rational gcd at least $U^{.3875}$ by the proved estimate in that reduction. On the other pairs the signed Poisson contribution of the following union costs $O_\epsilon(U^{1.000287+\epsilon})$.

* Every nonzero dual element $w$ with $Nw\le U^{5/23}$ costs, in aggregate, $O_\epsilon(U^{1+\epsilon})$.
* For sixth-power-free $w$, the upper cutoff can be raised to $U^{.33448}$ at the stated price $U^{1.000287+\epsilon}$.
* If $E(w)$ denotes the product of prime ideals at which $(w)$ has valuation exactly one, then $NE(w)\le U^{.0129}$ costs $O_\epsilon(U^{1+\epsilon})$ through the entire dual range. This includes every powerful dual ideal, with arbitrary sixth-power factors.

These bounds apply with the fixed original smooth Möbius profiles, common norm height and fixed ray twist. For the log-norm multiplier use the sum of the nine tests obtained by inserting a single log in one coordinate. The ensuing cross terms have the same one-sided bounds on both sides. The optional fixed prime and label selections from the positive moment also satisfy the estimates, since $18^{\omega(n)}$ factors over the labels on rationally squarefree tuples.

The estimates permit an arbitrary extra restriction depending on the norm or factorization of the dual ideal. They permit an independent cutoff on $\gcd(NC_1,NC_2)$, including the complement of the already removed large-rational-gcd range.

## The exact common factors and the scale

Away from the fixed excluded primes, each rational prime of a squarefree column norm splits in the Eisenstein field, and precisely one prime above it occurs, to exponent one. For each rational prime appearing in both columns, record its ideal on the first side in $g$ if the ideals on the two sides agree, and in $k$ if they are conjugate. This gives uniquely
$$
 C_1=g k r_1,\qquad C_2=g\bar k r_2,\qquad
 \gcd(Nr_1,Nr_2)=1,\qquad \gcd(NC_1,NC_2)=Ng\,Nk.
$$
The rational prime supports of $g,k,r_1,r_2$ are pairwise disjoint, and $r_1,r_2$ have squarefree rational norm. The two fixed allocations to the original nine labels cost at most $\tau(gk)^{O(1)}$. On each allocation the divisor $gk$ or $g\bar k$ supplies the factor $(Ng\,Nk)^{-1/2}$ in its column. Each residual label has its originally prescribed normalized profile with shortened norm scale, its Möbius sign and original masks. Multiplicativity of the Möbius signs holds because the remaining factors avoid the rational support of $gk$. The residual columns have common scale
$$ R=L/(Ng\,Nk),\qquad s=\log_U R. $$
After extracting the scalar, the coefficient vector of each whole residual column or of any group of residual factors has squared norm $O_\epsilon(U^\epsilon)$. This follows from the inverse square-root normalization, the fixed divisor bound on the number of labelings, and ideal counting.

For two independently summed supports one can impose absence of common rational primes exactly. Randomly two-color the rational primes, require that the first side use only the first color and the second side only the second, and multiply the two individual weights by $2^{\omega(Nr_i)}$. The expectation of the product is the desired indicator. All weights are divisor bounded. This gives separate fixed support restrictions in the two column sums. If subgroups within one column must have coprime rational norms, apply another independent coloring to those two groups. The outer color compensator factors over inner groups on their disjoint rational supports. Thus the same proof allows the original rational squarefreeness and the final exact gcd cutoff at once.

Write $J_m(a)=(a/m)_6$ for the good, zero-extended primary sextic symbol. Up to fixed ray factors and conjugating the whole pair, the row character of the two columns is $J_{k r_1}\overline{J_{\bar k r_2}}$ in its argument. Every good prime in $k\bar k r_1r_2$ has primitive local exponent $+1$ or $-1$. The extra nonunit mask is exactly at $g$ and expands over $j\mid g$. The fixed excluded set only causes fixed phase/conductor subdivisions. Put $Y=U/Nj$, $b=\log_U Nj$, and $\kappa=\log_U Nk$. Complete primitive Poisson has prefactor $Y/(Nk\sqrt{Nr_1 Nr_2})$ and radial weight at $YNw/((Nk)^2 Nr_1Nr_2)$, up to fixed constants. Its normalized Gauss sum factors, by CRT, into a fixed $k,\bar k$ part, the normalized Gauss factors of $r_1,r_2$ of opposite orientations, and separate bounded twists on each side. In detail the opposite-column cross factors are $J_{r_1}(r_2)\overline{J_{r_2}(r_1)}$, constant on fixed primary ray classes by sextic reciprocity. Factors coupling $k,\bar k,j$ to $r_i$ are individual multiplicative twists. The Fourier frequency contributes $\overline{J_{r_1}(w)}J_{r_2}(w)$, with fixed bounded factors at the frozen support. These formulas include the zeros on nonunits. Row or column orientation reversed throughout gives the conjugate formulas; factors of $-1$ in the conjugate Gauss formula are fixed ray phases. [Gauss multiplication and reciprocity](https://arxiv.org/html/2610.17675v2#S4)

On the fixed residual annuli, pull $1/R$ out of $(Nr_1Nr_2)^{-1/2}$. Fourier-separate the two remaining log norms in the entire radial test. Its Fourier weights are bounded by a common integrable majorant, uniformly in $w$, because $t^m\widetilde W^{(m)}(t)$ is bounded on $t\ge0$ for every fixed $m$. The separated twists on either side are fixed across any subsequent frequency average. One bounds the scalar depending on $w$ by that majorant before Cauchy in $w$. The dyadic blocks which survive rapid Fourier decay satisfy, with $a=\log_U Nw$,
$$ 2s+2\kappa+b\ge 1+a-o(1),\qquad a\le 2\ell-1+o(1)\le .7766+o(1). $$
For the top bound, $Nj\,(Nk)^2Nr_1Nr_2$ divides the union radical, which is $O(L^2)$. One may use arbitrarily small fixed buffers, then a sufficiently large fixed tail order. The trivial character has $k=r_1=r_2=1$ on this exact decomposition; its diagonal zero frequency costs $O_\epsilon(U^{1+\epsilon})$ by the coefficient norm. Its nonzero frequencies have rapid decay as $Nj\ll L$. The other characters have vanishing zero frequency.

If the squared sum on each residual side, before the extracted scalar, costs $U^{M+\epsilon}$ in a frequency box, Cauchy across the two sides gives total at most
$$
 U^\epsilon\frac{U}{Ng\,Nk}\,U^{M-s-b-\kappa}.
$$
This follows by multiplying $Y/(Nk R)$ by $(Ng\,Nk)^{-1}$ from the two extracted factors. The sum of $1/(Ng\,Nk)$ with fixed divisor weights is harmonic, and there are divisor-boundedly many $j$ and allocations. Hence an upper bound for $M-s-b-\kappa$ controls the aggregated excess. This identity retains the normalization on the cross-oriented common primes. It remains valid when the allowed $(g,k)$ boxes obey the large-rational-gcd cutoff.

## Sixth-power-free dual frequencies

For such $w$ the finite-order family in each residual column is de Faveri’s sextic family, up to fixed ray subdivisions and conjugation. Good nonunit zeros are the same on both sides of the identification. There are six possible element units for a fixed ideal, and the sixth-power-free parts supported on the finite bad set have only finitely many choices. The positive sieve allows restriction in $w$ and arbitrary normalized coefficients supported on the residual columns. It gives $M=\Phi(a,s)$ with
$$
 \Phi(a,s)=\max\{a,s,5a/6+s/3,a/3+5s/6\}.
$$
The function $F(s)=\Phi(a,s)-s$ is decreasing and 1-Lipschitz. Put $s_0=(1+a)/2$. The dual support gives $s\ge s_0-\kappa-b/2-o(1)$, so $F(s)-\kappa-b\le F(s_0)+o(1)$. As $s_0\ge a$, this last value is $(3a-1)_+/12$. For $a\le.33448$ the excess is at most $.00344/12<.000287$. [De Faveri, Theorem 1.1 and family conventions](https://arxiv.org/html/2610.04045v1#S1.SS1)

## The primes of valuation one

Write $(w)=E A^2 J^3$, where $E=E(w)$ and $J$ consists of all primes of odd valuation at least three. This is unique; $A$ is unrestricted and can meet $J$. Write $\xi,\alpha,\beta$ for the dyadic exponents of $E,A,J$. Then $\xi+2\alpha+3\beta\le a+o(1)$. Fix $E,J$ and all unit/ray choices. The prime-to-bad part of $A$ may be unrestricted in the cubic sieve. Its bad-prime part can be frozen with at most a fixed power of $\log U$ choices, retaining its twist on both grouped columns.

The individual residual label widths sum to $s$ and are at most $.0987$ up to $O(1/\log U)$. Place labels successively in the group with smaller current total. The totals differ by at most $.0987+o(1)$. Put $S=\max(s,s_0)$ and enlarge the two upper widths equally to sum to $S$. Denote the larger by $p$, the smaller by $q$. Then $p\ge S/2\ge a/2\ge\alpha-o(1)$, $q\ge(S-.0987)/2-o(1)$, and $S\le s+\kappa+b/2+o(1)$. This only enlarges numerical norm bounds used in the positive sieve.

Let $x,y$ denote the two groups in that order. On the positive Gauss orientation the normalized Gauss factor of $xy$ is its two individual factors times $J_y(x)^2$, up to a constant on primary ray classes. The frequency contributes $\overline{J_x(w)J_y(w)}$. After fixing $E,J$, the character seen by the $y$-sum is therefore
$$
 J_y(x)^2\overline{J_y(A)^2}=(xA^2/y)_3.
$$
All sides vanish at a common prime. The joint factor $\overline{J_x(A)^2}$ has modulus at most one and is independent of $y$. All remaining phases separate, including those at the fixed $E,J$. The negative Gauss orientation gives the complex conjugate cubic form, for which the same positive squared estimate follows by conjugating the coefficients. The residual rational squarefree conditions are retained by coloring as above.

To see precisely where unrestricted $A$ is allowed, dualize the squared norm in $A$ with a vector $v_A$ of squared norm one. After pairing it with the $x$ coefficient $c_x$, Cauchy over $(A,x)$ costs at most $\sum_{A,x}|v_A c_x|^2\ll U^\epsilon$, since the joint twist has modulus at most one. The remaining factor is bounded by the positive sum over $(x,A)$ of the squared $y$-polynomial with character $(xA^2/y)_3$. The $y$ coefficients have bounded squared norm and squarefree ideal support. Both outer ideals are unrestricted in the primary proposition. With $\alpha\le p+o(1)$, its three exponents are $p+\alpha$, $q+p/3+2\alpha/3$, and $(2p+2q+\alpha)/3$. [De Faveri, Proposition 8.1](https://arxiv.org/html/2610.04045v1#S8)

The counts of $E,J$ add $\xi+\beta$. Using the frequency budget gives the following upper bounds for the resulting three exponents:
$$
 p+(a+\xi)/2,\qquad q+p/3+(a+2\xi)/3,\qquad
 (2S+a+2\xi)/3.
$$
For the third use $\beta+\alpha/3\le(3\beta+2\alpha)/3$. They are at most $S+o(1)$ if $S-.0987\ge a+\xi$ and $S\ge a+2\xi$. For $a\le.7766$ and $\xi\le.0129$ the margins are at least $.0001$ and $.0859$, respectively. With $M\le S+o(1)\le s+\kappa+b/2+o(1)$ the complete normalization gives at most the harmonic price. Additional restrictions in $w$ restrict the dual vector; one can make the union disjoint before summing. The dense complementary frequencies remain open.



## All dual elements of norm at most $U^{5/23}$

Suppose the preceding large-rational-gcd deletion has been made, so $Ng\,Nk<U^{.3875}$, and use $\ell>.87794$. This gives $s>.4904$. One can remove every dual $w$ with $Nw\le U^{5/23}$ at total cost $O_\epsilon(U^{1+\epsilon})$, permitting arbitrary sixth-power parts.

First for a fixed $w$ the greedy two-group split and the cubic large sieve give a squared one-side bound $U^{2s/3+\epsilon}$, by Cauchy and $X+Z+(XZ)^{2/3}$ for the two group lengths. In fact $s>3(.0987)$ implies $\max(\log_U X,\log_U Z)\le(s+.0987)/2<2s/3$ up to annular slack. Thus frequency cardinality $U^{(1+a)/6}$ at dyadic log norm $a$ can be paid throughout: $s/3+b+\kappa\ge (1+a)/6-o(1)$. This immediately covers every $a\le1/5$.

For $1/5\le a\le5/23$ write $(w)=w_0v^6$, where $w_0$ is sixth-power-free. Put $\nu=\log_U Nv$. A box with fixed $Nv\asymp U^\nu$ has $O_\epsilon(U^{a-5\nu+\epsilon})$ frequencies, by direct ideal counting over $v$ and $w_0$. When $\nu\ge .0029$, this count is payable since $(5a-1)/30\le 1/345<.0029$. Otherwise fix $v$, its good coprimality masks and the fixed finite bad-prime/ray data of $w_0$. The ungrouped sextic sieve in the $w_0$ variable costs $U^{s+\epsilon}$ because $a-6\nu<s/2$. If $b+\kappa\ge\nu$ this already pays for the $v$ count.

It remains to consider $0<\nu<.0029$ and $b+\kappa<\nu$. We have
$$
 s\ge(1+a)/2-\nu-o(1)\ge .6-\nu-o(1)>6(.0987)+\nu.
$$
Among the nine residual widths there exists a subset of total size $p\in[\nu,s/7]+o(1)$. If all individual widths below $\nu$ total at least $\nu$, accumulate these widths to the first total at least $\nu$; that total is at most $2\nu<s/7$. Otherwise at least seven widths are at least $\nu$, since six largest widths and all the small widths give at most $6(.0987)+\nu$. Take the smallest of these seven or more. This decision uses only fixed allocations and frequency boxes, not the free columns.

Call the selected group $x$, and the other $y$. After dualization over $w_0$, the character on $y$ is $J_y(x)^2\overline{J_y(w_0)}$, up to fixed reciprocity phases; the joint $J_x(w_0)$ factor forces $(w_0,x)=1$. Consequently the good primitive conductor is exactly $\operatorname{rad}(x w_0)$, of norm $\ll U^{p+a-6\nu}$. Its good nonunit zeros agree with the kernel. The good local signed exponents are $2$ on primes of $x$ and $-v_{\mathfrak p}(w_0)$ on the other primes. Given the primitive character, each good prime offers at most two choices of assignment and the assigned valuation of $w_0$ is then determined modulo six in $\{1,\dots,5\}$. The resulting multiplicity is divisor bounded. Combining the arbitrary squared-norm-one dual vector at $w_0$ with the normalized $x$ vector therefore gives a vector on primitive characters of squared norm $O_\epsilon(U^\epsilon)$, by Cauchy on each fibre. The transpose of the ordinary primitive Hecke character conductor sieve on the $y$ vector gives cost
$$
 M\le \nu+\max\{s-p,2p+2a-12\nu\}+o(1).
$$
The first term is at most $s+o(1)$. For the other use $p\le s/7$ and $2a\le5(1+a)/14$, exactly $a\le5/23$. The latter quantity is at most $5s/7+b+\kappa+o(1)$ by the dual support. Thus $M\le s+b+\kappa+o(1)$, proving the asserted aggregate. The negative Gauss orientation conjugates this entire character. The same proof may be applied after any restriction on $(w_0,v)$, so this sector combines with the preceding two by taking disjoint subsets. [Primitive Hecke conductor sieve, Lemma 2.2](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/An-unconditional-first-moment-for-cubic-Gauss-sums-September-25-2026/build/sections/background-type1.tex#L175-L232)

[Exact exponent comparisons](short_inverse.py) · [Application to the physical denominator](rational-short-inverse.md)

Prepared with OpenAI Codex assistance.
