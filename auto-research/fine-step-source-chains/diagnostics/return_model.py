"""Floating-point model of Collet's parameterized return (NR1-NR7).

DIAGNOSTIC ONLY. It mirrors return_budget.py's count branches, admission
guards (as point tests on a grid, upward-closed in p), geometry, capacities
and six conductor endpoints, then bisects for the smallest theta whose
grid maximum of E - (theta - 1e-9) is negative and minimizes over h.
Grid tests are not proofs; ../certify.py is the exact check.

Calibration (run_diagnostics.py): reproduces PR #8's 0.8747729897 to
about 2.5e-9 and PR #26's 0.87477137 to about 1e-8.
"""
import numpy as np
import sympy as sp
from scipy.optimize import minimize_scalar

D, P = sp.symbols("delta p")
V0 = sp.Rational(5, 6)  # long-inverse (sixth-power) slope; varied only in what-ifs


def branch_exprs(BC, LC, BP, LP, KI, CAPC=0.044, CAPP=0.043, ETA=1e-7):
    out = {}
    V = V0 - D
    mh = (1 - KI * 0.034) / 2
    for name, B, L, cap, iscap in [
        ("C", BC, LC, CAPC, False), ("P", BP, LP, CAPP, False),
        ("C cap", BC, LC, CAPC, True), ("P cap", BP, LP, CAPP, True),
        ("C-7", BC - 7 / 4000, LC, CAPC, False)]:
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
        ml = 0.4 + ETA if iscap else max(0.4 + ETA, (B - L * z) / 2 + ETA)
        mu = min(0.44 - ETA, mh - ETA, (B - L * (z if iscap else 0.034 + ETA)) / 2 - ETA)
        guards = [dd, A, C0, J, T - J, 1.2499 * J - T, RN - sp.Rational(23, 37) * DJ,
                  DJ - RN, MN - ml * DJ, mu * DJ - MN,
                  N - (1 - 2 * D * mh - 2 * D * P * 0.034) * J,
                  U * sp.diff(J, P) - sp.diff(U, P) * J,
                  0.44 - mh - ETA, B - 2 * mh - L * (0.034 + ETA) - 2 * ETA]
        if iscap:
            guards.append((z - 0.034 - ETA) * DJ)
        out[name] = (sp.lambdify((D, P), N / J, "numpy"),
                     [sp.lambdify((D, P), g + 0 * D, "numpy") for g in guards])
    return out


class Model:
    def __init__(self, BC, LC, BP, LP, KI=4.4973108, nd=1501, npn=26):
        self.BC, self.LC, self.BP, self.LP, self.KI = BC, LC, BP, LP, KI
        self.d = np.linspace(0, 0.75, nd)
        self.p = np.linspace(0, 0.5, npn)
        self.Dg, self.Pg = np.meshgrid(self.d, self.p, indexing="ij")
        self.R = {}
        for name, (f, gs) in branch_exprs(BC, LC, BP, LP, KI).items():
            val = f(self.Dg, self.Pg) * np.ones_like(self.Dg)
            ok = np.ones_like(self.Dg, dtype=bool)
            for g in gs:
                ok &= g(self.Dg, self.Pg) * np.ones_like(self.Dg) > 0
            ok = np.flip(np.logical_and.accumulate(np.flip(ok, 1), axis=1), 1)
            self.R[name] = np.where(ok, val, np.inf)

    def rstar(self, k):
        Dg, Pg = self.Dg, self.Pg
        V = float(V0) - Dg
        dd = 3 - Pg - 2 * Pg / (3 * k)
        C = 2 * (1 - Pg) * (1 - Pg / (3 * k))
        J = V * dd + Dg * C
        old = ((1 - Dg) * J + Dg * C * V / 2) / J
        return np.minimum.reduce([old] + list(self.R.values()))

    def excess(self, theta, h, s=0.04, fee=1e-9, shift=0.0):
        """max over grid of E - (theta - fee) - shift; also the argmax."""
        ell = 11 / 3 - 4 * theta
        y = h - 2 * ell
        k = 2 * theta - 1
        ds = 2 * y / (1 + 6 * k * s)
        dk = 2 * y / (2 - self.BP + self.LP * s)
        dl = [1 / 200, y, ds, ds, h + 1e-10, dk]
        caps = [min(d, 2 * y - d) / (6 * k) for d in dl[:3]] + [
            min(s * d, (2 * y - (2 - self.BP) * d) / self.LP) for d in dl[3:]]
        Rs = self.rstar(k)
        worst, arg = -np.inf, None
        for i, (d, C) in enumerate(zip(dl, caps)):
            E = (0.5 + 13 * h / 75 - y / 2 - ell / 2 - 0.09 * d + self.Dg / 2
                 + self.Dg * self.Pg * (ell - C / 2) + 0.75 * d * Rs)
            m = E.max()
            if m > worst:
                j = np.unravel_index(E.argmax(), E.shape)
                worst, arg = m, (i, float(self.d[j[0]]), float(self.p[j[1]]), d, C, float(Rs[j]))
        return worst - (theta - fee) - shift, arg

    def theta_at(self, h, **kw):
        lo, hi = 0.86, 0.8749
        for _ in range(55):
            mid = (lo + hi) / 2
            if self.excess(mid, h, **kw)[0] < 0:
                hi = mid
            else:
                lo = mid
        return hi

    def best(self, h0=0.8001, span=0.003, **kw):
        r = minimize_scalar(lambda h: self.theta_at(h, **kw), bounds=(h0 - span, h0 + span),
                            method="bounded", options={"xatol": 1e-10})
        return float(r.fun), float(r.x)
