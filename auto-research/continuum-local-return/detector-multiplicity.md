# A count for a multiple zero or a tightly concentrated group of zeros

Assume the preprint’s 7/8 theorem and the marked estimates of tracker #143. Fix the external physical parameters and a full prime-amplitude class on the critical rectangle. Write $R$ for its original count exponent, $a=(1+\delta)/2$ and $U$ for the row scale. For every fixed $0<d\le 10^{-10}$, the number of rows satisfying either of the following conditions is $O_\epsilon(U^{R-10^{-7}+\epsilon})$, with the source’s external-height dependence.

- One of the detector’s nonprincipal primitive presentations has a zero $s_0$ of real part at least $a-d$ and multiplicity at least $(d/5)\log U$.
- In one such presentation at least $(d/4)\log U$ zeros, counted with multiplicity, lie in a disk of radius $10^{-100}d$ about a point $s_0$ with $\Re s_0\ge a-d$. The zeros may all be distinct.

In both statements $|\Im s_0|\le 3iT_1$ in the source’s buffered bin. The same detector height budget covers the fixed additive neighborhoods of $s_0$ below. Choose the bin mesh, preliminary losses and height exponent after $d$ is fixed. The original deleted Euler factors have no zeros at these positive real parts, so the zero orders carry over to $L_{\rm orig}$. The [forced zero cluster](zero-clusters.md) can occupy a larger disk. A separate argument treats [irregularly spaced zeros](detector-spacing.md).

## Filtering the original detector

Put $\lambda=10^{-6}$, $B=2t_0$ and $T=B-5\lambda$, where $t_0$ is fixed on this class and $2.25<B<2.26$. Use the original smooth truncated inverse $C(s)$ at length $U^T$. In ideal norm notation the source’s entire Gamma detector is

$$
 J(s)=\sum_{l,n}\mu(l)\psi(ln)V_{\le}(Nl/U^T)(N(ln))^{-s}
                   \exp(-N(ln)/U^{20}).
$$

Moving the Gamma line to $-1/4$ gives $J(s)=L_{\rm orig}(s)C(s)+E(s)$ with $|E(s)|\ll U^{-1}$ on $|s-s_0|\le 1/20$. The real part there exceeds $.65$. The exponent of the shifted integral before its small height loss is at most $-3+2.26(5/4-.65)<-1$. This bound includes the primitive conductor and the deleted Euler factors. [Original Gamma integral and dyadic separation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4548-L4679)

Let $j=\lfloor(d/5)\log U\rfloor-1$, positive for large $U$, and define

$$
 \mathcal D_j=\left(1+\frac{\partial_s}{B\log U}\right)^j.
$$

If $s_0$ is the multiple zero in the first claim, then $\mathcal D_j(L_{\rm orig}C)(s_0)=0$. Cauchy’s derivative estimates on the $1/20$ circle and $\binom{j}{i}i!\le j^i$ give $|\mathcal D_jE(s_0)|\ll U^{-1}$, since $20j/(B\log U)<1/2$. The disk condition will also give $\mathcal D_j J(s_0)=o(1)$, as shown below.

For each $U$, local absolute convergence of the exponentially smoothed series permits all $j$ differentiations term by term. The coefficient at norm $N(ln)$ acquires the factor

$$
 P(\xi)=(1-\xi/B)^j,\qquad \xi=\log N(ln)/\log U.
$$

The unit coefficient tends to one because $P(0)=1$. For $1<N(ln)\le U^T$ the Möbius convolution still vanishes at each ideal. Thus $\mathcal D_jJ(s_0)=o(1)$ forces a tail of magnitude $1+o(1)$ above $U^T$. The source’s smooth upper cutoff at $2U^{21}$ costs $o(1)$ since $|P(\xi)|\le (N(ln))^{j/(B\log U)}$ and the original exponential absorbs this extra fixed power.

Write $r,y$ for the outer inverse and ordinary dyadic lengths, and $\alpha=r+y$. On a contributing annulus $r\le T+O(1/\log U)$, $\alpha\ge T-O(1/\log U)$ and $\xi=\alpha+v/\log U$ with $v$ in a fixed compact interval. Include $P$ in the source’s single separating function of $v$. On an annulus with $|1-\xi/B|\le q$, for each fixed $i\le j$ one has

$$
 |\partial_v^i P(\alpha+v/\log U)|
 \le \big(j/(B\log U)\big)^i q^{j-i}.
$$

Higher derivatives vanish for $i>j$. The other cutoff factors have uniformly bounded fixed derivatives. Integration by parts on the fixed support therefore gives an integrable Fourier majorant using two fixed derivatives. Any further fixed order of decay follows from the same inequality. For all terminal dyads one may take $q=10$, and for $\alpha<4.3$ one may take $q=1$ for large $U$. The majorants are common to the row class. Choose the Fourier tail order after the positive height exponent. The original absolute polynomial bounds, the factor $10^j$ and the polynomial number of terms allow truncation to $|\nu|\le T_1/16$ with negligible error.

