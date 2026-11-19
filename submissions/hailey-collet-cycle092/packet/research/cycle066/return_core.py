#!/usr/bin/env python3
"""Literal rational W21-W26 polynomial engine for the C065 complete return.
Copied coefficient formulas are retained from the C064 certified return.
Source admission and generic analytic transport remain explicit premises.
"""
import ast,json,argparse
from pathlib import Path
from fractions import Fraction as F
from math import comb
class P:
 def __init__(self,x=0):
  self.d={k:F(v) for k,v in x.items() if v} if isinstance(x,dict) else ({(0,0):F(x)} if x else {})
 def __add__(self,o):
  z=self.d.copy()
  for k,v in p(o).d.items():z[k]=z.get(k,F(0))+v
  return P(z)
 __radd__=__add__
 def __neg__(self):return P({k:-v for k,v in self.d.items()})
 def __sub__(self,o):return self+-p(o)
 def __rsub__(self,o):return p(o)+-self
 def __mul__(self,o):
  z={}
  for (a,b),u in self.d.items():
   for (c,d),v in p(o).d.items():z[a+c,b+d]=z.get((a+c,b+d),F(0))+u*v
  return P(z)
 __rmul__=__mul__
 def __truediv__(self,o):
  o=p(o);assert set(o.d)<=set([(0,0)]) and o.d
  v=o.d[0,0];return P({k:x/v for k,x in self.d.items()})
 def __pow__(self,n):
  assert isinstance(n,int) and n>=0
  z=P(1)
  for i in range(n):z=z*self
  return z
 def __eq__(self,o):return self.d==p(o).d
 def diff(self,j):
  z={}
  for k,v in self.d.items():
   if k[j]:
    a=list(k);a[j]-=1;z[tuple(a)]=v*k[j]
  return P(z)
 def const(self):
  assert set(self.d)<=set([(0,0)])
  return self.d.get((0,0),F(0))
def p(x):return x if isinstance(x,P) else P(x)
v=P({(1,0):1});delta=v;pp=P({(0,1):1})
def parse(s):
 def walk(n):
  if isinstance(n,ast.Constant):
   assert type(n.value)==int;return P(n.value)
  if isinstance(n,ast.Name):return {"v":v,"delta":delta,"p":pp}[n.id]
  if isinstance(n,ast.UnaryOp) and isinstance(n.op,ast.USub):return -walk(n.operand)
  if isinstance(n,ast.BinOp):
   a,b=walk(n.left),walk(n.right)
   if isinstance(n.op,ast.Add):return a+b
   if isinstance(n.op,ast.Sub):return a-b
   if isinstance(n.op,ast.Mult):return a*b
   if isinstance(n.op,ast.Div):return a/b
   if isinstance(n.op,ast.Pow):
    k=b.const();assert k.denominator==1;return a**k.numerator
  raise ValueError(ast.dump(n))
 return walk(ast.parse(s.replace(" : ℝ","").replace(":ℝ","").replace("^","**"),mode="eval").body)
def bern(z,box):
 a,b,c,d=map(F,box);n=max((i for i,j in z.d),default=0);m=max((j for i,j in z.d),default=0)
 pw={}
 for (k,l),x in z.d.items():
  for i in range(k+1):
   for j in range(l+1):
    pw[i,j]=pw.get((i,j),F(0))+x*comb(k,i)*a**(k-i)*(b-a)**i*comb(l,j)*c**(l-j)*(d-c)**j
 return [[sum((pw.get((k,l),F(0))*F(comb(i,k),comb(n,k))*F(comb(j,l),comb(m,l)) for k in range(i+1) for l in range(j+1)),F(0)) for j in range(m+1)] for i in range(n+1)]
def flat(mat):return [x for row in mat for x in row]
def lower(z,box):return min(flat(bern(z,box)))
def tiling(boxes):
 boxes=[tuple(map(F,b)) for b in boxes]
 assert all(0<=a<b<=F(3,4) and 0<=c<d<=F(1,2) for a,b,c,d in boxes)
 assert sum(((b-a)*(d-c) for a,b,c,d in boxes),F(0))==F(3,8)
 for i,(a,b,c,d) in enumerate(boxes):
  for e,f,g,h in boxes[:i]:assert not (max(a,e)<min(b,f) and max(c,g)<min(d,h))

W=[('capP','9/32','3/8','3/8'),('capP','9/32','21/64','7/16'),('C','11/32','3/8','7/16'),('C','3/8','15/32','3/8'),('C','3/8','27/64','7/16'),('C','27/64','15/32','7/16'),('C','27/64','57/128','15/32'),('C','27/64','111/256','31/64'),('C','111/256','57/128','31/64'),('C','111/256','225/512','63/128'),('C','225/512','57/128','63/128'),('C','225/512','453/1024','127/256'),('C','453/1024','57/128','127/256'),('C','57/128','15/32','15/32'),('C','15/32','33/64','7/16'),('capP','33/64','69/128','15/32')]
W=[(b,F(a),F(c),F(d)) for b,a,c,d in W]

OLDCOUNT=(F('.977685074'),F('2.1940005'));OLDPHYS=(F('.9913188'),F('2.3815004'))
def branch(kind,B,L,kap,z=None):
 V=F(5,6)-delta;p0=pp
 if kind=='old':
  D=3-p0-2*p0/(3*kap);C=2*(1-p0)*(1-p0/(3*kap));J=V*D+delta*C
  return J,(1-delta)*J+delta*C*V/2,[J]
 cap=kind=='cap';z=z if z is not None else F(9999,100000)-F(1,10**7)
 D=3-p0 if cap else 3-p0-4*p0/L;A=P(2) if cap else 2-4*p0/L
 C=1-2*p0*z if cap else 1-2*p0*B/L;Z=1-C;U=(1-p0)*C
 J=V*D+delta*(1-p0)*A;N=(1-delta)*J+V*delta*U;T=J+delta*U
 RN=A*T+(Z-p0)*J;DJ=D*J;MN=D*T-RN;nm=F(173,400);eta=F(1,10**7)
 lo=F(377,1000)+eta if cap else max(F(377,1000)+eta,(B-L*z)/2+eta)
 up=min(F(11,25)-eta,nm-eta,(B-L*(z if cap else F(3,100)+eta))/2-eta)
 gs=[D,A,C,J,T-J,F(12499,10000)*J-T,RN-F(23,37)*DJ,DJ-RN,MN-lo*DJ,up*DJ-MN,N-(1-2*delta*nm-2*delta*p0*F(3,100))*J,U*J.diff(1)-U.diff(1)*J,P(F(11,25)-nm-eta),P(B-2*nm-L*(F(3,100)+eta)-2*eta),(z-F(3,100)-eta)*DJ if cap else P(1)]
 return J,N,gs

