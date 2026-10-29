"""Numerical diagnostics only; all analytic interpretations conditional on preprint 7/8 theorem."""
import json, re, os
from pathlib import Path
import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import minimize

SOURCE=Path(os.environ.get('QRH_TRACKER','.'))/'submissions/2026-10-28-density-split-fine-chain/src/Submissions/density_split_fine_chain/Source'
PAT=r'parent G\(\x27([^\x27]+)\x27, \x27([^\x27]+)\x27, \x27([^\x27]+)\x27\) -> child G\(\x27([^\x27]+)\x27, \x27([^\x27]+)\x27, \x27([^\x27]+)\x27\), selection A = ([^,]+), D = ([^.]+)\.'
from fractions import Fraction

def read_chain():
    chain=[]
    for f in sorted(SOURCE.glob('HybridK15_*.lean')):
        m=re.search(PAT,f.read_text())
        if not m: raise ValueError(f)
        vals=list(map(lambda x:float(Fraction(x.replace(' ',''))),m.groups()))
        chain.append(dict(file=f.name,B0=vals[0],L0=vals[1],c0=vals[2],B=vals[3],L=vals[4],c=vals[5],A=vals[6],D=vals[7]))
    return chain

LOW_RESERVE=float(Fraction(os.environ.get('QRH_LOW_RESERVE','1/10000')))

names=['q_lower','q_upper','q_floor','H_lower','retained_cap','retained_width','low_per_width','high_at_q','high_deriv','principal','second_ref','second_diag','ref_upper','selection_derivative']
def gates(z,B0,L0,c0=.1,c=.1,qfloor=.65,n=161):
    s,dl,A,D=z
    B,L=B0-s*dl,L0-dl
    v=(c-s)*np.unique(np.r_[np.linspace(0,1,n),np.geomspace(1e-8,1,max(40,n//2))])
    w=s+v
    X=1+D*v
    u=A*v/X
    E=dl*X+(6*B0-L0)*A
    q=(1-LOW_RESERVE)*L0*A/E
    H=1-6*u
    rho=1-10*q/(15-6*q)
    return np.array([q-.5,.75-q,q-qfloor,H-.9,c0*H-w+u,w-u,LOW_RESERVE*L0*A/X,
      1-rho-q*B+q*(L-1)*w-(6*(1-rho)-q-1)*u,
      25/24*H-(B-(L-1)*w-u),1-B+(L-2)*w-4.5*u,
      .05+1.5*(1-B)+(1.5*L-2.5)*w-4.5*u,
      1-B+(L-1)*w-4*u,1/3-2*w-3*u,A/X**2])

def optimize(B0,L0,target,c0=.1,c=.1,qfloor=.65):
    best=None
    smin=slope(B0,L0)
    for init in [[smin+.001,.001,.3,30],[smin+.0005,.0001,.3,30],[smin+.0001,.0001,.2,20],[smin+.001,.002,.5,30],[smin+.003,.003,.5,30]]:
        r=minimize(lambda z:-1e5*z[1]*(target-z[0]),init,method='SLSQP',
          bounds=[(.0001,c-.00001),(.0000001,.3),(.0001,10),(0,500)],
          constraints={'type':'ineq','fun':lambda z:(gates(z,B0,L0,c0,c,qfloor)-1e-8).ravel()},
          options={'maxiter':300,'ftol':1e-13})
        if r.success and np.min(gates(r.x,B0,L0,c0,c,qfloor,n=2001))>0 and (best is None or r.fun<best.fun):best=r
    if best is None:return {'target':target,'found':False}
    s,dl,A,D=best.x
    return {'target':target,'B':B0-s*dl,'L':L0-dl,'c':c,'z':best.x.tolist(),'gain':-best.fun/1e5,'minima':dict(zip(names,gates(best.x,B0,L0,c0,c,qfloor,n=2001).min(axis=1).tolist()))}

def qlimit(B,L):return (1-LOW_RESERVE)*L/(6*B-L)
def slope(B,L):return (B-10/(15-6*qlimit(B,L)))/(L-1)

if __name__=='__main__':
    chain=read_chain()
    print('chain endpoints',chain[0],chain[-1])
    for w in [.055,.06,.061,.062,.065,.07,.08,.1]:
        best=max(chain,key=lambda r:r['B']-w*r['L'])
        print('existing envelope',w,best['file'],best['B'],best['L'],best['B']-w*best['L'])
    sol=solve_ivp(lambda L,B:[slope(B[0],L)],(chain[0]['L0'],2.0),[chain[0]['B0']],rtol=1e-11,atol=1e-13,dense_output=True,max_step=.0005)
    ls=np.linspace(chain[0]['L0'],2.0,10001);bs=sol.sol(ls)[0]
    for floor in [.65,.64,.6,.55,.5]:
        ok=qlimit(bs,ls)>=floor
        j=np.flatnonzero(ok)[-1]
        print('ODE qfloor',floor,'B L s',bs[j],ls[j],slope(bs[j],ls[j]))
        for w in [.06,.062,.065,.07,.08]:
            jj=np.flatnonzero(ok)[np.argmax((bs-w*ls)[ok])]
            print('ODE envelope',w,bs[jj],ls[jj],bs[jj]-w*ls[jj])
    out=[]
    for target in [.06,.062,.065,.07,.08]:
        best=max(chain,key=lambda r:r['B']-target*r['L'])
        print('best face',target,best['file'],best['B'],best['L'])
        r=optimize(best['B'],best['L'],target)
        print('optimized',json.dumps(r));out.append(r)
    Path('numerical-candidates.json').write_text(json.dumps(out,indent=2))
