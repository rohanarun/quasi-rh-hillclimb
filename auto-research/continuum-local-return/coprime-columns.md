# Squarefree coprime columns for the simultaneous spikes

Assume the preprint’s 7/8 theorem and the buffered-bin estimates used in the four-factor reduction. The result below locates the remaining moment problem on squarefree columns with explicit weights. It applies to the inverse pair, to a mixed inverse–ordinary pair, or to the four factors together. The physical row character, its Euler zeros and all norm-twist heights are preserved. Prepared with OpenAI Codex assistance. [Pointwise estimates for the physical presentation](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4385-L4499)

Fix the original presentation ψ on a row and the common untwisted dyadic profiles in one subdivision. For each index j let εⱼ=−1 for an inverse block and +1 for an ordinary block, with arithmetic coefficients μ and 1 respectively. Use the original smooth annular profiles Wⱼ, including each factor’s original real power and norm twist. A block at scale Y has normalization Y^(−1/2). All norms below are ideal norms. Write F(X) for the product of these normalized blocks at Xⱼ=U^(xⱼ), s=∑xⱼ, and δ∈[.425,.4267]. On the rows in question, the product of the chosen factors satisfies

    |F(X)| ≫ U^(δs/2−ε),

where the prescribed exponent loss ε can be arbitrarily small. On every shorter scale tuple Yⱼ≤Xⱼ the pointwise dyadic bound for the same presentation gives

    |F(Y)| ≪ U^ε ∏ Yⱼ^(δ/2).

In this upper bound one uses the ordinary estimate with exponent δy/2, which also follows from its stronger reflected form. If Yⱼ<1, a nonempty annular sum has Yⱼ≥1/B for a fixed support endpoint B. It has boundedly many terms and bounded normalized magnitude, uniformly over the permitted real exponents and imaginary twists. For Yⱼ<1/B it vanishes. The analytic losses and height costs are chosen for the complete product before this estimate is used.

**Coprime reduction.** Fix γ=10⁻⁵. Select a fixed finite set of small primes B₀ such that 4(Np)^(−3/5)≤1/2 outside B₀. Let G(Y) be the same signed sum as F(Y), restricted to tuples of squarefree ideals that are pairwise coprime and avoid B₀. Existing zero extensions still enter through ψ. Then each surviving row has a tuple of integral ideals vⱼ with ∏Nvⱼ<U^γ for which

    |G(X₁/Nv₁,…,Xₖ/Nvₖ)| ≫ U^(−ε) ∏(Xⱼ/Nvⱼ)^(δ/2).

The number of possible shift tuples is O(U^(γ+ε)) for each ε>0. In particular their total length loss is less than γ.

To prove this, use a formal variable Tⱼ for each coordinate at each prime. The unrestricted and restricted arithmetic Euler factors, before inserting ψ, are

    Fₚ = ∏_{j inverse}(1−Tⱼ) / ∏_{j ordinary}(1−Tⱼ),
    Gₚ = 1+∑ⱼ εⱼTⱼ   for p∉B₀,       Gₚ=1   for p∈B₀.

Write Kₚ=Fₚ/Gₚ and Lₚ=Gₚ/Fₚ. For σ′=3/5, give a local power series the norm obtained by summing its absolute coefficients times (Np)^(−σ′ times total degree). Outside B₀ both quotients have constant one and zero linear term. The geometric expansions of the denominators give norm at most 1+C(Np)^(−2σ′), uniformly for up to four coordinates. At a prime in B₀ the two quotients are Fₚ and 1/Fₚ, which each have finite norm since (Np)^(−σ′)<1. As 2σ′>1, the coefficient kernels K and L of the Euler products satisfy

    ∑ᵥ (|K(v)|+|L(v)|)(∏Nvⱼ)^(−σ′) < ∞.

The fixed small-prime choice imposes no extra condition on the original row. The kernels restore the omitted local factors exactly, including a zero of ψ. Complete multiplicativity gives the normalized identity

    F(X) = ∑ᵥ K(v) (∏ψ(vⱼ)/√Nvⱼ) G(X₁/Nv₁,…,Xₖ/Nvₖ).

The reverse identity exchanges F and G and uses L. Both identities follow coefficientwise before any estimates. Since Wⱼ is evaluated at the argument nⱼ/(Xⱼ/Nvⱼ) in norm, a rescaling preserves its norm twist, including when the outer ordinary block has a different height from the three inner blocks. At each fixed scale the sums with nonempty annular supports are finite.

Apply the reverse identity and the pointwise bound for F at the scales Yⱼ/Nvⱼ. With σ=(1+δ)/2>σ′ one gets |G(Y)|≪U^ε∏Yⱼ^(δ/2), uniformly on all the shifted scales including the unit ranges. This time the constant is bounded by the L-kernel norm. In the forward identity the contribution of ∏Nvⱼ≥U^γ therefore has magnitude at most

    O(U^[δs/2+ε−γ(σ−σ′)]).

Indeed the sum of |K(v)|(∏Nvⱼ)^(−σ) over this range is at most U^[−γ(σ−σ′)] times the fixed kernel norm. On the full parameter rectangle, σ−σ′≥9/80. Choose all input spike and pointwise losses small enough that their sum is below γ·9/80, then take U large. At least half the original lower bound survives in the complementary sum. Its kernel norm at σ is bounded, giving the claimed individual shifted spike. Finally, the number of shift tuples is at most U^[γ(1+e)]ζ_F(1+e)^4 for every e>0 by Rankin’s bound. The chosen shift can vary by row. After grouping by it the restriction and the untwisted bumps are fixed, and the original rowwise norm parameters remain available.

