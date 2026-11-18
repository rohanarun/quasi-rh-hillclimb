# Choosing rational parameters up to the frozen Track A limit

Choose the height as an affine function of the slot parameter.

$$
  h(\ell)=\frac{1015+5869\ell}{2456},
  \qquad \frac16\leq\ell<\ell_* = \frac{33+8\sqrt{921}}{1653}.
$$

This line gives a strict certificate for each such pair in the frozen final-section budget with plain capacity $2/9$. Consequently every rational boundary between the algebraic infimum (excluded) and $7/8$ (included) has an explicit rational witness. With reduced boundary denominator at most $2^{63}-1$, the smallest feasible boundary is $35286435714595391/40329333783993290$.

The zero-free interpretation is conditional on the preprint’s $7/8$ theorem and the Track A analytic edits. Baiying Liu already proved nonvanishing above the exact algebraic limit for the Eisenstein Hecke and Dirichlet families. The thirty decimal places in the historical tracker row encode an upper rounding of Liu’s result. The later continuum tracker result gives a stronger half-plane. The contributions here concern the construction of rational witnesses and their arithmetic optimality. [Liu’s endpoint definitions and theorems](https://github.com/GTimG/QuasiRiemannTracker/blob/42cf5415cfaa4205caaa25ab11160724606cdc33/submissions/2026-10-08-liu/src/Submissions/liu_20261008/RHZeroFreeExtension/CombinedPaperVerification.lean#L80-L97) · [Liu’s tracker metadata](https://github.com/GTimG/QuasiRiemannTracker/blob/42cf5415cfaa4205caaa25ab11160724606cdc33/submissions/2026-10-08-liu/metadata.json) · [tracker #143](https://github.com/GTimG/QuasiRiemannTracker/pull/143).

## Proof of the height rule

Write $F=108J(-E_*)$ on the full rectangle $[0,5/6]\times[0,1/2]$. Sagar Thakrar’s limiting certificate proves $F_*\ge0$ at

$$
h_* = \frac{254}{551}+\frac{5869\sqrt{921}}{507471},
\qquad \sigma_* = \frac{1507-2\sqrt{921}}{1653}.
$$

Matching the rational and radical coefficients in $h_*=a+b\ell_*$ gives the unique rational affine line through that point. It has $a=1015/2456$ and $b=5869/2456$. At its other endpoint $\ell_0=1/6$, the height is $11959/14736$. Twelve Bernstein boxes give $F_0\ge125/9824$ and all twelve side constraints are strictly positive there. [Limiting certificate and source formulas](track-a-exact-limit.md).

For any point on this segment put $t=(\ell_*-\ell)/(\ell_*-1/6)$. The polynomial is affine in $\ell,h$ at fixed rectangle coordinates. Hence $F=tF_0+(1-t)F_*\ge125t/9824>0$ everywhere when $0<t\le1$. The denominator satisfies $108J\ge70$. The twelve side margins are affine after multiplying the supply margin by $h>0$, and each is strictly positive at both endpoints. This proves the assertion on the whole segment. Given rational $\sigma\in(\sigma_*,7/8]$, take $\ell=4(11/12-\sigma)$ and the displayed height.

## The minimum with a bounded denominator

Let

$$
L=\frac{8048408698318013625}{9198632682818811461}=\frac ab,
\qquad U=\frac{35286435714595391}{40329333783993290}=\frac cd.
$$

For $p/q=L,U$, the integer $1507q-1653p$ is positive. Its square minus $3684q^2$ equals $17103040$ and $-551$, respectively. Thus $L<\sigma_*<U$. The integers satisfy $bc-ad=1$ and $b+d=9238962016602804751>2^{63}-1$. Every fraction $n/m$ strictly between the two has $bn-am\ge1$, $cm-dn\ge1$, and

$$
m=d(bn-am)+b(cm-dn)\ge b+d.
$$

Every strictly feasible boundary exceeds $\sigma_*$ by the frozen-budget obstruction. The point $U$ is feasible by the height rule and has denominator within the cap. Together these facts give optimality. This argument constrains the reduced boundary denominator only. It also bounds the remaining gap by

$$
0<U-\sigma_*<U-L=\frac1{370974727821749526579531984199096690}.
$$

## Replay at the optimum

For a witness whose input numerators and denominators also fit signed 64-bit integers, take

$$
N=\frac{40329333783993290}{6925385594951},\quad
\ell=\frac{10092721524390749}{60494000675989935},\quad
h=\frac{3594738650076713443}{4427234498297715012}.
$$

This height is a separate rational approximation to $h_*$. The unchanged certifier covers the full rectangle in 116 boxes at depth 111, and all 12 side constraints and the original paper-point check pass. The improvement over Sagar Thakrar’s PR #12 finite certificate is exactly $16762080630821/20164666891996645000000000$. All 21 listed audit margins are positive with the new inputs. In particular the corrected row-norm loss supremum is $20776156784853/80658667567986580$. The existing audit identifies the affected paper lines for the Euler region, corrected row loss, high endpoint, and continuation argument. Its analytic edits remain required. [Audit formulas and source-line map](track-a-5824.md#recomputed-numerical-margins-and-paper-locations) · [PR #12 near-edge certificate](track-a-near-edge.md).

```sh
python auto-research/certify_track_a_farey.py
python certify.py 40329333783993290/6925385594951 3594738650076713443/4427234498297715012 --maxdepth 111
python auto-research/audit_5824.py 40329333783993290/6925385594951 3594738650076713443/4427234498297715012
```

Prepared with OpenAI Codex assistance. This uses Rohan Arun and Claude’s budget and Bernstein certifier, the obstruction reported by Daugherty, Ryan and Ward, and Thakrar’s global limiting polynomial and audit checks.
