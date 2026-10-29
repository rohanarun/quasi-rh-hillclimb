"""Reuse an exactly certified chain prefix and certify every additional step."""
from pathlib import Path
import gzip,contextlib,hashlib,io,json,sys,time
from certify_source import validate
import scalar as C
p,seed=map(Path,sys.argv[1:3]);data=json.loads(p.read_text());values=validate(data)
parent=json.loads(seed.read_text());validate(parent)
rp=seed.with_suffix('.receipt.json');receipt_bytes=rp.read_bytes() if rp.exists() else gzip.decompress(Path(str(rp)+'.gz').read_bytes());receipt=json.loads(receipt_bytes)
sha=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
assert receipt['source_sha256']==sha(seed) and receipt['status'].startswith('PASS:')
assert data['low_reserve']==parent['low_reserve']==receipt['low_reserve']
assert [x['parameters'] for x in receipt['cases']]==parent['steps']
reused=0;records=[];start=time.monotonic()
for i,(row,vals) in enumerate(zip(data['steps'],values)):
 if i<len(parent['steps']) and row==parent['steps'][i]:
  record=receipt['cases'][i];assert len(record['gates'])==17
  assert all(C.Q(g['uniform_lower'])>0 for g in record['gates'].values())
  reused+=1
 else:
  with contextlib.redirect_stdout(io.StringIO()):record=C.certify(f"{data['role']}_{i+1:03d}",vals,C.Q(data['low_reserve']))
  print('New exact step',data['role'],i+1,flush=True)
 records.append(record)
result={'status':'PASS: reused exact prefix certificates and certified all additional source gates and identities',
 'condition':'preprint seven-eighths theorem','source_sha256':sha(p),'low_reserve':data['low_reserve'],
 'role':data['role'],'initial':data['initial'],'final':data['final'],'decrement':data['decrement'],
 'steps':len(records),'strict_gates':14*len(records),'denominators':3*len(records),
 'bernstein_intervals':sum(len(g['boxes']) for r in records for g in r['gates'].values()),
 'elapsed_seconds':time.monotonic()-start,'reused_steps':reused,'seed_source_sha256':sha(seed),'seed_receipt_sha256':hashlib.sha256(receipt_bytes).hexdigest(),'cases':records}
p.with_suffix('.receipt.json').write_text(json.dumps(result,indent=2)+'\n')
print('EXACT SOURCE PASS',len(records),'reused',reused,'new',len(records)-reused,data['final'],flush=True)
