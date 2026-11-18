"""Exact physical joint-moment prices and selected-Poisson comparisons."""
from fractions import Fraction as F


def positive(name, margin):
    if margin <= 0:
        raise ValueError(f"{name}: margin {margin}")
    print(f"{name}: OK")


def main():
    # Input enclosures proved in marked_window.py and four_factors.py.
    eta = F("1e-7")
    delta_lo, delta_hi = F(".425"), F(".4267")
    p_lo, p_hi = F(".49995"), F(".5")
    g0_lo, g0_hi = F(".05805911"), F(".05805913")
    g1_lo, g1_hi = F(".07599618"), F(".07599620")
    m_lo, m_hi = F("1.12796") / 3, F("1.12903") / 3
    radius = F(".00001")
    n_above = F(".8e-6")
    n_lo = F(".42505871") - F("1e-6")
    n_hi = F(".42506577") + n_above
    y_lo, y_hi = m_lo - 4 * radius, m_hi + radius
    k_hi = 1 - p_lo * (1 + 2 * g1_lo)
    source_cost = F("1e-9")
    extra, charge = F(".00003"), F(".000003")

    wp_lo = (1 - source_cost - 2 * n_hi) / (2 + 10 * source_cost)
    wp_hi = (1 - 2 * n_lo) / 2
    ws_lo = (1 - 2 * y_hi) / 2 + g0_lo - 2 * g1_hi * y_hi
    ws_hi = (1 - 2 * y_lo) / 2 + g0_hi - 2 * g1_lo * y_lo
    positive("numerator width is positive", wp_lo)
    positive("numerator affine below the original cap", F(3, 40) - wp_hi)
    positive("denominator doubled width above anchor left", 2 * y_lo - F(1467, 2000))
    positive("denominator doubled width below anchor right", F(311, 400) - 2 * y_hi)
    positive("ordering of the two marked widths", ws_lo - wp_hi)
    positive("total original prime supply", F(1, 5) - ws_hi - extra)
    positive("positive detector slope", 1 - p_hi * (1 + 2 * g1_hi))

    positive("half anchor lift exceeds .00042",
             (g0_lo - 2 * g1_hi * y_hi) / 2 - F(".00042"))
    positive("half anchor lift is below .00047",
             F(".00047") - (g0_hi - 2 * g1_lo * y_lo) / 2)
    drift = 8 * k_hi * radius + 2 * p_hi * n_above
    direct_charge = F("8e-6")
    direct_margin = (2 * direct_charge - delta_hi * drift - 9 * eta) / 4
    positive("direct unmarked joint price leaves 7.07e-8", direct_margin - F("7.07e-8"))

    signed_gain = 4 * p_lo * extra - drift
    positive("weighted prime-width gain", signed_gain)
    signed_margin = (delta_lo * signed_gain - 2 * charge - 9 * eta) / 4
    positive("one-sided joint price leaves 9.59e-7", signed_margin - F("9.59e-7"))
    positive("extra order-six conductor interval is nonempty", 2 * (extra - charge))

    # The native/dual obstructions refer only to the unchanged inequalities.
    total_lo = n_lo + y_lo
    positive("total ordinary length exceeds 7/9 by .02322", total_lo - F(7, 9) - F(".02322"))
    positive("unshortened factors below the half-length", (1 + 3 * y_lo - 5 * n_hi) / 4 - F(".00055"))
    positive("large-value ledger excess", (9 * total_lo - 7) / 24 - F(".00870"))


if __name__ == "__main__":
    main()
