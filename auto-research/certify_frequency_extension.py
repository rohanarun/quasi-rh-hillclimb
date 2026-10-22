"""Constructive frequency extension; see frequency-extension.md.

Run: python auto-research/certify_frequency_extension.py
The examples certify the frozen, zero-allowance inequality budget. A caller
using capacity allowances must include their cost in the endpoint margin.
Mesh inputs are supplied hypotheses, not computed analytic moment thresholds.
"""
import sys
from fractions import Fraction as Q
from pathlib import Path

import sympy as sp

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import certify as budget


def extension_plan(ell, h, gamma, mesh, rounding):
    """Return exact extension/slot parameters for the report's lemma.

    gamma is a uniform margin at d=h for the actual exponents being extended,
    after any capacity allowances and target comparison. mesh and rounding
    are arbitrary positive rational thresholds supplied by the analytic lemmas.
    """
    values = (ell, h, gamma, mesh, rounding)
    if any(isinstance(value, float) for value in values):
        raise TypeError("Use exact rational inputs, not floats")
    ell, h, gamma, mesh, rounding = map(Q, values)
    supply = 37*ell - 7*h
    if not (ell > 0 and Q(1, 2) <= h < 1 and supply > 0
            and gamma > 0 and mesh > 0 and rounding > 0):
        raise ValueError("Need ell>0, 1/2<=h<1, 37*ell>7*h and positive margins")
    reserve = supply/74
    threshold = min(mesh, rounding, reserve/2)
    return {
        "zeta": min(supply/14, (1-h)/2, gamma/2),
        "supply_reserve": reserve,
        "slot_threshold": threshold,
        "slots": 2*(ell//threshold + 1),
    }


def main():
    checks = []

    def check(name, condition):
        if not condition:
            raise AssertionError(name)
        checks.append(name)

    # bernstein_min uses the certifier's own delta/y symbols and rectangle.
    delta, y = budget.d, budget.y
    x = sp.Rational(1, 2)-y
    alpha, z0 = sp.Rational(5, 6), sp.Rational(17, 50)
    box = ((sp.Rational(0), alpha), (sp.Rational(0), sp.Rational(1, 2)))
    D = 3-sp.Rational(17, 9)*x
    P = (2-sp.Rational(8, 9)*x)*(1-x)
    J = (alpha-delta)*D + delta*P
    Rstar = 1-delta + (alpha-delta)*delta*P/(2*J)
    positive_polys = [
        ("D", D, Q(37, 18)), ("P", P, Q(7, 9)),
        ("D-P", D-P, Q(1)), ("J", J, Q(35, 54)),
        ("J-(alpha-delta)P", J-(alpha-delta)*P, Q(35, 54)),
    ]
    for name, expr, expected in positive_polys:
        lower = budget.bernstein_min(sp.Poly(sp.expand(expr), delta, y), box)
        check(f"positive polynomial {name}", lower == expected and lower > 0)

    ell, h, dd, q, R, u, zeta = sp.symbols("ell h dd q R u zeta")
    supply = 37*ell-7*h
    identities = {
        "affine frequency identity": budget.high_exponent(ell, h, delta, q, R, dd)
            - budget.high_exponent(ell, h, delta, q, R, h)
            - (dd-h)*(R+delta/2-z0),
        "row lower bound": (Rstar-(1-delta))*J - (alpha-delta)*delta*P/2,
        "row upper bound": (1-delta/2-Rstar)*J - delta*(J-(alpha-delta)*P)/2,
        "adaptive slope upper bound": sp.Rational(33, 50)+u
            - (Rstar+u+delta/2-z0) - (1-delta/2-Rstar),
        "adaptive slope lower bound": Rstar+u+delta/2-z0
            - (sp.Rational(33, 50)-delta/2) - (Rstar-(1-delta)+u),
        "strict supply reserve": ell/(h+zeta)-sp.Rational(7, 37)-supply/74
            - ((supply-14*zeta)+supply*(1-h-zeta))/(74*(h+zeta)),
        "supply decreases after h": ell/(h+zeta)-ell/h+ell*zeta/(h*(h+zeta)),
    }
    for name, residual in identities.items():
        check(name, sp.cancel(residual) == 0)
    for name, slope in [("adaptive upper", Q(33, 50)+Q(1, 8)),
                        ("adaptive lower / alpha", Q(33, 50)-Q(5, 12)),
                        ("floor", Q(1)+Q(1, 100)-Q(17, 50))]:
        check(f"slope {name} lies between zero and one", 0 < slope < 1)

    old_key = "extension room: 5 ell - h (paper uses zeta < 5ell-h)"
    examples = [
        ("audited baseline", Q(2953, 17700), Q(405989, 500000),
         Q(372913, 652492800000), Q(1964947, 88500000)),
        ("outside old reserve", Q(31, 200), Q(4, 5), Q(161, 28800), -Q(1, 40)),
    ]
    for name, ell, h, expected_gamma, expected_old_room in examples:
        F, denominator = budget.adaptive_poly(ell, h)
        log = []
        check(f"{name}: positive adaptive denominator", budget.prove_positive(denominator, box))
        check(f"{name}: adaptive numerator", budget.prove_positive(F, box, log=log))
        check(f"{name}: denominator identity", sp.expand(denominator.as_expr()-108*J) == 0)
        exact_E = budget.high_exponent(ell, h, delta, delta*x, Rstar, h)
        check(f"{name}: F/denominator identity", sp.cancel(F.as_expr()+denominator.as_expr()*exact_E) == 0)
        upper = -budget.bernstein_min(-denominator, box)
        check(f"{name}: denominator upper bound", upper == 270)
        sides = budget.side_constraints(ell, h)
        check(f"{name}: original extension value", sides.pop(old_key) == expected_old_room)
        for label, value in sides.items():
            check(f"{name}: {label}", value > 0)
        gamma = min(Q(min(value for _, value in log)/upper),
                    sides["floor bin (delta0=1/50, R=1, q=delta0/2): -E(h)"],
                    sides["delta=5/6 endpoint (R=1-delta, q=delta/2): -E(h)"])
        check(f"{name}: exact endpoint margin", gamma == expected_gamma and gamma > 0)
        # Illustrative positive inputs only: no analytic mesh size is asserted.
        plan = extension_plan(ell, h, gamma, Q(1, 1000), Q(1, 1000))
        z, reserve, slots = plan["zeta"], plan["supply_reserve"], plan["slots"]
        check(f"{name}: positive extension", z > 0)
        check(f"{name}: half supply room retained", 37*ell-7*h-14*z >= 0)
        check(f"{name}: buffered range below one", h+z < 1)
        check(f"{name}: strict uniform supply", ell/(h+z)-Q(7, 37) > reserve > 0)
        check(f"{name}: half endpoint margin retained", gamma-z >= gamma/2)
        check(f"{name}: even positive slot count", slots > 0 and slots % 2 == 0)
        check(f"{name}: strict mesh and rounding", 2*ell/slots < plan["slot_threshold"])
        print(f"{name}: {len(log)} Bernstein boxes; {len(sides)} other side checks pass")
        print(f"  gamma={gamma}; zeta={z}; supply reserve={reserve}; old 5*ell-h={expected_old_room}")

    exact_mesh = Q(31, 200000)
    plan = extension_plan(Q(31, 200), Q(4, 5), Q(161, 28800), exact_mesh, Q(1))
    check("strict rounding at an integer quotient", plan["slots"] == 2002
          and 2*Q(31, 200)/plan["slots"] < exact_mesh)
    for args in [
        (Q(28, 185), Q(4, 5), Q(1), Q(1), Q(1)),  # exactly at supply capacity
        (Q(3, 20), Q(4, 5), Q(1), Q(1), Q(1)),  # below supply capacity
        (Q(1), Q(1), Q(1), Q(1), Q(1)),
        (Q(1), Q(1, 3), Q(1), Q(1), Q(1)),
        (Q(31, 200), Q(4, 5), Q(0), Q(1), Q(1)),
        (Q(31, 200), Q(4, 5), Q(1), Q(0), Q(1)),
        (Q(31, 200), Q(4, 5), Q(1), Q(1), Q(0)),
    ]:
        try:
            extension_plan(*args)
        except ValueError:
            check("invalid lemma hypotheses rejected", True)
        else:
            raise AssertionError(f"invalid inputs accepted: {args}")
    print(f"PASS: {len(checks)} exact checks; no sampling or floating-point comparisons")
    print("Scope: frequency/supply lemma and frozen-budget examples; no new zero-free endpoint or Lean proof.")


if __name__ == "__main__":
    main()
