"""Exact rational bounds for the local shifted long-inverse proposal at tracker #143."""

from fractions import Fraction as F


def lower(label, value, bound=F(0)):
    if value <= bound:
        raise ValueError(f"{label}: {value} <= {bound}")
    print(f"{label}: > {bound}")


def verify():
    # AlgebraicContact.theta_isolated, ContactBalance.density_range, CutoffBounds
    t = F(".87334585")
    gap = F(7, 10**9)
    theta_lo = F(109168232013339822100148, 125000000000000000000000)
    theta_hi = F(174669171221343715360237, 200000000000000000000000)
    lower("strict endpoint improvement", theta_lo - t)
    lower("loss bounded by 7e-9", t + gap - theta_hi)
    h_lo = F(1019, 1250)
    d0, d1, p0, half = map(F, (".425", ".4267", ".49995", ".5"))
    eta = F(1, 10**7)
    step = F(1, 10**6)
    gain = F(6, 10**7)
    # J <= 5/2 and target debit/J <= (3 + 8*d*p) * gap on W.
    debit = (3 + 8 * F(15, 32) * half) * gap
    lower("corrected top margin divided by J", F(3, 4) * h_lo * eta - debit,
          F(1, 10**8))
    distance = min(F(".4258") - d0, d1 - F(".4259"))
    exterior = min(distance**2 / 5, (half - p0) * F(189, 512) / 100)
    lower("uncorrected exterior margin divided by J", exterior / F(5, 2) - debit,
          F(1, 10**8))
    # At the critical point the old normalized margin is
    # (3+4*density)*(t-theta). Its negation has this positive lower bound.
    lower("uncorrected contact deficit", (3 + 4 * F(".4258")) * (theta_lo - t),
          F(1, 10**8))

    # ExactWindowGuards.lo0/hi0/lo1/hi1 enclose the tangent coefficients.
    g0_lo, g0_hi = F(".05805911"), F(".05805913")
    g1_lo, g1_hi = F(".07599618"), F(".07599620")
    k_lo = 1 - half * (1 + 2 * g1_hi)
    k_hi = 1 - p0 * (1 + 2 * g1_lo)
    v_lo, v_hi = F(5, 6) - d1, F(5, 6) - d0
    u_lo = 1 - half * (1 + 6 * g0_hi - 4 * g1_lo)
    u_hi = 1 - p0 * (1 + 6 * g0_lo - 4 * g1_hi)
    lower("positive tangent factor", 1 + 6 * g0_lo - 4 * g1_hi)
    lower("positive U", u_lo)
    lower("positive k", k_lo)
    j_lo = 3 * v_lo + 2 * d0 * k_lo
    j_hi = 3 * v_hi + 2 * d1 * k_hi
    lower("positive J", j_lo)
    t0_lo, t0_hi = 1 + d0 * u_lo / j_hi, 1 + d1 * u_hi / j_lo
    b_lo, b_hi = 2 * t0_lo / 3, 2 * t0_hi / 3
    lower("lower edge of long band above one", t0_lo - step - 1)
    lower("detector upper cutoff", F(12499, 10000) - t0_hi - step)
    left, top = F(1467, 2000), F(311, 400)
    lower("shifted anchor lower buffer", b_lo + 2 * step / 3 - left - step)
    lower("shifted anchor upper buffer", top - b_hi - 2 * step / 3)
    lower("short crossing saving in excess of eta", d0 * k_lo * 2 * step / 3 - eta)
    lower("old long bound below band in excess of eta", v_lo * step - eta)
    lower("improved long bound in excess of eta", gain - v_hi * (step + eta) - eta)

    # Both unshifted crossings have R = 1-d*(a+k*b). Upper bound a+k*b.
    affine_hi = half * (1 + 2 * g0_hi) + k_hi * b_hi
    face_b, lam = 1 - F(1, 10**12), 2 + F(1, 10**11)
    cap, s_minus = F(3, 20) - F(1, 10**7), F(27, 1000)
    natural_m = (1 - F(9, 2) * s_minus) / 2
    savings = {
        "native top": top + (1 - top) * p0,
        "plain uncapped top": top + 2 * (face_b - top) * p0 / lam,
        "plain capped top": top + 2 * cap * p0,
        "natural tail": 2 * natural_m + 2 * s_minus * p0,
        "unmarked baseline": F(1),
    }
    for label, saving in savings.items():
        lower(label + " excess over eta", d0 * (saving - affine_hi) - eta, F(1, 1000))


if __name__ == "__main__":
    verify()
