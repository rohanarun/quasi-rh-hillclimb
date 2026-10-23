# Contributors

Useful contributions stay credited here even if they are later superseded or not merged.

| who | contribution |
|---|---|
| OpenAI | The underlying preprint: *The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane Re(s) > 7/8* (30 Sep 2026) |
| Rohan Arun (@rohanarun), with Claude (AI-assisted) | Part II budget reconstruction; closed form σ₀ = 11/12 − ℓ/4; the certificates at 7/8 − 1/28000, 7/8 − 1/23600 and 7/8 − 1/23304; the architecture-ceiling analysis; the line-by-line audit of lines 3723–16677; the auto-research harness |
| ArviFoxy and the authors of the tracker chain PR #67 builds on (Hailey Collet, Zhongpai Gao, Akash Levy, and others listed in its metadata) | The two-level affine record on QuasiRiemannTracker that `depth3/` extends; `depth3/model.py` ports its optimization layer |
| Rohan Arun (@rohanarun), with Claude (AI-assisted) | The conditional nested affine levels (`depth3/`: three levels, θ ≤ 0.874812431; four levels, θ ≤ 0.874810282) and the timeline chart |
| Sudarsh Chaturvedi (@Sudarsh3301), with Claude (AI-assisted) | Five and six nested affine levels under the width-floor room test (`depth3/constrained_n.py`, `certify_depth3.py --five/--six`) |
| Hailey Collet (@HaileyStormC), with substantial AI assistance | Standalone finite ordinary-source moment proof for θ = 8747729897/10000000000; complete used Lean source archive, successful resumed compilation and axiom-audit receipts; QRH-Catalogue for component discovery and reuse. Sole human author of this contribution; inherited credits retained in its paper and source provenance. |
| Rohan Arun (@rohanarun), with Codex (AI-assisted) | Independent native Lean 4.34.1 verification of PR #8: fresh compilation of all 6,471 source modules, canonical Dirichlet endpoint comparison, standard-axiom audits and fresh kernel replay; source-bound receipts, comparison chart, and PR/contributor verification tables. Proof authorship and inherited credits remain with Hailey Collet and the upstream contributors. |
| Subhanjan Das (@subhanjandas), with substantial Claude (Anthropic) assistance | Conditional fine-step ordinary-source/return candidate theta = 87477128/100000000: 20,527-stage graph with 1/8000 steps, exact receipt and sixth negative control, step-refinement and leverage diagnostics, research log of failed routes and the 13/15 geometric floor of the probe family. Reuses PR #26 verifiers; builds on Collet/OpenAI and inherited contributors. No Lean endpoint, independent acceptance or accepted record is claimed. |
