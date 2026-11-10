"""Exact scalar replay for a local improvement of the PR #103 long inverse count.

Pass Sussman's pinned return103.py and Bebel's pinned Tuning/Data.lean as inputs.
Only the named arithmetic checks run. The analytic saving remains an assumption.
"""

from fractions import Fraction as F
from hashlib import sha256
from pathlib import Path
import re
import sys


def read_pinned(path, digest):
    data = Path(path).read_bytes()
    if sha256(data).hexdigest() != digest:
        raise ValueError(f"Unexpected content at {path}")
    return data.decode("utf-8")


def load_inputs(helper_path, data_path):
    helper = read_pinned(helper_path, "229bc01f91c5984f03ff2feb8ce9a3671bba010b6a6a6f20f3997577aacc6ff8")
    data = read_pinned(data_path, "911a3f5fbefa5f34b53e3dc5dd3cb4a699e998f1783bc7d63b88e71d3780f5ad")
    replay = {"__name__": "return103"}
    exec(compile(helper, str(helper_path), "exec"), replay)

    def rational(name):
        match = re.search(rf"^def {name} : ℚ := (\d+) / (\d+)$", data, re.M)
        return F(int(match[1]), int(match[2]))

    names = dict(c="cQ", h="hQ", reserve="reserveQ", CB="countBQ", CL="countLQ",
                 Ccap="countCapQ", PB="physBQ", PL="physLQ", Pcap="physCapQ",
                 numCap="numCapQ", dm="dmQ")
    incumbent = {key: rational(name) for key, name in names.items()}
    extension = re.search(r"^def dpQ : ℚ := hQ \+ 1 / (\d+)$", data, re.M)
    incumbent["ext"] = F(1, int(extension[1]))
    return replay, incumbent


