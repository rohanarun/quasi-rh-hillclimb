# Local verification scope

The final standalone submission contains 263 Lean modules. Native Lean
4.34.1 was built earlier in a work directory; the system installation was
not changed. `toolchain.json` records its source revision and dependency pins.

The canonical endpoint, all nine standard-axiom audits and the fresh
native-kernel replay pass. The exact replayed module set is 263 submitted
modules plus `BatchAudit`; every command exits successfully.
The source closure contains 4619 submission modules plus the pinned libraries.
See [endpoint-receipt.json](endpoint-receipt.json) for source/object hashes
and the recorded scope of each check.

This is an incremental source build: byte-identical inherited dependency
modules are reused; the new submission is compiled. The fresh native-kernel
replay covers all 263 submitted modules plus `BatchAudit`. It does not
freshly replay every inherited dependency. Tracker Comparator/NanoDa/con-ron
admission is a separate process.

`BatchAudit.lean` states the canonical all-moduli Dirichlet endpoint at
`436972583/500000000`, with the principal pole excluded. It also proves
the three earlier boundaries as weaker corollaries of the final endpoint.
Those corollaries do not rebuild the three intermediate source chains in
Lean; each intermediate construction has its own exact finite certificate.
The nine audited declarations are the submitted bound, canonical wrapper,
count source, physical source, return theorem, three weaker corollaries,
and the changed LOW payment lemma.

After compiling the submitted modules against the tracker-pinned libraries,
set `LEAN_PATH` accordingly, prepend the submission library directory, and
run from the research bundle root with the pinned binaries:

```sh
lean --root=verification -o "$QRH_LIB/BatchAudit.olean" verification/BatchAudit.lean
LEAN_NUM_THREADS=2 leanchecker -v Submissions.density_batch Candidate.Main BatchAudit
```

`QRH_LIB` denotes that submission library directory. The receipt binds
source and object hashes, command exit codes, and the exact replayed module
set. The only permitted axioms are `propext`, `Classical.choice`, and
`Quot.sound`. `generation-receipt.json` compares 226 regenerated arithmetic
and chain files with the submitted sources. `inherited-proof-review.json`
checks the unchanged analytic templates and the explicit LOW-reserve edits.
`four-round-audit.json` checks exact gains, original evidence hashes and
completion of all four rounds before Lean work began.

Every analytic conclusion remains conditional on the preprint's 7/8 theorem.
AI assistance: OpenAI Codex; contributor and inherited credits are in the
bundle README and submission metadata.
