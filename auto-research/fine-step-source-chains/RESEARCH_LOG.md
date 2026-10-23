# Research log: what we tried, what worked, what failed

23 October 2026. Subhanjan Das, with substantial assistance from Claude
(Anthropic). All θ values in this log except the certified one are
**floating-point model estimates** from `diagnostics/return_model.py`
(saved in `diagnostics/diagnostics.json`). They locate candidates and
explain the landscape; they prove nothing.

## 1. Starting point and calibration

We started from PR #26 (θ = 0.87477137, two chains of 2,691 and 1,220
links). We first reproduced its exact replay (passes, 52 s). We then wrote
a float model of Collet's return: the same five count branches, admission
guards tested on a grid (closed upward in p), the six conductor endpoints
and a bisection in θ, minimized over h.

| Exactly certified point | Model θ | Difference |
|---|---|---:|
| PR #8 (Collet): 0.8747729897 | 0.8747729872 | 2.5·10⁻⁹ |
| PR #26: 0.87477137 | 0.8747713595 | 1.0·10⁻⁸ |
| This proposal: 0.87477128 | 0.8747712758 | 4.2·10⁻⁹ |

The model sits just below each exact value, as expected: the exact value
carries the 10⁻⁹ reserve and a rounded rational.

## 2. What worked: smaller links in both chains

Each link of a chain lowers Λ by a fixed step and loses B according to the
link's minimal crossing width b×, which is fixed by the parent face. Smaller
steps follow the improving faces more closely and lose less B overall. We reran PR #26's unchanged
search at steps 1/4000 and 1/8000 (count) and 1/2000, 1/4000, 1/8000
(physical):

