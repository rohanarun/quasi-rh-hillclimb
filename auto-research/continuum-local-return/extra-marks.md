# A fourth-moment test using the extra prime factors

Assume the preprint’s 7/8 theorem and the ordinary marked source and physical inputs of tracker #143. In a critical physical amplitude class, the contribution outside the length interval below already saves. Inside it, one signed estimate for the extra prime factors would suffice. It asks for an upper bound of order $U^{1+10^{-7}+\epsilon}$. The pairs still to be estimated have
$$
 U^{2\cdot10^{-7}}<N d_6\le N d\le U^{2.01\cdot10^{-6}}.                 \tag{1}
$$
Here $d$ is the reduced conductor of the **extra prime factors alone**, and $d_6$ is its product of local order-six primes. The ordinary polynomial and the original, admissible prime factors stay inside the row weight. This gives a sufficient estimate on the physical mass. The raw class count in the Lean endpoint remains a separate sufficient hypothesis. [Dyadic localization and the physical source](marked-window.md) · [Conditional all-moduli endpoint](lean/TargetReturn.lean).

## The admissible part of the product

Use the previous note’s notation $x_0=1-y/D$, $q=\delta p$, $\lambda=2+10s$, $z_0=(1-s-2x_0)/\lambda$. Fix the original row class $\mathcal C$, mask, external tuple and dyadic ordinary polynomial $P_u=P_u(N,v)$. Its norm-twist height $v$ is common to all rows. Set
$$
 n=\log_U N,\quad x_0-10^{-6}<n\le x_0+.80\cdot10^{-6},\qquad
 b=\frac{1-s-2n}{\lambda},\quad a=10^{-6},\quad c=10^{-7}.
$$
In this interval $b>0$, and $b+a$ is below both $.076$ and the total prime width. Fix a mesh giving normalized slot widths at most $\mu<10^{-9}$, refined further for any prescribed loss. Take distinct positive original slots in decreasing order of their lower gains and stop just before exceeding width $b+a$. The gain of this list is at least $q(b+a)-\epsilon$ by the whole-slot comparison. Break it at the largest prefix of width at most $b$. Let $B_u$ be the product over that prefix and $D_u$ the remaining product. If the remainder is nonempty, the prefix has width greater than $b-\mu$, so the extra factors use width at most $a+\mu$. Both sets of labels are common to the entire class. The conditions $2n+\lambda b=1-s$ and $b<3/20-1000s/1143$ allow the known positive estimate
$$
 M_0=\sum_{u\in\mathcal C}|P_u|^4|B_u|^2
 \ll_\epsilon U^{1+\epsilon}(1+H+|v|)^J,\qquad
 |B_uD_u|\ge U^{q(b+a)-\epsilon}\quad(u\in\mathcal C).
$$
Here $H$ bounds the external tuple heights and all source degrees are fixed before the final choice of height power. The class may retain the physical large-radical restriction by positivity. [Original prime coefficients](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L14997-L15018).

## Expand only the extra factors

Write $D_u=\sum_A d_A\overline{\chi_A(u)}$ with the physical orientation and zero extension, absorbing the fixed ray and weights into $d_A$. On a fixed annular prime support of scale $P_j$, the coefficient has modulus $O(P_j^{-1/2})=O((N\mathfrak p)^{-1/2})$, uniformly in imaginary height. For a fixed finite list of slots, the number of ordered factorizations of an ideal $A$ costs $O_\epsilon(U^\epsilon)$. Consequently
$$
 |d_A|\ll_\epsilon U^\epsilon(NA)^{-1/2},\qquad
 NA\ll U^{a+\mu}.
