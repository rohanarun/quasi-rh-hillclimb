"""Exact checks for the two-coordinate terminal-energy bound."""
from fractions import Fraction as F
from itertools import product


def check(name, gap):
    if gap <= 0:
        raise ValueError(f"{name}: {gap}")
    print(f"{name}: {gap} ({float(gap):.11g})")


u = F(".0006")
H = 1 - 6 * u
gain = F(".000021")
wc = F(".76")
k = F(".447")
floor = F(".08")
v0, v1 = F(".875"), F(".98")
eta, lam = F("1e-7"), F("1e-5")
g0 = (F(".05805911"), F(".05805913"))
g1 = (F(".07599618"), F(".07599620"))
p = (F(".49995"), F(".5"))
delta = (F(".425"), F(".4267"))
n = (F(".42505871") - F("1e-6"), F(".42506577") + F(".8e-6"))
y = (F("1.12796") / 3 - 4*lam, F("1.12903") / 3 + lam)
qmax = F(3, 4)

def wp(m, n):
    return F(m)/2 - n

def ws(m, y, g, h):
    return m*(F(1,2)+g) - (1+2*h)*y

def excesses(m, n, y, g, h, nu, e):
    live = (wp(1, n)+ws(1, y, g, h))/2 + gain - u
    base = e*(live-(wp(m,n)+ws(m,y,g,h))/2)
    sh = m*(nu*wc+e*(1-wc)/2)
    lo = m*(F(5,6)-(F(5,6)-nu)*3*wc/2)
    alt = nu*y+e*(live-wp(m,n)/2)
    return base, alt-sh/2, alt-lo/2

corners = list(product(n,y,g0,g1))
high = ((k,k),(qmax,k),(qmax,qmax))  # (nu,e), e>=k.
base_gap = min(u-excesses(H,*pr,k,k)[0] for pr in corners)
sh_gap = min(u-excesses(H,*pr,nu,e)[1] for pr in corners for nu,e in high)
lo_gap = min(u-excesses(H,*pr,nu,e)[2] for pr in corners for nu,e in high)
for name, margin in (("small-amplitude",base_gap),("short detector",sh_gap),
                     ("long detector",lo_gap)):
    check(name+" slack beyond 7e-6", margin-F("7e-6"))
check("absolute core-price slope below 5/6",
      F(5,6)-max(qmax*(1+max(g0))/2,
                 qmax/4+(qmax*wc+qmax*(1-wc)/2)/2,qmax/4+F(5,12)))
check("ordinary upper width within anchor", F(311,400)-2*max(y)/v1)
check("ordinary lower width within anchor", 2*min(y)-F(1467,2000))
# Negative-length cases use zero-length/fixed bounded scales and the same cap.
check("numerator positive width up to V=.875",wp(v0,max(n)))
check("native numerator cap includes requested width at V=1",F(".15")-wp(1,min(n)))
check("native denominator cap includes requested width at V=1",F(".15")-wp(1,min(y)))
check("cut <= native at V>=1",
      u-gain-max((g-2*h*yy)/2 for yy,g,h in product(y,g0,g1)))
check("core shift pays native bound below .98",
      F(5,6)*(H-v1)-F(3,8)*(1-v1))
live_hi=max((wp(1,nn)+ws(1,yy,g,h))/2+gain-u for nn,yy,g,h in corners)
root_hi=live_hi+u
check("root width below .101", F(".101")-root_hi)
check("bare ordinary sum below .802",F(".802")-max(n)-max(y))
check("core shift pays unmarked below .875", F(5,6)*(H-v0)-qmax*live_hi)
check("tiny and irregular core margin",
      F(5,6)*(H-floor)-qmax*(max(n)+max(y))-live_hi)
check("short detector rate nondecreasing",1-F(1,2))
kmax=1-min(p)*(1+2*min(g1))
physical_gain=4*min(p)*gain - 8*kmax*lam - F(".8e-6")
check("physical spare power above 4e-7",
      (min(delta)*physical_gain-9*eta)/4 - F("4e-7"))
