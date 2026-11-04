# A zero-free half-plane from finite ordinary source moments

Hailey Collet · [@HaileyStormC](https://x.com/HaileyStormC) · HaileyCollet@gmail.com

The attached standalone manuscript proves the strict zero-free boundary

**Re(s) > 8747729897/10000000000 = 0.8747729897**, equivalently **c = 1252270103/10000000000**.

The statement covers every presented Dirichlet character, every positive modulus, and ζ(s), excluding the principal pole at s = 1. The manuscript also gives the finite-order Hecke statement over Q(√−3). There is no claim on the boundary itself. The final Lean theorem has no additional analytic hypothesis.

This is a structural contribution with a complete written proof and a substantial checked Lean development. The manuscript builds on the accepted two-level affine bootstrap of tracker PR #67, includes the analytic source and return arguments, and discharges its finite premises with exact certificates. Its claimed theorem is unconditional; it is not one of this repository's H1–H5 proposals. Independent exact-head tracker acceptance is still pending.

## Read and reproduce

- [Standalone paper, PDF](paper/paper.pdf), 138 pages; [TeX entry](paper/main.tex), with all eight included sections alongside it.
- [Complete used Lean source archive](lean-sources.zip), 6,471 source modules, exact package/toolchain pins and source provenance. Entry: `src/Candidate/Main.lean`, theorem `Candidate.bound`.
- [Structural writeup](../../auto-research/proposals/2026-10-21-finite-ordinary-source-moments.md).
- [Verification summary](verification/summary.json), [completed closure receipts](verification/resumed-closure.json), [earlier component checks](verification/component-checks.json), [successful compiler logs](verification/logs/), and the [separate axiom-audit source](verification/CandidateAudit.lean).
- [Exact source inventory](verification/source-inventory.json) and [SHA256SUMS](SHA256SUMS). Run `python3 verification/check_bundle.py` to check the package and every archived Lean source hash. That integrity check does not rerun Lean.

Frozen source revision: [`ac76d5ef6008d976a7b8f3c1d921af2317e79ce9`](https://github.com/HaileyStorm/QuasiRiemannTracker/tree/ac76d5ef6008d976a7b8f3c1d921af2317e79ce9). For full formal reproduction, use `verifier/standard` at that revision with Lean 4.34.1 and its pinned packages, Comparator and kernel tools. The ZIP preserves all source bytes from that revision. Only its packaging README and metadata link were updated to describe the actual verification status; the original and packaged ZIP hashes are recorded in the summary. Compiled objects are not portable certificates and are not bundled.

## Verification completed

| Check | Actual result and scope |
|---|---|
| Entire used Lean closure in development | **6,471 modules covered:** a 6,431-module clean compilation prefix, then all 40 missing modules compiled with whole-process exit 0 using those dependency objects. Two instance-selection corrections were integrated before the successful completion. This is a completed resumed development build. |
| Final theorem axiom audit | **`Candidate.bound` audit exited 0**, reporting only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`. The exact audit source, output and source/object/receipt hashes accompany the submission. |
| Finite scalar certificate development | **657 modules and 2,953 theorem/lemma audits passed**, with only the same standard axioms. Includes the source-graph, bootstrap, return-rectangle and admission checks. These are earlier component-stage counts; the ZIP contains the used closure. |
| Divisor-kernel and absolute-mass component | **14 modules, 94 theorem audits passed**, compiling the new component from an empty object directory with verified dependency objects. |
| Squarefree-to-global restoration | **22 modules, 96 declaration audits passed**, likewise using verified dependencies. Later closure assembly supplies the source-existence premises. |
| Protected tracker source compilation | At the frozen revision, **2,923 cache hits + 3,305 fresh successful compilations = 6,228/6,471 modules** before the shared 10,800-second verification budget expired. [Run 39666255945](https://github.com/GTimG/QuasiRiemannTracker/actions/runs/39666255945), attempt 1. |
| This repository's baseline | `certify.py` exited 0: adaptive endpoint `True`, all listed checks `OK`. [Output](verification/repository-baseline-certify.log). This reproduces this repository's existing parameter point; the new theorem is supported by the attached proof and Lean certificates. |

A single fresh full replay of all dependencies and the final exact-head canonical Comparator plus **Lean/NanoDa/con-ron** endpoint acceptance remain outstanding. No complete endpoint three-kernel certificate is claimed or included. The JSON files are public projections of retained local source-bound receipts, with local machine paths removed; they are unsigned development evidence. The component counts and cache counts have their stated scopes and must not be added together as independent fresh checks.

[Tracker PR #69](https://github.com/GTimG/QuasiRiemannTracker/pull/69) contains the same frozen source and the verification-capacity discussion. This hillclimb contribution submits the complete written proof and available formal evidence for review under this repository's submission model.

## Exact certificates and proof route

The paper's source graph retains actual arithmetic coefficients, natural character zeros, common punctures, six units, root multiplicities, independent heights and common profiles. The accepted two-level affine input first yields a 64-face bootstrap and the intermediate boundary 8747759/10000000. That improved bound supplies the natural cost 11243277/2500000 for 221 selected derived source faces. Their two ordinary moments enter the same-zero count and final Mellin return. The paper prints the required exact rational data and finite certificates; the Lean archive contains their proofs and analytic assembly.

## QRH-Catalogue and credit

I am also introducing [QRH-Catalogue](https://github.com/HaileyStorm/QRH-Catalogue), a public catalogue of QRH mathematics and reusable formal components. I used it extensively to find and reuse components for these improvements. It welcomes source-backed contributions and corrections; its entries distinguish source statements, checked components and verification receipts.

Hailey Collet is the sole human author. Research, drafting and Lean development were substantially AI-assisted. [The paper's attribution](paper/attribution.tex), [NOTICE](NOTICE.md) and the archive's source-by-source provenance credit OpenAI, Akash Levy, Hailey Collet's earlier developments, Zhongpai Gao, timbalud, DaysSky, related arithmetic prepared for liqsweep, and ArviFoxy's two-level bootstrap. AI assistance is not independent verification.

## Licensing

New repository integration documentation follows this repository's Apache License 2.0. The bundled Hailey Collet manuscript and Lean code are **Apache-2.0** ([license](LICENSE-APACHE-2.0)); inherited code retains its original notices and terms as recorded in the archive. These externally authored proof artifacts are supplied under their stated licenses, not relicensed by this PR. The root license statement is qualified accordingly.
