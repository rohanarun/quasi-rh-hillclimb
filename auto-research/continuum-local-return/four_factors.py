"""Exact margins for secondary saturation near (2t0/3,2t0/3,t0/3,t0/3)."""
from fractions import Fraction as F
from math import factorial


def positive(name, x):
    if x <= 0:
        raise ValueError(f"{name}: {x}")
    print(name, "OK")


def power_component_margins(name, smax, xmax, price, cutoff, square, cube, sixth):
    # The buffered count costs 8/3 + 5b/2 - 10 sqrt(b/6) above the floor.
    gap = F(8, 3) + 5*cutoff/2 - price
    positive(name+" density square has positive left side", gap)
    positive(name+" buffered density margin", 100*cutoff/6-gap**2)
    positive(name+" floor margin", price-(1+cutoff/50))
    gauss = max(xmax, 2*smax/3)
    square_price = max((1+square)/2, F(2, 3)+smax/3+2*square/3,
                       F(5, 6)+gauss/3+5*square/6)
    cube_price = max(F(2, 3)-cutoff/3+2*cube/3,
                     F(5, 6)+max(xmax/2-cutoff/6, smax/6)+5*cube/6)
    sixth_price = F(5, 6)*(1+sixth)+max(0, xmax-2*cutoff/3)
    for component, bound in (("square", square_price), ("cube", cube_price),
                             ("sixth-power", sixth_price)):
        positive(name+" "+component+" component margin", price-bound)


def powerful_margins(name, smax, xmax, price, singleton):
    # singleton bounds the log norm of the product of primes of valuation one.
    gauss = max(xmax, 2*smax/3)
    bounds = (
        ("large residue conductor", (1+smax+singleton)/2),
        ("intermediate residue conductor", F(5, 6)+smax/6+singleton),
        ("small residue conductor", F(5, 6)+gauss/3+singleton/6),
    )
    for region, bound in bounds:
        positive(name+" valuation-one support, "+region, price-bound)


