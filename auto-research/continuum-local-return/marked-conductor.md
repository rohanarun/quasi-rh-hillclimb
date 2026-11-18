# Reduced-conductor pairs for the marked physical fourth moment

Assume the preprint's 7/8 theorem and the physical inputs of tracker #143. For the complete-row estimate below use de Faveri's sixth-order large sieve. Write $q_c=Nc$ for the norm of an ideal and $q_u=|u|^2$ for an Eisenstein element. Suppose each column in the marked fourth moment is supported on $q_c\le U^{.926}$. The contribution from pairs with reduced conductor $d$ and order-six part $d_6$ satisfying either
$$
 q_d\le U\qquad\text{or}\qquad q_{d_6}\le U^{5833/6250}
$$
is $O_\epsilon(U^{1+\epsilon})$, even upon taking the absolute value of each complete row correlation. Here $5833/6250=.93328$. The implied constant can depend on the fixed number of physical slots, weights and finite exclusions. The signed sum on the complementary pairs remains open. [Complete-row conductor estimate](eighth-conductor.md)

## Original columns and rows

Freeze the amplitude bin, error mask, selected main slots $I$ and external physical height. The same selection works on every row of the bin. The dyadic ordinary sum $P_u(N,v)$ in the reflected reduction has common coefficient $\nu(a)q_a^{-1/2-iv}\omega(q_a/N)$ on $(a,S)=1$ and row factor $\chi_a(u)$. The original numerator has $\nu=1$, and a common fixed ray twist also works. A physical main slot at scale $P_j$ has the form
$$
 Q_j(u)=P_j^{-1/2}\sum_{p\in\mathcal P_j\cap1_T}
   \overline{\chi_p(u)}\,W_j(q_p/P_j)(q_p/P_j)^{z-1}.
$$
The prime pools retain their original exclusions and a prime $p\mid u$ has symbol zero. Define the common columns by
$$
 P_u(N,v)^2\prod_{j\in I}\overline{Q_j(u)}
      =\sum_c\lambda_c(v)\chi_c(u).
$$
Thus the two ordinary ideals and one prime from every selected slot multiply to $c$. The coefficient at each prime is the conjugate of its entire displayed scalar. The squared modulus on the left is exactly the marked fourth moment summand. This agrees with the tracker's finite physical-pair identity, which conjugates the inverse-row ordinary factors and canonical slots, including their profiles, in the squared norm. Fixed prime pools, ray indicators and all fixed coefficient masks stay inside $\lambda_c(v)$. Nonunits of the moving row stay in $\chi_c(u)$. For $k=2+|I|$ the fixed annular supports and bounded $\Re z$ give
$$
 |\lambda_c(v)|\ll d_k(c)q_c^{-1/2}.
