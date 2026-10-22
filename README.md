# Quasi-RH: pushing the zero-free half-plane slightly past 7/8

> **We're now sponsored by Agent37, so the first 100 contributors get Agent37 sandboxes for free to run experiments!** To qualify, submit a PR using our [auto-research.md](auto-research.md) and include your contact email in the PR description to redeem the offer. See [Sponsors](#sponsors).

A follow-up to OpenAI's preprint *The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane Re(s) > 7/8*
(30 September 2026, `openai/math`, preprints/The-Quasi-Riemann-Hypothesis-September-30-2026).
The 5 October 2026 companion preprint in the same repository proves 11/12 only, so 7/8 is the preprint's best bound.

> **AI agents and automated researchers: start with [auto-research.md](auto-research.md).** It covers the current record, the inequality being optimized, the two research tracks (parameter hill-climbing and structural changes), the tools in `auto-research/`, and how to report results. Then read [CONTRIBUTING.md](CONTRIBUTING.md). [AGENTS.md](AGENTS.md) is a five-step quick start.
>
> ```
> pip install numpy scipy sympy
> python certify.py                             # verify the current point (about 1 s)
> python auto-research/hillclimb.py             # Track A: search and certify (ℓ, h)
> python auto-research/whatif.py --alpha 0.75   # Track B: what would a better input buy?
> ```

![The improvement past 7/8](graphs/improvement.png)

## Claim (conditional, see Status)

Assume the preprint's theorem (zero-free for Re s > 7/8). Then every finite-order Hecke L-function over Q(√-3) has no zeros in

  **Re s > 20649/23600 = 7/8 − 1/23600 ≈ 0.8749576**

This covers every Dirichlet L-function, including ζ(s). It comes from re-running the preprint's Part II with the slot geometry

  ℓ = 2953/17700 (= 1/6 + 1/5900),  h = 405989/500000,

applying the edits listed in `AUDIT_SUMMARY.md`. This point is about 99% of the way to the method's limit: with every other structural choice frozen, the edge of feasibility is σ₀ ≈ 7/8 − 4.29·10⁻⁵. An earlier version of this note claimed 7/8 − 1/28000.

## Separate track: a third affine level for the Lean tracker (conditional)

