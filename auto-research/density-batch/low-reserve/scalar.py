"""Exact rational Bernstein arithmetic for the widened density source gates.

Builds on Sil's HybridGates and the fourth-density scalar certifier, with the
density floor lowered to 1/2 by the separately proved widened density API.
Arithmetic only. Analytic conclusions are conditional on the preprint's 7/8
theorem. Substantially assisted by OpenAI Codex.
"""
import sympy as sp

Q=sp.Rational
v,t=sp.symbols('v t')

def formulas(B0,L0,c0,B,L,c,A,D):
    s=(B0-B)/(L0-L)
    w=s+v
    X=1+D*v
    u=A*v/X
    E=(L0-L)*X+(6*B0-L0)*A
    q=Q(9999,10000)*L0*A/E
    H=1-6*u
    rho=1-10*q/(15-6*q)
    gs={
      'q_lower':q-Q(1,2),'q_upper':Q(3,4)-q,'q_floor':q-Q(1,2),
      'H_lower':H-Q(9,10),'retained_cap':c0*H-(w-u),'retained_width':w-u,
      'low_per_width':Q(1,10000)*L0*A/X,
      'high_at_q':1-rho-q*B+q*(L-1)*w-(6*(1-rho)-q-1)*u,
      'high_deriv':Q(25,24)*H-(B-(L-1)*w-u),
      'principal':1-B+(L-2)*w-Q(9,2)*u,
      'second_ref':Q(1,20)+Q(3,2)*(1-B)+(Q(3,2)*L-Q(5,2))*w-Q(9,2)*u,
      'second_diag':1-B+(L-1)*w-4*u,'ref_upper':Q(1,3)-2*w-3*u,
      'selection_derivative':A/X**2,
    }
    assert sp.cancel(L0*u-q*((L0-L)*v+(6*B0-L0)*u)-Q(1,10000)*L0*u)==0
    assert sp.cancel((L0*u-q*((L0-L)*v+(6*B0-L0)*u))/v-gs['low_per_width'])==0
    assert sp.cancel(sp.diff(u,v)-gs['selection_derivative'])==0
    return s,gs,{'selection_denominator':X,'density_denominator':E,'high_denominator':15*E-6*Q(9999,10000)*L0*A}

def bernstein(poly,lo,hi):
    p=sp.Poly(sp.expand(poly.subs(v,lo+(hi-lo)*t)),t)
    assert not p.as_expr().has(sp.Float)
    degree=p.degree()
    if degree<0: return [Q(0)]
    return [sum(p.nth(j)*sp.binomial(i,j)/sp.binomial(degree,j) for j in range(i+1)) for i in range(degree+1)]

def prove(expr,hi):
    num,den=sp.fraction(sp.cancel(expr))
    if den.subs(v,0)<0:num,den=-num,-den
    boxes=[]
    todo=[(Q(0),hi,0)]
    while todo:
        lo,up,depth=todo.pop()
        nb,db=bernstein(num,lo,up),bernstein(den,lo,up)
        if min(nb)>0 and min(db)>0:
            boxes.append({'lo':str(lo),'hi':str(up),'numerator_lower':str(min(nb)),
                          'denominator_lower':str(min(db)),'denominator_upper':str(max(db)),
                          'gate_lower':str(min(nb)/max(db))})
        else:
            assert depth<20,(expr,lo,up,min(nb),min(db))
            mid=(lo+up)/2
            todo.extend([(mid,up,depth+1),(lo,mid,depth+1)])
    return {'uniform_lower':str(min(Q(b['gate_lower']) for b in boxes)),
            'numerator':str(num),'denominator':str(den),'boxes':boxes}

def certify(name,values):
    B0,L0,c0,B,L,c,A,D=values
    assert B<=B0<1 and 1<L<L0 and 0<c<Q(1,6) and 0<c0<Q(1,6)
    s,gs,dens=formulas(*values)
    assert 0<=s<c
    receipts={key:prove(value,c-s) for key,value in {**dens,**gs}.items()}
    print(name, 'B=',B,'L=',L,'c=',c,'A=',A,'D=',D,'cross=',s)
    print('  all 14 gates and 3 denominators positive; LOW and derivative identities exact')
    print('  gates:',{key:float(Q(row['uniform_lower'])) for key,row in receipts.items() if key in gs})
    record={'name':name,'parameters':dict(zip(['B0','L0','c0','B','L','c','A','D'],map(str,values))),
            'crossing':str(s),'upper_excess':str(c-s),'gates':receipts}
    for width in [Q(3,50),Q(7,100),Q(1,10)]:
        gain=sp.factor(B-L*width-(B0-L0*width))
        print('  source boundary gain at width',width,':',gain,'=',float(gain))
    return record
