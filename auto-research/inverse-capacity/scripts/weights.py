"""Exact anatomy of the same-zero count at the binding point (rational arithmetic).

At (delta, p) = (229/500, 1/2), count face (B, Lambda) of the certified PR #27 point,
the three witness lines are affine:  I(r)=a_I-b_I r,  P(m)=a_P-b_P m,  L(t)=c+v t.
Their common value with r+m=t is the weighted mean
    R = (a_I/b_I + a_P/b_P + c/v) / (1/b_I + 1/b_P + 1/v).
With inverse slot coefficient lam (preprint: 2), a_I = 1-2 delta p/lam, b_I = delta(1-2p/lam).
Supply/second-condition caps are ignored here; lam_whatif.py includes them.
"""
from fractions import Fraction as Q
d, p = Q(229, 500), Q(1, 2)
B, Lam = Q("0.96259643646619"), Q("3.1519358")
alpha = Q(5, 6)
aP, bP = 1 - 2*d*p*B/Lam, 2*d*(1 - 2*p/Lam)
c, v = 1 - alpha, alpha - d
def R(lam):
    aI, bI = 1 - 2*d*p/lam, d*(1 - 2*p/lam)
    if bI == 0:
        return aI, None
    w = [1/bI, 1/bP, 1/v]
    return (aI*w[0] + aP*w[1] + c*w[2]) / sum(w), [float(x/sum(w)) for x in w]
r2, w2 = R(Q(2))
print("lam=2: R =", float(r2), "weights (inverse, plain, long) =", [round(x, 3) for x in w2])
for lam in [Q(19, 10), Q(7, 4), Q(3, 2), Q(5, 4), Q(1)]:
    r, w = R(lam)
    print(f"lam={float(lam):.2f}: R = {float(r):.6f}  dR = {float(r - r2):+.6f}")
