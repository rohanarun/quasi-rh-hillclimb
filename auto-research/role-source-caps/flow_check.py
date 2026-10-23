"""Exact necessary-gate and first-integral algebra; no limiting theorem."""

import json
from fractions import Fraction as Q
from pathlib import Path

import sympy as s

HERE = Path(__file__).resolve().parent

if not __debug__:
    raise RuntimeError("Run the exact flow checks without Python -O")


def check():
    B, L, q = s.symbols("B L q")
    f = ((15 - 6 * q) * B - 10) / ((15 - 6 * q) * L - 12 * q)
    F = B * (15 * B - L - 10) / (L * (15 * B - L - 2))
    I = B * (L + 2 - 3 * B) ** 4 / L**5
    assert (
        s.cancel(s.diff(f, q) - 60 * (3 * B - L - 2) / ((15 - 6 * q) * L - 12 * q) ** 2)
        == 0
    )
    assert s.cancel(f.subs(q, L / (6 * B)) - F) == 0
    assert s.cancel(s.diff(I, B) * F + s.diff(I, L)) == 0
    nodes = json.loads((HERE / "sources.json").read_text())
    proved = {"natural": (Q(1), Q("4.4973108"))}
    gaps = []
    for node in nodes:
        B0, L0 = proved[node["low"]]
        B1, L1 = Q(node["B"]), Q(node["L"])
        assert Q(22, 23) <= B0 <= 1 and 1 < L0 < Q(9, 2) * B0
        q0 = Q(node["q"])
        assert Q(1, 2) <= q0 <= Q(3, 4) and 1 - 6 * q0 * B0 / L0 > 0
        b = (B0 - B1) / (L0 - L1)
        necessary = B0 * (15 * B0 - L0 - 10) / (L0 * (15 * B0 - L0 - 2))
        assert b > necessary
        gaps.append(b - necessary)
        proved[node["id"]] = (B1, L1)
    return {
        "checked_stages": len(gaps),
        "minimum_strict_FD2_gap": str(min(gaps)),
        "symbolic_identities": 3,
        "scope": "Necessary gate and exact flow algebra only; no limiting ceiling or new endpoint",
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2))
