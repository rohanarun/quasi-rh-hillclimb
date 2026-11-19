"""Local087 direct fixed interior detector count and genuine separately declared physical cap."""
from fractions import Fraction as F
from hashlib import sha256
from pathlib import Path
import argparse, itertools, json, types, sys
sys.dont_write_bytecode = True
HERE = Path(__file__).resolve().parent
R = HERE.parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--target', default='.12666')
parser.add_argument('--h-add',default='0',help='nonnegative shift of the stationary conductor, below .00067')
parser.add_argument('--output', type=Path)
parser.add_argument('--source-root', type=Path, help='portable packed research root')
args = parser.parse_args()
c = F(args.target); t = 1-c
hadd=F(args.h_add)
assert 0<=hadd<F('.004')
if args.output and args.output.exists(): raise SystemExit('existing evidence retained')
pins = {
 'core':('cycle073/working/research/cycle066/return_core.py','research/cycle066/return_core.py','34818b027a3b8c4a3e1954dad77aa2d4a99bf482e66aade18bb46bbc93608813'),
 'cover':('cycle069/continuum/RETURN_CERTIFICATE.json','research/local_cycle069/continuum/RETURN_CERTIFICATE.json','8c3b0edf6c284c134e5cae0405c9823e878a9fc5a84704c0084407135dc657d5'),
 'contact':('cycle077/intake/EXACT_CONTACT_RECEIPT.json','research/local_cycle077/intake/EXACT_CONTACT_RECEIPT.json','bdb2bab4b4a397cbaf809be8a0e9520077d54d29eb62e15fe11b24c440c7cec0'),
 }
raw={}
for key,(local,packed,digest) in pins.items():
 path=args.source_root/packed if args.source_root else R/local
 raw[key]=path.read_bytes();assert sha256(raw[key]).hexdigest()==digest
core=types.ModuleType('reviewed_rational_polynomials')
exec(compile(raw['core'],'reviewed_rational_polynomials','exec'),core.__dict__)
cover=json.loads(raw['cover']);contact=json.loads(raw['contact'])
def floorat(x,n):return F((x*n).__floor__(),n)
def ceilat(x,n):return F((x*n).__ceil__(),n)
def lowerit(x):return floorat(x,10**15)
def upperit(x):return ceilat(x,10**15)
def upnm(x):return ceilat(x,10**9)
def s(x):
 if isinstance(x,F):return str(x)
 if isinstance(x,dict):return {k:s(v) for k,v in x.items()}
 if isinstance(x,(tuple,list)):return [s(v) for v in x]
 return x
class I:
 def __init__(self,a,b=None):self.lo,self.hi=F(a),F(a if b is None else b)
 def __add__(self,o):o=iv(o);return I(self.lo+o.lo,self.hi+o.hi)
 __radd__=__add__
 def __neg__(self):return I(-self.hi,-self.lo)
 def __sub__(self,o):return self+-iv(o)
 def __rsub__(self,o):return iv(o)+-self
 def __mul__(self,o):
  o=iv(o);v=[a*b for a in (self.lo,self.hi) for b in (o.lo,o.hi)];return I(min(v),max(v))
 __rmul__=__mul__
 def __truediv__(self,o):o=iv(o);assert o.lo>0;return self*I(1/o.hi,1/o.lo)
def iv(x):return x if isinstance(x,I) else I(x)
al,ah=[F(contact['theta_isolation'][k]) for k in ['lower','upper']]
aa=I(floorat(al,10**24),ceilat(ah,10**24))
g0=I('.05805911','.05805913');g1=I('.07599618','.07599620')
hh0=I('.815324503','.815324505');hh=hh0+hadd;la=F(11,3)-4*aa
ell=F(11,3)-4*t;xi=aa.hi-t
source=F(1,10**260);pad=F(1,10**258)
pcap=F('.085');declared=F('.11');Bphys=1-source;Lphys=2+10*source;cphys=F(3,20)-1000*source/1143
assert F(3,40)<pcap<declared<cphys and declared<F(1,5)
assert 0<Bphys<=1 and 2<=Lphys<=F(9,2) and Bphys/2+(F(9,2)-Lphys/2)*declared<1
assert 2*(hh.lo-2*ell)-(2-Bphys)*(hh.hi+pad)>0
fee=F(1,10**9);ann=F(1,10**8)
assert 0<xi<F(1,1000) and 2*aa.lo-1>F('.746')
def ds(alpha):
 w=(12*alpha-14)/(9*(12*alpha-11));return (45*w-14)/(54*w+6)
