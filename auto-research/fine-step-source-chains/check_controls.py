#!/usr/bin/env python3
"""Negative controls for the exact checker (not an endpoint proof).

The first five controls are PR #26's. The sixth shows that the same graph and
height are rejected one unit lower, at theta = .87477127; it takes ~5 minutes
and runs only with --slow.
"""
import argparse
import copy
import json
import subprocess
import sys
from fractions import Fraction as Q
from pathlib import Path

import return_budget as C
from nf_source import certify

HERE = Path(__file__).resolve().parent


def reject(label, action):
    try:
        action()
    except (AssertionError, KeyError) as error:
        print("PASS rejection:", label, "|", str(error)[:160])
        return
    raise RuntimeError("Invalid input was accepted: " + label)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--slow", action="store_true")
    args = parser.parse_args()
    graph = json.loads((HERE / "sources.json").read_text())
    bad = copy.deepcopy(graph[:1])
    bad[0]["low"] = bad[0]["id"]
    reject("self-dependent first source", lambda: certify(bad))
    bad = copy.deepcopy(graph[:1])
    bad[0]["B"] = "2"
    reject("out-of-domain source face", lambda: certify(bad))
    receipt = json.loads((HERE / "certificate.json").read_text())
    rows = [(r["edge"], r["branch"], tuple(map(C.Q, r["box"])),
             tuple(map(C.Q, r["admission"])), 0, 0) for r in receipt["cover"]]
    C.cover(rows)
    reject("missing rectangle in the cover", lambda: C.cover(rows[1:]))
    reject("duplicated rectangle in the cover", lambda: C.cover(rows + rows[:1]))
    result = subprocess.run([sys.executable, "-O", str(HERE / "replay.py")],
                            capture_output=True, text=True, check=False)
    if result.returncode == 0 or "Certificate checks require Python without -O" not in result.stderr:
        raise RuntimeError("Optimized Python did not reject the assertion-based checker")
    print("PASS rejection: Python -O")
    count = 5
    if args.slow:
        from certify import verify
        reject("same graph and h at theta = .87477127",
               lambda: verify(graph, theta=Q(".87477127")))
        count += 1
    print(f"{count} negative controls passed; no analytic or Lean verification is implied.")


if __name__ == "__main__":
    main()
