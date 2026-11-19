"""Reproduce PR #67's junctions and window top, then solve the three-level chain the
same way. Search only: the certificate is certify.py."""
import sys
from fractions import Fraction as Q
import mpmath as mp
from model import (Chain, FIRST_CELL_TOP, decimal_up, h_star, balanced_top, theta_min)

mp.mp.dps = 50


def msqrt(x):
    x = Q(x)
    v = mp.sqrt(mp.mpf(x.numerator) / x.denominator)
    return Q(mp.nstr(v, 45, min_fixed=-mp.inf, max_fixed=mp.inf))


def snap(x, digits):
    return Q(round(Q(x) * 10**digits), 10**digits)


def crossing(f, a, b, digits=6):
    """Lean crossingSearch: point where f turns nonnegative, rounded UP to `digits`."""
    fa, fb = f(a), f(b)
    if not (fa < 0 <= fb):
        raise ValueError(f"crossing requires fa < 0 <= fb, got {(float(fa), float(fb))}")
    lo, hi = Q(a), Q(b)
    for _ in range(60):
        mid = snap((lo + hi) / 2, digits + 6)
        if mid in (lo, hi):
            break
        if f(mid) < 0:
            lo = mid
        else:
            hi = mid
    return decimal_up(hi, digits)


def argmin(f, a, b, digits=6):
    """Golden-section search, rounded to `digits` (Lean goldenSearch)."""
    g = (mp.sqrt(5) - 1) / 2
    lo, hi = Q(a), Q(b)
    gq = Q(mp.nstr(g, 30))
    x1 = snap(hi - gq * (hi - lo), digits + 6)
    x2 = snap(lo + gq * (hi - lo), digits + 6)
    f1, f2 = f(x1), f(x2)
    while hi - lo > Q(1, 10**(digits + 3)):
        if f1 < f2:
            hi, x2, f2 = x2, x1, f1
            x1 = snap(hi - gq * (hi - lo), digits + 6)
            f1 = f(x1)
        else:
            lo, x1, f1 = x1, x2, f2
            x2 = snap(lo + gq * (hi - lo), digits + 6)
            f2 = f(x2)
    return snap((lo + hi) / 2, digits)


def bound(q, s):
    return Chain(q, s).theta(msqrt)


def rate(q, s):
    c = Chain(q, s)
    return c.ledger.rate_margin(c.q[0], s)


def top_at(q, s):
    c = Chain(q, s)
    th = c.theta(msqrt)
    h = h_star(c.lam, c.B, msqrt)
    return balanced_top(c.lam, c.B, th, h, msqrt)


def solve_two():
    ft = FIRST_CELL_TOP
    q0 = crossing(lambda q: rate((q, Q(7, 10)), ft), Q(3, 5), Q(17, 25))
    q1 = argmin(lambda x: bound((q0, x), ft), Q(17, 25), Q(18, 25))
    q0 = crossing(lambda q: rate((q, q1), ft), Q(3, 5), Q(17, 25))
    q1 = argmin(lambda x: bound((q0, x), ft), Q(17, 25), Q(18, 25))
    s = decimal_up(top_at((q0, q1), ft), 8)
    q1 = argmin(lambda x: bound((q0, x), s), Q(17, 25), Q(18, 25))
    q0 = crossing(lambda q: rate((q, q1), s), Q(3, 5), Q(17, 25))
    return (q0, q1), s


def solve_three(rounds=3):
    """Same alternation, with (q1, q2) minimized coordinatewise."""
    ft = FIRST_CELL_TOP
    q1, q2 = Q(69, 100), Q(72, 100)
    q0 = crossing(lambda q: rate((q, q1, q2), ft), Q(3, 5), Q(17, 25))
    s = ft
    for it in range(rounds):
        for _ in range(3):
            q1 = argmin(lambda x: bound((q0, x, q2), s), Q(66, 100), Q(q2) - Q(1, 1000))
            q2 = argmin(lambda x: bound((q0, q1, x), s), Q(q1) + Q(1, 1000), Q(74, 100))
        q0 = crossing(lambda q: rate((q, q1, q2), s), Q(3, 5), Q(17, 25))
        s = decimal_up(top_at((q0, q1, q2), ft if it == 0 else s), 8)
        print("  round", it, [float(x) for x in (q0, q1, q2)], float(s), float(bound((q0, q1, q2), s)), flush=True)
    for _ in range(3):
        q1 = argmin(lambda x: bound((q0, x, q2), s), Q(66, 100), Q(q2) - Q(1, 1000))
        q2 = argmin(lambda x: bound((q0, q1, x), s), Q(q1) + Q(1, 1000), Q(74, 100))
    q0 = crossing(lambda q: rate((q, q1, q2), s), Q(3, 5), Q(17, 25))
    return (q0, q1, q2), s


if __name__ == "__main__":
    which = sys.argv[1] if len(sys.argv) > 1 else "two"
    if which == "two":
        q, s = solve_two()
    else:
        q, s = solve_three()
    print("junctions", [str(x) for x in q], "s", s)
    c = Chain(q, s)
    print("theta", mp.nstr(mp.mpf(c.theta(msqrt).numerator) / c.theta(msqrt).denominator, 15))
    for depth in range(2, c.n + 1):
        qd = c.q[depth - 1]
        vals = [float(c.high_at(depth, qd, b)) for b in (FIRST_CELL_TOP, s)]
        print(f"high depth {depth}:", vals)
