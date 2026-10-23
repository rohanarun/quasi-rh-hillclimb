#!/usr/bin/env python3
"""Exact replay/extension of Collet's NR1--NR14 finite return (not a Lean run)."""

import argparse
import hashlib
import json
import math
import re
import zipfile
from fractions import Fraction as Q
from functools import lru_cache
from pathlib import Path

import sympy as sp

if not __debug__:
    raise RuntimeError("Certificate checks require Python without -O")

D, P = sp.symbols("delta p")
ROOT = Path(__file__).resolve().parents[2]
PAPER = ROOT / "submissions/hailey-collet-1252270103/paper"
BC = Q("0.96226151753982")
LC = Q("3.14813176381578")
BP = Q("0.96739031091242")
LP = Q("3.27307995389766")
KI = Q("4.4973108")
ETA = Q(1, 10**7)
CAPC = Q(11, 250)
CAPP = Q(43, 1000)
CERTIFICATE_HASH = "932bd79b913d88485194bab9a75f25d7709b539d9134202ef915e1e20b967ef7"
EDGES = ["old_small", "old_peak", "old_switch", "new_switch", "new_top", "new_kink"]


def clean(s):
    return s.replace(r"\_\allowbreak{}", "_").replace(r"\ensuremath{-}", "-").strip()


def boxes():
    raw = (PAPER / "certificates.tex").read_bytes()
    assert hashlib.sha256(raw).hexdigest() == CERTIFICATE_HASH, (
        "Unexpected upstream certificate bytes"
    )
    text = raw.decode().split("Certificate B: final return", 1)[1]
    ans = []
    for line in text.splitlines():
        if not line.startswith(("old", "new")) or " & " not in line:
            continue
        parts = line.split(" & ")
        if len(parts) != 6:
            continue
        name, branch = map(clean, parts[:2])
        nums = []
        for s in parts[2:4]:
            z = re.findall(r"\{\[\}([^,]+),([^\{]+)\{\]\}", s)
            if len(z) != 2:
                raise ValueError(s)
            nums.append(tuple(Q(t.strip()) for pair in z for t in pair))
        ans.append((name, branch, *nums, int(parts[4]), int(parts[5].split()[0])))
    assert len(ans) == 224, len(ans)
    return ans


def polynomial(expr):
    p = sp.Poly(sp.cancel(expr), D, P)
    return {ij: Q(int(c.p), int(c.q)) for ij, c in p.terms() if c}


@lru_cache(None)
def weights(a, b, n):
    """Bernstein coefficients of each monomial on [a,b]."""
    return tuple(
        tuple(
            sum(
                (
                    Q(math.comb(k, u))
                    * a ** (k - u)
                    * (b - a) ** u
                    * Q(math.comb(i, u), math.comb(n, u))
                    for u in range(min(i, k) + 1)
                ),
                Q(0),
            )
            for k in range(n + 1)
        )
        for i in range(n + 1)
    )


def bernstein(poly, box, n=None, m=None):
    n = max(i for i, j in poly) if n is None else n
    m = max(j for i, j in poly) if m is None else m
    assert all(i <= n and j <= m for i, j in poly)
    a, b, c, d = box
    W = weights(a, b, n)
    Z = weights(c, d, m)
    return [
        sum((v * W[i][k] * Z[j][l] for (k, l), v in poly.items()), Q(0))
        for i in range(n + 1)
        for j in range(m + 1)
    ]


