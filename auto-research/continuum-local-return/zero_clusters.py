"""Rational guards for the reflected strip, zero disks and ordinary witness."""

from fractions import Fraction as F
from math import factorial, prod


def require(name, condition):
    if not condition:
        raise ValueError(name)
    print(f"{name}: OK")


def verify():
    c = F(1, 40000)
    min_a = (1 + F(".425")) / 2
    max_a = (1 + F(".4267")) / 2
    k_max = F(1, 100)
    e_over_k = F(1, 10000)
    center, outer = F(1, 5), F(6, 5)
    small, inner, large, target = map(F, (".19", ".1425", ".9", ".2625"))
    zero_distance = center - 2*e_over_k

    require("reflected fixed height and subpower reserve",
            F(".02")*(min_a - F(1, 2)) - 12*k_max*e_over_k > F(".004"))
    require("disk within primitive growth strip",
            min_a - k_max > F(1, 2) and max_a + (center + outer)*k_max < 1)
    require("localized convexity exponent before constants",
            c/100 + F(".51")*(1 + 6*e_over_k) < F(".52"))
    require("inner disk in right-hand zero-free region", center - small > 6*e_over_k)
    require("Blaschke divisor bounds",
            outer*(zero_distance-small)/(outer**2+outer*small) > F(1, 150)
            and zero_distance / outer > F(1, 7))
    require("elementary upper bounds for log 7 and log 150",
            sum(F(2**j, factorial(j)) for j in range(6)) > 7
            and sum(F(6**j, factorial(j)) for j in range(8)) > 150)
    require("Borel-Caratheodory radii", inner/small == large/outer == F(3, 4))
    require("Borel-Caratheodory constants",
            6*F("6.01") + 7*F("2.02") < 51
            and 6*F(".55") + 7*F("2.02")*c < F(7, 2))
    require("leftward contour", target - center == F(1, 16))
    require("three-circles inner weight exceeds two thirds",
            (large/target)**3 > (large/inner)**2)
    require("three-circles upper bound", (51*c)**2 * F(7, 2) < F(1, 50)**3)
    require("outer ordinary length from the four-factor window",
            F("1.1279")/3 - 9*F(1, 10**6) > F(37, 100))
    require("ordinary bound contradicts witness after all losses",
            F(37, 100)/16 - F(21, 1000) > F(1, 1000))

    # A common physical prime frequency supplies a near-edge zero for its own ray twist.
    density_lo, density_hi = F(".425"), F(".4267")
    deficit = F(1, 40000)
    shifted = F(".000024")
    require("external prime test forces a zero inside the proposed band",
            density_hi*F(".00005") < shifted < deficit)
    require("external zero detector stays in its Gamma strip",
            min_a - deficit > F(".51"))
    # (delta+2*d*r)/(2*(delta-d)) decreases in delta.
    y_upper = (density_lo + 2*deficit*F("2.16"))/(2*(density_lo-deficit))
    require("external detector length ceiling",
            y_upper < F(".501") and F("2.16") + y_upper < F("2.7"))
    debit = F(".000136")
    require("external witness losses", 2*deficit*F("2.7") < debit
            and debit/2 < F(".000070"))
    require("coarse moment guards after retargeting",
            F(".001")-F(".0005")-2*debit > F(1, 10**7))
    weaker_c = F(1, 10**6)
    require("reduced cluster threshold", (51*weaker_c)**2 * F(7, 2) < F(".0021")**3)
    require("externally centered weak ordinary contradiction",
            (F(".198")/16-F(".0021")-F(".001"))*F(".01") > F(".000070"))