| Count step \ Physical step | 1/1000 | 1/2000 | 1/4000 | 1/8000 |
|---|---:|---:|---:|---:|
| 1/2000 | 0.8747713595 (PR #26) | 0.8747713215 | 0.8747713025 | 0.8747712932 |
| 1/4000 | 0.8747713478 | 0.8747713098 | 0.8747712909 | 0.8747712815 |
| 1/8000 | 0.8747713421 | 0.8747713041 | 0.8747712851 | **0.8747712758** |

Final faces at equal Λ (from `diagnostics/refinement-endpoints.json`):

| Chain | Step | Links | B | Λ |
|---|---:|---:|---|---|
| Count | 1/2000 | 2,691 | 0.96258631988264 | 3.1518108 |
| Count | 1/4000 | 5,382 | 0.96258954750042 | 3.1518108 |
| Count | 1/8000 | 10,763 | 0.96259643646619 | 3.1519358 |
| Physical | 1/1000 | 1,220 | 0.96772063836150 | 3.2773108 |
| Physical | 1/2000 | 2,441 | 0.96770690400413 | 3.2768108 |
| Physical | 1/4000 | 4,882 | 0.96770993130090 | 3.2768108 |
| Physical | 1/8000 | 9,764 | 0.96771143048276 | 3.2768108 |

(The 1/8000 count chain stops one link earlier because its next link would
pass the break-even slope; see §3.)

The gains halve with each halving of the step (first-order convergence):
the last halvings gained 5.7·10⁻⁹ (count) and 9.4·10⁻⁹ (physical). A
first-order extrapolation puts the continuum limit at **θ ≈ 0.87477126**.
We certified the 1/8000 pair exactly at θ = 0.87477128 (§5).

## 3. Confirmed: the chains stop where they should

PR #26's search stops a chain when a link's crossing exceeds a `--target`.
We measured the return's gradients at the new point:

| Parameter | ∂θ/∂(parameter) |
|---|---:|
| Count B | −3.61·10⁻³ |
| Count Λ | +1.53·10⁻⁴ |
| Physical B | −6.25·10⁻³ |
| Physical Λ | +2.48·10⁻⁴ |

A link that lowers Λ by ε costs B by b×·ε, so it helps exactly when
b× < −(∂θ/∂Λ)/(∂θ/∂B). That break-even slope is 0.04240 (count) and
0.03964 (physical). PR #26's targets were 0.042325 and 0.039603. They
agree to within 0.2%, so the chain ends are already optimal for practical
purposes. Re-tuning the targets is worth well under 10⁻⁹.

## 4. What did not help

| Idea | Result | Why |
|---|---|---|
| Use an **earlier HIGH parent** in a link (Collet's graph sometimes did) | Crossing b× rises from 0.0423224 (previous node) to 0.0423249 (node 10000), 0.042552 (node 2000) and 0.042646 (natural premise) | The third HIGH facet binds; the most recent face is the strongest |
| Take the **minimum over several count faces** in the return | Gain 0 within model resolution | One binding point; the final face is already best there |
| Increase the **physical width** s above 1/25 | No change for s ∈ [0.04, 0.0429] | At the binding endpoint d = h the capacity is on its source (affine) side; s only matters below the kink |
| Re-derive the **natural cost** K = 6(2θ − 1) from the Lean-verified θ = 0.8747729897 | K falls by 3.5·10⁻⁵, θ by about 2.7·10⁻⁹ | The chain soon forgets its start; it would also need its own written proof, so it is not used |
| **Idealized sources**, e.g. (B, Λ) = (1, 2.5) or (0.98, 3.0) for both roles | No θ below 0.8749 found for any h in [0.78, 0.82] | The affine branches C and P fail their admission guards at every grid point; only the capped branches remain. Stronger-looking faces help only inside the admitted window (the return also requires Λ_P > 3) |
| Lower the **reserve** 10⁻⁹ | ≤ 10⁻⁹ | Not worth a separate claim |

## 5. Exact certification

`certify.py` (PR #26's verifier with the node ids and θ, h made explicit)
checks all 20,527 links exactly (656,864 strict and 41,054 weak scalar
gates; 369,486 cubic density polynomials, each cross-checked against an
independent interpolation) and then the full return: Collet's pinned cover
refined to 224 closed boxes, 49 admission windows and 33 scalar reserves
with both actual caps. Smallest return coefficient ≈ 7.8·10⁻⁹.

At θ = 0.87477127 the same graph is rejected: box (δ, p) ∈
[0.4577937, 0.4577937 + 1.1·10⁻⁸] × [0.5 − 1.5·10⁻⁸, 0.5] on edge `new_top`
cannot be certified after 30 bisections. So this graph's exact edge lies
in (0.87477127, 0.87477128].

## 6. Where θ is decided, and how much other inputs would buy

At the certified point the binding place is edge `new_top` (d = h ≈ 0.8),
count branch C, δ ≈ 0.458, p = 1/2. The return exponent there is

| Term | Value |
|---|---:|
| 1/2 | 0.5000 |
| 13h/75 | 0.1387 |
| −y/2 | −0.2325 |
| −ℓ/2 | −0.0838 |
| −0.09·d | −0.0720 |
| δ/2 | 0.2290 |
| δp·ℓ | 0.0384 |
| −δp·C/2 | −0.0036 |
| (3/4)·d·R\* | **0.3606** |

Leverage, from the model:

- Lowering E by ε everywhere lowers θ by **0.223·ε**. Reaching θ = 0.87
  would need E lower by about 0.021 at the binding point. That is about a
  6% smaller count R\*, which only a new analytic count estimate could give.
- Lowering the long-inverse slope 5/6 by 10⁻³ lowers θ by 6.5·10⁻⁶; by
  10⁻² it lowers θ by 6.6·10⁻⁵.
- The physical capacity term is only −0.0036; no capacity improvement can
  matter much.

**Geometric floor (exact algebra).** The return geometry sets
ℓ = 11/3 − 4θ and requires the reserve 1/5 − ℓ > 0 (`return_budget.py`,
third entry of `reserves`). Hence θ > 13/15 ≈ 0.8667 for every member of this
family, whatever the source faces and counts. (The repository README's
ceiling of about 0.864 concerns the original Track A architecture with
idealized inputs; 13/15 is a separate, purely geometric constraint of
Collet's return.) A route to 0.86 or below must change the probe
geometry itself.

## 7. Earlier exploration (context, not part of this contribution)

Before PR #26, Subhanjan Das (with OpenAI Codex) explored mixed and coupled
moments, marked spectral probes, pole-preserving controls and a
higher-cover conversion. These produced written partial arguments and
finite numerical diagnostics but **no new boundary**. They are not
premises here. The broader mixed-moment direction credits Thibaud
Gloaguen's `@thebest` work, as recorded in PR #26.

## 8. Summary for the next contributor

- Finite tuning of this framework has about 2·10⁻⁸ left.
- The binding quantity is the same-zero count R\* at δ ≈ 0.46, p = 1/2.
- Below 13/15 requires a new probe geometry.
- The most valuable work on this candidate (and on PR #26) is formal: a
  compiled Lean endpoint for the new graph and return.
