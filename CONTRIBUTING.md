# Contributing and independent review

**Agents and open-ended "contribute" tasks: start with [auto-research.md](auto-research.md).** It covers the current state, the two research tracks, the tools, and the reporting format. If a user gave you a specific assignment, do that instead of picking a new task. [AGENTS.md](AGENTS.md) points here too.

This is a research draft. Everything in it is **conditional on the 7/8 theorem of OpenAI's Quasi-RH preprint** (openai/math, `preprints/The-Quasi-Riemann-Hypothesis-September-30-2026`). Corrections to the mathematics, the code, attribution, or the stated scope are welcome as issues or pull requests.

## Before you start

- **Check what's already there.** Read the open issues, open PRs, and [auto-research/results.md](auto-research/results.md). Don't redo a result that's already logged, and don't re-certify an old point as new.
- **Pick up the current record:** [README.md](README.md) (claim and status), [AUDIT_SUMMARY.md](AUDIT_SUMMARY.md) (every edit the new geometry requires), and `audit/A–F` (the line-by-line reports).
- **Claim larger tasks.** If you start something substantial, open an issue titled `[claim] <task>`. Claims are advisory; findings stay provisional until their evidence is checked.
- **Write handoffs.** A focused finding or handoff note is a valid outcome. A PR isn't mandatory.

## Kinds of contribution

### 1. A parameter improvement (Track A)

- **Give exact values.** State a rational (ℓ, h), and run `python certify.py N h`, where ℓ = 1/6 + 1/N. Every line must print `OK`, and the adaptive endpoint must print `True`.
- **Use the search tool.** `python auto-research/hillclimb.py` searches and certifies for you.
- **Say whether the audit covers your point.** The audited edits in `AUDIT_SUMMARY.md` were checked at ℓ = 1/6 + 1/5900. If you move ℓ further, say whether every margin listed there still holds. Recompute them; don't assume.
- **Know the ceiling.** Within the frozen architecture the edge is σ₀ ≈ 7/8 − 4.293·10⁻⁵, and we're within about 2·10⁻⁸ of it. Track A is close to exhausted.

### 2. A structural idea (Track B)

- **Write it up.** Add a file in [auto-research/proposals/](auto-research/proposals/) using the template there: which lemma changes, the exact estimate you need, the σ₀ it would give (`auto-research/whatif.py`), and what else it affects, with line numbers in `build/paper.tex`.
- **Say whether it's proved.** A proposal is not a result. Mark it `proposal` until the needed lemma is proved, and `proved` once it is, with a reference.

### 3. Review and verification

These are the most valuable contributions right now:

- **Check the two substantive edits** in `AUDIT_SUMMARY.md`:
  - lowering the second Euler region to x_r ≥ σ₀;
  - the ((d − 1 + 5ℓ)/4)₊ loss in Lemma *probe-row-norm*.
- **Write a patched `paper.tex`** that applies every edit from `AUDIT_SUMMARY.md`.
- **Re-read lines 1–3723**, which the audit did not cover.
- **Formalize in Lean** the inequalities `certify.py` checks.

### 4. Negative results and reproductions

- **Ceilings:** a proven ceiling under some idealization, a counterexample, or a gap in the audit is as welcome as an improvement.
- **Reproductions:** an independent reproduction of `certify.py` (another language or CAS) is welcome too.

## Reporting a mathematical issue

- **Locate it exactly.** Name the lemma, equation label, or line in `build/paper.tex`, or the file and function in this repo.
- **Give the failure.** Provide a counterexample or the missing implication where you can.
- **Separate evidence from proof.** Distinguish *numerical evidence* (floating-point search, `whatif.py`, `edge.py`) from a *proof obligation* (exact certificate, proved lemma). The search tools only find candidates.

## Rules for changes

- **Exact or nothing.** A new constant needs an exact certificate: rational arithmetic, Bernstein/SOS positivity, or interval arithmetic.
- **Keep the record honest.** When you change a claim, update `README.md`, `auto-research.md` (current-state table) and `auto-research/results.md` together, so no file still calls an older result "current".
- **Don't rewrite history.** Leave old rows in `results.md` and the audit reports unchanged. Add new rows or new reports instead.
- **Regenerate, don't hand-edit.** If you change `budget.py` or `certify.py`, rerun the checks the change affects and include their output in the PR.
- **Don't overclaim.** A certificate checks the final-section inequalities. It is not a verification of the whole theorem. List which proof obligations remain open.

## Credit and AI disclosure

- **Build on others openly.** Name the work you build on and say what yours adds, even if a parallel result has a stronger headline.
- **Credit is kept.** Useful contributions stay credited in [CONTRIBUTORS.md](CONTRIBUTORS.md) even when superseded.
- **Disclose AI help.** Say if a contribution was substantially AI-assisted, as the initial audit was.
- **Licensing:** contributions are accepted under the Apache License, Version 2.0 (see `LICENSE`). The preprint itself is OpenAI's work and is not covered by it; this repo only references it.
