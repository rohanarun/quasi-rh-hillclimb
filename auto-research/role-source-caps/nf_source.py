#!/usr/bin/env python3
"""Exact finite NF source induction, conditional on Collet's analytic NF theorem.

Equations NF4/NF8/NF10--NF15 in the upstream standalone manuscript.
No floating-point number is used by this verifier. New code: Subhanjan Das,
AI-assisted with OpenAI Codex; mathematical inputs credited to Hailey Collet.
"""

import argparse
import hashlib
import json
import math
from fractions import Fraction as Q
from pathlib import Path

if not __debug__:
    raise RuntimeError("Run the certificate without Python -O")

HERE = Path(__file__).resolve().parent
K = Q("4.4973108")
E, R, FEE = Q(1, 10**17), Q(1, 10**12), Q(1, 10**10)


class Poly:
    def __init__(self, coeff):
        self.c = (
            tuple(map(Q, coeff)) if isinstance(coeff, (list, tuple)) else (Q(coeff),)
        )
        while len(self.c) > 1 and not self.c[-1]:
            self.c = self.c[:-1]

    def __add__(self, other):
        other = other if isinstance(other, Poly) else Poly(other)
        return Poly(
            [
                (self.c[i] if i < len(self.c) else 0)
                + (other.c[i] if i < len(other.c) else 0)
                for i in range(max(len(self.c), len(other.c)))
            ]
        )

    __radd__ = __add__

    def __neg__(self):
        return Poly([-v for v in self.c])

    def __sub__(self, other):
        return self + -other if isinstance(other, Poly) else self + (-Q(other))

    def __rsub__(self, other):
        return -self + other

    def __mul__(self, other):
        other = other if isinstance(other, Poly) else Poly(other)
        c = [Q(0)] * (len(self.c) + len(other.c) - 1)
        for i, a in enumerate(self.c):
            for j, b in enumerate(other.c):
                c[i + j] += a * b
        return Poly(c)

    __rmul__ = __mul__

    def __truediv__(self, other):
        if isinstance(other, Poly):
            raise TypeError("Polynomial division is not needed by the certificate")
        return Poly([v / Q(other) for v in self.c])

    def at(self, x):
        out = Q(0)
        for c in reversed(self.c):
            out = out * x + c
        return out

    def bernstein(self, a, b, n=None):
        n = len(self.c) - 1 if n is None else n
        assert n >= len(self.c) - 1
        coeff = self.c + (Q(0),) * (n + 1 - len(self.c))
        power = [
            sum(
                (
                    coeff[k] * math.comb(k, j) * a ** (k - j) * (b - a) ** j
                    for k in range(j, n + 1)
                ),
                Q(0),
            )
            for j in range(n + 1)
        ]
        return [
            sum(
                (power[j] * Q(math.comb(i, j), math.comb(n, j)) for j in range(i + 1)),
                Q(0),
            )
            for i in range(n + 1)
        ]


def positive(poly, a, b, depth=0):
    coeff = poly.bernstein(a, b, 3)
    if min(coeff) > 0:
        return min(coeff), 1
    if poly.at(a) <= 0 or poly.at(b) <= 0:
        raise AssertionError(f"Nonpositive density endpoint: {a}, {b}")
    if depth >= 24:
        raise AssertionError("Density certificate needs further subdivision")
    mid = (a + b) / 2
    x, n = positive(poly, a, mid, depth + 1)
    y, m = positive(poly, mid, b, depth + 1)
    return min(x, y), n + m


