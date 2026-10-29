# Numerical search record

These files are diagnostics, not certificates. All analytic interpretations
remain conditional on the preprint's 7/8 theorem. Substantially AI-assisted by
OpenAI Codex, using the inherited Sil/Collet/ArviFoxy/Sussman formulas.

`scout_chain.py ROLE DECREMENT OUTPUT.json` starts a chain from #86's final
count source or boot physical source. `fast_scout.py ROLE DECREMENT OUTPUT.json
SEED.json` uses the preceding search family's nearby optimizer seeds.
`select_config_candidate.py COUNT.json PHYSICAL.json ROUND_DIRECTORY CONFIG.json`
chooses chain prefixes, height and an outward-rounded rational boundary.
Run from this directory with NumPy and SciPy installed.

The chronological changes are recorded in `../ledger.json`. Round 1 uses
count decrement `1/1600` and the preceding submission's physical chain;
round 2 refines the physical decrement to `1/800`. Round 3 reduces
`QRH_SOURCE_MARGIN` from `2e-6` to `2e-7`. Round 4 uses
`QRH_LOW_RESERVE=1/100000 QRH_LOW_MARGIN=0`. Rounds 5 and 6 use
`config5.json` and `config6.json` for the proved floor reserve and numerator cap.
Round 7 refines the physical decrement to `1/1600`; round 8 uses `config8.json`
for the smaller return reserve. Round 9 uses `QRH_LOW_RESERVE=1/1000000`.

The final search uses:

```sh
QRH_LOW_RESERVE=1/1000000 QRH_SOURCE_MARGIN=2e-8 QRH_LOW_MARGIN=0 QRH_SEARCH_N=1025 QRH_SOURCE_DIGITS=13 QRH_A_DIGITS=10 QRH_D_DIGITS=7 python fast_scout.py count 1/1600 new-count.json count-1600-e5-m7.json
QRH_LOW_RESERVE=1/1000000 QRH_SOURCE_MARGIN=2e-8 QRH_LOW_MARGIN=0 QRH_SEARCH_N=1025 QRH_SOURCE_DIGITS=13 QRH_A_DIGITS=10 QRH_D_DIGITS=7 python fast_scout.py physical 1/1600 new-physical.json physical-800-e5-m7.json
python select_config_candidate.py new-count.json new-physical.json new-round config8.json
```

Outputs are supplied for provenance. Numerical optimizers can vary by platform;
the canonical rational inputs in the ten round directories are authoritative.
Their exact certifiers are separate. The standalone exploratory `explore.py`
command additionally accepts a pinned tracker checkout via `QRH_TRACKER`.
