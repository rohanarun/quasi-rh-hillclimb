# How the candidate arose, what failed, and what to try next

Subhanjan Das, with substantial OpenAI Codex assistance. 23 October 2026.
This is a research account, not an independent review or a new RH proof.

## Starting point and the actual gain

We began with Collet's finite ordinary-source method, now available through
PR #8. Its independently replayed endpoint is `.8747729897`. Its source
faces feed both a counting estimate and a physical numerator estimate.
The question was whether a denser finite graph could supply better
constants to the same return, without pretending to improve an analytic
lemma merely by numerical optimization.

Earlier private chains led to conditional candidates `.87477148` and
`.8747714`. Those are background research checkpoints, not accepted or
independently verified records. The present graph uses a count slope step
of `.0005`, rather than `.001`, and builds the physical chain separately
with global cap `.043001`. Its required physical return domain stops at
`.043`; there is no reason to pay for an unnecessarily wider source if
the narrower one feeds the actual argument.

At each step, the numerical search varies the amplification parameter `q`
and finds an admissible crossing with the preceding source line. The
rounding is then frozen as rational input. The exact verifier must check
all gates over the complete intervals; a numerical search success alone
has no evidential status as a theorem.

The saved numerical ablation illustrates where the last increment came
from. These numbers are diagnostics, not certified endpoints:

| Numerical experiment | Predicted theta |
|---|---:|
| Previous count and physical sources | .8747713884193243 |
| Finer count chain only | .8747713649473746 |
| Narrower physical cap only | .8747713851454215 |
| Both changes | .8747713616734686 |

The exact replay certifies the weaker rational candidate `.87477137` with
a separate positive reserve `10^-9`, at `h=.80006976`. It does not certify
the displayed floating optimum or optimality of the search. The resulting
gain over the previous private candidate is `3e-8`, and the gain over
Collet's independently checked endpoint is `1.6197e-6`, conditionally.
This is not the large move to `.86` or `.7x` originally sought.

## Why the finite certificate is meaningful but incomplete

For each source step, the child line is already covered by the parent
below their crossing. On the remaining width interval the scalar gates
are affine in width. After positive denominator clearing, the density
gates are cubics. Positive Bernstein coefficients at both width endpoints
therefore give the full width-density rectangle, including its boundary.
Every parent precedes its child, so this finite induction is not circular.

For the return, the count envelope is the minimum of admitted branches.
The saved assignments are recomputed at the changed geometry, with
upward admission windows in the amplitude parameter. Each cleared return
polynomial has bidegree at most `(2,3)`. Its tensor Bernstein coefficients
are positive on the complete cover. Containment, total exact area and
pairwise interior disjointness of finitely many closed rectangles give
the required cover. The conductor interpolation is an inherited analytic
interface, not a numerical sampling argument.

This establishes the checked finite premises. The new literal source and
return instantiations still need independent analytic review and a complete
Lean integration. Old compiled receipts do not automatically transfer to
changed constants. The formalization handoff lists those obligations.

## Routes that did not supply a larger bound

The following summarizes earlier exploratory work. Except for the exact
flow diagnostic supplied here, the broader experiments are outside this
focused PR. They are not independently reviewed results or extra proof
ingredients. No numerical benchmark from those omitted experiments is
needed by the certificate.

| Route | What we learned | What remains missing |
|---|---|---|
| Smaller source steps and continuous flow | The first density gate gives a necessary crossing inequality and an exact formal first integral; `flow_check.py` checks three identities and all saved stages | A convergence/comparison theorem; the flow is not a proved ceiling |
| Reweighting prime coefficients | Coefficient-space arguments can constrain reweighting at a fixed normalizer | A bound for transformed arithmetic rows or their signed pairing; coefficient geometry alone does not supply it |
| Removing a fitted dominant Gram mode | A mode can overlap the detector signal; removing it can damage the normalizer | A uniformly admissible construction preserving the full probe contracts |
| Restricting to a simple cubic-residue subfamily | The actual completion includes other square cores and moving twists | Estimates uniform in those twists and all required rows |
| Replacing a special estimate by generic sieve orthogonality | Generic sieve costs do not automatically provide the specialized saving needed by the physical pairing | A valid coefficient-specific analytic estimate, rather than an idealized budget assumption |
| Changing the scalar power in a zeta/Möbius factorization | Elementary Euler identities reorganize inverse-L cancellation | The stronger all-scale cancellation estimate; an identity is not an improved zero-free region |
| Choosing a different positive profile | Selected finite energies can fall while the full signed response or Cauchy bound does not improve | An all-scale estimate for the complete compensated probe |

The scalar Euler/Mellin investigations lie in known Möbius-type and Mellin
frameworks; no novelty claim is made for those methods. The larger joint
witness/numerator and mixed-Gram direction already appears in Thibaud
Gloaguen's `@thebest` [tracker PR #30](https://github.com/GTimG/QuasiRiemannTracker/pull/30).
Its earlier thresholds must not be imported into this changed geometry
without a new calculation. COUPLED_MOMENTS.md describes the missing estimate.

## Productive next steps

1. Independently audit the NF transcription and the complete source/return
   quantifiers, especially the actual caps, common meshes and moving heights.
2. In a working pinned Lean 4.34.1 environment, compile the source export,
   build the revised admitted windows and physical schedule, then connect
   the literal numerator to the independent canonical target.
3. Audit all transitive axioms and perform a fresh kernel replay. Seek
   independent semantic and mathematical review before any record claim.
4. For a significant analytic gain, retain witness/numerator correlation
   through the signed off-diagonal form. A new estimate must survive all
   source, restoration, detector and return contracts.
5. Use the exact finite checker to measure any proved new input. Additional
   coefficient fitting or a proposed flow limit should not be promoted to
   an improved theta without that transfer.

Related open PRs #5, #19, #23 and #24 were inspected for scope. They concern
architecture leverage, supply extension, Lean budget lemmas and geometry
penalties respectively; this contribution does not claim their results or
present the source graph as a reproduction of those different statements.
