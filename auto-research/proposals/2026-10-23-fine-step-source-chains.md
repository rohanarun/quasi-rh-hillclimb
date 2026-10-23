# Fine-step source chains: θ = 0.87477128

**Subhanjan Das (@subhanjandas) · 23 October 2026**

Prepared with substantial assistance from Claude (Anthropic).

> **Status: proposal.** The exact finite checks pass. Applying Collet's
> inherited analytic source rule and parameterized return at these
> constants, and a compiled Lean endpoint, remain open. This is not a
> Lean-verified or accepted record. The proposal inherits the
> repository's stated preprint and Hecke dependencies.

## Summary

This proposal refines the conditional candidate of
[PR #26](https://github.com/rohanarun/quasi-rh-hillclimb/pull/26), which
itself extends Hailey Collet's ordinary-source proof in
[PR #8](https://github.com/rohanarun/quasi-rh-hillclimb/pull/8). It keeps
every analytic input and changes only the **step size of the two finite
source chains**, from 1/2000 (count) and 1/1000 (physical) to 1/8000 for
both. The resulting conditional candidate is

```math
\theta=\frac{87477128}{100000000}=0.87477128,
```

which is 9·10⁻⁸ below PR #26 and 1.7097·10⁻⁶ below Collet's
independently Lean-verified 0.8747729897.

The contribution also records why this route is nearly exhausted: the
continuum limit of these chains is about 0.87477126, and the probe
geometry of this family cannot go below 13/15.

**Supporting documents:** [Research account](../fine-step-source-chains/README.md)
· [Verification scope](../fine-step-source-chains/VERIFICATION.md)
· [Research log, including failed routes](../fine-step-source-chains/RESEARCH_LOG.md)
· [Source map](../fine-step-source-chains/SOURCE_MAP.md)
· [Credits and licenses](../fine-step-source-chains/NOTICE.md)

## 1. Change: finer steps in both finite source chains

Collet's generic NF step proves a new face G(B, Λ, H) from earlier LOW and
HIGH faces. Each step lowers Λ by a fixed decrement and pays for it in B.
We use the same step rule with a smaller decrement:

| Source role | Stages | Λ decrement | Width cap H | Final B | Final Λ |
|---|---:|---:|---:|---|---|
| Row count | 10,763 | 1/8000 | 0.044001 | 0.96259643646619 | 3.1519358 |
| Physical numerator | 9,764 | 1/8000 | 0.043001 | 0.96771143048276 | 3.2768108 |

All decimals are exact rationals. Every node's LOW and HIGH parent is the
immediately preceding node of its own chain; both chains start from
Collet's natural face

```math
G\!\left(1,\frac{11243277}{2500000},\frac{11}{200}\right).
```

Unchanged: accounting (e, r, f) = (10⁻¹⁷, 10⁻¹², 10⁻¹⁰), the 0.499
centered terminal, the physical width 1/25 and the return reserve 10⁻⁹.

### Affected mathematical interfaces

| Source | Location | Role |
|---|---|---|
| Collet, `paper/feedback.tex` | Lines 254–430; NF1, NF2, NF4, NF8–NF15, accounting and induction | Source domains, finite steps, induction |
| Collet, `paper/return.tex` | Lines 10–147; NR1–NR10 | Admissions, geometry, physical/Mellin return |
| `build/paper.tex` (openai/math `fd4aeeb`) | 8111–8325, `lem:probe-row-norm` | Inherited compensated row norm |
| `build/paper.tex` | 12531–12579, `lem:plain` | Inherited short-prime plain moment |
| `build/paper.tex` | 15994–16048, `lem:balanced-endpoint` | Original endpoint; **not** reused for this point |

No line of `build/paper.tex` and no statement of Collet's manuscript is
edited. [SOURCE_MAP.md](../fine-step-source-chains/SOURCE_MAP.md) pins
every revision.

## 2. Needed statement

### Ordinary-source assertion

For every node of the 20,527-node graph, Collet's full assertion
G(B, Λ, H) must hold:

```math
\mathcal{E}\ll U^{Q+\epsilon}\mathcal{H}_{J},\qquad
m_1,m_2\ge0,\quad 0\le s\le HQ,\quad m_1+m_2+\Lambda s\le BQ,
```

with exactly the coefficient, marked-pool, natural-zero, puncture,
profile, restoration and height conditions of NF1/G1. This follows from
Collet's Theorem NF applied node by node, **provided** her NF step theorem
holds as stated for every admissible parameter set; the finite graph
verifies its hypotheses (NF8–NF15) for each node.

### Return instantiation

Instantiate Collet's return (NR1–NR10) with:

| Parameter | Exact value |
|---|---:|
| θ | 10934641/12500000 = 0.87477128 |
| h | 80008777/100000000 |
| ℓ | 1571077/9375000 |
| x | 110248133/300000000 |
| y | 139477403/300000000 |
| κ\* | 4684641/6250000 |
| d_s | 3486935075/4424588304 |
| d_k | 69738701500000/87252075113793 |
| d₊ | 8000877701/10000000000 |

and require, for δ ∈ [0, 3/4], p ∈ [0, 1/2] and every conductor
interval from d₀ = 1/200 to d₊,

```math
\begin{aligned}
E(d,\delta,p)={}&\frac12+\frac{13h}{75}-\frac y2-\frac\ell2-\frac{9d}{100}
+\frac\delta2+\delta p\left(\ell-\frac{C(d)}2\right)\\
&+\frac{3d}{4}R_\ast(\kappa_\ast,\delta,p)\ \le\ \theta-10^{-9}.
\end{aligned}
```

The exact checker certifies this on the six conductor endpoints, together
with admissions and scalar reserves. The implication from these finite
facts to the literal analytic numerator, common meshes and canonical
endpoint is Collet's NR argument and is **not re-proved here**.

## 3. Payoff

If the inherited analytic interfaces apply, the conclusion is
L(s, χ) ≠ 0 for

```math
\Re(s)>\frac{87477128}{100000000}=0.87477128
```

for every Dirichlet character, principal pole excluded. Gains:

| Compared with | Value | Gain |
|---|---:|---:|
| PR #26 (conditional) | 0.87477137 | 9·10⁻⁸ |
| PR #8 (Lean-verified) | 0.8747729897 | 1.7097·10⁻⁶ |

This uses Collet's source/return budget, not the frozen Track A model, so
`whatif.py` does not apply; the budget code is attached
(`return_budget.py`, `certify.py`). No interior zero-free band is claimed.

## 4. Evidence

### Reproduce

```sh
python -m pip install -r auto-research/fine-step-source-chains/requirements.txt
python auto-research/fine-step-source-chains/replay.py
```

| Exact check | Count |
|---|---:|
| Acyclic source stages | 20,527 |
| Width endpoints | 41,054 |
| Strict scalar gates | 656,864 |
| Weak LOW-cap guards | 41,054 |
| Cubic density polynomials (each interpolation-cross-checked) | 369,486 |
| Return boxes / coefficients | 224 / 2,688 |
| Admission windows | 49 |
| Scalar reserves | 33 |

Smallest return coefficient: about 7.81·10⁻⁹ (exact value in
`certificate.json`). Smallest admission coefficient: about 1.96·10⁻⁵.
No density interval needed subdivision.

### Controls

- PR #26's five negative controls pass on this graph.
- **Sixth control:** the same graph and h at θ = 0.87477127 is rejected
  (uncertifiable box on edge `new_top`, δ ≈ 0.4578, p = 1/2). The
  certified value is within 10⁻⁸ of what these faces can give.
- PR #26's verifiers are reused **byte for byte** (hashes in
  `INPUTS.json`). The repository's root `certify.py` and Collet's archived
  baseline replay (`return_budget.py --baseline`, 2,688 coefficients
  compared with her Lean archive) both pass.
- Regenerating the graph from `search.py` reproduces `sources.json`
  byte for byte on the recorded environment.

### Floating-point diagnostics (not proofs)

`diagnostics/run_diagnostics.py` reproduces PR #8's and PR #26's exact
values to 2.5·10⁻⁹ and 10⁻⁸, and gives the step-refinement table,
break-even slopes, failed alternatives and leverage numbers in the
[research log](../fine-step-source-chains/RESEARCH_LOG.md).

## 5. What breaks, remaining work and next steps

**What changes.** All source faces, both final faces, the return height,
θ, the closed cover, admissions and every geometry reserve change; all are
recomputed exactly. Nothing from the old point's positivity is reused.

**Open proof obligations.**

1. Instantiate Collet's Lean interfaces (`nf_step`, `AdmittedWindow`,
   `PhysicalSchedule`, `beta_le_theta_of_finite_numerator`) with this
   graph and return; prove the all-conductor bounds and the canonical
   endpoint; compile; audit axioms; replay the kernel.
