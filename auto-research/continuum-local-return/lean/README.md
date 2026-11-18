# Radical physical packet replay

The six theorems in `RadicalPhysical.lean` extend the physical coefficient mass to any nonnegative row-only dilation whose product with the repeated error-prime norms is at most one. They prove admissibility for the actual primitive-and-redundant conductor when the radical norm is at most $U^{1-c}$, the error widths total at most $c/2$, and the gain $b$ is at most $c/3$. The final theorem transfers $b$ to the reflected length in each active bin, at every positive coefficient scale. The subsequent fourth-moment bin assembly, conductor interpolation, and target comparison are supplied in the written argument.

Use Lean 4.34.1 and a compiled challenge project with the Collet physical packet modules on its Lake search path. The two directly imported source files have git blob IDs `7781b41058c0d460e0a5dadd3ef073d68fb07bab` and `b3a8103d7f4112407842a4ddd201b6cf250544d7`. Both correspond to tracker #143 head `c74d855c3bdfceeee059501aea76c8b1627b9abd`. All 1,017 transitive submission source files found in the local cache match that revision. Lake warned of local changes in the cached external packages `PrimeNumberTheoremAnd` and `rellich-kondrachov`. This replay checks the new module using the compiled imports. A clean rebuild of every dependency was outside this check. [Pinned physical packet sources](https://github.com/GTimG/QuasiRiemannTracker/tree/c74d855c3bdfceeee059501aea76c8b1627b9abd/submissions/2026-10-21-hailey-collet-1252270103/src/Submissions/hailey_collet_1252270103/Cycle25/Numerator/Imported)

Run the following from the directory containing the new module and replay script. The script compiles into a temporary directory, guards all six axiom lists, and replays the compiled module using Lean’s kernel checker with the project’s compiled imports. The successful local audit reported only `propext`, `Classical.choice`, and `Quot.sound` for all six declarations.

```sh
bash replay.sh /path/to/compiled/challenge-project
```

Prepared with OpenAI Codex assistance. The application to a QRH bound assumes the preprint’s 7/8 theorem.
