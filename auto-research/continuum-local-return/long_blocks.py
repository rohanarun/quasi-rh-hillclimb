"""Exact scalar checks for the [1.96, 2.16] inverse-block count."""

from fractions import Fraction as F


def greater(label, value, bound):
    if value <= bound:
        raise ValueError(f"{label}: {value} <= {bound}")
    print(f"{label}: {value} > {bound}")


def verify():
    d0, d1, p0, half = map(F, (".425", ".4267", ".49995", ".5"))
    g0lo, g0hi = map(F, (".05805911", ".05805913"))
    g1lo, g1hi = map(F, (".07599618", ".07599620"))
    klo, khi = 1-half*(1+2*g1hi), 1-p0*(1+2*g1lo)
    vmin, vmax = F(5, 6)-d1, F(5, 6)-d0
    ulo, uhi = 1-half*(1+6*g0hi-4*g1lo), 1-p0*(1+6*g0lo-4*g1hi)
    jmin, jmax = 3*vmin+2*d0*klo, 3*vmax+2*d1*khi
    if min(klo, vmin, ulo, jmin, 1+6*g0lo-4*g1hi) <= 0:
        raise ValueError("lost positivity in interval estimates")
    tmin = 1+d0*ulo/jmax
    tmax = 1+d1*uhi/jmin
    cmax = half*(1+2*g0hi) + khi*2*tmax/3
    lower, middle, upper = map(F, (".76", ".90", "1.101"))
    ordinary = F(".4398")
    # R=1-density*C=L(t0) at the short-long crossing.
    checks = {
        "marked inverse [.76,.90]": d0*(lower+p0*(1-lower)-cmax),
        "unmarked inverse [.90,1]": d0*(middle-cmax),
        "amplified inverse [1,1.101]": vmin*(tmin-upper),
        "unmarked ordinary at/above .4398": d0*(2*ordinary-cmax),
    }
    for label, margin in checks.items():
        greater(label, margin, F(1, 1000))
    greater("dyadic support gaps", F("1.96")-2*lower-ordinary, F(1, 10000))
    greater("upper truncation gap", 2*F("1.10")-F("2.16"), F(3, 100))
    # A conservative aggregate reserve leaves R−1e−7.
    greater("net gain", min(checks.values())-F(1, 2000), F(1, 10**7))
    cutoff = F("2.159")
    greater("outer Gamma-shift saving before heights",
            3-F("2.16")*(F(5, 4)-F(".51")), 1)
    greater("detector cutoff below right edge", F("2.16")-cutoff, F(1, 2000))
    greater("additional inverse lower bound", cutoff-ordinary-F("1.719"), F(1, 10000))
    greater("additional plain lower bound", cutoff-F("1.96")-F(".198"), F(1, 2000))
    greater("twice-detected inverse minimum", F("1.719")-lower-ordinary-F(".519"), F(1, 10000))
    greater("twice-detected ordinary minimum", F("1.719")-2*lower-F(".198"), F(1, 2000))


if __name__ == "__main__":
    verify()
