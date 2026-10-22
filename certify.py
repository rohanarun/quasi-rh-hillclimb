"""Exact certificate for the Part II exponent budget at a boundary below 7/8.

Free geometry (ell, h); derived (paper, Eq. old-eq:5.1 / old-eq:5.11):
  l_x = 1 + ell - h,  b = 2h - 1 - 3 ell,  l_y = h - 2 ell,
  low exponent l_x/2 + b/12,  C(s) = l_x/2 + s - 1 + h/6,
  boundary sigma0 = 11/12 - ell/4  (where C(sigma0) equals the low exponent).
Row counts: the paper's closed form with baseline plain capacity 2/9 (kappa = 3/4).
Using 2/9 when sigma0 < 7/8 is conservative: a smaller requested capacity is always
admissible, and for beta* > 7/8 the paper's comparison (Eq. capacity-comparison) still
costs at most (beta* - 7/8)/4 <= Delta'/4 with Delta' = beta* - sigma0.
All arithmetic is exact (Fractions); positivity on boxes is proved by Bernstein
coefficients (all positive on a box  =>  polynomial positive on that box), with
bisection where needed.
"""
from fractions import Fraction as Fr
import sympy as sp

d, y = sp.symbols('delta y')          # y = 1/2 - x, x = q/delta
alpha = Fr(5, 6)

def high_exponent(ell, h, dlt, q, R, dd):
    """Lemma high-bin, first line, at row scale U = Z^dd, with a = (1+delta)/2, z0 = 17/50."""
    lx = 1 + ell - h; ly = h - 2*ell; s0 = Fr(11, 12) - ell/4
    a = (1 + dlt)/2; z0 = Fr(17, 50)
    return a - s0 + h*(z0 - Fr(1, 6)) - a*ly - (1 - a)*ell - (dlt/2 - q)*ell + dd*(R + dlt/2 - z0)

def adaptive_poly(ell, h):
    """Return polynomial F(delta,y) with  F = 108*J*(-E_*)  (J>0), so E_*<0  <=>  F>0."""
    ell = sp.Rational(ell.numerator, ell.denominator); h = sp.Rational(h.numerator, h.denominator)
    x = sp.Rational(1, 2) - y
    Dx = 3 - sp.Rational(17, 9)*x
    Px = (2 - sp.Rational(8, 9)*x)*(1 - x)
    J = (sp.Rational(5, 6) - d)*Dx + d*Px
    Rstar_times_J = (1 - d)*J + (sp.Rational(5, 6) - d)*d*Px/2      # R* = 1 - d + (a-d) d Px/(2J)
    lx = 1 + ell - h; ly = h - 2*ell; s0 = sp.Rational(11, 12) - ell/4
    a = (1 + d)/2; z0 = sp.Rational(17, 50); q = x*d
    # E(h) = rest + h*R*, with rest = everything except the d*R term at d = h
    rest = a - s0 + h*(z0 - sp.Rational(1, 6)) - a*ly - (1 - a)*ell - (d/2 - q)*ell + h*(d/2 - z0)
    F = -(rest*J + h*Rstar_times_J) * 108
    return sp.Poly(sp.expand(F), d, y), sp.Poly(sp.expand(J*108), d, y)

def bernstein_min(P, box):
    """Exact minimum Bernstein coefficient of bivariate P on box [(d0,d1),(y0,y1)]."""
    (d0, d1), (y0, y1) = box
    u, v = sp.symbols('u v')
    Q = sp.Poly(sp.expand(P.as_expr().subs({d: d0 + (d1 - d0)*u, y: y0 + (y1 - y0)*v})), u, v)
    m, n = Q.degree(u), Q.degree(v)
    coeff = {(i, j): Q.coeff_monomial(u**i * v**j) for i in range(m + 1) for j in range(n + 1)}
    best = None
    for I in range(m + 1):
        for Jj in range(n + 1):
            b = sum(sp.binomial(I, i)/sp.binomial(m, i) * sp.binomial(Jj, j)/sp.binomial(n, j) * coeff[(i, j)]
                    for i in range(I + 1) for j in range(Jj + 1))
            best = b if best is None or b < best else best
    return best

