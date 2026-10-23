#!/usr/bin/env python3
"""Check export fidelity; this is not a Lean type checker or proof verifier."""
import json
import re
from fractions import Fraction

from generate import HERE, q, sha


def main():
    graph = json.loads((HERE.parent / "sources.json").read_text())
    data = (HERE / "src/QRH87477137/Data.lean").read_text()
    parsed = {}
    for name, values in re.findall(r"^def (\w+) : Source := ⟨([^⟩]+)⟩$", data, re.MULTILINE):
        if name in parsed:
            raise ValueError("Duplicate definition")
        parsed[name] = values
    if len(parsed) != 3911:
        raise ValueError("Incomplete source export")
    validity = "\n".join(p.read_text() for p in sorted((HERE / "src/QRH87477137/Validity").glob("*.lean")))
    stages = "\n".join(p.read_text() for p in sorted((HERE / "src/QRH87477137/Sources").glob("*.lean")))
    for node in graph:
        name, parent = node["id"], node["low"]
        expected = [q(node[k]) for k in ("B", "L", "cap", "q")]
        expected += ["1 / 10^17", "1 / 10^12", "1 / 10^10"]
        if parsed[name] != ", ".join(expected):
            raise ValueError("Changed source parameters")
        goal = f"theorem {name}_valid : SourceValid {name} {parent} (some {parent}) := by decide +kernel"
        if validity.count(goal) != 1:
            raise ValueError("Wrong finite validity obligation")
        proof = f"next_ready hbeta {name}_valid {name}_accounting ({parent}_ready hbeta)"
        if stages.count(proof) != 1:
            raise ValueError("Wrong source induction link")
    if len(re.findall(r"^theorem \w+_valid :", validity, re.MULTILINE)) != 3911:
        raise ValueError("Extra or missing validity goals")
    manifest = json.loads((HERE / "generated-manifest.json").read_text())
    actual = {p.relative_to(HERE).as_posix(): sha(p.read_bytes()) for p in sorted((HERE / "src").rglob("*.lean"))}
    if actual != manifest["generated_files"]:
        raise ValueError("Manifest mismatch")
    if Fraction(".87477137") != Fraction(87477137, 100000000):
        raise ValueError("Wrong endpoint")
    print("PASS 3,911 exact data exports, validity goals and earlier-parent induction links")
    print("PASS 251 generated Lean source hashes")
    print("Export fidelity only: no Lean compilation or endpoint proof is established.")


if __name__ == "__main__":
    main()
