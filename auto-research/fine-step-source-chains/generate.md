# Regenerating the candidate graph (floating-point search)

The search only proposes candidates. `sources.json` is authoritative and is
checked exactly by `replay.py`; the search output need not be bitwise
portable across NumPy/SciPy builds.

From this directory:

```sh
python search.py --step .000125 --cap .044001 --target .04232527914 --steps 16000 --output count-raw.json
python search.py --step .000125 --cap .043001 --target .03960260713 --steps 12800 --output physical-raw.json
python combine.py count-raw.json physical-raw.json --output sources-new.json
cmp sources-new.json sources.json   # identical on the recorded environment
```

`search.py`, `search_model.py` and `combine.py` are PR #26's files,
unchanged. The `--target` values are PR #26's break-even slopes (see
RESEARCH_LOG.md §3). Each run takes a few minutes on one core.

The coarser runs used in RESEARCH_LOG.md §2 differ only in `--step`
(`.0005`, `.00025` for count; `.0005`, `.00025` for physical) and
`--steps`. Their final nodes are saved in
`diagnostics/refinement-endpoints.json`.