# Both scalar rational functions increase on the retained isolation.
dlstar,dhstar=lowerit(ds(aa.lo)),upperit(ds(aa.hi))
A=1+2*g1;Vv=1+6*g0-4*g1;jp=-2-2*g1
K=-jp*(F(1,2)+la-hh0/8)+3*hh0/4*(jp+1-Vv/2)
q10=2*A*(aa-F(1,2)-la/2)+5*la-hh0*(2*A/3+F(5,8)+5*Vv/8)
q20=-A-(1+A)*(2*la-hh0/4)+3*hh0/4*(2*A+Vv)
q21=-2*A*(2*la-hh0/4)
assert K.lo>F('.2058') and q21.hi<0<q20.lo+q21.lo/2
Klo=lowerit(K.lo);q10lo=lowerit(q10.lo);q20lo=lowerit(q20.lo);q21lo=lowerit(q21.lo)
def intervals(l,r,maxwidth):
 n=max(1,((r-l)/maxwidth).__ceil__()); step=(r-l)/n
 return [(l+i*step,l+(i+1)*step) for i in range(n)]
def tzero(d,p,a0,a1):
 return 1+d*(1-p*(1+6*a0-4*a1))/(F(5,2)-d*(1+2*p*(1+2*a1)))
oldwindows=[(F(189,512),F(15,32),F(15,32),F(1,2)),
            (F(93,256),F(189,512),F(63,128),F(1,2))]
def inside(box,win):
 a,b,f,e=box;A,B,C,D=win
 return A<=a and b<=B and C<=f and e<=D
extension_raw=(HERE/'PAIRED_EXTENSION_FINAL.json').read_bytes();extension=json.loads(extension_raw)
assert extension['stage_count']==68 and extension['end']=='18/25' and extension['native_reference']['reference_L']=='23/10'
d,p=core.delta,core.pp;r0=F(extension['end']);r1=F(311,400)
B=1-F(1,10**12);L=2+F(1,10**11);cap=F(3,20)-F(1,10**7)
sm=F(27,1000);ym=(1-F(9,2)*sm)/2
guards=[]
for a0,a1 in itertools.product([g0.lo,g0.hi],[g1.lo,g1.hi]):
 V=F(5,6)-d; k=1-p*(1+2*a1); U=1-p*(1+6*a0-4*a1)
 J=3*V+2*d*k;T=J+d*U;N=(1-d)*J+V*d*U
 guards.append([k,J,T-J,F(12499,10000)*J-T,2*T-3*(r0+F(1,10**6))*J,N-(1-d*(r1+(1-r1)*p))*J,
  N-(1-d*(r1+2*(B-r1)*p/L))*J,N-(1-d*(r1+2*cap*p))*J,N-(1-2*ym*d-2*sm*d*p)*J,
  U*(-2*(1+2*a1)*d)+(1+6*a0-4*a1)*J])
def guard_lows(box):
 return [lowerit(core.lower(z,box)) for sets in guards for z in sets]
paid={};newwins={};leaves=[];cells={};rootlands={};extrema={};rat_leaves=sha256()
def extrem(k,x,box,id,fn):
 if k not in extrema or fn(x,extrema[k]['value'])==x:
  extrema[k]={'value':x,'box':box,'id':id}
def mark(id,box,route,res):
 assert res>3*fee
 paid.setdefault(route,[]).append(res)
 rat_leaves.update((str(id)+':'+','.join(map(str,box))+':'+route+':'+str(lowerit(res))+'\n').encode())
