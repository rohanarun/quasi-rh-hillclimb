"""Floating-point search only; exact source/return certificates are separate."""
from pathlib import Path
import json,sys,time,os
from fractions import Fraction as F
from chain import step

role=sys.argv[1];dl=float(F(sys.argv[2]));out=Path(sys.argv[3])
if role=='count':B,L,c0=.9888151,2.3415005,.1;target=.08564;stop=.087
elif role=='physical':B,L,c0=.99999,2.5715,.1397;target=.0598;stop=.061
else:raise ValueError(role)
rows=[];start=time.monotonic()
if out.exists():
    rows=json.loads(out.read_text())['steps'];r=rows[-1];B,L,c0=r['B'],r['L'],r['c'];print('RESUME',len(rows),B,L,flush=True)
for i in range(len(rows),4000):
    rec=step(B,L,dl,c0=c0)
    if rec is None:
        print('FAILED',i,B,L,flush=True);break
    rows.append(rec);B,L,c0=rec['B'],rec['L'],rec['c']
    out.write_text(json.dumps({'status':'numerical diagnostic only','role':role,'decrement':str(F(sys.argv[2])),
        'low_reserve':os.environ.get('QRH_LOW_RESERVE','1/10000'),'source_margin':os.environ.get('QRH_SOURCE_MARGIN','2e-6'),'steps':rows,'elapsed_seconds':time.monotonic()-start},indent=2)+'\n')
    print(role,i+1,B,L,rec['crossing'],B-target*L,flush=True)
    if rec['crossing']>stop:break
if not rows:raise SystemExit('No feasible numerical step found')
best=max(enumerate(rows,1),key=lambda t:t[1]['B']-target*t[1]['L'])
print('BEST',role,best[0],best[1]['B'],best[1]['L'],flush=True)
