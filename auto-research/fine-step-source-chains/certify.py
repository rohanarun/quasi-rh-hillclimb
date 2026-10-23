#!/usr/bin/env python3
"""Exact conditional source/return check for the fine-step candidate.

theta = 87477128/100000000, h = 80008777/100000000.

This is PR #26's role-source-caps/certify.py with the selected source ids,
theta and h made explicit. nf_source.py and return_budget.py are byte-for-byte
copies of PR #26's verifiers, which transcribe Hailey Collet's NF and NR
interfaces (PR #8). No floating-point arithmetic is used. No Lean endpoint is
claimed.

Prepared for Subhanjan Das with Claude (Anthropic) assistance.
"""
import argparse
import json
from fractions import Fraction as Q
from pathlib import Path

import return_budget as C
from nf_source import certify as certify_sources

HERE = Path(__file__).resolve().parent
THETA = Q(".87477128")
HEIGHT = Q(".80008777")
COUNT_ID = "count_10763"
PHYSICAL_ID = "physical_9764"
ORIGINAL_COUNTS = C.counts
ORIGINAL_BOXES = C.boxes


def adapted_cover(theta, h, fee):
    """Refine the pinned closed cover; certify admissions on upward p windows.

    Unchanged from PR #26.
    """
    g = C.geometry(theta, h)
    cs = ORIGINAL_COUNTS(g["k"])
    polys = {}
    for edge, (d, cap) in g["edges"].items():
        base = (
            Q(1, 2)
            + Q(13, 75) * h
            - g["y"] / 2
            - g["ell"] / 2
            - Q(9, 100) * d
            + C.D / 2
            + C.D * C.P * (g["ell"] - cap / 2)
        )
        for branch, (J, N, _) in cs.items():
            polys[edge, branch] = C.polynomial(
                J * (theta - fee - base) - Q(3, 4) * d * N
            )
    cache = {}
    out = []

    def resolve(edge, preferred, box, depth=0):
        a, b, c, d = box
        ab = (a, b, c, Q(1, 2))
        order = list(
            dict.fromkeys([preferred, "C", "P", "C cap", "P cap", "C-7", "old"])
        )
        for branch in order:
            key = (branch, ab)
            if key not in cache:
                cache[key] = all(
                    min(C.bernstein(poly, ab)) > 0 for poly in cs[branch][2]
                )
            if cache[key] and min(C.bernstein(polys[edge, branch], box, 2, 3)) > 0:
                out.append((edge, branch, box, ab, 0, 0))
                return
        if depth >= 30:
            raise AssertionError(f"Uncertified return box {edge} {box}")
        if (b - a) / Q(3, 4) >= (d - c) / Q(1, 2):
            mid = (a + b) / 2
            resolve(edge, preferred, (a, mid, c, d), depth + 1)
            resolve(edge, preferred, (mid, b, c, d), depth + 1)
        else:
            mid = (c + d) / 2
            resolve(edge, preferred, (a, b, c, mid), depth + 1)
            resolve(edge, preferred, (a, b, mid, d), depth + 1)

    for edge, branch, box, _, _, _ in ORIGINAL_BOXES():
        resolve(edge, branch, box)
    C.cover(out)
    return out


def verify(graph, theta=THETA, h=HEIGHT, count_id=COUNT_ID, physical_id=PHYSICAL_ID):
    source_receipt = certify_sources(graph, crosscheck=True)
    by_id = {node["id"]: node for node in graph}
    count, physical = by_id[count_id], by_id[physical_id]
    old_parameters = C.BC, C.LC, C.BP, C.LP
    C.BC, C.LC = Q(count["B"]), Q(count["L"])
    C.BP, C.LP = Q(physical["B"]), Q(physical["L"])
    assert Q(count["cap"]) > C.CAPC
    assert Q(physical["cap"]) > C.CAPP
    original_reserves, original_boxes = C.reserves, C.boxes

    def actual_reserves(g):
        values = original_reserves(g)
        values[-2] = Q(count["cap"]) - C.CAPC
        values[-1] = Q(physical["cap"]) - C.CAPP
        assert min(values) > 0
        return values

    C.reserves = actual_reserves
    try:
        rows = adapted_cover(theta, h, Q(1, 10**9))
        C.boxes = lambda: rows
        result = C.replay(theta, h, Q(1, 25), Q(1, 10**9))
        assert not result["failures"]
        result["source_receipt"] = source_receipt
        result["selected_sources"] = {"count": count, "physical": physical}
        result["geometry"] = {
            k: str(v) for k, v in C.geometry(theta, h).items() if k != "edges"
        }
        result["cover"] = [
            {
                "edge": e,
                "branch": b,
                "box": list(map(str, box)),
                "admission": list(map(str, admission)),
            }
            for e, b, box, admission, _, _ in rows
        ]
        return result
    finally:
        C.reserves, C.boxes = original_reserves, original_boxes
        C.BC, C.LC, C.BP, C.LP = old_parameters


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--theta", default=str(THETA))
    parser.add_argument("--h", default=str(HEIGHT))
    parser.add_argument("--output")
    args = parser.parse_args()
    result = verify(
        json.loads((HERE / "sources.json").read_text()), Q(args.theta), Q(args.h)
    )
    if args.output:
        Path(args.output).write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({k: v for k, v in result.items() if k != "cover"}, indent=2))
