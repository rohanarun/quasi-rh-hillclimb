"""Batched-q numerical exploration, substantially AI-assisted with OpenAI Codex.

Prepared for Subhanjan Das, building on Hailey Collet\'s NF rule and the
preserved dense-source search. Saved exact graphs/replays are authoritative.
"""

import argparse
import json
from decimal import Decimal
from pathlib import Path

import numpy as np
import search_model as model
from scipy.optimize import minimize_scalar


def crossings(qs, parent, red, cap, target):
    g0 = model.gates(red, qs, 0, parent, cap=cap)
    slope = model.gates(red, qs, 1, parent, cap=cap) - g0
    scalar = np.ndim(qs) == 0
    if scalar:
        g0, slope = g0[:, None], slope[:, None]
    with np.errstate(divide="ignore", invalid="ignore"):
        roots = -g0 / slope
    lower = np.maximum(0, np.max(np.where(slope > 1e-16, roots, -np.inf), axis=0))
    upper = np.minimum(
        min(target, parent[2], cap, (parent[0] - 22 / 23) / red),
        np.min(np.where(slope < -1e-16, roots, np.inf), axis=0),
    )
    bad = np.any((np.abs(slope) <= 1e-16) & (g0 <= 0), axis=0)
    result = np.where((lower < upper) & ~bad, lower, np.inf)
    return float(result[0]) if scalar else result


def next_source(parent, red, cap, target):
    top = min(0.75, parent[1] / (6 * parent[0]))
    if top <= 0.50000001:
        return None
    gaps = np.geomspace(1e-9, top - 0.50000001, 80)
    qs = top - gaps
    cs = crossings(qs, parent, red, cap, target)
    idx = int(np.argmin(cs))
    bx, q = cs[idx], qs[idx]
    if not np.isfinite(bx):
        return None
    lower, upper = sorted([qs[max(0, idx - 1)], qs[min(len(qs) - 1, idx + 1)]])
    opt = minimize_scalar(
        lambda q: crossings(q, parent, red, cap, target),
        bounds=(lower, upper),
        method="bounded",
        options={"xatol": 1e-14},
    )
    ob = crossings(opt.x, parent, red, cap, target)
    if ob < bx:
        bx, q = ob, float(opt.x)
    bx += 2e-8
    return parent[0] - red * bx, parent[1] - red, q


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--cap", default=".044001")
    ap.add_argument("--step", default=".001")
    ap.add_argument("--steps", type=int, default=1600)
    ap.add_argument("--target", type=float, default=0.04232527914)
    ap.add_argument("--output", required=True)
    args = ap.parse_args()
    parent = (1.0, model.K, 0.055)
    nodes = []
    for i in range(1, args.steps + 1):
        result = next_source(parent, float(args.step), float(args.cap), args.target)
        if result is None:
            break
        B, L, q = result
        previous = "natural" if i == 1 else f"vector_{i - 1}"
        nodes.append(
            {
                "id": f"vector_{i}",
                "B": format(B, ".14f"),
                "L": str(Decimal("4.4973108") - Decimal(args.step) * i),
                "cap": args.cap,
                "q": format(q, ".14f"),
                "low": previous,
                "high": previous,
            }
        )
        parent = (B, L, float(args.cap))
        if i % 200 == 0:
            print(f"{i} batched numerical sources", flush=True)
    Path(args.output).write_text(json.dumps(nodes, indent=2) + "\n")
    print(
        json.dumps({"nodes": len(nodes), "last": nodes[-1] if nodes else None}),
        flush=True,
    )


if __name__ == "__main__":
    main()
