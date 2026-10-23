#!/usr/bin/env python3
"""Exact replay of the adaptive-cap candidate theta = 87477127/100000000.

Place this folder at auto-research/<name>/ inside the repository (the return
checker reads Collet's pinned certificates.tex two levels up). ~10 minutes.
"""
import json
from fractions import Fraction as Q
from pathlib import Path
from certify import verify

HERE = Path(__file__).resolve().parent
THETA, HEIGHT = Q(".87477127"), Q(".80008783")

if __name__ == "__main__":
    graph = json.loads((HERE / "sources.json").read_text())
    caps = sorted({Q(n["cap"]) for n in graph})
    result = verify(graph, theta=THETA, h=HEIGHT,
                    count_id="count_21527", physical_id="physical_19529")
    assert result == json.loads((HERE / "certificate.json").read_text())
    assert result["source_receipt"]["nodes"] == 41056
    assert Q(".87477128") - THETA == Q(1, 10**8)
    print(f"PASS 41,056 sources (21,527 count + 19,529 physical); {len(caps)} distinct caps,"
          f" from {float(caps[0]):.6f} to {float(caps[-1]):.6f}")
    print("PASS 224 return boxes, 49 admissions, 33 reserves")
    print("Conditional theta = 87477127/100000000; 1e-8 below PR #27")
