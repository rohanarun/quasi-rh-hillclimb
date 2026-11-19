"""Cycle088 positive mixed supplier; rational certificate for its analytic proof."""
from argparse import ArgumentParser
from fractions import Fraction as Q
from hashlib import sha256
from math import ceil
from pathlib import Path
import json

z=Q(0); half=Q(1,2); A=Q(5,6); E=Q('.5002')
u=Q('.000003'); H=1-6*u; rho=Q('2e-11')
Y0,Y1,SEAM=map(Q,('.369','.3888','.3735'))
RATIO=Q('1.15'); REF=Q('.115'); M=10**10
F2,F3,FL,FC=map(Q,('4.618','50.5','.00031','1e-7'))
L1,L2=Q('.174'),Q('6.7')

def f(y):
    if y<SEAM:
        x=SEAM-y
        return f(SEAM)+L1*x+L2*x*x
    x=Y1-y
    return F2*x*x+F3*x*x*x+FL*x-FC

def fp(y,left=False):
    if y<SEAM or (left and y==SEAM):
        return -L1-2*L2*(SEAM-y)
    x=Y1-y
    return -2*F2*x-3*F3*x*x-FL

def gain(m):
    return f(m) if m<=Y1 else z

def qfloat(w):
    b=(1-w)/2
    if w<.75:return b+.05805911-.07599620*w
    if w>=7/9:return b
    return b+11*w/16-7/24-5/16*(7*w**4*(w-2/3))**.2

def quota(w):
    assert Q('.734')<=w<1
    b=(1-w)/2
    if w<Q('.75'):return b+Q('.05805911')-Q('.07599620')*w
    if w>=Q(7,9):return b
    den=10**13
    x=(Q(5,16)*den)**5*7*w**4*(w-Q(2,3))
    j=ceil(float(x)**.2) # proposal only
    while j**5<x:j+=1
    while (j-1)**5>=x:j-=1
    assert (j-1)**5<x<=j**5
    return b+Q(11,16)*w-Q(7,24)-Q(j,den)

def seek(lower, upper, proposal, check):
    """Float only proposes an index. Test the actual recorded number exactly."""
    a,b=float(lower),float(upper)
    for _ in range(34):
        m=(a+b)/2
        if proposal(m):b=m
        else:a=m
    j=max(ceil(lower*M),ceil(b*M))
    w=Q(j,M)
    if not check(w):
        # Roundoff at a transition or at an exceptionally close equality.
        w=Q(j+4,M)
        assert check(w),(lower,upper,w)
    assert lower<=w<=upper
    return w

def high_bin(a,b,k0,k1):
    P=half-H/4-b/2+f(b)-u
    lim=u-4*rho
    def inv(r,k):return k*(b+P-H*(r+quota(r))/2)
    def sub(m,k):
        delta=H*m-b
        return k*(-delta+max(z,2*u+delta/2+f(b)-H*gain(m)))
    bf,hf,pf,mf,ff,uf,lf,kf=map(float,(b,H,P,2*b/H,f(b),u,lim,k1))
    def proposed_i(w):return kf*(bf+pf-hf*(w+qfloat(w))/2)<=lf
    def proposed_o(w):
        d=hf*w-bf
        g=0. if w>float(Y1) else (float(F2)*(float(Y1)-w)**2+float(F3)*(float(Y1)-w)**3+float(FL)*(float(Y1)-w)-float(FC)) if w>=float(SEAM) else float(f(SEAM))+float(L1)*(float(SEAM)-w)+float(L2)*(float(SEAM)-w)**2
        return kf*(-d+max(0,2*uf+d/2+ff-hf*g))<=lf
    r=seek(2*b/H,Q('.86'),proposed_i,lambda x:max(inv(x,k) for k in (k0,k1))<=lim)
    m=seek(b/H,Q('.42'),proposed_o,lambda x:max(sub(x,k) for k in (k0,k1))<=lim)
    T=r+m
    assert r>=2*b/H and m>=b/H and H*T/2>b and Q('1.08')<T<Q('1.2')
    assert Q('.734')<r<Q('.8') and m<Q('.39')
    long=max(k*(b+P)-H*(A-(A-k)*T)/2 for k in (k0,k1))
    costs=(max(inv(r,k) for k in (k0,k1)),long,max(sub(m,k) for k in (k0,k1)))
    return (str(r),str(m)),tuple(u-rho-x for x in costs)

