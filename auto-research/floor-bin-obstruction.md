# Exact floor-bin obstructions under explicit idealizations

2026-10-22 — Sagar Thakrar (@thakrarsagar), with Codex (AI-assisted).

**Result:** after hypothetically removing the low estimate's `b/12` loss, the
retained floor-bin inequality and `h < 5ℓ` still force
**σ₀ > 1573/1818 ≈ 0.865236524**. If the extension condition is replaced by the
weaker prime-supply condition `ℓ/h > 7/37`, the corresponding necessary bound
is **σ₀ > 11513/13326 ≈ 0.863950173**. Thus the earlier approximate `0.864`
ceiling needs its retained constraints specified.

These are proved algebraic obstructions for the models below. They establish
no new zero-free half-plane and do not prove the hypothetical improved low
estimate. Their interpretation as limits of this preprint-based route remains
conditional on the preprint's 7/8 theorem and the applicable audit edits in
[AUDIT_SUMMARY.md](../AUDIT_SUMMARY.md). No full analytic or Lean verification
is claimed. The obstructions need only a subset of the budget inequalities;
other bins may impose stronger limits.

## Model and boundary bookkeeping

Keep the probe relations

\[
l_x=1+\ell-h,\qquad l_y=h-2\ell,\qquad b=2h-1-3\ell,
\qquad C(s)=l_x/2+s-1+h/6,
\]

with `ℓ,h,b > 0`. Keep the floor bin at `a=51/100`, `δ₀=1/50`, the row-count
upper exponent `R=1`, and its worst allowed `q=δ₀/2=1/100`. Require the
existing upper exponent to be strictly negative at `d=h`. This last
requirement is a constraint of the retained uniform budget, not a claim that
an actual family of rows saturates its upper bound.

Let `E(σ)` denote that floor upper exponent at a proposed boundary `σ`.
Substituting into the first high-bin formula gives

\[
E(\sigma)=\frac{51}{100}-\sigma
 +\frac{53}{100}\ell+\frac h3.
\]

The contour parameter cancels at `d=h`. Changes confined to other row counts,
the amplification slope, or the contour therefore do not alter this
particular constraint as long as the listed floor data and geometry remain.

Matching the **original** low exponent `l_x/2+b/12` with `C(σ₀)` gives

\[
\sigma_{\rm old}=1-h/6+b/12=11/12-\ell/4,
\quad
E_{\rm old}=\frac{39}{50}\ell+\frac h3-\frac{61}{150}.
\]

Our **ideal low estimate** means exactly replacing `l_x/2+b/12` by `l_x/2`,
while keeping `C(s)` and the high-bin formula. It gives

\[
\sigma_{\rm ideal}=1-h/6,
\quad
E_{\rm ideal}=E_{\rm old}+b/12
 =\frac{53}{100}\ell+\frac h2-\frac{49}{100}.
\]

One must change the boundary formula when removing `b/12`; retaining
`11/12−ℓ/4` would not represent this idealization. Improvements to nonfloor
row counts can be granted arbitrarily: those constraints are omitted here.
We do not identify this hypothetical term removal with a proved large-sieve
lemma.

## Three exact identities

The original low estimate satisfies

\[
E_{\rm old}
 =\frac{128}{25}\left(\frac{167}{192}-\sigma_{\rm old}\right)+\frac b6.
\]

Since `b>0`, `E_old<0` implies `σ_old > 167/192`. This recovers the existing
README bound; it is not a new endpoint or a newly discovered obstruction.

For the ideal low estimate, set `z=5ℓ−h`. The exact identity

\[
E_{\rm ideal}
 =\frac{1818}{500}\left(\frac{1573}{1818}-\sigma_{\rm ideal}\right)
  +\frac{53}{500}z
\]

shows that `E_ideal<0` and the retained extension rule `z>0` imply

\[
\boxed{\displaystyle
\sigma_{\rm ideal}>\frac{1573}{1818}+\frac{53}{1818}z
>\frac{1573}{1818}.}
\]

This constant is the infimum of the **relaxed floor-plus-extension
subsystem**, even retaining positive `ℓ,h,b`: for `0<η<20/303`, take

\[
\ell=49/303,\qquad h=245/303-\eta.
\]

