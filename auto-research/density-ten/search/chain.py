"""Numerical chain search, then rational rounding; not itself a certificate."""
import json,sys,os
import numpy as np
from scipy.optimize import minimize
from explore import *

def step(B0,L0,dl,c=.1,c0=.1,warm=None):
    best=None
    margin=float(os.environ.get("QRH_SOURCE_MARGIN","2e-6"))
    precision=int(os.environ.get("QRH_SOURCE_DIGITS","11"))
    search_n=int(os.environ.get('QRH_SEARCH_N','321'))
    margins=np.full(14,margin)
    margins[6]=float(os.environ.get('QRH_LOW_MARGIN',str(margin)))
    scale=np.array([.1,1.,100.])
    def toz(x):s,A,D=x*scale;return np.array([s,dl,A,D])
    seeds=[(.8,100),(1,100),(.5,80),(.5,200),(.6,600),(.6,1800)] if warm is None else [warm,(.6,600)]
    for A,D in seeds:
        init=np.array([slope(B0,L0)+.003,A,D])/scale
        r=minimize(lambda x:x[0],init,method='SLSQP',
          bounds=[(.001,(c-.000001)/.1),(.001,10),(0,100)],
          constraints={'type':'ineq','fun':lambda x:(gates(toz(x),B0,L0,c0,c,.5,n=search_n)-margins[:,None]).ravel()},
          options={'maxiter':500,'ftol':1e-13})
        z=toz(r.x); g=gates(z,B0,L0,c0,c,.5,n=10001)
        if np.min(g)>0 and (best is None or z[0]<best[0][0]):best=(z,g)
    if best is None:return None
    z,g=best;s,dl,A,D=z
    B=np.floor((B0-s*dl)*10**precision)/10**precision;L=round(L0-dl,9)
    A=round(A,int(os.environ.get('QRH_A_DIGITS','8')));D=round(D,int(os.environ.get('QRH_D_DIGITS','5')))
    z=[(B0-B)/(L0-L),L0-L,A,D]
    gg=gates(z,B0,L0,c0,c,.5,n=10001)
    if np.min(gg)<=0:return None
    return dict(B0=B0,L0=L0,c0=c0,B=B,L=L,c=c,A=A,D=D,crossing=z[0],minima=dict(zip(names,gg.min(axis=1).tolist())))

if __name__=='__main__':
    dl=float(sys.argv[1]) if len(sys.argv)>1 else .01
    B=.9888151;L=2.3415005;rows=[]
    for i in range(50):
        r=step(B,L,dl)
        if not r:print('failed',i,B,L);break
        rows.append(r);B=r['B'];L=r['L']
        print(i+1,B,L,r['crossing'],B-L*.08564,flush=True)
        Path(f'chain-{dl:g}.json').write_text(json.dumps({'status':'numerical candidates, exact certification pending','steps':rows},indent=2))
        if r['crossing']>.087:break
