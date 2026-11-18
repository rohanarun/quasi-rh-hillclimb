"""Replay the 37 strict tracker cells and the cost of lowering the target.

Input: the hash-pinned ExactReturnData.lean named in the proposal. The proved
lower-polynomial identities and the critical factorization come from #143.
"""
from fractions import Fraction as Q
from hashlib import sha256
from pathlib import Path
import re
import sys

import sympy as sp

sys.path.insert(0, str(Path(__file__).resolve().parents[2]))
from certify import bernstein_min, d, y


def require(condition, label):
    if not condition:
        raise ValueError(label)


def strict_cells(path):
    raw = path.read_bytes()
    require(sha256(raw).hexdigest() ==
            "233d5491d40bda5dab0687a70780d7990afbdef5915e4fec218008dee51c7389",
            "expected ExactReturnData.lean from tracker #143")
    source = raw.decode()
    polynomials = {}
    for name, matrix in re.findall(r"^def (lower_\w+) : Q2 := \[\[(.+)\]\]$", source, re.M):
        terms = []
        for i, row in enumerate(matrix.split("],[")):
            for j, coeff in enumerate(row.split(",")):
                require(re.fullmatch(r"\(-?\d+/\d+\)", coeff), coeff)
                terms.append(sp.Rational(coeff[1:-1]) * d**i * y**j)
        polynomials[name] = sp.Poly(sum(terms), d, y)
    floors = {}
    pattern = r"^theorem checked_(\d+) : bernCheck (lower_(\d)_\w+) (.+) = true"
    for idx, name, edge, args in re.findall(pattern, source, re.M):
        a, b, c, e = (sp.Rational(v[1:-1]) for v in args.split())
        require(0 <= a < b <= Q(3, 4) and 0 <= c < e <= Q(1, 2), idx)
        floors[int(idx)] = (int(edge), bernstein_min(polynomials[name], ((a, b), (c, e))))
    critical = {27, 29, 35, *range(38, 55)}
    require(set(floors) == set(range(57)) - critical, "strict/critical partition")
    for edge, floor in floors.values():
        require(floor > Q(1, 500000), "strict complement margin")
        if edge == 2:
            require(floor > Q(1, 125), "upper capacity at switch")
    idx = min(floors, key=lambda i: floors[i][1])
    print(f"{len(floors)} strict boxes, minimum at cell {idx}: {floors[idx][1]}")


def target_check():
    t = Q(".87334585")
    lo = Q(109168232013339822100148, 125000000000000000000000)
    hi = Q(174669171221343715360237, 200000000000000000000000)
    eps = Q(7, 10**9)
    require(Q(6, 10**9) < lo - t <= hi - t < eps, "distance below isolated root")
    jmax = Q(5, 2)
    debit = 6 * eps
    fee = Q(1, 10**9)
    require(Q(1, 500000) / jmax > debit + fee, "37 strict cells after shift")
    delta_gap = min(Q(".4258") - Q(".425"), Q(".4267") - Q(".4259"))
    outside = min(delta_gap**2 / 5, (Q(1, 2) - Q(".49995")) * Q(189, 512) / 100)
    require(outside / jmax > debit + fee, "critical rectangle outside patch")
    count_gain = Q(1, 10**7)
    require(Q(3, 4) * Q(".8152") * count_gain > debit + fee,
            "critical rectangle inside patch")
    switch_margin = Q(1, 125) / jmax
    split_weight = Q(1, 100000) / (Q(".8154") - Q(".76"))
    require(split_weight * switch_margin > debit + fee, "inherited count at split")
    extension = cost = Q(1, 10**10)
    slope = -Q(9, 100) + Q(3, 4) + Q(3, 8) / 4
    require(slope < 1, "upper conductor slope")
    require(fee - extension - Q(15, 16)*cost > fee/2, "extended positive-cost fee")
    require(Q(".8096863501") < Q(".8152") - Q(1, 100000), "PR #40 conductor exclusion")
    print(f"target {t}, four edges and split pass, extended positive-cost fee {fee/2}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: python cover.py PINNED_EXACT_RETURN_DATA.lean")
    strict_cells(Path(sys.argv[1]))
    target_check()
