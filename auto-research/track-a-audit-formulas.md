# Track A: source-checked audit formulas

AI-assisted audit follow-up, 2026-10-22. This supplies the non-adaptive arithmetic and edit map for the new rational geometry; it is **not a complete theorem proof, a fresh line-by-line audit, or a Lean proof**. The analytic argument remains conditional on the preprint's `Re s > 7/8` theorem and on correctly implementing the audit edits. The existing audit reports remain historical checks at N=5900.

**Pinned primary source.** All paper line numbers below were checked directly in `openai/math`, commit [`1581d4cbdd69a0faf34b2089614fe2a814316a6a`](https://github.com/openai/math/commit/1581d4cbdd69a0faf34b2089614fe2a814316a6a), file `preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex`, Git blob `268c4e3206d460c617d3d2129742a72b831b3def` (16,677 lines). The latest commit touching that path is [`adc7f1241b42e322a6451854ab7e4b4c146bf78a`](https://github.com/openai/math/commit/adc7f1241b42e322a6451854ab7e4b4c146bf78a), 2026-10-06. Read against local guidance, `AUDIT_SUMMARY.md`, and reports A–F at repository base `e4cf5a2b1f967746b36606d3352549ee598e373f`.

**No new endpoint is claimed.** [PR #12](https://github.com/rohanarun/quasi-rh-hillclimb/pull/12), opened during this work, independently submits the same **N=5824, h=405967/500000** point. Its [certificate report at commit 9fa8611](https://github.com/thakrarsagar/quasi-rh-hillclimb/blob/9fa86113ccf025d53812e9a540ad928d2a53ab0f/auto-research/track-a-5824.md) records the new endpoint. This contribution adds the pinned-source edit map, exact bounds over a parameter rectangle, the compact polynomial identity, and an independent certificate with a negative control. It builds on Rohan Arun and Claude's existing budget and audit, without duplicating PR #12's code or record updates.

## Geometry and normalization

For a rational pair `(ell,h)`, use

```text
ell = 1/6 + 1/N                     sigma0 = 11/12 - ell/4 = 7/8 - 1/(4N)
M = 1-ell                          lx = 1+ell-h
ly = h-2ell                        b = 2h-1-3ell = ly-lx
c = 1-lx/2-h/6 = 1/2-ell/2+h/3     C(s) = s-c
L = lx/2+b/12 = 5/12+ell/4-h/3      C(sigma0) = L
C0 = 1/2+ell/2+h/3-sigma0 = -5/12+3ell/4+h/3.
```

These are substitutions in the general Mellin exponent and the geometric identities, not permission to change every occurrence of `1/6` or `5/6`: the pole of `zeta(6z)` and sixth-power amplification stay unchanged. [Mellin exponent, 5584–5590][p-mellin]; [geometry, 6857–6869][p-geometry].

At N=5824 and h=405967/500000:

| Quantity | Exact value |
|---|---:|
| ell; sigma0 | 2915/17472; 20383/23296 |
| lx; ly; M | 96888893/273000000; 16320529/34125000; 14557/17472 |
| b; c; L | 11225113/91000000; 375225113/546000000; 205002899/1092000000 |
| C0 | -7605133/364000000 |

For N=5825, `sigma0=40773/46600`. All formulas below apply to either N.

## Euler region and principal normalization: audit items 1 and 5

Replace the second region's lower bound by `x_r >= sigma0`, retaining `z_r >= 33/200`, `w_r >= 19/20`. The following are the exact replacements for the summary's rounded exponents; comparison with the remaining terms in the local table is valid in the candidate range here. [Local factors, region and defect comparison, 3861–4185][p-euler].

| Quantity | Formula | N=5824 value / required condition |
|---|---|---|
| Good-prime defect exponent | `1-sigma0-19/20-6(33/200) = -sigma0-47/50` | `-1057031/582400 < -1` |
| Defect at p dividing u | `1-sigma0-19/20 = 1/20-sigma0` | `-96091/116480 < 0` |
| Exponent of local R | `4-6sigma0-6(33/200) = 301/100-6sigma0` | `-652213/291200 < 0` |
| P0 tail saving | `sigma0-3/50` | `474631/582400 > 4/5` |
| Slack keeping c_H=4/5 | `sigma0-43/50` | `8711/582400 > 0` |

Thus the same sufficiently large fixed P0 can give `|H_eta-1| <= 1/2` on `Re s > sigma0`. Edit 4056, 4173–4185, 5525–5530, 5574, 8749 and 15650–15653, and propagate the enlarged domain through the principal contour argument at 6174–6301 and 15553–15662. The actual principal line is `Re s=beta*+e`, which can be below 7/8. [H_eta and high-data domains, 5520–5578][p-domains]; [principal contours, 6174–6301][p-principal].

The four principal local error exponents are

```text
-sigma0,  -99/100,  301/100-5sigma0,  -47/50.
```

Their maximum is `-sigma0` here; the other three comparisons have positive slacks `99/100-sigma0`, `4sigma0-301/100`, and `47/50-sigma0`. Consequently replace `B_p=-1+O(Q^(-7/8))` by `B_p=-1+O(Q^(-sigma0))`, the slot error by `rho_i << P_i^(-sigma0)`, and the allowed normalizer exponent by `0<kappa_P<sigma0 min_i ell_i`. For equal slots the existing choice becomes `kappa_P=7ell/(16K)`, with exact slack `(sigma0-7/16)ell/K>0`; delete the old numerical equalities `7/(96K)` and `7/(48K)`. [Principal local errors, 9052–9077][p-local]; [slot propagation, 15594–15620][p-slot]; [normalizer choice, 16302–16306][p-kp].

On the small-row lines, use `epsilon0=sigma0-1/2>1/50` (or the weaker fixed `1/4`); hence `epsilon_H=min(epsilon0,1/50)=1/50` survives. At 9139–9169 the replacements are

```text
off u:  -sigma0-e, -51/25, 49/25-5sigma0-5e, -77/50;
on u:   -1/2, 3/2-2sigma0-2e,
        (3/2-2sigma0-2e, 2-3sigma0-3e),
        2-3sigma0-3e, 3-5sigma0-5e;
R:      49/25-6sigma0-6e.
```

They retain the signs used for `G_p=O(1)` off u and `G_p << Q^(1/2)` on u. Edit `D1(3/8)` at 6418–6419 and `epsilon0=3/8` at 9134. The shared-lemma hypotheses at 5811, 6024, 6178 and 6345 must admit the new sigma0, with their revised domain/nonvanishing assumptions retained. This does **not** establish the same Euler constants for every sigma0 in `(1/2,1)`. [Small-row lines, 9134–9171][p-small-local]; [outer-row contour, 6414–6424][p-outer].

## Completed rows and length margins: audit items 2 and 3

For `0<=d<=ell`, put `M'=M-2d`, `ell'=ell-d`. The source algebra gives `M'+ell'-1=-3d` and `1+3ell'-2M'=d-1+5ell`, so the corrected completed-row exponent is

```text
M' + e_row(d),    e_row(d) = max(0,(d-1+5ell)/4).
```

The possible extra loss occurs for `1-5ell<d<ell`, has supremum `(6ell-1)/4=3/(2N)`, and the interval width is `6/N`. At N=5824 the supremum is `3/11648`, replacing `3/11800`; the threshold is `2897/17472`. The coarse clipped bound attains its supremum at d=ell, but at that endpoint the first branch of the source proof gives M' itself. Edit 8079, 8116–8117 and 8306–8326. [Completed-row lemma and branches, 8111–8327][p-row].

After Cauchy–Schwarz the added exponent is

```text
f(d) = -d + e_row(d)/2 = -d + max(0,(d-1+5ell)/8).
```

It is zero at d=0 and strictly negative for d>0: the active branch is `(-7d-1+5ell)/8<0` because `5ell<1`. Thus the corrected estimate still has low exponent L. The summary's unqualified `f(d)<0` needs this endpoint qualification. Edit 8617–8632. [Gram application and low aggregation, 8584–8648][p-low].

| Minimum / scale | General formula | N=5824, h=405967/500000 |
|---|---|---:|
| M' | `1-3ell > 0` (replace the false `>=1/2`) | 2909/5824 |
| ly-d | `h-3ell > 0` (replace the false `>=5/16`) | 28339119/91000000 |
| lx-d | `1-h > 0` (also still `>3/16`) | 94033/500000 |
| ly-d-11b/6 | `h-3ell-11b/6 = (11+15ell-16h)/6 > 0` | 46558471/546000000 |
| Excess above the old 1/12 Gram margin | `(11+15ell-16h)/6-1/12` | 1058471/546000000 |
| P_a | `q_b*^(-1) Z^b`, requiring `b>0` | threshold `Z>=q_b*^(1/b)` |

These are precisely the length inputs at 8588–8605; the source's P_a display is at **8588**, immediately before the audit's approximate reference 8589. Likewise its `ly-d>=5/16` statement begins at 8594.

## Bootstrap and final-section constants: audit items 4 and 5

Assume `sigma0<beta*<=7/8`, set `Delta'=beta*-sigma0`, and obtain `0<Delta'<=1/(4N)`. Distinguish `kappa_act=2beta*-1` from the moment parameter **kappa=3/4**. Then `delta<=kappa_act<=3/4`, the plain hypothesis `beta*<=(1+kappa)/2` follows from the preprint, and

```text
A+(7/2)z <= M;     z <= 2M/9;     z_P(m) = 2(1-2m)/9.
```

Here M in the moment lemma is its local width. Do not substitute the geometric M into the induction. The closed endpoint kappa=3/4 is explicitly allowed. [Plain statement, 12531–12585][p-plain]; [upper-bound use, 12833–12840][p-zero]; [capacity, 12925–12934][p-capacity].

Rewrite 6812–6842, 8646–8648, 12581–12585 and 15097–15108. At 15172–15180, 15199–15201, 15392–15406, 15420 and 15951–15961, use the fixed capacity and remove `+Delta/4`: its comparison is now identically zero. The physical case delta=5/6 is vacuous, although the certificate may safely check that larger box. [Counts and capacity comparison, 15095–15406][p-counts].

Write D for the high row-scale exponent (called d in the paper), to distinguish it from delta. The general replacement for 15726–15735 is

```text
E(D) = C0 + (1/2+ell)delta + ell*q - h(1-R)
       + (D-h)(R+delta/2-17/50).
```

This follows by substituting `a=(1+delta)/2` into the source's first expression and replacing `a-7/8` by `a-sigma0`. [High exponent, 15712–15735][p-high].

| Old numerical assertion | Exact replacement / margin to check |
|---|---|
| `C(s)=s-11/16`; `C(7/8)=3/16` | `C(s)=s-c`; `C(sigma0)=L` everywhere, including 8793–8795 and 15511–15521 |
| `C0=-1/48`, coefficients `2delta/3+q/6` | `C0=-5/12+3ell/4+h/3`, coefficients `(1/2+ell)delta+ell*q` |
| Floor `E(h)<=-7/1200` | `E(h)<=C0+(1/2+3ell/2)/50<0` |
| Small-row frequency `-79/800` | `h(17/50-1/6)-ly/2 = ell-49h/150` |
| Small-row saving `63/800` | `m_small=49h/150-ell-1/50>0` (retains the source's conservative `2d_min`, with `d_min=1/100`) |
| Large-row `B0=53/32` | `B0=lx/2+1+ly=3/2+h/2-3ell/2` |
| `m_w=23/960`, `m_z=13/9600` | `m_w=(h-2ell)/20>0`, `m_z=h/600>0` |
| Supply `ell/h=8/39` | `ell/h-7/37>0` |
| Extension `5ell-h=1/48` | `5ell-h>0`; retaining `zeta<1/48` additionally requires `5ell-h>1/48`, which holds here |
| Vacuous alpha endpoint `-1/48-delta/16` | `C0+(1/2+3ell/2-h)alpha<0`, `alpha=5/6` |
| Intermediate `-529/2400+(25/96)delta`, bounded by `-49/14400` | `A+B delta`, where `A=C0+101/300-33h/50`, `B=5/12+3ell/2-h/2`; check delta=1/50 and 5/6 (or actual upper endpoint 3/4) |
| Adaptive `49/440640` | The new exact certificate margin below; the old completed-square identity is geometry-specific |
| High `m_hi=(51/64)Delta`, low `m_lo=Delta` | Conservatively `m_hi=m_lo=Delta'`; `m_high=min(Delta',m_small)`; `omega=Delta'/2` |

Sources: [principal margins, 15663–15676][p-remainders]; [floor, tails and vacuous endpoint, 15843–15946][p-tails]; [adaptive certificate and intermediate range, 15962–16185][p-endpoint].

The geometric supply argument also retains `ell/D>1/5>7/37` for `D<h+zeta<5ell`, gap `2/185`, and an even K satisfying `2ell/K<min(eta_mesh,b_round,1/185)`. The unchanged `R_*<=17/12` implies a slope below 2; extension still costs at most `2zeta`. The lower slope is at least `33/50-delta/2>0`. All loss choices remain subject to the paper's parameter order, now with Delta'. In particular `(1+h)e+epsilon_pr<m_w/4`, `e+epsilon_pr<min(m_z,m_P)/4`, and a possible final high saving is `min(m_high,m_w,m_z,m_P)/4`. Rewrite the concluding target and contradiction at 16444–16463. [Supply and slope, 16114–16165][p-supply]; [parameter choices and conclusion, 16219–16463][p-order].

## Adaptive endpoint: exact polynomial and established result

For `y=1/2-x`, `0<=delta<=5/6`, `0<=y<=1/2`, the general polynomial in `certify.py` has the compact form

```text
p_y = 7+18y+8y^2
j_y = 185+170y+(-138+12y+96y^2)delta = 108J
F = j_y[-C0 + (h-1/2-3ell/2+ell*y)delta]
    - 6h(5/6-delta)delta*p_y
  = 108J(-E_star).
```

The geometry-independent denominator satisfies `70<=108J<=270`. These formulas follow from the source's balanced count at 15962–16025; the polynomial was compared symbolically with `adaptive_poly` at the old audit point and all four candidate rectangle corners, with exact equality. [Balanced endpoint formulas][p-endpoint].

For **N=5824, h=405967/500000**, an independent run of the existing certifier with explicit `maxdepth=24` supplies 26 positive Bernstein boxes, minimum coefficient `564781781/229008998400000`, hence

```text
-E_star >= 564781781/61832429568000000 > 0.
```

After adjustable losses, the correct comparison is `E_actual(h)-Delta' <= -m_star-Delta'+epsilon_total`; there is no `h Delta/4` capacity cost. The program's extra check `1-h/4>0` is harmless but is unnecessary for this fixed-kappa comparison. The polynomial identity was checked separately from the adaptive positivity certificate.

Run this from the repository root with SymPy installed. It works against the
unchanged base certifier; it does not require PR #12's increased default depth.

```sh
python - <<'PY'
from fractions import Fraction as Fr
import sympy as sp
import certify as C

ell = Fr(1, 6) + Fr(1, 5824)
h = Fr(405967, 500000)
box = ((sp.Rational(0), sp.Rational(5, 6)),
       (sp.Rational(0), sp.Rational(1, 2)))
F, J108 = C.adaptive_poly(ell, h)
log = []
assert C.prove_positive(F, box, maxdepth=24, log=log)
assert len(log) == 26
assert min(bound for _, bound in log) == sp.Rational(564781781, 229008998400000)
assert C.bernstein_min(J108, box) == 70
assert -C.bernstein_min(-J108, box) == 270
assert all(value > 0 for value in C.side_constraints(ell, h).values())

# An exact negative value rejects the neighboring point at this same h.
Fbad, _ = C.adaptive_poly(Fr(1, 6) + Fr(1, 5823), h)
witness = Fbad.as_expr().subs({C.d: sp.Rational(194323, 500000), C.y: 0})
assert witness == -sp.Rational(33322263931253, 15164062500000000000)
assert witness < 0
assert not C.prove_positive(Fbad, box, maxdepth=24)
print('Exact certificate and negative control passed.')
PY
```

The negative control excludes N=5823 only **at this h**; it does not establish
a ceiling over all h. This replay used Python 3.13.5 and SymPy 1.14.0.

## Exact non-adaptive checks and remaining scope

Using Python `Fraction`, all changing non-adaptive signs above were checked for **N in {5824,5825}, 811933/1000000 <= h <= 811935/1000000**. Each quantity in the following table is affine in ell,h, except the monotone ratio ell/h, so its extreme occurs at a corner. The clipped-row estimate and the normalizer slack use the separate sign arguments above. Exact lower bounds over the whole rectangle are:

| Positive quantity | Exact lower bound |
|---|---:|
| Euler tail slack above 4/5 | 8711/582400 |
| `1-5ell`; `1-3ell` | 2897/17472; 2909/5824 |
| b; `h-3ell` | 11224931/91000000; 7084757/22750000 |
| `1-h-3/16` | 113/200000 |
| Gram margin; its slack above 1/12 | 496693/5825000; 33829/17475000 |
| Floor saving | 49457/8400000 |
| Small-row saving | 356688499/4550000000 |
| m_w; m_z | 130563959/5460000000; 811933/600000000 |
| Supply `ell/h-7/37` | 68428409/4199814981 |
| Extension `5ell-h`; its slack above 1/48 | 3111487/139800000; 66329/46600000 |
| Conservative alpha endpoint saving | 39470209/546000000 |
| Intermediate saving at delta=1/50 | 451255381/2100000000 |
| Intermediate saving at actual delta=3/4 | 665693519/27300000000 |
| Intermediate saving at conservative delta=5/6 | 216044107/81900000000 |
| Redundant `1-h/4` check | 637613/800000 |

The intermediate formulas were additionally compared with the unreduced general E(D) using exact fractions at N=5900,5825,5824. The existing N=5900 certificate was reproduced with `python certify.py`: both positivity checks and the original-paper sanity check returned True, and all 12 side constraints returned OK.

**Remaining caveats.** These exact sign checks support carrying the *listed* audit edits to the new point. They do not supply a patched `paper.tex`, independently validate the analytic proofs, or extend the historical audit to lines 1–3723. Euler-region continuation and the modified completed-row estimate remain substantive analytic edits requiring review. The source's induction symbols ell, h, M and sigma0 are often local symbols, so global replacement is unsafe. The original 7/8 theorem must remain an external input to this follow-up argument; replacing its own proof in place while citing it would obscure that dependency. No full theorem or Lean certification is asserted, and this note makes no changes to the separate structural, slot-beta or weaker Lean-anchor work.

[p-mellin]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L5584-L5590
[p-geometry]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6857-L6869
[p-euler]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L3861-L4185
[p-domains]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L5520-L5578
[p-principal]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6174-L6301
[p-local]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9052-L9077
[p-slot]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15594-L15620
[p-kp]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16302-L16306
[p-small-local]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L9134-L9171
[p-outer]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L6414-L6424
[p-row]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8111-L8327
[p-low]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8584-L8648
[p-plain]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12531-L12585
[p-zero]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12833-L12840
[p-capacity]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12925-L12934
[p-counts]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15095-L15406
[p-high]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15712-L15735
[p-remainders]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15663-L15676
[p-tails]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15843-L15946
[p-endpoint]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15962-L16185
[p-supply]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16114-L16165
[p-order]: https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16219-L16463
