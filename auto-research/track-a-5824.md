# Track A: exact final-section certificate at N = 5824

Date: 2026-10-22. Sagar Thakrar (@thakrarsagar), with Codex (AI-assisted).
This builds on Rohan Arun and Claude's exponent budget, exact Bernstein
certifier, hill-climb harness, and written audits. The starting repository
commit was `e4cf5a2b1f967746b36606d3352549ee598e373f`.

**Status: certified, final section only.** The new point is

\[
\ell=\frac16+\frac1{5824}=\frac{2915}{17472},\qquad
h=\frac{405967}{500000},\qquad
\sigma_0=\frac{11}{12}-\frac\ell4
=\frac{20383}{23296}=\frac78-\frac1{23296}.
\]

The boundary is approximately `0.8749570741758242`. Its exact improvement
over the previous N = 5826 certificate is
`10195/11652 - 20383/23296 = 1/67861248` (about `1.474e-8`).
This is an improvement within the original Track A family; the separate
source-moment endpoint `0.8747729897` remains stronger.

## Reproduction

From the repository root, with Python and the documented dependencies:

```sh
pip install numpy scipy sympy
python certify.py 5824 405967/500000
python auto-research/audit_5824.py
python auto-research/hillclimb.py
```

Executed with Python 3.13.5, SymPy 1.14.0, NumPy 2.5.4 and SciPy 1.18.1.
NumPy and SciPy are used for candidate search; the certificate and audit
checks use exact rational arithmetic.

The certifier's previous depth limit of 20 returned `False` for this point.
That was an unresolved subdivision, not a counterexample. The successful
subdivision reaches depth **21**, so the default is now **22**. No exponent,
side constraint, or Bernstein formula was changed. The search now defaults
to unit N steps and depth 22 so it reaches this point.

Output of `python certify.py 5824 405967/500000`:

```text
ell = 2915/17472  h = 405967/500000  ->  sigma0 = 20383/23296 = 7/8 - 1/23296  (~0.87495707)
check paper point: sigma0(1/6) = 7/8
J>0 on box: True
adaptive endpoint F>0 on delta in [0,5/6], y in [0,1/2]: True  (26 boxes)
   smallest Bernstein lower bound among boxes: 2.466e-06
   OK  floor bin (delta0=1/50, R=1, q=delta0/2): -E(h): 82433/14000000 (~0.00589)
   OK  delta=5/6 endpoint (R=1-delta, q=delta/2): -E(h): 19735241/273000000 (~0.07229)
   OK  intermediate d=1/2, delta=1/50: 18802337/87500000 (~0.21488)
   OK  intermediate d=1/2, delta=5/6: 108052493/40950000000 (~0.00264)
   OK  small rows: -(h(z0-1/6) - l_y/2 + 2 d_min): 267517489/3412500000 (~0.07839)
   OK  prime supply at d=h: ell/h - 7/37: 133628501/8201345334 (~0.01629)
   OK  extension room: 5 ell - h (paper uses zeta < 5ell-h): 6076393/273000000 (~0.02226)
   OK  b > 0: 11225113/91000000 (~0.12335)
   OK  low side: l_x - ell: 94033/500000 (~0.18807)
   OK  low side: l_y - ell - 11b/6: 46558471/546000000 (~0.08527)
   OK  low side: M - 2 ell = 1 - 3 ell: 2909/5824 (~0.49948)
   OK  high margin coefficient 1 - h/4: 1594033/2000000 (~0.79702)
paper point (1/6, 13/16) certifies: True
```

The **exact** minimum Bernstein coefficient among the 26 accepted boxes is
`564781781/229008998400000 > 0`. This is a lower bound for
`F = 108 J (-E_*)`, not directly for `-E_*`. The denominator is also certified
positive on the full rectangle. The following reproduces the bound and
checks that the recursive subdivision has total area `5/12`:

```python
from fractions import Fraction as Q
import sympy as sp
import certify as c

F, J108 = c.adaptive_poly(Q(1, 6) + Q(1, 5824), Q(405967, 500000))
box = ((sp.Rational(0), sp.Rational(5, 6)),
       (sp.Rational(0), sp.Rational(1, 2)))
leaves = []
assert c.prove_positive(J108, box)
assert c.prove_positive(F, box, log=leaves)
assert len(leaves) == 26
assert min(v for _, v in leaves) == sp.Rational(564781781, 229008998400000)
assert sum((b[0][1]-b[0][0])*(b[1][1]-b[1][0]) for b, _ in leaves) == sp.Rational(5, 12)
```

Regression checks also passed for `python certify.py` (the audited
N = 5900 point), `python certify.py 5826 405967/500000`, and the paper anchor
checked by each invocation. Each invocation gave three `True` results and
all 12 `OK` side constraints. The default hill-climb returned the N = 5824
point. Its earlier unsuccessful N = 5820–5823 trials are **not** proofs of
infeasibility, and no optimality claim is made here.

