"""Exact certificates for the rational height rule and the Farey optimum."""

from fractions import Fraction as Q
from pathlib import Path
import sys

import sympy as sp

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import certify
from certify_track_a_limit import BOX, ROOT, main as certify_limit


def verify_point(ell, height, depth):
    polynomial, denominator = certify.adaptive_poly(ell, height)
    assert certify.bernstein_min(denominator, BOX) == 70
    leaves = []
    assert certify.prove_positive(polynomial, BOX, maxdepth=depth, log=leaves)
    assert sum((d1 - d0) * (y1 - y0) for ((d0, d1), (y0, y1)), _ in leaves) == Q(5, 12)
    margins = certify.side_constraints(ell, height)
    assert len(margins) == 12 and min(margins.values()) > 0
    return len(leaves), min(lower for _, lower in leaves)


def radical_residual(sigma):
    """Sign is positive on the lower side of the radical on this branch."""
    p, q = sigma.as_integer_ratio()
    t = 1507*q - 1653*p
    assert t > 0
    return t*t - 3684*q*q


def main():
    if not __debug__:
        raise SystemExit("Run without -O to enable the exact checks.")
    certify_limit()  # F_* >= 0 on BOX, strict limiting sides, affine dependence
    ell_star = (33 + 8*ROOT) / 1653
    h_star = sp.Rational(254, 551) + 5869*ROOT/507471
    assert sp.simplify((1015 + 5869*ell_star)/2456 - h_star) == 0
    ell_anchor = Q(1, 6)
    h_anchor = (1015 + 5869*ell_anchor)/2456
    assert h_anchor == Q(11959, 14736)
    assert verify_point(ell_anchor, h_anchor, 12) == (12, Q(125, 9824))
    print("Rational height rule: anchor F >= 125/9824 in 12 boxes, all sides positive.")

    cap = 2**63 - 1
    lower = Q(8048408698318013625, 9198632682818811461)
    upper = Q(35286435714595391, 40329333783993290)
    assert radical_residual(lower) == 17103040 and radical_residual(upper) == -551
    assert upper.numerator*lower.denominator - lower.numerator*upper.denominator == 1
    assert max(lower.denominator, upper.denominator) <= cap < lower.denominator + upper.denominator
    assert upper - lower == Q(1, 370974727821749526579531984199096690)
    gain = Q(4374785349, 5000000000) - upper
    assert gain == Q(16762080630821, 20164666891996645000000000)
    ell = Q(1, 6) + Q(6925385594951, 40329333783993290)
    h = Q(3594738650076713443, 4427234498297715012)
    assert Q(11, 12) - ell/4 == upper
    leaves, margin = verify_point(ell, h, 111)
    assert leaves == 116
    print(f"Farey optimum {upper}, improvement over PR #12 {gain}.")
    print(f"Full rectangle covered in {leaves} boxes with minimum F coefficient {margin}.")


if __name__ == "__main__":
    main()
