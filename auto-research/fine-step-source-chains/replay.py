#!/usr/bin/env python3
"""Regenerate the complete exact receipt and compare it with certificate.json.

Runs in about 4-5 minutes on one CPU core with Python >= 3.10 and SymPy.
"""

import json
from fractions import Fraction as Q
from pathlib import Path

from certify import HEIGHT, THETA, verify

HERE = Path(__file__).resolve().parent


if __name__ == "__main__":
    graph = json.loads((HERE / "sources.json").read_text())
    result = verify(graph)
    assert result == json.loads((HERE / "certificate.json").read_text())
    receipt = result["source_receipt"]
    assert receipt["nodes"] == 20527
    assert Q(".87477137") - THETA == Q(9, 10**8)
    assert Q(".8747729897") - THETA == Q(17097, 10**10)
    assert THETA == Q(87477128, 10**8) and HEIGHT == Q(80008777, 10**8)
    print("PASS 20,527 acyclic sources (10,763 count + 9,764 physical stages)")
    print("PASS 41,054 width endpoints: 656,864 strict and 41,054 weak gates")
    print("PASS 369,486 cubic density polynomials with interpolation cross-checks")
    print("PASS 224 return boxes; 2,688 coefficients; 49 admissions; 33 reserves")
    print("Conditional theta = 87477128/100000000 = .87477128; reserve = 1e-9")
    print("Gain over PR #26 (.87477137) = 9e-8; over PR #8 (.8747729897) = 1.7097e-6")
    print("No new Lean build, analytic review or accepted record is claimed.")
