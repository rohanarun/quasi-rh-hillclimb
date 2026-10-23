"""Float transcription of nf_source.endpoint_checks with separate LOW and HIGH
parents, used to test HIGH-parent choices. DIAGNOSTIC ONLY; ../nf_source.py is exact."""
import numpy as np
from scipy.optimize import minimize_scalar
E, R, FEE = 1e-17, 1e-12, 1e-10
NU = None
def nu_grid(q, n=121):
    return np.linspace(q, 0.75, n)

def gates(q, bx, low, high, red, cap, K):
    """All strict gates (should be >0) for child with L=L0-red, B=B0-red*bx."""
    B0, L0, h0 = low; BH, LH, hH = high
    L = L0 - red; B = B0 - red*bx
    den = 1 - 6*q*B0/L0
    nu = nu_grid(q); tv = 15-6*nu; w = 5-6*nu; rho = 1-10*nu/tv
    out=[den]
    for b in (bx, cap):
        t = B - L*(b-E); T=t+b; S=b-2*E
        a = (q*(b+(t-B0)/L0)+R)/den
        F = 1-6*a; Fp=F-E
        z0=(B0*F-t)/L0
        lr=0.49-K*b
        out += [S, a-20*E, 1/75-a, F-T/2-4*E, B0*F-t-b-4*E, 1-q*h0,
                R-(q*B0/L0+q*h0+4)*E-10*E, lr, 5/6+0.499*lr-T-9*a-FEE,
                1-T-5*a-FEE, 0.98-T-4*a-FEE, 0.98-T-4.5*a-FEE, lr-7*a-FEE,
                h0*F-z0 + 1e-30]
        H = 1-rho-nu*T-a*(5-6*rho)
        gains=[3*nu*w/tv*S, 2*nu*w/tv*S+nu*w*hH/tv*Fp,
               2*nu*w*(LH-1)/(LH*tv-10)*S+nu*w*(BH*tv-10)/(tv*(LH*tv-10))*Fp,
               nu*w/(10+3*w)*S+2*nu*w*w/(tv*(10+3*w))*Fp,
               (2*nu*w*w/(tv*(10+3*w))+nu*w*hH/(10+3*w))*Fp,
               nu*w*(2*w*(LH-1)+BH*tv-10)/(tv*(LH*(10+3*w)-(10+2*w)))*Fp]
        for gg in gains: out.append(np.min(H+gg-FEE))
        out.append(np.min(H+nu*Fp/2-(1-nu)*b-FEE))
        out.append(np.min(H+(rho-1/6)*Fp-(1-nu)*b-FEE))
        out.append(np.min(H+nu*(Fp-0.02)/2-(1-rho)*0.02-(1-nu)*b-FEE))
    return np.array(out, dtype=float)

def feasible(q,bx,low,high,red,cap,K):
    if bx<0 or bx>min(cap,low[2]): return False
    if low[0]-red*bx < 22/23: return False
    return bool(np.all(gates(q,bx,low,high,red,cap,K)>0))

def min_bx(q, low, high, red, cap, K, hi=None, tol=1e-13):
    """Smallest feasible bx at fixed q (gates are not exactly monotone in bx when
    min over nu is taken, so use bisection on feasibility assuming interval)."""
    hi = min(cap, low[2]) if hi is None else hi
    if not feasible(q,hi,low,high,red,cap,K):
        # scan for any feasible point
        xs=np.linspace(0,hi,400)
        f=[feasible(q,x,low,high,red,cap,K) for x in xs]
        if not any(f): return np.inf
        hi=xs[f.index(True)]
    lo=0.0
    if feasible(q,lo,low,high,red,cap,K): return 0.0
    while hi-lo>tol:
        m=(lo+hi)/2
        if feasible(q,m,low,high,red,cap,K): hi=m
        else: lo=m
    return hi

def best_step(low, high, red, cap, K):
    top=min(0.75, low[1]/(6*low[0]))-1e-12
    qs=top-np.geomspace(1e-9, top-0.5, 60)
    vals=[min_bx(q,low,high,red,cap,K,tol=1e-10) for q in qs]
    i=int(np.argmin(vals))
    if not np.isfinite(vals[i]): return None
    a,b=qs[min(i+1,len(qs)-1)],qs[max(i-1,0)]
    a,b=min(a,b),max(a,b)
    r=minimize_scalar(lambda q: min_bx(q,low,high,red,cap,K,tol=1e-13),bounds=(a,b),method='bounded',options={'xatol':1e-13})
    if r.fun<vals[i]: return r.fun, r.x
    return min_bx(qs[i],low,high,red,cap,K,tol=1e-13), qs[i]
