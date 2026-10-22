"""Certify a rational Track A point within 1e-12 of the fixed-budget obstruction.

The obstruction was reported by Daugherty, Ryan and Ward in repository issue #4.
This checks its algebra against the current budget and certifies the new point;
it does not claim an unconditional theorem or a new discovery of the obstruction.
"""
import os
import sys
from fractions import Fraction as Q
import sympy as sp

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
import certify as c

N = Q(1250000000, 214651)
ell = Q(1, 6) + 1/N
h = Q(8119602997, 10000000000)
sigma = Q(11, 12) - ell/4
assert sigma == Q(4374785349, 5000000000)
assert Q(20383, 23296) - sigma == Q(1991, 455000000000)

# At x=1/2 (y=0), the frozen balanced count has this rational form.
d = c.d
L, H = sp.symbols("ell h")
J108 = 185 - 138*d
R = (185 - 288*d + 96*d**2)/J108
f = sp.cancel(-J108*c.high_exponent(L, H, d, d/2, R, H))
expected = ((207*L - 96*H + 69)*d**2
            + (-174*L + 196*H - 150)*d
            - sp.Rational(555, 4)*L - sp.Rational(185, 3)*H
            + sp.Rational(925, 12))
assert sp.expand(f - expected) == 0

root = sp.sqrt(921)
d_star = (49 - root)/48
ell_star = sp.Rational(11, 551) + 8*root/1653
sigma_floor = (1507 - 2*root)/1653
K = (2293 + 663*root)/128
h_star = sp.Rational(254, 551) + 5869*root/507471
assert 30**2 < 921 < 31**2  # Gives 0 < d_star < 5/6 and K > 0.
assert sp.simplify(f.subs(d, d_star) - K*(ell_star - L)) == 0
assert sp.simplify(sp.diff(f, d).subs({d: d_star, L: ell_star, H: h_star})) == 0
assert sp.simplify(sp.Rational(11, 12) - ell_star/4 - sigma_floor) == 0
assert sp.simplify(1/(ell_star - sp.Rational(1, 6)) - (2910 + 96*root)) == 0
assert (Q(5823 - 2910, 96))**2 < 921 < (Q(5824 - 2910, 96))**2
print("Exact obstruction: F(d_star, 0) = K (ell_star - ell), K > 0")
print("Any feasible point requires sigma > (1507 - 2 sqrt(921))/1653")
print("For ell = 1/6 + 1/N with N > 0: N > 2910 + 96 sqrt(921), between 5823 and 5824")

# Squaring positive rational endpoints proves the gap without float comparisons.
sqrt_lo = (1507 - 1653*sigma)/2
sqrt_hi = sqrt_lo + Q(1653, 2*10**12)
assert 0 < sqrt_lo and sqrt_lo**2 < 921 < sqrt_hi**2
print("Exact rational squares prove 0 < sigma - sigma_floor < 1/10^12")

F, J = c.adaptive_poly(ell, h)
assert sp.expand(F.as_expr().subs(c.y, 0) - f.subs({L: ell, H: h})) == 0
assert sp.expand(J.as_expr().subs(c.y, 0) - J108) == 0
box = ((sp.Rational(0), sp.Rational(5, 6)),
       (sp.Rational(0), sp.Rational(1, 2)))
leaves = []
assert c.prove_positive(J, box, maxdepth=34)
assert c.prove_positive(F, box, maxdepth=34, log=leaves)
assert len(leaves) == 38
lower = min(v for _, v in leaves)
assert lower == sp.Rational(889511697, 1717986918400000000)
assert sum((b[0][1]-b[0][0])*(b[1][1]-b[1][0]) for b, _ in leaves) == sp.Rational(5, 12)
side = c.side_constraints(ell, h)
assert len(side) == 12 and all(v > 0 for v in side.values())
print(f"CERTIFIED sigma = {sigma}, ell = {ell}, h = {h}")
print(f"38 Bernstein boxes; exact minimum coefficient {lower}; all 12 side constraints positive")
