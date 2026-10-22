# A Lean-verified point on the Track A line: 7/8 − 1/160000

Track A in this repo moves ℓ = 1/6 + τ, with σ₀ = 11/12 − ℓ/4 = 7/8 − τ/4. Its points are certified exactly by `certify.py`, but they stay **conditional on the preprint's 7/8 theorem**, and none is checked in Lean.

This folder adds the first point on that line with a **full Lean proof**:

  **Re s > 139999/160000 = 7/8 − 1/160000 ≈ 0.87499375**, at τ = 1/40000 (ℓ = 1/6 + 1/40000, h = 13/16 + 3/80000).

It covers ζ(s), every Dirichlet L-function and the finite-order Hecke family over Q(√−3). The pole exceptions are unchanged. The proof is the complete OpenAI 7/8 formalization plus [Argonaut Math's perturbed overlay](https://github.com/Argonaut-Math/argonaut-math-quasi-riemann-boundary) (release v0.1.8, τ = 10⁻⁶), with τ raised 25×. **It is not conditional on anything outside Lean.** The three theorems depend only on `propext`, `Classical.choice` and `Quot.sound`.

It is weaker than this repo's conditional records (7/8 − 1/23600 audited, 7/8 − 1/23304 certified). It is far weaker than the tracker's Lean record (0.8748087, PR #68), which uses a different method. What it adds is a Lean anchor on the Track A line, and a precise account of what stops the Lean proof from going further along that line.

## What changed

[`apply_tau.py`](apply_tau.py) rewrites 17 files of the v0.1.8 source overlay, and only numerals that depend on τ. Run it from the reconstructed build project. It preserves line endings, reproduces the verified sources byte for byte, and prints the hash of the terminal file:

| quantity | v0.1.8 | this patch |
|---|---|---|
| τ (`tau`, `rho`, `rho0`, `perturbedRho`) | 1/1000000 | 1/40000 |
| σ_τ = 7/8 − τ/4 | 3499999/4000000 | 139999/160000 |
| τ/4 | 1/4000000 | 1/160000 |
| 3τ/2 (row-height shift) | 3/2000000 | 3/80000 |
| σ_τ − 11/16 | 749999/4000000 | 29999/160000 |

No tactic, proof term or definition shape changes. Every τ-dependent proof re-checks unchanged. `certify.py` also accepts the point ([`evidence/certify_40000_output.txt`](evidence/certify_40000_output.txt)).

## Verification

The run was on a fresh Ubuntu 24.04 machine (8 cores) on 2026-10-21. It started from the published `Lean_Proof_Source.zip` (SHA-256 `37602f93…5a93`), with all 42 dependencies at their pinned revisions.

| step | result |
|---|---|
| `reconstruct.py --apply-overlay` | PASS, 12,055 files |
| apply the τ change (`apply_tau.py`) | 17 files; `PerturbedBoundaryMain.lean` SHA-256 `aa22e3cd…7a18` |
| clean `lake build +PerturbedBoundaryMain` | PASS, 12,004 jobs, 59 min |
| `PerturbedBoundaryMainCurrentFullAuditV2.lean`, `HUBBLE-PrincipalV2-TerminalAudit.lean` | PASS: only `propext`, `Classical.choice`, `Quot.sound` |
| Comparator (`comparator` d03acab, `lean4export` 076e8e5, `landrun` 811cfff, Landlock ABI 4), with the challenge stating `139999 / 160000` | **`Lean default kernel accepts the solution` / `Your solution is okay!`** |

The logs and hashes are in [`evidence/`](evidence/), trimmed to the result lines. Comparator ran directly under `lake env`, as root and with `LEAN_NUM_THREADS=8`, not inside Argonaut's `systemd-run` guard. [`.github/workflows/lean-tau-comparator.yml`](../.github/workflows/lean-tau-comparator.yml) is Argonaut's guarded Comparator workflow with two changes: it runs `apply_tau.py` (with a hash check), and it states the new bound. It runs on `workflow_dispatch`.

## What stops the Lean proof at τ ≈ 3·10⁻⁵

The formalization charges the endpoint's τ-cost as **15τ/8** and requires it to fit in **half** of the certified margin 49/440640 (`web-central-07-adapted/PerturbedCentralBudget.lean:38`). That caps τ at 392/13219200 ≈ 2.965·10⁻⁵. At τ = 1/30000 the build fails at exactly that line; it is the only module that fails.

That is about 6× short of this repo's Track A edge (ℓ − 1/6 ≈ 1.717·10⁻⁴). Closing the gap in Lean needs three things:

1. **A τ-aware endpoint certificate.** Replace `Endpoint.lean`'s single SOS identity (margin 49/440640) with a proof of E_τ(δ, x) < 0 at the target τ. `certify.py`'s Bernstein boxes are a ready-made source for it.
2. **A re-split of the central budget** at the line above.
3. **The two substantive edits in `AUDIT_SUMMARY.md`**: the Euler region lowered to x_r ≥ σ₀, and the extra row-norm loss. These only start to matter beyond this patch's τ.

With those, the audited point 7/8 − 1/23600 could become a Lean result.

## How this was found

Reading the paper and the Lean source turned up every inequality that depends on τ. A CPU numerical scan located the slack. Lean then confirmed both sides: τ = 1/40000 builds, and τ = 1/30000 fails at the predicted line. Done with Claude (AI-assisted).
