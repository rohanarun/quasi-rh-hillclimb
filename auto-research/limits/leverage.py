"""Leverage map of the tracker chain: how much each structural input moves θ.

Search/what-if only, not a certificate. Starts from tracker PR #68's five stages (θ ≈ 0.8748086741),
keeps its last four junctions, re-solves the first junction (rate crossing) and the window top,
and reports θ after changing one input. Uses depth3/model.py (exact port of the tracker's
optimization layer).

    python auto-research/limits/leverage.py            # all rows (a few minutes)
"""
import io
import contextlib
import os
import sys
from fractions import Fraction as Q

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "..", "depth3"))
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import model as M          # noqa: E402
import solve as S          # noqa: E402
from model import Chain, FIRST_CELL_TOP as FT   # noqa: E402

PR68_TAIL = [Q(676506091, 10**9), Q(693781289, 10**9), Q(142343339, 200000000), Q(730301837, 10**9)]
ORIG = dict(density=M.density, half_gain=M.half_gain, cap_unit=M.cap_unit,
            PLAIN_COST=M.PLAIN_COST, CHOSEN=M.CHOSEN)


def theta(lo=Q(3, 5)):
    """θ at PR #68's tail junctions with the first junction and window top re-solved.
    lo is the lower end of the first-junction bracket (Lean's verified range starts at 3/5)."""
    qs, s = [Q(638, 1000)] + PR68_TAIL, FT
    for _ in range(3):
        qs[0] = S.crossing(lambda q: S.rate(tuple([q] + qs[1:]), s), lo, Q(17, 25))
        s = M.decimal_up(S.top_at(tuple(qs), s), 8)
    return float(Chain(tuple(qs), s).theta(S.msqrt)), float(qs[0])


def run(name, patch, lo=Q(3, 5)):
    patch()
    try:
        v, q0 = theta(lo)
        note = "" if q0 >= 0.6 else "  (first junction below 3/5: outside the verified range)"
        print(f"{name:62s} θ = {v:.10f}  gain {BASE - v:+.2e}{note}", flush=True)
    except Exception as e:     # the crossing search can leave its bracket for large changes
        print(f"{name:62s} failed: {type(e).__name__}: {e}", flush=True)
    finally:
        for k, v in ORIG.items():
            setattr(M, k, v)


def rho_alpha(a):
    """Row-count exponent if the long estimate's slope 5/6 were a (balanced against the short one)."""
    return lambda q: (1 - q) if q >= a else max(1 - q, 1 - 2 * q * a / (3 * a - q))


if __name__ == "__main__":
    BASE, _ = theta()
    print(f"PR #68 five stages, re-solved: θ = {BASE:.10f}\n")
    e = Q(1, 100)
    print("-- inputs other than the row count (1% changes)")
    run("moment gain half_gain +1%", lambda: setattr(M, "half_gain", lambda d: ORIG["half_gain"](d) * (1 + e)))
    run("inverse/plain caps cap_unit +1%", lambda: setattr(M, "cap_unit", lambda d: ORIG["cap_unit"](d) * (1 + e)))
    run("plain capacity cost 3/4 -> 0.74", lambda: (setattr(M, "PLAIN_COST", Q(74, 100)),
                                                    setattr(M, "CHOSEN", (1 + 1 / (6 * Q(74, 100))) / 3)))
    print("\n-- the unmarked row-count exponent rho(δ) = 1 - 10δ/(3(5-2δ))")
    for p in (1, 2, 5, 10):
        c = Q(10, 3) * (1 + Q(p, 100))
        run(f"10/3 coefficient +{p}%", lambda c=c: setattr(M, "density", lambda q: 1 - c * q / (5 - 2 * q)))
    print("\n-- what-ifs for the long estimate's slope alpha = 5/6 (speculative; see large_values.md)")
    for a in (Q(82, 100), Q(8, 10), Q(78, 100), Q(3, 4), Q(72, 100), Q(7, 10)):
        run(f"alpha = {float(a):.2f}", lambda a=a: setattr(M, "density", rho_alpha(a)), lo=Q(1, 2))
    run("density-hypothesis analogue rho = 1 - δ (floor of this detector)",
        lambda: setattr(M, "density", lambda q: 1 - q), lo=Q(1, 2))
