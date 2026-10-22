"""Exact necessary floor-bin bounds; see floor-bin-obstruction.md.

Run from the repository root: python auto-research/floor_bin_obstruction.py
This checks algebraic identities, not a new zero-free endpoint or an improved
analytic estimate. All other bins are deliberately omitted from this relaxation.
"""
import sys
from pathlib import Path

import sympy as sp

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
from certify import high_exponent


def main():
    Q = sp.Rational
    ell, h, sigma, z0, rho, eta = sp.symbols("ell h sigma z0 rho eta")
    lx, ly, b = 1 + ell - h, h - 2*ell, 2*h - 1 - 3*ell
    old_sigma, ideal_sigma = Q(11, 12) - ell/4, 1 - h/6
    extension, supply = 5*ell - h, ell - Q(7, 37)*h
    old_bound, extension_bound, supply_bound = Q(167, 192), Q(1573, 1818), Q(11513, 13326)

    # Paper's first high-bin formula, at d=h, delta=1/50, q=delta/2, R=1.
    a, delta, q = Q(51, 100), Q(1, 50), Q(1, 100)
    floor = (a - sigma + h*(z0 - Q(1, 6)) - a*ly - (1-a)*ell
             - (delta/2-q)*ell + h*(1 + delta/2-z0))
    old_floor = sp.expand(floor.subs(sigma, old_sigma))
    ideal_floor = sp.expand(floor.subs(sigma, ideal_sigma))
    saved_floor = ideal_floor - h*rho  # R=1-rho costs h*rho less at d=h.
    target, target_h = Q(108, 125), Q(102, 125)
    saving = Q(281, 51000)
    family = {ell: Q(49, 303), h: Q(245, 303)-eta}
    supply_vertex = {ell: Q(343, 2221), h: Q(1813, 2221)}

    identities = {
        "original low/Mellin match": lx/2 + old_sigma - 1 + h/6 - (lx/2+b/12),
        "ideal low/Mellin match": lx/2 + ideal_sigma - 1 + h/6 - lx/2,
        "contour cancels at d=h": sp.diff(floor, z0),
        "matches repository high_exponent": old_floor - high_exponent(ell, h, delta, q, 1, h),
        "original floor polynomial": old_floor - (Q(39, 50)*ell + h/3 - Q(61, 150)),
        "ideal floor polynomial": ideal_floor - (Q(53, 100)*ell + h/2 - Q(49, 100)),
        "boundary change costs b/12": ideal_floor - old_floor - b/12,
        "original obstruction": old_floor - Q(128, 25)*(old_bound-old_sigma) - b/6,
        "retained-extension obstruction": ideal_floor - Q(1818, 500)*(extension_bound-ideal_sigma) - Q(53, 500)*extension,
        "supply-only obstruction": ideal_floor - Q(13326, 3700)*(supply_bound-ideal_sigma) - Q(1961, 3700)*supply,
        "row-saving matches repository formula": saved_floor - high_exponent(ell, h, delta, q, 1-rho, h) - b/12,
        "row-saving obstruction": saved_floor - (Q(303, 500)*h - Q(49, 100) - h*rho + Q(53, 500)*extension),
        "target boundary": 1 - target_h/6 - target,
        "target saving identity": saved_floor.subs(h, target_h) - target_h*(saving-rho) - Q(53, 500)*extension.subs(h, target_h),
        "target floor at zero extension": ideal_floor.subs({ell: target_h/5, h: target_h}) - Q(281, 62500),
        "target saving value": Q(303, 500) - Q(49, 100)/target_h - saving,
        "sharp family extension": extension.subs(family) - eta,
        "sharp family floor": ideal_floor.subs(family) + eta/2,
        "sharp family b": b.subs(family) - (Q(40, 303)-2*eta),
        "sharp family boundary": ideal_sigma.subs(family) - extension_bound - eta/6,
        "supply vertex floor": ideal_floor.subs(supply_vertex),
        "supply vertex margin": supply.subs(supply_vertex),
        "supply vertex boundary": ideal_sigma.subs(supply_vertex) - supply_bound,
        "supply vertex violates extension": extension.subs(supply_vertex) + Q(98, 2221),
    }
    for name, residual in identities.items():
        if sp.expand(residual) != 0:
            raise AssertionError(f"{name}: nonzero residual {residual}")

    # These positive coefficients turn the identities into strict inequalities
    # under the hypotheses stated in the report; the vertex itself is excluded.
    positive = [Q(128, 25), Q(1, 6), Q(1818, 500), Q(53, 500),
                Q(13326, 3700), Q(1961, 3700), target_h, saving, 1-saving,
                old_bound-extension_bound, extension_bound-supply_bound]
    sample = {ell: Q(49, 303), h: Q(245, 303)-Q(1, 1000)}
    positive += [expr.subs(sample) for expr in
                 (ell, h, b, extension, supply, -ideal_floor, ideal_sigma-extension_bound)]
    for value in positive:
        if not value.is_Rational or value <= 0:
            raise AssertionError(f"expected a positive rational, got {value}")

    print(f"PASS: {len(identities)} exact identities; {len(positive)} rational sign checks")
    print(f"Original low estimate: sigma0 > {old_bound}")
    print(f"Ideal low estimate, h < 5*ell retained: sigma0 > {extension_bound}")
    print(f"Ideal low estimate, supply-only relaxation: sigma0 > {supply_bound}")
    print(f"To target {target} with h < 5*ell: floor-row saving rho > {saving}, R < {1-saving}")
    print("Scope: necessary bounds in the stated budget relaxations; no new endpoint or Lean proof.")


if __name__ == "__main__":
    main()
