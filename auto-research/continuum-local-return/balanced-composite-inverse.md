# A genuine inverse with an arbitrary coefficient on two short ideal labels

Assume the preprint's 7/8 theorem and its canonical marked estimate. Write $J_a(u)=(u/a)_6$ for the good zero-extended symbol on the Eisenstein ideals. Let $A=U^r, D_i=U^{w_i}$ with nonnegative bounded exponents, let $w=w_1+w_2, B=\max(w_1,w_2)$, and let $W$ be a fixed smooth annular profile. For any row-independent joint coefficient supported on $Nd_i\asymp D_i$, with $|b(d_1,d_2)|\ll_\epsilon U^\epsilon$, one has
$$
 \sum_{0<Nu\ll U}
 \left|A^{-1/2}\sum_n \mu(n)\nu(n)J_n(u)W(Nn/A)
 (D_1D_2)^{-1/2}\sum_{d_1,d_2} b(d_1,d_2)J_{d_1d_2}(u)\right|^2
 \ll_\epsilon U^{1+\epsilon}
 \quad\text{if }r+w+5B<1.                                      \tag{1}
$$
Here $\nu$ is a fixed admissible finite character. A polynomial-norm Euler omission on the inverse is allowed. The two short labels can carry arbitrary arithmetic joint restrictions in their coefficient. In particular a single coefficient supported on ideals having a factorization into the specified short windows is included, by selecting one such factorization per ideal. For two equal widths this condition is $r+7w/2<1$. All original $U^\epsilon$ losses may be chosen separately. In this statement the row shell and the number of short labels are fixed, and polynomial costs in admissible norm heights have their ordinary source meaning.

Use the [canonical energy and its two premises](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9296-L9347) with no inner prime slots. Its inverse coefficient is $a_0=\bar\alpha\gamma_2$. With child log lengths $x=\log_U X$ for the inverse label, $v_f=\log_U F_f$ for the squarefree label and $m_c$ for the row, it gives the **unnormalized label sum** over $f,k$ of the squares of the centrally normalized polynomials as $\ll U^\epsilon X F_f^2$. Its hypotheses are $F-m_c-Q>c_*$ and $4F-3m_c>c_*$, where $F=x+v_f$ and $Q$ bounds the log norm of a fixed common puncture. Both $f,k$ may acquire prime divisors in common. The polynomial inside the square carries $J_a(k)J_a(f)^4$ on squarefree $a$.

## Input projections

Remove an independent large omission on the genuine inverse *before* transforming. At each omitted prime the reciprocal factor is $1/(1-\nu(p)J_p(u)T_p)$. The coefficientwise convolution shifts the inverse to $A/Nt$, with multiplier bounded by $(Nt)^{-1/2}$ in its normalized norm. The sum of these multipliers is bounded by $\prod_{p\mid P}(1-(Np)^{-1/2})^{-1}\ll_\epsilon U^\epsilon$. The row multiplier has modulus at most one after its scalar is taken out. Thus Minkowski costs a subpower and produces no large puncture in the canonical child. Use the same notation $r$ for the possibly shortened exponent. Bounded annular constants are harmless even for unit-scale labels.

Extract the full powerful part of each short label separately. Its normalized multiplier per frozen ideal is $(Nd_0)^{-1/2}$ and these have a subpower sum by powerful-ideal counting. Each remaining short label has its own puncture at its extracted powerful part, which is a condition on that label's arbitrary coefficient. This introduces no puncture on the inverse. The exterior row factors have modulus at most one. The three residual labels, including the Möbius label, are individually squarefree.

For each subset $I\subset\{0,1,2\}$ with $|I|\ge2$, freeze the product $l_I$ of primes belonging to exactly that subset of the three residual labels, with label zero the inverse. Put $l=\prod l_I, L=\log_U Nl$. The $l_I$ are pairwise coprime. Their scalar in the moment norm is $\prod (Nl_I)^{-|I|/2}$, with subpower sum over all these ideals. Outside a bounded scalar from the Möbius label, the exterior row factors again have modulus at most one. The three free labels now have squarefree joint product and all avoid $l$. This includes $l_{\{1,2\}}$ even when the inverse does not contain these shared primes. If $q$ denotes the shortened total log-length at this stage,
$$
 q\le r+w-2L.
$$
Every surviving short width is at most its original width. No coprimality with either extracted powerful part is newly imposed on the inverse.

## First Poisson and one-sided Cauchy