def check(replay, incumbent):
    add, sub, mul, scale, const = (
        replay[name] for name in ("add", "sub", "mul", "smul", "const")
    )
    theta, height = F(".87338"), F(".80968635")
    gap = F(1, 10**10)
    k = replay["base_constants"](dict(incumbent, c=1-theta, h=height,
        CB=1-gap, PB=1-gap, CL=2+10*gap, PL=2+10*gap, reserve=10*gap, ext=gap))
    ell, x, y, dp = (k[name] for name in ("ell", "x", "y", "dp"))
    dm = k["dm"]
    cut = height-F(1, 20000)
    signal = x/2+(y-x)/12
    q = 777-852*theta
    assert q > 0 and q*q > 1081
    assert theta < 1-incumbent["c"]
    assert incumbent["CB"] >= k["CB"] and incumbent["CL"] <= k["CL"]
    assert incumbent["PB"] >= k["PB"] and incumbent["PL"] <= k["PL"]
    assert incumbent["ext"] <= k["ext"] and incumbent["reserve"] <= k["reserve"]
    assert F(".873") < theta < F(7, 8)
    assert F(".793") < height < F(".813")
    assert F(".458") < y < F(".473") and F(".1672") < ell < F(".175")
    assert y/2-height*(F(17, 50)-F(1, 6))-F(1, 50) > F(7, 100)
    assert F(4, 25)*x-F(3, 20)-F(51, 100)*y+F(67, 100)*dp-F(3, 20)*ell <= signal-F(1, 10000)
    assert F(1, 6) < ell < F(1, 5) and ell < x < y < F(1, 2)
    assert x+y == 1-ell and 2*x-y-ell > 0 and 1+3*ell-2*(x+y) < 0
    assert theta-(4+y-x)/6 == signal
    assert 0 <= k["numCap"] < F(1, 5) and 0 < k["PB"] <= 1
    assert 2 <= k["PL"] <= F(9, 2)
    assert F(3, 4) < dm < cut < dp < 1 and y < dm < 2*y
    assert 0 <= 1-k["PB"]/2-(F(9, 2)-k["PL"]/2)*k["numCap"]
    assert ell/dp > F(1, 5) and F(7, 10) <= k["kappa"] <= k["naturalK"]/6
    windows = replay["WINDOWS"]
    assert all(replay["window_ok"](k, window)[0] for window in windows)

    dlo, dhi, plo, half = F(".417"), F(".435"), F(".499"), F(1, 2)
    local = (dlo, dhi, plo, half)
    full = (F(0), F(3, 4), F(0), half)
    assert any(branch == "C" and lo <= dlo <= dhi <= hi and floor <= plo
               for branch, lo, hi, floor in windows)
    eta, step, gain = F(1, 64000), F(1, 8750), F(1, 15000)
    lower_band, upper_band = F(1, 24000), F(1, 8500)
    mesh = F(1, 10**7)
    assert step+mesh < upper_band
    b = replay["branch_polys"](k, "C")
    j, n, den, a, dj = (b[name] for name in ("J", "N", "D", "A", "DJ"))

    # Absolute enclosure of the two crossings used in the factorization note.
    for numerator, lo, hi in ((b["RN"], F(".750"), F(".756")),
                              (b["MN"], F(".375"), F(".378"))):
        assert replay["bern_pos"](sub(numerator, scale(lo, dj)), *local)
        assert replay["bern_pos"](sub(scale(hi, dj), numerator), *local)
    assert replay["bern_pos"](sub(b["T"], scale(F(22503, 20000), j)), *local)
    delta, p = replay["X"], replay["Y"]
    one_minus_p = sub(const(1), p)
    v = replay["V"]()
    t_new = add(b["T"], scale(step, j))
    r_new = add(b["RN"], scale(step, mul(a, j)))
    m_new = add(b["MN"], scale(step, mul(one_minus_p, j)))
    count = sub(n, scale(eta, j))
    natural_tail = sub(sub(const(1), scale(2*k["naturalM"], delta)),
                       scale(2*k["sMinus"], mul(delta, p)))
    # These polynomials have positive denominators on the original C window.
    local_checks = {
        "short count gain": sub(scale(step, mul(mul(delta, one_minus_p), a)), scale(eta, den)),
        "long count gain": sub(const(gain-eta), scale(step, v)),
        "old inverse bound below lower band": sub(scale(lower_band, v), const(eta)),
        "cutoff lower": sub(t_new, j),
        "cutoff upper": sub(scale(F(12499, 10000), j), t_new),
        "crossing inverse lower": sub(r_new, scale(F(23, 37), dj)),
        "crossing inverse upper": sub(dj, r_new),
        "crossing plain lower": sub(m_new, scale(replay["lowerM"](k, "C")+mesh, dj)),
        "crossing plain upper": sub(scale(replay["upperM"](k, "C"), dj), m_new),
        "natural tail": sub(count, mul(natural_tail, j)),
        "short baseline": sub(count, mul(sub(const(1), delta), j)),
        "long band lies above 1": sub(b["T"], scale(1+lower_band, j)),
    }
    for label, poly in local_checks.items():
        assert replay["bern_pos"](poly, *local), label

    def check_cover(name, cover, boxes):
        assert all(cover.cover(30, *box) for box in boxes), name
        print(f"{name}: passed ({cover.nodes} nodes, depth {cover.maxdepth})")

    for edge in ("oldSmall", "oldSwitch", "newSwitch"):
        check_cover(edge, replay["Cover"](k, edge, windows), [full])
    split_cover = replay["Cover"](k, "newTop", windows)
    capacity = min(k["numCap"]*cut, (2*y-(2-k["PB"])*cut)/k["PL"])
    old = replay["old_polys"](k)
    split_cover.old_row = replay["row"](k, cut, capacity, old["J"], old["N"])
    split_cover.win_rows = [
        (w, replay["row"](k, cut, capacity, g["J"], g["N"]))
        for w in windows for g in [replay["branch_polys"](k, w[0])]
    ]
    check_cover("conductor split", split_cover, [full])
    top = replay["Cover"](k, "newTop", windows)
    check_cover("top outside local window", top, [
        (F(0), dlo, F(0), half), (dhi, F(3, 4), F(0), half), (dlo, dhi, F(0), plo)
    ])
    d, capacity = replay["edges"](k)["newTop"]
    uncorrected = replay["row"](k, d, capacity, j, n)
    corrected = replay["row"](k, d, capacity, j, count)
    witness = (F(".42608"), half)
    assert replay["ev"](uncorrected, *witness) < 0 < replay["ev"](corrected, *witness)
    positive, quotient_negative, _, _ = replay["contact_ok"](corrected, dlo, dhi, plo)
    assert positive and quotient_negative
    print("top within local window: positive quadratic and negative quotient")
    print("75 inherited guards, 12 local inequalities, geometry and negative control passed")
    print(f"theta = {theta} ({float(theta):.5f}); open long inverse exponent saving = {gain}")
    return k, local_checks, local, corrected, uncorrected


if __name__ == "__main__":
    if len(sys.argv) != 3:
        raise SystemExit("Usage: python3 -B replay.py PINNED_RETURN103.py PINNED_DATA.lean")
    check(*load_inputs(*sys.argv[1:]))
