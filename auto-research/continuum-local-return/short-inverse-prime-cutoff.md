# Separating one large prime from the tested short inverse

Assume the preprint’s $7/8$ theorem and the buffered, nonprincipal row hypotheses in the [eighteenth-moment calculation](short-inverse-marked-density.md). Write $V$ for the sixth-power-free core scale, $a=(1+\delta)/2$, $X=V^x$ with $.094<x<.1012$, and suppose the centrally normalized tested inverse has magnitude at least $V^{\alpha x/2}$, where $0<\alpha\le\delta$. Fix the outer sixth power $v^6$. Throughout, $\psi$ denotes the original tested character with its zero extensions, including the frozen omission at every prime dividing $v$. The conclusions allow arbitrary prescribed power losses, uniformly on the fixed bins. Put
$$
 \gamma=\delta-9.4(\delta-\alpha).
$$
For $\gamma$ bounded below by a fixed positive constant, at least one of the following occurs.

* There is a prime annulus of center $(\log V)^2<P\le V^{.051+o(1)}$, carrying the original symbol with a fixed bounded coefficient and a common norm power. For each sufficiently small fixed $\kappa>0$ its raw sum has magnitude $\gg P^{(1+\gamma-\kappa)/2}\log V/(1+\log P)^2$. The implied constant can depend on $\kappa$ and the bin.
* There is a centrally normalized smooth prime polynomial of width $.084\le b\le x+o(1)$ whose squared magnitude is at least $V^{\delta b-(\delta-\alpha)x-o_\epsilon(1)}$. Here and below the exponent loss denoted by $o_\epsilon(1)$ can be made smaller than any prescribed positive number by the preliminary mesh, height and buffer choices.

## The cutoff identity

Choose a fixed smooth $0\le\omega\le1$ on the positive real axis, equal to one through 1 and zero from 2 onward. Put $Y_0=V^{.051}$ and $\omega_p=\omega(Np/Y_0)$. Since $.1012<2(.051)$, an ideal $n$ in the original fixed annulus $Nn\asymp X$ has at most one prime divisor of norm greater than $Y_0$, counted with multiplicity. Thus, on squarefree $n$,
$$
 1=\prod_{p\mid n}\omega_p+\sum_{p\mid n}(1-\omega_p).
$$
The same separation in the inverse polynomial produces one term with coefficients $\mu(n)\psi(n)\prod_{p\mid n}\omega_p$, and a sum, with a minus sign, of prime times residual inverse terms. For the latter write $n=pm$. Since $Np>Y_0$, the support has $Nm<Np$ for large $V$, so $p\nmid m$ throughout the support and $\mu(pm)=-\mu(m)$ there, including the zero for a nonsquarefree $m$. Both factors keep the original fixed twist, and the product keeps all its local zeros.

If the weighted inverse term is large, use its exact finite Euler product
$$
 F(s)=\prod_{Np\le 2Y_0}\left(1-\omega_p\psi(p)(Np)^{-s}\right).
$$
Its Dirichlet coefficients agree with that term throughout the tested annulus. More generally the same reasoning applies to a genuine residual inverse of length $V^c$: take the finite product through a fixed upper support ratio times $V^c$, with weights one. If the tested squared exponent at length $V^y$ is at least $\gamma y$ up to preliminary losses, put $\sigma_0=(1+\gamma-\kappa)/2>1/2$. For the two applications $y=x$ or $y=c\ge .01-o(1)$, so the gain $\kappa y/2$ on shifting the shifted Mellin line is bounded below. Freeze the positive $\gamma$ bin and choose the preliminary losses smaller than this gain.

