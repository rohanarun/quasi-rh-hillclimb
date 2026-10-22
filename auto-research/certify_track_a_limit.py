"""Exact infimum of the frozen Track A budget; no new zero-free theorem.

Run: python auto-research/certify_track_a_limit.py
Uses the existing SymPy dependency. All decisions use exact arithmetic;
decimal output is for orientation only. See track-a-exact-limit.md.
"""
from fractions import Fraction as Fr
from pathlib import Path
import sys

import sympy as sp

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import certify as C


ROOT = sp.sqrt(921)
ROOT_LO = sp.Rational(30347981810987, 10**12)
ROOT_HI = sp.Rational(30347981810988, 10**12)
d, y = C.d, C.y
BOX = ((sp.Rational(0), sp.Rational(5, 6)),
       (sp.Rational(0), sp.Rational(1, 2)))


def lower(value):
    """Rational lower bound for a + b*sqrt(921), including negative b."""
    value = sp.expand(sp.radsimp(value))
    b = value.coeff(ROOT)
    a = sp.simplify(value - b * ROOT)
    assert a.is_Rational and b.is_Rational, value
    return a + b * (ROOT_LO if b >= 0 else ROOT_HI)


def lower_poly(poly):
    """Coefficientwise lower polynomial, valid when delta,y are nonnegative."""
    return sp.Poly.from_dict(
        {powers: lower(value) for powers, value in poly.terms()}, (d, y))


