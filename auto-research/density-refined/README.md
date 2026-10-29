# Finer density chain: boundary 0.8739461

28 October 2026. SovereignSteak, with substantial OpenAI Codex assistance.
All analytic conclusions are conditional on the preprint's **7/8 theorem**
and the inherited source, count and return machinery.

The new rational candidate is **theta = 8739461/10000000 = 0.8739461**,
with `h = 80513/100000`. It improves the preceding wider-density result
`1747893/2000000 = 0.8739465` by exactly `1/2500000`.
Exact source and return certificates and complete local Lean verification pass.
Lean 4.34.1 accepted the canonical all-moduli endpoint and all five axiom
audits used only `propext`, `Classical.choice` and `Quot.sound`. Fresh kernel
replay accepted all 120 submitted modules plus the canonical audit.
[Endpoint receipt](verification/endpoint-receipt.json),
[axiom audit](verification/canonical-and-axioms.log),
[kernel replay](verification/kernel-all-new-modules.log), and
[verification scope](verification/README.md) record these checks.
The [complete formal source](https://github.com/SovereignSteak/QuasiRiemannTracker/tree/3c225e927dae1d0f1283ed10ac9222607a6395c5/submissions/2026-10-28-density-refined) is published at commit
`3c225e927dae1d0f1283ed10ac9222607a6395c5`. Its Git tree matches the locally verified source exactly.
This is not yet an admitted tracker record.

The change refines the source chain allowed by the wider density theorem
in [tracker #89](https://github.com/GTimG/QuasiRiemannTracker/pull/89).
The needed lemmas are included with separate namespaces so this submission
can be checked while #89 is still pending. They agree with #89 after
namespace and import substitutions. It does not require another analytic
estimate. Instead of 15 steps with
Lambda decrement `1/100`, it uses 59 steps with decrement `1/400`, starting
from the same final source of Jacob Sussman's
[tracker #86](https://github.com/GTimG/QuasiRiemannTracker/pull/86).
The physical source is still #86's step 38, as proved and exposed by #89.

| Role | B | Lambda | Source cap |
| --- | --- | --- | --- |
| Count parent, #86 final source | `9888151/10000000` | `4683001/2000000` | `1/10` |
| Refined count source, 59 transitions | `488842537/500000000` | `4388001/2000000` | `1/10` |
| Physical source, #86 step 38 | `2478297/2500000` | `5953751/2500000` | `1/10` |

The source-budget improvement over #89 is uniform throughout `0 <= S <= 1/10`:

```
(B_new - Lambda_new*S) - (B_old - Lambda_old*S)
  = 56937/200000000 - S/400
  >= 6937/200000000 > 0.
```

This affine comparison explains the choice of source. The complete return
certificate determines the endpoint; this comparison alone does not.
The return retains #89's 16 admission windows, count cap `9999/100000`,
physical cap `31/500`, numerator cap `3/50`, natural cost `9/2`,
and row coefficient `3/4`. Its reserve remains `1/100000000`.

The exact replay checks 826 strict source gates and 177 positive
denominators on 1,418 rational Bernstein intervals, together with LOW and
derivative identities and parent-child continuity. It checks all 240
admission guards and all four return edges on 91 rectangles covering
`[0,3/4] x [0,1/2]`. The floor margin is exactly
`1831933/1000000000000 > 0`.
The compact Lean return uses 32 edge rectangles and 240 admission
identities; the separate generators recompute their rational coefficients.

## Reproduce

From this directory, with Python and SymPy installed:

```sh
python source/certify_chain.py source/source.json
python return/certify.py return/candidate.json
python source/generate_lean.py
python return/generate_lean.py return/candidate.json
```

The source generator also replays its exact certificate before writing
Lean files. The scalar scripts check finite inequalities; the separate
Lean endpoint connects them to the analytic source and return theorems.
Floating-point optimization is used only to discover rational inputs.
Neither the scripts nor the formalization assert that this is an optimal
source chain or the infimum of the wider-density architecture.

## Scope and credit

The [research note](../proposals/2026-10-28-refined-density-chain.md)
records the construction, exact comparison and unchanged analytic inputs.
This work builds on OpenAI's preprint, Hailey Collet's density and ordinary
source machinery, Sil's fourth-power and density-split construction,
ArviFoxy's physical return, Jacob Sussman's fine density chain, Rohan Arun's
preceding research, and the wider-density proof in tracker #89.
Inherited authorship and licenses are retained.