def counts(k):
    out = {}
    V = Q(5, 6) - D
    mh = (1 - KI * Q(17, 500)) / 2
    for branch, B, L, cap, iscap in [
        ("C", BC, LC, CAPC, False),
        ("P", BP, LP, CAPP, False),
        ("C cap", BC, LC, CAPC, True),
        ("P cap", BP, LP, CAPP, True),
        ("C-7", BC - Q(7, 4000), LC, CAPC, False),
    ]:
        z = cap - ETA
        dd = 3 - P if iscap else 3 - P - 4 * P / L
        A = 2 if iscap else 2 - 4 * P / L
        C0 = 1 - 2 * P * (z if iscap else B / L)
        U = (1 - P) * C0
        J = V * dd + D * (1 - P) * A
        N = (1 - D) * J + V * D * U
        T = J + D * U
        RN = A * T + (2 * P * (z if iscap else B / L) - P) * J
        MN = dd * T - RN
        DJ = dd * J
        ml = Q(2, 5) + ETA if iscap else max(Q(2, 5) + ETA, (B - L * z) / 2 + ETA)
        mu = min(
            Q(11, 25) - ETA,
            mh - ETA,
            (B - L * (z if iscap else Q(17, 500) + ETA)) / 2 - ETA,
        )
        guards = [
            dd,
            A,
            C0,
            J,
            T - J,
            Q(12499, 10000) * J - T,
            RN - Q(23, 37) * DJ,
            DJ - RN,
            MN - ml * DJ,
            mu * DJ - MN,
            N - (1 - 2 * D * mh - 2 * D * P * Q(17, 500)) * J,
            U * sp.diff(J, P) - sp.diff(U, P) * J,
            Q(11, 25) - mh - ETA,
            B - 2 * mh - L * (Q(17, 500) + ETA) - 2 * ETA,
        ]
        if iscap:
            guards.append((z - Q(17, 500) - ETA) * DJ)
        out[branch] = (J, N, [polynomial(g) for g in guards])
    dd = 3 - P - 2 * P / (3 * k)
    C = 2 * (1 - P) * (1 - P / (3 * k))
    J = V * dd + D * C
    out["old"] = (J, (1 - D) * J + D * C * V / 2, [polynomial(J)])
    return out


def geometry(theta, h, s=Q(1, 25)):
    ell = Q(11, 3) - 4 * theta
    x = 1 + ell - h
    y = h - 2 * ell
    k = 2 * theta - 1
    ds = 2 * y / (1 + 6 * k * s)
    dk = 2 * y / (2 - BP + LP * s)
    dp = h + Q(1, 10**10)
    d0 = Q(1, 200)
    dslist = [d0, y, ds, ds, dp, dk]
    capacities = [min(d, 2 * y - d) / (6 * k) for d in dslist[:3]] + [
        min(s * d, (2 * y - (2 - BP) * d) / LP) for d in dslist[3:]
    ]
    return {
        "theta": theta,
        "h": h,
        "s": s,
        "ell": ell,
        "x": x,
        "y": y,
        "k": k,
        "ds": ds,
        "dk": dk,
        "dp": dp,
        "d0": d0,
        "edges": dict(zip(EDGES, zip(dslist, capacities))),
    }


def reserves(g):
    theta, h, s, ell, x, y, k, ds, dk, dp, d0 = (
        g[n] for n in ["theta", "h", "s", "ell", "x", "y", "k", "ds", "dk", "dp", "d0"]
    )
    nmax = 1 - y / dp + Q(1, 400)
    v = [
        x - ell,
        y - x,
        Q(1, 5) - ell,
        2 * x - y - ell,
        y - d0,
        ds - y,
        dk - ds,
        dp - dk,
        2 * y - dp,
        1 - y / ds - Q(2, 5) - ETA,
        Q(11, 25) - nmax - ETA,
        min(s, (BP - 2 * nmax) / LP) - Q(17, 500) - ETA,
        CAPP - s - ETA,
        1 - 2 * nmax - Q(9, 2) * Q(17, 500) - ETA,
        1 - Q(2, 5) - BP / 2 - (Q(9, 2) - LP / 2) * s - ETA,
        (Q(7, 18) - Q(1, 500)) * Q(1, 400)
        + (1 - BP) / 18
        + (LP / 18 - Q(1, 4)) * s
        - ETA,
        Q(1, 2) - 1 / (2 * LP) - Q(1, 500),
        Q(1, 2) - 1 / (2 * LP) - Q(1, 500),
        ell / dp - Q(1, 5),
        y - dp / 2,
        KI / 6 - k,
        k - Q(7, 10),
        1 - dp,
        Q(1, 2) - y,
        theta
        - (4 + y - x) / 6
        - Q(1, 200)
        - (Q(4, 25) * x - Q(3, 20) - Q(51, 100) * y + Q(67, 100) * dp - Q(3, 20) * ell),
        -Q(1, 20) - (Q(13, 75) * h - y / 2 + Q(63, 50) * d0),
        y / 20 - (1 + h) / 1000 - Q(1, 4000),
        h / 600 - Q(1, 1000) - Q(1, 4000),
        theta - Q(17, 20),
        LP - 3,
        1 - BP,
        Q("0.0549989") - CAPC,
        Q("0.0549989") - CAPP,
    ]
    assert len(v) == 33
    assert all(t > 0 for t in v), [(i, str(t)) for i, t in enumerate(v) if t <= 0]
    # NR3, NR5, FR20--23 hypotheses and parameterized width requirements.
    assert Q(1, 6) < ell < Q(1, 5) and ell > 0 and x + y == 1 - ell
    assert 1 + 3 * ell - 2 * (x + y) < 0 and theta < Q(7, 8)
    assert Q(7, 10) <= k <= KI / 6 < Q(3, 4) and 3 < LP < Q(9, 2) and s > Q(17, 500)
    assert (
        min(ds, 2 * y - ds) / (6 * k)
        == min(s * ds, (2 * y - (2 - BP) * ds) / LP)
        == s * ds
    )
    assert theta - (4 + y - x) / 6 == x / 2 + (y - x) / 12
    assert Q(5, 288) + Q(25, 784) < Q(1, 8)
    return v


