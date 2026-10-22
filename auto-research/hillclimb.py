"""Track A: find the numerical edge in (ell, h), then certify the best rational point exactly.

  python auto-research/hillclimb.py [--start 5900] [--stop 5820] [--step 1] [--maxdepth 22]

Tries ell = 1/6 + 1/N for N from --stop upward to --start (largest ell first) and, for each N,
a few rational h near the numerically optimal h. Stops at the first point that certifies and
prints the row to add to auto-research/results.md.
"""
import argparse, os, sys, datetime
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
from scipy.optimize import minimize_scalar
ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
sys.path.insert(0, ROOT)
from budget import E, Rstar
import certify as C

ap = argparse.ArgumentParser()
ap.add_argument("--start", type=int, default=5900)
ap.add_argument("--stop", type=int, default=5820)
ap.add_argument("--step", type=int, default=1)
ap.add_argument("--maxdepth", type=int, default=22)
a = ap.parse_args()

dl = np.linspace(0, 5/6, 4001)[:, None]; xs = np.linspace(0, 0.5, 201)[None, :]
R29, _ = Rstar(dl, xs, 2/9)
def best_h(ell):
    r = minimize_scalar(lambda h: E(h, dl, xs, R29, ell, h).max(), bounds=(0.80, 0.83),
                        method="bounded", options={"xatol": 1e-9})
    return r.x

box = ((sp.Rational(0), sp.Rational(5, 6)), (sp.Rational(0), sp.Rational(1, 2)))
for N in range(a.stop, a.start + 1, a.step):
    ell = Fr(1, 6) + Fr(1, N)
    h0 = best_h(float(ell))
    for dh in (0, 1, -1, 2, -2):
        h = Fr(round(h0 * 10**6) + dh, 10**6)
        side = C.side_constraints(ell, h)
        if min(side.values()) <= 0:
            continue
        F, _ = C.adaptive_poly(ell, h)
        if C.prove_positive(F, box, maxdepth=a.maxdepth):
            s0 = Fr(11, 12) - ell / 4
            print(f"CERTIFIED  ell = 1/6 + 1/{N}  h = {h}  sigma0 = {s0} = 7/8 - {Fr(7, 8) - s0}")
            print(f"results.md row:\n| {datetime.date.today()} | <you> | A | {s0} | ell=1/6+1/{N}, h={h} "
                  f"| `python certify.py {N} {h}` | certified |")
            sys.exit(0)
    print(f"N={N}: no certificate (h0={h0:.7f}); try a larger N or raise --maxdepth")
print("nothing certified in range")
