#!/usr/bin/env python3
"""Floating-point diagnostics behind RESEARCH_LOG.md (not proofs).

Writes diagnostics.json. Needs NumPy, SciPy and SymPy; about 5 minutes on two cores.
Every theta printed here is a model estimate; only ../certify.py certifies.
"""
import json
import sys
import time
from fractions import Fraction as Q
from pathlib import Path

import numpy as np
import sympy as sp

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent))
import return_model as RM  # noqa: E402
import search  # noqa: E402
import search_model  # noqa: E402
from step_model import best_step  # noqa: E402

K = 4.4973108
out = {"scope": "Floating-point model estimates only; the exact certificate is ../certificate.json."}


def f(x):
    return float(x)


def theta_of(c, p, **kw):
    return RM.Model(f(c["B"]), f(c["L"]), f(p["B"]), f(p["L"]), **kw).best()


t0 = time.time()
# 1. Calibration against exactly certified points.
cal = {
    "PR #8 (Collet), exact 0.8747729897": ((0.96226151753982, 3.14813176381578), (0.96739031091242, 3.27307995389766)),
    "PR #26, exact 0.87477137": ((0.96258631988264, 3.1518108), (0.96772063836150, 3.2773108)),
    "this proposal, exact 0.87477128": ((0.96259643646619, 3.1519358), (0.96771143048276, 3.2768108)),
}
out["calibration"] = {}
for name, (c, p) in cal.items():
    t, h = RM.Model(*c, *p).best()
    out["calibration"][name] = {"model_theta": t, "model_h": h}
    print(name, t, h, flush=True)

# 2. Step-refinement table and first-order extrapolation.
runs = json.loads((HERE / "refinement-endpoints.json").read_text())["runs"]
counts = [k for k in runs if k.startswith("count")]
phys = [k for k in runs if k.startswith("physical")]
table = {}
for ck in counts:
    for pk in phys:
        t, h = theta_of(runs[ck]["final"], runs[pk]["final"])
        table[f"{ck} x {pk}"] = t
        print(ck, pk, t, flush=True)
finest = table[f"{counts[-1]} x {phys[-1]}"]
dc = table[f"{counts[-2]} x {phys[-1]}"] - finest
dp = table[f"{counts[-1]} x {phys[-2]}"] - finest
out["refinement"] = {
    "theta_by_steps": table,
    "last_halving_gain_count": dc,
    "last_halving_gain_physical": dp,
    "first_order_continuum_estimate": finest - dc - dp,
}
print("continuum estimate", finest - dc - dp, flush=True)

# 3. Break-even slope of each role (search 'target').
c, p = cal["this proposal, exact 0.87477128"]
base, h0 = RM.Model(*c, *p).best()
eps = 1e-4
grad = {}
for i, name in enumerate(["BC", "LC", "BP", "LP"]):
    v = list(c + p)
    v[i] -= eps
    grad[name] = (RM.Model(*v).best(h0)[0] - base) / (-eps)
out["gradients_dtheta_dparam"] = grad
out["break_even_slope"] = {
    "count": -grad["LC"] / grad["BC"], "count_search_target": 0.04232527914,
    "physical": -grad["LP"] / grad["BP"], "physical_search_target": 0.03960260713,
}
print("gradients", grad, out["break_even_slope"], flush=True)

# 4. HIGH-parent choice for one count step (later parents are better).
graph = json.loads((HERE.parent / "sources.json").read_text())
by = {n["id"]: n for n in graph}
low = (f(by["count_10762"]["B"]), f(by["count_10762"]["L"]), 0.044001)
hp = {}
for k in [10762, 10000, 8000, 5000, 2000, 500]:
    n = by[f"count_{k}"]
    hp[f"count_{k}"] = best_step(low, (f(n["B"]), f(n["L"]), 0.044001), 0.000125, 0.044001, K)[0]
hp["natural"] = best_step(low, (1.0, K, 0.055), 0.000125, 0.044001, K)[0]
out["high_parent_minimal_crossing"] = {k: float(v) for k, v in hp.items()}
print("HIGH parents", hp, flush=True)

# 5. Multi-face count envelope.
m = RM.Model(*c, *p)
single = m.best()[0]
extra = RM.Model(f(by["count_9000"]["B"]), f(by["count_9000"]["L"]), *p)
for k_, v in extra.R.items():
    m.R[k_ + " (count_9000)"] = v
out["multi_face_gain"] = single - m.best()[0]

# 6. Physical width s.
m = RM.Model(*c, *p)
out["physical_width"] = {str(s): m.best(s=s)[0] for s in [0.04, 0.041, 0.042, 0.0429]}

# 7. Leverage of analytic inputs.
m = RM.Model(*c, *p)
lev = {}
for e_ in [1e-4, 1e-3]:
    lev[f"uniform E reduction {e_}"] = (base - m.best(h0, 0.01, shift=e_)[0]) / e_
for dv in [Q(1, 1000), Q(1, 100)]:
    RM.V0 = sp.Rational(5, 6) - sp.Rational(dv.numerator, dv.denominator)
    lev[f"V0 = 5/6 - {dv}"] = base - RM.Model(*c, *p).best(h0, 0.01)[0]
RM.V0 = sp.Rational(5, 6)
ex, arg = RM.Model(*c, *p).excess(base, h0)
lev["binding_point"] = {"edge_index": arg[0], "edge": ["old_small", "old_peak", "old_switch", "new_switch", "new_top", "new_kink"][arg[0]],
                        "delta": arg[1], "p": arg[2], "d": arg[3], "capacity": arg[4], "R_star": arg[5],
                        "count_term_3d_R_over_4": 0.75 * arg[3] * arg[5]}
out["leverage"] = lev
print("leverage", lev, flush=True)


# 8. Natural-cost bootstrap from the Lean-verified PR #8 endpoint (diagnostic only).
def chain(Kval, step, cap, target, steps):
    search_model.K = Kval
    parent, last = (1.0, Kval, 0.055), None
    for _ in range(steps):
        r = search.next_source(parent, step, cap, target)
        if r is None:
            break
        last = r
        parent = (r[0], r[1], cap)
    search_model.K = K
    return {"B": last[0], "L": last[1]}


K8 = 6 * (2 * 0.8747729897 - 1)
res = {}
for label, Kval in [("K = 4.4973108", K), (f"K = 6(2*0.8747729897-1) = {K8:.10f}", K8)]:
    cc = chain(Kval, 0.0005, 0.044001, 0.04232527914, 3000)
    pp = chain(Kval, 0.001, 0.043001, 0.03960260713, 1600)
    res[label] = RM.Model(cc["B"], cc["L"], pp["B"], pp["L"], KI=Kval).best()[0]
    print(label, res[label], flush=True)
vals = list(res.values())
out["natural_cost_bootstrap"] = {"theta_at_steps_1/2000_and_1/1000": res, "gain": vals[0] - vals[1]}

# 9. Exact geometric floor of this probe family.
th, el = sp.symbols("theta ell")
ell_of_theta = sp.Rational(11, 3) - 4 * th
floor = sp.solve(sp.Eq(ell_of_theta, sp.Rational(1, 5)), th)[0]
out["geometry_floor"] = {"ell(theta)": str(ell_of_theta), "reserve": "1/5 - ell > 0",
                         "theta_floor": str(floor), "decimal": float(floor)}
out["seconds"] = time.time() - t0
(HERE / "diagnostics.json").write_text(json.dumps(out, indent=2) + "\n")
print(json.dumps({k: out[k] for k in ["refinement", "break_even_slope", "multi_face_gain", "natural_cost_bootstrap", "geometry_floor"]}, indent=1))
