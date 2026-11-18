"""Exact margins for secondary saturation near (2t0/3,2t0/3,t0/3,t0/3)."""
from fractions import Fraction as F


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
