# Formal verification scope

The canonical endpoint, all seventeen standard-axiom audits and the fresh
native-kernel replay pass. The exact replayed module set is 749 submitted
modules plus `TenAudit`; every command exits successfully.
The source closure contains 4986 submission modules plus the pinned libraries.
See [endpoint-receipt.json](endpoint-receipt.json) for source/object hashes
and the recorded scope of each check.

The toolchain is **Lean 4.34.1**, commit
`5045d0056413266e57c625dcd7c365b10e377c52`, built in a work directory without
replacing the system installation. [Toolchain receipt](toolchain.json) records
executable hashes, tracker pins and the dependency manifest.

The target is the tracker's canonical all-moduli Dirichlet statement,
with exact boundary `2731076077/3125000000` and the principal pole excluded.
[TenAudit.lean](TenAudit.lean) checks that target, nine weaker-bound corollaries,
the two source chains, the return endpoint, the LOW-payment lemma and both
modified transport parameter constructors: **17 axiom audits** in total.
Only `propext`, `Classical.choice` and `Quot.sound` are permitted.

The source build is incremental: byte-identical inherited dependencies and
previous local builds are reused only with unchanged dependency closures.
All 749 submitted modules are new and compiled. The complete source closure
contains 4,986 submission modules plus pinned libraries. This is not a fresh
rebuild of all inherited sources or an independent verification of every
underlying analytic argument.

The native `leanchecker` run replays every new declaration from each of the
749 submitted modules plus `TenAudit`, using each module's imported environment.
The receipt checks the exact replayed module set, successful exit status and
source/object hashes. Inherited modules are not freshly replayed in this run.
This check is distinct from tracker Comparator/NanoDa/con-ron admission.

The exact chronology and original receipt hashes are checked in
[ten-round-audit.json](ten-round-audit.json); generated files in
[generation-receipt.json](generation-receipt.json); inherited transformations in
[inherited-proof-review.json](inherited-proof-review.json).
[Template provenance](template-provenance.json) provides immutable upstream
source links and hashes for all 156 inherited templates. The tracker itself
supplies the metadata and module-closure validator used in
[dependency-graph.json](dependency-graph.json).

All analytic claims remain conditional on the preprint's 7/8 theorem.
Research, generation and formalization were substantially AI-assisted by
OpenAI Codex. OpenAI, Hailey Collet, Sil, ArviFoxy, Jacob Sussman and Rohan Arun
retain credit for their underlying work.

The raw tracker `git diff --check` reports existing trailing spaces and blank
EOF lines in the copied transport sources. The [whitespace audit](whitespace-audit.json)
checks that every flag is unchanged at its original source line; generated
proofs and other submitted files are clean. This inherited formatting is
retained so the reviewed transformation consists only of the documented
namespace and floor-reserve changes.

The [compiled-source audit](compiled-source-audit.json) checks all 749 compiler
source stamps against the submitted files and records the canonical audit
source/object hashes. The [axiom report parser](axiom_report.py) handles wrapped
Lean output, checks the exact 17 declaration names, and rejects unexpected
axioms, missing reports and duplicates; [controls](axiom-parser-check.json).