For clarity, Mellin inversion on $\Re s=2$ uses $|F|\le\zeta_K(2)$ and a uniformly Schwartz transform of the fixed profile translated by its norm height. Truncate at the allotted small power of $V$ on either side of that height. If $\log|F|\le c_0\log V$ throughout this compact rectangle down to $\sigma_0$, with $0<c_0<\kappa y/4$, its left integral contradicts the lower bound. The two joining integrals cost less than any required power by Schwartz decay, choosing the order after the height exponent, and the original right-line tails have the absolute Euler bound. Hence $\log|F(s)|>c_0\log V$ at some point in the rectangle. For $\beta=\Re s\ge\sigma_0$ the degree-at-least-two terms of $\log F$ have uniformly bounded absolute sum. The primes through $2(\log V)^2$ contribute $o(\log V)$ even absolutely, since $2(1-\sigma_0)<1$. Pigeonhole the remaining first-degree terms over full dyadic intervals with proportions $(1+\log P)^{-2}$, whose sum is bounded. Removing the center normalization gives the lower bound in the first alternative, since $P^\beta\ge P^{\sigma_0}$. The factors $\omega_p$ or the final top cutoff stay in the row-independent coefficients, of modulus at most one. The argument uses a bound on the whole finite product only on the absolute line and in the contradiction on the truncated rectangle. [Truncated Euler product and distinct-prime packing](short-inverse-primes.md#truncated-euler-product)

## The prime and its residual inverse

Otherwise some prime times inverse term is large. Split $p,m$ into fixed smooth norm dyads at $P_1,V^c$ with $b=\log_V P_1$, so $b+c=x+O(1/\log V)$ and $.051-o(1)\le b\le x+o(1)$. Scales bounded below by a fixed positive constant may be reset to one at bounded dilation. Mellin separation of the original single profile at $Np\,Nm/X$ produces the same additional norm frequency on both factors. After the logarithmically many dyads and this Fourier integral, some fixed dyadic pair and some one common frequency yield
$$
 |Q_b M_c|^2\ge V^{\alpha x-o_\epsilon(1)} .
$$
The Fourier transform of the coupling is Schwartz with bounded integrated absolute value on these annuli. Its tails are negligible by absolute counting and choosing the decay order after its allotted positive height power. The prime profile includes the smooth multiplier $1-\omega_p$. Its scaled derivatives are uniformly bounded, since the transition meets the dyad only when $P_1\asymp Y_0$. Thus the prime factor uses the full smooth dyad with the stated fixed omission.

Buffered Mellin inversion for the genuine residual gives $|M_c|^2\ll V^{\delta c+o_\epsilon(1)}$. On the same frequency the prime bound is $|Q_b|^2\ll V^{\delta b+o_\epsilon(1)}$. To obtain it use $-L'/L$ on the absolute line for the primitive nonprincipal character with a prime-power profile. Divide the smooth test on $Np\asymp P_1$ by $\log Np$ so the prime coefficients have their original weights. On prime powers $p^j$ the extra coefficient is $\log Np/\log N(p^j)=1/j$, so subtracting $j\ge2$ costs $V^{o(1)}$ after central normalization, by ideal counting through $\ll\sqrt{P_1}$. The primes at which the primitive presentation and the original zero extension differ also cost $V^{o(1)}$, since the product of those primes has polynomial norm and hence there are $O(\log V)$ of them. Move the smooth central integral to $\Re s=a+8e$ with a freely small buffer $e$. The source logarithmic-derivative bound holds on this line and its horizontal joins in the buffered rectangle, and the original central norm power translates its height. This yields the stated upper exponent, with $e$ and the other preliminary losses chosen sufficiently small. The finitely many extra Fourier heights in the cutoff separation, prime estimation and residual Euler extraction receive separate fractions of the single original buffered allowance. The tested and detector presentations need only agree up to the original allowed fixed ray twists and sextic orientation, as in the density proof. [Logarithmic-derivative estimate](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L1531-L1586) · [Buffered bins and common height allowance](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4281-L4368)

If $b\ge.084$, division by the residual inverse upper bound gives the second alternative. When $b<.084$, the prime upper bound gives $|M_c|^2\ge V^{\delta c-(\delta-\alpha)x-o_\epsilon(1)}$. Now $.01-o(1)<c<.0502+o(1)$ and
$$
 x/c\le .094/(.094-.084)+o(1)=9.4+o(1).
$$
The residual squared exponent is therefore at least $\gamma c-o_\epsilon(1)$. Apply the finite Euler-product argument above at this shorter length. The prime witness it gives has width at most $c+o(1)<.051$. The weighted inverse in the first branch likewise has exponent at least $\gamma x$ since $\gamma\le\alpha$. This proves the alternatives.

Prepared with OpenAI Codex assistance.
