# Auto-research: instructions for agents

This file is for automated research agents (and humans) who want to push the Quasi-RH zero-free half-plane further. Read it fully before you start.

## Current state

See the README's [PR progress and Lean verification tables](README.md#progress-and-lean-verification) for contributor credits, open proposals, submitted verification evidence and tracker certificates.

| | value |
|---|---|
| Independently Lean-verified source-moment endpoint | θ = 8747729897/10000000000; [fresh 6,471-module build, canonical endpoint, standard-axiom audit and fresh Lean kernel replay passed](verification/pr8-independent/README.md); tracker three-kernel admission pending |
| Conditional role-specific source/return proposal | theta = 87477137/100000000 = .87477137; [exact finite replay and handoff](auto-research/role-source-caps/README.md); new analytic integration and Lean endpoint pending; not an accepted record |
| Preprint bound (OpenAI, 30 Sep 2026) | Re s > 7/8 |
| Best audited here | **Re s > 20649/23600 = 7/8 − 1/23600** |
| Best Lean-verified on this line | Re s > 139999/160000 = 7/8 − 1/160000 (τ = 1/40000, `lean-tau/`); the Lean proof caps τ near 2.965·10⁻⁵ |
| Best certified (final section only) | σ₀ = **4374785349/5000000000 = 0.8749570698**, submitted in [PR #12](https://github.com/rohanarun/quasi-rh-hillclimb/pull/12); [independently replayed with Node BigInt](auto-research/track-a-independent-replay.md). No new point is claimed by the replay. |
| Audited default point | ℓ = 2953/17700 (= 1/6 + 1/5900), h = 405989/500000 |
| Edge of the frozen architecture | σ₀ ≈ 7/8 − 4.293·10⁻⁵ (ℓ ≈ 1/6 + 1.7172·10⁻⁴) |
| Exact obstruction in the frozen budget | Every feasible point requires σ₀ > (1507 − 2√921)/1653; [algebra checked against the budget](auto-research/track-a-near-edge.md), matching the prior report in issue #4 |
| Infimum of the frozen Track A budget | **(1507 − 2√921)/1653 ≈ 0.87495706979916874**, not attained; [exact global sharpness proof](auto-research/track-a-exact-limit.md) |
| Ceiling with idealized inputs | ≈ 0.864 (perfect row counts and large sieve) |
| Floor-bin obstruction with ideal low estimate and h < 5ℓ retained | σ₀ > 1573/1818 ≈ 0.865237; [exact necessary bound](auto-research/floor-bin-obstruction.md), not an attained endpoint |
| Weaker supply-only relaxation of that obstruction | σ₀ > 11513/13326 ≈ 0.863950 when h < 5ℓ is dropped and only ℓ/h > 7/37 is retained; same [proof and scope](auto-research/floor-bin-obstruction.md) |
| Ideal adaptive counts, other checks retained | Sharp infimum **84031/96156** with intermediate δ ≤ 5/6; **368153/422028** with intermediate δ ≤ 3/4; [exact proof and assumptions](auto-research/side-constraint-limits.md). Neither is a zero-free endpoint. |
| Fourth density-step result | **θ = 873981/1000000 = 0.873981**, building on tracker #84; [proposal and verification](auto-research/proposals/2026-10-27-fourth-density-step.md), [exact scalar replay](auto-research/fourth-density-step/README.md), accepted [tracker #85](https://github.com/GTimG/QuasiRiemannTracker/pull/85). Superseded as a record by tracker #86. |
| Ideal adaptive counts with repeated bin-ceiling updates | Sharp infimum **(89309 + √2542433881)/160200 ≈ 0.8722319182091823**; [exact variable-ceiling proof and rational iteration](auto-research/bootstrap-side-limits.md). Hypothetical adaptive count; no new analytic estimate or zero-free endpoint. |
| Separate floor and nonfloor intermediate counts | Sharp ideal-bootstrap infimum **(89309 + √2534423881)/160200 ≈ 0.8717357171994976**; [source audit and exact density phase diagram](auto-research/split-floor-limits.md). The intermediate count is inherited; ideal adaptive counts remain hypothetical. |
| Formal structural budget lemmas | [31 Lean theorems](lean-budget/README.md): floor-bin obstructions, balanced-count slope bounds, constructive frequency/supply extension and finite even mesh; standard-axiom checks and fresh kernel replay passed; no new endpoint |
| Latest merged tracker record (28 Oct 2026) | **θ = 4369779/5000000 = 0.8739558**, Jacob Sussman’s [fine density chain, tracker #86](https://github.com/GTimG/QuasiRiemannTracker/pull/86). Tracker #85 and research #30 are also merged. Current inspected tracker base: `8f77ade2f22d40197711e45af08286faed51de13`. |
| Locally Lean-verified wider-density result | **θ = 1747893/2000000 = 0.8739465**; [exact replay and proof audit](auto-research/density-wide/README.md). Natural-row density is extended from `a >= 33/40` to `a >= 3/4`, supplying `q >= 1/2`; 15 new count steps and a separate physical source. Complete Lean 4.34.1 endpoint, canonical target/standard-axiom audit and fresh replay of all 75 submitted modules pass. Formal proof in [tracker #89](https://github.com/GTimG/QuasiRiemannTracker/pull/89); conditional on the preprint’s 7/8 theorem; not yet an admitted record. |
| Latest merged tracker record (28 Oct 2026) | **theta = 4369779/5000000 = 0.8739558**, Jacob Sussman’s [fine density chain, tracker #86](https://github.com/GTimG/QuasiRiemannTracker/pull/86). Tracker #85 and research #30 are also merged. Inspected tracker base: `e14f7e7924faaa0a19b37979ed532cbe3df6d830`. |
| Locally Lean-verified refined-density result | **theta = 8739461/10000000 = 0.8739461**; [exact replay and full proof audit](auto-research/density-refined/README.md). Uses the wider density theorem from [tracker #89](https://github.com/GTimG/QuasiRiemannTracker/pull/89), with 59 finer count steps and the separate step-38 physical source. Complete Lean 4.34.1 endpoint, canonical/standard-axiom audit and fresh replay of all 120 submitted modules pass. Conditional on the preprint’s 7/8 theorem; tracker admission pending. |
| Latest merged tracker record (28 Oct 2026) | **theta = 4369779/5000000 = 0.8739558**, Jacob Sussman’s [fine density chain, tracker #86](https://github.com/GTimG/QuasiRiemannTracker/pull/86). Inspected tracker base: `e14f7e7924faaa0a19b37979ed532cbe3df6d830`. |
| Locally Lean-verified four-round result | **theta = 436972583/500000000 = 0.873945166**; [four exact improvements, replay and formal audit](auto-research/density-batch/README.md). Improves pending [tracker #90](https://github.com/GTimG/QuasiRiemannTracker/pull/90) by `467/500000000`. Final chains have 125 count and 77 physical steps with proved LOW reserve `1/10000`. Complete Lean 4.34.1 endpoint, nine standard-axiom audits and fresh replay of all 263 submitted modules pass. Conditional on the preprint’s 7/8 theorem; tracker admission pending. |
| Latest merged tracker record (28 Oct 2026) | **theta = 8739461/10000000 = 0.8739461**, the [refined density chain, tracker #90](https://github.com/GTimG/QuasiRiemannTracker/pull/90), building on Sil and Jacob Sussman. Merged at `d52ee460644ef549df52ca180872e04ee2f84504`. |
| Locally Lean-verified ten-round result | **theta = 2731076077/3125000000 = 0.87394434464**; [ten exact improvements, replay and formal audit](auto-research/density-ten/README.md). Improves admitted, unmerged [tracker #91](https://github.com/GTimG/QuasiRiemannTracker/pull/91) by `10267/12500000000`. Final chains have 255 count and 314 physical steps with proved LOW reserve `1/1000000` and floor reserve `1/250`. Complete Lean 4.34.1 endpoint, seventeen standard-axiom audits and fresh replay of all 749 submitted modules pass. Conditional on the preprint’s 7/8 theorem; tracker admission pending. |
| Constructive frequency/supply extension | With a strict endpoint margin and 1/2 ≤ h < 1, supply above 7/37 extends iff 37ℓ > 7h; [exact lemma, slot construction and scope](auto-research/frequency-extension.md). No new endpoint; `certify.py` retains h < 5ℓ. |
| Conditional nested levels on PR #67 | θ ≤ 0.874812431 (three levels), θ ≤ 0.874810282 (four levels), θ ≤ 0.874809989 (six levels, larger H4 caps), conditional on H1–H5 (`depth3/PROOF.md`) |
| Conditional fine-step source/return proposal | θ = 87477128/100000000 = 0.87477128; [exact finite replay, research log and next steps](auto-research/fine-step-source-chains/README.md); finite tuning has ≈ 2·10⁻⁸ left; analytic application and Lean endpoint pending; not an accepted record |
| Conditional adaptive-cap source/return candidate | θ = 87477127/100000000 = 0.87477127; [exact finite replay](auto-research/adaptive-caps/README.md); analytic application and Lean endpoint pending; not an accepted record |
| Dominant structural lever (Collet framework) | Marked inverse moment slot capacity (1−r)/2; forced by two terminal branches; Lemma S fixes one ([analysis, Lean-checked algebra](auto-research/inverse-capacity/README.md)) |

The original hill-climb results are conditional on the preprint's 7/8 theorem. The separately submitted source-moment manuscript states an unconditional theorem and records its distinct verification scope. See `README.md` and `AUDIT_SUMMARY.md`.

## The model you are optimizing

The boundary is **σ₀ = 11/12 − ℓ/4**. To lower σ₀, increase ℓ while every inequality in the final section of the preprint still holds. The binding one is the adaptive endpoint inequality (Lemma *balanced-endpoint*):

  E_*(δ, x) < 0 for all δ ∈ [0, 5/6], x ∈ [0, 1/2],

where E_* is the high exponent at d = h with the balanced row count R_*. The code is in `budget.py`, and the exact form is in `certify.py` (`adaptive_poly`).

## Two tracks

### Track A: parameter hill-climbing (small gains, easy to verify)

The remaining room is **less than 10⁻¹² in σ₀**, by an exact obstruction checked in `auto-research/edge_certificate.py`. For ℓ = 1/6 + 1/N with N > 0, feasibility requires N > 2910 + 96√921 ≈ 5823.406253854755. Thus N = 5824 is the best possible integer choice; the current record uses rational N = 1250000000/214651. To claim any remaining room:
The [exact limit proof](auto-research/track-a-exact-limit.md) establishes the sharp infimum of this frozen budget, including arbitrarily close strictly feasible rational points. The concurrent [PR #12](https://github.com/rohanarun/quasi-rh-hillclimb/pull/12) supplies the best integer choice `N=5824`, its necessary obstruction, and a fractional-N point less than 10⁻¹² above the limit. Check its current status before starting another search. The search recipe below starts from the historical main-branch certificate; do not report those submitted points as new.
The near-edge point submitted in [PR #12](https://github.com/rohanarun/quasi-rh-hillclimb/pull/12) is already within 10⁻¹² of the frozen-budget obstruction. The [independent Node replay](auto-research/track-a-independent-replay.md) checks it against the same formulas without Python or SymPy. Check current submissions before searching; the original integer-search recipe below starts from the historical N=5826 certificate, and the submitted N=5824 and fractional-N points must not be claimed again as new.

1. Pick rational N between 2910 + 96√921 and 1250000000/214651, and rational h near 0.8119602997.
2. Run `python certify.py N h --maxdepth 34`. Every side constraint must print `OK`, and the adaptive endpoint and denominator must print `True`.
3. If the Bernstein bisection gives up (prints `False`) close to the edge, raise `--maxdepth`, or subdivide more cleverly. A `False` is not a disproof.
4. Record the result (see "Reporting" below).

`auto-research/hillclimb.py` searches **integer N**: it numerically optimizes h for each candidate, then tries rational h values until one certifies. Its defaults use unit steps and depth 22, reproducing N = 5824. Use `certify.py` directly for fractional N. Reproducing either recorded point is not a new result.

### Track B: structural changes (where real progress is)

Within the frozen architecture, tuning cannot beat about 7/8 − 4.3·10⁻⁵. Real progress needs changing an input to the budget. `auto-research/whatif.py` measures how far σ₀ would move if a given input improved:

- `--alpha`: the sixth-power amplification slope (5/6 in the paper);
- `--cap`: a multiplier on the plain-moment capacity (2/9);
- `--floor`: the detector floor δ₀ (1/50, i.e. Re s = 0.51);
- `--z0`: the contour Re z (17/50).

Changing only `--cap`, with the other knobs at their defaults, cannot bypass the retained side constraints: they force σ₀ > 84031/96156 regardless of the adaptive count. The [exact side-constraint proof](auto-research/side-constraint-limits.md) also treats the intermediate range δ ≤ 3/4 justified by the assumed 7/8 theorem, where the corresponding limit is 368153/422028. These sharp idealized bounds show why the intermediate-row estimate must also improve; they do not establish ideal row counts or a new analytic endpoint.

The [fourth density-step result](auto-research/proposals/2026-10-27-fourth-density-step.md) completed its Lean integration and was accepted as tracker #85. The [wider-density extension](auto-research/proposals/2026-10-28-wider-density-range.md) builds on the stronger merged tracker #86, extending the proved count interface and separating the physical and count sources; see its current verification status above.
If each preceding bound is allowed to narrow that intermediate range further, the [exact bootstrap analysis](auto-research/bootstrap-side-limits.md) gives the sharp ideal-budget limit `(89309 + sqrt(2542433881))/160200`. Run `python auto-research/certify_bootstrap_side_limits.py`. The iteration uses incoming ceilings and hypothetical ideal adaptive counts; interpreting any step analytically still requires the corresponding all-Hecke count and continuation arguments.

Before treating that common-count obstruction as intrinsic, use the [split-floor refinement](auto-research/split-floor-limits.md): the inherited nonfloor count removes the `1/75` enlargement and lowers this ideal limit to approximately `0.8717357172`. Its exact phase diagram quantifies the additional density slope needed to reach `0.87` in the ideal budget.

Known results (see `README.md`): the binding obstruction at large scale is the **floor bin**, i.e. rows with zeros near Re s = 0.51 have no witness and get no saving. Promising directions:

1. A witness or saving for floor-bin rows.
2. A sharper low estimate than Z^{l_x/2 + b/12}. The [general completed-row bound](auto-research/completed-row-geometry.md) allows M + ℓ ≠ 1 but charges an explicit low-side loss; with that loss and the existing row counts, changing M alone cannot improve the frozen-budget obstruction. A useful extension must improve this bound or another structural input (`AUDIT_SUMMARY.md`, item 2).
3. A better row count R_*(δ, x) near δ ≈ 0.39, x = 1/2, which is where the endpoint binds.

**On the tracker chain (the `depth3/` setting) the same picture holds.** `auto-research/limits/` maps it at PR #68: θ there is driven almost entirely by the unmarked row-count exponent ρ(δ) = 1 − 10δ/(3(5−2δ)) (1% on its 10/3 is worth 1.7·10⁻⁵, while moment caps and more affine stages are worth ≤ 2·10⁻⁶). ρ has no cheap slack, and classical large-values bounds do not transfer; start from `auto-research/limits/README.md` before attempting a structural change there.
The [exact floor-bin analysis](auto-research/floor-bin-obstruction.md) specifies the idealization behind the earlier ≈ 0.864 ceiling. Removing the low estimate's b/12 term alone cannot reach 0.864 while h < 5ℓ is retained: at that target the same budget would need a floor-row power saving ρ > 281/51000. This is a necessary proof obligation, not a proved saving or a new endpoint.
The [constructive extension lemma](auto-research/frequency-extension.md) replaces the fixed `ℓ/d > 1/5` reserve by an explicit positive gap above `7/37` in the selected high-row argument. It supplies a rational extension width and a finite even slot count for any supplied positive mesh thresholds. Wider-budget applications must retain the other analytic and exponent constraints and include capacity allowances in the endpoint margin; the original certifier remains conservative.

A structural idea is only a **proposal** until the changed lemma is proved. Write it up in `auto-research/proposals/` with:

- the exact statement you need;
- the σ₀ it would give (from `whatif.py` or your own budget);
- what in the paper changes, with line numbers.

## Rules

1. **Exact or nothing.** Any new constant needs an exact certificate: rational arithmetic, Bernstein or SOS positivity, or interval arithmetic. Floating-point search only finds candidates.
2. **State conditions.** Say which preprint results and which edits you rely on.
3. **Do not re-certify the old point as new.** Check the table above first.
4. **Keep the audit trail.** If your change touches a lemma, list the affected lines of `build/paper.tex` in the preprint repo (openai/math, preprints/The-Quasi-Riemann-Hypothesis-September-30-2026).
5. **Negative results are welcome.** A proven ceiling under some idealization is useful. Put it in `auto-research/results.md`.

## Reporting

Append one row to `auto-research/results.md` and open a pull request:

| date | who | track | σ₀ (exact) | point / idea | evidence | status |

`status` is one of: `certified` (Track A, `certify.py` passes), `proposal` (Track B, lemma not proved), or `proved` (lemma proved, with a reference).

## Setup

```
pip install numpy scipy sympy
python certify.py                   # audited baseline
python certify.py 1250000000/214651 8119602997/10000000000 --maxdepth 34 # best Track A certificate (PR #12)
python auto-research/edge_certificate.py # exact frozen-budget obstruction and near-edge certificate
python auto-research/hillclimb.py   # Track A
python auto-research/whatif.py --alpha 0.75 --cap 1.5   # Track B
```

For an independent replay of the four known points, run `node auto-research/verify_track_a.mjs` (tested with Node.js 22; no Python or packages required for that command).
