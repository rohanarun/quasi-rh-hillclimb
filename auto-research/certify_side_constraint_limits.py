"""Exact limits of adaptive-count improvements with the other budget checks fixed.

Run: python auto-research/certify_side_constraint_limits.py
Sharpness uses hypothetical counts R=1-delta, not the present adaptive count.
All proof decisions are exact; see side-constraint-limits.md for scope.
"""
from pathlib import Path
import sys

import sympy as sp

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import certify as C


def main():
    if not __debug__:
        raise SystemExit('Exact checks require assertions; run Python without -O.')

    ell, h, upper, tau = sp.symbols('ell h upper tau')
    d, y = C.d, C.y
    half = sp.Rational(1, 2)
    box = ((sp.Rational(0), sp.Rational(5, 6)), (sp.Rational(0), half))
    floor_key = 'floor bin (delta0=1/50, R=1, q=delta0/2): -E(h)'
    intermediate_key = 'intermediate d=1/2, delta=5/6'
    original = C.side_constraints(ell, h)
    assert len(original) == 12
    A = sp.expand(150 * original[floor_key])
    assert A == 61 - 117 * ell - 50 * h

    # Recovers the earlier floor/bin-width obstruction, regardless of row counts.
    b = 2 * h - 1 - 3 * ell
    assert sp.expand(A + 25 * b - (36 - 192 * ell)) == 0
    assert sp.Rational(11, 12) - sp.Rational(3, 16) / 4 == sp.Rational(167, 192)
    print('Retained floor and b>0 constraints require sigma0 > 167/192.')

    intermediate = -C.high_exponent(
        ell, h, upper, upper / 2,
        sp.Rational(76, 75) - 2 * upper / 3, half)
    assert sp.Poly(intermediate, upper).degree() == 1
    assert sp.expand(intermediate.subs(upper, sp.Rational(5, 6))
                     - original[intermediate_key]) == 0
    ideal = sp.Poly(sp.expand(-C.high_exponent(
        ell, h, d, (half - y) * d, 1 - d, h)), d, y)
    assert all(sp.Poly(c, ell, h).total_degree() <= 1 for c in ideal.coeffs())
    paper = {ell: sp.Rational(1, 6), h: sp.Rational(13, 16)}
    paper_poly = sp.Poly(ideal.as_expr().subs(paper), d, y)
    assert C.bernstein_min(paper_poly, box) > 0

    cases = [
        (sp.Rational(5, 6), sp.Rational(4112, 24039), sp.Rational(4379, 5342),
         sp.Rational(84031, 96156)),
        (sp.Rational(3, 4), sp.Rational(18706, 105507), sp.Rational(18877, 23446),
         sp.Rational(368153, 422028)),
    ]
    assert cases[0][3] > cases[1][3] > sp.Rational(167, 192)
    for cap, ell_star, h_star, sigma_star in cases:
        margin = sp.factor(intermediate.subs(upper, cap))
        denominator = sp.denom(margin)
        assert denominator.is_Integer and denominator > 0
        B = sp.expand(denominator * margin)
        weight = B.coeff(h) / 2
        assert weight > 0
        combination = sp.expand(weight * A + 25 * B)
        ell_weight = -combination.coeff(ell)
        assert ell_weight > 0
        assert sp.expand(combination - ell_weight * (ell_star - ell)) == 0
        assert sp.Rational(11, 12) - ell_star / 4 == sigma_star

        star = {ell: ell_star, h: h_star}
        assert ell_star > sp.Rational(1, 6) and h_star > 0
        segment = {v: (1 - tau) * star[v] + tau * paper[v] for v in (ell, h)}
        sides = dict(original)
        sides[intermediate_key] = margin  # Only this endpoint changes for cap=3/4.
        for name, side in sides.items():
            if name.startswith('prime supply'):
                side = sp.cancel(h * side)  # h stays positive along the segment.
            assert sp.Poly(side, ell, h).total_degree() <= 1
            at_star, at_paper = side.subs(star), side.subs(paper)
            if name in (floor_key, intermediate_key):
                assert at_star == 0
            else:
                assert at_star > 0
            assert at_paper > 0
            assert sp.expand(side.subs(segment)
                             - (1 - tau) * at_star - tau * at_paper) == 0

        star_poly = sp.Poly(ideal.as_expr().subs(star), d, y)
        lower = C.bernstein_min(star_poly, box)
        assert lower > 0
        assert sp.expand(ideal.as_expr().subs(segment)
                         - (1 - tau) * star_poly.as_expr()
                         - tau * paper_poly.as_expr()) == 0
        # These are limiting points of the idealization, not new feasible Track A points.
        actual, divisor = C.adaptive_poly(ell_star, h_star)
        location = {d: sp.Rational(2, 5), y: 0}
        assert divisor.as_expr().subs(location) == sp.Rational(649, 5)
        witness = actual.as_expr().subs(location)
        assert witness < 0

        print(f'Intermediate upper delta={cap}:')
        print(f'  A={A}; B={B}; positive combination={combination}')
        print(f'  strict bound sigma0 > {sigma_star}; limiting ell={ell_star}, h={h_star}')
        print(f'  ideal -E_* >= {lower} on the full rectangle; exactly two side margins vanish')
        print('  all twelve side checks and ideal adaptive positivity are strict for 0<tau<=1')
        print(f'  present adaptive count fails at (delta,y)=(2/5,0): F={witness}')
        print(f'  displayed infimum approximation: {sp.N(sigma_star, 16)}')


if __name__ == '__main__':
    main()