def paired_margin(box):
 a,b,f,e=box
 Q=q10lo+a*(q20lo+q21lo*e)
 if Q<0:return None
 Jmax=F(5,2)-a*(1+2*f*(1+2*g1.lo))
 sep=max(F(0),dlstar-b,a-dhstar)
 Mh=Klo*sep**2+(F(1,2)-e)*a*Q
 if hadd:
  assert (1+6*g0.lo-4*g1.hi)*(F(5,2)-b)>2*b*(1+2*g1.hi)
  tl=tzero(a,e,g0.hi,g1.lo)
  Rhi=1-a*(f*(1+2*g0.lo)+2*(1-e*(1+2*g1.hi))*tl/3)
  hslope=-F(5,12)-a*f/4+3*Rhi/4
 else:hslope=F(0)
 return lowerit(Mh/Jmax)-(3+8*b*e)*xi-hadd*hslope
def pair(id,box):
 a,b,f,e=box
 mrg=paired_margin(box)
 assert mrg is not None
 if mrg>5*fee:mark(id,box,'E49_top',mrg);return
 for ql,qh in intervals(a,b,F(1,2048)):
  for pl,ph in intervals(f,e,F(1,4096)):
   unit=(ql,qh,pl,ph);m0=paired_margin(unit);assert m0 is not None
   if m0>5*fee:mark(id,unit,'E49_top',m0);continue
   ticket(id,unit,m0)
def ticket(id,box,m0):
 a,b,f,e=box
 debit=upperit(-m0)
 budget=max(F(0),debit)+10*fee
 slope=F(3,4)*(1-b)-F(9,100)-b*pcap/4
 assert slope>0
 Dw=upnm(budget/slope);Dlo=hh.lo-Dw;assert Dlo>F(19,25)
 vcut=upnm(4*budget/(a*Dlo));gainlarge=Dlo*a*vcut/4-debit
 kmin=1-e*(1+2*g1.hi);kmax=1-f*(1+2*g1.lo);Vmin=F(5,6)-b
 gamma=upnm(F(4,3)*budget/(Dlo*Vmin));lx=upnm(F(4,3)*budget/(Dlo*a*kmin))
 ly=upnm(F(2,3)*budget/(Dlo*a*kmin))
 dn=upnm(budget/(F(1,10)*Dlo));up=upnm(budget/(F(27,100)*Dlo))
 rho=a*(1-e)/2-pcap
 assert rho>0 and (1+b)/2+F('.27')<1 and (1+a)/2-F('.10')>F('.51')
 nlow=1-(hh.hi-2*ell)/Dlo
 ntop=upperit((2*ell+pad)/(hh.lo+pad));nhi=upperit(ntop+vcut+ann)
 tlo=tzero(a,e,g0.hi,g1.lo);thi=tzero(b,f,g0.lo,g1.hi)
 assert (1+6*g0.lo-4*g1.hi)*(F(5,2)-b)>2*b*(1+2*g1.hi)
 ylo=lowerit(tlo/3-gamma-lx-2*ann);yhi=upperit(thi/3+ly+ann)
 # Buffer arbitrary dyadic support into ann; pay it explicitly below.
 rlo=1/(hh.hi+pad)-dn;rhi=1/Dlo+up
 assert rlo>thi-gamma and tlo-gamma>2*thi/3+lx+ann
 assert 1<tlo-gamma<=thi-gamma<F(3,2)
 assert r0<2*tlo/3-gamma-ly-3*ann and 2*thi/3+2*max(lx,ly)+3*ann<r1
 cp=e*(1+2*g0.hi)+kmax*(2*thi/3)
 fixed={
  'inverse_native':r1+f*(1-r1)-cp,'inverse_unmarked':F('.90')-cp,
  'ordinary_cap':r1+2*f*cap-cp,'ordinary_affine':r1+2*f*(B-r1)/L-cp,
  'ordinary_native':2*ym+2*f*sm-cp,'ordinary_unmarked':F('.90')-cp}
 fixedres=min(3*Dlo*a*gg/4-debit for nm,gg in fixed.items())
 assert 2-4*e/L>0 and 2-4*e/F(9,2)>0 and (1-2*F('.45'))/F(9,2)>F('.02')
 # d[p W_ex - k gamma/2] and support/annular penalties; d,p are the SAME bin.
 need=upnm((budget/(Dlo*a)+kmax*(gamma+3*ann)/2+e*ann/2)/f)
 middle=Dlo*a*(f*need-kmax*(gamma+3*ann)/2-e*ann/2)-debit
 reserves=[slope*Dw-debit,gainlarge,F(1,10)*dn*Dlo-debit,F(27,100)*up*Dlo-debit,
  3*Dlo*a*kmin*lx/4-debit,3*Dlo*a*kmin*ly/2-debit,3*Dlo*Vmin*gamma/4-debit,fixedres,middle]
 assert min(reserves)>8*fee, (id,s(box),float(min(reserves)))
 for key,val,fn in [('D_min',Dlo,min),('d_min',a,min),('d_max',b,max),('p_min',f,min),
  ('nref_min',lowerit(nlow),min),('nref_max',nhi,max),('y_min',ylo,min),('y_max',yhi,max),
  ('width_needed_max',need,max),('gamma_max',gamma,max),('lambda_max',lx,max),
  ('dilation_max',vcut,max),('r_min',lowerit(rlo),min),('r_max',upperit(rhi),max),
  ('contour_damping_min',rho,min),('fixed_continuation_reserve_min',lowerit(fixedres),min),
  ('max_positive_debit',debit,max)]:
  extrem(key,val,box,id,fn)
 wmax=(1+g0.hi-lowerit(nlow)-(1+2*g1.lo)*ylo)/2+need
 vol=(1+g0.hi+nhi+(1-2*g1.lo)*yhi)/2+need
 extrem('mark_max',upperit(wmax),box,id,max);extrem('volume_max',upperit(vol),box,id,max)
 assert wmax<F(1,5) and vol<1
 leaves.append((id,box,nlow,nhi,ylo,yhi,need))
 mark(id,box,'nonfloor_saturated_family_witness',min(reserves))
