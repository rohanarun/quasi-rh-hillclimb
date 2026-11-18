"""Exact guards for the detector ordinary anchor at the continuum contact."""

from fractions import Fraction as Q
from itertools import product


def require(label, condition):
    if not condition:
        raise ArithmeticError(label)


def scalar_guards():
    delta_lo, delta_hi = Q(".425"), Q(".4267")
    p_lo, p_hi = Q(".49995"), Q(".5")
    g0_lo, g0_hi = Q(".05805911"), Q(".05805913")
    g1_lo, g1_hi = Q(".07599618"), Q(".07599620")
    k_lo = 1 - p_hi * (1 + 2 * g1_hi)
    k_hi = 1 - p_lo * (1 + 2 * g1_lo)
    v_lo, v_hi = Q(5, 6) - delta_hi, Q(5, 6) - delta_lo
    denominator_lo = 3 * v_lo + 2 * delta_lo * k_lo
    denominator_hi = 3 * v_hi + 2 * delta_hi * k_hi
    numerator_lo = 1 - p_hi * (1 + 6 * g0_hi - 4 * g1_lo)
    numerator_hi = 1 - p_lo * (1 + 6 * g0_lo - 4 * g1_hi)
    require("positive interval divisions", min(numerator_lo, k_lo, denominator_lo) > 0)
    cutoff_lo = 1 + delta_lo * numerator_lo / denominator_hi
    cutoff_hi = 1 + delta_hi * numerator_hi / denominator_lo
    require("admitted detector cutoff", 1 < cutoff_lo - Q("4e-7") < cutoff_hi < Q("1.2499"))

    left, top = Q(3, 4), Q(311, 400)
    base = 1 + Q("6e-6")
    r_lo = 2 * (cutoff_lo / 3 - Q("1.41e-6"))
    r_hi = 2 * (cutoff_hi / 3 + Q("1.11e-6"))
    require("ordinary source corridor", left < r_lo / base < r_hi < top)
    require("lower anchor room", r_lo > Q(".7519"))
    require("long saving", v_lo * Q("4e-7") > Q("1.6265e-7"))
    require("short inverse saving", delta_lo * k_lo * Q("1e-6") > Q("1.80e-7"))
    require("upper ordinary saving", 2 * delta_lo * k_lo * Q("1e-6") > Q("1e-7"))
    require("one ODE excursion has fixed reserve", (1 - delta_hi) * Q("1e-7") / 2 > Q("2.86e-8"))
    reserve = (base - 1) * (Q(1, 2) + g0_lo) - Q("3e-6")
    require("rebased tangent slack", reserve > Q("3.48e-7"))
    mark_hi = Q(1, 2) + g0_hi - (Q(1, 2) + g1_lo) * r_lo + Q("3e-6")
    mark_lo = Q(1, 2) + g0_lo - (Q(1, 2) + g1_hi) * r_hi + Q("3e-6")
    require("available positive slots", 0 < mark_lo < mark_hi < Q(".13") < 2 * p_lo / 5)
    saving = (2 * delta_lo * p_lo * Q("3e-6") - Q("4e-7")
              - 2 * delta_hi * k_hi * Q("1.41e-6"))
    require("signed-band saving", saving > Q("3.646e-7") > Q("1e-7"))
    marginal = 2 * delta_hi * p_hi * (Q(1, 2) + g0_hi)
    require("sixth-power tangent check", marginal < Q(".24") < Q(5, 6))

    col_hi = r_hi + mark_hi
    require("residual projected volume", col_hi < Q(".878") and col_hi - Q(1, 20) < Q(5, 6))
    require("unshortened test removes exceptional rows", r_lo / 2 - Q(11, 60) > Q(".18"))
    require("shortened test removes exceptional rows", r_lo / 2 - Q(1, 20) - Q(11, 60) > Q(".14"))
    cap_gap = (Q(1, 2) + g1_lo) * Q("6e-6") - Q("3e-6")
    require("room from projected divisibility", cap_gap > Q("4e-7"))
    require("room at the lower endpoint", (r_lo - left) * (Q(1, 2) + g1_lo) > Q("3e-6"))
    lost = 2 * 3 * Q("3e-6") + 2 * Q("6e-6") + (base - 1)
    require("global dual norm exponent debit", lost == Q("36e-6"))
    print("OK exact endpoint, scale, profile, and rational projection guards")


def local_projection(degrees, target, index):
    """Coefficient of the orthant starting at index in a norm-divisibility projector."""
    weight = sum(f * v for f, v in zip(degrees, index))
    result = 0
    for offsets in product((0, 1), repeat=len(degrees)):
        if any(d > v for d, v in zip(offsets, index)):
            continue
        if weight - sum(f * d for f, d in zip(degrees, offsets)) >= target:
            result += (-1) ** sum(offsets)
    return result


def check_local_identities():
    # Illustrations of the finite differences; the note proves these for all labels and exponents.
    for degrees in ((1,), (2,), (1, 1), (1, 2, 1)):
        indices = tuple(product(range(5), repeat=len(degrees)))
        for target in range(1, 7):
            values = {idx: local_projection(degrees, target, idx) for idx in indices}
            for idx in indices:
                valuation = sum(f * v for f, v in zip(degrees, idx))
                if values[idx]:
                    require("finite difference band", target <= valuation < target + sum(degrees))
                recovered = sum(values[d] for d in product(*(range(v + 1) for v in idx)))
                require("norm-divisibility reconstruction", recovered == int(valuation >= target))
    for e, f in product(range(30), repeat=2):
        lost = 3 * (e // 2 + f // 2) + 2 * min(e, f)
        require("solitary rational prime", int(e + f == 1) >= e + f - lost)
    print("OK local norm-divisibility and solitary-prime identities")


if __name__ == "__main__":
    scalar_guards()
    check_local_identities()
