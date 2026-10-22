"""Exact identities for the completed-row geometry tradeoff.

Run: python auto-research/certify_completed_row_geometry.py
See completed-row-geometry.md for the hypotheses and proof. This certifies
exponent algebra, not the preprint's analytic lemmas or a new zero-free bound.
"""
import sys
from pathlib import Path

import sympy as sp

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from certify import adaptive_poly, high_exponent

Q = sp.Rational
checks = 0


def check(condition, label):
    global checks
    if not condition:
        raise ArithmeticError(label)
    checks += 1


def equal(actual, expected, label):
    check(sp.simplify(actual - expected) == 0, label)


def nonnegative_polynomial(expr, variables, label):
    coefficients = sp.Poly(sp.expand(expr), *variables).coeffs()
    check(all(c >= 0 for c in coefficients), label)


def loss(ell, rho, d):
    return max(rho - 3*d, 0) + max((5*ell - 1 - 2*rho + d)/4, 0)


ell, rho, d, h = sp.symbols('ell rho d h', real=True)
O, gap, A, N, B, S, z = sp.symbols('O gap A N B S z', nonnegative=True)
v, lb, e, u, T = sp.symbols('v lb e u T', nonnegative=True)
m = 1 - ell + rho - 2*d
remaining = ell - d
H = m - O - gap
dual = 2*H + 2*A + 2*z - 1 - remaining - N - 3*B

equal(dual - H, rho - 3*d - gap - (O-2*A)
      - 2*(remaining-z) - N - 3*B, 'dual overflow identity')
equal(1 + 3*remaining - 2*m, 5*ell - 1 - 2*rho + d,
      'second-branch clip')

# The first identity bounds T-H by rho-3d when the displayed gaps are nonnegative.
gaps = sp.symbols('g0:5', nonnegative=True)
nonnegative_polynomial(gaps[0] + gaps[1] + 2*gaps[2] + gaps[3] + 3*gaps[4],
                       gaps, 'dual overflow slack')

# In the second hybrid branch u >= v/2. Check both signs of T-y.
y = v + 3*lb + e
for above in (False, True):
    w = T-y if above else 0
    absolute = T-y if above else y-T
    equal(u + lb + 2*e/3 + w/2 - T/4,
          (u-v/2) + v/4 + lb/4 + 5*e/12 + absolute/4,
          'hybrid saving decomposition')

gamma = sp.symbols('gamma', nonnegative=True)
first = O/2 + H + gamma
second = O/2 + H + gamma - S - B + z - dual/4
equal(first, m + gamma - O/2 - gap, 'first energy branch')
equal(second, m + gamma + (1 + 3*remaining - 2*m)/4
      - gap/2 - (remaining-z)/2 - (2*A-N+B+4*S)/4,
      'second energy branch')

# The low exponent is the maximum of four affine functions of d.
slopes = []
for active_overflow in (0, 1):
    for active_clip in (0, 1):
        branch = -d + active_overflow*(rho-3*d)/2 \
            + active_clip*(5*ell-1-2*rho+d)/8
        slope = sp.diff(branch, d)
        check(slope <= -Q(7, 8), 'uniform decrease of low branches')
        slopes.append(slope)

# The same proposed sigma is represented by ell_eff in the frozen geometry.
L, delta, q, R, dd = sp.symbols('L delta q R dd', real=True)
lx = 1 + ell - h
ly = h - 2*ell + rho
b = ly - lx
sigma = 1 - h/6 + b/12 + L
effective = ell - rho/3 - 4*L
equal(lx + ly + ell - 1, rho, 'geometry surplus')
equal(sigma, Q(11, 12) - effective/4, 'boundary normalization')
a = (1+delta)/2
general = a - sigma + h*(Q(17, 50)-Q(1, 6)) - a*ly \
    - (1-a)*ell - (delta/2-q)*ell + dd*(R+delta/2-Q(17, 50))
frozen = high_exponent(effective, h, delta, q, R, dd)
difference = -rho*(2+delta-2*q)/6 + L*(2+4*delta+4*q)
equal(general - frozen, difference, 'comparison with existing high exponent')

# Nonnegative decompositions for each sign of rho; k is the residual low loss.
t, k, amplitude_gap = sp.symbols('t k amplitude_gap', nonnegative=True)
positive = difference.subs({rho: t, L: t/2+k}, simultaneous=True)
equal(positive, t*(4+11*delta+14*q)/6 + k*(2+4*delta+4*q),
      'positive surplus penalty')
nonnegative_polynomial(positive, (t, k, delta, q), 'positive surplus sign')
negative = difference.subs({rho: -t, L: k, delta: 2*q+amplitude_gap},
                          simultaneous=True)