Then `z=η`, `b=40/303−2η>0`, `E_ideal=−η/2<0`, and
`σ_ideal=1573/1818+η/6`. This family is not a certificate for all the other
bins or analytic lemmas.

Alternatively, **drop** `z>0` and retain only `p=ℓ−7h/37>0`. Then

\[
E_{\rm ideal}
 =\frac{13326}{3700}\left(\frac{11513}{13326}-\sigma_{\rm ideal}\right)
  +\frac{1961}{3700}p,
\]

so `E_ideal<0` implies `σ_ideal > 11513/13326`. This bound rounds to the
historical `≈0.864` figure. It does not establish which relaxation was used
in the earlier numerical analysis. Its limiting floor/supply intersection
is

\[
(\ell,h)=(343/2221,1813/2221),\qquad 5\ell-h=-98/2221<0.
\]

That point is incompatible with the retained extension rule. The paper uses
`ℓ/d>1/5` to leave a reserve above `7/37`; it does not prove that this
particular reserve is unavoidable. A different extension argument may be
possible, but would need its own audit. Neither identity rules it out.

## A necessary saving to target 0.864 while retaining the extension

Suppose the ideal low estimate were available and a new floor-bin bound
replaced `R=1` by `R=1−ρ`, with all the other listed floor data unchanged.
At `d=h` this changes the exponent to

\[
E_{\rm saved}=E_{\rm ideal}-h\rho
 =h\left(\frac{303}{500}-\frac{49}{100h}-\rho\right)
  +\frac{53}{500}z.
\]

Targeting `σ_ideal=108/125=0.864` fixes `h=102/125`. Therefore `z>0` and
`E_saved<0` require

\[
\boxed{\displaystyle \rho>\frac{281}{51000},
\qquad R<\frac{50719}{51000}.}
\]

At the excluded boundary `ℓ=h/5=102/625`, the unsaved exponent is already
`281/62500>0`; positive extension room makes it larger. The saving is a
**power** in a row count of the form `U^{1−ρ}`, not a percentage reduction
in the number of rows. This is a necessary proof obligation, not a sufficient
budget certificate, and no such floor-bin estimate is proved here.

## Source locations and prior work

All paper locations below refer to OpenAI's `paper.tex`, pinned at commit
`1581d4cbdd69a0faf34b2089614fe2a814316a6a` (blob
`268c4e3206d460c617d3d2129742a72b831b3def`) in
`preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/`.

| Location | Use and affected obligation |
|---|---|
| [5584–5592](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L5584-L5592) | Shared Mellin exponent `C(s)`; fixes the boundary after changing the low estimate. |
| [8564–8580](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L8564-L8580) | Proposition `probe-low`; removing `b/12` here is hypothetical. |
| [15723–15738](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15723-L15738) | Equation `common-high-exponent`; use its first line with `7/8` replaced by the target boundary, as in this repository's generalized budget. |
| [15840–15853](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15840-L15853) | Equation `floor-bound`; floor data `a=51/100`, `R=1`, `q≤δ₀/2`. A floor saving would change this input. |
| [16110–16128](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L16110-L16128) | Frequency extension `0<ζ<5ℓ−h`, retaining supply greater than `1/5`. The supply-only relaxation drops this rule. |
| [15372–15390](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15372-L15390) | Inverse capacity ceiling `7/37`; source of the weaker supply requirement. |

The generalized geometry, high exponent and both supply checks are already
in [certify.py](../certify.py). Rohan Arun with Claude supplied the budget
reconstruction, the original `167/192` bound and the numerical `≈0.864`
ceiling. This contribution makes the low-estimate idealization explicit,
proves the two distinct rational bounds and quantifies the required floor
saving. Historical ledger rows and audit reports are preserved.

## Reproduction

From the repository root with the existing SymPy dependency installed:

```sh
python auto-research/floor_bin_obstruction.py
```

The script checks 24 exact symbolic identities against the existing
`certify.high_exponent` and 18 rational sign conditions. This includes the
low/Mellin matches, contour cancellation, positive obstruction coefficients,
the limiting family, the incompatible supply vertex and the target saving.
Every residual must vanish exactly; floating-point values are not used in
any check. A failed check raises an error and exits nonzero.
