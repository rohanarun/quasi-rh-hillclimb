"""Check the Local088 symmetric supplier against every original physical cell."""
from argparse import ArgumentParser
from contextlib import redirect_stdout
from fractions import Fraction as Q
from hashlib import sha256
from pathlib import Path
import io,json,runpy,sys

from CHECK_SYMMETRIC import f, fp, Y0,Y1,SEAM,RATIO

P=Path(__file__).resolve().parent
R=P.parents[1]
ENGINE_SHA='a308ae97ee8a5a0f77c067bd6f2d494f7ccf40a071bc8029f08a616502406169'

def geometry(z):
    hl,hh=z['hh'].lo,z['hh'].hi; pad,s=tiny=z['pad'],z['source']
    ell,t=z['ell'],z['t'];pcap,declared=z['pcap'],z['declared']
    yl,yh=hl-2*ell,hh-2*ell; xl,xh=1+ell-hh,1+ell-hl; D=hh+pad
    vv={
      'bounded_positive_row_pad':min(pad/4,Q('1e-10')-pad/2),
      't_window':min(t-Q('.873'),Q('.875')-t),
      'ell_window':min(ell-Q('.1672'),Q('.175')-ell),
      'y_window':min(yl-Q('.458'),Q('.473')-yh),
      'h_window':min(hl-Q('.793'),Q('.865')-D),
      'fractional_row_geometry':min(hl-Q('.5'),1-D,Q(7,8)-D,2*yl-D),
      'prime_slot_supply':ell/D-Q('.2'),
      'small_no_heights':Q(49,150)*hl-ell-Q('.02')-Q('.07'),
      'feedback_coefficient':Q('.02')-5*D/288,
      'floor_y_over_d0_below_99':99*Q('.005')-yh,
      'floor_margin':t-(Q('.51')+hh/3+Q('.51')*ell+Q('.66')*pad)-Q('1e-5')-Q('1e-12')-Q('.001'),
      'principal_w':yl/20-Q('.001')*(1+hh)-Q(1,4000),
      'principal_z':hl/600-Q('.001')-Q(1,4000),
      'gram':min(xl-ell,yl-xh,Q('.5')-yh,2*xl-yh-ell,1-5*ell,xl/2+(yl-xh)/12-Q('.1')),
      'top_physical_cap':pcap*hl-(hh/2-2*ell),
      'declared_cap':min(declared-pcap,Q('.15')-1000*s/1143-declared),
      'GT_source_guard':1-((1-s)/2+(Q('4.5')-(2+10*s)/2)*declared),
      'small_physical':Q(49,150)*hl-5*ell/4+Q(13,600),
      'principal_w_original':Q(49,1000)*hl-ell/10-Q(1,800),
      'principal_z_original':hl/600-Q(1,800),
    }
    assert t==Q(11,12)-ell/4 and pad/2+2*(pad/4)==pad and min(vv.values())>0
    return vv

def directed_stationary(l,h,weight,slope,glo):
    """Beta has increasing derivative on each piece. Include outward root pairs."""
    result=[]; eps=Q(0)
    if weight==0:return result,eps
    for a,b,left in ((max(l,Y0),min(h,SEAM),True),(max(l,SEAM),h,False)):
        if a>=b:continue
        def derivative(x):return weight*(glo+fp(x,left=left))+slope
        if derivative(a)>=0 or derivative(b)<=0:continue
        for _ in range(64):
            m=(a+b)/2
            if derivative(m)<0:a=m
            else:b=m
        result.extend((a,b));eps=max(eps,10*(b-a))
    return result,eps

