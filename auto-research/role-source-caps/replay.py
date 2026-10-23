#!/usr/bin/env python3
"""Regenerate and compare the complete exact finite certificate."""

import json
from fractions import Fraction as Q
from pathlib import Path

from certify import HEIGHT, THETA, verify

HERE = Path(__file__).resolve().parent


if __name__ == "__main__":
    graph = json.loads((HERE / "sources.json").read_text())
    result = verify(graph)
    assert result == json.loads((HERE / "certificate.json").read_text())
    assert Q(".8747714") - THETA == Q(3, 10**8)
    assert Q(".8747729897") - THETA == Q(16197, 10**10)
    assert HEIGHT == Q(1250109, 1562500)
    print("PASS 3,911 acyclic sources; 70,398 density polynomials/interpolation checks")
    print("PASS 125,152 strict gates, 7,822 weak gates; both actual source caps")
    print("PASS 224 return boxes; 2,688 coefficients; 49 admissions; 33 reserves")
    print("Conditional theta = 87477137/100000000 = .87477137; reserve = 1e-9")
    print(
        "Gain over previous candidate = 3e-8; no new Lean build or independent acceptance"
    )
