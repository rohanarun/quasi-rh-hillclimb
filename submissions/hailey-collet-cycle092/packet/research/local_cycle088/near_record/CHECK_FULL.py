"""Exact full return: clear the current paired price and normalize at the top edge."""
from argparse import ArgumentParser
from contextlib import redirect_stdout
from fractions import Fraction as Q
from hashlib import sha256
from pathlib import Path
import io,json,runpy,sys

from CHECK_RETURN import geometry,ENGINE_SHA
from CHECK_SYMMETRIC import f,fp,Y0,Y1,SEAM,RATIO
from CONTACT_EXACT import G0,G1

P=Path(__file__).resolve().parent;R=P.parents[1]
A=Q(5,6); half=Q(1,2)
ann=Q('1e-10'); fee=Q('1e-10')
SOURCE_SHA='f3c99a957655f73c76dd50472887c821f529cf2be58125e976ada65d39062047'

def main():
    ap=ArgumentParser(description=__doc__)
    ap.add_argument('--target',required=True);ap.add_argument('--h-add',required=True)
    ap.add_argument('--steps',type=int,default=16384);ap.add_argument('--depth',type=int,default=10)
    ap.add_argument('--output',required=True,type=Path);a=ap.parse_args();N=a.steps
    assert not a.output.exists() and 1<=N<=65536
    engine=R/'cycle087'/'near_record'/'EXTENDED_ENGINE.py'
    assert sha256(engine.read_bytes()).hexdigest()==ENGINE_SHA
    assert sha256((P/'SYMMETRIC_SOURCE.json').read_bytes()).hexdigest()==SOURCE_SHA
    sys.argv=[str(engine),'--target',a.target,'--h-add',a.h_add]
    with redirect_stdout(io.StringIO()):z=runpy.run_path(str(engine),run_name='__main__')
    v=geometry(z);g0,g1=G0,G1;origfee=z['fee'];up=z['upnm']
    assert z['g0'].lo<=g0.lo<g0.hi<=z['g0'].hi and z['g1'].lo<=g1.lo<g1.hi<=z['g1'].hi
    assert ann<z['ann'] and fee<origfee
    hlo,hhi=z['hh'].lo,z['hh'].hi;t,ell=z['t'],z['ell'];src,pad=z['source'],z['pad']
    pcap=z['pcap'];d,p=z['core'].delta,z['core'].pp;bern=z['core'].lower
    V=A-d;k=1-p*(1+2*g1.hi);U=1-p*(1+6*g0.lo-4*g1.hi)
    J=3*V+2*d*k;NUM=J/6+V*(J+d*U)
    top_margins=[]
    for h in (hlo,hhi):
        y=h-2*ell
        C=min(pcap*h,(2*y-(1+src)*h)/(2+10*src))
        p0=half+Q(13,75)*h-y/2-ell/2-Q('.09')*h+d/2+d*p*(ell-C/2)
        top_margins.append((t-p0)*J-3*h*NUM/4)

    def current_top(box):
        j0=bern(J,box);j1=-bern(-J,box);assert 0<j0<=j1
        mm=min(bern(j,box) for j in top_margins)
        return z['lowerit'](mm/(j1 if mm>=0 else j0))

    def beta(y):return g1.lo*y-g0.hi/2+f(y)

    def check_min(ga,shift,base,kp,vb,f_p):
        """All finite cutoffs are in this closed continuous comparison."""
        def y_at(g):return base-g-3*ann-vb*max(0,g-shift)/kp
        def val(g):return f_p*beta(y_at(g))-kp*(g+3*ann)/2
        points=[(val(0),Q(0)),(val(ga),ga)]
        for l,h in ((Q(0),min(ga,shift)),(min(ga,shift),ga)):
            if l>=h:continue
            yl,yh=y_at(l),y_at(h);s=(yh-yl)/(h-l);assert s<0
            joins=[l,h]
            if yh<SEAM<yl:joins.insert(1,l+(SEAM-yl)/s)
            for x,y in zip(joins,joins[1:]):
                points.extend(((val(x),x),(val(y),y)))
                left=y_at((x+y)/2)<SEAM
                def dd(g):return f_p*s*(g1.lo+fp(y_at(g),left=left))-kp/2
                if dd(x)>=0 or dd(y)<=0:continue
                for _ in range(42):
                    m=(x+y)/2
                    if dd(m)<0:x=m
                    else:y=m
                points.append((min(val(x),val(y))-10*(y-x),x))
        return min(points)

    root=list(z['leaves']); paid_root=0;unpaid=0;nodes=0;branched=0;exterior=0;full=0;worst=None
    ranges=[Q(10),-Q(10)]*3;dig=sha256(); raw_gates={};min_res_signed=None
    def keep(name,v0):
        old=raw_gates.get(name);raw_gates[name]=v0 if old is None else min(old,v0)
    def visit(leaf,depth):
        nonlocal paid_root,unpaid,nodes,branched,exterior,full,worst,min_res_signed
        nodes+=1
        cid,box,nl,nh,*_=leaf;da,db,pa,pb=box
        b_old=z['upperit'](-z['paired_margin'](box));b_new=-current_top(box);B=min(b_old,b_new)
        if B < -10*fee:
            exterior+=1;dig.update(f'{cid}:{box}:current-exterior:{z["lowerit"](-B)}\n'.encode())
            keep('current_clear_paired_margin',-B)
            return
        # Keep the previous physical band for all raw/contour/dilation guards.
        old_budget=max(Q(0),b_old)+10*origfee
        slope=Q(3,4)*(1-db)-Q('.09')-db*pcap/4
        Dlo=hlo-up(old_budget/slope)
        # Clear B(D)/D at the actual top. B(D) decreases more quickly than
        # this affine ray; only the original negligible top padding is separate.
        budget=(max(Q(0),B)+10*fee)/hlo
        assert slope>budget and Dlo*da>Q('.3')
        keep('conductor_slope_minus_normalized_budget',slope-budget)
        Vmin=A-db;km=1-pb*(1+2*g1.hi);kp=1-pa*(1+2*g1.lo)
        # More precise rounding than the geometric support enclosures.
        up_cap=lambda x:z['ceilat'](x,10**13)
        ga=up_cap(4*budget/(3*Vmin));lx=up_cap(4*budget/(3*da*km));ly=up_cap(2*budget/(3*da*km))
        ml=z['tzero'](da,pb,g0.hi,g1.lo)/3; mh=z['tzero'](db,pa,g0.lo,g1.hi)/3
        dn=up(old_budget/(Q('.10')*Dlo))
        keep('reciprocal_allowed_beyond_all_bank_cutoffs',1/(hhi+pad)-dn-3*mh)
        assert raw_gates['reciprocal_allowed_beyond_all_bank_cutoffs']>0
        assert 1<3*ml-ga<=3*mh<Q(3,2)
        assert 3*ml-ga>2*mh+lx+ann
        left=z['lowerit'](ml-ga-lx-2*ann); right=z['upperit'](mh+ly+ann)
        assert Y0<=left<=right<=Y1 and 1<=nl/right and nh/left<=RATIO,(cid,left,right,nl,nh)
        adverse=max(-g1.lo-fp(left),-g1.lo-fp(SEAM) if left<=SEAM<=right else -g1.lo-fp(left))
        max_d=max(g1.lo+fp(right),g1.lo+fp(SEAM,left=True) if left<=SEAM<=right else g1.lo+fp(right))
        assert max_d<0 and pa*adverse<km/2 and beta(right)>0
        assert lx>=Vmin*ga/(db*kp)
        vb=Vmin/db;shift=ga/N+3*ann;base=mh+ann
        cg=ga; y=base-cg-3*ann-vb*max(0,cg-shift)/kp
        assert left<=y<=right
        if pa*adverse*(1+vb/kp)<kp/2:
            v0=pa*beta(y)-kp*(cg+3*ann)/2
        else:
            v0,cg=check_min(ga,shift,base,kp,vb,pa)
            y=base-cg-3*ann-vb*max(0,cg-shift)/kp;full+=1
        val=v0-pb*ann/2-budget/da
        if val<=Q('5e-10') and depth<a.depth:
            branched+=1; da1,db1=(da+db)/2,(pa+pb)/2
            for dl,dh,pl,ph in ((da,da1,pa,db1),(da1,db,pa,db1),(da,da1,db1,pb),(da1,db,db1,pb)):
                child=(dl,dh,pl,ph);margin=z['paired_margin'](child);assert margin is not None
                if margin>5*origfee:
                    exterior+=1;dig.update(f'{cid}:{child}:old-exterior:{z["lowerit"](margin)}\n'.encode());continue
                z['ticket'](cid,child,margin);fresh=z['leaves'][-1];assert fresh[1]==child
                visit(fresh,depth+1)
            return
        paid_root+=1;unpaid+=val<=0
        rec=(val,cid,box,depth,y,cg,beta(y),Dlo*da,min(B,b_old))
        if worst is None or rec[0]<worst[0]:worst=rec
        reserve=val*Dlo*da
        min_res_signed=reserve if min_res_signed is None else min(min_res_signed,reserve)
        ranges[:]=[min(q,r) if i%2==0 else max(q,r) for i,(q,r) in enumerate(zip(ranges,(nl,nh,left,right,nl/right,nh/left)))]
        dig.update(f'{cid}:{box}:{depth}:{cg}:{z["lowerit"](val)}\n'.encode())

    for leaf in root:visit(leaf,0)
    assert paid_root+exterior==len(root)+3*branched
    assert all(min(xs)-Q(15,16)*src-2*pad>3*origfee for xs in z['paid'].values())
    if not unpaid:assert min_res_signed>Q(15,16)*src+2*pad
    out={'status':'PASS_WHOLE_RETURN_CONDITIONAL_ON_ANALYTIC_SOURCES' if not unpaid else 'UNPAID',
         'scope':'Independent finite arithmetic on all original 57 cells. Retains 087 actual primitive, count, physical geometry and padding contracts. No new Lean or independent scientific validation.',
         'c':a.target,'h_add':a.h_add,'h':[str(hlo),str(hhi)],'steps':N,'depth_limit':a.depth,
         'engine_sha256':ENGINE_SHA,'source_receipt_sha256':SOURCE_SHA,
         'exact_tangent_enclosures':{key:[str(xx.lo),str(xx.hi)] for key,xx in [('g0',g0),('g1',g1)]},
         'contact_checker_sha256':sha256((P/'CONTACT_EXACT.py').read_bytes()).hexdigest(),
         'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),
         'geometry':{key:str(q) for key,q in v.items()},'original_tickets':z['s'](z['records']),
         'original_cells':len(z['cover']['cells']),'coarse_central':len(root),'nodes':nodes,'subdivisions':branched,
         'new_exterior':exterior,'terminal':paid_root,'continuous_stationary_nodes':full,'unpaid':unpaid,
         'shape_ranges':z['s'](ranges),'worst':z['s'](worst),'coverage_digest':dig.hexdigest(),
         'new_gates':{key:str(z['lowerit'](xs)) for key,xs in raw_gates.items()},
         'paid_original_gates':{key:str(z['lowerit'](min(xs))) for key,xs in z['paid'].items()},
         'least_normalized_margin':str(z['lowerit'](worst[0])),
         'least_physical_margin':str(z['lowerit'](min_res_signed)),
         'inner_witness_annular_slack':str(ann),'inner_witness_budget_fee_times_ten':str(10*fee),
         'conductor_normalization':'At D<=h, [B(D)+inner fee]_+/D is bounded by (max(0,B_top)+inner fee)/h_lo on the retained ticket. The original exponent allowance separately pays through h+F.'}
    raw=(json.dumps(out,indent=1)+'\n').encode()
    with a.output.open('xb') as f0:f0.write(raw)
    print(json.dumps({'c':a.target,'h_add':a.h_add,'unpaid':unpaid,'normalized':float(worst[0]),'physical':float(min_res_signed),
                      'terminal':paid_root,'exterior':exterior,'sha256':sha256(raw).hexdigest()}))

if __name__=='__main__':
    sys.dont_write_bytecode=True
    main()
