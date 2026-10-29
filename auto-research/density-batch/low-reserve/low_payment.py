"""Exact identity behind a freely chosen nonnegative LOW reserve.

This is an algebraic lemma, conditional analytic interpretation as elsewhere.
The inequalities in the adjacent proof use only multiplication by nonnegative
factors. Source/return certificates check the new concrete positive reserve.
"""
import json
from pathlib import Path
import sympy as s

B0,L0,L,A,D,v,eta=s.symbols('B0 L0 L A D v eta')
X=1+D*v;E=(L0-L)*X+(6*B0-L0)*A
u=A*v/X;q=(1-eta)*L0*A/E
identity=s.cancel(L0*u-q*((L0-L)*v+(6*B0-L0)*u)-eta*L0*u)
assert identity==0
# The displayed payment decomposition is exact before applying inequalities.
sigma,live_u,tl=s.symbols('sigma live_u tl')
decomposition=s.expand(q*((L0-L)*v+(6*B0-L0)*live_u+(B0+1)*tl)-
 (q*((L0-L)*v+(6*B0-L0)*sigma)+q*(6*B0-L0)*(live_u-sigma)+q*(B0+1)*tl))
assert decomposition==0
assert s.Rational(3,2)*s.Rational(1,24)==s.Rational(1,16)
assert 0<s.Rational(1,10000)<s.Rational(1,1000)
Path(__file__).with_suffix('.receipt.json').write_text(json.dumps({
 'status':'PASS: exact rational-function identities',
 'profile_identity':str(identity),'payment_decomposition':str(decomposition),
 'reserve':'1/10000','complement':'9999/10000',
 'scope':'The accompanying ordered-field proof establishes the payment inequality; these identities alone do not prove the analytic endpoint.'},indent=2)+'\n')
print('LOW profile and payment identities: exact zero; positive reserve 1/10000.')
