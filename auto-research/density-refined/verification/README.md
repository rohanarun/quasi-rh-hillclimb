# Local verification scope

The complete new submission uses native Lean 4.34.1 built from source in
a work directory. The system Lean installation was not changed.
`toolchain.json` records its source revision, binaries and library setup.

This was an incremental build: byte-identical inherited dependencies were
reused, while new or changed modules were compiled. The source closure
contains 4,476 submission modules plus the pinned libraries. The final
fresh native-kernel replay covers all 120 modules in the new submission
and `RefinedAudit`; it does not recompile or replay every inherited module.
Tracker Comparator/NanoDa/con-ron admission is a separate check.

`RefinedAudit.lean` states the canonical all-moduli Dirichlet endpoint at
`8739461/10000000`, excludes the principal pole, and prints the axioms of
five declarations: the submitted theorem, canonical wrapper, count source,
physical source and final return theorem.

With the submitted modules built using the tracker-pinned dependencies,
set `LEAN_PATH` to their library directories, prepend the submission
library directory, and run from the bundle root:

```sh
lean --root=verification -o "$QRH_LIB/RefinedAudit.olean" verification/RefinedAudit.lean
LEAN_NUM_THREADS=2 leanchecker -v Submissions.density_refined Candidate.Main RefinedAudit
```

Here `QRH_LIB` denotes that submission library directory. Use the pinned
Lean binaries; the source file alone does not supply the imported libraries.
The endpoint receipt records commands, exit codes, source/object hashes,
and comparison of the kernel replay list against the exact submitted
module set. The axiom audit must contain only `propext`, `Classical.choice`
and `Quot.sound` for all five declarations.

`generation-receipt.json` verifies that all 82 generated certificate/chain
files match the submitted Lean source. `inherited-proof-review.json`
checks that the included density/physical proofs differ from #89 only in
namespaces and imports, with its source-step wrapper extracted unchanged.
`return-template-review.json` records the corresponding comparison of 21
return templates; the constants and arithmetic certificates are regenerated.

These checks retain the preprint's 7/8 theorem as an input. AI assistance:
OpenAI Codex; inherited contributors and licenses are credited in the
bundle and submission.
