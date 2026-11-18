# A bound for an individual pair in the eighteenth moment

Assume the preprint's $7/8$ theorem and the physical and marked inputs of tracker #143 for the application to the short denominator inverse. For its all-element eighteenth moment, take a fixed nonnegative smooth radial weight on a norm annulus of scale $U$. Fix a common inverse dyad of scale $U^z$, $z<.0987$. The ninth-power coefficients satisfy $|\lambda_C|\ll_\epsilon U^\epsilon (NC)^{-1/2}$ and $\sum_C|\lambda_C|^2\ll_\epsilon U^\epsilon$. Each occupied column has a representation as nine ideals of norm $\ll U^z$. The original masks exclude the fixed bad primes from those ideals. Norm twists, the common target character and the log-norm profile used in height differentiation belong to the coefficients. The following pair bound is unconditional under these algebraic and support hypotheses.

For any ordered pair of occupied columns $C,C'$ for which the row symbol $\chi_C\overline{\chi_{C'}}$ has nonunit primitive conductor $d$, its all-element correlation is
$$
 |K(C,C')|\ll_\epsilon U^{1/2+3z+\epsilon}.
$$
This is a bound for the complete kernel before restricting its Fourier frequencies. The same estimate holds for the conjugate orientation and after projecting the columns onto arbitrary subsets. In particular a graph on such pairs with at most $U^{.2041}$ partners at either end costs $O_\epsilon(U^{1.0002+\epsilon})$, within the proposed price $1.00029$. With degree $U^{.2038}$ the exponent is at most $.9999$. Indeed $\sum_{(C,C')}|\lambda_C\lambda_{C'}|\le \max\deg\sum_C|\lambda_C|^2$. As an example, the pairs with $|NC-NC'|\le U^{.2041}$ have this degree up to $U^\epsilon$ by the quadratic-field ideal divisor bound. The principal pairs are covered separately by their known total mass. Dense graphs remain open.

### Splitting the conductor

The ideal $d$ is the product of those good primes where the two column valuations differ modulo six. Put $E=\operatorname{rad}(CC')/d$. Expand $1_{(u,E)=1}$ by Möbius inversion at $l\mid E$. Since $l$ is coprime to $d$, taking a generator of $l$ contributes a scalar of modulus one. Each resulting primitive character sum over the Eisenstein lattice has the form
$$
 S(V)=\sum_{u\in\mathcal O} \chi(u) W(Nu/V),\qquad V=U/Nl\le U.
$$
The number of terms is $O_\epsilon(U^\epsilon)$. If $V$ is bounded the assertion follows from the annular support. Conjugating the row characters has no effect on the argument.

Fix any one representation of each of $C,C'$ and list the eighteen ideal factors. Assign every prime of $d$ to one factor containing it. Let $d_1$ contain the primes assigned to the first six factors, and $d_2$ the rest. Then $d=d_1d_2$, $(d_1,d_2)=1$, $D_1=Nd_1\ll U^{6z}$ and $D_2=Nd_2\ll U^{12z}$. Units and archimedean constants are fixed. Write $D=Nd$.

If $D\ll U^{1+6z}$, primitive Gauss summation on the lattice gives $|S(V)|\ll\sqrt D$ uniformly in $V$. Indeed the zero frequency vanishes and the normalized Gauss sum at each other frequency has size at most one. The Poisson expression is $O((V/\sqrt D)\sum_{0\ne k}(1+|k|\sqrt{V/D})^{-A})$ for arbitrarily large fixed $A$, which is $O(\sqrt D)$ in either scale range. In the complementary case $D_2\gg U$, in particular $V\ll D_2$. If $V\ll D_1$, the elementary $O(1+V)$ bound suffices, since $6z<1/2+3z$.

### Differencing the character

Now $V\gg D_1$. Write $\chi=\chi_1\chi_2$ at the coprime conductors and choose a generator $q_1$ of $d_1$. Average the identity for $S(V)$ after translating by $q_1h$, for $h$ in a lattice disc containing $J\asymp V/D_1$ elements with $|q_1h|\ll\sqrt V$. Bounded $V/D_1$ is covered by the previous elementary case. The $\chi_1$ factor is invariant under every such translation. Apply Cauchy–Schwarz to the outer lattice sum, with $O(V)$ lattice points over the enlarged support, and then $|\chi_1|\le1$. In the squared bound the equal-shift terms contribute $O(V^2/J)$.

For unequal shifts with difference $j$, the inner sum has character factor $\chi_2(u+q_1j)\overline{\chi_2(u)}$ after a translation. Its smooth weight has uniformly bounded scaled derivatives, since each initial translate has length $O(\sqrt V)$. At a prime $p\mid d_2$, $p\nmid j$, the complete additive Fourier transform of this factor modulo $p$ is $O(\sqrt{Np})$. For a nontrivial additive frequency this is the mixed Weil bound with rational function $(X+q_1 j)/X$ having a simple zero and a simple pole and with a linear additive phase. For the trivial additive frequency the transform is $-1$, by the change of variable $x\mapsto1+q_1j/x$. For $p\mid j$ use the trivial bound $Np$. Chinese remaindering therefore gives the uniform complete bound $O_\epsilon(U^\epsilon\sqrt{D_2N(j,d_2)})$. [Cochrane and Pinner, equation (1.3)](https://www.math.ksu.edu/~cochrane/research/stepmix.pdf)

Completing the inner sum modulo $d_2$ costs a further factor $O(1+V/D_2)=O(1)$ by rapid decay of its lattice transform. Each difference occurs at most $J$ times, and $0<Nj\ll J$. Thus
$$
 \sum_{0<Nj\ll J} \sqrt{N(j,d_2)}
 \le \sum_{l\mid d_2}\sqrt{Nl}\,\#\{0<Nj\ll J:l\mid j\}
 \ll J\sum_{l\mid d_2}(Nl)^{-1/2}\ll_\epsilon JU^\epsilon.
$$
For the middle bound, nonzero multiples require $Nl\ll J$, and dividing by a generator reduces to the ordinary two-dimensional lattice count. Returning to the shift average gives
$$
 |S(V)|^2\ll_\epsilon U^\epsilon(V^2/J+V\sqrt{D_2}),\qquad
 |S(V)|\ll_\epsilon U^\epsilon(\sqrt{VD_1}+\sqrt V D_2^{1/4})
 \ll_\epsilon U^{1/2+3z+\epsilon}.
$$
This proves the claim for each mask divisor and hence for the original complete pair kernel. The sparse-graph exponents use $1/2+3(.0987)=.7961$.

### Pairs sharing a large rational norm divisor

Put $L=9z$. In this paragraph $G,g$ are lower exponent bounds for the rational integer $\gcd(NC,NC')$ and the ideal norm $N(C,C')$, respectively. Each column has $O_\epsilon(U^{L-G+\epsilon})$ possible partners when $0\le G\le L$. Indeed their integer norms are multiples of a divisor of $NC$ of size at least $U^G$. There are $O_\epsilon(U^\epsilon)$ such divisors, and a positive rational integer $n\ll U^L$ has $O_\epsilon(U^\epsilon)$ representations as the norm of an ideal. The same bound holds in the other direction. This argument includes conjugate overlaps at split rational primes.

Removing the common ideal shows $D\ll U^{2L-2g}$. In addition to the preceding kernel bound and primitive completion at cost $\sqrt D$, there is a bound $U^{1/2+\epsilon}(DU^z)^{1/6}$. To see it, write $d_*=\log_U D$. All conductor prime norms are $\ll U^z$. Choose a divisor $d_1$ by multiplying successive primes until its norm exponent first exceeds $(d_*-2z)/3$. If the threshold is negative take $d_1=1$. This puts $\log_U D_1$ between $(d_*-2z)/3$ and $(d_*+z)/3+O(1/\log U)$. If $D_2\gg U$, the preceding A-process gives $\sqrt{VD_1}+\sqrt V D_2^{1/4}\ll U^{1/2}(DU^z)^{1/6}$. When the shifts have bounded size use the trivial $O(1+V)\ll1+\sqrt{VD_1}$ as above. Otherwise $D_2\ll U$ implies $d_*\le3/2+z/2+O(1/\log U)$, and $\sqrt D\ll U^{1/2}(DU^z)^{1/6}$.

Consequently, after omitting the principal pairs already treated in the eighteenth moment, any subset satisfying the two lower gcd cutoffs has total absolute contribution
$$
 \ll_\epsilon U^{L-G+\min\{L-g,\ 1/2+3z,\ 1/2+(2L-2g+z)/6\}+\epsilon}.
$$
For example, at $z<.0987$ each of $G\ge.6842$, $G+g\ge.7764$, and $G+g/3\ge.70057$ suffices for the target price $1.00029$. With $G=.652$ and $g=.15$ the third estimate is at most $.99885$. This includes norm divisibility classes with substantially more than $U^{.2041}$ available partners.

### The complete signed sector for rational norm divisibility

There is a stronger estimate for the entire signed sector with rational integer $\gcd(NC,NC')\ge U^{.3884}$. The proof uses the source's projected-vector estimate, already established for this eighteenth moment. In detail, if an arbitrary projection of the original coefficients is fixed in advance, its column subvector $F_h$ on ideals divisible by $h$ has all-element row $L^2$ norm $\ll_\epsilon U^{1/2+\epsilon}/\sqrt{Nh}$ for $Nh\ge U^{.3884}$. After dividing by $h$ the coefficient vector is supported on ideals of norm $\ll U^{.8883-.3884}<U^{1/2}$. The sixth-power-free sieve and the elementary decomposition of sixth powers in the rows and columns give the projected-vector bound on the enlarged all-element measure. [de Faveri's sixth-power-free sieve](https://arxiv.org/html/2610.04045v1#S1.SS1)

Let $P_k$ denote the subvector with columns $k\mid NC$, for $k$ an ordinary integer. For a split rational prime $p=\mathfrak p\overline{\mathfrak p}$ write $i_1,i_2$ for the two valuations of $C$. At $p^e\Vert k$ the exact identity is
$$
 1_{i_1+i_2\ge e}
 =\sum_{a+b=e}1_{i_1\ge a,\,i_2\ge b}
 -\sum_{\substack{a+b=e+1\\a,b\ge1}}1_{i_1\ge a,\,i_2\ge b}.
$$
It follows by taking the mixed backward difference of the threshold and summing over the valuation rectangle. At an inert prime the single condition is $v_{(p)}(C)\ge\lceil e/2\rceil$. At a ramified prime use its sole prime ideal to exponent $e$; columns here exclude the fixed bad primes anyway. Multiplying gives a signed sum of $F_h$ with $Nh\ge k$, at most $\prod_{p^e\Vert k}(2e+1)\le\tau(k)^2$ terms counting multiplicities. It follows that for $k\ge U^{.3884}$
$$
 \|P_k\|_2\ll_\epsilon U^{1/2+\epsilon}\,\tau(k)^2/\sqrt{k}.
$$

For $K>0$ put $a_K=\mu_{\mathbb Z}*1_{[K,\infty)}$ on positive integers. This vanishes below $K$, has magnitude at most $\tau(k)$ at $k$, and satisfies $1_{n\ge K}=\sum_{k\mid n}a_K(k)$. Two applications now strengthen the initial reductions on columns and pairs.

* Write $J(n)=\prod_{p}p^{\lfloor v_p(n)/2\rfloor}$ for the square root of the largest square divisor of $n$. The column subvector satisfying $J(NC)\ge U^{.1942}$ is $\sum_{k\ge U^{.1942}}a_{U^{.1942}}(k)P_{k^2}$. Its $L^2$ norm is $\ll_\epsilon U^{1/2+\epsilon}$ by the triangle inequality and harmonic summation over $k\ll U^{9z/2}$. This includes large square divisors of $C$ as an ideal and large rational content of a generator of $C$. Apply the $L^2$ triangle inequality once to keep only the residual polynomial.
* On the square of that residual polynomial the signed pairs with $\gcd_{\mathbb Z}(NC,NC')\ge U^{.3884}$ contribute $\sum_{k\ge U^{.3884}}a_{U^{.3884}}(k)\|P_k\|_2^2$, using the residual coefficient projection throughout. Its absolute value is $O_\epsilon(U^{1+\epsilon})$ by harmonic summation over $k\ll U^{9z}$. Whenever $N(C,C')\ge U^{.3884}$ this rational gcd condition holds, so the original ideal-gcd reduction can be replaced by the rational one.

These two estimates concern full threshold sectors. The preceding sparse bound controls arbitrary subsets of nonprincipal pairs.

[Exact comparisons](short_inverse.py) · [Short inverse and application](short-physical-inverse.md)

Prepared with OpenAI Codex assistance.
