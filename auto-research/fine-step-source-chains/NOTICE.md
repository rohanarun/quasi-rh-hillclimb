# Attribution and licensing

**New in this contribution** (finer source graph, exact receipt,
parameterized certifier wrapper, negative-control extension, diagnostics
and all prose): prepared for Subhanjan Das (@subhanjandas) with substantial
assistance from Claude (Anthropic). Offered under the repository's MIT
License.

**Reused verbatim from PR #26** (Subhanjan Das, with substantial OpenAI
Codex assistance): `nf_source.py`, `return_budget.py`, `search.py`,
`search_model.py`, `combine.py`, and the `adapted_cover` routine in
`certify.py`. They are copied so this directory runs on upstream `main`
without PR #26 being merged. Their SHA-256 values are pinned in
`INPUTS.json`, so a reviewer can confirm they are unchanged.

**Mathematics.** The NF ordinary-source rule, the natural premise, the
parameterized physical/Mellin return and the original certificate cover
are Hailey Collet's work (PR #8). OpenAI supplies the underlying QRH
framework. The manuscript and Lean archive under
`submissions/hailey-collet-1252270103/` keep their Apache-2.0 and
source-specific notices; they are read, not modified or relicensed.
Their [NOTICE](../../submissions/hailey-collet-1252270103/NOTICE.md) and
[attribution account](../../submissions/hailey-collet-1252270103/paper/attribution.tex)
credit OpenAI, Akash Levy, Hailey Collet, Zhongpai Gao, timbalud, DaysSky,
ArviFoxy and other contributors.

Rohan Arun, with Claude, supplies the repository's audit, budget
reconstruction, certificates and research harness.

No independent expert review and no successful Lean build of the changed
endpoint are represented by this notice.