def cover(rows):
    for e in EDGES:
        bs = [r[2] for r in rows if r[0] == e]
        assert all(0 <= a < b <= Q(3, 4) and 0 <= c < d <= Q(1, 2) for a, b, c, d in bs)
        assert sum(((b - a) * (d - c) for a, b, c, d in bs), Q(0)) == Q(3, 8)
        for i, (a, b, c, d) in enumerate(bs):
            for A, B, C, Z in bs[i + 1 :]:
                assert min(b, B) <= max(a, A) or min(d, Z) <= max(c, C)
    # finite union is closed; contained, disjoint interiors and full area imply cover.


def archived_return_coefficients(index):
    """Read exact normalized Bernstein coefficients from the frozen Lean archive."""
    archive = ROOT / "submissions/hailey-collet-1252270103/lean-sources.zip"
    with zipfile.ZipFile(archive) as z:
        path = f"src/Submissions/hailey_collet_1252270103/Record1252270103Finite/Return{index:03}.lean"
        txt = z.read(path).decode()
    raw = txt.split(f"def row{index:03}_coefficients", 1)[1].split("theorem", 1)[0]
    coeff = [Q(x) for x in re.findall(r"\(([-0-9/]+):ℝ\)", raw)]
    scale = Q(re.search(r"Bernstein.bsum 2 3 \(([-0-9/]+):ℝ\)", txt).group(1))
    assert len(coeff) == 12
    a, b, c, d = boxes()[index - 1][2]
    # Upstream bsum = margin + sum(g_ij * unnormalized product powers).
    # Convert to the normalized partition-of-unity Bernstein convention here.
    return [
        scale
        + coeff[4 * i + j]
        * (b - a) ** 2
        * (d - c) ** 3
        / (math.comb(2, i) * math.comb(3, j))
        for i in range(3)
        for j in range(4)
    ]


def fixed_geometry_obstruction():
    """Exact failure of this finite envelope, not an arithmetic zero or global ceiling."""
    theta = Q("0.8747729894")
    h = Q("0.8001009617")
    de = Q("0.45825575")
    p = Q(1, 2)
    g = geometry(theta, h)
    cs = counts(g["k"])
    admitted = {}
    for b, (J, N, guards) in cs.items():
        val = lambda poly: sum((v * de**i * p**j for (i, j), v in poly.items()), Q(0))
        if all(val(poly) > 0 for poly in guards):
            jj = Q(
                J.subs(
                    {D: sp.Rational(de.numerator, de.denominator), P: sp.Rational(1, 2)}
                )
            )
            nn = Q(
                N.subs(
                    {D: sp.Rational(de.numerator, de.denominator), P: sp.Rational(1, 2)}
                )
            )
            admitted[b] = nn / jj
    b = min(admitted, key=admitted.get)
    d, C = g["edges"]["new_top"]
    eb = (
        Q(1, 2)
        + Q(13, 75) * h
        - g["y"] / 2
        - g["ell"] / 2
        - Q(9, 100) * d
        + de / 2
        + de * p * (g["ell"] - C / 2)
    )
    deficit = eb + Q(3, 4) * d * admitted[b] - theta
    assert b == "C" and deficit > 0
    return {
        "theta": str(theta),
        "h": str(h),
        "delta": str(de),
        "p": str(p),
        "minimizing_count": b,
        "E_minus_theta": str(deficit),
        "scope": "Failure at this fixed geometry and finite count envelope only; no zero of any L-function is exhibited.",
    }


