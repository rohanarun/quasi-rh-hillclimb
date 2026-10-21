# Exact piecewise-linear min-max solver for the row-count exponent under hypothetical extra moments (large_values.md, §3).
"""rho(delta) = min_{t in [1,tmax]} max_{r in [t-1/2,t]} min(I(r), P(t-r)),
I(r)=min_k e(k r)-k d r over kinv, P(m)=min_k e(k m)-k d m over kpl, e(s)=max(1,1-alpha+alpha s).
Inner max computed exactly over candidate points (piecewise-linear)."""
from functools import lru_cache
from fractions import Fraction as Q
import numpy as np
def pieces(ks, d, alpha):
    # each k gives two linear pieces in x: (a,b) meaning a+b x ; function = min_k max(piece1,piece2)
    return [((1.0, -k*d), (1-alpha, k*alpha - k*d)) for k in ks]
def val(ps, x):
    return min(max(p1[0]+p1[1]*x, p2[0]+p2[1]*x) for p1,p2 in ps)
def inner(t, d, kinv, kpl, alpha):
    lo, hi = max(0.0, t-0.5), t
    I = pieces(kinv, d, alpha); P = pieces(kpl, d, alpha)
    cands = {lo, hi}
    linI = [p for pr in I for p in pr]; linP=[p for pr in P for p in pr]
    for k in kinv: cands.add(1.0/k)
    for k in kpl: cands.add(t-1.0/k)
    # intersections among I pieces, among P pieces (in r), and I vs P(t-r)
    for i,a in enumerate(linI):
        for b in linI[i+1:]:
            if a[1]!=b[1]: cands.add((b[0]-a[0])/(a[1]-b[1]))
    for i,a in enumerate(linP):
        for b in linP[i+1:]:
            if a[1]!=b[1]: cands.add(t-(b[0]-a[0])/(a[1]-b[1]))
    for a in linI:
        for b in linP:
            # a0+a1 r = b0+b1 (t-r)
            den = a[1]+b[1]
            if den!=0: cands.add((b[0]+b[1]*t-a[0])/den)
    best=-9
    for r in cands:
        if lo-1e-15<=r<=hi+1e-15:
            best=max(best, min(val(I,r), val(P,t-r)))
    return best
def rho(d, kinv=(1,), kpl=(2,), alpha=5/6, tmax=1.5):
    ts=np.linspace(1,tmax,2001); vs=[inner(t,d,kinv,kpl,alpha) for t in ts]
    i=int(np.argmin(vs)); a=ts[max(0,i-1)]; b=ts[min(len(ts)-1,i+1)]
    g=(5**.5-1)/2
    for _ in range(60):
        x1=b-g*(b-a); x2=a+g*(b-a)
        if inner(x1,d,kinv,kpl,alpha)<inner(x2,d,kinv,kpl,alpha): b=x2
        else: a=x1
    t=(a+b)/2
    return min(inner(t,d,kinv,kpl,alpha), min(vs)), t
def as_density(**kw):
    @lru_cache(maxsize=None)
    def f(q):
        return Q(rho(float(q), **kw)[0]).limit_denominator(10**10)
    return f
if __name__=="__main__":
    for d in (0.62,0.7,0.75):
        print(d, 1-10*d/(3*(5-2*d)), rho(d), rho(d,(1,2,3,4,5,6),(2,3,4,5,6)))
