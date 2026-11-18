# Prime factors forced by the short physical inverse

Assume the preprint’s $7/8$ theorem and the physical and marked estimates used in tracker #143. Let $T=\log U$, $a=(1+\delta)/2$, $.425\le\delta\le.4267$, $\sigma_0=a-2\cdot10^{-6}$ and $\eta=10^{-7}$. On the remaining physical fibres use the actual denominator presentation $\psi_u(n)=\nu(n)\chi_n(u)^{\pm1}$, including all original zeros. Its short inverse has a fixed annular shape at $X=U^z$, $.0974<z<.0987$, and centrally normalized magnitude at least $U^{(a-1/2)z-1.5\eta}$, up to a fixed positive constant. A bounded real norm power in its profile and the original allowed norm height are permitted. [Short inverse and its amplitude debit](short-physical-inverse.md#localization-by-the-exact-inverse-identity)

Outside $O(U^{.6254})$ sixth-power-free physical rows, any such spike gives a dyadic prime interval of center

$$
 (\log U)^{8.6}< P\le C X
$$

and a prime sum of magnitude at least

$$
 c\,P^{\sigma_0}\frac{\log U}{(1+\log P)^2}.                                           \tag{1}
$$

Here $C$ is fixed by the original support and $c>0$ is fixed independently of $U$. The sum may be taken over the common full good-prime set $P<N\mathfrak p\le\min(2P,CX)$, with summand $\psi_u(\mathfrak p)(N\mathfrak p/P)^{-s}$ for one $s$ satisfying $\sigma_0\le\Re s\le2$. The imaginary part is the original inverse height plus a common Fourier shift inside its allotted fraction of the buffered height. The prime span $\log_U P$ may tend to zero. Nevertheless (1) gives squarefree composite polynomials of a prescribed positive width, up to rounding by one prime width, as detailed below. Their coefficients satisfy a uniform absolute bound; a mixed moment with these composite polynomials remains a further arithmetic input.

## Truncated Euler product

Choose $C$ above the upper support ratio of the inverse dyad and form the finite product

$$
 F_u(s)=\prod_{N\mathfrak p\le CX}\big(1-\psi_u(\mathfrak p)(N\mathfrak p)^{-s}\big).
$$

Its coefficients coincide with the genuine inverse on the entire tested annulus, including the fixed exclusions and primes of $u$. Mellin inversion on $\Re s=2$ therefore reconstructs this dyad, with the usual $X^{s-1/2}$ and the Mellin transform of the fixed profile, translated by the original norm height. The transform has uniform Schwartz decay on the compact strip for bounded real profile powers. Choose any sufficiently small fixed positive Fourier-height exponent, within the original height budget. Truncate at a fixed multiple of its power of $U$ on either side of the original height. The absolute-line tails are negligible since $|F_u|\le\zeta_K(2)$ there; the transform order is chosen after the height exponent.

Suppose $|F_u|\le U^{10^{-8}}$ on this truncated strip down to $\sigma_0$. The horizontal joins are negligible by the same transform decay and the fixed polynomial bounds *under this supposition*. The left edge gives $O(X^{\sigma_0-1/2}U^{10^{-8}})$, smaller than the assumed spike because $2\cdot10^{-6}(.0974)-1.5\eta=4.48\cdot10^{-8}$. No bound for the infinite left-line tails of the finite Euler product is needed. Thus some point in the strip has $\log|F_u(s)|>10^{-8}T$. Writing $\beta=\Re s$, the absolutely summable terms of degree at least two give, uniformly for $\beta\ge\sigma_0>1/2$,

$$
 \log|F_u(s)|=-\Re\sum_{N\mathfrak p\le CX}\psi_u(\mathfrak p)(N\mathfrak p)^{-s}+O(1).
$$

The contribution from all dyads of center $P\le T^3$ is $o(T)$ even absolutely, since $3(1-\sigma_0)<1$ and ideal counting bounds the sum through $2T^3$. The remaining dyadic weights $(1+\log P)^{-2}$ have bounded sum. With $S_P(s)=\sum_{P<N\mathfrak p\le\min(2P,CX)}\psi_u(\mathfrak p)(N\mathfrak p/P)^{-s}$, pigeonholing the negative real parts therefore gives
$$
 -\Re\!\left(P^{-i\Im s} S_P(s)\right)\ge cP^\beta T/(1+\log P)^2
$$
on some dyad $P>T^3$. This proves (1) and records its phase relative to the dyadic center. The dyads are norm intervals and need no ordering of prime ideals of equal norm. If desired, partial summation also gives (1) for some initial part of the interval with only the pure unit norm twist retained, at a fixed change of constant. The weighted full-interval version avoids any row-dependent endpoint for the composite construction.

## Products of distinct primes

Let $s=\beta+it$ be the coordinate just obtained and set $v_{\mathfrak p}=\psi_u(\mathfrak p)(N\mathfrak p/P)^{-s}$ on that interval. Write $S=\sum v_{\mathfrak p}$ and $e_h$ for the elementary symmetric polynomial of degree $h$ in these variables. Here $|v_{\mathfrak p}|\le1$ and the number of entries is at most $C_0P$. For $1\le h\le C_1T/\log(2P)$, comparison of the coefficients of $\prod(1+v_{\mathfrak p}x)$ and $\exp(Sx)$ gives