equal(negative, t*(2+amplitude_gap)/6 + k*(2+12*q+4*amplitude_gap),
      'negative surplus penalty')
nonnegative_polynomial(negative, (t, k, q, amplitude_gap), 'negative surplus sign')

# The known frozen-budget obstruction eliminates h exactly, without optimization.
root = sp.sqrt(921)
check(30**2 < 921 < 31**2, 'radical isolation')
delta_star = (49-root)/48
ell_star = (33+8*root)/1653
sigma_star = (1507-2*root)/1653
D = (37+34*z)/18
P = (7+18*z+8*z*z)/9
J = (Q(5, 6)-delta)*D + delta*P
count = 1-delta + (Q(5, 6)-delta)*delta*P/(2*J)
endpoint = high_exponent(effective, h, delta, delta*(Q(1, 2)-z), count, h)
coefficient = (73-root)/32
equal(endpoint.subs({delta: delta_star, z: 0}),
      coefficient*(effective-ell_star), 'h-independent obstruction')
equal(Q(11, 12)-ell_star/4, sigma_star, 'known boundary')
equal((Q(2, 3)+3*delta_star)/(4*coefficient), (1288-5*root)/3306,
      'positive surplus boundary penalty')
equal(1/(12*coefficient), (73+root)/1653,
      'negative surplus boundary penalty')

# An equality family in the reflected-energy relaxation, not a lower bound on sums.
# 0 < ell <= 1/5, rho >= 0 makes v=m+rho >= 2*ell at d=0.
at_root = 1-ell+rho
equal(2*at_root+2*ell-1-ell, at_root+rho, 'equality-family dual length')
equal((at_root+rho)-2*ell, 1-3*ell+2*rho, 'equality-family hybrid branch')

for ev, rv in [(Q(1, 6), Q(1, 100)), (Q(19, 100), Q(1, 100)),
               (Q(1, 6), -Q(1, 100)), (Q(1, 4), 0)]:
    Lv = loss(ev, rv, 0)/2
    # All possible breakpoints, including the endpoints, are exact rationals.
    cuts = {Q(0), ev}
    cuts.update(cut for cut in (rv/3, 1-5*ev+2*rv) if 0 <= cut <= ev)
    for dv in sorted(cuts):
        check(-dv+loss(ev, rv, dv)/2 <= Lv-Q(7, 8)*dv, 'low envelope control')

ev, rv = Q(1, 6), Q(1, 100)
mv = 1-ev+rv
tv = 2*mv+2*ev-1-ev
uv = min(tv, ev, (tv+ev)/3)
energy = max(mv, tv)+ev-uv
equal(energy, mv+rv, 'exact relaxed-energy equality control')
equal(loss(ev, rv, 0), rv, 'equality control meets row-norm bound')
equal(Q(11, 12)-ev/4+rv/12+loss(ev, rv, 0)/2, Q(1057, 1200),
      'corrected example boundary')
for example_ell in (Q(1, 6), Q(19, 100)):
    example_x = 1+example_ell-Q(13, 16)
    example_y = Q(13, 16)-2*example_ell+Q(1, 100)
    example_b = example_y-example_x
    check(min(example_x-example_ell, example_y-example_ell, example_b,
              example_y-example_ell-Q(11, 6)*example_b) > 0,
          'example meets every low length hypothesis')

# At the paper boundary, increasing ell to compensate for rho fails at an actual bin.
ev, hv, rv = Q(19, 100), Q(13, 16), Q(1, 100)
Lv = loss(ev, rv, 0)/2
equal(Q(11, 12)-ev/4+rv/12+Lv, Q(7, 8), 'fixed-boundary negative control')
F, j = adaptive_poly(ev, hv)
delta_var, y_var = F.gens
bad = (-F.as_expr()/j.as_expr() - (Q(7, 12)+delta_var/2)*rv-Lv).subs(
    {delta_var: Q(2, 5), y_var: 0})
equal(bad, Q(71663, 3894000), 'exact rejected bin')
check(bad > 0, 'negative control really fails the high bound')

print(f'PASS: {checks} exact checks; no floating-point proof decisions.')
print('Low-loss branch slopes:', ', '.join(map(str, slopes)))
print('L = max(rho,0)/2 + max(5*ell-1-2*rho,0)/8.')
print('Both signs of rho worsen the high exponent at fixed sigma.')
print('Equality control: ell=1/6, rho=1/100, row-norm loss=1/100; sigma=1057/1200.')
print('Rejected fixed-boundary control: E(2/5, q=1/5) =', bad, '> 0.')
print('Scope: exponent bounds from the stated reflected-energy estimate; no new endpoint.')
