# Cycle092 written record: c = 0.126667206

Hailey Collet · [@HaileyStormC](https://x.com/HaileyStormC) · HaileyCollet@gmail.com

**Formalization is in progress. The completed formalization will be submitted to [GTimG/QuasiRiemannTracker](https://github.com/GTimG/QuasiRiemannTracker) when complete.** This submission publishes the written proof and exact finite certificates; it does not claim a completed Lean proof or tracker admission.

The attained written result in the supplied Cycle092 packet is

\[
c=\frac{63333603}{500000000}=0.126667206,\qquad
\theta=\frac{436666397}{500000000}=0.873332794.
\]

For every fixed positive presented modulus q and every ordinary Dirichlet character χ modulo q, including imprimitive presentations, the manuscript's Theorem Q gives L(s,χ) ≠ 0 in the **strict** half-plane Re(s) > θ at every finite height, excluding s = 1 for a principal character. There is no boundary-line assertion or uniformity in growing moduli.

Theorem Q was attained in Local Cycle090 and carried unchanged by Cycle092. Its gain over the preceding local endpoint is exactly 1/1,000,000,000 in c. The source proof retains the full OpenAI/A–P foundations, including the expressly adopted natural selected-cell input **H6/SN9** stated in §3.3. This is a written result on those foundations; this submission does not newly prove the adopted input. The repository's conditional treatment of the preprint's 7/8 theorem is retained. The higher research targets in the original packet are not part of this record.

## Proof and certificates

- [Canonical complete Markdown proof](packet/CLOSED_PROOF.md), with the exact supplied bytes. Theorem Q appears at the beginning; Appendix Q contains the final refined return. Sections 2–3 and Appendices A–P retain the foundations and used analytic route.
- [Exact final finite-return certificate](packet/research/local_cycle090/controller/REFINED_126667206.json).
- [Source manifest](source-manifest.json), binding the canonical proof, exact arithmetic program, wrapper, source constants and original return cells to their supplied archive members and SHA256 hashes.
- [Replay entry point](replay.py), with the original arithmetic dependency closure under `packet/research/`.
- [Publication checks](evidence/publication-checks.json) and [package checksums](SHA256SUMS).

The canonical proof SHA256 is `c1876d05ad7376e6b9ecf91005b6be496d061b304cfd598adb54ac2603f87247`. The original supplied archive is `QRH_cycle092_consolidated.zip`, SHA256 `7a2684e5d946e784b3e0551f5f07fc882f752b302aad734674fb2f113d3394f9`.

## Reproduction

From this directory, using ordinary Python 3 with only the standard library:

```sh
python3 -B replay.py
python3 -B replay.py --recompute
```

The first command checks the exact supplied source/certificate identities, refined program identity, parameters and coverage identity. The second reconstructs the original relative-path layout in a temporary directory, runs the supplied exact-rational refinement, and requires its **entire output certificate to match the supplied certificate byte for byte**. It can take several minutes. Run without `-O`: the original arithmetic uses assertions, and the entry point refuses optimized Python. Neither command runs Lean or verifies the analytic argument.

The retained certificate reports all **57 original closed cells**, 2,045 central roots, 12,289 visited nodes, 2,561 complete four-way refinements, 9,681 mixed terminals, 47 added exterior pieces, 50 continuous stationary-node checks, and **zero unpaid terminals**. The coverage identity is 9,681 + 47 = 2,045 + 3 × 2,561. Its least normalized mixed price is 500541/10^15; its least mixed physical exponent reserve is 174177/10^15. These are exact finite inequalities under the manuscript's analytic source contracts, not a kernel certificate for the complete theorem.

The fresh publication replay passed in about 30 seconds and reproduced the complete supplied certificate byte for byte; its result is recorded in the publication checks.

The replay retains the original arithmetic code, fees, guards, contact enclosures and source normalizers. The supplied refinement narrows the two witness allowances and records the expanded program's identity. This package contains the proof and the arithmetic closure used for this endpoint, rather than the consolidated packet's research and operational history. Earlier analytic and formal source provenance remains identified in the manuscript.

## Credit, licence and catalogue

Hailey Collet directed this development and is the sole human author of the present contribution; research and drafting were substantially AI-assisted. Original contributions and inherited notices remain credited in the manuscript. These include OpenAI's probe and moment framework, Hailey Collet's earlier work, ArviFoxy, Sil, Joseph Bebel's marked/continuum/contact developments, SovereignSteak's two-ray and physical reductions, Joe Richey, Jacob Sussman, and the other contributors named in the proof. In particular the adopted PR95 source and tracker PRs129, 137, 141 and 143 keep their stated scopes; mentioning them does not assert fresh local verification of those sources.

[QRH-Catalogue](https://github.com/HaileyStorm/QRH-Catalogue) is the public catalogue of QRH mathematics and reusable formal components used throughout this research programme. It welcomes source-backed contributions and corrections, with exact source and verification pointers.

The contribution is supplied under [Apache-2.0](LICENSE), with inherited attribution and source-specific notices retained. See [NOTICE](NOTICE.md).
