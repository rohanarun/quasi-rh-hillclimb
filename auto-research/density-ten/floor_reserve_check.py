"""Exact arithmetic in the accompanying ordered-field floor-reserve proof."""
from pathlib import Path
from fractions import Fraction as F
import hashlib,json,sys
root=Path(__file__).parent
cost=F(26,10000)+F(1,100)+1+1+F(1,8)+F(1,8)
assert cost==F(11313,5000)
cap=cost*F(1,100000000)
assert cap==F(11313,500000000000)<F(1,250)<F(1,200)
if len(sys.argv)!=2:raise SystemExit('Usage: python floor_reserve_check.py TRACKER_CHECKOUT')
base=Path(sys.argv[1])/'submissions/2026-10-26-sil-density-split/src/Submissions/sil_density_split_20261026/ReturnD'
files=['TransportGeometry.lean','Transport/Transport/FloorExponent.lean','Transport/TransportParameters.lean',
 'Transport/Transport/CubeFloorSaving.lean','Transport/Transport/CubeFloorCollected.lean',
 'Transport/Transport/SharedNonfloor.lean','Transport/Transport/NonfloorTransport.lean','Transport/Transport/HighApproximation.lean']
receipt={'status':'PASS: exact rational budget, with accompanying ordered-field proof',
 'coefficient':str(cost),'maximum_charged_floor_loss':str(cap),'chosen_reserve':'1/250',
 'condition':'preprint seven-eighths theorem and inherited analytic estimates',
 'source_base':'e14f7e7924faaa0a19b37979ed532cbe3df6d830',
 'source_sha256':{f:hashlib.sha256((base/f).read_bytes()).hexdigest() for f in files}}
(root/'floor-reserve.receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
print('PASS: maximum floor loss',cap,'< chosen reserve 1/250')
