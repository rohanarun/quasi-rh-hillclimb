"""Adaptive per-stage caps: child cap = min(final_cap, prev_bx + margin); diagnostic."""
import sys, json, numpy as np, search, search_model as model
def run(step, final_cap, target, margin, steps=100000, const=False):
    parent=(1.0, model.K, 0.055); prev_bx=0.0; nodes=[]
    L=model.K
    for i in range(steps):
        cap = final_cap if const else min(final_cap, max(prev_bx + margin, 0.0))
        r = search.next_source(parent, step, cap, target)
        if r is None and not const:
            # try with final cap
            cap = final_cap; r = search.next_source(parent, step, cap, target)
        if r is None: break
        B, Lc, q = r
        bx = (parent[0]-B)/step
        prev_bx = bx
        nodes.append((B, Lc, q, cap, bx))
        parent=(B, Lc, cap)
    return nodes
if __name__=="__main__":
    step=float(sys.argv[1]); fc=float(sys.argv[2]); tgt=float(sys.argv[3]); margin=float(sys.argv[4]); const=sys.argv[5]=='const'
    n=run(step,fc,tgt,margin,const=const)
    print(json.dumps({"stages":len(n),"last":n[-1],"caps_first":[x[3] for x in n[:3]],"bx_first":[x[4] for x in n[:3]]}))
    json.dump(n, open(sys.argv[6],'w'))