def literal_density_gates(a, t, b, high, nu):
    """Direct rational transcription of upstream densityGate (some high).

    Used only for an independent interpolation cross-check of the polynomial
    implementation. This follows SourceFormulas.lean's evaluation interface.
    """
    BH, LH, hH = high
    T = t + b
    S = b - 2 * E
    F = 1 - 6 * a - E
    tv = 15 - 6 * nu
    w = 5 - 6 * nu
    H = (a - nu * T) * tv + (10 - 60 * a) * nu
    d13 = LH * tv - 10
    d4 = 10 + 3 * w
    d23 = LH * (10 + 3 * w) - (10 + 2 * w)
    return [
        H + 3 * nu * w * S - FEE * tv,
        H + 2 * nu * w * S + nu * w * hH * F - FEE * tv,
        H * d13
        + 2 * nu * w * (LH - 1) * S * tv
        + nu * w * (BH * tv - 10) * F
        - FEE * tv * d13,
        H * d4 + nu * w * S * tv + 2 * nu * w * w * F - FEE * tv * d4,
        H * d4 + (2 * nu * w * w + nu * w * hH * tv) * F - FEE * tv * d4,
        H * d23 + nu * w * (2 * w * (LH - 1) + BH * tv - 10) * F - FEE * tv * d23,
        H + (nu * F / 2 - (1 - nu) * b - FEE) * tv,
        H + (Q(5, 6) * F - (1 - nu) * b - FEE) * tv - 10 * nu * F,
        H + (nu * (F - Q(1, 50)) / 2 - (1 - nu) * b - FEE) * tv - 10 * nu * Q(1, 50),
    ]


def endpoint_checks(B, L, q, b, low, high, crosscheck=False):
    B0, L0, h0 = low
    BH, LH, hH = high
    den = 1 - 6 * q * B0 / L0
    t = B - L * (b - E)
    T = t + b
    S = b - 2 * E
    a = (q * (b + (t - B0) / L0) + R) / den
    F = 1 - 6 * a
    Fp = F - E
    z0 = (B0 * F - t) / L0
    lr = Q(49, 100) - K * b
    scalar = {
        "denominator": den,
        "selected_slots": S,
        "amplifier": a,
        "amplifier_cap": Q(1, 75) - a,
        "RAW_radius": F - T / 2 - 4 * E,
        "LOW_total_cap": B0 * F - t - b - 4 * E,
        "LOW_width_loss": 1 - q * h0,
        "LOW_reserve": R - (q * B0 / L0 + q * h0 + 4) * E - 10 * E,
        "amplifier_erosion": a - 20 * E,
        "reference_length": lr,
        "reference_total": 1 - lr - Q(1, 2) - K * b - 10 * E,
        "centered_terminal": Q(5, 6) + Q(499, 1000) * lr - T - 9 * a - FEE,
        "diagonal": 1 - T - 5 * a - FEE,
        "exceptional_four": 1 - Q(1, 50) - T - 4 * a - FEE,
        "exceptional_four_half": 1 - Q(1, 50) - T - Q(9, 2) * a - FEE,
        "reference_amplifier": lr - 7 * a - FEE,
    }
    assert all(v > 0 for v in scalar.values()), {
        n: str(v) for n, v in scalar.items() if v <= 0
    }
    weak = h0 * F - z0
    assert weak >= 0, f"LOW capped-parent guard {weak}"
    nu = Poly([0, 1])
    w = 5 - 6 * nu
    tv = 15 - 6 * nu
    PH = (a - nu * T) * tv + (10 - 60 * a) * nu
    d13 = LH * tv - 10
    d23 = LH * (10 + 3 * w) - (10 + 2 * w)
    # Each denominator is positive throughout [q,3/4]: tv>=21/2,
    # d13>tv-10>0, d23>w>0, and 10+3w>0.
    assert LH > 1 and q >= Q(1, 2) and q <= Q(3, 4)
    polynomials = [
        PH + 3 * nu * w * S - FEE * tv,
        PH + 2 * nu * w * S + nu * w * hH * Fp - FEE * tv,
        PH * d13
        + 2 * nu * w * (LH - 1) * S * tv
        + nu * w * (BH * tv - 10) * Fp
        - FEE * tv * d13,
        PH * (10 + 3 * w)
        + nu * w * S * tv
        + 2 * nu * w * w * Fp
        - FEE * tv * (10 + 3 * w),
        PH * (10 + 3 * w)
        + (2 * nu * w * w + nu * w * hH * tv) * Fp
        - FEE * tv * (10 + 3 * w),
        PH * d23 + nu * w * (2 * w * (LH - 1) + BH * tv - 10) * Fp - FEE * tv * d23,
        PH + nu * Fp * tv / 2 - (1 - nu) * b * tv - FEE * tv,
        PH + (Q(5, 6) * tv - 10 * nu) * Fp - (1 - nu) * b * tv - FEE * tv,
        PH
        + nu * (Fp - Q(1, 50)) * tv / 2
        - 10 * nu * Q(1, 50)
        - (1 - nu) * b * tv
        - FEE * tv,
    ]
    if crosscheck:
        evaluations = [
            literal_density_gates(a, t, b, high, Q(v)) for v in [0, 1, -1, 2]
        ]
        for j, poly in enumerate(polynomials):
            f0, f1, fm, f2 = (v[j] for v in evaluations)
            coeff = [
                f0,
                (-f2 + 6 * f1 - 3 * f0 - 2 * fm) / 6,
                (f1 + fm - 2 * f0) / 2,
                (f2 - 3 * f1 + 3 * f0 - fm) / 6,
            ]
            assert Poly(coeff).bernstein(q, Q(3, 4), 3) == poly.bernstein(
                q, Q(3, 4), 3
            ), "Upstream cubic interpolation cross-check failed"
    intervals = 0
    minimum = None
    for poly in polynomials:
        assert len(poly.c) <= 4
        m, n = positive(poly, q, Q(3, 4))
        intervals += n
        minimum = m if minimum is None else min(minimum, m)
    return min(scalar.values()), minimum, intervals, weak