$$
 \left|e_h-\frac{S^h}{h!}\right|
 \le \frac{|S|^h}{h!}\left[\exp\!\left(C_0P\sum_{j\ge2}(h/|S|)^j/j\right)-1\right].
$$

Indeed the absolute coefficients of the ratio of the two series are majorized by those of $\exp(C_0P\sum_{j\ge2}x^j/j)$, and $h!/(h-k)!\le h^k$. From (1), $h^2P/|S|^2\ll (1+\log P)^2 P^{1-2\sigma_0}=o(1)$ uniformly, so $|e_h|\ge(1-o(1))|S|^h/h!$. The use of distinct primes leaves every coefficient supported on squarefree ideals.

For a prescribed bounded $w>0$ take $h=\lfloor wT/\log(2P)\rfloor$ whenever this is positive. Normalize by $(2P)^{-h/2}$. Using $h!\le h^h$ and (1) gives

$$
 \log\big((2P)^{-h/2}|e_h|\big)
 \ge (\sigma_0-1/2)h\log(2P)-O_w\big(h\log(2+\log P)\big).
$$

The error is $o(T)$ uniformly for $P>T^3$. The products have norm in $[P^h,(2P)^h]$. Split this range into fixed-shape smooth dyads of center $V$; there are $O(T)$ choices. The weights separate into a common scalar $(V/P^h)^{-s}$ and the bounded-real, common-height norm power $(Nn/V)^{-s}$. The scalar has magnitude $O(1)$ since $V\gg P^h$. After central normalization at its actual $V$, one of the dyads has magnitude at least $V^{\sigma_0-1/2}U^{-o(1)}$. Its coefficient before the norm twist and smooth test is exactly $\psi_u(n)$ times the indicator of squarefree ideals with $h$ factors all in the common prime interval. There are only logarithmically many choices of each dyad. Its width lies in

$$
 w-\log_U(2P)-o(1)\ \le\ \log_U V\ \le\ w+o(1),
$$

since $h\log 2=o(T)$. In particular if $P=U^{o(1)}$, every fixed positive width is available up to $o(1)$, at normalized slope at least $a-1/2-2\cdot10^{-6}$. If $h=0$, the original prime witness itself is longer than the requested width up to $o(1)$; no shorter product is asserted. Packing $h$ growing with $U$ produces a single composite-index polynomial. The original marked estimates for a fixed finite list of prime factors have different hypotheses. [Source marked inverse moment](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9218-L9269)

## Removing the polylogarithmic scales on physical rows

For $T^3<P\le T^{8.6}$ take $h=\lfloor T/\log(2P)\rfloor$. The product length is at most $U$. For fixed $s$ the sum $e_h$ has one coefficient per squarefree product of the chosen primes. After extracting the physical sextic row character, the squared coefficient norm is at most $(C_0P)^h/h!$, by the elementary symmetric sum of the squared prime weights. Fixed ray twists have modulus at most one. The order-six large sieve on sixth-power-free ideal rows of norm $O(U)$ and squarefree columns of norm at most $U$ therefore bounds the squared sum by $U^{7/6+\epsilon}(C_0P)^h/h!$. Use the literal sextic symbol, grouping the finitely many unit and primary reciprocity sectors and absorbing their fixed factors in the coefficients. A zero at a prime dividing $u$ remains the sieve kernel's zero. The same bound holds for the conjugate orientation and all the source’s fixed presentations. [De Faveri, Theorem 1.1 and the fixed family of §2](https://arxiv.org/html/2610.04045v1#S1.SS1) · [Physical sixth-power-free family](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4220-L4268)

Apply the lower bound for $e_h$ on a row satisfying (1). Markov’s inequality gives the count

$$
 \ll U^{7/6+\epsilon}\,h!\left(\frac{C_2 (1+\log P)^4}{T^2P^{2\sigma_0-1}}\right)^h .
$$

Here $h\log P=T+o(T)$ uniformly on the stated range. Also $\log(h!)\le h\log T$, $h\log(2+\log P)=o(T)$ and $h\log T\ge(1/8.6-o(1))T$. The resulting exponent before preliminary losses is at most

$$
 \frac76-(2\sigma_0-1)-\frac1{8.6}\le\frac76-.424996-\frac1{8.6}
 =\frac{20168879}{32250000}<.6254 .
$$

For the rowwise coordinates, discretize $\beta\in[\sigma_0,2]$ and the original plus added norm heights before taking the power. Both derivatives of the prime sum cost $O(P)$ on the dyad because $\log(N\mathfrak p/P)$ is bounded. A mesh of size $T^{-12}$ changes the sum by $o(1)$ and keeps a fixed fraction of (1), whose right side tends to infinity here. It costs a fixed power of $T$ times the allowed height range. A partial endpoint, if that version is used, costs at most $O(P)$ further choices. The initial inverse dyads, possible $P$, and fixed presentation labels contribute only logarithmic powers or fixed factors. Choose the source height exponent, the additional Fourier-height exponent and the sieve loss below the remaining numerical slack ($>.0000084$). Thus the exceptional count is $O(U^{.6254})$, below $U^{R-\eta}$ since $R>.62567$ on this physical patch. The argument leaves open the large-$P$ mixed estimate needed for a sub-frontier endpoint.

Prepared with OpenAI Codex assistance.