$$
The constants may depend on the fixed list. Define $T(A,C)=\sum_{u\in\mathcal C}|P_u|^4|B_u|^2\overline{\chi_A(u)}\chi_C(u)$. The estimate still needed is
$$
 \sum_{A,C\text{ satisfying (1)}}d_A\overline{d_C}\,T(A,C)
 \ \ll_\epsilon U^{1+c+\epsilon}(1+H+|v|)^{J'}                     \tag{2}
$$
as a **one-sided** upper bound, uniformly for the stated data, with a fixed height degree. The left side is real by swapping $A,C$. At a good prime $\mathfrak p$, the conductor $d$ includes it when $v_{\mathfrak p}(A)-v_{\mathfrak p}(C)$ is nonzero modulo six, and $d_6$ includes it when the difference is $1$ or $5$. Thus $Nd\le NA\,NC\ll U^{2(a+\mu)}$, which gives the upper endpoint of (1) for large $U$. In (2) the row measure must match the positive fourth moment being expanded. One can instead enlarge that positive moment to a fixed nonnegative majorant for which the base estimate holds, and use its row measure in *every* pair.

For the complementary pairs $Nd_6\le U^{2c}$, write $A=g i^6 A_0$, $C=g j^6 C_0$ with $g=(A,C)$ and $A_0,C_0$ coprime sixth-power-free ideals. Their coefficient product costs at most
$$
 \frac{O_\epsilon(U^\epsilon)}{Ng\,(Ni\,Nj)^3\sqrt{NA_0\,NC_0}}.
$$
The sums over $g,i,j$ cost $O_\epsilon(U^\epsilon)$ by ideal counting. For $d_0=d/d_6$, the last square-root factor in the denominator is at least $(Nd_6)^{1/2}Nd_0$, since each prime of $d_0$ occurs at least twice. A given $d_6d_0$ permits at most $10^{\omega(d)}\ll_\epsilon U^\epsilon$ assignments of sides and residual valuations. Summing $(Nd_6)^{-1/2}$ up to $U^{2c}$ costs $O(U^c)$ and summing $(Nd_0)^{-1}$ over its polynomial range costs $O_\epsilon(U^\epsilon)$. The absolute coefficient mass of the complementary pairs is therefore $O_\epsilon(U^{c+\epsilon})$. The bound $|T(A,C)|\le M_0$ keeps all original zero masks, including those coming from $gij$. This proves the required contribution from these pairs, also when physical prime supports overlap. Adding (2) would bound the full positive moment $M_+=\sum_{u\in\mathcal C}|P_u|^4|B_uD_u|^2$ by the same price.

An equivalent way to state the open input uses one off-diagonal prime pair at a time. Order the extra slots $j=1,\ldots,m$. Write $Q_j(u)=\sum_p e_{j,p}\overline{\chi_p(u)}$ and $H_j(u)=\sum_p |e_{j,p}|^2 1_{p\nmid u}$. The bound $H_j\ll1$ follows from the annular coefficient bound and ideal counting. For the same restricted measure the exact identity
$$
 |D_u|^2-\prod_j H_j(u)=
 \sum_{j=1}^m\left(\prod_{i<j}|Q_i(u)|^2\right)
 \left(\sum_{p\ne p'}e_{j,p}\overline{e_{j,p'}}\,\overline{\chi_p(u)}\chi_{p'}(u)\right)
 \prod_{i>j} H_i(u)
$$
leaves a diagonal contribution $O(M_0)$ after summing rows. Thus a one-sided bound of the same price on the aggregate right side against $|P_u|^4|B_u|^2$ is also sufficient, and follows from the full positive moment bound at that price. Each displayed pair has two distinct prime ideals and conductor $pp'$ of norm $\ll U^{2\mu}$. Here the positive factors preceding $j$ include earlier extra marks and can exceed the admitted base width. The cutoff on $d_6$ in (1) applies only to the expansion of the entire extra product. The two-prime formulation keeps its own weights and all pairs.

## The gain after physical damping

Keep the physical coefficient index of norm $K$ and separate the bins of $\max(1,L_u K)$ before bounding the reflected polynomial. Let $v_d\ge0$ denote the lower exponent of a bin. Its coefficient mass has the factor $U^{-\delta v_d/2}$ on each row. The reflected scale satisfies $X\ll U^{x_0+v_d+\xi_0}$ for bin mesh $\xi_0$, since $Q_u K\le C_uK\ll U\max(1,L_u K)$. For any prescribed $\xi>\xi_0$, dyads with $n>x_0+v_d+\xi$ contribute $O(U^{-A})$ for arbitrary fixed $A$ by the Schwartz bound before Fourier inversion. All fixed divisors, Euler deletions and the summable weights of the dual excluded-prime parts are as in the direct reflection. On the remaining dyads Fourier inversion leaves a row scalar of modulus one at each height. Summing the absolute coefficient masses on the bin now gives the stated damping. [Physical coefficient mass](central-values.md#which-coefficient-scales-still-contribute) · [Uniform reflected tail and Fourier weight](eighth-short.md#exact-rowwise-reflection).

Hölder on $\#\mathcal C\ll U^{R+\epsilon}$, the lower bound for $|B_uD_u|$ and the proposed price for $M_+$ give the physical exponent, after the common packet factors are suppressed,
$$
 E-\frac{\delta v_d}{2}-\frac{q(b-z_0)}2-\frac{qa}{2}+\frac c4+O(\epsilon),
 \qquad E=\frac{3R+1}{4}-\frac{qz_0}{2}.
$$
Since $b-z_0=-2(n-x_0)/\lambda$, $n-x_0\le v_d+\xi$ and $\lambda\ge2$, the first two subtractions together cost at worst $q\xi/2$ and otherwise retain at least $(\delta-q)v_d/2$ of gain. At $q_{\min}=.425\cdot .49995$ the remaining margin over the required saving $3\eta/4$ is exactly
$$
 q_{\min}a/2-c/4-3\eta/4=6.239375\cdot10^{-9}>0,\qquad \eta=10^{-7}.
$$
Choose the tail slack, bin mesh, source loss and amplitude-mesh loss inside this margin. The finite source degrees permit the external height powers to be chosen afterwards, and the fixed rapid Fourier weight integrates every polynomial in $v$. A logarithmic number of dyads and the fixed coefficient bins are absorbed in the same slack. Thus (2) would give the required physical saving throughout the remaining interval. The signed upper bound (2) is open. [Exact rational checks](marked_window.py).

Prepared with OpenAI Codex assistance.
