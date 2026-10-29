"""Numerical selection with configurable proved reserves; never a certificate."""
from pathlib import Path
from fractions import Fraction as F
from decimal import Decimal,ROUND_CEILING,ROUND_HALF_EVEN
import sys,json
import numpy as np
import probe as p
p.WINDOWS[2]=('C',11/32,3/8,7/16)
count_path,physical_path,out=map(Path,sys.argv[1:4]);out.mkdir(parents=True,exist_ok=True)
cfg=json.loads(Path(sys.argv[4]).read_text()) if len(sys.argv)>4 else {}
rho=float(F(cfg.get('floor_reserve','1/200')));cap=float(F(cfg.get('numerator_cap','3/50')));reserve=float(F(cfg.get('return_reserve','1/100000000')))
count_data=json.loads(count_path.read_text());physical_data=json.loads(physical_path.read_text())
cr,pr=count_data['steps'],physical_data['steps']
def source(data,i):
 keys=('B0','L0','c0','B','L','c','A','D');rows=[{k:str(F(str(r[k]))) for k in keys} for r in data['steps'][:i+1]]
 return {'role':data['role'],'density_floor':'1/2','decrement':data['decrement'],'low_reserve':data.get('low_reserve','1/10000'),
  'initial':[rows[0][k] for k in ('B0','L0','c0')],'final':[rows[-1][k] for k in ('B','L','c')],'steps':rows}
def opt(cp,pp):
 def top(th,h):
  res=p.minimize_scalar(lambda d:-p.values(d,.5,th,h,physical=pp,faces=(cp,),cap=cap)[3],bounds=(.42,.46),method='bounded',options={'xatol':1e-14})
  return -res.fun,res.x
 def guards(q):
  th,h=q;g=p.geometry(th,h);g['floor']+=.005-rho
  return np.array([th-reserve-top(th,h)[0],*g.values()])
 best=None
 for initial in [[.873945,.80513],[.873944,.8057],[.873944,.80599]]:
  r=p.minimize(lambda q:q[0],initial,constraints={'type':'ineq','fun':guards},method='SLSQP',bounds=[(.8737,.87396),(.804,.806)],options={'ftol':1e-14,'maxiter':300})
  if min(guards(r.x))>=-1e-11 and (best is None or r.x[0]<best.x[0]):best=r
 assert best is not None
 return *best.x,top(*best.x)[1]
ci=max(range(len(cr)),key=lambda i:cr[i]['B']-.08564*cr[i]['L'])
pi=max(range(len(pr)),key=lambda i:pr[i]['B']-.0598*pr[i]['L'])
for _ in range(12):
 cp=(cr[ci]['B'],cr[ci]['L']);pp=(pr[pi]['B'],pr[pi]['L']);th,h,critical=opt(cp,pp)
 next_ci=min(range(len(cr)),key=lambda i:p.count(critical,.5,(cr[i]['B'],cr[i]['L'])))
 next_pi=max(range(len(pr)),key=lambda i:p.capacities(th,h,(pr[i]['B'],pr[i]['L']),cap=cap)[3][1])
 if (next_ci,next_pi)==(ci,pi):break
 ci,pi=next_ci,next_pi
else:raise RuntimeError('Source selection did not stabilize')
count,physical=source(count_data,ci),source(physical_data,pi)
for role,data in [('count',count),('physical',physical)]:
 (out/f'{role}.json').write_text(json.dumps(data,indent=2)+'\n')
theta=(Decimal(str(th))+Decimal('0.0000000002')).quantize(Decimal('0.00000000001'),rounding=ROUND_CEILING)
hh=Decimal(str(h)).quantize(Decimal('0.0000000001'),rounding=ROUND_HALF_EVEN)
# The coarse height interval is strict, even if the optimizer lands at its edge.
hh=min(hh,Decimal('0.8059999999'))
c={'theta':str(F(theta)),'h':str(F(hh)),'physical_face':physical['final'][:2],'count_face':count['final'][:2],**cfg}
(out/'candidate.json').write_text(json.dumps(c,indent=2)+'\n')
(out/'diagnostic.json').write_text(json.dumps({'status':'numerical only; exact certification pending','theta':float(th),'h':float(h),'critical_delta':float(critical),'count_steps':ci+1,'physical_steps':pi+1,'config':cfg},indent=2)+'\n')
print('NUMERICAL CANDIDATE',out.name,c,'steps',ci+1,pi+1,flush=True)
