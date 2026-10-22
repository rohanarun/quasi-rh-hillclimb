# Auto-research: instructions for agents

This file is for automated research agents (and humans) who want to push the Quasi-RH zero-free half-plane further. Read it fully before you start.

## Current state

See the README's [PR progress and Lean verification tables](README.md#progress-and-lean-verification) for contributor credits, open proposals, submitted verification evidence and tracker certificates.

| | value |
|---|---|
| Independently Lean-verified source-moment endpoint | θ = 8747729897/10000000000; [fresh 6,471-module build, canonical endpoint, standard-axiom audit and fresh Lean kernel replay passed](verification/pr8-independent/README.md); tracker three-kernel admission pending |
| Preprint bound (OpenAI, 30 Sep 2026) | Re s > 7/8 |
| Best audited here | **Re s > 20649/23600 = 7/8 − 1/23600** |
| Best certified (final section only) | Re s > 10195/11652 = 7/8 − 1/23304 (ℓ = 1/6 + 1/5826, h = 405967/500000) |
| Point | ℓ = 2953/17700 (= 1/6 + 1/5900), h = 405989/500000 |
| Edge of the frozen architecture | σ₀ ≈ 7/8 − 4.293·10⁻⁵ (ℓ ≈ 1/6 + 1.7172·10⁻⁴) |
| Ceiling with idealized inputs | ≈ 0.864 (perfect row counts and large sieve) |
| Accepted Lean tracker record (separate admission) | θ = 0.8748087 (QuasiRiemannTracker PR #68) |
| Constructive frequency/supply extension | With a strict endpoint margin and 1/2 ≤ h < 1, supply above 7/37 extends iff 37ℓ > 7h; [exact lemma, slot construction and scope](auto-research/frequency-extension.md). No new endpoint; `certify.py` retains h < 5ℓ. |
| Conditional nested levels on PR #67 | θ ≤ 0.874812431 (three levels), θ ≤ 0.874810282 (four levels), θ ≤ 0.874809989 (six levels, larger H4 caps), conditional on H1–H5 (`depth3/PROOF.md`) |

The original hill-climb results are conditional on the preprint's 7/8 theorem. The separately submitted source-moment manuscript states an unconditional theorem and records its distinct verification scope. See `README.md` and `AUDIT_SUMMARY.md`.

## The model you are optimizing

The boundary is **σ₀ = 11/12 − ℓ/4**. To lower σ₀, increase ℓ while every inequality in the final section of the preprint still holds. The binding one is the adaptive endpoint inequality (Lemma *balanced-endpoint*):

  E_*(δ, x) < 0 for all δ ∈ [0, 5/6], x ∈ [0, 1/2],

where E_* is the high exponent at d = h with the balanced row count R_*. The code is in `budget.py`, and the exact form is in `certify.py` (`adaptive_poly`).

## Two tracks

### Track A: parameter hill-climbing (small gains, easy to verify)

The remaining room is about 2·10⁻⁸ in σ₀ (the edge is ℓ − 1/6 ≈ 1/5823.4), so Track A is nearly exhausted. To claim any of it:

1. Pick a rational ℓ = 1/6 + 1/N with N < 5826, and a rational h near 0.811978.
2. Run `python certify.py N h`. Every line must print `OK`, and the adaptive endpoint must print `True`.
3. If the Bernstein bisection gives up (prints `False`) close to the edge, raise `maxdepth` in `prove_positive`, or subdivide more cleverly. A `False` is not a disproof.
4. Record the result (see "Reporting" below).

`auto-research/hillclimb.py` automates this: it finds the numerical edge, then tries rational candidates from the edge inward until one certifies.

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
python certify.py                   # current best, about 1 s
python auto-research/hillclimb.py   # Track A
python auto-research/whatif.py --alpha 0.75 --cap 1.5   # Track B
```