# Local085: price the actual current geometry on each original admitted native branch.
# ExactReturnPolynomial.lean identifies native/nativeLow with (toQ .C).Nq/Jq.
# Use the literal positive source G(1-source,2+10source,cphys), not a limiting equality.
nativeJ,nativeN,_unused=core.branch('C',1-source,2+10*source,2*aa.hi-1)
native_models={}
for native_edge in range(4):
 native_models[native_edge]=[]
 for native_h in (hh.lo,hh.hi):
  native_y=native_h-2*ell
  native_D=(F(1,200) if native_edge==0 else F(19,25) if native_edge in (1,2) else native_h)
  native_C=(min(native_D,2*native_y-native_D)/(6*(2*aa.hi-1)) if native_edge<2
            else min(pcap*native_D,(2*native_y-(2-Bphys)*native_D)/Lphys))
  eb=F(1,2)+F(13,75)*native_h-native_y/2-ell/2-F(9,100)*native_D+d/2+d*p*(ell-native_C/2)
  native_models[native_edge].append((t-eb)*nativeJ-F(3,4)*native_D*nativeN)
def native_current_margin(edge,box):
 jl=core.lower(nativeJ,box);jh=-core.lower(-nativeJ,box);assert 0<jl<=jh
 mm=min(core.lower(poly,box) for poly in native_models[edge])
 return mm/(jh if mm>=0 else jl)