def run():
    wmax=half-Y0+f(Y0)
    amax=(1+(1+RATIO)*Y1)/2+f(Y1)
    derivative=max(-fp(Y0),-fp(SEAM))
    checks={
      'start':-max(f(Y1),f(Y1/H)),
      'start_convex':2*F2+6*F3*(Y1-Y1/H),
      'seam_low_crossing':fp(H*SEAM)-fp(SEAM/H),
      'derivative':Q('.25')-derivative,
      'native_margin':Q('.15')-(half-Y0),
      'radius_max_long':half-RATIO*Y1/Q('.98'),
      'reorder_ratio':RATIO-Y1/Y0,
      'capacities_slope_upper':Q('.61')-(half+f(Y0)+Y1*derivative),
      'low_abs_slope':A-E*Q('.61'),
      'sub_abs_slope':A-Q('.75')/2-E*Q('.61'),
      'short_reference':H-4*(REF+wmax),
      'long_reference':Q('.73')-((1+RATIO)*Y1-REF),
      'signed':A+REF-amax-3*u,
      'first_zero':1-amax,
      'second_zero_slots':1-5*u,
      'second_zero_norm':1-amax-4*u,
      'sn9_fixed':Q('.5001')*(Q('.98')-amax),
      'native_98':u-rho+A*(H-Q('.98'))-Q('.75')*max(z,Q('.01')+f(Y0)-u),
      'unmarked_875':u-rho+A*(H-Q('.875'))-Q('.75')*(wmax-u),
      'small_08':u-rho+A*(H-Q('.08'))-Q('.75')*(1+RATIO)*Y1-(wmax-u),
      'tangent_to_curve':quota(Q('.75'))-((1-Q('.75'))/2+Q('.05805911')-Q('.07599620')*Q('.75')),
    }
    assert min(checks.values())>0,checks
    samples=[];d=Y0;step=Q('.000005'); nums=0
    worst=[(Q(1),None) for _ in range(4)]; wmax_t=z; tmin=Q(2); min_k=1
    while d<Y1:
        b=min(Y1,d+step);assert not d<SEAM<b
        points={d,b}|{x for x in (H*SEAM,) if d<x<b}
        low=max(2*u+f(y)-H*f(y/H) for y in points)
        assert low>0
        k=min(E,Q(((u-3*rho)*M/low).__floor__(),M))
        assert Q('.38')<k<=E
        min_k=min(min_k,k)
        worst[0]=min(worst[0],(u-rho-k*low,d))
        widths=[]
        for i in range(8 if k<E else 0):
            r,bs=high_bin(d,b,k+(E-k)*i/8,k+(E-k)*(i+1)/8)
            assert min(bs)>0,(d,k,i,tuple(map(float,bs)))
            t=sum(map(Q,r)); wmax_t=max(wmax_t,t); tmin=min(tmin,t)
            worst[1:]=[min(old,(v,d)) for old,v in zip(worst[1:],bs)]
            widths.append(r);nums+=1
        samples.append([str(d),str(b),str(k),widths]);d=b
    assert len(samples)==3960 and min(x[0] for x in worst)>0
    stages=0;v=Y1
    while v>Y0:v*=H;stages+=1
    return {'scope':'exact terminal and raw geometry arithmetic for symmetric earlier-cap source; no physical endpoint',
            'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(), 'stages':stages,
            'cells':len(samples),'response_bins':nums,'least_k':str(min_k),
            'min_reserves':{key:[str(v),str(y)] for key,(v,y) in zip(('low','short_inverse','long_inverse','ordinary_substitution'),worst)},
            'cutoff_range':[str(tmin),str(wmax_t)],'max_width':str(wmax),'max_volume':str(amax),
            'raw_and_radius_gates':{key:str(val) for key,val in checks.items()},'cutoffs':samples}

if __name__=='__main__':
    p=ArgumentParser(description=__doc__);p.add_argument('--output',type=Path,required=True);a=p.parse_args()
    data=run();raw=(json.dumps(data,separators=(',',':'))+'\n').encode()
    if a.output.exists():assert a.output.read_bytes()==raw
    else:
        with a.output.open('xb') as f_out:f_out.write(raw)
    print(json.dumps({key:data[key] for key in ('stages','cells','response_bins','min_reserves')},indent=1))
    print(sha256(raw).hexdigest())