2. Independent mathematical review of the claim that Collet's NF and NR
   theorems apply uniformly to the new parameters (the same obligation as
   for PR #26).

**Next steps.**

- Finite tuning has about 2·10⁻⁸ left (continuum estimate ≈ 0.87477126).
  Steps of 1/16000 would collect about half of it.
- For a real gain, the target is the same-zero count R\* at the binding
  point δ ≈ 0.46, p = 1/2, edge `new_top`. Lowering the return exponent
  there by ε lowers θ by about 0.22ε.
- In this probe family θ > 13/15 ≈ 0.8667, because the return requires
  ℓ = 11/3 − 4θ < 1/5. Any route to 0.86 must change the probe geometry.

## Credits, AI disclosure and licensing

**Hailey Collet** authored the analytic source/return framework, natural
premise, original certificate cover and Lean interfaces (PR #8).
**OpenAI** supplies the underlying QRH framework. **Rohan Arun and the
repository's credited contributors** supply the audit, budget and tools.
**PR #26** (Subhanjan Das, with substantial OpenAI Codex assistance)
supplies the exact verifiers and search code reused here, and the
role-specific chain design. These credits do not imply review or
endorsement of this proposal.

**Subhanjan Das** directed the research and submits the contribution.
**Claude (Anthropic) substantially assisted** with the search runs,
diagnostics, exact certification, controls and writing. Independent
mathematical review remains outstanding.

New material is offered under the repository's MIT License. Inherited
material keeps its authors, licenses and notices; see
[NOTICE.md](../fine-step-source-chains/NOTICE.md).
