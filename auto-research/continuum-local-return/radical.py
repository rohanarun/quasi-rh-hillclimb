"""Price the small-radical rows in the long inverse band in proposal #43."""

from fractions import Fraction as Q


def main():
    delta_lo, delta_hi = Q(".425"), Q(".4267")
    p_lo, p_hi = Q(".49995"), Q(1, 2)
    g0_hi, g1_lo = Q(".05805913"), Q(".07599618")
    v_hi = Q(5, 6) - delta_lo
    k_hi = 1 - p_lo * (1 + 2 * g1_lo)
    numerator_lo = 1 - p_hi * (1 + 6 * g0_hi - 4 * g1_lo)
    denominator_hi = 3 * v_hi + 2 * delta_hi * k_hi
    if not (numerator_lo > 0 and denominator_hi > 0):
        raise ValueError("sign of cutoff bound")
    length_lo = 1 + delta_lo * numerator_lo / denominator_hi - Q(1, 10**6)
    price_lo = Q(1, 6) + (Q(5, 6) - delta_hi) * length_lo - Q(6, 10**7)
    reserve = price_lo - Q(5, 8)
    if reserve <= Q(1, 3000):
        raise ValueError("insufficient room for the small-radical count")
    print(f"Exponent after the proposed saving is at least {price_lo}.")
    print(f"Reserve over 5/8 is at least {reserve}, greater than 1/3000.")


if __name__ == "__main__":
    main()
