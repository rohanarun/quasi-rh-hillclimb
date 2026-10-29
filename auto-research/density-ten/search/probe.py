"""Numerical diagnostics only. Inherited Sil/Collet return formulas; AI-assisted by OpenAI Codex."""
from pathlib import Path
import sys
import numpy as np
from scipy.optimize import minimize, differential_evolution, minimize_scalar
FINE=(.9888151,2.3415005)
WINDOWS=[('cap',9/32,3/8,3/8),('cap',9/32,21/64,7/16),('C',21/64,3/8,7/16),('C',3/8,15/32,3/8),('C',3/8,27/64,7/16),('C',27/64,15/32,7/16),('C',27/64,57/128,15/32),('C',27/64,111/256,31/64),('C',111/256,57/128,31/64),('C',111/256,225/512,63/128),('C',225/512,57/128,63/128),('C',225/512,453/1024,127/256),('C',453/1024,57/128,127/256),('C',57/128,15/32,15/32),('C',15/32,33/64,7/16),('cap',33/64,69/128,15/32)]

def old(delta,p,theta):
    k=2*theta-1;V=5/6-delta
    D=3-p-2*p/(3*k);C=2*(1-p)*(1-p/(3*k));J=V*D+delta*C
    return 1-delta+delta*C*V/(2*J)

def count(delta,p,face=FINE,cap=.09999,capped=False,mlo=.377,slo=.03,guards=False):
    B,L=face;V=5/6-delta;z=cap-1e-7
    D=3-p if capped else 3-p-4*p/L
    A=2 if capped else 2-4*p/L
    C=1-2*p*z if capped else 1-2*p*B/L
    Z=1-C;U=(1-p)*C;J=V*D+delta*(1-p)*A
    N=(1-delta)*J+V*delta*U;T=J+delta*U
    RN=A*T+(Z-p)*J;DJ=D*J;MN=D*T-RN
    naturalM=(1-4.5*slo)/2
    lower=mlo+1e-7 if capped else max(mlo+1e-7,(B-L*z)/2+1e-7)
    upper=min(.44-1e-7,naturalM-1e-7,(B-L*(z if capped else slo+1e-7))/2-1e-7)
    Dp=-1 if capped else -1-4/L;Ap=0 if capped else -4/L;Cp=-2*z if capped else -2*B/L
    Up=-C+(1-p)*Cp;Jp=V*Dp+delta*(-A+(1-p)*Ap)
    gs=np.array(np.broadcast_arrays(D,A,C,J,T-J,1.2499*J-T,RN-23/37*DJ,DJ-RN,MN-lower*DJ,upper*DJ-MN,N-(1-2*delta*naturalM-2*delta*p*slo)*J,U*Jp-Up*J,.44-naturalM-1e-7,B-2*naturalM-L*(slo+1e-7)-2e-7,(z-slo-1e-7)*DJ if capped else np.ones_like(J)))
    return (N/J,gs,MN/DJ) if guards else N/J

def counts(delta,p,theta,faces=(FINE,),physical=FINE,fixed=True,mlo=.377,slo=.03,physical_cap=.062):
    best=old(delta,p,theta)
    if fixed:
      capmask=np.zeros(np.broadcast_shapes(np.shape(delta),np.shape(p)),dtype=bool);cmask=capmask.copy()
      for kind,lo,hi,pl in WINDOWS:
        mask=(lo<=delta)&(delta<=hi)&(pl<=p)
        if kind=='cap':capmask|=mask
        else:cmask|=mask
      for face in faces:
        best=np.where(cmask,np.minimum(best,count(delta,p,face)),best)
      best=np.where(capmask,np.minimum(best,count(delta,p,physical,physical_cap,True)),best)
    else:
      # Valid entire vertical interval by dense p samples (diagnostic only).
      for face,cap,capped in [(f,.09999,False) for f in faces]+[(physical,physical_cap,True)]:
        r,gs,_=count(delta,p,face,cap,capped,mlo,slo,True)
        valid=np.all(gs>=-1e-14,axis=0)
        for t in np.linspace(0,1,33):
          _,qg,_=count(delta,p+t*(.5-p),face,cap,capped,mlo,slo,True)
          valid &= np.all(qg>=-1e-14,axis=0)
        best=np.where(valid,np.minimum(best,r),best)
    return best

def capacities(theta,h,physical=FINE,dm=.76,cap=.06):
    ell=4*(1-theta)-1/3;y=h-2*ell;k=2*theta-1
    B,L=physical
    return [(d,min(d,2*y-d)/(6*k)) for d in [.005,dm]]+[(d,min(cap*d,(2*y-(2-B)*d)/L)) for d in [dm,h+1e-10]]

def values(delta,p,theta,h,physical=FINE,faces=(FINE,),fixed=True,mlo=.377,slo=.03,dm=.76,cap=.06,physical_cap=.062):
    ell=4*(1-theta)-1/3;y=h-2*ell;r=counts(delta,p,theta,faces,physical,fixed,mlo,slo,physical_cap)
    return np.array([.5+13*h/75-y/2-ell/2-.09*d+delta/2+delta*p*(ell-C/2)+.75*d*r for d,C in capacities(theta,h,physical,dm,cap)])

def geometry(theta,h):
    ell=4*(1-theta)-1/3;x=1+ell-h;y=h-2*ell;dp=h+1e-10
    signal=theta-(4+y-x)/6
    return {'floor':signal-.005-(.16*x-.15-.51*y+.67*dp-.15*ell),'small':y/2-h*(17/50-1/6)-.09,'hmax':.806-h,'hmin':h-.793,'ymin':y-.458,'ymax':.467-y,'ellmax':.171-ell,'ellmin':ell-.1672,'tuple':2*(x+y)-1-3*ell,'dilation':2*x-y-ell}

def worst(theta=.8739558,h=.8051,physical=FINE,faces=(FINE,),fixed=True,mlo=.377,slo=.03,dm=.76,cap=.06,physical_cap=.062):
    kw=dict(theta=theta,h=h,physical=physical,faces=faces,fixed=fixed,mlo=mlo,slo=slo,dm=dm,cap=cap,physical_cap=physical_cap)
    # Independent optimize each window/domain cell, avoids discontinuous branch availability.
    db=sorted({0,.75,*[t for w in WINDOWS for t in w[1:3]]});pb=sorted({0,.5,*[w[3] for w in WINDOWS]})
    ds=np.unique(np.r_[np.linspace(0,.75,751),db]);ps=np.unique(np.r_[np.linspace(0,.5,501),pb])
    d,p=np.meshgrid(ds,ps,indexing='ij');vals=values(d,p,**kw)
    results=[]
    for edge in range(4):
      flat=np.argpartition(vals[edge].ravel(),-5)[-5:];out=[]
      for ix in flat:
        ij=np.unravel_index(ix,d.shape);d0,p0=d[ij],p[ij]
        res=minimize(lambda q:-values(q[0],q[1],**kw)[edge],[d0,p0],bounds=[(0,.75),(0,.5)],method='Nelder-Mead',options={'xatol':1e-12,'fatol':1e-13,'maxiter':300})
        out.append((-res.fun,*res.x))
      results.append(max(out))
    return results

if __name__=='__main__':
    print('baseline geometry',geometry(.8739558,.8051))
    print('caps',capacities(.8739558,.8051))
    print('worst fixed',worst())
    print('worst adaptive',worst(fixed=False))
