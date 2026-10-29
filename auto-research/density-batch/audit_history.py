from pathlib import Path
from fractions import Fraction as F
import datetime,hashlib,json,re
BUNDLE=Path(__file__).parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
ledger=json.loads((BUNDLE/'ledger.json').read_text())
assert len(ledger['rounds'])==4
previous=F(ledger['baseline']);phase=datetime.datetime.fromisoformat(ledger['lean_phase_started_at'])
for row in ledger['rounds']:
    theta=F(row['theta']);assert previous-theta==F(row['improvement'])>0;previous=theta
    assert datetime.datetime.fromisoformat(row['exact_certification_completed_at'])<phase
    for role,evidence in row['source_evidence'].items():
        if 'inherited_theorem' in evidence:continue
        p=BUNDLE/evidence['input'];r=BUNDLE/evidence['receipt']
        assert sha(p)==evidence['input_sha256'] and sha(r)==evidence['receipt_sha256']
        data=json.loads(p.read_text());receipt=json.loads(r.read_text())
        assert receipt['source_sha256']==sha(p)
        assert [c['parameters'] for c in receipt['cases']]==data['steps']
        assert all(len(c['gates'])==17 and all(F(g['uniform_lower'])>0 for g in c['gates'].values()) for c in receipt['cases'])
    r=BUNDLE/row['return_receipt'];assert sha(r)==row['return_receipt_sha256']
    receipt=json.loads(r.read_text());candidate=json.loads((BUNDLE/row['return_input']).read_text())
    assert all(receipt[k]==v for k,v in candidate.items())
    assert len(receipt['admission'])==16 and len(receipt['return'])==97
    assert all(F(v)>0 for v in receipt['geometry'].values())
    assert all(F(v)==0 for v in receipt['identities'].values())
    assert all(len(r['edges'])==4 and all(F(e['margin_lower'])>0 for e in r['edges']) for r in receipt['return'])
assert F(ledger['baseline'])-previous==F(467,500000000)
review={'status':'PASS','four_strict_improvements_before_lean':True,'bound':str(previous),'total_gain':'467/500000000','ledger_sha256':sha(BUNDLE/'ledger.json')}
(BUNDLE/'verification/four-round-audit.json').write_text(json.dumps(review,indent=2)+'\n')

print("PASS: archived hashes and four strict improvements before Lean")
