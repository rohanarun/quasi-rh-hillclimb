"""Exact rational scalar return certificate, conditional on the preprint 7/8 theorem.

Formulas directly port #86 Return/Formulas.lean at tracker 8f77ade2.
Three count branches: old, one widened-density count face, capped physical face.
Exact tensor Bernstein bounds with subdivision; no float acceptance.
This scalar certificate does not itself instantiate the Lean endpoint theorem.
"""
from fractions import Fraction as F
from math import comb
from pathlib import Path
import json
import sys
import sympy as s

Q=s.Rational
delta,p=s.symbols('delta p')
# All externally supplied values must be exact rational strings.
CONFIG=json.loads(Path(sys.argv[1]).read_text())
THETA=Q(CONFIG['theta']);H=Q(CONFIG['h']);RESERVE=Q(CONFIG.get('return_reserve','1/100000000'))
FLOOR_RESERVE=Q(CONFIG.get('floor_reserve','1/200'))
NUMERATOR_CAP=Q(CONFIG.get('numerator_cap','3/50'))
PHYS=tuple(map(Q,CONFIG['physical_face']))
COUNT=tuple(map(Q,CONFIG['count_face']))
WINDOWS=[('cap',Q(9,32),Q(3,8),Q(3,8)),('cap',Q(9,32),Q(21,64),Q(7,16)),
 ('C',Q(11,32),Q(3,8),Q(7,16)),('C',Q(3,8),Q(15,32),Q(3,8)),
 ('C',Q(3,8),Q(27,64),Q(7,16)),('C',Q(27,64),Q(15,32),Q(7,16)),
 ('C',Q(27,64),Q(57,128),Q(15,32)),('C',Q(27,64),Q(111,256),Q(31,64)),
 ('C',Q(111,256),Q(57,128),Q(31,64)),('C',Q(111,256),Q(225,512),Q(63,128)),
 ('C',Q(225,512),Q(57,128),Q(63,128)),('C',Q(225,512),Q(453,1024),Q(127,256)),
 ('C',Q(453,1024),Q(57,128),Q(127,256)),('C',Q(57,128),Q(15,32),Q(15,32)),
 ('C',Q(15,32),Q(33,64),Q(7,16)),('cap',Q(33,64),Q(69,128),Q(15,32))]

def branch(face=None,capped=False):
    V=Q(5,6)-delta;kappa=2*THETA-1
    if face is None:
      D=3-p-2*p/(3*kappa);C=2*(1-p)*(1-p/(3*kappa));J=V*D+delta*C
      return s.expand(J),s.expand((1-delta)*J+delta*C*V/2),[J]
    B,L=face;z=(Q(31,500) if capped else Q(9999,100000))-Q(1,10**7)
    D=3-p if capped else 3-p-4*p/L;A=Q(2) if capped else 2-4*p/L
    C=1-2*p*z if capped else 1-2*p*B/L;Z=1-C;U=(1-p)*C
    J=V*D+delta*(1-p)*A;N=(1-delta)*J+V*delta*U;T=J+delta*U
    RN=A*T+(Z-p)*J;DJ=D*J;MN=D*T-RN
    naturalM=Q(173,400)
    lower=Q(3770001,10**7) if capped else max(Q(3770001,10**7),(B-L*z)/2+Q(1,10**7))
    upper=min(Q(11,25)-Q(1,10**7),naturalM-Q(1,10**7),(B-L*(z if capped else Q(3,100)+Q(1,10**7)))/2-Q(1,10**7))
    guards=[D,A,C,J,T-J,Q(12499,10000)*J-T,RN-Q(23,37)*DJ,DJ-RN,MN-lower*DJ,
      upper*DJ-MN,N-(1-2*delta*naturalM-2*delta*p*Q(3,100))*J,
      U*s.diff(J,p)-s.diff(U,p)*J,Q(11,25)-naturalM-Q(1,10**7),
      B-2*naturalM-L*(Q(3,100)+Q(1,10**7))-Q(2,10**7),
      (z-Q(3,100)-Q(1,10**7))*DJ if capped else Q(1)]
    return s.expand(J),s.expand(N),list(map(s.expand,guards))

def poly(expr):
    pol=s.Poly(expr,delta,p)
    assert not pol.as_expr().has(s.Float)
    return {(i,j):F(c) for (i,j),c in pol.terms()}