## Cost of the selected total length

For each retained frequency the original pointwise inverse and ordinary estimates give this upper bound on the absolute product after restoring its powers at $\Re s_0$:

$$
 U^{d\alpha-\delta(y-1/2)_+ +\epsilon_1}.
$$

The dyads $\alpha\ge 4.3$ have $y>2$ for large $U$. Since $\alpha\le22$, $\delta\ge.425$ and $10^j\le U^{(d/5)\log 10}$, their weighted contribution is negligible. Among the remaining $O((\log U)^2)$ dyads some weighted integral has magnitude $\gg(\log U)^{-2}$. Its Fourier mass is bounded, so its two original factors have a witness at some retained frequency with squared amplitude at least $U^{\delta\alpha-2d\alpha-\epsilon_1}$. The fixed squared deficit is at most $8.6\cdot10^{-10}$. The untwisted profiles in these factors are the source profiles. The multiplier changed only their common Fourier measure. [Original pointwise bounds and frequency allocation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4388-L4499)

Apply the [four-factor comparisons](four-factors.md) to this selected dyad at the same $T$. In dividing the product lower bound by pointwise upper bounds, each descendant inherits the original squared deficit once. A fourth moment charges it at most twice, or $1.72\cdot10^{-9}$. The comparisons reserve $5\cdot10^{-8}$ beyond the required $10^{-7}$ count improvement, so the fixed deficit and the freely smaller other losses fit. Outside the resulting $O_\epsilon(U^{R-10^{-7}+\epsilon})$ rows the outer ordinary length is below $m_0+\lambda$, where $m_0=t_0/3$. The support bounds on $r$ then put the outer inverse inside the annulus of the signed three-factor identity. Its descendants have lengths $x_1,x_2<b+\lambda$ and $y_1<m_0+\lambda$, with $b=2t_0/3$ and $x_1+x_2+y_1=r+O(1/\log U)$. The inner separation uses a further $T_1/16$ within the same height budget. Thus the original selected dyad obeys

$$
 B-5\lambda-O(1/\log U)\le\alpha\le
 2b+2m_0+4\lambda+O(1/\log U)=B+4\lambda+O(1/\log U).
$$

On its full annulus one can now take $q=3\cdot10^{-6}$. For all large $U$ the derivative estimates above bound the Fourier mass by $O(q^{j-O(1)})$. The same bound with more fixed derivatives handles its truncated tail. On this dyad $\alpha<2.261$, so the original pointwise estimate at every retained frequency bounds its integral by

$$
 U^{2.261d-(d/5)\log(1/q)+\epsilon_1+o(1)}.
$$

Here $(1/5)\log(1/q)>2.4$. Taking $\epsilon_1<d/25$ contradicts the dyadic lower bound. This proves the first count and reduces the second to the filtered estimate at its center.

## The filtered estimate in the tiny disk

Put $r_0=10^{-100}d$ and let $M\ge (d/4)\log U$ of the stated zeros lie within $r_0$ of $s_0$. The bin guard gives $\Re s_0<a+2e+r_0$ whenever this disk is occupied. On $|s-s_0|\le d$ the [buffered strip interpolation](zero-clusters.md) and Euler deletions bound $|L_{\rm orig}(s)|\le U^{1.02d+\epsilon_1}$ because $\Re s\ge a-2d$ and the reflected affine upper exponent has slope of absolute value at most $.51$. The smooth inverse pointwise bound, summed over dyads up to $U^T$, gives $|C(s)|\ll U^{2Td+\epsilon_1}$ there. Since $1.02+2T<5.6$, the product is bounded by $U^{5.6d}$ after reducing the preliminary losses.

Divide $L_{\rm orig}C$ by a radius-$d$ Blaschke factor for each of the $M$ zeros, repeating it according to multiplicity. Each factor has modulus one on the outer circle and modulus at most $2r_0d/(d^2-r_0^2)\le 3r_0/d$ on $|s-s_0|=r_0$. The maximum principle for the analytic quotient bounds the original product there by $U^{5.6d}(3r_0/d)^M$. Cauchy on this smaller circle bounds its filtered value with an extra factor at most

$$
 (j+1)\max\{1,j/(Br_0\log U)\}^j.
$$

Writing $\omega=r_0/d$, the final exponent is at most $d[5.6+(\log 3)/4+(\log\omega)/20]+o(1)<-3d+o(1)$. For the analytic error $E$ retain the original $1/20$ Cauchy circle. This gives $\mathcal D_jJ(s_0)=o(1)$ for these disks and completes the second count. [Exact numerical guards](zero_clusters.py)

Prepared with OpenAI Codex assistance.
