"""Directed rational contact coefficients from E(20), E(22)–E(24)."""
from fractions import Fraction as Q

class I:
    def __init__(self,l,r=None):
        self.lo=Q(l); self.hi=Q(l) if r is None else Q(r)
        assert self.lo<=self.hi
    def __add__(x,y):
        y=as_i(y);return I(x.lo+y.lo,x.hi+y.hi)
    __radd__=__add__
    def __neg__(x):return I(-x.hi,-x.lo)
    def __sub__(x,y):return x+-as_i(y)
    def __rsub__(x,y):return as_i(y)+-x
    def __mul__(x,y):
        y=as_i(y); z=[i*j for i in (x.lo,x.hi) for j in (y.lo,y.hi)]
        return I(min(z),max(z))
    __rmul__=__mul__
    def __truediv__(x,y):
        y=as_i(y); assert y.lo*y.hi>0
        return x*I(1/y.hi,1/y.lo)
    def __rtruediv__(x,y):return as_i(y)/x
    def __pow__(x,n):
        r=I(1);assert isinstance(n,int) and n>=0
        for _ in range(n):r=r*x
        return r

def as_i(v):return v if isinstance(v,I) else I(v)

def rootpoly(x):return 3888*19**5*(15*x-13)**4*(1-x)**5-7*(7-6*x)**4*(9*x-7)**5

al=Q(109168232013339822100148,125000000000000000000000)
ah=Q(174669171221343715360237,200000000000000000000000)
assert Q(13,15)<al<ah<Q(7,8) and rootpoly(al)<0<rootpoly(ah)

def w_of(x):return (12*x-14)/(9*(12*x-11)) # derivative strictly positive on the isolation
w=I(w_of(al),w_of(ah));assert Q('.7523')<w.lo<w.hi<Q('.7524')
iw=(w+12-Q(45,2)*w*w)/(45*w-14)
rad=11*w/16-Q(7,24)-iw
G1=(4/(5*w)+1/(5*(w-Q(2,3))))*rad-Q(11,16)
G0=iw+w*G1
assert Q('.05805911')<G0.lo<G0.hi<Q('.05805913')
assert Q('.07599618')<G1.lo<G1.hi<Q('.07599620')
assert G0.hi-G0.lo<Q('1e-19') and G1.hi-G1.lo<Q('1e-19')

if __name__=='__main__':
    for n,g in (('g0',G0),('g1',G1)):
        print(n,g.lo,g.hi)