def selected_zero_gaussian():
    # Lengths in this check are divided by d. The Gaussian parameter is k / d.
    k, c = F(".001"), F("1e-200")
    d_max, y = F(".01"), F(".94")
    shift = k / 6400
    gap = F(".025")
    exceptional_exponent = 1 - F(".425") * F(".91") + F(".002")
    require("unmarked inverse gap at the fixed smooth dyads",
            exceptional_exponent == F(".61525") < F(".62567") - F("1e-7"))
    require("local rectangle fits the zero-removal disk",
            (shift + F(1, 4)) ** 2 + F(1, 8) ** 2 < F(3, 8) ** 2)
    require("quantitative propagation of the analytic logarithm",
            23 * c * 43 ** 16 < (shift / 100) ** 16)
    require("polynomial and Gaussian cost on the near-right line",
            c * shift + c*c / (2 * k) + c < shift / 1000)
    require("truncation outside the local height interval",
            y * shift + k * shift ** 2 - k / 128 + shift / 1000 < -2 * shift)
    require("local shifted contour and horizontal joins",
            -y * shift + k * shift ** 2 + shift / 100 < -shift / 2 and
            y * shift + k * shift ** 2 - k / 64 + shift / 100 < -shift / 2)
    require("Gaussian loss on complementary inverse lengths",
            gap ** 2 / (8 * k) - F(".001") - c*c / k > 2 * shift)
    require("Gaussian decay beyond the fixed range of dyads", F(".98") ** 2 * 50 / 8 > 6)
    require("fixed inverse saving exceeds residue threshold", F(".001") > 2 * shift * d_max)
    require("Jensen upper count and annular remainder",
            4 * F("2.01") < 9 and F(9, 40) < F(1, 4))
    require("logarithmic derivative bound in the buffered disk",
            F(7, 4) - F("1.3") > F(1, 3) and 1 + 315 + 3*45 < 1000)
    require("vertical separation in the shallow annulus",
            F(".025") ** 2 - F(".012") ** 2 > F(".02") ** 2)
    require("separated ordinates on one side of the selected zero",
            F(".51") * F("3.06") + F(".01") < 2 and
            F(18, 1000) < F(1, 4) and 4 - F("1.02") ** 2 > 1)


def filtered_detector():
    d = F("1e-10")
    slot = F("1e-6")
    b_low, b_high = F("2.25"), F("2.26")
    reserve = F("5e-8")
    e_upper = F(11, 4)  # Bound the exponential series from its third-order term by a geometric series.
    require("Gamma shift for the filtered detector", -3 + b_high * (F(5, 4) - F(".65")) < -1)
    require("fixed squared debits in the four-factor count",
            4 * F("4.3") * d < reserve and 4 * (F("4.3") + F(".20")) * d < reserve)
    require("single-zero filter at the critical band",
            (5 + F(1, 4)) * slot < 3 * slot * b_low and b_high + 5 * slot < F("2.261"))
    require("multiplicity filter beats the restored powers",
            e_upper ** 12 * 3 * slot < 1 and F(12, 5) - F("2.261") > F(1, 25))
    require("tight disk growth and suppression",
            2 * b_high + F("1.02") < F("5.6") and F("5.6") + F(2, 4) - F(200, 20) < -3)
    require("complex packet diameter", F("1.02") ** 2 + 1 < F("1.5") ** 2)
    min_degree, variation = F(".29"), F(".20")
    require("interpolation factorial decay",
            6 * slot * F("1.5") * e_upper ** 10 < min_degree)
    require("irregular detector decay after normalizing weights",
            9 * min_degree - variation - F("2.261") == F(".149"))
    require("alternating interpolation weights",
            F(1, 4) + F(".08") < F(1, 2))
    # Vertical nodes with a common phase have a common complex factor in their denominators.
    nodes = [0, 1, 3, 7, 12]
    weights = [F(1, prod(x - y for y in nodes if y != x)) for x in nodes]
    require("divided differences for nodes with equal detector phase",
            all(sum(w * x**j for w, x in zip(weights, nodes)) == int(j == len(nodes) - 1)
                for j in range(len(nodes))))


if __name__ == "__main__":
    verify()
    filtered_detector()
    selected_zero_gaussian()
