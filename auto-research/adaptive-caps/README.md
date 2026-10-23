# Adaptive per-stage width caps: θ = 0.87477127 (conditional)

23 October 2026. Subhanjan Das (@subhanjandas), with substantial assistance from
Claude (Anthropic).
**Status: conditional candidate, same status as [PR #27](https://github.com/rohanarun/quasi-rh-hillclimb/pull/27).** Exact finite
premises pass; Collet's analytic NF/NR theorems are inherited; no Lean
build or independent review.

## Change relative to PR #27

PR #27 used one width cap for every stage of a chain (0.044001 count,
0.043001 physical). Collet's NF rule (PR #8, feedback.tex NF8) allows a
separate cap at every node, and her own graph used caps rising from
0.029 to 0.055. The only requirements are the parent crossing
0 ≤ b× ≤ min(H, H₀) and the gates at both width endpoints.

Here each intermediate stage gets cap = (previous crossing) + 3·10⁻⁵;
the first stage (no previous crossing) and the final stage of each chain
use the cap the return needs.
The Λ step is also halved to 1/16000.

| Role | Λ step | Stages | Final B | Final Λ | Final cap | Cap range |
|---|---:|---:|---|---|---:|---|
| Count | 1/16000 | 21,527 | 0.96259477724252 | 3.1518733 | 0.044001 | first stage 0.044001; then 0.01318 rising to 0.04235; last stage 0.044001 |
| Physical | 1/16000 | 19,529 | 0.96770987541485 | 3.2767483 | 0.043001 | first stage 0.043001; then 0.01318 rising to 0.03963; last stage 0.043001 |

Return: θ = 87477127/100000000, h = 80008783/100000000, width 1/25,
reserve 10⁻⁹. Natural premise, accounting and 0.499 terminal unchanged.

## Exact results

| Check | Result |
|---|---|
| NF source graph (41,056 stages, 38,355 distinct caps) | Passes; interpolation cross-checks on every density polynomial |
| Return at θ = 0.87477127 | Passes; 224 boxes, 49 admissions, 33 reserves; least return coefficient ≈ 4.83·10⁻⁹ |
| Same graph at θ = 0.87477126 | **Rejected** (box on `new_top`, δ ≈ 0.4578, p = 1/2) |
| Graph SHA-256 (canonical) | `73c5997d093c94f938faf6e14b1ea8a2e22af4aaf48cdf53cc37e09c37f665f6` |

So this graph's exact edge lies in (0.87477126, 0.87477127].

## How much this is worth

About 10⁻⁸ below PR #27. Adaptive caps alone raise the count face's B by
1.83·10⁻⁶ at equal Λ (θ gain ≈ 7·10⁻⁹ per chain); halving the step adds
a few 10⁻⁹. This confirms PR #27's conclusion that finite tuning of this
framework is exhausted at the 10⁻⁸ level.

## Not Lean-verified

The exact checks here are rational-arithmetic Python replays (PR #26/#27
verifiers, unchanged). A Lean endpoint would require instantiating Collet's
formal NF step and parameterized return with this 41,056-stage graph and
compiling her full 6,471-module closure; that has not been done.

## Reproduce

From the repository root (Python ≥ 3.10, SymPy):

```sh
python auto-research/adaptive-caps/replay.py      # exact, about 10 minutes
```

Saved outputs are in `evidence/` (`replay.log` from this location,
`clean-copy-replay.log` from an independent clean copy,
`negative-control.log` for the rejection at 0.87477126).

Search (floating point, candidates only): `adaptive_final.py` with steps
`.0000625`, final caps `.044001` / `.043001`, targets `.04232527914` /
`.03960260713`, margin `3e-5`, then `combine.py`.

`nf_source.py`, `return_budget.py`, `search.py`, `search_model.py` and
`combine.py` are byte-identical copies of PR #26's verifiers; `certify.py` is
PR #27's parameterized wrapper. They are copied so this folder runs on `main`.
Their SHA-256 values, the base commits and the environment are pinned in
[`INPUTS.json`](INPUTS.json); attribution is in [`NOTICE.md`](NOTICE.md).

## Credits

Hailey Collet (PR #8) authored the NF source rule, the parameterized return and
the original cover; OpenAI the QRH framework; Rohan Arun and the repository's
contributors the audit and tools; PR #26 (Subhanjan Das with OpenAI Codex) the
verifiers. New material is MIT; inherited material keeps its licenses.