Apply the first primitive Poisson transformation from [the single-composite proof](inverse-composite-mark.md) to the resulting joint columns $C,C'$. The identical columns cost $U^{1+\epsilon}$ because their smooth-normalized coefficients are divisor bounded, including all factorizations into three labels. Write $g=(C,C')$, select $j\mid g$ from the row mask and $m\mid(C/g,C'/g)$ from the subsequent signed coprimality expansion of the formally extended kernel. The squarefree support requires $(m,g)=1$. Assign the prime factors of $g,m$ to the three original labels on each side independently, with divisor-boundedly many assignments. The artificial unit pair has the same bounded restoring term as in the single-composite proof. Set $G=Ng, J=Nj, M=Nm, R=U^q/G$, up to bounded dyadic factors. The common exterior price after extraction is $U/(J R G M)$; the retained frequency $h\ne0$ has $Nh\ll (J R^2/U)U^\epsilon$.

On one side the three free ideals are $a,d_1,d_2$, of norm scales $X,D'_1,D'_2$, with $R\asymp M X D'_1D'_2$. Relabel the short positions on that side so their dyadic centers satisfy $D'_1\ge D'_2$. Dyadic sorting is selected before the inverse polynomial and can be different on the two sides of the paired expression. The Gauss cross phase in $a$ is $J_a(md_1d_2)^2$. Together with the mask and frequency the exact $a$-dependent part before conjugation is
$$
 \mu(a)\nu'(a)\gamma_1(a)\ J_a(jm^2)\overline{J_a(h(d_1d_2)^4)}.
$$
All other factors involving $d_1,d_2,h$ may be included in a single joint coefficient of absolute value $\ll U^\epsilon$. In particular the short-short Gauss cross phase requires no factorization. For fixed $h,g,j,m$ and assignments, Cauchy over the *pair* of short labels costs $\sum_{d_1,d_2}|b'(d_1,d_2;h)|^2/(D'_1D'_2)\ll U^\epsilon$. Keep their original squarefree and mutual coprimality restrictions on this remaining positive pair sum. All coprimalities with the inverse $a$ are retained below. Cauchy over $h$ and the arithmetic-geometric mean reduce the two original sides to these separate one-sided energies with the same exterior price. If the joint short polynomial and the inverse have opposite orientations, conjugate the entire joint short polynomial, including its coefficient. The two short labels in the joint polynomial use one common orientation.

Now conjugate the whole one-sided inverse polynomial. On the squarefree support $\overline{\mu(a)\gamma_1(a)}=a_0(a)\overline{G_{\rm ray}(a)}$ by the [signal identity in the preprint](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L10775-L10789). Expand any fixed ray-class function into its finitely many multiplicative characters, at bounded cost by triangle and Cauchy. Set
$$
 t=g/j,\qquad k=h j d_1^4,\qquad f=j m d_2 .
$$
These ideal formulas use fixed generators up to finitely many ray/unit choices. The two factors $J_a(k)J_a(f)^4$ give exactly $J_a(h)J_a(d_1d_2)^4 J_a(j)^5J_a(m)^4$. On units these are the conjugated phases. At a prime dividing $h,d_1,d_2,j,m$ both sides have the same zero. Since $g,m,d_2$ are pairwise coprime on this positive side and $j\mid g$, $f$ is squarefree. The remaining inverse puncture is precisely supplied by $\operatorname{rad}(tl)$ along with the fixed bad set, since the coprimalities with $j,m,d_1,d_2$ already occur in the child symbols. This description remains valid when the child row and label windows are enlarged. No $f,k$-dependent omission is present.

## Reconstruction, costs, and the second invariant

Fix dyadic ranges for the allocated norms, common Fourier modes and $t$. In each positive side sum, first reindex the joint outer variables by $t,f,k$, **before** fixing $g,j,m$ for any application of the canonical estimate. Given $t,f,k$, one has $j,m,d_2\mid f$, $d_1^4\mid(k)$, $g=tj$, and $h=k/(jd_1^4)$. All frozen cross-column assignments, including those on the other side in the Cauchy bound, are reconstructed up to a product of divisor powers of $t,f,k$. This is $O_\epsilon(U^\epsilon)$ uniformly on the bounded ranges. Consequently one may use the constant canonical label weight $1$. Replacing the nonnegative fibre cardinalities by that $U^\epsilon$ bound introduces no $k$-dependent weight in its hypothesis.

The inverse norm test before reindexing is the same fixed shifted $W(Na/X')$ with $X'\asymp X$ on each chosen dyad. A varying bounded ratio in this shift is removed as follows. Insert one compact smooth cutoff in $\log(Na/X)$ equal to one on every such support. Fourier-expand $W(e^z)$ on the real line, at $z=\log(Na/X)+\log(X/X')$. Its common Schwartz density is independent of $t,f,k$, and the second factor contributes a unit phase depending on $X'$. The normalized factor $X'^{-1/2}/X^{-1/2}$ is bounded. Weighted Cauchy on the Fourier integral gives a positive sum over fixed Fourier tests common to every $t,f,k$. The Fourier separation of the first Poisson norm kernel uses only the common dyadic windows and the uniform Schwartz bounds of the single-composite proof. Its fixed polynomial height costs remain integrable; all original height parameters have their stipulated polynomial cost. These devices allow the enlargement to a full child ball under the same inverse coefficients and profile. Each fixed-precision or dyadic decomposition of the bounded norm range costs $U^\epsilon$.

Write $T=\log_U Nt, u_1=\log_U D'_1$. The formal row bound and canonical length are
$$
 m_c=2q-2T-1+4u_1,\qquad F=\log_U X+\log_U(JMD'_2)=q-T-u_1.
$$
Use freely small enlargement for the retained frequency tail and the bounded annular constants. When the upper frequency exponent is genuinely negative there is no retained term beyond the negligible tail; if this clipping is within the preliminary loss of zero it changes the invariants by at most that loss. The fixed puncture satisfies $Q\le T+L$. Consequently
$$
 F-m_c-Q\ge1-q-5u_1-L\ge1-r-w-5B,
 \qquad
 4F-3m_c=3-2q-16u_1+2T\ge3-2(r+w)-16B.
$$
The second bound is positive whenever $r+w+5B<1$: $r+w\ge B$ implies $6B<1$ and $3-2(r+w)-16B=2(1-r-w-5B)+1-6B>0$. In the balanced case the two displayed worst-face tests read $r+7w/2<1, 2r+10w<3$. Choose the preliminary loss within both fixed margins. All uses of the canonical estimate now have an admissible fixed puncture at the chosen $t,l$.

The unnormalized canonical price per fixed $t$ and norms is $X(JMD'_2)^2 U^\epsilon$. Multiplying by the exterior prefactor and using $R\asymp M X D'_1D'_2$ gives
$$
 \frac{U}{JRGM} X(JMD'_2)^2
 \asymp \frac{U}{Nt}\frac{D'_2}{D'_1}\ll\frac{U}{Nt}.
$$
There is only one sum over $t$. It is harmonic on polynomial scales, even with divisor weights, so the entire off-diagonal costs $U^{1+\epsilon}$. This proves (1).

## Scope on the physical rows

For an elementary symmetric sum of $h$ distinct primes in $[P,2P]$, split each squarefree product deterministically into the first $\lfloor h/2\rfloor$ primes and the rest in a fixed ordering. The joint coefficient imposes this choice, so it reproduces the polynomial without a combinatorial loss. Partition both products into fixed-ratio norm annuli. Each partial width is at most $\lceil h/2\rceil\log_U(2P)$, which is $w/2+O(\log_U(2P))+o(1)$ for the forced mark of prescribed width $w$. Dyadic pigeonholing of its large value costs $U^{o(1)}$. The physical bounded real and variable height weights admit the original smooth derivative estimates in the normalized logarithm on each annulus. Thus the subpower-prime branch rigorously permits widths approaching $2(1-r)/7$ from below on a true inverse of width $r<1$.

At the remaining physical inverse anchor $x<2(1.12903)/3+10^{-5}$, even a fully saturated mark at that limiting width gives combined slope-length
$$
 x+2(1-x)/7 < 0.82336.
$$
The contact count comparison requires a slope-length above $0.876$. Indeed its coefficient is $p(1+2g_0)+(1-p(1+2g_1))2t_0/3$, at least $0.49995(1+2\cdot0.05805911)+(1-0.5(1+2\cdot0.07599620))2(1.12796)/3=0.876842854921$ on the stated patch. Hence the new mixed estimate by itself does not provide the necessary contact price on this anchor. Using the short physical inverse as the $r$ input makes this capacity smaller. The full eighteenth-moment calculation also uses an ordinary witness and handles prime intervals of fixed positive log width separately. The endpoint count remains open. [Complete moment](short-inverse-marked-density.md) · [Diagonal-order range](short-inverse-natural-range.md)

Prepared with OpenAI Codex assistance.
