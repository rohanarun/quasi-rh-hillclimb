"""Replay all fifty-nine canonical source steps using exact rational arithmetic.

The widened density API and final endpoint are proved separately in Lean.
Analytic interpretations are conditional on the preprint's 7/8 theorem.
"""
import contextlib
import io
import json
import sys
from pathlib import Path
import scalar as cert

KEYS=('B0','L0','c0','B','L','c','A','D')
INITIAL=tuple(map(cert.Q,('9888151/10000000','4683001/2000000','1/10')))
FINAL=tuple(map(cert.Q,('488842537/500000000','4388001/2000000','1/10')))

def validate_source(path):
    if not __debug__:
        raise SystemExit('Assertions are required; do not run with -O.')
    data=json.loads(Path(path).read_text())
    if data.get('density_floor')!='1/2':
        raise ValueError('Expected the proved widened density floor 1/2.')
    rows=data.get('steps',[])
    if len(rows)!=59:
        raise ValueError('The canonical source requires exactly fifty-nine steps.')
    expected=INITIAL
    values=[]
    for i,row in enumerate(rows,1):
        if set(row)!=set(KEYS) or not all(isinstance(row[k],str) for k in KEYS):
            raise ValueError(f'Step {i}: expected eight exact rational strings.')
        vals=tuple(cert.Q(row[k]) for k in KEYS)
        if vals[:3]!=expected:
            raise ValueError(f'Step {i}: parent-child continuity failure.')
        if vals[1]-vals[4]!=cert.Q(1,400):
            raise ValueError(f'Step {i}: expected Lambda decrement 1/400.')
        expected=vals[3:6]
        values.append(vals)
    if expected!=FINAL:
        raise ValueError('Final source does not match the advertised exact face.')
    return values

def compute(path,verbose=True):
    values=validate_source(path)
    out=[]
    for i,vals in enumerate(values,1):
        if verbose:
            row=cert.certify(f'density_half_{i:02d}',vals)
        else:
            with contextlib.redirect_stdout(io.StringIO()):
                row=cert.certify(f'density_half_{i:02d}',vals)
        out.append(row)
    return {'status':'exact scalar gates; analytic application uses the separately proved widened density API',
            'density_floor':'1/2','initial':list(map(str,INITIAL)),
            'final':list(map(str,FINAL)),'cases':out}

def main():
    if len(sys.argv)>2:
        raise SystemExit('Usage: python certify_chain.py [source.json]')
    source=Path(sys.argv[1]) if len(sys.argv)==2 else Path(__file__).with_name('source.json')
    data=compute(source)
    target=source.with_name('exact-source.json')
    target.write_text(json.dumps(data,indent=2)+'\n')
    print('EXACT ALL PASS: 59 steps, 826 scalar gates, 177 denominator checks.',target)

if __name__=='__main__':main()
