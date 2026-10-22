# Quasi-RH: proof progress, contributors and zero-free boundaries

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

## Progress and Lean verification

**Strongest endpoint independently checked here: θ = 8747729897/10000000000 = 0.8747729897**, contributed by **Hailey Collet in [PR #8](https://github.com/rohanarun/quasi-rh-hillclimb/pull/8)**. On 22 October 2026, an independent native Lean 4.34.1 run rebuilt all **6,471** source modules, matched the canonical all-moduli Dirichlet statement, audited its axioms, and passed a fresh Lean kernel replay. Only `propext`, `Classical.choice` and `Quot.sound` were used; the proof sources are unchanged. [Verification report and receipts](verification/pr8-independent/README.md).

The [accepted tracker record](https://gtimg.github.io/QuasiRiemannTracker/) remains **θ = 0.8748087**, Zhongpai Gao's [tracker PR #68](https://github.com/GTimG/QuasiRiemannTracker/pull/68). PR #8's [tracker submission #69](https://github.com/GTimG/QuasiRiemannTracker/pull/69) still awaits Comparator/NanoDa/con-ron admission. Both statements concern nonvanishing for **Re(s) > θ**, with the principal pole excluded. Lower θ is stronger.

![Current best boundary in the cited results, independently verified in native Lean](graphs/pr8-comparison.png)

[SVG chart](graphs/pr8-comparison.svg) · [Exact comparison data](graphs/pr8-comparison.json) · [Contributor credits](CONTRIBUTORS.md). The chart compares the cited tracker catalogue with the independently checked PR #8 endpoint and restores the conditional contributions from PRs #1–3 and #6. Orange dashed lines group the conditional proposals by PR, with one label at each PR’s strongest bound and no orange dot markers. These are not Lean-verified endpoints; historical points retain their original timeline timestamps, while later refinements use their PR creation times. Each plotted point is labeled with its contributor, source PR where available, and boundary, connected by a leader line.

### Contributions in this repository

Snapshot: **22 October 2026**. PR numbers in this table refer to **this repository**; upstream links are explicitly labeled “tracker”. Merge status and Lean verification are separate columns. Conditional arithmetic certificates do not establish a complete Lean nonvanishing theorem. Author-reported Lean evidence means the submitted logs were inspected but the build was not independently replayed in this audit.

| PR / work | Contributor | Contribution and boundary | Lean verification status | PR state |
|---|---|---|---|---|
| [Initial research](AUDIT_SUMMARY.md) | Rohan Arun, with Claude | Track A: audited `20649/23600`; final-section certificate `10195/11652`; budget and architecture analysis | Exact arithmetic and written audit; conditional on the preprint; full endpoint not Lean-verified | On main |
| [#1](https://github.com/rohanarun/quasi-rh-hillclimb/pull/1) | Rohan Arun, with Claude; builds on ArviFoxy's tracker #67 | Three/four affine levels; four-level θ ≤ `0.874810282` | Conditional on H1–H5; exact arithmetic certificates; no complete Lean endpoint | Merged |
| [#2](https://github.com/rohanarun/quasi-rh-hillclimb/pull/2) | Sudarsh Chaturvedi (@Sudarsh3301), with Claude | Five/six levels under the width-floor test; six-level θ ≤ `0.874809989` | Conditional on H1–H5 and larger caps; no complete Lean endpoint | Merged |
| [#3](https://github.com/rohanarun/quasi-rh-hillclimb/pull/3) | Rohan Arun, with Claude | Constrained re-optimization; θ ≤ `0.874810187` at four levels and `0.874809963` at seven | Conditional on H1–H5; exact arithmetic certificates; no complete Lean endpoint | Merged |
| [#5](https://github.com/rohanarun/quasi-rh-hillclimb/pull/5) | Rohan Arun, with Claude | Structural leverage and method-limit analysis; no new proved boundary | Analysis only; literature references marked “memory” in the submission remain unchecked | Open |
| [#6](https://github.com/rohanarun/quasi-rh-hillclimb/pull/6) | Rohan Arun, with Claude; builds on Zhongpai Gao's tracker #68 | Sharper slot price; θ ≤ `0.874807887` at six stages | Conditional arithmetic certificate; Lean changes and complete endpoint proof pending | Open |
| [#7](https://github.com/rohanarun/quasi-rh-hillclimb/pull/7) | Rohan Arun, with Claude; Agent37 sponsorship | Contributor sandbox sponsorship and README support | Not applicable: documentation/support contribution | Merged |
| [#8](https://github.com/rohanarun/quasi-rh-hillclimb/pull/8) | Hailey Collet ([@HaileyStorm](https://github.com/HaileyStorm)), with substantial AI assistance and inherited credits | Standalone finite ordinary-source proof; θ = `0.8747729897` | **Independent native Lean replay passed:** 6,471 fresh modules, canonical endpoint, standard axioms, fresh kernel replay. [Evidence](verification/pr8-independent/README.md). Tracker three-kernel admission pending | Merged |
| [#9](https://github.com/rohanarun/quasi-rh-hillclimb/pull/9) | Rohan Arun, with Claude; based on Argonaut Math's overlay | Track A Lean anchor: `139999/160000 = 0.87499375` | **Author-reported** full Lean build, axiom audits and Comparator acceptance; [submitted evidence](https://github.com/rohanarun/quasi-rh-hillclimb/tree/a5f09d2c62efd512394e2c53b4234cde65abdfd5/lean-tau/evidence); not independently replayed here | Open |

The independent verification and comparison chart in this update were prepared by Rohan Arun with Codex (AI-assisted). Hailey Collet remains the sole human author of the PR #8 contribution; all inherited proof credits and licenses are retained. [PR metadata snapshot](verification/readme-progress/pull-requests.json).

**Structural budget proofs (23 October 2026):** Sagar Thakrar, with Codex, contributes [31 Lean theorems](lean-budget/README.md) formalizing the floor-bin bounds and constructive frequency/supply extension from PRs [#15](https://github.com/rohanarun/quasi-rh-hillclimb/pull/15) and [#19](https://github.com/rohanarun/quasi-rh-hillclimb/pull/19). The pinned standalone build passed all 31 standard-axiom checks, eight concrete checks and a fresh Lean kernel replay. These are algebraic lemmas under explicit hypotheses; they establish no new zero-free endpoint or analytic estimate.

### Upstream contributors and verified bounds

These **26 entries** come from the [tracker catalogue snapshot](verification/readme-progress/tracker-catalogue.json), retrieved on 22 October 2026. “Tracker verified” links to that entry's certificate; it reports the tracker's verification, rather than claiming a new independent rebuild of every row here. Decimal bounds below are rounded to 12 places; exact statements and source revisions are in the certificates. Useful non-record contributions remain listed and credited.

<!-- tracker-verification-table:start -->

| Contributor | Source | Boundary θ (approx.) | Lean verification status |
|---|---|---:|---|
| Classical Euler-product theorem | [Tracker #5](https://github.com/nielstron/QuasiRiemannTracker/pull/5) | 1 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/classical-euler-product.json) |
| OpenAI | [Checked source](https://github.com/GTimG/QuasiRiemannTracker/blob/d716ecaae80f7823a5b8314916364fdfa0d133fb/public/proofs/palomar-20261009/openai/src/Solution.lean) | 0.875 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/openai-baseline.json) |
| Argonaut Math | [Checked source](https://github.com/GTimG/QuasiRiemannTracker/blob/d716ecaae80f7823a5b8314916364fdfa0d133fb/public/proofs/argonaut-20261010-safe-replay/solution-src/Solution.lean) | 0.87499975 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/argonaut-20261008.json) |
| Baiying Liu | [Checked source](https://github.com/GTimG/QuasiRiemannTracker/blob/d716ecaae80f7823a5b8314916364fdfa0d133fb/public/proofs/liu-20261010-safe-replay/solution-src/Solution.lean) | 0.874957069799 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/liu-20261008.json) |
| Tim Gehrunger · ProofCouncil | [Checked source](https://github.com/GTimG/QuasiRiemannTracker/blob/d716ecaae80f7823a5b8314916364fdfa0d133fb/public/proofs/palomar-20261009/qrh/src/Solution.lean) | 0.874957019421 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/proofcouncil-20261009.json) |
| nielstron | [Checked source](https://github.com/GTimG/QuasiRiemannTracker/blob/d716ecaae80f7823a5b8314916364fdfa0d133fb/public/proofs/nielstron-algebraic-20261009-kernels/src/Solution.lean) | 0.87495701942 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/nielstron-algebraic-20261009.json) |
| Akash Levy | [Tracker #6](https://github.com/akashlevy/QuasiRiemannTracker/pull/6) | 0.874916666667 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/akashlevy-20261009-weighted-numerator.json) |
| Hailey Collet | [Tracker #8](https://github.com/HaileyStorm/QuasiRiemannTracker/pull/8) | 0.878787878788 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/single-prime-29-33-20261010.json) |
| Hailey Collet | [Tracker #9](https://github.com/HaileyStorm/QuasiRiemannTracker/pull/9) | 0.87488664704 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/cycle25-quartic-20261010.json) |
| nielstron | [Tracker #26](https://github.com/GTimG/QuasiRiemannTracker/pull/26) | 0.87487 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/local44-20261013.json) |
| Kari Roegnvaldsson | [Tracker #37](https://github.com/GTimG/QuasiRiemannTracker/pull/37) | 0.8748694 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/affine-local-20261013.json) |
| Kari Roegnvaldsson | [Tracker #38](https://github.com/GTimG/QuasiRiemannTracker/pull/38) | 0.87486797 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/reserve-local-20261013.json) |
| Zhongpai Gao | [Tracker #41](https://github.com/GTimG/QuasiRiemannTracker/pull/41) | 0.8748673 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/gao-asymmetric-reserves-20261013.json) |
| Hailey Collet | [Tracker #42](https://github.com/GTimG/QuasiRiemannTracker/pull/42) | 0.874861 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/cycle61-c0125139.json) |
| Zhongpai Gao | [Tracker #43](https://github.com/GTimG/QuasiRiemannTracker/pull/43) | 0.8748598 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/gao-cycle61-plane-20261013.json) |
| timbalud | [Tracker #48](https://github.com/GTimG/QuasiRiemannTracker/pull/48) | 0.874858 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/marked-high-count-20261014.json) |
| timbalud | [Tracker #50](https://github.com/GTimG/QuasiRiemannTracker/pull/50) | 0.8748559 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/radical-asymmetric-count-20261014.json) |
| Devin Watson | [Tracker #53](https://github.com/GTimG/QuasiRiemannTracker/pull/53) | 0.87486648 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/certb-local-20261013.json) |
| DaysSky | [Tracker #56](https://github.com/GTimG/QuasiRiemannTracker/pull/56) | 0.874846 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/detector-affine-c0125154.json) |
| Zhongpai Gao | [Tracker #60](https://github.com/GTimG/QuasiRiemannTracker/pull/60) | 0.87484 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/gao-affine-asymmetric-20261015.json) |
| Zhongpai Gao | [Tracker #62](https://github.com/GTimG/QuasiRiemannTracker/pull/62) | 0.874836 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/gao-directional-affine-20261016.json) |
| Zhongpai Gao | [Tracker #63](https://github.com/GTimG/QuasiRiemannTracker/pull/63) | 0.87483 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/gao-balanced-marked-20261017.json) |
| ArviFoxy | [Tracker #64](https://github.com/GTimG/QuasiRiemannTracker/pull/64) | 0.874835173 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/no-hardcoding-20261017.json) |
| Sil | [Tracker #66](https://github.com/GTimG/QuasiRiemannTracker/pull/66) | 0.874828524351 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/sil-uneven-normalization-20261019.json) |
| ArviFoxy | [Tracker #67](https://github.com/GTimG/QuasiRiemannTracker/pull/67) | 0.874817065 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/two-level-affine-20261019.json) |
| Zhongpai Gao | [Tracker #68](https://github.com/GTimG/QuasiRiemannTracker/pull/68) | 0.8748087 | [Tracker verified](https://gtimg.github.io/QuasiRiemannTracker/certificates/gao-five-step-affine-20261020.json) |

<!-- tracker-verification-table:end -->

## Original Track A claim (conditional)

Assume the preprint's theorem (zero-free for Re s > 7/8). Then every finite-order Hecke L-function over Q(√-3) has no zeros in

  **Re s > 20649/23600 = 7/8 − 1/23600 ≈ 0.8749576**

This covers every Dirichlet L-function, including ζ(s). It comes from re-running the preprint's Part II with the slot geometry

  ℓ = 2953/17700 (= 1/6 + 1/5900),  h = 405989/500000,

applying the edits listed in `AUDIT_SUMMARY.md`. This point is about 99% of the way to the method's limit: with every other structural choice frozen, the edge of feasibility is σ₀ ≈ 7/8 − 4.29·10⁻⁵. An earlier version of this note claimed 7/8 − 1/28000.

![The original conditional improvement past 7/8](graphs/improvement.png)

## Separate track: a third affine level for the Lean tracker (conditional)

The accepted record on the [QuasiRiemannTracker](https://github.com/GTimG/QuasiRiemannTracker) is Zhongpai Gao's PR #68, θ = 8748087/10000000 = 0.8748087. ArviFoxy's earlier PR #67 gives θ = 174963413/200000000 ≈ 0.874817065, already well below the conditional bound above. [`depth3/`](depth3/PROOF.md) extends PR #67's two affine levels to three and gets **θ ≤ 874812431/10⁹ ≈ 0.874812431**, about 4.6·10⁻⁶ lower, a fourth level gets **θ ≤ 0.874810282** (6.8·10⁻⁶ below PR #67), and re-optimising with the branch-D room held at the certifier threshold gets **θ ≤ 0.874810187** at four levels and **θ ≤ 0.874809963** at seven (7.1·10⁻⁶ below PR #67). On top of tracker PR #68 (Lean-proved 0.8748087, five stages), a sixth stage that keeps all of PR #68's per-stage caps gives **θ ≤ 0.874807999** (`python depth3/certify_gao_depth.py --six`), and eight stages with a larger ratio cap give 0.874806549. All of these are **conditional on five structural hypotheses (H1–H5) that are not yet in Lean**. The arithmetic is certified exactly (`python depth3/certify_depth3.py`, `--four`, `--four-tight`, `--seven`; the same code reproduces PR #67's own constants). It is not a tracker record until the full proof checks in Lean.

[Earlier timeline of tracker bounds and conditional affine proposals](graphs/timeline.png).

## Independently Lean-verified bound: finite ordinary source moments

Hailey Collet ([@HaileyStormC](https://x.com/HaileyStormC)) contributes a [standalone paper, exact Lean sources and verification receipts](submissions/hailey-collet-1252270103/README.md) for **Re(s) > 8747729897/10000000000 = 0.8747729897**, covering all Dirichlet characters with the principal pole excluded. This separate structural route includes the analytic arguments and exact finite certificates; its manuscript claims an unconditional theorem. An [independent native Lean 4.34.1 verification](verification/pr8-independent/README.md) on 22 October 2026 compiled all 6,471 source modules fresh, matched the canonical all-moduli Dirichlet endpoint, passed the axiom audit with only Lean's three standard axioms, and passed a fresh Lean kernel replay. The proof sources are unchanged. Tracker Comparator/NanoDa/con-ron acceptance remains pending. See the [Track B writeup](auto-research/proposals/2026-10-21-finite-ordinary-source-moments.md) for the proof route and evidence scopes. The existing conditional claims and audits elsewhere on this page retain their original scope.

The current comparison chart and PR verification table are shown in [Progress and Lean verification](#progress-and-lean-verification).

[QRH-Catalogue](https://github.com/HaileyStorm/QRH-Catalogue), used extensively for this work, is a public index of reusable QRH mathematics and formal components, open to source-backed contributions and corrections.

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

## Status of the original Track A audit

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
- `auto-research/plot_pr8_comparison.py`: regenerates the independently verified comparison chart; see the [verification report](verification/pr8-independent/README.md).
- `auto-research/update_readme_progress.py`: regenerates the upstream contributor/verification table from the retained tracker snapshot.
- `CONTRIBUTING.md`, `AGENTS.md`, `CONTRIBUTORS.md`: how to contribute, the agent quick start, and credits.
- `depth3/`: the conditional third affine level on top of tracker PR #67 (`PROOF.md`, `certify_depth3.py`, `model.py`, `reports/`).
- `upload.sh`: pushes this folder to GitHub.

## Sponsors

**Agent37** sponsors this repo: the first 100 contributors get Agent37 sandboxes for free to run experiments. To qualify, submit a PR following [auto-research.md](auto-research.md), and include your contact email in the PR description so we can send you the offer.

## License

[MIT](LICENSE) for the repository code and integration documentation, except externally authored proof artifacts under `submissions/hailey-collet-1252270103/`: those retain Apache-2.0 and inherited notices as documented in their [NOTICE](submissions/hailey-collet-1252270103/NOTICE.md). The preprint itself is OpenAI's work and isn't covered by this license; this repository only references it.
