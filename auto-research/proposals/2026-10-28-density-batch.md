# Four source/return advances with a smaller LOW reserve

All analytic conclusions are conditional on OpenAI's preprint 7/8 theorem.
Substantially AI-assisted by OpenAI Codex; contributor SovereignSteak.
Builds on OpenAI, Hailey Collet, Sil, ArviFoxy, Jacob Sussman, Rohan Arun,
and tracker PRs #89 and #90.

Four exact improvements were completed before new Lean work began:
`873945927/1000000000`, `436972827/500000000`,
`436972809/500000000`, and `436972583/500000000`.
The final height is `402563361/500000000`.
The [replay bundle](../density-batch/README.md) contains the chronological
ledger, all finite certificates and the proof audit.

The complete local Lean 4.34.1 canonical endpoint, nine standard-axiom
audits and fresh kernel replay of all 263 submitted modules plus the
canonical audit pass. Tracker admission remains pending.

## Changed lemma

In Sil's LOW payment argument, let `eta >= 0`. Assume
`L0 >= 0`, `sigma >= 0`, `sigma <= u`, `0 <= q <= 3/4`, `B0 <= 1`,
`0 <= tl <= L0*epsilon/24`, and

```
F <= (L0-L)*v + (6*B0-L0)*u + (B0+1)*tl,
L0*sigma - q*((L0-L)*v + (6*B0-L0)*sigma) = eta*L0*sigma,
q*(6*B0-L0) <= L0.
```

Then `q*F <= L0*(u+epsilon/16)`. The [ordered-field proof](../density-batch/low-reserve/LOW-PAYMENT.md)
uses the nonnegative term `eta*L0*sigma`; it does not require the previous
choice `eta=1/1000`. Set `eta=1/10000` and
`q=(1-eta)*L0*A/((L0-L)*(1+D*v)+(6*B0-L0)*A)`.
All remaining strict gates are checked again for the retuned chains.

In the new `Submissions.density_batch` proof, the concrete changes are:

- `Source/HybridGates.lean`: `densK`, `dens`, `gLowPerWidth`,
  the LOW identity field and its clearing lemmas use `9999/10000` and
  `1/10000`.
- `Density/StepGates.lean`, theorem `ds_low_aux`: its LOW-identity premise
  uses `1/10000`; its proof body is unchanged.
- `Source/Count001` through `Count125`, `Source/Physical001` through
  `Physical077`, and the two chain modules: new exact arithmetic instances.
- `Return/Constants`, generated admission/edge certificates, `Return/Endpoint`,
  `Theorem` and `Candidate.Main`: the two source faces and the new endpoint.

The widened-density dictionary and other analytic modules from #90 differ
only by namespaces/imports. The return templates retain the inherited
formulas. The [template review](../density-batch/verification/inherited-proof-review.json)
records exact source hashes and permitted differences.

There are **no affected lines in the preprint's `build/paper.tex`**: this
change does not edit or strengthen a preprint lemma. It reduces an auxiliary
reserve chosen in the later density-split source proof. All preprint inputs,
the seven-eighths ceiling and the inherited count/return framework remain
part of the theorem's scope. Unrelated `1/1000` small-height assumptions
are retained. The claim is an attained rational endpoint, not an optimum
or a zero-reserve limit.
