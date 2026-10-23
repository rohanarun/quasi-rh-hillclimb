"""What-if: marked inverse moment with slot coefficient lam (preprint: lam = 2).

Generic same-zero count from the three witness lines of the preprint's
Prop. detector-counts (paper.tex 15185) as used by Collet FR4/NR2:
  inverse  I(r) = 1 - delta r - 2 delta p zI(r)
           zI(r) = min((1-r)/lam, supply [, second-condition cap])
  plain    P(m) = 1 - 2 delta m - 2 delta p zP(m),  zP(m) = min(cap, (B-2m)/Lam, supply)
  long     L(t) = 1 - alpha + (alpha - delta) t
  Rshort(t) = max_{0<=r<=min(t,1)} min(I(r), P(t-r));  R* = min_t max(Rshort(t), L(t)), t in [1, 3/2].
second-condition modes (preprint: 2r + 8z <= 3):
  "none"   : not imposed
  "fixed"  : z <= (3-2r)/8 (preprint's, unchanged)
  "scaled" : z <= (3-2r)/(4 lam) (relaxed in step with lam; equals "fixed" at lam = 2)
Floating point; DIAGNOSTIC ONLY. Reproduces Collet's closed-form N/J at lam = 2 (lam_check.py).
"""
import numpy as np


def crossing_count(t, d, p, Ifun, Pfun, it=50):
    lo = np.zeros_like(d); hi = np.minimum(t, 1.0) * np.ones_like(d)
    for _ in range(it):
        mid = (lo + hi) / 2
        f = Ifun(mid, d, p) - Pfun(t - mid, d, p)
        lo = np.where(f > 0, mid, lo); hi = np.where(f > 0, hi, mid)
    r = (lo + hi) / 2
    return np.minimum(Ifun(r, d, p), Pfun(t - r, d, p)), r


def rstar(d, p, Ifun, Pfun, alpha=5/6, it=50):
    L = lambda t: 1 - alpha + (alpha - d) * t
    lo = np.ones_like(d); hi = 1.5 * np.ones_like(d)
    for _ in range(it):
        mid = (lo + hi) / 2
        rs, _ = crossing_count(mid, d, p, Ifun, Pfun)
        f = rs - L(mid)
        lo = np.where(f > 0, mid, lo); hi = np.where(f > 0, hi, mid)
    t = (lo + hi) / 2
    rs, r = crossing_count(t, d, p, Ifun, Pfun)
    return np.maximum(rs, L(t)), t, r


def make_I(lam, supply, second="none"):
    def I(r, d, p):
        z = np.minimum((1 - r) / lam, supply)
        if second == "fixed":
            z = np.minimum(z, (3 - 2 * r) / 8)
        elif second == "scaled":
            z = np.minimum(z, (3 - 2 * r) / (4 * lam))
        return 1 - d * r - 2 * d * p * np.clip(z, 0, None)
    return I


def make_P_source(B, Lam, cap, supply):
    def Pm(m, d, p):
        z = np.clip(np.minimum(np.minimum(cap, (B - 2 * m) / Lam), supply), 0, None)
        return 1 - 2 * d * m - 2 * d * p * z
    return Pm


def make_P_natural(kappa, supply):
    def Pm(m, d, p):
        z = np.clip(np.minimum((1 - 2 * m) / (6 * kappa), supply), 0, None)
        return 1 - 2 * d * m - 2 * d * p * z
    return Pm