def certify(nodes, crosscheck=False):
    proved = {"natural": (Q(1), K, Q(11, 200))}
    minima = []
    partitions = 0
    weak_min = None
    for node in nodes:
        name = node["id"]
        B, L, h, q = (Q(node[k]) for k in ["B", "L", "cap", "q"])
        assert name not in proved
        low = proved[node["low"]]
        high = proved[node["high"]]
        B0, L0, h0 = low
        BH, LH, hH = high
        assert Q(22, 23) <= B <= 1 and L > 1 and 0 < h < 1
        assert Q(22, 23) <= BH <= 1 and LH > 1 and 0 <= hH < 1
        assert Q(1, 2) <= q <= Q(3, 4) and L < L0
        bx = (B0 - B) / (L0 - L)
        assert 0 <= bx <= min(h, h0)
        assert 1 - 6 * q * B0 / L0 > 0
        for b in [bx, h]:
            sm, pm, n, weak = endpoint_checks(B, L, q, b, low, high, crosscheck)
            minima.extend([sm, pm])
            partitions += n
            weak_min = weak if weak_min is None else min(weak_min, weak)
        proved[name] = (B, L, h)
    return {
        "nodes": len(nodes),
        "natural_premise": {"B": "1", "Lambda": str(K), "cap": "11/200"},
        "graph_sha256": hashlib.sha256(
            json.dumps(nodes, sort_keys=True, separators=(",", ":")).encode()
        ).hexdigest(),
        "width_endpoints": 2 * len(nodes),
        "strict_scalar_tests": 32 * len(nodes),
        "weak_LOW_cap_tests": 2 * len(nodes),
        "density_polynomials": 18 * len(nodes),
        "density_intervals": partitions,
        "minimum_positive_coefficient_or_scalar": str(min(minima)),
        "minimum_weak_LOW_cap_guard": str(weak_min),
        "upstream_interpolation_identities_checked": 18 * len(nodes)
        if crosscheck
        else 0,
        "all_dependencies_strictly_earlier": True,
        "scope": "Exact NF finite induction premises. Conditional on the inherited analytic source theorem; no Lean build.",
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("graph", nargs="?", default=str(HERE / "sources.json"))
    ap.add_argument("--crosscheck", action="store_true")
    ap.add_argument("--output")
    args = ap.parse_args()
    nodes = json.loads(Path(args.graph).read_text())
    out = certify(nodes, args.crosscheck)
    print(json.dumps(out, indent=2))
    if args.output:
        Path(args.output).write_text(json.dumps(out, indent=2) + "\n")


if __name__ == "__main__":
    main()
