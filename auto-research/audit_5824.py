"""Recompute numerical audit margins, defaulting to the N=5824 Track A point.

Accepts optional rational N and h, as in certify.py; run from any directory.
These arithmetic checks do not re-audit the analytic arguments; see
track-a-5824.md for the affected paper lines and scope.
"""
import argparse
import os
import sys
from fractions import Fraction as Q

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
from certify import high_exponent

ap = argparse.ArgumentParser(description=__doc__)
ap.add_argument("N", nargs="?", type=Q, default=Q(5824))
ap.add_argument("h", nargs="?", type=Q, default=Q(405967, 500000))
try:
    args = ap.parse_args()
except ZeroDivisionError:
    ap.error("rational values must have nonzero denominators")
if args.N <= 0 or args.h <= 0:
    ap.error("N and h must be positive")
ell = Q(1, 6) + 1/args.N
h = args.h
sigma = Q(11, 12) - ell / 4
lx = 1 + ell - h
b = 2*h - 1 - 3*ell
ly = h - 2*ell

if args.N == 5824:
    assert sigma == Q(20383, 23296)
    assert Q(10195, 11652) - sigma == Q(1, 67861248)
assert lx/2 + b/12 == lx/2 + sigma - 1 + h/6

# Euler exponents use x_r=sigma, z_r=33/200, w_r=19/20.
# The R term has an additional arbitrarily small vartheta in the paper.
good = 1 - sigma - Q(19, 20) - 6*Q(33, 200)
ramified = 1 - sigma - Q(19, 20)
remainder = 4 - 6*sigma - 6*Q(33, 200)
compensated = 4 - 5*sigma - 6*Q(33, 200)
tail = -good - 1
c0 = Q(1, 2) + ell/2 + h/3 - sigma
small = h*(Q(17, 50) - Q(1, 6)) - ly/2

margins = {
    "Euler good exponent < -1": -1 - good,
    "Euler ramified exponent < 0": -ramified,
    "Euler remainder exponent < -1": -1 - remainder,
    "Euler tail > 4/5": tail - Q(4, 5),
    "compensated error < -sigma": -sigma - compensated,
    "other compensated error -47/50 < -sigma": Q(47, 50) - sigma,
    "epsilon0 = sigma - 1/2 > 1/4": sigma - Q(3, 4),
    "5 ell < 1 (clipped low branch)": 1 - 5*ell,
    "Mprime >= 1 - 3 ell > 0": 1 - 3*ell,
    "Yprime exponent >= h - 3 ell > 0": h - 3*ell,
    "lx - ell > 3/16": 1 - h - Q(3, 16),
    "ly - ell - 11 b/6 > 1/12": ly - ell - Q(11, 6)*b - Q(1, 12),
    "extension room > 1/48": 5*ell - h - Q(1, 48),
    "ell/h > 8/39": ell/h - Q(8, 39),
    "principal price 7 ell/(16 K) < sigma ell/K": sigma - Q(7, 16),
    "m_w > 0": ly/20,
    "m_z > 0": h/600,
    "C0 < 0": -c0,
    "small-row exponent < 0": -small,
    "live-endpoint slope < 0": h - Q(1, 2) - 3*ell/2,
    "intermediate d=1/2, delta=3/4": -high_exponent(
        ell, h, Q(3, 4), Q(3, 8), Q(76, 75) - Q(1, 2), Q(1, 2)),
}
for name, margin in margins.items():
    assert margin > 0, (name, margin)
    print(f"OK {name}: {margin}")

print(f"{len(margins)}/{len(margins)} exact audit margins positive")
print(f"row-norm loss supremum (6 ell - 1)/4 = {(6*ell - 1)/4}")
print(f"C(sigma) = lx/2 + b/12 = {lx/2 + b/12}")
print(f"C(s) = s - {1 - lx/2 - h/6}")
print(f"B0 = lx/2 + 1 + ly = {lx/2 + 1 + ly}")
