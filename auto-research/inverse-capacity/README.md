# The inverse slot capacity: anatomy, a partial lemma, and an exact obstruction

**Subhanjan Das (@subhanjandas) · 23 October 2026**
Prepared with substantial assistance from Claude (Anthropic).

> **Status: proposal and negative result.** No new zero-free boundary is
> claimed here. What is new: (1) an exact anatomy of the same-zero count that
> identifies the marked inverse moment's slot capacity as the dominant lever;
> (2) **Lemma S**, an unconditional structured-mark bound, with its analytic
> core checked in Lean (Heath-Brown's cubic large sieve as an explicit
> hypothesis); (3) an exact, Lean-checked proof that the preprint's terminal
> estimate forces the capacity (1−r)/2 in **two independent branches**, so
> Lemma S alone cannot move θ; (4) the precise remaining target.
> The small finite improvement θ = 0.87477127 found in the same research is
> in the separate folder [`../adaptive-caps/`](../adaptive-caps/README.md).

Formal proposal: [../proposals/2026-10-23-inverse-slot-capacity.md](../proposals/2026-10-23-inverse-slot-capacity.md).

## The story in five steps

1. **Where θ is decided.** In Collet's return (PR #8) the binding term is the
   same-zero count R\*. It is the crossing of three witness lines, and it
   equals the mean of their intercepts weighted by their reciprocal slopes
   (Lean: `CountAnatomy.crossing_value`). At the binding point the inverse
   line carries weight **0.506**, the sixth-power line 0.309, and the plain
   line (Collet's source faces) only 0.185. This explains why source-chain
   tuning gains only 10⁻⁸. [`INVERSE_CAPACITY.md`](INVERSE_CAPACITY.md)
2. **The lever.** The inverse line's slope is set by the marked inverse
   moment's capacity z_M(r) = (1−r)/2 (preprint `lem:marked`, r + 2z ≤ m).
   A floating-point what-if says a coefficient λ < 2 would lower θ by
   6·10⁻⁴ (λ = 1.75) up to 2·10⁻³ (λ ≤ 1.25, where the prime supply binds).
   For scale, all progress below 7/8 so far is 2.29·10⁻⁴.
3. **Its origin.** The "2" traces to Heath-Brown's cubic large sieve
   (UV)^{2/3} term, through `lem:hybrid-energy`, the reflected-energy
   terminal step and the canonical invariant (exact line references).
   Dunn–de Faveri–Hoffstein (2026) prove that sieve sharp for arbitrary
   coefficients. [`CUBIC_SIEVE_BARRIER.md`](CUBIC_SIEVE_BARRIER.md)
4. **Lemma S.** After cubic reflection the slot coefficient is not arbitrary:
   it contains a cubic-residue phase (q/p)₃² between every two slot primes.
   Splitting the slots into two balanced groups and applying Heath-Brown's
   *bilinear* sieve gives a saving of z/3 for every dual length, where the
   preprint's saving vanishes for short duals. This improves the row branch
   of the terminal estimate. [`STRUCTURED_MARK.md`](STRUCTURED_MARK.md)
5. **The obstruction.** The column branch of the same estimate, where the dual
   is longer than the rows, independently needs r + 2z < m, because active
   slot primes enter the reflection conductor squared. So λ stays 2 unless the
   column branch is improved too (Lean: `BranchAlgebra.capacity_unchanged`).
   With both improved to Lemma S's level, the what-if gives θ ≈ 0.87387.

## What is checked, and how

| Claim | Check |
|---|---|
| Count = weighted mean of intercepts | Lean (`CountAnatomy`), exact Python (`scripts/weights.py`) |
| Margin identities of the preprint at its initialization | Lean (`BranchAlgebra.first/second_margin_identity`) |
| Row/column/mixed branch conditions and the obstruction | Lean (`BranchAlgebra`), SymPy (`scripts/branch_algebra.py`) |
| Lemma S analytic core (Cauchy–Schwarz + large sieve ⇒ bilinear bound) and the z/3 bookkeeping | Lean (`LemmaS`), with Heath-Brown's theorem and the residue-symbol factorization as explicit hypotheses |
| The factorization of the reflected tuple coefficient | Written argument from the preprint's formulas (paper.tex 2271, 7360–7481); not formalized |
| That the three inequalities are the branch requirements | Written derivation from paper.tex 9884–9935; not formalized |
| Geometric floor θ > 13/15 | Lean (`GeometryFloor.theta_gt_13_15`) |
| λ payoff table | Floating-point model (`scripts/lam_whatif.py`), validated against Collet's closed form at λ = 2 (`scripts/lam_check.py`); a diagnostic, not a proof |

Lean: 19 theorems, Lean 4.34.1 and the Mathlib revision of PR #8; each uses
only `propext`, `Classical.choice` and `Quot.sound`; a fresh `leanchecker`
replay passes. Details in [`VERIFICATION.md`](VERIFICATION.md) and
[`lean/README.md`](lean/README.md).

## Certified, proved, modelled, open

Every θ value in this repository is conditional on the preprint's 7/8 theorem
(and here also on Collet's PR #8 analytic NF/NR theorems); none is
unconditional.

| Item | Status | How it is checked |
|---|---|---|
| θ = 0.87477127 with adaptive caps (41,056 stages) | **Certified** (conditional, exact finite premises) | Exact rational replay with the PR #26/#27 verifiers; rejected at 0.87477126 ([`../adaptive-caps/`](../adaptive-caps/README.md)). Not Lean-checked |
| Count anatomy (weights 0.506 / 0.309 / 0.185) | **Proved** | Lean identity + exact rational evaluation |
| Lemma S (structured mark bound, saving z/3) | **Proved** (written proof) | Lean checks the analytic core and the exponent bookkeeping, with Heath-Brown's cubic large sieve and the residue-symbol factorization as explicit hypotheses |
| Obstruction: column branch forces r + 2z < m | **Proved** (exact algebra) | Lean + SymPy; that these are the branch requirements is a written derivation from paper.tex 9884–9935 |
| θ ≈ 0.87387 (λ = 5/3), ≈ 0.8728 (prime-supply floor) | **Model only** | Floating-point what-if; not a claim |
| Column-branch estimate | **Open** | The single precise target (`STRUCTURED_MARK.md` §4) |
| Any new zero-free boundary from the inverse-capacity work | **Not claimed** | — |

## Limitations

- The λ what-if holds the sources at PR #27's faces and uses a δ grid of 0.01
  with no admission windows; its numbers are orientation, not certificates.
- The Lean files formalize algebra and an abstract bilinear bound. They do not
  formalize the preprint's analytic inequalities, Heath-Brown's theorem, the
  cubic residue symbol, or any zero-free region.
- The adaptive-caps certificate is an exact Python replay, not a Lean endpoint:
  a Lean endpoint would require Collet's full 6,471-module closure
  instantiated with the 41,056-stage graph.
- The obstruction is proved for the preprint's reflect-with-marks architecture
  at its initialization node; a different architecture could avoid it.
- No independent human review has taken place.

## Next steps

1. Prove the column-branch estimate (`STRUCTURED_MARK.md` §4). Smallest test
   case: one active slot of length z, residual row length H < v; check whether
   Poisson summation in the mark variable before the large sieve shortens the
   dual length by z. Together with Lemma S this would give λ = 5/3,
   θ ≈ 0.87387 (model).
2. Treat the second marked condition 2r + 8z ≤ 3m (mixed branch) the same
   way; it binds once λ ≤ 1.5.
3. If (1) succeeds: recompute Collet's FR4/NR2 counts, FR8 windows and HF3
   facets, then rebuild the source graph and return certificate exactly.
4. Lean: formalize the residue-symbol factorization of the reflected tuple
   coefficient, and instantiate Collet's formal NF step and return with the
   adaptive-cap graph.

Full ranking in [`ROADMAP.md`](ROADMAP.md); the chronological account,
including dead ends, in [`RESEARCH_LOG.md`](RESEARCH_LOG.md).

## Other files

- [`RESEARCH_LOG.md`](RESEARCH_LOG.md): how we got here, step by step.
- [`ROADMAP.md`](ROADMAP.md): ranked targets with leverage and status.
- [`FAILED_BRANCHES.md`](FAILED_BRANCHES.md): every route tried and why it stalled.
- [`LITERATURE.md`](LITERATURE.md): sources and exactly how each is used.
- `scripts/`, `results/`: models, exact checks and saved what-if outputs.

## Credits

OpenAI's preprint supplies the method analysed here; Hailey Collet (PR #8)
the source/return framework and the return model; D. R. Heath-Brown the cubic
large sieve; Dunn, de Faveri and Hoffstein the sharpness theorem; Rohan Arun
and the repository's contributors the audit and tools; PR #26/#27 (Subhanjan
Das, with OpenAI Codex and with Claude) the return verifiers and model used for
the what-if. See [`NOTICE.md`](NOTICE.md).
