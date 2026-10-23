#!/usr/bin/env python3
"""Negative controls for the exact checker; not an endpoint proof."""
import copy
import json
import subprocess
import sys
from pathlib import Path

import return_budget as C
from nf_source import certify

HERE = Path(__file__).resolve().parent


def reject(label, action):
    try:
        action()
    except (AssertionError, KeyError):
        print("PASS rejection:", label)
        return
    raise RuntimeError("Invalid input was accepted: " + label)


def main():
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
    print("Five negative controls passed; no analytic or Lean verification is implied.")


if __name__ == "__main__":
    main()
