"""Exact source certificates; analytic interpretation conditional on preprint 7/8."""
from pathlib import Path
import contextlib,hashlib,io,json,re,sys,time
import scalar as C

KEYS=('B0','L0','c0','B','L','c','A','D')
INITIAL={'count':('9888151/10000000','4683001/2000000','1/10'),
         'physical':('99999/100000','5143/2000','1397/10000')}

def validate(data):
    if not __debug__:raise ValueError('Assertions are required; do not use -O.')
    if not 0<C.Q(data['low_reserve'])<1:raise ValueError('Expected positive LOW reserve below one')
    if data['role'] not in INITIAL or data['density_floor']!='1/2':raise ValueError('Unsupported source root/domain')
    initial=tuple(map(C.Q,INITIAL[data['role']]))
    if tuple(map(C.Q,data['initial']))!=initial:raise ValueError('Wrong source root')
    expected=initial;out=[];decrement=C.Q(data['decrement'])
    if not decrement>0:raise ValueError('Nonpositive decrement')
    if not data['steps']:raise ValueError('Empty source chain')
    for i,row in enumerate(data['steps'],1):
        if set(row)!=set(KEYS) or not all(isinstance(row[k],str) and re.fullmatch(r'-?\d+(?:/[1-9]\d*)?',row[k]) for k in KEYS):
            raise ValueError(f'Step {i}: expected eight exact rational strings')
        values=tuple(C.Q(row[k]) for k in KEYS)
        if values[:3]!=expected:raise ValueError(f'Step {i}: continuity failure')
        if values[1]-values[4]!=decrement:raise ValueError(f'Step {i}: decrement mismatch')
        expected=values[3:6];out.append(values)
    if expected!=tuple(map(C.Q,data['final'])):raise ValueError('Final source mismatch')
    return out

def compute(source):
    source=Path(source);data=json.loads(source.read_text());values=validate(data);records=[];start=time.monotonic()
    for i,vals in enumerate(values,1):
        with contextlib.redirect_stdout(io.StringIO()):record=C.certify(f"{data['role']}_{i:03d}",vals,C.Q(data['low_reserve']))
        records.append(record)
        print('PASS',data['role'],i,'/',len(values),flush=True)
    receipt={'status':'PASS: exact scalar gates and identities; analytic application uses the proved wider-density step',
        'condition':'preprint seven-eighths theorem','source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
        'low_reserve':data['low_reserve'],'role':data['role'],'initial':data['initial'],'final':data['final'],'decrement':data['decrement'],
        'steps':len(records),'strict_gates':14*len(records),'denominators':3*len(records),
        'bernstein_intervals':sum(len(g['boxes']) for r in records for g in r['gates'].values()),
        'elapsed_seconds':time.monotonic()-start,'cases':records}
    source.with_suffix('.receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
    return receipt

if __name__=='__main__':
    if len(sys.argv)!=2:raise SystemExit('Usage: python certify_source.py source.json')
    r=compute(sys.argv[1]);print('EXACT SOURCE PASS',r['steps'],r['final'],flush=True)