def replay(theta, h, s, fee, baseline=False):
    assert fee > 0, "The analytic return reserve must be strictly positive"
    if baseline:
        archive = ROOT / "submissions/hailey-collet-1252270103/lean-sources.zip"
        assert hashlib.sha256(archive.read_bytes()).hexdigest() == (
            "e69c31261bb4f7b997679220f7b0c32063af4721dd95dcb787d8b5074f95adfa"
        ), "Unexpected upstream Lean source archive"
    g = geometry(theta, h, s)
    scalar = reserves(g)
    cs = counts(g["k"])
    rows = boxes()
    cover(rows)
    minimum = None
    mins = {}
    bad = []
    checked = set()
    admissions = []
    polys = {}
    for e, (d, C) in g["edges"].items():
        eb = (
            Q(1, 2)
            + Q(13, 75) * h
            - g["y"] / 2
            - g["ell"] / 2
            - Q(9, 100) * d
            + D / 2
            + D * P * (g["ell"] - C / 2)
        )
        for b, (J, N, guards) in cs.items():
            polys[e, b] = polynomial(J * (theta - fee - eb) - Q(3, 4) * d * N)
    for idx, (e, b, box, ab, printed_r, printed_a) in enumerate(rows):
        assert ab[0] <= box[0] < box[1] <= ab[1] and ab[2] <= box[2] < box[3] <= ab[3]
        assert b == "old" or ab[3] == Q(1, 2)
        coeffs = bernstein(polys[e, b], box, 2, 3)
        m = min(coeffs)
        if m <= 0:
            bad.append((idx + 1, e, b, str(m)))
        minimum = m if minimum is None else min(minimum, m)
        mins[e] = min(mins.get(e, m), m)
        if baseline:
            assert int(m * 10**20) == printed_r, (idx + 1, str(m), printed_r)
            assert coeffs == archived_return_coefficients(idx + 1), (
                f"Lean coefficient mismatch at row {idx + 1}"
            )
        key = (b, ab)
        if key not in checked:
            checked.add(key)
            am = min(c for poly in cs[b][2] for c in bernstein(poly, ab))
            assert am > 0, (b, ab, str(am))
            admissions.append(am)
            if baseline:
                assert int(am * 10**20) == printed_a, (idx + 1, str(am), printed_a)
    if baseline:
        expected = Q(
            148452097992154215093151812991551766009,
            5186216782535828843621832223258312704000000000000,
        )
        assert minimum == expected, (str(minimum), str(expected))
    result = {
        "theta": str(theta),
        "h": str(h),
        "physical_width": str(s),
        "reserve": str(fee),
        "return_boxes": len(rows),
        "return_coefficients": 12 * len(rows),
        "admission_windows": len(checked),
        "scalar_reserves": len(scalar),
        "minimum_return": str(minimum),
        "minimum_admission": str(min(admissions)),
        "minimum_scalar": str(min(scalar)),
        "edge_minima": {k: str(v) for k, v in mins.items()},
        "failures": bad,
        "upstream_certificate_sha256": CERTIFICATE_HASH,
        "archived_lean_coefficients_compared": 2688 if baseline else 0,
        "scope": "Exact finite arithmetic; conditional on Collet source moments and parameterized analytic return. No fresh Lean verification.",
    }
    return result


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--theta", default="0.8747729897")
    ap.add_argument("--h", default="0.8001009617")
    ap.add_argument("--width", default="0.04")
    ap.add_argument("--reserve", default="0.000000001")
    ap.add_argument("--baseline", action="store_true")
    ap.add_argument("--obstruction", action="store_true")
    ap.add_argument("--output")
    args = ap.parse_args()
    if args.obstruction:
        print(json.dumps(fixed_geometry_obstruction(), indent=2))
        raise SystemExit(0)
    out = replay(
        Q(args.theta), Q(args.h), Q(args.width), Q(args.reserve), args.baseline
    )
    print(json.dumps(out, indent=2))
    if args.output:
        Path(args.output).write_text(json.dumps(out, indent=2) + "\n")
    raise SystemExit(bool(out["failures"]))
