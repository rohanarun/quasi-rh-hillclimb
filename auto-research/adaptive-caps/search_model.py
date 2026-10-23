#!/usr/bin/env python3
"""CPU-only numerical search for a dense source chain.

Floating search is not a proof and need not be bitwise portable. The saved
exact sources.json and nf_source.py are the authoritative replay.
"""


import numpy as np

K = 4.4973108
E, R, FEE = 1e-17, 1e-12, 1e-10


def gates(red, q, bx, parent, cap=0.0549989):
    B0, L0, h0 = parent
    den = 1 - 6 * q * B0 / L0
    nu = np.linspace(q, 0.75, 97)
    tv = 15 - 6 * nu
    w = 5 - 6 * nu
    rho = 1 - 10 * nu / tv
    out = []
    for b in (bx, cap):
        t = B0 - L0 * b + red * (b - bx) + (L0 - red) * E
        a = (q * red * (b - bx - E) / L0 + q * E + R) / den
        T = t + b
        F = 1 - 6 * a
        Fp = F - E
        lr = 0.49 - K * b
        out.extend(
            [
                a - 20 * E,
                1 / 75 - a,
                F - T / 2 - 4 * E,
                B0 * F - t - b - 4 * E,
                5 / 6 + 0.499 * lr - T - 9 * a - FEE,
                1 - T - 5 * a - FEE,
                0.98 - T - 4 * a - FEE,
                0.98 - T - 4.5 * a - FEE,
                lr - 7 * a - FEE,
                h0 * F - (B0 * F - t) / L0,
            ]
        )
        H = 1 - rho - nu * T - a * (5 - 6 * rho)
        gains = [
            3 * nu * w / tv * (b - 2 * E),
            2 * nu * w / tv * (b - 2 * E) + nu * w * h0 / tv * Fp,
            2 * nu * w * (L0 - 1) / (L0 * tv - 10) * (b - 2 * E)
            + nu * w * (B0 * tv - 10) / (tv * (L0 * tv - 10)) * Fp,
            nu * w / (10 + 3 * w) * (b - 2 * E)
            + 2 * nu * w * w / (tv * (10 + 3 * w)) * Fp,
            (2 * nu * w * w / (tv * (10 + 3 * w)) + nu * w * h0 / (10 + 3 * w)) * Fp,
            nu
            * w
            * (2 * w * (L0 - 1) + B0 * tv - 10)
            / (tv * (L0 * (10 + 3 * w) - (10 + 2 * w)))
            * Fp,
        ]
        for g in gains:
            out.extend(H + g - FEE)
        out.extend(H + nu * Fp / 2 - (1 - nu) * b - FEE)
        out.extend(H + (rho - 1 / 6) * Fp - (1 - nu) * b - FEE)
        out.extend(H + nu * (Fp - 0.02) / 2 - (1 - rho) * 0.02 - (1 - nu) * b - FEE)
    return np.array(out)
