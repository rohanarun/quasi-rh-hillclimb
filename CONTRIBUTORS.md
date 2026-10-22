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
| Sagar Thakrar (@thakrarsagar), with Codex (AI-assisted) | Track A final-section certificate at ℓ = 1/6 + 1/5824, h = 405967/500000, giving σ₀ = 20383/23296; exact audit-margin recomputation and reproducible evidence, using Rohan Arun and Claude's budget, Bernstein certifier, and audits. |
| Sagar Thakrar (@thakrarsagar), with Codex (AI-assisted) | Second Track A iteration: exact certificate at σ₀ = 4374785349/5000000000, less than 10⁻¹² above the frozen-budget obstruction; verifies that obstruction against the existing budget, credits its prior report by Daugherty, Ryan and Ward in issue #4, and recomputes all 21 numerical audit margins at the new point. |