# Direct B.5.1 split at a genuine interior paired anchor, not an optimized-crossing admission.
rfix=F('.720002'); tfix=3*rfix/2
Sfix=1-d*(p*(1+2*g0.lo)+(1-p*(1+2*g1.hi))*rfix)
Afix=F(1,6)+(F(5,6)-d)*tfix
fixed_models={}
for fixed_edge in range(4):
 fixed_models[fixed_edge]=[]
 for fixed_h in (hh.lo,hh.hi):
  fixed_y=fixed_h-2*ell
  fixed_D=(F(1,200) if fixed_edge==0 else F(19,25) if fixed_edge in (1,2) else fixed_h)
  fixed_C=(min(fixed_D,2*fixed_y-fixed_D)/(6*(2*aa.hi-1)) if fixed_edge<2
    else min(pcap*fixed_D,(2*fixed_y-(2-Bphys)*fixed_D)/Lphys))
  eb=F(1,2)+F(13,75)*fixed_h-fixed_y/2-ell/2-F(9,100)*fixed_D+d/2+d*p*(ell-fixed_C/2)
  for rr in (Sfix,Afix):
   fixed_models[fixed_edge].append(t-eb-F(3,4)*fixed_D*(rr+F('1e-11')))
def fixed_current_margin(edge,box):
 return min(core.lower(poly,box) for poly in fixed_models[edge])
def original(id,edge,box,poly,depth=0):
 a,b,f,e=box; coef=3+8*b*e if edge>=2 else 3+(4+F(4,3)/F('.746'))*b*e
 fix=fixed_current_margin(edge,box)
 if fix>5*fee:mark(id,box,'fixed_interior_detector',fix);return
 if cover['cells'][id]['branch'].startswith('native'):
  exact_native=native_current_margin(edge,box)
  if exact_native>5*fee:mark(id,box,'native_current_exact',exact_native);return
 if poly is not None:
  # The slope uses the entire conductor-independent pointwise minimum.
  # E48 is globally available even when the saved margin instead used native.
  kal,kah=2*aa.lo-1,2*aa.hi-1
  od=3-e-2*e/(3*kal);oc=2*(1-f)*(1-f/(3*kah))
  oldhi=min(F(1),1-a+b/(2*(od/oc+a/(F(5,6)-a))))
  oslope=-F(5,12)-a*f/4+3*oldhi/4
  low=core.lower(poly,box)
  # E47/E48, and the literal native/nativeLow lift of (toQ .C).Jq.
  # The true positive denominator decreases in d and p on this box.
  if cover['cells'][id]['branch'].startswith('native'):
   nativeL=F(200000000001,100000000000)
   DD=3-f-4*f/nativeL;CC=(1-f)*(2-4*f/nativeL)
  else:
   DD=3-f-2*f/(3*kah);CC=2*(1-f)*(1-f/(3*kah))
  Jhi=(F(5,6)-a)*DD+a*CC
  assert 0<Jhi<=F(5,2)
  if low>0:
   z=low/Jhi-coef*xi-(hadd*oslope if edge==3 else 0)
   if z>5*fee:mark(id,box,'original_saved',z);return
 assert edge==3
 info=next((i for i,w in enumerate(oldwindows) if inside(box,w)),None)
 if info is None:
  upward=(a,b,f,F(1,2))
  gg=guard_lows(upward)
  if min(gg)>0:
   key=','.join(map(str,upward))
   newwins[key]={'original_cell':id,'40_guard_minima_in_g0_g1_corner_order':gg}
   info=2
 if info is not None and paired_margin(box) is not None:pair(id,box);return
 assert depth<16 and poly is not None,(id,box)
 if b-a>=e-f:
  mid=(a+b)/2;parts=[(a,mid,f,e),(mid,b,f,e)]
 else:
  mid=(f+e)/2;parts=[(a,b,f,mid),(a,b,mid,e)]
 for z in parts:original(id,edge,z,poly,depth+1)
for ed in range(4):core.tiling([z['box'] for z in cover['cells'] if z['edge']==ed])
assert len(cover['cells'])==57
for cc in cover['cells']:
 id=cc['id'];edge=cc['edge'];branch=cc['branch'];box=tuple(map(F,cc['box']));poly=None
 if branch!='improved':
  code='C' if branch.startswith('native') else 'old'
  saved=cover['lower_polynomials'][f'lower_{edge}_{code}']
  poly=core.P({tuple(map(int,k.split(','))):F(v) for k,v in saved.items()})
 before={k:len(v) for k,v in paid.items()}
 original(id,edge,box,poly)
 cells[str(id)]={'original':branch,'edge':edge,'routes':{k:len(v)-before.get(k,0) for k,v in paid.items() if len(v)>before.get(k,0)}}
