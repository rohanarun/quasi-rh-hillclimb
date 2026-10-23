# Exact proof obligations and dependency map

Status on 23 October 2026: **new endpoint unproved in Lean**.

All inherited file references below are under
`src/Submissions/hailey_collet_1252270103/` inside the pinned archive, SHA-256
`e69c31261bb4f7b997679220f7b0c32063af4721dd95dcb787d8b5074f95adfa`.
Line numbers refer to those bytes, not a moving GitHub branch.

| Obligation | Inherited interface | Current status |
|---|---|---|
| Exact rational finite source premises | `Record1252270103Finite/SourceFormulas.lean:83`, `SourceValid` | Python replay passes; 3,911 Lean goals generated, uncompiled |
| Allowed accounting and actual analytic source step | `Record1252270103Graph/GraphContract.lean:15,28`, `NFAccounting`, `NFStep`; `Record1252270103Source/Core/Endpoint.lean:13`, `nf_step` | Written integration calls the existing theorem; not newly assumed; uncompiled |
| Independent natural cap | `Record1252270103Graph/FinalSources.lean:10`, `final_natural_cap` | Written integration uses inherited `seed_step` and natural cap; uncompiled |
| Global count and physical sources | `Record1252270103Graph/GraphContract.lean:11`, `P` | Written `selected_global_sources` retains the usual beta >= .51 case condition; uncompiled |
| New detector geometry and coarse bounds | `Record1252270103Return/Geometry.lean:5`, `Parameters`; `Record1252270103Return/TransportGeometry.lean:9`, `Bounds` | Exact constructor proofs written with `norm_num`; uncompiled |
| 49 admitted counting windows | `Record1252270103Return/AdmittedWindow.lean:10`, `AdmittedWindow` | Python admissions checked; new Lean constructors and literal supplier restrictions missing |
| 224 endpoint boxes and complete rectangle cover | Original finite-return/Bernstein implementation and `FinalEdgeCertificates`, `FinalRows` | Python positivity/cover checks pass; new Lean cover and polynomial implication proofs missing |
| Whole conductor interval, physical parameters and row bounds | `Record1252270103Return/Schedule.lean:29`, `PhysicalSchedule` | New instance missing; endpoint boxes alone do not instantiate it |
| Common mesh, actual source and literal physical numerator | `Record1252270103Return/PhysicalDirect/ChosenSource.lean:79`, `chosen_initial_source_of_uniform_faces` | Must instantiate with the new count scheme and schedule, then discharge all face restrictions |
| Zero-free endpoint | `Record1252270103Return/Transport/FinalCommonProbe.lean:35`, `beta_le_theta_of_finite_numerator` | Generic theorem exists; applying it at the new geometry is missing |
| Canonical Dirichlet/zeta meaning | New `QRH87477137/Targets.lean` | Target propositions written; no proof supplied |
| Transitive axiom audit and fresh replay | Exact new endpoint and its entire import closure | Not run; compiler startup blocked |

The remaining return integration is substantive formalization work. Merely
changing the old hard-coded endpoint constant, proving a list of positive
numbers, or assuming a new `LiteralNumeratorInput` would not discharge it.

The source graph was built without using its own output as a premise:
each node's LOW and HIGH parent precede it. The generated proof uses that
ordering and preserves the exact per-role caps .044001 and .043001. The
count role needs .044 and the physical role .043, leaving exact 1e-6 buffers.
The final scalar reserve remains 1e-9. None of these finite facts is, by
itself, an analytic zero-free theorem.

For the case beta < .51 the final beta bound should be discharged directly
by order reasoning; for beta >= .51 use the selected analytic sources and
the completed return. The independent target must quantify over every
positive modulus and every character, and must exclude the principal pole.
It must not hide source availability, the desired bound itself, or a new
zero-free conjecture in its hypotheses.

No theorem excluding additional interior bands has been obtained. A left
boundary statement, if included, needs its own application of the functional
equation with the domain and trivial-zero exceptions treated explicitly.

The original .8747729897 proof's independent upstream build is useful prior
evidence about inherited files, not a verification receipt for these changed
parameters. Its tracker admission is a distinct process too.