def verify():
    d0, d1, p0, p1 = map(F, (".425", ".4267", ".49995", ".5"))
    g0lo, g0hi = F(".05805911"), F(".05805913")
    g1lo, g1hi = F(".07599618"), F(".07599620")
    klo = 1-p1*(1+2*g1hi)
    khi = 1-p0*(1+2*g1lo)
    vlo, vhi = F(5, 6)-d1, F(5, 6)-d0
    ulo = 1-p1*(1+6*g0hi-4*g1lo)
    uhi = 1-p0*(1+6*g0lo-4*g1hi)
    jlo, jhi = 3*vlo+2*d0*klo, 3*vhi+2*d1*khi
    for x in (1+6*g0lo-4*g1hi, klo, vlo, ulo, jlo):
        positive("interval positivity", x)
    tlo, thi = 1+d0*ulo/jhi, 1+d1*uhi/jlo
    blo, bhi = 2*tlo/3, 2*thi/3
    mlo, mhi = blo/2, bhi/2
    cmax = p1*(1+2*g0hi)+khi*bhi
    delta = F(1, 10**6)  # half-open width used in the factor count
    eta = F(1, 10**7)  # target count gain
    reserve = F(1, 2*10**7)  # aggregate of freely chosen losses
    left, top = F(1467, 2000), F(311, 400)
    B, lam, cap = 1-F(1,10**12), 2+F(1,10**11), F(3,20)-F(1,10**7)
    sm = F(27,1000)
    natM = (1-F(9,2)*sm)/2
    ordinary_raw = F(".4398")
    guards = {
        "inverse tangent": d0*klo*delta,
        "ordinary tangent": 2*d0*klo*delta,
        "amplified long inverse": vlo*delta,
        "native inverse": d0*(top+p0*(1-top)-cmax),
        "unmarked inverse": d0*(F(".90")-cmax),
        "plain uncapped": d0*(top+2*p0*(B-top)/lam-cmax),
        "plain capped": d0*(top+2*p0*cap-cmax),
        "plain natural": d0*(2*natM+2*p0*sm-cmax),
        "plain unmarked": d0*(2*ordinary_raw-cmax),
    }
    for name, gap in guards.items():
        positive(name+" margin after count gain and reserve", gap-eta-reserve)
    # The physical denominator has a fixed amplitude debit, requiring a wider length guard.
    physical_guard = F("1e-5")
    for name, gap in guards.items():
        if name in ("inverse tangent", "ordinary tangent", "amplified long inverse"):
            gap *= physical_guard / delta
        positive(name+" physical denominator margin", gap - 10*eta)
    signed_gap = (F("1.12796") / 3 - 3 * physical_guard) / 8 - F(7, 5) * 4 * physical_guard
    positive("signed detector principal-sector saving", signed_gap - F(".0468"))
    conductor_gain = (F("1.12796") / 3 - 3 * physical_guard) / 8 - 4 * physical_guard
    positive("equal rational norm cross-term saving", conductor_gain - F(".0468"))
    positive("negative power on small primitive quotient conductors",
             conductor_gain - F(9, 16) * F(".08"))
    positive("primitive quotient conductors at width .44",
             F(".201") + conductor_gain - F(9, 16) * F(".44"))
    positive("projected cross terms fit the physical row budget",
             d0 * (F("1.12796") - 2 * physical_guard) - 2 * eta - F(".201"))
    positive("signed detector separates its inverse cutoff from the short arc",
             tlo / 3 - 6 * physical_guard)
    positive("left contour damping", d0/2 - F(".10") - d1/4)
    positive("right contour stays in the mass theorem", 1 - (1+d1)/2 - F(".28"))
    positive("lower excluded length saves on the physical integral", F(".10")*F("8e-7") - 3*eta/4)
    positive("upper excluded length saves on the physical integral", F(".28")*F("3e-7") - 3*eta/4)
    r_lo, r_hi = F("1.22649"), F("1.22654")
    positive("lower denominator length", 1/(F(".815324505")+F("1e-10")) - F("8e-7") - r_lo)
    positive("upper denominator length", r_hi - 1/(F(".815324503")-F("1e-5")) - F("3e-7"))
    positive("short inverse lower length", r_lo - thi - 3*physical_guard - F(".0974"))
    positive("short inverse upper length", F(".0987") - (r_hi - tlo + 4*physical_guard))
    positive("unmarked mixed moment power reserve",
             d0*F(".0974") - d1*F(".075") - F(".009") - 6*eta - F(".00039"))
    one_presentation_price = F(".62567") + 2*d0*(tlo/3 - 4*physical_guard + F(".0974"))
    positive("fourth moment for one physical presentation", one_presentation_price - F("1.028014"))
    positive("row count after the two fixed amplitude debits", F(".000014") - 13*eta)
    tangent_a = 1 + 6*g0lo - 4*g1hi
    tangent_b = 1 + 2*g1hi
    positive("cutoff decreases with p", tangent_a*(3*vlo + 2*d0) - 2*d1*tangent_b)
    cutoff_max = 1 + d1*(1-p0*tangent_a)/(3*vlo + 2*d1*(1-p0*tangent_b))
    positive("upper cutoff for the short inverse alone", F("1.12891") - cutoff_max)
    positive("sharper short inverse lower length", r_lo - cutoff_max - 3*physical_guard - F(".09755"))
    positive("eighteenth moment after count and witness debits",
             d0*(9*F(".09755")-F(".877245")) - F(".00029") - 28*eta)
    column_width = 9*F(".0987")
    positive("complete ninth-power column after divisor extraction",
             F(".5") - (column_width-F(".3884")))
    positive("large square-root threshold suffices", 2*F(".1942") - (column_width-F(".5")))
    for nu in (F(0), F(1, 6)):
        row = 1-6*nu
        sieve = max(row, F(1, 2), 5*row/6 + F(1, 6), row/3 + F(5, 12))
        if nu + sieve > 1:
            raise ValueError("all-element short column exceeds the unit moment price")
    positive("uniform lower anchor interior", blo-left)
    positive("uniform upper anchor interior", top-bhi-2*delta)
    positive("normal ordinary interval", ordinary_raw-natM)
    positive("ordinary natural capacity bounded away from zero", (1-2*ordinary_raw)/F(9,2)-F(".02"))
    positive("ordinary natural coefficient increases", 2-4*p1/F(9,2))
    positive("ordinary affine coefficient increases", 2-4*p1/lam)
    positive("upper detector range", F("2.26")-2*thi)
    positive("Gamma contour power reserve", 3-F("2.26")*(F(5,4)-F(".51"))-1)
    # Outer y<=m0+delta and r+y>=2t0-5delta-o(1) imply r>t0.
    positive("original inverse annulus is beyond A", tlo-mhi-7*delta)
    positive("outside nonlinear threshold", 2*(blo-9*delta)-F("1.50"))
    # Exponent U^(63/50) for the actual two-inverse moment would pay.
    threshold = 1-d1*cmax+2*d0*(blo-9*delta)
    positive("two-inverse moment conditional reserve", threshold-F(63,50)-F(1,250))
    # The large-radical reduction costs U^c choices and at most U^(100c) in twist loss.
    positive("squarefree row and moving-twist allowance", F(1, 250) - 101*F(1, 100000) - eta - reserve)
    alpha_min = 1 + 6*g0lo - 4*g1hi
    beta_max = 1 + 2*g1hi
    positive("count decreases with full amplitude",
             alpha_min*(3*vlo + 2*d0) - 2*d1*beta_max)
    # Coprime shifts lose at most gamma in combined length and cost U^(gamma+eps).
    gamma = F(1, 100000)
    positive("absolute Euler kernel tail after the preliminary losses",
             gamma*((1+d0)/2 - F(3, 5)) - 2*eta)
    shift_cost = (1+d1)*gamma
    positive("coprime shifts and squarefree-row twist loss for two inverses",
             F(1, 250) - 101*gamma - shift_cost - eta - reserve)
    mixed_price = (1+5*tlo)/6 - 18*d1*delta
    positive("coprime mixed pair with squarefree-row twist loss",
             mixed_price - F(553, 500) - 31*gamma - shift_cost - eta - reserve)
    cmin = p0*(1+2*g0lo)+klo*blo
    # Fixed-height central values of the original numerator on the masked class.
    cap = F(3, 40)
    radial_count_lo = 1-d1*cmax
    amplitude_lo = d0*(cmin/4-p1*cap/2)
    moment_gain = d0*(cmin/36-p1*cap/2)-F(1, 450)
    positive("central high-sample count margin", radial_count_lo-F(".62567"))
    positive("fixed central sample lower threshold", amplitude_lo-2*eta-F(".085"))
    positive("high-sample fourth moment after the grid losses",
             radial_count_lo-(1-4*F(".0936"))-4*eta)
    positive("fractional central moment physical margin", moment_gain-F(".0001"))
    positive("large coefficient dilation margin", d0*F(1, 10**6)/4-3*eta/4)
    r, radius, outer = F(".6695"), F("1.331"), F("1.33075")
    distance = r-F(".5")
    positive("cluster inner weight numerator", (outer-(2-r))/outer-F(1, 6000))
    positive("cluster imaginary radius", F(".72")**2+(2-F(7, 8))**2-radius**2)
    positive("cluster Borel-Caratheodory constant",
             10**5-(radius+3*outer)/(radius-outer))
    positive("three-circles small power", 60000-1-9*6000)
    argument = 8*distance
    cos_lower = sum((-1)**k*argument**(2*k)/factorial(2*k) for k in range(4))
    positive("horizontal cosine bound", cos_lower-F(".2"))
    cosh_lower = sum(F(16**(2*k), factorial(2*k)) for k in range(10))
    positive("horizontal hyperbolic cosine bound", cosh_lower-10**6)
    positive("reflected sparse disk height budget", F(".00011")-F(".0001")-2*distance/100000)
    sparse_cost = (distance+F(".00011")+F(".0001"))/2+F(".00002")
    positive("sparse disk central sample gap", F(".085")-sparse_cost)
    positive("critical numerator size for the reflected test", amplitude_lo-2*eta-F(".08516"))
    ell_t = F(11, 3)-4*F(".87334585")
    y_min = (F(".815324503")-2*ell_t)/(F(".815324505")+F(1, 10**10))
    positive("short-dilation ordinary scale", y_min-F(11, 10**6)-F(".5748"))
    rad, inner, sample = F("1.3"), F("1.2866"), F("1.2998")
    alpha_min = 2-F(".713352")
    positive("buffer for the reflected inner disk", 2-F(".71335")-6*F(1, 10**6)-inner)
    positive("reflected outer disk growth", F(".007")-F(".00001")-F(".51")*(F(".713356")-F(".7")))
    log_argument = rad/alpha_min/(1-inner/alpha_min)/(1-inner/rad)
    exp16_lower = sum(F(16**k, factorial(k)) for k in range(32))
    positive("reflected disk factor logarithm", exp16_lower-log_argument)
    positive("reflected disk inner Cayley bound",
             F(".014")-17*F(1, 10**220)-17*F(1, 10**4))
    positive("reflected disk three-circles weight", (rad-sample)*inner/(rad*(rad-inner))-F(1, 70))
    positive("reflected sparse disk logarithm", F(".000015")-F(".014")/999)
    positive("reflected Mellin saving", F(".08516")-F(".4252")*F(".2002")-F(".000015"))
    positive("reflected cluster height radius", F(".20")**2+alpha_min**2-rad**2)
    positive("reflected cluster common grid rounding", F(1, 4)-F(".20")-F(1, 32))
    upper_price = 1+d1*(2*(bhi+delta)-cmin)
    positive("two-inverse price upper bound", F(32,25)-upper_price)
    # Opening a square on the buffered rows saves delta_density * log_U(W)
    # on pairs whose column gcd exceeds W. Use the correlated formula for R.
    mixed_upper = (1+5*thi)/6 + 2*d1*delta
    inverse_upper = F(1, 6) + (F(5, 6)+d1/3)*thi + 2*d1*delta
    positive("mixed large-gcd tail below its moment price",
             F(553, 500) - (mixed_upper - d0/250) - reserve)
    positive("two-inverse large-gcd tail below its moment price",
             F(63, 50) - (inverse_upper - d0/50) - reserve)
    positive("small-gcd square lower bound on selected shifted rows",
             d0*gamma - 2*eta)
    xmax = bhi+delta
    for name, s, smax, ymin, saving, cutoff, core, price in [
        ("mixed", tlo-18*delta-gamma, thi+2*delta,
         mlo-9*delta-gamma, F(".375"), F(".81"), F(".07"), F(553, 500)),
        ("two-inverse", 2*(blo-9*delta)-gamma, 2*xmax,
         blo-9*delta-gamma, F(".500"), F("1.11"), F(".49"), F(63, 50)),
    ]:
        positive(name+" column exponent above one", s-1)
        positive(name+" arbitrary-vector coprime exponent above the price",
                 F(1, 3)+F(5, 6)*s-price)
        positive(name+" Gauss correlation saving", min(ymin, s/3)-saving)
        positive(name+" projected row moment",
                 price-(F(1, 3)+F(5, 6)*smax+F(4, 25)-saving)-reserve)
        sieve = max(1, cutoff, F(5, 6)+cutoff/3, F(1, 3)+5*cutoff/6)
        positive(name+" complete square large-gcd margin", price-sieve-reserve)
        small_core = F(5, 6)*(1+core)+max(0, xmax-2*cutoff/3)
        positive(name+" complete Poisson small-core margin", price-small_core-reserve)
    positive("all column exponents below two", 2-2*(bhi+delta))
    power_component_margins("mixed", thi+2*delta, xmax, F(553, 500),
                            F(26, 25), F(1, 40), F(2, 25), F(1, 4))
    power_component_margins("two-inverse", 2*xmax, xmax, F(63, 50),
                            F(129, 100), F(1, 10), F(1, 5), F(51, 100))
    positive("longest single factor", F(".753")-xmax)
    positive("mixed product length", F("1.13")-(thi+2*delta))
    positive("two-inverse product length", F("1.5055")-2*xmax)
    powerful_margins("mixed", thi+2*delta, xmax, F(553, 500), F(2, 25))
    powerful_margins("two-inverse", 2*xmax, xmax, F(63, 50), F(7, 500))
    # The direct count reaches .51. The character sieve starts at .50.
    inverse_price = F(63, 50)
    allowance = inverse_price - F(5, 6) - F(1, 15000)
    shortest = F("1.29")
    positive("overlap with direct sixth-core count", F(".51")-F(".50"))
    positive("ordinary and sextic common term", allowance-(2*xmax/3-F(".50")/6))
    positive("sixth-core norm term", shortest-8*allowance/3)
    positive("mixed-power sextic term", shortest-3*allowance)
    positive("ordinary sieve beyond the norm cutoff", allowance+shortest/4-F(".749"))
    print("two-inverse price lies between 63/50 + 1/250 and 32/25")


if __name__ == "__main__":
    verify()
