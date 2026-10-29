"""Numerical continuation with a seed from the preceding certified search family.
Exact certificates determine acceptance; this script makes no proof claim.
"""
from pathlib import Path
from fractions import Fraction as F
import json,os,sys,time
from chain import step
role=sys.argv[1];dl=float(F(sys.argv[2]));out=Path(sys.argv[3]);seed=json.loads(Path(sys.argv[4]).read_text())['steps']
if role=='count':B,L,c0=.9888151,2.3415005,.1;target=.08564;stop=.087
elif role=='physical':B,L,c0=.99999,2.5715,.1397;target=.0598;stop=.061
else:raise ValueError(role)
rows=[];start=time.monotonic()
if out.exists():
 rows=json.loads(out.read_text())['steps'];r=rows[-1];B,L,c0=r['B'],r['L'],r['c']
for i in range(len(rows),4000):
 s=min(seed,key=lambda r:abs(r['L0']-L))
 rec=step(B,L,dl,c0=c0,warm=(s['A'],s['D']))
 if rec is None:
  print('Retry broad seeds at',i,flush=True);rec=step(B,L,dl,c0=c0)
 if rec is None:raise SystemExit(f'No numerical feasible step at {i}')
 rows.append(rec);B,L,c0=rec['B'],rec['L'],rec['c']
 out.write_text(json.dumps({'status':'numerical diagnostic only','role':role,'decrement':str(F(sys.argv[2])),
  'low_reserve':os.environ.get('QRH_LOW_RESERVE','1/10000'),'source_margin':os.environ.get('QRH_SOURCE_MARGIN','2e-6'),
  'steps':rows,'elapsed_seconds':time.monotonic()-start},indent=2)+'\n')
 print(role,i+1,B,L,rec['crossing'],flush=True)
 if rec['crossing']>stop:break
print('DONE',role,len(rows),flush=True)
