# Can a stronger large-values estimate lower θ? (2026-10-21)

Part of the [limits analysis](README.md). Line numbers refer to the 7/8 preprint, `openai/math`, `preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex`.

**Bottom line.** Using a stronger large-values estimate does not lower θ in any useful way. The amount it could ever buy is about 2.6e-4 in θ, and only if we assume a bound as strong as the density hypothesis for this family. Of all the candidates, only one gives any gain while still relying on known theorems, and its gain is zero. The classical tools (Halász–Montgomery, Huxley, Heath-Brown, Jutila, Guth–Maynard) do not apply for structural reasons, explained in §3. Nothing in this report proves a new bound.

Scripts in this folder:
- `leverage.py`: θ for each what-if (the first-junction bracket is widened to [1/2, 17/25] for the large changes and flagged when it leaves Lean's verified range).
- `rho_exact.py`: exact piecewise-linear min-max solver for ρ(δ) under hypothetical extra moments.

The baseline reproduces θ = 0.8748086741.

Web search was not available when this was written. The literature references therefore come from the preprint's own bibliography (line numbers given) plus well-known results cited from memory. URLs marked "(memory)" were not checked.

## 1. What the two baseline estimates are (paper.tex)

**Two witnesses per row.** The zero detector, Prop. "Two saturated witnesses" (l. 4510–4560), is the classical truncated-inverse detector. Its proof cites Montgomery–Pintz App. C and Guth–Maynard §13.1. It has length D_* = U^t with t ∈ [1, 3/2]. Every row in bin a (δ = 2a − 1) gets two witnesses:
- an inverse witness M_r: a Möbius polynomial of length U^r with |M_r|² ≥ U^{δr};
- a plain witness S_m: a polynomial of length U^m with |S_m|² ≥ U^{δm}.

These satisfy r ≤ t, r + m ≥ t and m ≤ 1/2. The condition m ≤ 1/2 is forced by the pointwise bound |S_m|² ≪ U^{δ min(m, 1−m)} (Lemma detector-dyads, l. 4385).

**The baseline row count.** Prop. detector-counts (l. 15185) proves #rows ≪ U^{max(R_short(t), L(t))}. At x = 0 this gives, for each witness:

| Witness | Count exponent | Source |
|---|---|---|
| Inverse, r < 1 | 1 − δr | Lemma marked (l. 9250, eq. l. 9257). This is an optimal mean value Σ_u \|M_u\|² ≪ U with rows ≥ length (needs r < m). It is proved by Heath-Brown/BGL-type Poisson recursion, not by the general large sieve. |
| Plain | 1 − 2δm | Lemma plain, z = 0 (l. 12531, eq. l. 12553): Σ\|S_{n1}S_{n2}\|² ≪ U for any lengths. A fourth-moment / Lindelöf-on-average input. |
| Inverse, r ≥ 1 (long) | e(r) − δr, with e(r) = max(1, (1+5r)/6) | Lemma "Sixth-power amplification" (l. 12362, eqs. 12372, 12426), l. 15282–15308. |

**Short estimate.** Balancing the first two rows at r = 2t/3 gives the short count R_short(t) = 1 − 2δt/3 (l. 15415, 15443). Structurally this is a Halász-type combination of two mean values. It is not a Halász–Montgomery large-values inequality: no off-diagonal estimate is used anywhere.

**Long estimate.** The long count is L(t) = 1/6 + (5/6 − δ)t. It comes from the raw moment Σ_{q_v≤H} |M_v(D)|² ≪ H, which needs H ≥ D^{1+c} (eq. raw-moment, l. 12353). That moment is lifted through the column identity M_u ≈ M_{ua⁶} (l. 12426), averaging over about P = (H/U)^{1/6} sixth powers. This gives Σ_u |M_u|² ≪ H/P = U^{1/6}H^{5/6}.

So α = 1 − 1/6 comes from the order of the characters (6) and from ideal counting in a field of degree 2. It is **not** a free parameter.

**Where the bound is tight.** The baseline is ρ = min_t max(1 − 2δt/3, L(t)), with the minimum at t = 3α/(3α − δ) (about 1.39 at δ = 0.7). The binding configuration is r = t, m = 0: a row whose only witness is a long Möbius polynomial.

**General reformulation (verified to reproduce ρ exactly):**

ρ = min_t max_{r∈[t−1/2, t]} min(I(r), P(t − r)).

## 2. The key structural facts

**(F1) Density-hypothesis floor.** For every t ≥ 1, the configuration r = t, m = 0 forces ρ ≥ I(t) ≥ I(1) = 1 − δ. Also, R_short(t) ≥ 1 − δ for t ≤ 3/2. So with this detector and the plain fourth moment, the best possible result is ρ = 1 − δ, the analogue of the density hypothesis. Improving the short side alone can reach at most 1 − δ. Improving the long side alone (α → δ) also reaches at most 1 − δ.

**(F2) The long side already beats every classical large-values bound.** Halász–Montgomery, Huxley, Jutila, Heath-Brown and Guth–Maynard all keep the diagonal term R ≪ G·N·V^{−2}. In this normalisation that term is U^{r(1−δ)}. The amplified long count satisfies 1/6 + (5/6 − δ)r < r(1 − δ) exactly when r > 1.

So for r ∈ [1, 3/2] no estimate of that type can improve L. Applying Halász–Montgomery to the amplified family {ua⁶} also fails: those rows have identical characters, so the off-diagonal terms are as large as the diagonal.

**(F3) The short side has no usable off-diagonal estimate.** This is a thin family: U rows, each of conductor about U, and every pair has conductor about U². The off-diagonal term Σ_n W(n/D)·ψ_{u_r u_s⁵}(n) is a character sum of length D ≤ U with conductor U².
- **Halász–Montgomery threshold.** It needs this sum to be ≪ D^δ. Using the bootstrap Lindelöf bound right of β_* (a routine consequence of zero-freeness) gives D^{β_*}, and that would require δ > β_*. But δ ≤ 2β_* − 1 < β_*, so the threshold is never met.
- **Lines further left.** Shifting to the line 1 − β_* requires r > κ/(δ + β_* − 1), which is about 1.3. That is outside the short range.
- **Burgess.** It needs r ≥ 1.9 even at k = 2.
- **Averaging the off-diagonal.** Cauchy–Schwarz against the proved second moment Σ_{v≤U²} |L(1/2, ψ_v)|² ≪ U², or the bilinear large sieve over pairs, gives bounds weaker than the mean value.
- **Huxley subdivision.** It has no analogue here, because the pair conductor does not shrink when rows are "close".

**(F4) The Heath-Brown identity and Hölder tricks are neutral.** Above 1, e(s) is affine. Splitting μ into shorter factors, or applying Hölder, therefore cannot beat L(t); splitting loses outright, because the factors are shorter than 1.

**(F5) Beating α = 5/6 means beating the large-sieve barrier.** It requires Σ_{q_v≤H} |M_v(D)|² = o(D) for D > H, which is Lindelöf-on-average for 1/L beyond the diagonal.
- For full Dirichlet families the analogue (Barban–Davenport–Halberstam for μ) is known, because sums over all characters of a modulus are orthogonal. Sextic rows are not such a full family.
- A one-step bootstrap from zero density gives this moment only for H ≥ D^{3/2}, which is useless. Making it useful would need a bound stronger than the density hypothesis.
- Poisson duality in u gives max(U, D), the same as the large sieve.

## 3. Candidate estimates and their θ

PR #68's other four junctions are held fixed and the first junction is re-solved. Where the re-solved first junction falls below 0.62 or 3/5, the chain is outside the range Lean has verified; those cases are what-ifs only. The "Tier" column follows the rigor classes (a)/(b)/(c) defined in §4.

| Candidate input | ρ_new(δ) | θ | gain | Tier |
|---|---|---|---|---|
| Baseline | 1 − 10δ/(3(5−2δ)) | 0.8748086741 | 0 | proved |
| k-th powers of both witnesses via the *proved* sextic large sieve K + D + (KD)^{2/3} (l. 4712; BGL arXiv:1112.1650; HB Israel J. 2000) | unchanged: the (KD)^{2/3} term kills every power | 0.8748086741 | 0 | (a) |
| Higher moments under the *optimal* sextic large sieve K + D, with amplification. Needs inverse moments up to the 6th and plain moments up to the 12th: I_k(r) = e(kr) − kδr, P_k(m) = e(km) − kδm, k ≤ 6 | min-max of these (numeric; 13/38 at δ = 0.7 vs 19/54 = 0.3519) | 0.8747770 | 3.2e-5 | (c) |
| Inverse 4th moment plus plain 6th moment only | unchanged | 0.8748087 | 0 | (c) |
| Mixed moment Σ\|M_r S_m\|² ≪ U^{e(r+m)} | reproduces L(t), unchanged | — | 0 | (c) |
| Halász–Montgomery / Huxley / Jutila / Heath-Brown / Guth–Maynard large values (GM: Annals 203 (2026); arXiv:2405.20552) | no improvement for r ≥ 1 (F2); short side cannot reach the threshold (F3) | — | 0 | does not transfer |
| Same, under GLH-strength off-diagonals | at most 1 − δ (F1) | ≥ 0.874554 | ≤ 2.6e-4 | circular |
| Beyond-diagonal raw moment with H ≥ D^λ, giving α = 5λ/6 | ρ = 1 − 2δα/(3α−δ) for δ ≤ α, else 1 − δ | see the α table below | — | (c) |
| Density-hypothesis analogue | 1 − δ | 0.8745536 (0.8745438 with other junctions re-optimised, hitting the bracket) | 2.6e-4 | (c); first junction moves to 0.589, below the 3/5 bracket |

θ for each value of α in the beyond-diagonal row:

| α | 0.82 | 0.80 | 0.78 | 0.75 | 0.72 | 0.70 |
|---|---|---|---|---|---|---|
| θ | 0.8747987 | 0.8747825 | 0.8747649 | 0.8747353 | 0.8747027 | 0.8746817 |

Two calibration points:
- ρ multiplied by 0.97 gives θ = 0.8747747.
- ρ = 1 − 1.2δ, which is stronger than the density hypothesis, gives 0.8737262 with the first junction at 0.51, far outside the verified range.

## 4. Rigor classification

- **(a) Proved or routine.** The only candidate in this class is "powers of the witnesses with the proved sextic large sieve", and its gain is zero. The bootstrap Lindelöf bound right of β_* is routine, but it does not reach the Halász–Montgomery threshold.
- **(b) Plausible but unproved transfers.** None with a positive gain. The general number-field large sieve (Huxley 1968) and the n-th-order large sieves (BGL; Gao–Zhao FACM 70 (2024), arXiv:2201.01885; Baier–Bansal arXiv:1802.08964) are already at the barrier described in F5. To my knowledge (not checked against the current literature), no improvement of Heath-Brown's (KD)^{2/3} term for cubic or sextic moduli reaches the optimal K + D in the needed range K ≤ D ≤ K².
- **(c) Speculative.** The optimal sextic large sieve, α < 5/6, and the density-hypothesis analogue. Each is equivalent in strength to Lindelöf-on-average for 1/L beyond the conductor in a thin family. This is open even for quadratic families: Heath-Brown's quadratic large sieve (Acta Arith. 72, 1995) gives zero density with no density-hypothesis-type improvement near σ = 1, as far as I know (from memory).

## 5. Recommendation

**This route is not worth pursuing without a genuinely new idea.** Even the density-hypothesis analogue for the whole sextic family buys at most 2.6e-4. Every route to any of it goes through a major open problem.

The structural reason is that the binding configuration is a row with only a long Möbius witness (r = t ≈ 1.39). Classical large-values theory cannot touch that witness (F2); only a genuinely beyond-diagonal mean value for 1/L could.

If any effort goes here at all, the only conceivable lever is the amplifier in Lemma inverse-amplification (l. 12362–12445). For example, find a larger set of rows v with |M_v| ≥ |M_u|, or a dual-side (Poisson in u) estimate that exploits Möbius-against-Gauss-sum cancellation of Dunn–Radziwiłł type (Annals 200 (2024), arXiv:2109.07463). Each 0.01 cut in α is worth about 1e-5 in θ. The slack hunt ([density_slack.md](density_slack.md)) found no cheap slack either.