def main():
    ap=ArgumentParser(description=__doc__)
    ap.add_argument('--target',required=True);ap.add_argument('--h-add',required=True)
    ap.add_argument('--steps',type=int,default=4096);ap.add_argument('--depth',type=int,default=5)
    ap.add_argument('--output',required=True,type=Path)
    a=ap.parse_args(); N=a.steps
    assert not a.output.exists() and 1<=N<=4096
    engine=R/'cycle087'/'near_record'/'EXTENDED_ENGINE.py'
    assert sha256(engine.read_bytes()).hexdigest()==ENGINE_SHA
    sys.argv=[str(engine),'--target',a.target,'--h-add',a.h_add]
    with redirect_stdout(io.StringIO()):z=runpy.run_path(str(engine),run_name='__main__')
    v=geometry(z);g0,g1=z['g0'],z['g1'];ann=z['ann'];fee=z['fee'];up=z['upnm']
    profile_cert=P/'SYMMETRIC_SOURCE.json'
    # Finite cover never supplies its own analytic premise. A completed run also binds source arithmetic.
    ps=sha256(profile_cert.read_bytes()).hexdigest() if profile_cert.exists() else None
    root=list(z['leaves']); worst=None; unpaid=nodes=subdivisions=exterior=terminal=reduced=0
    dig=sha256();ranges=[Q(10),-Q(10)]*3

    def assess(leaf):
        cid,box,nl,nh,yl,yh,_=leaf
        d,b,f_p,e=box
        B=z['upperit'](-z['paired_margin'](box));budget=max(Q(0),B)+10*fee
        D=z['hh'].lo-up(budget/(Q(3,4)*(1-b)-Q(9,100)-b*z['pcap']/4)); V=Q(5,6)-b
        assert D*d>Q('.3')
        km=1-e*(1+2*g1.hi);kp=1-f_p*(1+2*g1.lo)
        ga=up(Q(4,3)*budget/(D*V));lx=up(Q(4,3)*budget/(D*d*km));ly=up(Q(2,3)*budget/(D*d*km))
        ml=z['tzero'](d,e,g0.hi,g1.lo)/3;mh=z['tzero'](b,f_p,g0.lo,g1.hi)/3
        left=z['lowerit'](ml-ga-lx-2*ann);right=z['upperit'](mh+ly+ann)
        assert right<=Y1 and 1<=nl/max(Y0,right) and nh/max(Y0,left)<=RATIO,(cid,left,right,nl,nh)
        bot=max(Y0,left)
        adverse=max(-g1.lo-fp(bot),-g1.lo-fp(SEAM) if bot<=SEAM<=right else -g1.lo-fp(bot))
        maximal_derivative=max(g1.lo+fp(right),g1.lo+fp(SEAM,left=True) if bot<=SEAM<=right else g1.lo+fp(right))
        reduction=left>=Y0 and maximal_derivative<0 and f_p*adverse<km/2 and f_p*adverse*(1+V/(b*kp))<kp/2 and lx>=V/(b*kp)*max(0,ga-3*ann)
        js=(N,) if reduction else range(N+1)
        mini=None
        for j in js:
            gj=ga*j/N;prev=ga*max(0,j-1)/N
            l=z['lowerit'](ml-gj-lx-2*ann);h=right
            floor=-kp*(gj+3*ann);gm=V/b*max(0,prev-3*ann);mid=mh+ann
            cross=mid+(floor-gm)/kp
            if reduction:
                assert l<=cross<=h
                ys={cross};err=Q(0)
            else:
                ys={l,h};err=Q(0)
                for x in (Y0,SEAM,cross,mid,mid+gm/(2*km)):
                    if l<x<h:ys.add(x)
                for weight in (f_p,e):
                    for sl in (Q(0),km/2,kp/2,3*km/2):
                        rr,er=directed_stationary(l,h,weight,sl,g1.lo);ys.update(rr);err=max(err,er)
            for y in ys:
                yr=max(Y0,y);dy=y-mid
                size=max(floor,(kp if dy<0 else km)*dy+max(gm,2*km*max(0,dy)))
                width=g1.lo*yr-g0.hi/2+f(yr)-(1+2*g1.hi)*(yr-y)/2
                assert width>=0 # checked for full domain separately below, even between candidate extrema
                val=f_p*width+size/2-e*ann/2-budget/(D*d)-err
                out=(val,y,j,width,D*d)
                if mini is None or out<mini:mini=out
        # Uniform positivity of the effective additional width. It can only fall
        # to its endpoint values or the zero of the increasing beta derivative.
        if not reduction:
            pset={left,right}|{x for x in (Y0,SEAM) if left<x<right}
            rr,er=directed_stationary(left,right,Q(1),Q(0),g1.lo);pset.update(rr)
            for y in pset:
                yr=max(Y0,y)
                assert g1.lo*yr-g0.hi/2+f(yr)-(1+2*g1.hi)*(yr-y)/2>er
        else:
            assert g1.lo*right-g0.hi/2+f(right)>0
        return mini,(nl,nh,left,right,nl/max(Y0,right),nh/max(Y0,left)),reduction

    def inspect(leaf,depth):
        nonlocal worst,unpaid,nodes,subdivisions,exterior,terminal,reduced
        nodes+=1;cid,box,*_=leaf;mini,shape,quick=assess(leaf)
        if mini[0]<=Q('1e-8') and depth<a.depth:
            subdivisions+=1;d,b,f_p,e=box;dd=(d+b)/2;ff=(f_p+e)/2
            children=((d,dd,f_p,ff),(dd,b,f_p,ff),(d,dd,ff,e),(dd,b,ff,e))
            for child in children:
                margin=z['paired_margin'](child);assert margin is not None
                if margin>5*fee:
                    exterior+=1;dig.update(f'{cid}:{child}:exterior:{z["lowerit"](margin)}\n'.encode());continue
                z['ticket'](cid,child,margin) # preserved original height, contour, dilation and true source gates
                adding=z['leaves'][-1];assert adding[1]==child
                inspect(adding,depth+1)
            return
        terminal+=1;reduced+=quick;unpaid+=mini[0]<=0
        val,y,j,W,dd=mini;rec=(val,cid,box,depth,y,j,W,dd,dd*val)
        if worst is None or rec[0]<worst[0]:worst=rec
        ranges[:]=[min(q,r) if i%2==0 else max(q,r) for i,(q,r) in enumerate(zip(ranges,shape))]
        dig.update(f'{cid}:{box}:{depth}:{j}:{z["lowerit"](val)}\n'.encode())

    for leaf in root:inspect(leaf,0)
    assert terminal+exterior==len(root)+3*subdivisions
    assert all(min(xs)-Q(15,16)*z['source']-2*z['pad']>3*fee for xs in z['paid'].values())
    ret={'status':'PASS_WHOLE_RETURN_CONDITIONAL_ON_ANALYTIC_SOURCES' if not unpaid else 'UNPAID',
         'c':a.target,'h_add':a.h_add,'h':[str(z['hh'].lo),str(z['hh'].hi)],'steps':N,'depth_limit':a.depth,
         'assumptions':'Original OpenAI through N, 087 extended paired and high-conductor contracts; symmetric 088 source. No independent proof validation or Lean run.',
         'engine_sha256':ENGINE_SHA,'source_check_receipt_sha256':ps,
         'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),
         'geometry':{k:str(q) for k,q in v.items()},'original_tickets':z['s'](z['records']),
         'original_count_cells':len(z['cover']['cells']),'coarse_central':len(root),'nodes':nodes,'subdivisions':subdivisions,
         'new_exterior':exterior,'terminal':terminal,'last_cutoff_only':reduced,'unpaid':unpaid,
         'shape_ranges':z['s'](ranges),'worst':z['s'](worst),'coverage_digest':dig.hexdigest(),
         'paid_original_gates':{k:str(z['lowerit'](min(xs))) for k,xs in z['paid'].items()},
         'worst_lower_normalized_price':str(z['lowerit'](worst[0])),
         'positive_physical_reserve':str(z['lowerit'](worst[0]*Q('.3'))) if worst[0]>0 else None}
    data=(json.dumps(ret,indent=1)+'\n').encode()
    with a.output.open('xb') as out:out.write(data)
    print(json.dumps({'c':a.target,'h_add':a.h_add,'steps':N,'unpaid':unpaid,'worst':float(worst[0]),'y':float(worst[4]),
                      'coarse':len(root),'terminal':terminal,'reduced':reduced,'new_exterior':exterior,'sha256':sha256(data).hexdigest()}))

if __name__=='__main__':
    sys.dont_write_bytecode=True
    main()