The Lean-verified record is on the [QuasiRiemannTracker](https://github.com/GTimG/QuasiRiemannTracker): ArviFoxy's PR #67, θ = 174963413/200000000 ≈ 0.874817065, well below the bound above. [`depth3/`](depth3/PROOF.md) extends PR #67's two affine levels to three and gets **θ ≤ 874812431/10⁹ ≈ 0.874812431**, about 4.6·10⁻⁶ lower, a fourth level gets **θ ≤ 0.874810282** (6.8·10⁻⁶ below the record), and re-optimising with the branch-D room held at the certifier threshold gets **θ ≤ 0.874810187** at four levels and **θ ≤ 0.874809963** at seven (7.1·10⁻⁶ below the record). On top of tracker PR #68 (Lean-proved 0.8748087, five stages), a sixth stage that keeps all of PR #68's per-stage caps gives **θ ≤ 0.874807999** (`python depth3/certify_gao_depth.py --six`), and eight stages with a larger ratio cap give 0.874806549. All of these are **conditional on five structural hypotheses (H1–H5) that are not yet in Lean**. The arithmetic is certified exactly (`python depth3/certify_depth3.py`, `--four`, `--four-tight`, `--seven`; the same code reproduces PR #67's own constants). It is not a tracker record until the full proof checks in Lean.

## Separate track: a Lean-verified point on the ℓ line

[`lean-tau/`](lean-tau/README.md) raises τ = ℓ − 1/6 from 10⁻⁶ to 1/40000 in Argonaut Math's Lean overlay of the OpenAI formalization. It proves **Re s > 139999/160000 = 7/8 − 1/160000** in Lean, with no dependence on the preprint beyond its Lean proof. A clean build, both axiom audits and Comparator all pass. This is weaker than the conditional points above. It is the first Lean anchor on this line, and it shows that the Lean proof stops at τ ≈ 2.965·10⁻⁵, where a central-budget split binds. The folder lists what it would take to bring 7/8 − 1/23600 into Lean.

![The best boundary over time, with contributors](graphs/timeline.png)

## Main structural facts

1. **Closed form of the boundary.** With l_x = 1 + ℓ − h and M + ℓ = 1, the low estimate Z^{l_x/2 + b/12} and the Mellin exponent C(s) = l_x/2 + s − 1 + h/6 meet at **σ₀ = 11/12 − ℓ/4** (h cancels). Part I (ℓ = 0) gives 11/12, and the preprint's ℓ = 1/6 gives 7/8.
2. **The preprint's constants are near-optimal.** The binding inequality is Lemma *balanced-endpoint*. Its true slack is about 2.3·10⁻⁴ (the paper certifies 1.1·10⁻⁴). The edge of feasibility is ℓ ≈ 1/6 + 1.717·10⁻⁴.
3. **M + ℓ = 1 is the right choice.** Freeing M gives σ₀ = 5/6 + M/12 − ℓ/6. The most efficient direction needs M + ℓ > 1, and the completed-row norm lemma rules that out.
4. **Ceiling of the architecture.** Keep the other structural choices frozen: the detector floor at 51/100, the contour at Re z = 17/50, and the probe scale relations. Then:
   - perfect row counts give σ₀ ≥ 167/192 ≈ 0.8698;
   - a perfect additive large sieve gives about 0.864.

   The obstruction is the floor bin, not the moment estimates.

## What is checked, and how

- **Exactly** (`certify.py`, rational arithmetic, about 1 second):
  - the adaptive endpoint inequality, via Bernstein positivity on 18 boxes;
  - every other inequality of the final section;
  - as a sanity check, the preprint's own point (1/6, 13/16) also certifies.
- **By a line-by-line reading** of lines 3723–16677 of `build/paper.tex`: every Part I lemma that Part II invokes, and all of Part II, including the moment inductions. Reports A–F are in `audit/`, and `AUDIT_SUMMARY.md` lists every required edit. Most are constant changes. Two carry mathematical content:
  - the preprint's second Euler region (x_r ≥ 7/8) must be lowered to x_r ≥ σ₀, which holds with wide margins;
  - the completed-row norm picks up an extra loss below 3/11800, which the low estimate absorbs.

## Status: read before citing

- **Not formally verified.** The audit is an AI-assisted reading, not a referee report. A human expert should check the Euler-region and row-norm edits in particular. Lines 1–3723 were not re-read.
- **Inherits the preprint's status.** The preprint has not been fully refereed, and its Lean formalization covers 7/8 only.
- **Next step.** Write the edits into a patched `paper.tex`.

## Contributing

Contributions from humans and agents are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for how to claim a task, report a result or a mathematical issue, and what counts as evidence. Every new constant needs an exact certificate. Log results in [auto-research/results.md](auto-research/results.md); [CONTRIBUTORS.md](CONTRIBUTORS.md) credits everyone who helps. The most valuable open tasks:

- an expert review of the two substantive edits in `AUDIT_SUMMARY.md`;
- a patched `paper.tex` applying every edit;
- a Lean check of `certify.py`;
- a structural change that beats the ceiling (see `auto-research.md`, Track B).

## Files

- `budget.py`: the Part II exponent budget for general (ℓ, h).
- `certify.py`: an exact certificate. By default it checks (ℓ, h) = (2953/17700, 405989/500000). Run `python certify.py N h` to check ℓ = 1/6 + 1/N.
- `optimize.py`, `edge.py`: a numerical search for the feasibility edge.
- `leverage.py`: sensitivity to the amplification slope and the plain capacity.
- `AUDIT_SUMMARY.md`, `audit/*.md`: the line-by-line audit.
- `auto-research.md`, `auto-research/`: instructions and tools for agents continuing the hill-climb (`hillclimb.py`, `whatif.py`, `results.md`, `proposals/`). The pipeline already found a slightly better final-section certificate, 7/8 − 1/23304; see `auto-research/results.md`.
- `auto-research/plot_improvement.py`: regenerates `graphs/improvement.png`.
- `CONTRIBUTING.md`, `AGENTS.md`, `CONTRIBUTORS.md`: how to contribute, the agent quick start, and credits.
- `lean-tau/`: the Lean-verified τ = 1/40000 point (patch, build/audit/Comparator evidence); `.github/workflows/lean-tau-comparator.yml` re-runs Comparator.
- `depth3/`: the conditional third affine level on top of tracker PR #67 (`PROOF.md`, `certify_depth3.py`, `model.py`, `reports/`).
- `upload.sh`: pushes this folder to GitHub.

## Sponsors

**Agent37** sponsors this repo: the first 100 contributors get Agent37 sandboxes for free to run experiments. To qualify, submit a PR following [auto-research.md](auto-research.md), and include your contact email in the PR description so we can send you the offer.

## License

[MIT](LICENSE) for the code and documentation in this repository. The preprint itself is OpenAI's work and isn't covered by this license; this repository only references it.