**A sufficient two-inverse moment.** For the pair of inverse blocks the two norm twists and the real exponents coincide. At shifted scales Y₁,Y₂ their joint sum is exactly

    (Y₁Y₂)^(−1/2) ∑_{n squarefree, (n,B₀)=1} μ(n)ψ(n)
        (Nn/(Y₁Y₂))^(−κ+iθ) ∑_{d|n} w₁(Nd/Y₁) w₂(N(n/d)/Y₂),

where w₁,w₂ are the original untwisted bumps and κ,θ are the actual shared norm parameters. This identity uses μ(d)μ(n/d)=μ(n) on squarefree n. The two scale exponents remain within the original contact windows enlarged downwards by γ. The divisor weight can depend on both scales. The four-factor version has the same squarefree combined support, with the product of the inverse-coordinate Möbius signs and the stated separate norm heights.

Suppose the sum of squared magnitudes of the displayed two-inverse column over any of the original surviving physical fibres is O(U^(63/50+ε)), uniformly for each admissible fixed shift tuple and fixed labels and dyads, with the permitted rowwise κ,θ. A fixed polynomial height cost is allowed if included in the physical small-height choice. The previous reduction has R+δs>63/50+1/250 on the full critical patch. For each shift, the squared spike is ≫U^[δ(s−γ)−2ε]. Summing its count over the shift tuples and original dyads gives at most

    O(U^[63/50−δs+(1+δ)γ+oₑ(1)]),

where oₑ(1) denotes aggregate exponent losses that can be made arbitrarily small by the preliminary choices. Since (1+.4267)γ<.000015, this count is below U^(R−10⁻⁷) after the prescribed losses. One may fix γ first, request every finite aggregate loss below 10⁻⁷, then make the source’s mesh and height choices and finally take U sufficiently large for the tail comparison. The proposed 63/50 moment for the displayed balanced divisor weight is an additional arithmetic input. Even extending the single-inverse sixth-power price (1+5s)/6 to this weight would exceed 17/12 at s>1.50. [Exact continuum contact](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum)

**A sufficient mixed moment.** Choose either inverse and either ordinary spike, with their actual norm-twist heights, and put s=xᵢ+yⱼ. Here s>t₀−18λ with λ=10⁻⁶ and t₀>1.1279. The exact long crossing R=1/6+(5/6−δ)t₀ gives

    R+δs > (1+5·1.1279)/6−18·.4267·10⁻⁶ > 1.10657.

An exact-coprime, squarefree mixed column with second moment O(U^[553/500+ε]) would therefore also count the remaining rows below U^(R−10⁻⁷). The same shift loss (1+δ)γ<.000015 fits this margin. For the inverse and its inner ordinary partner the norm twists coincide, so the arithmetic coefficient of a squarefree n is ψ(n) times ∑_{d|n} μ(d)wᵢ(Nd/Yᵢ)wⱼ(N(n/d)/Yⱼ), times the common norm power of n. With the outer partner the same formula has the original two norm powers inside the divisor sum. These explicit smooth divisor weights require a mixed-moment estimate.

## Combining the row and column reductions

The [large-radical row decomposition](squarefree-rows.md) can also be used after the column restrictions. For each $w$, replace $\psi(n)$ by its exact product $\nu(n)\chi_n(\xi w)^{\varsigma}\chi_n(k)^{\varsigma}$ in the displayed coprime column. For a two-inverse moment one may pay $q_{\operatorname{rad}(w)}^{100}$, and for the mixed moment one may pay $q_{\operatorname{rad}(w)}^{30}$. The row sum over $w$ and its weight cost at most $101c$ or $31c$ respectively in the exponent, with $c=10^{-5}$. The column shifts cost at most $(1+\delta)\gamma$ in either case. The [rational checks](four_factors.py) include both combined costs. Either estimate, if proved on the specified fibres, would bound the remaining count below $R-10^{-7}$. The analytic bridge from that count to an all-moduli zero-free statement at the lower endpoint remains to be verified.

There is also a direct bound on the contribution of large common divisors to the original inverse pair. Fix its exact ideal gcd $g$, divide both indices by $g$ and impose coprimality of the quotients by Möbius inversion over $d$. For a nonzero term $gd$ is squarefree. Extracting $gd$ from either normalized inverse yields a factor of magnitude at most $q_{gd}^{-1/2}$ and a residual inverse with $(n,gd)=1$ at scale $X_j/q_{gd}$. Its pointwise bound on the buffered line gains $q_{gd}^{-\delta/2}$ over the original length bound. The additional inverse Euler factors cost $O(U^\epsilon)$ uniformly, since $\prod_{p\mid gd}(1-q_p^{-.51})^{-1}\ll_\epsilon q_{gd}^\epsilon$ and $q_{gd}$ has bounded polynomial size. Summing both extracted factors over $q_g>U^\gamma$ and all $d$ costs at most $O(U^{\delta s/2+\epsilon}\sum_{q_g>U^\gamma}q_g^{-1-\delta}\sum_d q_d^{-1-\delta})=O(U^{\delta s/2-\delta\gamma+\epsilon})$. Thus this signed tail is already smaller than the spike on every surviving row.
