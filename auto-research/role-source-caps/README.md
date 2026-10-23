# Role-specific source caps: a conditional theta = 0.87477137 proposal

Prepared by Subhanjan Das (@subhanjandas), with substantial OpenAI Codex
assistance. 23 October 2026.

**Status: proposal. The finite rational certificate passes; the changed
zero-free endpoint is not Lean-verified or independently accepted.**

This extends Hailey Collet's ordinary-source construction from [PR #8](https://github.com/rohanarun/quasi-rh-hillclimb/pull/8).
It supplies a different finite source graph and recomputes its return at

```math
\theta=\frac{87477137}{100000000}=0.87477137.
```

The analytic source and return theorems are inherited, rather than proved
anew here. Their application to this graph and geometry remains an explicit
proof obligation. This is not a claimed accepted record, an unconditional
new theorem, an RH proof, or an additional interior zero-free band.
The repository's existing independently checked endpoint remains separate.

## The idea in plain language

A source face controls ordinary moments on a region described by
`m1 + m2 + Lambda*s <= B`, with an upper marked-width cap. A proved face can
feed the next source's LOW and HIGH estimates. Repeating that finite step
improves the useful region. The graph must be acyclic: a new face cannot
assume its own conclusion.

The final return uses source estimates for two different jobs: counting
rows, and bounding the physical numerator. They need not use the same
source chain or the same global width cap. We search them separately,
keeping the inherited analytic gates and accounting unchanged. A finer
count-chain slope step and a more closely matched physical cap produce
the saved candidate below. This is a small improvement inside Collet's
framework, not a new cancellation theorem.

| Role | Selected source | Stages | B | Lambda | Global cap |
|---|---|---:|---:|---:|---:|
| Count | `count_2691` | 2,691 | .96258631988264 | 3.1518108 | .044001 |
| Physical numerator | `physical_1220` | 1,220 | .96772063836150 | 3.2773108 | .043001 |

Both chains start from the inherited natural face
`G(1, 11243277/2500000, 11/200)`. Every LOW and HIGH parent is an earlier
face. The accounting is exactly `e=10^-17`, `r=10^-12`, `f=10^-10`, with
the inherited `.499` terminal saving. Decimal strings in `sources.json`
denote exact rationals.

The return uses `h=1250109/1562500=.80006976`, physical width `1/25`,
and a strictly positive endpoint reserve `1/10^9`. It needs count width
`.044` and physical width `.043`, each below its selected cap by exactly
`1/10^6`. Its exact geometry and full rectangular cover are in
`certificate.json`.

The proposed boundary is lower than Collet's `.8747729897` by exactly
`16197/10^10`, and lower than our preceding unpublished conditional
candidate `.8747714` by `3/10^8`. These comparisons do not upgrade either
local candidate's proof status.

## Reproduce the evidence

From a clean checkout, Python >=3.11 and SymPy 1.14.0 suffice for the exact
checks. NumPy/SciPy are needed only for optional numerical search.

```sh
python -m pip install -r auto-research/role-source-caps/requirements.txt
python certify.py
python auto-research/role-source-caps/return_budget.py --baseline
python auto-research/role-source-caps/replay.py
python auto-research/role-source-caps/flow_check.py
python auto-research/role-source-caps/check_controls.py
```

The root `certify.py` is an unchanged Track A baseline, not a certificate
for this proposal. The second command for `return_budget.py` reconstructs
Collet's old finite return and compares all 2,688 normalized coefficients
with the archived Lean sources. It does not compile those sources or
verify our endpoint. The candidate replay regenerates and compares the
complete saved receipt, including:

- 3,911 acyclic source stages and 7,822 width endpoints;
- 125,152 strict scalar gates and 7,822 weak LOW-cap guards;
- 70,398 cubic density checks, independently cross-checked by four-point
  interpolation; no density subdivision was needed;
- 224 return boxes, 2,688 return coefficients, 49 admission windows and
  33 scalar reserves, including both actual source caps.

The verifiers reject Python `-O`, so their assertions cannot silently
disappear. `check_controls.py` tests rejection of invalid graph and cover
inputs. All positivity calculations use rational arithmetic. Bernstein
coefficients establish positivity on closed rectangles, not just at
sample points. [VERIFICATION.md](VERIFICATION.md) records the scope and
commands; [SOURCE_MAP.md](SOURCE_MAP.md) pins the mathematical interfaces.

The graph's canonical SHA-256 is
`054525db8315c689c0e8c9da9de1bd65fa19dd0282dfb4dd81e187ac2c4b8568`.

## What is proved, conditional, and open

The code checks the specified finite inequalities and data dependencies.
The written deduction is conditional on the inherited source-induction,
restoration, common-height and parameterized return inputs applying with
their full quantifiers. Those inputs carry the original preprint/Hecke
dependencies; no new unconditional claim is made here.

The auxiliary flow identities in [FLOW_DIAGNOSTIC.md](FLOW_DIAGNOSTIC.md)
are exact algebra. They are not a convergence theorem, a method ceiling
or a stronger source premise. [RESEARCH_LOG.md](RESEARCH_LOG.md) explains
the search, unsuccessful directions and next steps without importing them
as proof ingredients.

The [formalization handoff](formalization/README.md) supplies an optional
source-only Lean exporter. It is **uncompiled**. The revised return and
canonical endpoint remain unfinished; see its proof-obligation table.
Native compiler startup was blocked in the research environment. That
environmental failure is separate from the unfinished mathematical
integration, and neither is reported as successful verification.

## Optional numerical search

`search.py` batches candidate amplification parameters; `search_model.py`
contains the floating gates. Search is not a proof, and regenerated
floating outputs need not be bitwise identical across environments.
The committed exact graph and receipt are authoritative.

```sh
python -m pip install numpy==2.3.5 scipy==1.17.0
python auto-research/role-source-caps/search.py --step .0005 --steps 3000 --output count-raw.json
python auto-research/role-source-caps/search.py --cap .043001 --target .03960260713 --steps 1600 --output physical-raw.json
python auto-research/role-source-caps/combine.py count-raw.json physical-raw.json --output sources-new.json
```

The saved searches stopped at 2,691 and 1,220 stages. A changed graph
must pass the exact checker and have its return regenerated before use.
There is no claim that these stage counts, parameters or theta are optimal.

## Credits and AI disclosure

Hailey Collet supplies the analytic source/return framework, natural premise,
original certificate cover and generic Lean source interface. OpenAI
supplies the underlying QRH framework. Rohan Arun and the credited
contributors supply this repository's budget, audit and research tools.
The larger mixed-moment direction credits Thibaud Gloaguen's prior
`@thebest` work in tracker PR #30. These attributions do not imply review
or endorsement of this proposal.

Subhanjan Das directed the research and is submitting the contribution.
OpenAI Codex substantially assisted the exploration, derivations, search,
exact-checking implementation, source export and writing. This was not an
independent human mathematical review. New integration code is offered
under the repository's MIT License. Inherited material retains its own
authors, licenses and notices; see [NOTICE.md](NOTICE.md).
