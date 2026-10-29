"""Validate named Lean axiom reports, including wrapped pretty-printer output."""
import re
ALLOWED={'propext','Classical.choice','Quot.sound'}
def validate(report,expected):
 rows=re.findall(r"^'([^']+)' depends on axioms:\s*\[([^]]*)\]",report,re.M)
 names=[name for name,_ in rows]
 if len(names)!=len(set(names)) or set(names)!=set(expected):raise ValueError('Missing, duplicate or unexpected audited declaration')
 result={}
 for name,body in rows:
  axioms={item.strip() for item in body.split(',') if item.strip()}
  if not axioms<=ALLOWED:raise ValueError(f'Unexpected axioms for {name}: {axioms-ALLOWED}')
  result[name]=sorted(axioms)
 return result
