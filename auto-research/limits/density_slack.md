# Is there slack in the row-count exponent ρ(δ)?

Part of the [limits analysis](README.md). Source references are to tracker PR #68 (`gao-five-step-affine-20261020`, `src/Candidate/...`).

## 1. How ρ is proved (PR #68 source)

`Candidate/LocalMoment/UnmarkedDensity.lean`
- l. 21 `unmarkedDensity δ = 1 − 10δ/(3(5−2δ))`; l. 33 cutoff t = 5/(5−2δ); l. 47 ρ = `Endpoint.balancedRowCount δ (1/2)`, i.e. prime fraction x = 0.
- l. 67–73 `unmarked_count_bound` uses exactly two inputs:
  - hI, the raw inverse moment: count ≤ U^{max(1,(1+5r)/6) − δr};
  - hP, the plain zero-slot moment (products of ≤ 2 plains, l. 149): count ≤ U^{1 − 2δm}, with r + m ≥ t and m ≤ 1/2.
- l. 161 `count_from_unmarked_raw_moments` needs only 2a − 1 ≤ 5/6.
- `Cycle63/Density/FixedDensity.lean` l. 14, 25–29 uses β ≤ 7/8 (`incumbent_beta_upper`) only to make the moments available on a ∈ [4/5, 7/8]. It does not enter the exponent.

## 2. Input-by-input check of ρ

| input | in ρ's exponent? | verdict |
|---|---|---|
| β ≤ 7/8 | no (range/validity only) | no gain |
| κ = 3/4, plain capacity 2/9 | no (x = 0 kills the capacity terms) | no gain |
| x = 0 (prime fraction) | yes | not slack: unmarked rows have no prime supply by definition; primes are already used by the marked channels |
| cutoff t, cap t ≤ 3/2 | t = 5/(5−2δ) is the exact balance; the cap is inactive for δ ≤ 5/6 | optimal |
| plain power (j + k ≤ 2) | yes | higher powers (products of 3 or 4) give no gain: the worst case has m = t/3 > 1/3 (checked numerically, `rho_powers.py`) |
| worst r over [t − 1/2, t] | yes | tight |

**Conclusion: ρ has no cheap slack.** It is the exact balance of the two established moments. Improving it needs a stronger inverse or large-values estimate, which is the subject of [large_values.md](large_values.md).

## 3. The one cheap, rigorous gain: re-pricing the slot with PR #68's own β

`Cycle63/Assembly/Prior.lean` l. 13: `beta_le_betaBound` takes β ≤ 10499/12000 from Levy (`WeightedQRH.beta_le_theta`), and `Optimization/SlotPrice.lean` l. 15–20 sets slotPrice = 2·betaBound − 1. PR #68 itself proves the Hecke statement `beta_le_theta_of_chosen_affine : HeckeZeroSupremum.beta ≤ Arithmetic.theta` = 0.8748087 (`Research/RecursiveAffine/Endpoint/Cycle63/Assembly/ChosenAffine.lean` l. 33). That is the same family and is already proved, so a new submission can set betaBound = 8748087/10⁷:
- slotPrice = 0.7496174;
- `slotPrice_mem` (37/50 < κ ≤ 3/4) still holds;
- every stage keeps λ ≤ 6κ.

Results with junctions re-optimised (exact certificates: `python depth3/certify_gao_depth.py --five-beta` / `--six-beta`, added in a separate PR):

| point | θ (class bound) | claimed | below PR #68 | checks |
|---|---|---|---|---|
| 5 stages (PR #68 structure, new κ) | 0.8748085435 | 874808544/10⁹ | 1.56·10⁻⁷ | 78/78 |
| 6 stages, new κ | 0.8748078865 | 874807887/10⁹ | 8.13·10⁻⁷ | 88/88 |

Points:
- 5 stages: q = 319011/500000, 135293/200000, 173433/250000, 355831/500000, 365141/500000; s = 4038199/10⁸.
- 6 stages: q = 638023/10⁶, 666019/10⁶, 682021/10⁶, 139673/200000, 715059/10⁶, 732119/10⁶; s = 505021/12500000.

Iterating the bootstrap is negligible (dθ/dβ ≈ 1.2·10⁻³, so the next step moves θ by about 2·10⁻¹⁰).

## 4. Confidence

- **ρ has no slack:** high. Both inputs and the balance are explicit in l. 67–73.
- **The β re-pricing is valid:** medium-high.
  - Non-circular: it uses a previously proved bound, and the argument stays by contradiction with θ < β ≤ betaBound.
  - Caveats: PR #68 exports only the Dirichlet theorem, so the Hecke β bound must be re-exported. The literal κ = 4499/6000 in `Geometry/Coordinates.lean` and its 38 LP certificates must be regenerated. Not built in Lean.
- **The gain is marginal** (about 10⁻⁷), not the significant improvement asked for.
