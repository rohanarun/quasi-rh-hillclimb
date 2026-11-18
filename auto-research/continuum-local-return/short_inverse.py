"""Exact exponents for rational-squarefree short inverse columns and their row kernels."""

from fractions import Fraction as Q


def check(name, condition):
    if not condition:
        raise ValueError(name)
    print(name, "OK")


def verify():
    eta = Q("1e-7")
    density = Q(".425")
    z_min, z_max = Q(".09755"), Q(".0987")
    shift = Q("1e-5")
    price = Q("1.00029")
    a_min = (1 + density) / 2
    spike_debit = 9 * Q("1.5") * eta
    check("rational Euler tail beyond the ninth-power spike debit",
          shift * (a_min - Q(".51")) - spike_debit >= Q(".000000675"))
    headroom = 1 + density * (9 * z_min - Q(".877245")) - price
    check("squarefree moment counts the buffered rows",
          headroom - 2 * spike_debit - eta >= Q(".000006825"))
    low_column = 9 * z_min - shift
    high_column = 9 * z_max
    gcd_cut = Q(".3875")
    shortened = high_column - gcd_cut
    check("minimum squarefree column and equality of local order six",
          2 * low_column - 2 * gcd_cut > Q(".9808"))
    for root in (Q(0), Q(1, 6)):
        row = 1 - 6 * root
        norm = max(row, shortened, 5 * row / 6 + shortened / 3,
                   row / 3 + 5 * shortened / 6)
        check(f"rational divisor projection at sixth-power root exponent {root}",
              root + norm < Q("1.00027"))
    check("natural price for the larger divisors of unrestricted columns",
          high_column - Q(".3884") < Q(1, 2))
    check("rational square-divisor projection", 2 * Q(".1942") == Q(".3884"))
    individual = Q(1, 2) + 3 * z_max
    check("short first modulus fits the individual pair bound", 6 * z_max < individual)
    check("sparse nonprincipal pair budget",
          individual + Q(".2041") == Q("1.00020") < price)
    check("sparse pairs below the natural exponent",
          individual + Q(".2038") == Q(".9999"))
    h_top = 2 * high_column - 1
    sixth_free = Q(".33448")
    singleton = Q(".0129")
    check("sixth-power-free frequency cost", (3 * sixth_free - 1) / 12 < Q(".000287"))
    check("balanced groups at the top powerful frequency",
          (1 - h_top) / 2 - z_max - singleton >= Q(".0001"))
    check("second powerful frequency inequality",
          (1 - h_top) / 2 - 2 * singleton >= Q(".0859"))
    low_frequency = Q(5, 23)
    reduced = low_column - gcd_cut
    check("residual length lower bound for complete frequency ranges",
          reduced > Q(".4904") > max(3 * z_max, 2 * low_frequency))
    check("large sixth-power divisor is counted",
          Q(".0029") > (5 * low_frequency - 1) / 30)
    check("seven residual labels or a short group",
          Q(".6") - 2 * Q(".0029") > 6 * z_max and
          Q(".4904") / 7 > 2 * Q(".0029"))
    check("primitive conductor balance at the frequency endpoint",
          2 * low_frequency == 5 * (1 + low_frequency) / 14)
    check("complete group estimate on the low-frequency branch",
          2 * z_max + 2 * Q(".2") <= Q(".6"))
    check("complete group estimate beyond the sixth-power cutoff",
          2 * z_max + 2 * low_frequency - 9 * Q(".0027") < (1 + low_frequency) / 2)
    check("twelfth moment at physical length and eighteenth-moment endpoint",
          20 * z_max < 2 and 29 * Q(2, 29) == 2)
    check("squarefree projection using the complete product estimate",
          high_column - Q(".2797") < Q(14, 23) and
          2 * low_column - 2 * Q(".2797") > Q("1.1964"))
    for length, excess in ((high_column, Q(".03970")), (Q(".6843"), Q(".000288"))):
        # The AM-GM upper exponent is (sqrt(15*length) - sqrt(10))**2 / 6.
        lhs = 15 * length + 10 - 6 * excess
        check(f"optimized density price at length {length}", lhs > 0 and lhs * lhs < 600 * length)
    check("unmarked cutoff and sixth-power-free core ranges",
          Q(10, 7) <= Q(3, 2) and -5 + 6 * Q(5, 7) < 0)
    check("global reciprocal handles small conductor cores",
          Q(1, 6) + Q(1, 120) + Q(3, 4) * high_column < 1)
    general_mean = 1 + max(Q(0), (3 * high_column - 2) / 6, (5 * high_column - 3) / 18)
    check("full upper bound for arbitrary short-label coefficients",
          general_mean == Q(66649, 60000) < Q("1.110817"))
    genuine_gcd = Q(".2040")
    genuine_residual = low_column - genuine_gcd
    h_all = Q(".24069")
    check("individual inverse projections at the stronger gcd threshold",
          high_column - genuine_gcd == Q(".6843") and
          2 * genuine_residual > Q("1.3478"))
    check("all dual frequencies of the uncolored column at the stronger cutoff",
          h_all / 3 < genuine_residual / 7 and
          6 * z_max + h_all / 6 < genuine_residual and
          2 * h_all < 5 * genuine_residual / 7)
    check("sixth-power-free dual frequencies at the stronger cutoff",
          (2 * Q(".33783") - genuine_residual) / 6 < Q(".000287"))
    for e in range(1, 12):
        for i in range(13):
            for j in range(13):
                lead = sum(a <= i and e - a <= j for a in range(e + 1))
                second = sum(a <= i and e + 1 - a <= j for a in range(1, e + 1))
                if lead - second != int(i + j >= e):
                    raise ValueError((e, i, j))
    print("split-prime projection on small valuation rectangles OK")


if __name__ == "__main__":
    verify()