def bern(pol,box):
    a,b,c,d=box;a,b,c,d=map(F,(a,b,c,d));dx=b-a;dy=d-c
    n=max(i for i,j in pol);m=max(j for i,j in pol)
    # Power coefficients after affine change to [0,1]^2.
    pw=[[F(0) for j in range(m+1)] for i in range(n+1)]
    for (k,l),v in pol.items():
      for i in range(k+1):
        for j in range(l+1):
          pw[i][j]+=v*comb(k,i)*a**(k-i)*dx**i*comb(l,j)*c**(l-j)*dy**j
    return [[sum(pw[k][l]*F(comb(i,k),comb(n,k))*F(comb(j,l),comb(m,l))
       for k in range(i+1) for l in range(j+1)) for j in range(m+1)] for i in range(n+1)]

def bound(pol,box):return min(v for row in bern(pol,box) for v in row)

def certify_polys(polys,box,maxdepth=24):
    todo=[(box,0)];rows=[]
    while todo:
      box,depth=todo.pop();lower=[bound(pol,box) for pol in polys]
      if min(lower)>0:
        rows.append({'box':list(map(str,box)),'lower':list(map(str,lower))});continue
      if depth>=maxdepth:raise ValueError(('unproved',box,lower))
      a,b,c,d=box
      if b-a>=d-c:
        m=(a+b)/2;todo.extend([((a,m,c,d),depth+1),((m,b,c,d),depth+1)])
      else:
        m=(c+d)/2;todo.extend([((a,b,c,m),depth+1),((a,b,m,d),depth+1)])
    return rows

