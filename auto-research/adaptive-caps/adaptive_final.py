"""Chain with adaptive per-stage caps (prev crossing + margin) and a final stage
at the cap the return needs. Floating-point search; candidates only.
Output nodes in the sources.json format (ids vector_i), exact decimal strings."""
import sys, json
from decimal import Decimal
import search, search_model as model

def run(step, final_cap, target, margin, out):
    parent = (1.0, model.K, 0.055); prev_bx = 0.0; nodes = []; i = 0
    stepD = Decimal(step)
    while True:
        cap = min(float(final_cap), prev_bx + margin) if i > 0 else float(final_cap)
        capstr = format(cap, ".12f") if cap != float(final_cap) else final_cap
        cap = float(capstr)
        r = search.next_source(parent, float(step), cap, target)
        if r is None:
            break
        B, L, q = r
        prev_bx = (parent[0] - B) / float(step)
        i += 1
        nodes.append({"id": f"vector_{i}", "B": format(B, ".14f"),
                      "L": str(Decimal("4.4973108") - stepD * i), "cap": capstr,
                      "q": format(q, ".14f"), "low": "natural" if i == 1 else f"vector_{i-1}",
                      "high": "natural" if i == 1 else f"vector_{i-1}"})
        parent = (B, L, cap)
    # replace the last node by a final-cap node from its parent, if needed
    while nodes and nodes[-1]["cap"] != final_cap:
        last = nodes.pop(); i -= 1
        par = (1.0, model.K, 0.055) if not nodes else (float(nodes[-1]["B"]), float(nodes[-1]["L"]), float(nodes[-1]["cap"]))
        r = search.next_source(par, float(step), float(final_cap), target)
        if r is None:
            continue
        B, L, q = r; i += 1
        nodes.append({"id": f"vector_{i}", "B": format(B, ".14f"),
                      "L": str(Decimal("4.4973108") - stepD * i), "cap": final_cap,
                      "q": format(q, ".14f"), "low": last["low"], "high": last["high"]})
    json.dump(nodes, open(out, "w"), indent=2)
    print(json.dumps({"stages": len(nodes), "last": nodes[-1]}), flush=True)

if __name__ == "__main__":
    run(sys.argv[1], sys.argv[2], float(sys.argv[3]), float(sys.argv[4]), sys.argv[5])
