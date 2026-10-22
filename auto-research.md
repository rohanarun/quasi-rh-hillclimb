# Auto-research: instructions for agents

This file is for automated research agents (and humans) who want to push the Quasi-RH zero-free half-plane further. Read it fully before you start.

## Current state

See the README's [PR progress and Lean verification tables](README.md#progress-and-lean-verification) for contributor credits, open proposals, submitted verification evidence and tracker certificates.

| | value |
|---|---|
| Independently Lean-verified source-moment endpoint | θ = 8747729897/10000000000; [fresh 6,471-module build, canonical endpoint, standard-axiom audit and fresh Lean kernel replay passed](verification/pr8-independent/README.md); tracker three-kernel admission pending |
| Preprint bound (OpenAI, 30 Sep 2026) | Re s > 7/8 |
| Best audited here | **Re s > 20649/23600 = 7/8 − 1/23600** |
| Best certified Track A (final section only) | Re s > 4374785349/5000000000 = 0.8749570698 (ℓ = 625643953/3750000000, h = 8119602997/10000000000); [exact evidence and audit scope](auto-research/track-a-near-edge.md) |
| Audited point | ℓ = 2953/17700 (= 1/6 + 1/5900), h = 405989/500000 |
| Exact obstruction in the frozen budget | Every feasible point requires σ₀ > (1507 − 2√921)/1653; [algebra checked against the budget](auto-research/track-a-near-edge.md), matching the prior report in issue #4 |
| Ceiling with idealized inputs | ≈ 0.864 (perfect row counts and large sieve) |
| Accepted Lean tracker record (separate admission) | θ = 0.8748087 (QuasiRiemannTracker PR #68) |
| Conditional nested levels on PR #67 | θ ≤ 0.874812431 (three levels), θ ≤ 0.874810282 (four levels), θ ≤ 0.874809989 (six levels, larger H4 caps), conditional on H1–H5 (`depth3/PROOF.md`) |

The original hill-climb results are conditional on the preprint's 7/8 theorem. The separately submitted source-moment manuscript states an unconditional theorem and records its distinct verification scope. See `README.md` and `AUDIT_SUMMARY.md`.

## The model you are optimizing

The boundary is **σ₀ = 11/12 − ℓ/4**. To lower σ₀, increase ℓ while every inequality in the final section of the preprint still holds. The binding one is the adaptive endpoint inequality (Lemma *balanced-endpoint*):

  E_*(δ, x) < 0 for all δ ∈ [0, 5/6], x ∈ [0, 1/2],

where E_* is the high exponent at d = h with the balanced row count R_*. The code is in `budget.py`, and the exact form is in `certify.py` (`adaptive_poly`).

## Two tracks

### Track A: parameter hill-climbing (small gains, easy to verify)

The remaining room is **less than 10⁻¹² in σ₀**, by an exact obstruction checked in `auto-research/edge_certificate.py`. For ℓ = 1/6 + 1/N with N > 0, feasibility requires N > 2910 + 96√921 ≈ 5823.406253854755. Thus N = 5824 is the best possible integer choice; the current record uses rational N = 1250000000/214651. To claim any remaining room:

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

Known results (see `README.md`): the binding obstruction at large scale is the **floor bin**, i.e. rows with zeros near Re s = 0.51 have no witness and get no saving. Promising directions:

1. A witness or saving for floor-bin rows.
2. A sharper low estimate than Z^{l_x/2 + b/12}, or a probe where M + ℓ > 1 is allowed. The completed-row norm lemma is what forbids it now (`AUDIT_SUMMARY.md`, item 2).
3. A better row count R_*(δ, x) near δ ≈ 0.39, x = 1/2, which is where the endpoint binds.

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
python certify.py 1250000000/214651 8119602997/10000000000 --maxdepth 34 # best Track A certificate
python auto-research/edge_certificate.py # exact frozen-budget obstruction and near-edge certificate
python auto-research/hillclimb.py   # Track A
python auto-research/whatif.py --alpha 0.75 --cap 1.5   # Track B
```
