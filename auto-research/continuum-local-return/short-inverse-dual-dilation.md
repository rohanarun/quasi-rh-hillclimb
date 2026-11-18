# Returning a smooth dual frequency interval to a larger row scale

Assume the preprint's $7/8$ theorem and the inputs of tracker #143. In the [eighteenth-moment reduction](rational-short-inverse.md), take the genuine Möbius coefficients, with both prime orientations and all nine label assignments retained. Write $U^\ell$ for the column scale, with $.87794<\ell<.8883$. First remove the pairs with rational norm gcd at least $U^{.2040}$ at their [proved price](short-inverse-density.md). In the remaining signed sum a smooth cutoff can remove **all dual elements of norm at most $U^{.3478}$** at cost $O_\epsilon(U^{1.000289+\epsilon})$. For coprime column norms the cutoff reaches $U^{.4688}$. At natural cost $O_\epsilon(U^{1+\epsilon})$ the corresponding ranges reach $U^{.3369}$ and $U^{.4389}$. The cutoff equals one on the stated range and goes to zero over a fixed factor in norm. These statements include all sixth-power factors. The transition and the large frequencies up to $U^{.7766+o(1)}$ still enter the endpoint problem.

## The second application of Poisson summation

Use the [exact common-factor decomposition](short-inverse-frequencies.md). Write $C_1=g k r_1$ and $C_2=g\bar k r_2$, with $Nr_1,Nr_2$ coprime. Freeze $g,k$, their assignments to the labels and $j\mid g$ from the nonunit mask. Put $R=U^\ell/(Ng\,Nk)$, $s=\log_U R$, $\kappa=\log_U Nk$ and $b=\log_U Nj$. The primitive character of the pair has conductor norm $d=(Nk)^2 Nr_1 Nr_2$ at the good primes. Its two residual norms are $\asymp R$. Fixed constants at exceptional primes and in the dual lattice can be incorporated in the radial profiles. All column primes lie outside the fixed bad set in this reduction. The small-gcd condition and the length bounds give $s>.67394$, so the primitive character is nonprincipal for sufficiently large $U$.

Write $d_0=(Nk)^2R^2$ and $q=d/d_0\asymp1$. Insert a fixed smooth bump $F(Nw/A)$ on a nonzero dual norm dyad. For $V=Nj\,d_0/A$ the old dual profile on this dyad is the radial Fourier profile
$$
 \widehat G_q(v)=F(qv)\widehat W((U/V)v),\qquad v=V Nw/(Nj\,d).
