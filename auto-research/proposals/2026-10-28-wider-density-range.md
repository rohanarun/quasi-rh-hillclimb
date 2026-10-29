# Widen the density source range and separate its return roles

28 October 2026. SovereignSteak, with substantial OpenAI Codex assistance.
Builds on OpenAI, Hailey Collet, Sil, ArviFoxy, Jacob Sussman and Rohan Arun.
All conclusions are conditional on the preprint's **7/8 theorem**.

**Status:** the domain-extension lemmas compile in Lean and the six changed
dictionary modules pass fresh kernel replay. Exact source and return
certificates give `theta = 1747893/2000000 = 0.8739465` at
`h = 80513/100000`. The complete Lean endpoint, canonical/standard-axiom audit and fresh
kernel replay of all 75 submitted modules now pass. [Tracker PR #89](https://github.com/GTimG/QuasiRiemannTracker/pull/89) contains the complete proof; admission is pending.

## Extended lemma

Fix a finite dictionary of natural inducing characters and a positive loss
`eta`. There are an integer `J` and `C > 0`, chosen before the live
orientation, `a`, `T`, `H` and row set, such that for

```
3/4 <= a <= 7/8,  T >= 0,  H > 0,
```

any finite set of nonzero raw frequency rows of norm at most `H`, each
carrying a nonpole zero of one of the fixed natural characters (or its
chosen whole-character inverse) at real part at least `a` and imaginary
part of absolute value at most `T`, has size at most

```
C * (1 + T)^J * H^(rho(2*a - 1) + eta),
rho(q) = 1 - 10*q/(15 - 6*q).
```

This is `fixed_natural_dictionary_raw_density` in the new
`OAI.SevenEighths.LocalMoment.WideDensity` namespace. The old public
statement required `a >= 33/40`. The exponent, dictionary, zero predicate,
exceptional-row treatment and order of quantifiers are unchanged.

The widened lemma gives the density-split HIGH estimate for
`1/2 <= q <= 3/4`, because its bin endpoint satisfies `a >= (q+1)/2`.
The HIGH monotonicity lemma already covers this entire interval.
The scalar price clips to `[1/2,3/4]`; the exact source gate now requires
`q > 1/2` instead of `q > 13/20`.

## Proof and exact source locations

The following locations refer to tracker commit
`8f77ade2f22d40197711e45af08286faed51de13`.

The original Collet modules are under
`submissions/2026-10-21-hailey-collet-1252270103/src/Submissions/hailey_collet_1252270103/Cycle61/Density/`.

| Original location | What establishes the extension |
| --- | --- |
| `ActualMaximaCount.lean:18`, hypothesis at line 29 | The existing analytic theorem accepts `51/100 < b <= 7/8`; its density exponent at line 40 is retained. |
| `BufferedPartition.lean:52`, lower endpoint at line 58 | The lower endpoint is used at line 78 only to infer `a > 51/100` from a nonempty bin. |
| `SmallHeight.lean:18,25,74` | With `e < 1/1000` and `a >= 3/4`, the buffered endpoint satisfies `b > a-e > 749/1000 > 51/100`. All epsilon allowances are retained. |
| `UniformFree.lean:27,33` | The fixed `e = min(epsilon/2000,1/2000)` is still chosen independently of the live bin. |
| `FixedDensity.lean`, `ActualZeros.lean` | The same free-row normalization, actual-zero transfer and exceptional-row bounds propagate the wider domain. Unchanged predicates and helpers are imported. |
| `NaturalEndpoint.lean:88,91` | The final uniform raw-count statement changes only its lower endpoint from `33/40` to `3/4`. |

The existing analytic input is directly inspectable in
[ActualMaximaCount](https://github.com/GTimG/QuasiRiemannTracker/blob/8f77ade2f22d40197711e45af08286faed51de13/submissions/2026-10-21-hailey-collet-1252270103/src/Submissions/hailey_collet_1252270103/Cycle61/Density/ActualMaximaCount.lean#L18).

The original Sil modules are under
`submissions/2026-10-26-sil-density-split/src/Submissions/sil_density_split_20261026/`.

| Original location | Integration change |
| --- | --- |
| `Density/LeafHigh.lean:102,107,112` | Use the widened dictionary endpoint for `a >= 3/4`; the zero transfer at line 144 already needs only `a > 51/100`. |
| `Density/LeafHighEnergy.lean:39,52,152` | Broaden the HIGH branch from `q >= 13/20` to `q >= 1/2`. |
| `Density/Leaf.lean:139,293` | Supply the wider lower-cut assertion to the uniform priced-source assembly. |
| `Source/HybridGates.lean:74,120` | Change the scalar floor; retain the LOW, HIGH and all other source obligations. |
| `Source/HybridGates.lean:179,193,220` | Existing HIGH comparisons already hold for `q >= 1/2`. |
| `Density/Price.lean`, `Density/StepGates.lean` | Clip to the proved wider interval and instantiate the same generic step with the updated gates. |

This modifies the tracker source/count interface, rather than a line in
the original `build/paper.tex`. No new replacement of the preprint's
analytic estimate is proposed. The relevant preprint comparison scope is
the Part II moment/count/return chain, lines 3723–16677, as in the repository's
ordinary-source proposal. The baseline `7/8` theorem remains an explicit
dependency of this research claim.

## Result and verification scope

Fifteen exact transitions extend tracker #86's final count source to
`G(977400389/1000000000,4383001/2000000,1/10)`.
The physical return instead uses #86's already proved step 38,
`G(2478297/2500000,5953751/2500000,1/10)`.
Separating these roles preserves the stronger physical face at the
smaller widths needed by the numerator.

The [replay bundle](../density-wide/README.md) records all exact source,
admission, geometry and return checks, the failed old-floor control,
reproducible Lean certificate generators, and source provenance.
The complete Lean endpoint connects both source theorems to the regenerated
return. Its canonical statement and axiom audit pass with only `propext`,
`Classical.choice` and `Quot.sound`; fresh replay accepts all 75 submitted
modules and the canonical audit. Tracker admission remains pending.
The scalar replay and full Lean verification have distinct scopes, recorded
in the bundle.
