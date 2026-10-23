# Fine-step source chains: θ = 0.87477128 (conditional)

**Subhanjan Das (@subhanjandas) · 23 October 2026**
Prepared with substantial assistance from Claude (Anthropic).

> **Status: proposal.** Every finite inequality passes in exact rational
> arithmetic. The candidate still depends on Hailey Collet's analytic
> source rule and parameterized return (PR #8) applying at these new
> constants, and on the inherited preprint/Hecke inputs. It has **no Lean
> build** and **no independent review**. It is not an accepted record.

| | |
|---|---|
| Conditional candidate | θ = 87477128/100000000 = **0.87477128** |
| Previous conditional candidate (PR #26) | 0.87477137 (gain 9·10⁻⁸) |
| Independently Lean-verified endpoint (PR #8) | 0.8747729897 (gain 1.7097·10⁻⁶) |
| What changed | only the slope decrement of the two finite source chains |
| Exact check | `python auto-research/fine-step-source-chains/replay.py` (≈ 4–5 min) |

Formal proposal: [../proposals/2026-10-23-fine-step-source-chains.md](../proposals/2026-10-23-fine-step-source-chains.md).
Other documents: [VERIFICATION.md](VERIFICATION.md) (what was checked and
what was not) · [RESEARCH_LOG.md](RESEARCH_LOG.md) (everything we tried,
including what failed) · [SOURCE_MAP.md](SOURCE_MAP.md) (pinned references)
· [NOTICE.md](NOTICE.md) (credits and licenses).

## The idea in plain words

Collet's proof (PR #8) needs two "source moments": inequalities of the form
G(B, Λ, H), where a **larger B** and a **smaller Λ** make the statement
stronger. She builds them in a chain. Each link takes a proved face and
produces a new face with Λ a little smaller, at the price of a slightly
smaller B. Every link must pass a fixed list of inequalities (Collet's
NF gates). The final θ is then read off from the last face of each chain
through her return inequality.

PR #26 used two separate chains, one for the row **count** and one for
the **physical** numerator, each with its own width cap. The count chain
lowered Λ by 1/2000 per link (2,691 links). The physical chain lowered it
by 1/1000 per link (1,220 links).

A chain with smaller links loses less B for the same total drop in Λ:
each link's cost is fixed by its parent face, so smaller links follow the
improving faces more closely. We therefore rebuilt **both chains with links of 1/8000**:

| Role | Λ step | Links | Final B | Final Λ | Width cap |
|---|---:|---:|---|---|---:|
| Count | 1/8000 | 10,763 | 0.96259643646619 | 3.1519358 | 0.044001 |
| Physical numerator | 1/8000 | 9,764 | 0.96771143048276 | 3.2768108 | 0.043001 |

At equal Λ, finer links keep more B. For example, the physical chain at
Λ = 3.2768108 reaches B = 0.96770690 with steps of 1/2000, 0.96770993
with 1/4000 and 0.96771143 with 1/8000. RESEARCH_LOG.md §2 has the full
table.

Everything else is unchanged: the natural premise G(1, 4.4973108, 11/200),
the tight accounting (e, r, f) = (10⁻¹⁷, 10⁻¹², 10⁻¹⁰), the 0.499 centered
terminal, the physical width 1/25 and the final reserve 10⁻⁹. Only the
return height moves, to h = 80008777/100000000 = 0.80008777.

## How θ = 0.87477128 was obtained

1. **Search (floating point, candidates only).** `search.py` from PR #26,
   unchanged, with `--step .000125`. It stops each chain at the
   break-even slope that PR #26 already identified (the `--target`
   values). See [generate.md](generate.md) for the exact commands.
2. **Model (floating point).** `diagnostics/return_model.py` predicted
   θ ≈ 0.8747712758 for the two final faces at h ≈ 0.8000878.
3. **Exact certificate.** We chose the rational θ = 0.87477128, just above
   the prediction, and h = 0.80008777. `certify.py` checks all 20,527
   links and the full return exactly. It passes, with smallest return
   Bernstein coefficient ≈ 7.8·10⁻⁹ > 0.
4. **Lower bound on what this graph gives.** The same graph at
   θ = 0.87477127 is rejected (an uncertifiable box on edge `new_top`
   near δ = 0.458, p = 1/2). So 0.87477128 is within 10⁻⁸ of what these
   two faces can certify.

## What we learned (details in RESEARCH_LOG.md)

- **The finite approach is nearly exhausted.** Each halving of the step
  gains about half as much as the previous halving. Extrapolating, the
  continuum limit of these chains is θ ≈ 0.87477126. Roughly 2·10⁻⁸
  remains for anyone who refines further.
- **The chains already stop at the right place.** PR #26's search targets
  (0.042325 count, 0.039603 physical) match the break-even slopes
  −(∂θ/∂Λ)/(∂θ/∂B) measured in the return model (0.04240 and 0.03964) to
  within 0.2%.
- **Things that did not help:** earlier HIGH parents (they raise each
  link's cost), a min over several count faces in the return (gain below
  10⁻¹²), a wider physical width (inactive above 1/25), and re-deriving
  the natural cost K from the Lean-verified 0.8747729897 (gain about
  3·10⁻⁹, and it would need its own proof).
- **Where θ is decided.** At edge `new_top` (d = h), count C, δ ≈ 0.458,
  p = 1/2. There the count term (3/4)·d·R\* ≈ 0.36 dominates. Lowering the
  return exponent E there by ε lowers θ by only about 0.22ε.
- **Hard floor of this probe geometry.** The return uses ℓ = 11/3 − 4θ
  and requires the reserve 1/5 − ℓ > 0. Hence θ > 13/15 ≈ 0.8667 in this
  family whatever the source or count inputs. Reaching 0.86 or below
  requires a different probe geometry, not tuning.

## Reproduce

From the repository root (Python ≥ 3.10):

```sh
python -m pip install -r auto-research/fine-step-source-chains/requirements.txt
python auto-research/fine-step-source-chains/replay.py           # exact, ~4-5 min
cd auto-research/fine-step-source-chains
python check_controls.py --slow                                   # 6 negative controls, ~5 min
python diagnostics/run_diagnostics.py                             # optional, float, ~5 min
```

Saved outputs are in [evidence/](evidence/).

## Next steps

1. **Formal work (the real obligation).** Instantiate Collet's Lean
   interfaces (`nf_step`, `AdmittedWindow`, `PhysicalSchedule`,
   `beta_le_theta_of_finite_numerator`) with this graph and return, compile,
   audit axioms and replay the kernel. The same work is outstanding for
   PR #26; the two graphs differ only in data.
2. **Only if wanted, the last ~2·10⁻⁸.** Steps of 1/16000 and 1/32000.
   Exact replay time grows linearly (about 9 and 18 minutes).
3. **For a real gain, a new analytic input.** The most direct target is a
   better same-zero count R\* near δ ≈ 0.46, p = 1/2 (it sets θ at the
   binding point). A change of probe geometry that permits ℓ ≥ 1/5 is
   the only way below 13/15 in this family.

## Credits

Hailey Collet (PR #8) is the author of the analytic source/return
framework and the original cover; OpenAI supplies the QRH framework; Rohan
Arun and the repository's contributors supply the audit and tools; PR #26
(Subhanjan Das with OpenAI Codex) supplies the exact verifiers and search
code reused here. This contribution adds the finer graph, its exact
certificate, the extra negative control and the diagnostics. See
[NOTICE.md](NOTICE.md).
