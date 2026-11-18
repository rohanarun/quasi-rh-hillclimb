"""Exact comparisons and finite identity checks for the physical column reductions."""

from fractions import Fraction as F
from itertools import product
from math import comb, gcd, isqrt, lcm


def require(label, statement):
    if not statement:
        raise ArithmeticError(label)


def divisors(n):
    return [d for d in range(1, n + 1) if n % d == 0]


def mobius(n):
    sign = 1
    factor = 2
    while factor * factor <= n:
        if n % factor == 0:
            n //= factor
            if n % factor == 0:
                return 0
            sign = -sign
        factor += 1
    return -sign if n > 1 else sign


def local_coefficient(e, exponents):
    nonzero = sum(j > 0 for j in exponents)
    offset = sum(exponents) - e
    if not 0 <= offset < nonzero:
        return 0
    return (-1) ** offset * comb(nonzero - 1, offset)


def divisor_identities():
    for slots in range(1, 5):
        for valuations in product(range(4), repeat=slots):
            for e in range(1, 8):
                total = sum(local_coefficient(e, indices) for indices in
                            product(*(range(v + 1) for v in valuations)))
                require("local mixed difference", total == (sum(valuations) >= e))
    for threshold in range(2, 10):
        weights = {n: sum(mobius(n // j) for j in divisors(n) if j >= threshold)
                   for n in range(1, 128)}
        for c in range(1, 128):
            square_roots = [d for d in range(1, isqrt(c) + 1) if c % (d * d) == 0]
            require("square part indicator",
                    sum(weights[d] for d in square_roots) == (max(square_roots) >= threshold))
            for g in range(1, 17):
                require("intersection with a common divisor",
                        [d for d in square_roots if c % g == 0] ==
                        [d for d in range(1, isqrt(c) + 1) if c % lcm(d * d, g) == 0])
                require("gcd indicator",
                        sum(weights[d] for d in divisors(gcd(c, g))) == (gcd(c, g) >= threshold))
    for i, j in product(range(24), repeat=2):
        order_six = (i - j) % 6 in {1, 5}
        conductor = (i - j) % 6 != 0
        require("order-six mass", i + j - order_six <= 3 * (i // 2 + j // 2) + 2 * min(i, j))
        require("other local orders", conductor - order_six <= i // 2 + j // 2)
        require("primitive-conductor mass",
                i + j - conductor <= 2 * (i // 2 + j // 2 + min(i % 2, j % 2)))
        require("puncture size", 2 * (i + j > 0 and not conductor) <= i + j - conductor)
    print("OK local allocations, square parts, common divisors and conductor valuations")


def exponent_checks():
    a, cost = F("1e-6"), F("1e-7")
    gamma, kappa = F("1.01e-6"), F("2.02e-6")
    s_max, mesh = F("1e-9"), F("1e-9")
    lam_max = 2 + 10 * s_max
    require("divisible-column reserve", kappa == 2 * gamma and kappa > lam_max * a)
    require("positive-slot supply", 2 * F(".49995") * F(".2") > F(".076"))

    # For each s, 2n+(1-s-2n)/(2+10s) increases with n.
    n_low = F(".42505871") - a
    n_high = F(".42506577") + F(".8e-6")
    length_low = 2 * n_low + (1 - s_max - 2 * n_low) / lam_max + a - mesh
    length_high = 2 * n_high + (1 - 2 * n_high) / 2 + a
    require("full column lengths",
            F(".92505870") < length_low < length_high < F(".92506758"))
    require("rounded order-six conductor",
            2 * length_low - 6 * gamma - 2 * kappa > F("1.8501072"))
    require("rounded conductor upper bound", 2 * length_high < F("1.8501352"))
    require("dyadic loss", 6 * gamma + 2 * kappa == F("1.01e-5"))
    require("physical transfer",
            F(".425") * F(".49995") * a / 2 - cost / 4 - 3 * cost / 4 == F("6.239375e-9"))
    print("OK source length reserve, two column lengths, conductor interval and physical fee")

    dual_top = F(".850146")
    low_frequency = F(".3082")
    low_radical = F(".199")
    hecke_radical = F(".46252")
    frozen_width = 4 * gamma + 2 * kappa
    require("reflected frequency cutoff",
            2 * n_high + 2 * a + F("1e-5") < F(".8501452") < dual_top)
    require("cubic group lengths",
            n_high + F(".076") < F(".502") < 2 * length_low / 3)
    cubic_cost = 1 - length_low / 3 + 2 * gamma + kappa
    require("fixed dual frequencies",
            cubic_cost + F(".30") < F(".992") and cubic_cost + low_frequency < 1)
    require("sixth-power-free cores", dual_top / 6 + 5 * low_radical / 6 < low_frequency)
    require("primitive conductor sieve", length_low - frozen_width > 2 * hecke_radical)
    require("powerful sixth-power-free frequency", dual_top / 2 < hecke_radical)
    require("unshortened sextic sieve expense", 1 + (3 * length_low - 2) / 6 > F("1.1286"))
    print("OK dual cutoff, cubic group lengths, small frequencies and primitive conductors")

    s = F(1537, 1625)
    d = (F(463, 250) + s) / 2
    maxima = (F(1, 2) + s / 2, d / 2 + s / 4,
              F(1, 3) + d / 6 + 11 * s / 24,
              F(1, 12) + 5 * d / 12 + s / 3)
    require("all-element conductor sector", maxima ==
            (F(1581, 1625), F(12167, 13000), 1, F(1963, 2000)))
    print("OK all-element sector through 1537/1625")


if __name__ == "__main__":
    divisor_identities()
    exponent_checks()
