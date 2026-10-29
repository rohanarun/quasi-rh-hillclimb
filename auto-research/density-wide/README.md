# Wider density range: exact boundary 0.8739465

28 October 2026. SovereignSteak, with substantial OpenAI Codex assistance.
All conclusions remain conditional on the preprint's **7/8 theorem** and
the inherited source, count and return machinery.

The candidate is **theta = 1747893/2000000 = 0.8739465**, with
`h = 80513/100000`. It improves the merged tracker #86 boundary
`4369779/5000000 = 0.8739558` by exactly `93/10000000`.
The rational certificates and complete local Lean endpoint verification pass.
Lean 4.34.1 accepted the canonical all-moduli Dirichlet target, with the
principal pole excluded, using only `propext`, `Classical.choice` and
`Quot.sound`. Fresh kernel replay passed all 75 submitted modules and the
canonical audit. [Endpoint receipt](verification/endpoint-receipt.json),
[axiom audit](verification/canonical-and-axioms.log) and
[kernel log](verification/kernel-all-new-modules.log) record the checks.
This was an incremental build with identical inherited dependencies reused;
its closure contains 4,431 submission modules plus pinned libraries.
The formal submission is [tracker PR #89](https://github.com/GTimG/QuasiRiemannTracker/pull/89), head
`85f66481c20545bf9c8ee61bde8ce4d62b844718`. The published Git tree matches
the locally checked source tree exactly. Tracker Comparator/NanoDa/con-ron
admission remains pending.

The change is a wider domain for an existing density theorem. The previous
natural-row interface required `33/40 <= a <= 7/8`, although its underlying
maxima theorem already works for `51/100 < b <= 7/8`. Six wrappers now accept
`3/4 <= a <= 7/8`. They use the same density exponent
`rho(q) = 1 - 10*q/(15 - 6*q)`, the same fixed character dictionaries and
the same moments. This supplies the density-split HIGH branch for
`1/2 <= q <= 3/4` and removes its conservative `q >= 13/20` requirement.

## Exact source and return

| Role | B | Lambda | Source cap |
| --- | --- | --- | --- |
| Count parent, tracker #86 final source | `9888151/10000000` | `4683001/2000000` | `1/10` |
| New count source, 15 further transitions | `977400389/1000000000` | `4383001/2000000` | `1/10` |
| Physical source, tracker #86 step 38 | `2478297/2500000` | `5953751/2500000` | `1/10` |

The count source is restricted to cap `9999/100000`. The physical source
is restricted to `31/500`, with marked numerator cap `3/50`; it also
supplies the capped count branch. The old count branch remains available.
Intermediate step 38 is exposed by replaying its original 38 certified
transitions; it is not inferred from the final source.

The 15 new transitions have 210 strict scalar gates and 45 denominator
checks, certified on 342 rational Bernstein intervals. LOW and derivative
identities are checked exactly. At source width `2141/25000 = 0.08564`,
the count source improves `B - Lambda*S` by exactly `1431289/1000000000`.
This illustrates a source improvement; the full return, not this single
width, determines the endpoint.

The return checks all 240 admission guards on 16 windows and all four
conductor edges on 91 rectangles covering `[0,3/4] x [0,1/2]`.
Only window 03's lower delta endpoint changes, from `21/64` to `11/32`.
The compact Lean certificate uses 32 edge rectangles; its polynomial
identities are regenerated separately and checked by Lean.
The inherited floor margin is exactly `3079933/1000000000000 > 0`;
the row reserve remains `1/100000000`.

## Reproduce

From this directory, with Python and SymPy installed:

```sh
python source/certify_chain.py source/source.json
python return/certify.py return/candidate-15.json
python source/generate_lean.py
python return/generate_lean.py return/candidate-15.json
```

The source and return folders contain canonical rational inputs, receipts
and generators. Floating-point scouting data are not certificate inputs.
The regenerated 38 Lean certificate/chain modules match the submission
byte for byte; [generation evidence](verification/generation-receipt.json)
records their hashes. A separate [declaration review](verification/analytic-independent-review.json)
checks all 63 retained analytic declarations against the originals after
the intended range, namespace and supplier substitutions.
The Python checks prove scalar inequalities; they do not independently
establish the analytic implications. The separate Lean submission closes
those implications and has passed its complete local endpoint and kernel checks.

## Why the old gate stops too soon

Writing `Delta = L0-L > 0`, the existing profile has

```
q(v) = (999/1000)*L0*A / (Delta*(1+D*v) + (6*B0-L0)*A).
```

When `A > 0`, `1+D*v > 0`, `B0 > 0` and `6*B0-L0 > 0`, its strict upper
bound is `(999/1000)*L0/(6*B0-L0)`. Requiring `q > qmin` therefore forces
`L0/B0 > 6*qmin/(qmin+999/1000)`. The old gate forces
`L0/B0 > 3900/1649`; the widened gate only forces `L0/B0 > 3000/1499`.
These are necessary gate bounds, not sufficient source existence claims.

The first new transition actually fails the old floor at its cap:
`q - 13/20 = -72131618682251/4188456938144200 < 0`.
Thus the new chain requires the proved domain extension; changing a
numerical threshold alone would not justify it.

## Sources and credit

The [proposal](../proposals/2026-10-28-wider-density-range.md) states the
extended lemma and identifies the changed source locations.
[Provenance](provenance.json) pins the inspected research and tracker bases.
This work builds on OpenAI's preprint, Hailey Collet's density and ordinary
source machinery, Sil's fourth-power and density-split construction,
ArviFoxy's physical return, Jacob Sussman's fine chain in tracker #86,
and Rohan Arun's preceding research. The framework and certificates
retain their inherited authorship and licenses.
