# Where the tracker chain's limits are

**Question.** After tracker PR #68 (θ = 0.8748087, Lean), is a *significant* improvement — 10⁻⁵ or more, not 10⁻⁷ — available inside this architecture?

**Answer: not without new mathematics.** Almost all of θ's sensitivity sits in one input, the row-count ("unmarked density") exponent

  ρ(δ) = 1 − 10δ/(3(5 − 2δ)),

and that exponent has no slack: it is the exact balance of two established moment bounds, and the classical large-values theory that would improve it does not transfer to this family.

## 1. Leverage map (`leverage.py`, output in `leverage_output.txt`)

Starting from PR #68's five stages (θ = 0.8748086741), change one input and re-solve:

| change | θ | gain |
|---|---|---|
| moment gain, inverse/plain caps, plain capacity: 1% better each | — | < 10⁻⁸ |
| more affine stages (8, no caps; `depth3/depth_scan.py`) | 0.8748065 | 2·10⁻⁶ |
| prior β bound ≤ 0.8748087 in the slot price (separate PR: `depth3/PROOF.md`, Update 3) | 0.8748085 | 1.6·10⁻⁷ |
| **ρ's 10/3 coefficient +1%** | 0.8747919 | **1.7·10⁻⁵** |
| ρ's 10/3 coefficient +2% / +5% / +10% | 0.8747745 / 0.8747189 / 0.8746152 | 3.4·10⁻⁵ / 9.0·10⁻⁵ / 1.9·10⁻⁴ |
| long-estimate slope α: 5/6 → 0.80 / 0.75 / 0.70 | 0.8747825 / 0.8747353 / 0.8746817 | 2.6·10⁻⁵ / 7.3·10⁻⁵ / 1.3·10⁻⁴ |
| density-hypothesis analogue ρ = 1 − δ (floor of this detector) | 0.8745536 | 2.6·10⁻⁴ |

So the affine-depth route that produced the recent records is nearly exhausted (it tops out near 0.87480), and a 10⁻⁵-scale gain needs a better ρ.

## 2. Is there cheap slack in ρ? No ([density_slack.md](density_slack.md))

ρ is the exact balance of the raw inverse moment and the plain zero-slot moment (`UnmarkedDensity.lean` l. 67–73), at cutoff t = 5/(5 − 2δ) and prime fraction 0. β ≤ 7/8 only makes the moments available; the plain capacity drops out; the prime fraction is forced to 0 for unmarked rows; the cutoff is optimal; higher plain powers give nothing (`rho_powers.py`). The only cheap rigorous gain anywhere is re-pricing the slot with PR #68's own β (Update 3 in `depth3/PROOF.md`, in a separate PR), about 10⁻⁷.

## 3. Would a stronger large-values estimate help? Only an open one ([large_values.md](large_values.md))

- The two estimates are mean values, not Halász–Montgomery; the long estimate's 5/6 comes from averaging over the sixth-power structure of rows over Q(√−3), so it is not a free parameter.
- Huxley, Heath-Brown, Jutila and Guth–Maynard all keep a diagonal term that the current long count already beats; the short side has no usable off-diagonal estimate.
- One worst-case row type (only a long Möbius witness) forces ρ ≥ 1 − δ, so even the density-hypothesis analogue for this family, itself open, buys at most 2.6·10⁻⁴.
- The only conceivable lever is the averaging step in the sixth-power amplification lemma (preprint l. 12362–12445); each 0.01 cut in α is worth about 10⁻⁵ in θ.

## Status

Analysis, not a bound. Every θ above except the β re-pricing is a what-if under an unproved input. The literature comparison in `large_values.md` was written without web access; references marked "(memory)" are unchecked.

```
pip install numpy scipy sympy mpmath
python auto-research/limits/leverage.py      # the leverage map (a few minutes)
python auto-research/limits/rho_powers.py    # higher plain powers do not change ρ
python auto-research/limits/rho_exact.py     # ρ under hypothetical extra moments
```
