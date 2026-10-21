# Numerical check that higher plain powers do not improve the row count (density_slack.md, §2).
# rho(delta) = min over cutoff t of max over r in [t-1/2, t] of min(inverse(r), plain(t-r))
# inverse(r) = max(1,(1+5r)/6) - delta r ; plain_k(m) = max(1,k m) - k delta m  (k=2 is the Lean bound)
import numpy as np
def rho(delta, ks=(2,), tgrid=np.linspace(1,1.5,2001)):
    best=9
    for t in tgrid:
        r=np.linspace(max(0,t-0.5), t, 4001); m=t-r
        inv=np.maximum(1,(1+5*r)/6)-delta*r
        pl=np.min([np.maximum(1,k*m)-k*delta*m for k in ks],axis=0)
        v=np.max(np.minimum(inv,pl)); best=min(best,v)
    return best
for d in (0.62,0.65,0.68,0.72,0.75):
    exact=1-10*d/(3*(5-2*d))
    print(d, round(exact,6), round(rho(d),6), round(rho(d,(2,3)),6), round(rho(d,(2,3,4)),6))
