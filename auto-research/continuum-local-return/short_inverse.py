"""Exact exponents for rational-squarefree short inverse columns and their row kernels."""

from fractions import Fraction as Q


def check(name, condition):
    if not condition:
        raise ValueError(name)
    print(name, "OK")


def check_joint_density(width, opposite, target):
    center = Q(".24")
    norm_bin = (75 + 20 * center) / (130 - 32 * center)
    norm_derivative = Q(5000) / (130 - 32 * center)**2
    value = center * (width - opposite) - 10 * center / (15 - 6 * center)
    value -= (1 - norm_bin) * opposite / 2
    slope = width - opposite - Q(150) / (15 - 6 * center)**2
    slope += opposite * norm_derivative / 2
    curvature = -Q(1800, 15**3) + opposite * Q(320000, 2 * 106**3)
    check(f"two zero bins at opposite width {opposite}",
          curvature < -Q(1, 2) and value + slope**2 < target)


def check_rational_moment(width, order, opposite, target, correction_slope=Q(1)):
    count_weight = 1 - Q(1, 2 * order)
    residual = width - opposite
    correction = max(0, correction_slope * opposite - Q(1, 2 * order))
    allowance = target + opposite / 2 - correction
    # Square the positive sides of the inequality for count_weight * J.
    left = 15 * residual + 10 * count_weight - 6 * allowance
    check(f"rational norm moment of order {2 * order} at opposite width {opposite}",
          residual > 2 * count_weight / 3 and allowance > 0 and
          left > 0 and left**2 < 600 * count_weight * residual)


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
    physical_capacity = (Q(".49995") * (1 + 2 * Q(".05805911")) +
                         (1 - Q(".5") * (1 + 2 * Q(".07599620"))) * 2 * Q("1.12796") / 3)
    check("unmarked density moment-order obstruction on the physical rectangle",
          physical_capacity == Q(".876842854921") and
          Q(".425") * (physical_capacity - 10 / (15 - 6 * Q(".4267"))) > Q(".031"))
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
    # After the second Poisson transform the excess is
    # (sqrt(15*s) - sqrt(10*H))_+^2 / 6, where H is the new row exponent.
    dilation = Q("1.466")
    radicand_bound = 15 + 10 * dilation - 6 * Q(".000289") / high_column
    check("dilated density price below the requested margin",
          0 < radicand_bound and radicand_bound**2 < 600 * dilation)
    for name, ratio, total_cut, coprime_cut in (
        ("natural", Q(3, 2), Q(".3369"), Q(".4389")),
        ("target", dilation, Q(".3478"), Q(".4688")),
    ):
        for scope, width, cutoff in (
            ("all residual pairs", genuine_residual, total_cut),
            ("coprime column norms", low_column, coprime_cut),
        ):
            check(f"{name} second Poisson cutoff for {scope}",
                  min(2 * width - 1, (2 - ratio) * width) > cutoff)
    check("unmarked density on a full ball pays the sixth-power sum",
          6 * (1 - Q(5, 7)) > 1)
    for opposite, allowed_excess in ((Q(".1000"), Q(".00029")), (Q(".101"), Q(0))):
        residual = high_column - opposite
        allowance = allowed_excess + opposite / 8
        # Equivalent to (sqrt(15*residual) - sqrt(10))**2 < 6*allowance.
        left = 15 * residual + 10 - 6 * allowance
        check(f"opposite common primes at width {opposite}",
              residual > Q(2, 3) and left > 0 and left**2 < 600 * residual)
    check("exceptional rational norm and global ordinary saving",
          Q(1, 6) + 3 * high_column / 4 < 1 - high_column / 8)
    check_joint_density(high_column, Q(".08679"), Q(".000286646"))
    check_joint_density(high_column, Q(".08749"), -Q(".000002951"))
    for order, opposite, target in (
        (7, ".06929", ".00029"), (7, ".06964", "0"), (7, ".075", "0"),
        (6, ".075", "0"), (6, ".08749", "0"), (6, ".101", "0"),
    ):
        check_rational_moment(high_column, order, Q(opposite), Q(target))
    # The cubic large sieve after rational Poisson gives B*K^(-t)+K^(2t/3).
    # Its correction in the Holder bound has slope 5/6.
    for opposite, target in ((".06454", ".00029"), (".06490", "0"), (".08749", "0")):
        check_rational_moment(high_column, 9, Q(opposite), Q(target), correction_slope=Q(5, 6))
    check("small rational norm cores and sixth-power sum",
          Q(4, 7) > Q(1, 6) and
          Q(1, 6) + Q(5, 12) * Q(".01") + 3 * high_column / 4 < 1)
    y_high = Q("1.12903") / 3 + Q(".00001")
    z_high = Q(".09862")
    y_low = Q("1.12796") / 3 - 4 * Q(".00001")
    check("the genuine ordinary and short inverse at physical lengths",
          y_high + 5 * z_high < 1 and y_high + 4 * z_high < Q(5, 6) and
          2 * (y_low + 5 * Q(".0974")) > 1)
    natural = Q(277, 372)
    left_r = 1 - natural / 2
    cross_r = Q(239, 372)
    check("two marked moments cover the entire natural range",
          left_r == Q(467, 744) and left_r < cross_r < natural and
          (2 + 5 * cross_r) / 7 == natural == Q(41, 24) - 3 * cross_r / 2 and
          2 * (1 - natural) > Q(1, 6) and natural < Q(5, 6))
    # The total width is at most w - 2*tau and the longer half has
    # width at most (w - 2*tau + b)/2, where b < tau.
    check("uniform slack when splitting the subpower prime mark",
          2 + Q(5, 2) * (2 - 1) == Q(9, 2) and
          all(r + Q(7, 2) * (2 * (1-r) / 7) == 1 for r in (left_r, natural)))
    prime_cap = Q(".085")
    rounding_cases = (
        ("one", natural + 2 * prime_cap, 2 * natural + 8 * prime_cap),
        ("two", natural + 3 * prime_cap, 2 * natural + 14 * prime_cap),
        ("three or more", 3 * natural - 2 * left_r, 12 * natural - 10 * left_r),
    )
    for name, first, second in rounding_cases:
        check(f"native moment with {name} fixed prime factors", first < 1 and second < 3)
    check("tight two-prime rounded width", natural + 3 * prime_cap == Q(18593, 18600))
    cutoff = Q(1, 500)
    core = 1 - 6 * cutoff
    left = 15 * natural + 10 * core - 30 * cutoff
    check("optimized unmarked density pays for the outer sixth powers",
          natural > 2 * core / 3 and -5 + 6 * Q(5, 7) < 0 and
          left > 0 and left**2 < 600 * natural * core)
    check("complete diagonal-order eighteenth moment through 277/3348",
          natural / 9 == Q(277, 3348) and natural / (9 * core) < prime_cap and
          Q(3, 4) * natural * 6 <= 5 and Q(1, 6) + Q(".01") + Q(3, 4) * natural < 1)
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