def prove_positive(P, box, depth=0, maxdepth=22, log=None):
    b = bernstein_min(P, box)
    if b > 0:
        if log is not None: log.append((box, b))
        return True
    if depth >= maxdepth: return False
    (d0, d1), (y0, y1) = box
    if (d1 - d0) >= (y1 - y0):
        mid = (d0 + d1)/2; boxes = [((d0, mid), (y0, y1)), ((mid, d1), (y0, y1))]
    else:
        mid = (y0 + y1)/2; boxes = [((d0, d1), (y0, mid)), ((d0, d1), (mid, y1))]
    return all(prove_positive(P, bx, depth + 1, maxdepth, log) for bx in boxes)

def side_constraints(ell, h):
    """All other final-section inequalities, exactly. Each value must be > 0."""
    lx = 1 + ell - h; b = 2*h - 1 - 3*ell; ly = h - 2*ell; z0 = Fr(17, 50)
    c = {}
    c['floor bin (delta0=1/50, R=1, q=delta0/2): -E(h)'] = -high_exponent(ell, h, Fr(1, 50), Fr(1, 100), 1, h)
    c['delta=5/6 endpoint (R=1-delta, q=delta/2): -E(h)'] = -high_exponent(ell, h, alpha, alpha/2, 1 - alpha, h)
    # intermediate range d<=1/2, R = 76/75 - 2delta/3, q = delta/2; E linear in delta -> check endpoints
    c['intermediate d=1/2, delta=1/50'] = -high_exponent(ell, h, Fr(1, 50), Fr(1, 100), Fr(76, 75) - Fr(2, 150), Fr(1, 2))
    c['intermediate d=1/2, delta=5/6'] = -high_exponent(ell, h, alpha, alpha/2, Fr(76, 75) - Fr(5, 9), Fr(1, 2))
    c['small rows: -(h(z0-1/6) - l_y/2 + 2 d_min)'] = -(h*(z0 - Fr(1, 6)) - ly/2 + Fr(2, 100))
    c['prime supply at d=h: ell/h - 7/37'] = ell/h - Fr(7, 37)
    c['extension room: 5 ell - h (paper uses zeta < 5ell-h)'] = 5*ell - h
    c['b > 0'] = b
    c['low side: l_x - ell'] = lx - ell
    c['low side: l_y - ell - 11b/6'] = ly - ell - Fr(11, 6)*b
    c['low side: M - 2 ell = 1 - 3 ell'] = 1 - 3*ell
    c['high margin coefficient 1 - h/4'] = 1 - h/4
    return c

if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser(description="Exact final-section certificate at ell = 1/6 + 1/N.")
    ap.add_argument("N", nargs="?", type=Fr, default=Fr(5900), help="positive rational, e.g. 1250000000/214651")
    ap.add_argument("h", nargs="?", type=Fr, default=Fr(405989, 500000))
    ap.add_argument("--maxdepth", type=int, default=22, help="maximum Bernstein bisection depth (default: 22)")
    try:
        args = ap.parse_args()
    except ZeroDivisionError:
        ap.error("rational values must have nonzero denominators")
    if args.N <= 0 or args.h <= 0 or args.maxdepth < 0:
        ap.error("N and h must be positive; maxdepth must be nonnegative")
    ell = Fr(1, 6) + 1/args.N
    h = args.h
    s0 = Fr(11, 12) - ell/4
    print(f"ell = {ell}  h = {h}  ->  sigma0 = {s0} = 7/8 - {Fr(7,8)-s0}  (~{float(s0):.8f})")
    print("check paper point: sigma0(1/6) =", Fr(11, 12) - Fr(1, 6)/4)
    F, J = adaptive_poly(ell, h)
    box = ((sp.Rational(0), sp.Rational(5, 6)), (sp.Rational(0), sp.Rational(1, 2)))
    print("J>0 on box:", prove_positive(J, box, maxdepth=args.maxdepth))
    log = []
    ok = prove_positive(F, box, maxdepth=args.maxdepth, log=log)
    print(f"adaptive endpoint F>0 on delta in [0,5/6], y in [0,1/2]: {ok}  ({len(log)} boxes)")
    if ok:
        print(f"   smallest Bernstein lower bound among boxes: {float(min(b for _, b in log)):.3e}")
    for k, v in side_constraints(ell, h).items():
        print(f"   {'OK ' if v > 0 else 'FAIL'} {k}: {v} (~{float(v):.5f})")
    # sanity: the paper's own point must certify
    F0, _ = adaptive_poly(Fr(1, 6), Fr(13, 16))
    print("paper point (1/6, 13/16) certifies:", prove_positive(F0, box, maxdepth=args.maxdepth))
