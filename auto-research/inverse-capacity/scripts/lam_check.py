import numpy as np, sympy as sp
from lam_model import rstar, make_I, make_P_source
import return_model as RM
BC,LC=0.96259643646619,3.1519358
d=np.array([0.3,0.4,0.458,0.5,0.6]); p=0.5*np.ones_like(d)
R,t,r=rstar(d,p,make_I(2,1.0),make_P_source(BC,LC,10,1.0))
m=RM.Model(BC,LC,0.96771143048276,3.2768108)
f,_=RM.branch_exprs(BC,LC,0.96771143048276,3.2768108,4.4973108)["C"]
print("generic lam=2:",R); print("Collet N/J C :",f(d,p)); print("t*,r*",t,r)