def main():
    if not __debug__:
        raise SystemExit('Exact checks require assertions; run Python without -O.')
    assert 0 < ROOT_LO < ROOT_HI
    assert ROOT_LO**2 < 921 < ROOT_HI**2
    assert lower(ROOT) == ROOT_LO
    assert lower(-ROOT) == -ROOT_HI
    assert lower(sp.Rational(7, 3)) == sp.Rational(7, 3)

    ell, h = sp.symbols('ell h')
    delta_star = (49 - ROOT) / 48
    ell_star = sp.Rational(11, 551) + 8 * ROOT / 1653
    h_star = sp.Rational(254, 551) + 5869 * ROOT / 507471
    sigma_star = (1507 - 2 * ROOT) / 1653
    assert lower(delta_star - sp.Rational(1, 3)) > 0
    assert lower(sp.Rational(3, 4) - delta_star) > 0
    assert lower(ell_star - sp.Rational(1, 6)) > 0
    assert lower(h_star) > 0
    assert sp.simplify(ell_star - (5 - 6 * delta_star) / (9 + 18 * delta_star)) == 0
    assert sp.simplify(sigma_star - (sp.Rational(11, 12) - ell_star / 4)) == 0

    # The balanced count with plain capacity 2/9, written at x=1/2-y.
    p = 7 + 18 * y + 8 * y**2
    j = 185 + 170 * y + (-138 + 12 * y + 96 * y**2) * d  # 108 J
    t = 1 + 6 * d * p / j
    row_count = 1 - d + (sp.Rational(5, 6) - d) * (t - 1)
    assert C.bernstein_min(sp.Poly(j, d, y), BOX) == 70
    assert -C.bernstein_min(sp.Poly(-j, d, y), BOX) == 270
    # These nonnegative factors prove 1 <= t <= 3/2 throughout BOX.
    assert sp.expand(j - 12 * d * p - (5 - 6 * d) * (37 + 34 * y)) == 0
    r0 = (185 - 288 * d + 96 * d**2) / (185 - 138 * d)
    assert sp.cancel(row_count.subs(y, 0) - r0) == 0
    assert sp.simplify(r0.subs(d, delta_star) - sp.Rational(2, 3)) == 0

    exponent = C.high_exponent(ell, h, d, (sp.Rational(1, 2) - y) * d,
                               row_count, h)
    factor = sp.Rational(3, 4) + 3 * delta_star / 2
    assert lower(factor) > 0
    witness = exponent.subs({d: delta_star, y: 0})
    assert sp.simplify(witness - factor * (ell - ell_star)) == 0
    print('Obstruction: E_star(delta_star, 1/2) = positive * (ell - ell_star), for every h.')

    general = sp.Poly(sp.cancel(-j * exponent), d, y)
    assert not general.as_expr().has(sp.Float)
    assert all(sp.Poly(value, ell, h).total_degree() <= 1
               for value in general.coeffs())
    # Both this expression and adaptive_poly are affine in ell,h.
    for ll, hh in [(Fr(0), Fr(0)), (Fr(1), Fr(0)), (Fr(0), Fr(1))]:
        direct, denominator = C.adaptive_poly(ll, hh)
        assert sp.expand(general.as_expr().subs({ell: ll, h: hh}) - direct.as_expr()) == 0
        assert sp.expand(denominator.as_expr() - j) == 0

    star = sp.Poly(sp.expand(general.as_expr().subs({ell: ell_star, h: h_star})), d, y)
    coefficients = sp.Poly(star.as_expr(), y)
    assert coefficients.degree() == 3
    q0 = sp.Poly(coefficients.coeff_monomial(1), d)
    a = q0.coeff_monomial(d**2)
    assert lower(a) > 25
    assert sp.simplify(q0.as_expr() - a * (d - delta_star)**2) == 0
    assert sp.simplify(star.as_expr().subs({d: delta_star, y: 0})) == 0

    # Left strip stays strictly positive, away from the only limiting zero.
    left = ((sp.Rational(0), sp.Rational(1, 3)), BOX[1])
    log = []
    assert C.prove_positive(lower_poly(star), left, maxdepth=10, log=log)
    assert min(bound for _, bound in log) > sp.Rational(7, 100)
    print(f'Limiting F on delta <= 1/3: {len(log)} rational Bernstein boxes; F > 7/100.')

    # On the right strip, F = a*(delta-delta_star)^2 + y*q1 + y^2*q2 + y^3*q3.
    right = ((sp.Rational(1, 3), sp.Rational(5, 6)), BOX[1])
    for k, bound in [(1, sp.Rational(3, 10)), (2, 4), (3, 1)]:
        qk = sp.Poly(coefficients.coeff_monomial(y**k), d, y)
        assert C.bernstein_min(lower_poly(qk), right) > bound
    print('Limiting F on delta >= 1/3: a > 25, q1 > 3/10, q2 > 4, q3 > 1.')

    paper_ell, paper_h = Fr(1, 6), Fr(13, 16)
    sides = C.side_constraints(ell, h)
    assert len(sides) == 12
    for name, margin in sides.items():
        if name.startswith('prime supply'):
            margin = sp.cancel(h * margin)  # h > 0 removes the only variable denominator.
        assert sp.Poly(margin, ell, h).total_degree() <= 1
        assert lower(margin.subs({ell: ell_star, h: h_star})) > 0
        assert margin.subs({ell: paper_ell, h: paper_h}) > 0
    print(f'All {len(sides)} side constraints are strict at the limit and the paper point.')

    paper, _ = C.adaptive_poly(paper_ell, paper_h)
    assert C.prove_positive(paper, BOX)
    tau = sp.symbols('tau')
    along_segment = general.as_expr().subs({
        ell: (1 - tau) * ell_star + tau * paper_ell,
        h: (1 - tau) * h_star + tau * paper_h})
    assert sp.expand(along_segment - ((1 - tau) * star.as_expr() + tau * paper.as_expr())) == 0
    print('Sharpness: convex interpolation with the paper point is strictly feasible for 0 < tau <= 1.')

    print('Exact strict lower bound: sigma0 > (1507 - 2*sqrt(921))/1653.')
    print('Displayed approximations (not used in any proof decision):')
    print('  sigma infimum =', sp.N(sigma_star, 24))
    print('  limiting ell =', sp.N(ell_star, 24))
    print('  limiting h =', sp.N(h_star, 24))


if __name__ == '__main__':
    main()