## Recomputed numerical margins and paper locations

[`audit_5824.py`](audit_5824.py) asserts **21 positive exact margins**, the
boundary improvement, and the identity `C(sigma0) = l_x/2 + b/12`. It
recomputes the numerical margins used in `AUDIT_SUMMARY.md` and the related
A, B and F audit tables; it does not repeat the analytic proofs.

The source is the preprint's
[`build/paper.tex`](https://github.com/openai/math/blob/main/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex).
Line coordinates below follow the existing audits. The Euler formulas at
lines 4000–4190 were also checked against the upstream file (blob SHA
`268c4e3206d460c617d3d2129742a72b831b3def`).

| Paper lines / audit dependency | Recomputed exact value or margin |
|---|---|
| 4056, 4171–4185: second Euler region, good primes | Exponent `-sigma0 - 47/50`; margin below `-1` is `474631/582400` |
| 4171–4178: primes dividing u | Exponent `1/20 - sigma0 = -96091/116480 < 0` |
| 4151: Euler remainder, before the removable vartheta loss | Exponent `301/100 - 6 sigma0 = -652213/291200 < -1` |
| 4184–4185: retain c_H = 4/5 | Tail exponent minus `4/5` is `8711/582400 > 0` |
| 9052–9074, 15553–15620: compensated Euler errors | `301/100 - 5 sigma0 < -sigma0` with margin `71319/145600`; `-47/50 < -sigma0` with margin `37881/582400` |
| 6418, 9134: contour region and epsilon0 | `epsilon0 = sigma0 - 1/2 = 8735/23296 > 1/4` |
| 8116–8325: completed-row norm | Loss envelope `((d - 1 + 5 ell)/4)_+`; supremum for `d < ell` is `3/11648` |
| 8626–8632: corrected low exponent | `1 - 5 ell = 2897/17472 > 0`, so both branches of `-d + ((d - 1 + 5 ell)/8)_+` are negative for `d > 0` |
| 8593–8597: length bounds | `M' >= 2909/5824 > 0`; `l_y - d >= 28339119/91000000 > 0`; the margins over `3/16` and `1/12` in the other two length bounds are `283/500000` and `1058471/546000000` |
| 8641–8648, 15511–15521, 15644–15647: low/Mellin scale | `C(s) = s - 375225113/546000000`; `C(sigma0) = 205002899/1092000000 = l_x/2 + b/12` |
| 15673–15676: residue margins | `m_w = 16320529/682500000 > 0`; `m_z = 405967/300000000 > 0` |
| 15726–15736, 15876–15889, 15900: final-section constants | `C0 = -7605133/364000000`; small-row exponent `-335767489/3412500000`; `B0 = 301339119/182000000` |
| 15926–15946: live-endpoint coefficient | `1/2 + 3 ell/2 - h = -11225113/182000000 < 0` (the endpoint remains unnecessary when delta <= 3/4) |
| 15994–16072: balanced-endpoint certificate | Positive on the full delta/y rectangle, as certified above |
| 15386, 16114–16126: supply and extension | `ell/h - 8/39 = 78571/221657982 > 0`; `5 ell - h - 1/48 = 129631/91000000 > 0` |
| 16146–16165: intermediate endpoint at delta = 3/4 | `-E(1/2) = 1331425349/54600000000 > 0` |
| 15613–15619, 16304–16306: principal price | `sigma0 - 7/16 = 10191/23296 > 0`, permitting the same choice `kappa_P = 7 ell/(16 K)` |

In particular, the old row-norm loss constant `3/11800` does **not** remain
valid at this point; it must be replaced by `3/11648`. The corrected low
estimate still has the required sign. Historical audit files and result
rows have been left unchanged.

## Conditions and remaining obligations

The proposed zero-free interpretation is conditional on the preprint's
`7/8` theorem (supplying `beta* <= 7/8` and plain capacity `2/9` at
`kappa = 3/4`) and the edits in [`AUDIT_SUMMARY.md`](../AUDIT_SUMMARY.md).
In particular, the second Euler region must extend to `sigma0`, the
completed-row norm must retain its clipped loss, and the final argument
must use `Delta' = beta* - sigma0` and `C(sigma0)`.

This contribution verifies the final-section arithmetic and recomputes the
listed numerical audit margins. It does **not** supply a patched preprint,
a new line-by-line audit of all uses of the edited lemmas, a check of the
previously unaudited lines 1–3723, or a Lean proof of the endpoint. The
audited point remains N = 5900. Stronger claims about the complete theorem
require those analytic obligations to be checked at the new point.
