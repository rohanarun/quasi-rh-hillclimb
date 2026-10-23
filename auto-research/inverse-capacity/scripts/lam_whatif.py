"""theta(lam): Collet's return with a marked inverse moment of slot coefficient lam.

Usage: python lam_whatif.py [--second none|fixed|scaled] LAM [LAM ...]
Sources fixed at PR #27's final faces; source chains not re-run.
Floating point, coarse delta grid (0.01): DIAGNOSTIC ONLY."""
import sys, json, numpy as np
from scipy.optimize import minimize_scalar
from lam_model import rstar, make_I, make_P_source, make_P_natural
import os
SECOND = "none"
BC, LC, BP, LP = 0.96259643646619, 3.1519358, 0.96771143048276, 3.2768108
dl = np.linspace(0.0, 0.75, 76); pl = np.linspace(0, 0.5, 6)

def excess(theta, h, lam, s=0.04, fee=1e-9, nd_extra=6, detail=False):
    ell = 11/3 - 4*theta; x = 1 + ell - h; y = h - 2*ell; k = 2*theta - 1
    if not (x > ell and y > x and ell < 0.2 and 2*x > y + ell): return 1.0, None
    ds = 2*y/(1 + 6*k*s); dk = 2*y/(2 - BP + LP*s); dp = h + 1e-10; d0 = 1/200
    ds_list = sorted(set([d0, y, ds, dk, dp] + list(np.linspace(d0, dp, nd_extra))))
    worst = -np.inf; arg = None
    for d in ds_list:
        supply = ell/d
        if d <= ds: C = min(d, 2*y - d)/(6*k)
        else: C = min(s*d, (2*y - (2 - BP)*d)/LP)
        D, Pp = np.meshgrid(dl, pl, indexing='ij')
        I = make_I(lam, supply, SECOND)
        cands = []
        for Pf in (make_P_source(BC, LC, 0.044 - 1e-7, supply), make_P_source(BP, LP, 0.043 - 1e-7, supply), make_P_natural(k, supply)):
            R, _, _ = rstar(D, Pp, I, Pf, it=40)
            cands.append(R)
        Rs = np.minimum.reduce(cands)
        E = 0.5 + 13*h/75 - y/2 - ell/2 - 0.09*d + D/2 + D*Pp*(ell - C/2) + 0.75*d*Rs
        m = E.max()
        if m > worst:
            j = np.unravel_index(E.argmax(), E.shape); worst = m; arg = (d, dl[j[0]], pl[j[1]], float(Rs[j]))
    return worst - (theta - fee), arg

def theta_at(h, lam):
    lo, hi = 0.8667, 0.8749
    if excess(hi, h, lam)[0] >= 0: return hi
    for _ in range(26):
        mid = (lo + hi)/2
        if excess(mid, h, lam)[0] < 0: hi = mid
        else: lo = mid
    return hi

if __name__ == "__main__":
    args = sys.argv[1:]
    if args and args[0] == "--second":
        SECOND = args[1]; args = args[2:]
    out = {}
    for lam in [float(a) for a in args]:
        r = minimize_scalar(lambda h: theta_at(h, lam), bounds=(0.74, 0.86), method='bounded', options={'xatol': 1e-6})
        th, h = r.fun, r.x
        out[lam] = {"theta": th, "h": h, "binding": excess(th + 1e-7, h, lam)[1]}
        print(lam, SECOND, json.dumps(out[lam]), flush=True)