$$
This bound is uniform in $v$ and $\Im z$. The dyadic support is $q_c\ll N^2\prod_{j\in I}P_j$. In particular $2\log_U N+\sum_{j\in I}\log_U P_j$ uniformly below $.926$ gives the required support for all sufficiently large $U$. [Physical prime amplitudes and their masks](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L14996-L15014) · [Finite physical-pair comparison](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum/PositiveFourier.lean#L53-L94)

For $1\le V\le U$ and a fixed smooth nonnegative radial majorant $W_{\rm row}$ of the shell, use
$$
 K_V(c,c')=\sum_{u\ (6\text{-free})} W_{\rm row}(q_u/V)
                        \chi_c(u)\overline{\chi_{c'}(u)}.
$$
The sum includes all units and every sixth-power-free row factor supported on $S$. To majorize a physical subset, enlarge the positive marked fourth moment to this complete shell before opening the column pair. If the physical rows range over multiple shells, keep $U$, $N$ and the selected prime scales fixed while summing the $O(\log U)$ choices of $V$. The original excluded ideals are excluded from the columns on all shells. [Physical row definition](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L7256-L7266)

## The order-six cutoff

For each prime $p$ put $j_p=v_p(c)-v_p(c')$. Define $d$ as the product of primes with $j_p\not\equiv0\pmod6$ and $d_6$ as the product of primes with $j_p\equiv\pm1\pmod6$. At a prime of $d/d_6$ one has $v_p(cc')\ge|j_p|\ge2$. At a prime of $d_6$ one has $v_p(cc')\ge1$. Consequently $d^2/d_6\mid cc'$. In dyadic logarithmic coordinates $D=\log_U q_d$ and $s=\log_U q_{d_6}$ this gives
$$
 0\le s\le D,\qquad 2D-s\le 463/250.
$$
Fixed dyadic endpoint factors cost $U^\epsilon$ in the resulting bounds.

The divisor envelope above is the sole column bound used in the [complete-conductor argument](eighth-conductor.md#separate-the-small-reduced-conductors). That argument takes absolute values across pairs after summing the row at each pair. It keeps the mask from the common factor and extracted sixth powers in both columns. For row shell $V$ the extracted row-divisor count costs $(V/Y)^{1/6}\le(U/Y)^{1/6}$ at remaining scale $Y$. The sixth-equivalent pairs $d=1$ cost $O_\epsilon(U^{1+\epsilon})$. For $d>1$, formula (2) there gives the following exponent for each box. Put $0\le y=\log_U Y\le1$, $b=\max(0,\min(y,D-y))$, and let $a\ge s/2$ be the logarithm to base $U$ of the larger signed order-six conductor factor. The exponent is
$$
 \frac16+\frac y3+\frac s2+\frac12\bigl(\max(a,b,5a/6+b/3,a/3+5b/6)-a\bigr).
$$
The last parenthesis decreases with $a$. Substitution of $a=s/2$ leaves the maximum of four increasing affine functions of $s$.

For $D\le1$ substitute $s=D$ into that upper bound. Since $b\le D/2$, the result is
$$
 \frac16+\frac y3+\frac D2+\max(0,-D/24+b/6).
$$
It increases with $y$ because $b$ is 1-Lipschitz. At $y=1$ it is $1/2+D/2\le1$. This also treats $y>D$, where $b=0$.

For $1\le D\le463/250<2$ one has $b=\min(y,D-y)$ throughout $[0,1]$. The four pieces after substituting $a=s/2$ have their maxima in $y$ at $1,D/2,1,D/2$, respectively. Their upper bounds are
$$
 \frac12+\frac s2,\qquad
 \frac16+\frac{5D}{12}+\frac{s}{4},\qquad
 \frac13+\frac D6+\frac{11s}{24},\qquad
 \frac16+\frac{3D}{8}+\frac s3 .
$$
Use $D\le(463/250+s)/2$. At $s=5833/6250$ the four bounds are $12083/12500$, $73519/75000$, $148979/150000$ and $1$. Each increases with $s$. Summing the dyadic boxes gives the claimed $O_\epsilon(U^{1+\epsilon})$ for the entire union, with any additional pair restrictions. [Exact rational vertex check](marked_conductor.py)

The remaining signed sum uses pairs with $U<q_d\le U^{463/250}$ and $q_{d_6}>U^{5833/6250}$. An integrated version at the reflected Fourier weight $w(v)$ uses $\int w(v)\lambda_c(v)\overline{\lambda_{c'}(v)}\,dv$ on each pair. The $v$-twist belongs to the two ordinary factors. Opening their labels inside the columns gives Fourier argument $\log(q_{a_1a_2}/q_{a'_1a'_2})$. The prime factors retain their separately fixed external height. Symmetry upon interchanging the pair makes the residual real. A one-sided upper bound of $U^{1+3.8\cdot10^{-6}+\epsilon}$ on the integrated signed residual, uniform in the physical data and shells with the allowed external height dependence, would give that price for the $w(v)\,dv$-averaged positive marked fourth moment. Hölder against this finite measure suffices for the physical transfer. A bound at each $v$ with polynomial height growth also suffices. For this application make the distinct-slot selection of the extra-mark proof with $a=10^{-5}$ instead of $10^{-6}$ and allow $c=3.8\cdot10^{-6}$. The full column exponent $2n+b+a$ stays strictly below $.926$ throughout the same dyadic interval. The unchanged damping calculation leaves $q_{\min}a/2-c/4-3\eta/4=5983/160000000000>0$ before the arbitrarily small losses. The proved sector already fits this price. [Slot selection and physical transfer](extra-marks.md). [Reflected physical heights](eighth-short.md)

Prepared with OpenAI Codex assistance.
