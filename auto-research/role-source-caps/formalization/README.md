# Lean source-only handoff — uncompiled and incomplete

The changed endpoint at `87477137/100000000` has **not** been Lean-verified.
This handoff is optional preparation for finishing that work, not evidence
of a successful formal proof.

With Python >=3.11, run from the repository root:

```sh
python auto-research/role-source-caps/formalization/generate.py
python auto-research/role-source-caps/formalization/check_generated.py
```

The generator checks the exact saved graph and inherited archive hashes,
then writes 251 Lean files plus a hash manifest. Generated output is ignored
by Git to keep the proposal focused. It includes rational source data,
3,911 finite `SourceValid` goals, accounted induction using the inherited
`nf_step`, selected source statements, geometry constructors and separately
stated canonical Dirichlet/zeta targets. The written source integration
does not replace the analytic source step by a new axiom. It has not been
checked by Lean, so successful elaboration is not asserted.

The fidelity checker verifies the exported parameters and parent links;
it is not a Lean parser, elaborator or kernel. The target definitions
are statements to be proved, not theorems. The final return bridge and
endpoint module are deliberately absent instead of containing `sorry`.

Use the archived `lean-toolchain` and package pins: Lean 4.34.1 and the
matching Mathlib/dependency revisions. The successful upstream independent
replay documents any needed package compatibility patches. New generated
sources belong in the same project/import environment as the inherited
sources, under their `QRH87477137` module root.

After generation, `prepare.py` can create an isolated source-only Lake
project without overwriting an existing directory:

```sh
python auto-research/role-source-caps/formalization/prepare.py /absolute/new-build-directory
```

In that compatible build environment, fetch the pinned dependencies/caches
and attempt:

```sh
lake build QRH87477137.GlobalSources QRH87477137.Geometry QRH87477137.Targets
```

These are intermediate source and statement targets;
passing them would not establish the missing endpoint theorem.

In the research environment, the unmodified pinned Linux compiler failed
even at `lean --version` because its executable-location lookup through
`/proc/<pid>/exe` was denied. No compiler or kernel modification was made.
This startup failure is separate from the unfinished return proofs; a
working compiler alone does not finish them.

The required next work is recorded in [PROOF_OBLIGATIONS.md](PROOF_OBLIGATIONS.md).
Completion requires the full revised analytic return, a canonical endpoint
with no new mathematical assumptions, transitive axiom audits and a fresh
kernel replay. Only explicitly reported successful checks may change that
status. PR #23's separate Lean budget lemmas do not verify this endpoint.

Prepared for Subhanjan Das with substantial OpenAI Codex assistance.
New integration is MIT; Collet/OpenAI and inherited source notices remain.
