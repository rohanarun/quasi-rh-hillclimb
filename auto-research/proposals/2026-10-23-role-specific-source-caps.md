# Role-specific source caps: θ = 0.87477137

**Subhanjan Das (@subhanjandas) · 23 October 2026**

Prepared with substantial assistance from OpenAI Codex.

> **Status: proposal.** The exact finite checks pass. Applying the inherited
> analytic framework to this candidate, and completing its Lean endpoint
> proof, remain open. This is not a Lean-verified or accepted new record.
> The proposal inherits the repository's stated preprint dependencies.

## Summary

This proposal extends Hailey Collet's ordinary-source construction in
[PR #8](https://github.com/rohanarun/quasi-rh-hillclimb/pull/8). The idea is
to use **separate source chains for row counting and the physical numerator**,
with a width cap chosen for each role. We keep the inherited analytic
estimates and recompute the finite source and return inequalities.

The resulting conditional candidate is

```math
\theta=\frac{87477137}{100000000}=0.87477137.
```

It lowers the proposed boundary by **0.0000016197** relative to Collet's
0.8747729897. The contribution consists of an exact source graph, a
reproducible rational certificate, a research account and a formalization
handoff. The finite certificate does not establish the complete analytic
theorem.

**Supporting documents:** [Research account](../role-source-caps/README.md)
· [Verification scope](../role-source-caps/VERIFICATION.md)
· [Source map](../role-source-caps/SOURCE_MAP.md)
· [Search and failed routes](../role-source-caps/RESEARCH_LOG.md)
· [Open proof obligations](../role-source-caps/formalization/PROOF_OBLIGATIONS.md)

## 1. Change: give the two source roles separate chains

The final return uses source estimates for two jobs: counting rows and
bounding the physical numerator. We choose the chain and global width cap
for each job separately. Both chains use Collet's unchanged generic NF
source step and parameterized return.

| Source role | Stages | Slope decrement per stage | Global width cap |
|---|---:|---:|---:|
| Row count | 2,691 | 1/2000 | 0.044001 |
| Physical numerator | 1,220 | 1/1000 | 0.043001 |

The final source parameters are:

| Source role | $B$ | $\Lambda$ |
|---|---:|---:|
| Row count | 0.96258631988264 | 3.1518108 |
| Physical numerator | 0.96772063836150 | 3.2773108 |

All listed decimal parameters are exact rationals. Every LOW and HIGH
parent precedes its child, so the graph contains no circular dependencies.
Both chains start from the inherited natural face

```math
G\!\left(1,\frac{11243277}{2500000},\frac{11}{200}\right).
```

The accounting remains $(e,r,f)=(10^{-17},10^{-12},10^{-10})$, and the
centered terminal saving remains 0.499. No analytic lemma of the original
preprint is strengthened or patched.

### Affected mathematical interfaces

| Source | Location | Role in the proposal |
|---|---|---|
| Collet's `paper/feedback.tex` | Lines 254–430; NF1/NF4/NF8/NF10–NF15 and accounting | Ordinary-source domains, finite steps and induction |
| Collet's `paper/return.tex` | Lines 10–147; NR1–NR10 | Source admissions, geometry and physical/Mellin return |
| Original `build/paper.tex` | Lines 8111–8325 | Inherited compensated row norm |
| Original `build/paper.tex` | Lines 12531–12579 | Inherited short-prime plain moment |
| Original `build/paper.tex` | Lines 15994–16048 | Historical balanced endpoint; its certificate is not reused for this point |

The [pinned source map](../role-source-caps/SOURCE_MAP.md) gives the exact
revisions, statement labels and Lean interfaces for these references.

## 2. Needed statement: establish the source and return assertions

### Ordinary-source assertion

For every node of the finite graph, establish the full inherited assertion
$G(B,\Lambda,H)$. Its bound and parameter domain are

```math
\begin{aligned}
\mathcal{E} &\ll U^{Q+\epsilon}\mathcal{H}_{J},\\
m_1,m_2&\ge 0,\qquad 0\le s\le HQ,\\
m_1+m_2+\Lambda s&\le BQ.
\end{aligned}
```

Here $H$ is the **source width cap**, distinct from the return parameter
$h$. The fixed-data, canonical marked-pool, natural-zero, puncture,
profile, restoration and independently bounded height conditions are
exactly those of Collet's NF1/G1. All their quantifiers remain required;
finite sampling does not replace a uniform analytic assertion.

### Exact return parameters

Instantiate Collet's full physical/Mellin return with:

| Parameter | Exact value |
|---|---:|
| $\theta$ | $87477137/100000000$ |
| $h$ | $1250109/1562500$ |
| $\ell$ | $12568589/75000000$ |
| $x$ | $27563357/75000000$ |
| $y$ | $17434027/37500000$ |
| $\kappa_{\ast}$ | $37477137/50000000$ |

The finite return expression is

```math
\begin{aligned}
E(d,\delta,p)={}&\frac{1}{2}+\frac{13h}{75}
 -\frac{y}{2}-\frac{\ell}{2}-\frac{9d}{100}+\frac{\delta}{2}\\
&+\delta p\left(\ell-\frac{C(d)}{2}\right)
 +\frac{3d}{4}R_{\ast}(\kappa_{\ast},\delta,p).
\end{aligned}
```

The required inequality is

```math
E(d,\delta,p)\le\theta-10^{-9}.
```

It must hold for $\delta\in[0,3/4]$, $p\in[0,1/2]$, and every conductor
interval from $d_0=1/200$ to $d_+=h+10^{-10}$, using NR4's old/new
capacities $C(d)$ and NR5's fixed joins. The balanced row-count term
$R_{\ast}$ is inherited from the same return framework.

The exact checker certifies the six endpoint covers, admissions and scalar
reserves. **The remaining task is the full implication to the literal
analytic numerator, common meshes and final canonical endpoint.** No new
source-step or return assertion is assumed as an axiom.

## 3. Payoff: the conditional nonvanishing boundary

If the inherited analytic interfaces apply with every required hypothesis,
the proposed conclusion is nonvanishing in

```math
\Re(s)>\frac{87477137}{100000000}=0.87477137,
```

with the principal pole excluded. The exact improvement over Collet's
0.8747729897 is

```math
\frac{16197}{10^{10}}=0.0000016197.
```

This proposal uses its own source/return budget, rather than the frozen
Track A model. The modified budget and exact certificate are attached;
`whatif.py` is not used to infer this value.

The symmetry-related strip description would follow only after the
analytic endpoint and functional-equation application are established.
No additional interior zero-free band, 0.86 bound or 0.7x bound is claimed.

## 4. Evidence: exact finite checks and their scope

### Reproduce the candidate certificate

From the repository root, use Python 3.11 or later and install the pinned
exact-checking dependency:

```sh
python -m pip install -r auto-research/role-source-caps/requirements.txt
python auto-research/role-source-caps/replay.py
```

The replay regenerates and compares the complete saved receipt. Its checks
use rational arithmetic; floating-point search only supplied candidates.

| Check | Count |
|---|---:|
| Acyclic source stages | 3,911 |
| Width endpoints | 7,822 |
| Strict scalar gates | 125,152 |
| Weak LOW-cap guards | 7,822 |
| Cubic density positivity tests | 70,398 |
| Return boxes | 224 |
| Return coefficients | 2,688 |
| Admission windows | 49 |
| Scalar reserves | 33 |

The actual count width is 0.044 and the physical width is 0.043. Each is
below its selected global cap by exactly $10^{-6}$.

### Finite proof mechanism

The certificate uses affine interpolation in width, positive cubic
Bernstein coefficients in density, tensor Bernstein positivity on return
rectangles, and the inherited piecewise-affine conductor interpolation.
An independent interpolation calculation cross-checks every cubic density
test. These checks cover intervals and rectangles, rather than testing
only isolated sample points.

The code also reproduces Collet's old return and compares all 2,688
normalized coefficients with her archived Lean sources. That comparison
checks the transcription at the **old point**; it does not formally verify
the changed point. Negative controls reject invalid source dependencies
and incomplete or duplicated covers. The verifiers explicitly reject
optimized Python execution so their assertions cannot silently disappear.

The [verification note](../role-source-caps/VERIFICATION.md) records the
commands, evidence and limits. The [research log](../role-source-caps/RESEARCH_LOG.md)
explains how the candidate was found and which exploratory routes failed.

## 5. What breaks, remaining proof work and next steps

Changing the count and physical source constants, actual caps, return
height and $\theta$ requires recomputing source admissions, source
restrictions, return polynomials, the closed cover and every geometry
reserve. The supplied finite computations do this; the old point's
positivity or generic headline audit cannot certify the new point.

The remaining formal work is:

1. Construct the new admitted windows and prove the full cover and
   all-conductor bounds.
2. Instantiate `PhysicalSchedule`, the common-mesh literal numerator and
   the canonical nonvanishing theorem at the new parameters.
3. Complete transitive axiom audits and a fresh Lean kernel replay.

The [formalization handoff](../role-source-caps/formalization/README.md)
includes an optional **uncompiled** Lean source exporter. It is a starting
point for these tasks, not proof evidence.

For a substantially larger gain, the mixed off-diagonal estimate discussed
in the research log remains open. The exploratory coefficient, profile,
flow and Mellin routes are not premises of this candidate. Finite numerical
reductions do not establish asymptotic power savings. No optimality or
universal method ceiling has been proved here.

## Credits, AI disclosure and licensing

**Hailey Collet** supplies the analytic source/return framework, natural
premise, original certificate cover and generic Lean source interface.
**OpenAI** supplies the underlying QRH framework. **Rohan Arun and the
repository's credited contributors** supply the budget, audit and research
tools. The larger mixed-moment direction builds on **Thibaud Gloaguen's
@thebest contribution**, as documented in the research account. These
credits do not imply review or endorsement of this proposal.

**Subhanjan Das** directed the research and is submitting the contribution.
**OpenAI Codex substantially assisted** the exploration, derivations,
search, exact-checking implementation, source export and writing.
Independent mathematical review remains outstanding.

New integration is offered under the repository's MIT License. Inherited
material retains its authors, licenses and notices; see
[NOTICE.md](../role-source-caps/NOTICE.md).
