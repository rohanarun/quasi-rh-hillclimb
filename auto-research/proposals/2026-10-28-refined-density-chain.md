# Refine the wider-density count chain

28 October 2026. SovereignSteak, substantially assisted by OpenAI Codex.
All conclusions are conditional on the preprint's **7/8 theorem**.

**Status:** exact finite certificates pass for
`theta = 8739461/10000000 = 0.8739461`. The complete Lean 4.34.1 endpoint,
canonical statement, five standard-axiom audits and fresh kernel replay
of all 120 submitted modules pass. Tracker admission remains pending.

## Construction

Use the proved widened density API from tracker #89, which allows the
density-split HIGH branch on `1/2 <= q <= 3/4`. Its exact source-step
theorem is `QRH.DensityWide.density_step`, in
`submissions/2026-10-28-density-wide/src/Submissions/density_wide/Source/Chain.lean`.
The same wrapper is included as `QRH.DensityRefined.density_step` in the
new submission, along with the unchanged widened density lemmas and
physical-source proof. This avoids depending on a pending submission at
admission time. The source is pinned to tracker PR #89 head
`85f66481c20545bf9c8ee61bde8ce4d62b844718`.

Start from `QRH.SilDensitySplit.K15.final_source`, the final source from
Jacob Sussman's tracker #86. Apply 59 exact steps, each reducing Lambda
by `1/400`, to obtain

```
GlobalSource (488842537/500000000) (4388001/2000000) (1/10).
```

The chain is linear and acyclic. Every step receives the previous step's
proved source; every scalar gate is supplied by a rational Bernstein
certificate. The assumption `51/100 <= beta` is retained until the final
endpoint's case split, exactly as in #89.

The physical role uses the copy `QRH.DensityRefined.physical_source` of
`QRH.DensityWide.physical_source`, namely tracker
#86's step 38, with parameters
`(2478297/2500000,5953751/2500000,1/10)`.
The return then uses `h=80513/100000`, retains the same branches and
windows as #89, and recomputes all arithmetic at the new count face and
new theta. The canonical target covers every nonzero modulus and every
Dirichlet character, excluding the principal pole.

## Exact improvement and unchanged inputs

Relative to #89's count face, the new B increases by `56937/200000000`
and Lambda increases by `1/400`. Hence, for every `0 <= S <= 1/10`,
the source budget `B - Lambda*S` increases by at least
`6937/200000000`. The complete return improves theta by `1/2500000`.

No preprint lemma or `build/paper.tex` line is changed by this refinement.
The broader density interface and its analytic justification are exactly
those already documented in the
[wider-density proposal](https://github.com/SovereignSteak/quasi-rh-hillclimb/blob/e3ab7fdf60de45d649c58a708cf4dfdb0e8ed187/auto-research/proposals/2026-10-28-wider-density-range.md).
This is a new arithmetic instance of that analytic machinery.

An investigated alternative was to insert an improved incumbent into the
natural moment cost. The return's row coefficient `3/4` is a separate
input in `Return/Conductor.lean`, so a change to `naturalK` alone does not
justify changing that coefficient. This result retains both constants;
it makes no claim to a new bootstrap theorem.

The [replay bundle](../density-refined/README.md) supplies canonical
inputs, exact receipts and reproducible Lean certificate generators.
Credits: OpenAI, Hailey Collet, Sil, ArviFoxy, Jacob Sussman, Rohan Arun,
and the preceding wider-density result. Research and formalization were
substantially AI-assisted by OpenAI Codex.