assert leaves and set(cells)==set(map(str,range(57)))
floor=t-(F('.51')+hh.hi/3+F('.51')*ell+F('.66')*pad)-F(1,10**5)-F(1,10**12)
small=F(49,150)*hh.lo-5*ell/4+F(13,600)
gw=F(49,1000)*hh.lo-ell/10-F(1,800);gz=hh.lo/600-F(1,800)
assert floor>F('.001') and min(small,gw,gz)>5*fee
assert hh.hi+pad<min(F(1),2*(hh.lo-2*ell)) and hh.hi-2*ell<F(19,25)<hh.lo
assert ell/(hh.hi+pad)>F(1,5)
# Exact at the upper endpoint for the unpadded zero-cost capacity at t.
assert hh.hi/2-2*ell < pcap*hh.lo
# Original Gram, geometry and actual source domain at every target.
xband=1+ell-hh;yband=hh-2*ell
assert F(1,6)<ell<F(1,5) and ell<xband.lo and xband.hi<yband.lo and yband.hi<F(1,2)
assert 2*xband.lo-yband.hi-ell>0 and 5*ell<1
assert t==F(11,12)-ell/4
# Direct GT3/GT10/E39 and generic full Gram/transport guards, not the coarse .816 shortcut.
assert hh.lo>F('.793') and F('.1672')<ell<F('.175') and t>F('.873')
assert F(49,150)*hh.lo-ell-F(1,50)>F('.07')
assert min(min(v) for v in paid.values())-F(15,16)*source-2*pad>3*fee
records={
 'paired_extension_sha256':sha256(extension_raw).hexdigest(),'fixed_anchor':rfix,'fixed_count_loss':F('1e-11'),'scope':'Local087 fixed interior detector plus Local085 actual native rational geometry plus retained Local084 underlying cell geometry with separately admitted GT4--GT7 actual physical cap .085 (declared .11) and same-zero row counts. No endpoint or release claimed by these scalar arithmetic inputs.',
 'c':c,'t':t,'alpha_upper':aa.hi,'h_add':hadd,'physical_cap':pcap,'declared_physical_cap':declared,'source':source,'pad':pad,'fee':fee,'annular_slack':ann,
 'K_lower':Klo,'delta_star':[dlstar,dhstar],'q10_q20_q21_lower':[q10lo,q20lo,q21lo],
 'accepted_original_edge_cell_count':len(cells),'cell_routes':cells,'new_paired_admission_guards':newwins,
 'global_original_reserves':{'floor_excess_after_1e-5':floor,'small':small,'principal_w':gw,'principal_z':gz},
 'route_lower_reserves':{k:lowerit(min(v)) for k,v in paid.items()},
 'central_count':len(leaves),'central_extrema':extrema,'canonical_leaf_prices_sha256':rat_leaves.hexdigest(),
 'finite_mesh':'Across active rectangles: d step at most 1/2048, p step at most 1/4096; canonical cuts inside each original box; tau/annular/bin fees below common margin.',
 'sources':{k:{'packed':v[1],'sha256':v[2]} for k,v in pins.items()},
 'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest()
}
if args.output:args.output.write_text(json.dumps(s(records),indent=2)+'\n',encoding='utf-8')
print(json.dumps({'c':float(c),'required_uniform_root':{k:float(extrema[k]['value']) for k in ['nref_min','nref_max','y_min','y_max','width_needed_max','mark_max','volume_max']},'central':len(leaves),'new_admissions':list(newwins),'edge_routes':{k:len(v) for k,v in paid.items()},'least_reserves':{k:float(min(v)) for k,v in paid.items()}}))
