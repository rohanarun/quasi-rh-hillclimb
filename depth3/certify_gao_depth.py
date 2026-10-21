"""Exact arithmetic certificate for an n-stage chain in the framework of tracker PR #68
(Gaozhongpai, gao-five-step-affine-20261020), which proves the five-stage case in Lean.

PR #68's stages are exactly the chain of model.py: at PR #68's junctions this port gives the
class bound 0.87480867409 <= 0.8748087 and PR #68's region prices/intercepts/slopes. PR #68 does
NOT need the branch-D 'room' check of certify_depth3.py (at its point that room is -0.009), so it
is reported here as an indicator only. Instead this script adds the per-stage side conditions
that PR #68's Lean imposes on every stage (`RegionalStage` and `FixedStages.stageN_*_bound`):
    1/50 <= q, 0 < price <= 1, q <= price, q*intercept < price, 1 <= lam <= 6 price,
    lam <= 6 slotPrice, lowReserveAt <= 1/50, amplifierRatio <= 7, lam <= 5,
where stage j's lam is the first-step plane slope for j = 0 and 6 k_{j-1} for j >= 1.

    python certify_gao_depth.py --pr68      # PR #68's own five stages (port check)
    python certify_gao_depth.py --six | --six-k8 --kcap 8 | --eight-k12 --kcap 12
    python certify_gao_depth.py --five-beta | --six-beta   # slot priced with PR #68's own beta
"""
import os
import sys
from fractions import Fraction as Q

# --five-beta / --six-beta re-price the slot with PR #68's own proved Hecke bound
# beta <= 8748087/10^7 (ChosenAffine.lean, beta_le_theta_of_chosen_affine) instead of
# Levy's 10499/12000. model.py reads QRH_BETA at import, so set it before importing.
BETA_PR68 = "8748087/10000000"
if any(a in sys.argv for a in ("--five-beta", "--six-beta")):
    os.environ["QRH_BETA"] = BETA_PR68

import certify_depth3 as C
from model import Chain, KAPPA, amp_ratio

KCAP = 7          # PR #68 proves amplifierRatio <= 7 for its stages; --kcap N re-brackets it
for i, a in enumerate(sys.argv):
    if a == "--kcap":
        KCAP = Q(sys.argv[i + 1])

PTS = {
    "--six": ((Q(638023, 10**6), Q(666243, 10**6), Q(2729, 4000), Q(698599, 10**6), Q(715299, 10**6), Q(45773, 62500)),
              Q(4039727, 100000000), Q(874807999, 10**9)),
    "--six-k8": ((Q(638023, 10**6), Q(67369, 100000), Q(27519, 40000), Q(702717, 10**6), Q(71793, 100000),
                  Q(73363, 100000)), Q(4041339, 100000000), Q(874807729, 10**9)),
    "--eight-k12": ((Q(25521, 40000), Q(669447, 10**6), Q(679457, 10**6), Q(689971, 10**6), Q(701021, 10**6),
                     Q(356297, 500000), Q(4529, 6250), Q(737081, 10**6)), Q(2022929, 50000000), Q(874806549, 10**9)),
    "--five-beta": ((Q(319011, 500000), Q(135293, 200000), Q(173433, 250000), Q(355831, 500000), Q(365141, 500000)),
                    Q(4038199, 10**8), Q(874808544, 10**9)),
    "--six-beta": ((Q(638023, 10**6), Q(666019, 10**6), Q(682021, 10**6), Q(139673, 200000), Q(715059, 10**6),
                    Q(732119, 10**6)), Q(505021, 12500000), Q(874807887, 10**9)),
    "--pr68": ((Q(127604383, 200000000), Q(676506091, 10**9), Q(693781289, 10**9), Q(142343339, 200000000),
                Q(730301837, 10**9)), None, Q(8748087, 10**7)),
}


def stage_checks(c):
    print("\n-- PR #68 per-stage side conditions (RegionalStage fields, ratio <= 7, slope <= 5)")
    for j in range(c.n):
        T, q = c.T[j], c.q[j]
        lam = c.lam if j == 0 else 6 * c.T[j - 1].price
        K = amp_ratio(T, q)
        ok = (Q(1, 50) <= q and 0 < T.price <= 1 and q <= T.price and q * T.intercept < T.price
              and 1 <= lam <= 6 * T.price and lam <= 6 * KAPPA and lam <= 5 and K <= KCAP)
        C.check(f"stage {j}: RegionalStage fields, amplifierRatio <= {KCAP}, lam <= 5", ok,
                f"K = {float(K):.4f}, lam = {float(lam):.4f}")


def run(q, s, th, label):
    if s is None:
        from solve import top_at, decimal_up
        from model import FIRST_CELL_TOP
        s = FIRST_CELL_TOP
        for _ in range(4):
            s = decimal_up(top_at(q, s), 8)
    c, thI, out = C.certify(q, s, th, label)
    stage_checks(c)
    n0 = len(C.RESULTS)
    C.width_floor_room(c)            # indicator only in this framework
    room_ok = C.RESULTS[-1][1]
    del C.RESULTS[n0:]
    print(f"   (branch-D room is not a PR #68 condition; reported only: {'ok' if room_ok else 'below 1.5e-3'})")
    C.indicators(c)
    bad = [n for n, ok, _ in C.RESULTS if not ok]
    print(f"\n{len(C.RESULTS) - len(bad)}/{len(C.RESULTS)} checks OK" + ("" if not bad else f"; FAILED: {bad}"))
    return not bad


if __name__ == "__main__":
    key = next((k for k in PTS if k in sys.argv), "--pr68")
    q, s, th = PTS[key]
    sys.exit(0 if run(q, s, th, key.strip('-')) else 1)