$$
Hats here are two-dimensional lattice Fourier transforms expressed in the squared radius. The old Poisson prefactor is $U/(Nj\sqrt d)$ times the primitive Gauss phase and the character at $j$. The same identity at scale $V$ has prefactor $V/(Nj\sqrt d)$ and exactly the same phases. Inverting the latter identity returns the dyad to the original character on elements $u\in j\mathcal O$, with weight $(U/V)G_q(Nu/V)$. At this step the mask at $g$ has already been expanded. Only the primitive character at $k r_1,\bar k r_2$ is evaluated at $u$. This prevents a spurious zero on $j$-multiples. The second transform is performed only on the original primitive pairs. [First Poisson formula with the exact mask](short-inverse-frequencies.md#the-exact-common-factors-and-the-scale).

For $V\gg U$, the inverse transforms $G_q$ are uniformly Schwartz, also after any fixed number of derivatives in $\log q$. This follows from smoothness on the compact Fourier annulus and boundedness of the derivatives of $\widehat W$ at zero. Insert a fixed compact cutoff in each $Nr_i/R$ equal to one on its annulus. Fourier inversion in their logarithms separates the row weight from the two column coefficients. Its common majorant decays to any prescribed order both in $Nu/V$ and in the two Fourier heights. The separated tests are the same short Möbius coefficients with added norm twists common to the labels on each side. The fixed polynomial height costs are paid by the weights or by choosing the source's small height exponent. Equivalently truncate these new heights at an arbitrarily small fixed power and use high fixed derivative orders for the tail. This calculation also covers the original log derivative test by its finite sum of one-coordinate log multiples.

## Restoring the signed coprimality condition

The inverse identity has now removed the Gauss phases. Keep the residual rational squarefreeness separately on each side, with the primes of $gk$ omitted. Write the exterior restriction as $1_{(Nr_1,Nr_2)=1}=\sum_{h\mid Nr_1,\ h\mid Nr_2}\mu_{\mathbb Z}(h)$. For fixed squarefree $h$, assign each of its rational primes to one residual label and one split place on each side. This costs at most $18^{2\omega(h)}$ assignments. Extract the corresponding ideals and omit the primes of $h$ from the remaining variables. The two central normalizations contribute $1/h$. The analogous extraction of the original $g,k$ contributed $1/(Ng\,Nk)$. All row factors of the extracted ideals have modulus at most one. The phase from $k,\bar k$ in the restored character also has modulus at most one. The remaining two polynomials are genuine, individually rational-squarefree Möbius products at total width at most $s+O(1/\log U)$, with polynomial-norm omissions. Extending the pair by this identity happens **after** returning to the row side, so the character and the separated norm profiles already have well-defined extensions to noncoprime residual pairs.

Apply Cauchy–Schwarz to the two polynomials in the absolute row weight and enlarge the row set to all elements. With $H=\log_U V\ge1$ up to fixed scale factors, the [inverse density estimate](short-inverse-density.md) gives cost $V U^{H J(s/H)+\epsilon}$, where
$$
 H J(s/H)=\frac{(\sqrt{15s}-\sqrt{10H})_+^2}{6}.
$$
Here the density estimate applies on a ball as well as a shell. Indeed decompose each row as $u_0 v^6$ and use the original buffered count at the dyadic sixth-power-free core scale $B$. Its nonfloor count exponent $R_0(\delta)$ is at least $2/7$. On the ball $B\ll V/(Nv)^6$, so summing $B^{R_0(\delta)}$ costs $O_\epsilon(V^{R_0(\delta)+\epsilon})$ because $6R_0(\delta)>1$. The floor contributes its arbitrarily small loss. Cores of norm at most $V^{1/100}$ satisfy the small-core calculation in the same estimate since $s/H\le.8883$. The pointwise and count estimates use the original presentation before extra Euler omissions. The rational-squarefree restriction follows by the absolute Euler convolution in that proof. For a Schwartz majorant, use balls of radius in norm $2^iV$, $i\ge0$. The excess in $U$ units decreases as that radius grows, and a fixed sufficiently high power of $2^{-i}$ sums the volume. Beyond a fixed large polynomial range the trivial bound suffices. The row at zero vanishes in the original nonprincipal pair and may be omitted throughout.

Multiplying by $U/V$ and summing the divisor weights gives the signed bound
$$
 O_\epsilon\big(U^{1+H J(s/H)+\epsilon}\big)
$$
when the excess is bounded uniformly over the chosen dyads and arithmetic data. In fact the weights $1/h$ and $1/(Ng\,Nk)$ sum harmonically with fixed divisor factors. The finitely many dyadic indices cost logarithmic powers. This reasoning permits dyad choices depending on $g,k,j$. An arbitrary arithmetic restriction on $w$ inside the bump would require a separate estimate.

## Explicit frequency cutoffs

Up to fixed annular factors $H=2s+2\kappa+b-\log_U A$. Natural cost holds for $H\ge\max(1,3s/2)$. For the required price it suffices to have $H\ge\max(1,1.466s)$. Indeed $HJ(s/H)$ decreases in $H$ and
$$
 .8883\, (\sqrt{15}-\sqrt{14.66})^2/6 < .000289 .
$$
Fixed annular factors and dyadic boundary errors cost $U^\epsilon$. Both conclusions apply on any smooth dyad below the indicated scale, so a smooth partition from the unit norm up to the desired cutoff has the same price. For example choose a cutoff equal to one on $Nw\le U^{.3478}$ and zero on $Nw\ge2U^{.3478}$. Throughout the remaining gcd range,
$$
 2s+2\kappa+b-\max(1,1.466s)\ge \min(2s-1,.534s)>.3478 .
$$
For coprime norms use $s=\ell>.87794$ to obtain the lower bound $.4688$. With $3/2$ in place of $1.466$ the two lower bounds are $.3369$ and $.4389$. One may instead use the full arithmetic-dependent scale $Nj\,(Nk)^2R^2/U^{\max(1,1.466s)}$. The earlier [powerful-frequency estimate](short-inverse-frequencies.md#the-primes-of-valuation-one) remains available above a smooth cutoff depending on $g,k,j$. On its proof's fixed arithmetic data the extra bounded norm weight is independent of the two residual columns. The remaining high frequencies still require a signed arithmetic estimate at price $U^{1.00029+\epsilon}$.

[Exact rational comparisons](short_inverse.py) · [Physical consequence of the full moment](short-physical-inverse.md#a-sufficient-moment-of-the-short-inverse-alone)

Prepared with OpenAI Codex assistance.
