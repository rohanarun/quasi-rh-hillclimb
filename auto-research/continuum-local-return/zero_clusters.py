"""Rational guards for the reflected strip, zero disks and ordinary witness."""

from fractions import Fraction as F
from math import factorial


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


if __name__ == "__main__":
    verify()
