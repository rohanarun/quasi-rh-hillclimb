# A shifted long inverse count at the continuum contact

This scalar calculation targets t = 17466917/20000000 = 0.87334585 in Joseph Bebel’s continuum return. It builds on Sil’s marked anchors, Hailey Collet’s witness count and the OpenAI preprint. Rohan Arun’s PR #40 uses a localized long inverse saving in the earlier #103 return. Its upper conductor is 0.8096863501, while the top conductor here exceeds 0.8152. The analytic application assumes the preprint’s 7/8 theorem. The localized analytic estimate remains open. The later conditional return integrates a saved full-class count at this target. [Conditional endpoint](lean/TargetReturn.lean). Prepared with OpenAI Codex assistance.

Use the following theorems at tracker commit c74d855c3bdfceeee059501aea76c8b1627b9abd. The endpoint and parameter enclosures are from `AlgebraicContact.theta_isolated`, `ContactBalance.density_range`, and `CutoffBounds.stationaryCutoff_tight`. The return calculation uses `CriticalReturn.target_shift`, `QuadraticReturn.stationary_curvature_pos`, `CriticalRectangle.critical_rectangle_factorization` and `amplitudeResidual_lower`. The count formulas and tangent coefficient enclosures come from `ExactCountWindow` and `ExactWindowGuards`. [Pinned Lean sources](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorContinuum)

## Price of the local count

Write h for the stationary conductor and θ for #143’s exact threshold. Its isolating interval gives 0 < θ − t < 7/10⁹. On the admitted rectangle W = [189/512,15/32] × [15/32,1/2], write J = 3(5/6 − δ) + 2δk, where k = 1 − p(1 + 2g₁) and g₁ is the positive slope parameter of the inherited line. Thus 0 < J ≤ 5/2. Let M denote the unnormalized margin at θ for the marked branch. The top edge gives

    M ≥ (δ − δ*)²/5 + (1/2 − p)δ/100,    .4258 < δ* < .4259.

Changing the target to t subtracts exactly J(3 + 8δp)(θ − t).

Put P = [.425,.4267] × [.49995,.5] and η = 10⁻⁷. A reduction of η in the available marked count on P increases the normalized margin by (3/4)hη. Since h > 1019/1250, this exceeds the target debit by more than 10⁻⁸. On the complement of P inside W, either |δ − δ*| ≥ .0008 or 1/2 − p ≥ .00005. Therefore M/J ≥ min{(.0008)²/5, .00005(189/512)/100}/(5/2). Subtracting at most (3 + 4(15/32))7/10⁹ again leaves more than 10⁻⁸. At (δ*,1/2), the inherited marked-branch margin vanishes exactly. Its normalized margin at t without the correction is −(3 + 4δ*)(θ − t) < −10⁻⁸. This negative control concerns the marked branch.

## Sufficient analytic input

Take V = 5/6 − δ, L(r) = 1/6 + Vr, U = Zᴰ, s = 10⁻⁶, G = 6/10⁷, and the exact window’s cutoff u₀ = T/J and count R = N/J = L(u₀). For the actual common-witness fibres F selected at cutoff u₀ + s on P, at conductors D where the strengthened count is used, assume that for u₀ − s ≤ r ≤ u₀ + 2s the row count obeys

    #F ≪ U^(L(r) − G + ε).

The constants, families, fixed labels, presentation, conductor and height dependences and choice of loss must meet the unmarked inverse count contract. Here r measures inverse length Uʳ. [AffineCountFiber](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/AffineCountFiber.lean)

The cutoff u₀ + s has short crossing b′ = 2(u₀ + s)/3. Doubling its plain partner u₀ + s − b′ gives b′ again. Put a = p(1 + 2g₀). Both marked exponents at their crossings are

    1 − δ(a + kb′) = R − 2δks/3 < R − η.

For 1 ≤ r < u₀ − s the inherited long bound gives L(r) ≤ R − Vs < R − η. For r ≥ u₀ − s, witness geometry gives r ≤ u₀ + s + γ. Taking 0 ≤ γ ≤ 10⁻⁷ places r in the assumed band, where L(r) − G ≤ R + V(s + 10⁻⁷) − G < R − η.

For r < 1, retain the source's short cases. Their two marked crossing comparisons use the displayed upper bound. Native top, both plain-top guards, the natural tail and the unmarked baseline all have excess over η greater than 1/1000. Indeed, if C is one of their coefficients in a count 1 − δC, the gap below R is δ(C − a − k(2u₀/3)). The replay bounds this expression using published tangent enclosures and separate bounds on J and U₀ = 1 − p(1 + 6g₀ − 4g₁), with u₀ = 1 + δU₀/J. It also checks the lower anchor buffer and upper anchor range after the shift. Thus the scalar case split yields R − η up to the inherited small losses, including the ordinary branch’s 2δkγ from m ≥ u₀ + s − r − γ. These losses must fit inside the return reserve. [ImprovedCurve.improved_witness_count_bound](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorExtension/Library/MarkedAnchor/Return/ImprovedCurve.lean)

For fixed δ, R − η is antitone in p because R is, and a branch on P has upward availability within p ≤ 1/2. An analytic implementation must adapt the window selector and witness-count argument. In particular, the present `ImprovedWindow.long_crossing` equates L(u₀) with R. At the shifted cutoff its role must be replaced by the two-case long comparison above. Its `inverse_crossing` equality can be weakened to the upper bound used in the short cases. [AffineScheme](https://github.com/GTimG/QuasiRiemannTracker/blob/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-11-13-continuum-exact-contact/src/Candidate/Local/Qrh/TwoSlot/AnchorZeroLoss/AffineScheme.lean)

Run `python3 -OB crossing.py` for the exact rational comparisons.