def main():
    if not __debug__:raise SystemExit('Assertions required; do not use -O')
    branches={'old':branch(),'capP':branch(PHYS,True),'C':branch(COUNT)}
    admission=[]
    for i,(kind,lo,hi,pl) in enumerate(WINDOWS):
      for name in (['capP'] if kind=='cap' else ['C']):
        rows=certify_polys([poly(g) for g in branches[name][2]],(lo,hi,pl,Q(1,2)))
        admission.append({'window':i+1,'branch':name,'cells':rows})
    print('All exact admission windows:',len(admission),'boxes:',sum(len(r['cells']) for r in admission),flush=True)
    old_j=certify_polys([poly(branches['old'][0])],(Q(0),Q(3,4),Q(0),Q(1,2)))
    ell=4*(1-THETA)-Q(1,3);x=1+ell-H;y=H-2*ell;kappa=2*THETA-1
    B,L=PHYS;ds=[Q(1,200),Q(19,25),Q(19,25),H+Q(1,10**10)]
    Cs=[min(d,2*y-d)/(6*kappa) if i<2 else min(NUMERATOR_CAP*d,(2*y-(2-B)*d)/L) for i,d in enumerate(ds)]
    # Both sources have separate suppliers; each count admission is exact.
    signal=THETA-(4+y-x)/6
    identities={'x_plus_y':x+y-(1-ell),'signal_boundary':signal-(x/2+(y-x)/12)}
    assert all(value==0 for value in identities.values())
    geometry={'theta_lower':THETA-Q(873,1000),'theta_upper':Q(7,8)-THETA,
      'h_lower':H-Q(793,1000),'h_upper':Q(806,1000)-H,
      'y_lower':y-Q(458,1000),'y_upper':Q(467,1000)-y,
      'ell_lower':ell-Q(1672,10000),'ell_upper':Q(171,1000)-ell,
      'small_saving':y/2-H*(Q(17,50)-Q(1,6))-Q(1,50)-Q(7,100),
      'floor_margin':signal-FLOOR_RESERVE-(Q(4,25)*x-Q(3,20)-Q(51,100)*y+Q(67,100)*ds[3]-Q(3,20)*ell),
      'ell_positive':ell,'ell_sixth':ell-Q(1,6),'ell_fifth':Q(1,5)-ell,
      'ell_lt_x':x-ell,'x_lt_y':y-x,'y_half':Q(1,2)-y,
      'dilation_gap':2*x-y-ell,'tuple_margin_neg':2*(x+y)-1-3*ell,
      'cap_positive':NUMERATOR_CAP,'cap_lt_fifth':Q(1,5)-NUMERATOR_CAP,
      'physical_source_cap':Q(1,10)-NUMERATOR_CAP,
      'physical_marked_vs_declared_cap':Q(31,500)-NUMERATOR_CAP,
      'physical_declared_vs_source_cap':Q(1,10)-Q(31,500),
      'count_source_cap':Q(1,10)-Q(9999,100000),
      'inherited_cap_source_cap':Q(1,10)-Q(31,500),
      'old_start_positive':ds[0],'old_interval_width':ds[1]-ds[0],
      'switch_lower':ds[1]-Q(3,4),'switch_top':ds[3]-ds[1],'y_switch':ds[1]-y,'switch_twoy':2*y-ds[1],
      'lambda_lower':L-2,'lambda_upper':Q(9,2)-L,'B_lower':B,'B_upper':1-B,
      'small_plain':1-B/2-(Q(9,2)-L/2)*NUMERATOR_CAP,'prime_supply':ell/ds[3]-Q(1,5),
      'incumbent':Q(3,4)-kappa,
      'kappa_positive':kappa,**{f'capacity_{i}_positive':C for i,C in enumerate(Cs)},
      'reserve_vs_rowfee':RESERVE-Q(1,10**9)}
    assert min(geometry.values())>0,{k:v for k,v in geometry.items() if v<=0}
    # A geometric negative control: raising h by 3/100 lowers this margin by 1/100.
    bad_theta,bad_h=THETA,H+Q(3,100)
    bad_ell=4*(1-bad_theta)-Q(1,3)
    bad_floor=bad_theta-Q(51,100)-FLOOR_RESERVE-bad_h/3-Q(53,100)*bad_ell-Q(67,10**12)
    assert bad_floor==geometry['floor_margin']-Q(1,100)<0
    # All possible branch/edge margin polynomials, reserve charged exactly.
    margins={}
    for name,(J,N,_) in branches.items():
      for edge,(d,C) in enumerate(zip(ds,Cs)):
        E=Q(1,2)+Q(13,75)*H-y/2-ell/2-Q(9,100)*d+delta/2+delta*p*(ell-C/2)
        margins[name,edge]=poly(s.expand(J*(THETA-RESERVE-E)-Q(3,4)*d*N))
    # Partition at every window boundary. Within a cell, availability is fixed.
    db=sorted({Q(0),Q(3,4),*(v for w in WINDOWS for v in w[1:3])})
    pb=sorted({Q(0),Q(1,2),*(w[3] for w in WINDOWS)})
    returns=[];todo=[]
    for a,b in zip(db,db[1:]):
      for c,d in zip(pb,pb[1:]):
        available={'old'}
        for kind,lo,hi,pl in WINDOWS:
          if lo<=a and b<=hi and pl<=c:
            available.update(['capP'] if kind=='cap' else ['C'])
        todo.append(((a,b,c,d),tuple(sorted(available)),0))
    while todo:
      box,available,depth=todo.pop();certs=[]
      for edge in range(4):
        candidates=[(bound(margins[name,edge],box),name) for name in available]
        lower,name=max(candidates)
        if lower<=0:break
        certs.append({'edge':edge,'branch':name,'margin_lower':str(lower)})
      if len(certs)==4:
        returns.append({'box':list(map(str,box)),'edges':certs});continue
      if depth>=22:raise ValueError(('return unproved',box,available,depth,candidates))
      a,b,c,d=box
      if b-a>=d-c:
        m=(a+b)/2;todo.extend([((a,m,c,d),available,depth+1),((m,b,c,d),available,depth+1)])
      else:
        m=(c+d)/2;todo.extend([((a,b,c,m),available,depth+1),((a,b,m,d),available,depth+1)])
    print('All exact return rows:',len(returns),'boxes, theta=',THETA,'h=',H,flush=True)
    report={'status':'Exact scalar admission/return checks, conditional on supplied source theorems and the preprint 7/8 theorem; Lean endpoint assembly not instantiated by this script',
      'source_head':'c67a1450476b10e200e1bc095748dc4889ba40d5','theta':str(THETA),'h':str(H),'reserve':str(RESERVE),
      'floor_reserve':str(FLOOR_RESERVE),'numerator_cap':str(NUMERATOR_CAP),'return_reserve':str(RESERVE),
      'physical_face':list(map(str,PHYS)),'count_face':list(map(str,COUNT)),
      'geometry':{k:str(v) for k,v in geometry.items()},'identities':{k:str(v) for k,v in identities.items()},
      'capacities':list(map(str,Cs)),'old_denominator':old_j,
      'negative_control':{'theta':str(bad_theta),'h':str(bad_h),'failed_field':'BoundsN.floor_margin','margin':str(bad_floor)},
      'admission':admission,'return':returns}
    path=Path(sys.argv[1]).resolve().with_suffix('.receipt.json');path.write_text(json.dumps(report,indent=2)+'\n')
    print(path,flush=True)

if __name__=='__main__':main()
