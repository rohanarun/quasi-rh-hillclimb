# A local long inverse target below the current QRH record

**Status.** Exact scalar certificate for a conditional research target. The long inverse estimate stated below is open. The count bridge and nonvanishing endpoint have not been re-elaborated in Lean.

The candidate is $\theta=43669/50000=0.87338$. It is about $1.9666\cdot10^{-6}$ below both the tracker record and the algebraic contact $\theta_*=(777-\sqrt{1081})/852$. The comparison to $\theta_*$ is exact: $777-852\theta>0$ and $(777-852\theta)^2>1081$.

## Baseline and prior work

- Joseph Bebel's [tracker PR #103](https://github.com/GTimG/QuasiRiemannTracker/pull/103) is the best merged all-moduli Dirichlet entry at tracker main `3243c97f7a4d25ceacdf241abe91be4f0c0a2fb4`. The [admission run](https://github.com/GTimG/QuasiRiemannTracker/actions/runs/41294260719) passed for its submitted head. Its rational bound is about $2.16243\cdot10^{-254}$ above $\theta_*$.
- Baiying Liu's [preprint](https://hexagonmath.org/pdf/2611.00082v1), Theorem 1.1, reaches $\theta_*$ for finite-order Hecke characters over arbitrary number fields. Theorem 6.9 and §6.7 explain the limit of the existing positive comparison and unequal ordinary moments. The proposal below changes the long inverse input of (6.10).
- [Jacob Sussman's §9](https://github.com/jacobalansussman/qrh-zero-free-bounds/blob/3ce33510e11aa30a1aaf8f9d629fc3346050331f/RESULTS.md#9-four-more-rounds-below-the-record-2-and-3-november) already prices stronger slope improvements and other conditional routes. The goal here is a smaller, explicitly localized obligation for a smaller gain. The replay reuses Sussman's exact transcription of #103.
- [Cinna Davis's return-model barrier](https://github.com/1337isnot1337/quasi-riemann/blob/839f2cc772a4a9aea4b11223d900ca71945b9a48/research/return-model-barrier.md) rules out retuning the inherited faces, capacities and Mellin line to pass the contact. The [mixed fibre analysis](https://github.com/1337isnot1337/quasi-riemann/blob/839f2cc772a4a9aea4b11223d900ca71945b9a48/research/mixed-fibre.md) explains why ordinary–ordinary moments tie at the contact. The [QRH Catalogue](https://github.com/HaileyStorm/QRH-Catalogue/tree/44824138c975e34552d35e314cda60b32ad346b5) provides provenance for earlier count and source components.

## Estimate to prove

Use the same detected rows, inverse Möbius polynomial and loss uniformity as `common_witness_count_bound` in the [Collet count curve](https://github.com/GTimG/QuasiRiemannTracker/blob/3243c97f7a4d25ceacdf241abe91be4f0c0a2fb4/submissions/2026-10-21-hailey-collet-1252270103/src/Submissions/hailey_collet_1252270103/Record1252270103Return/CountCurve.lean#L48). For these rows the existing long inverse count exponent at $r\ge1$ is $L(r)=1/6+(5/6-\delta)r$. Write $t_0=T/J$ for the uncapped C branch detector cutoff and $R_0=N/J=L(t_0)$ for its count.

Prove $\#\mathrm{rows}\ll_\epsilon U^{L(r)-1/15000+\epsilon}$ for the actual common-witness fibres on

```text
delta in [0.417, 0.435],  p in [0.499, 0.5]
d in [0.80963635, 0.8096863501]
r in [t0 - 1/24000, t0 + 1/8500]
```

Here $U=Z^d$ and $U^r$ is the inverse length. A sufficient moment version would improve the exponent $(1+5r)/6$ by $1/15000$ on these fibres. The new estimate must retain the profile, conductor, height and smoothing uniformity needed by `hI0` in the count curve. It is enough to prove the localized count directly, with the same small-loss budget.

## Count and return calculation

Let $s=1/8750$ and $\eta=1/64000$. Increase the C branch cutoff to $t_0+s$. In [CountAdmission.lean](https://github.com/GTimG/QuasiRiemannTracker/blob/8b1a0167c8e324099884152181e3fb2206510e88/submissions/2026-11-01-closest-fraction-contact/src/Candidate/Local/Qrh/PositiveGap/Return/CountAdmission.lean), the balanced inverse crossing length is affine in the cutoff, with slope $A/D$. Its plain partner has slope $(1-p)/D$. The new short crossing saves $\delta(1-p)As/D>\eta$. The replay checks that the shifted short crossing stays inside the inverse and plain witness ranges, with a mesh buffer, and that the inherited natural tail still fits under $R_0-\eta$.

On the long branch, let $V=5/6-\delta$. Below $t_0-1/24000$ the old estimate already saves $V/24000>\eta$. Above that length the proposed saving covers the increase $Vs$, since $1/15000-Vs>\eta$. The upper length follows from $r\le t_0+s+\gamma$ and $s+10^{-7}<1/8500$. The original losses from $\gamma$ and the other approximation parameters remain to be chosen within the return budget. Thus the desired long inverse input would allow the scalar count $R_0-\eta$ in the local window.

The exact geometry uses $h=0.80968635$, $\ell=11/3-4\theta$, $x=1+\ell-h$, $y=h-2\ell$, and the five windows from #103. For short rational arithmetic, both source faces are weakened to $B=1-10^{-10}$ and $\Lambda=2+10^{-9}$ with their original caps. The scalar conductor edge is extended to $d_+=h+10^{-10}$ and the scalar reserve increased to $10^{-9}$. The arithmetic checks verify the corresponding source inequalities, the inherited `BoundsN` box, the geometry and the physical schedule's numerical fields.

At the three inherited lower edges and at $d=h-1/20000$, the inherited counts suffice. At $d_+$ they suffice on the complement of the local rectangle. Inside that rectangle, $R_0-\eta$ gives strict positivity by the quadratic discriminant and Bernstein quotient checks used by #103. For each fixed $(\delta,p)$ the row exponent on either conductor regime is the maximum of two affine functions of $d$. The endpoint bounds therefore cover the full intervals, with a split at $h-1/20000$. The tightened count is available at the split from the high side and can only lower the row exponent there.

The existing `PhysicalSchedule` count scheme takes a conductor-independent envelope. To use the smaller conductor window in a formal return, pass the conductor regime through the count bridge and prove the patched envelope antitone in $p$ on each regime. Its extra branch is the original antitone C count minus a constant, with availability upward in $p$. Alternatively, a uniform proof of the same estimate on the larger conductor range would let the count scheme keep a single envelope. [Count bridge and schedule source](https://github.com/GTimG/QuasiRiemannTracker/tree/8b1a0167c8e324099884152181e3fb2206510e88/submissions/2026-11-01-closest-fraction-contact/src/Candidate/Local/Qrh/PositiveGap/Return).

## Reproduce the arithmetic

From the repository root, run the exact replay with the two pinned input files. It checks their SHA-256 hashes before use. This Bash command streams both inputs.

```bash
python3 -B auto-research/contact-long-inverse/replay.py \
  <(curl -fsSL 'https://raw.githubusercontent.com/jacobalansussman/qrh-zero-free-bounds/3ce33510e11aa30a1aaf8f9d629fc3346050331f/tools/dead-ends/return103.py') \
  <(curl -fsSL 'https://raw.githubusercontent.com/GTimG/QuasiRiemannTracker/8b1a0167c8e324099884152181e3fb2206510e88/submissions/2026-11-01-closest-fraction-contact/src/Candidate/Local/Qrh/PositiveGap/Return/Tuning/Data.lean')
```

The replay passes all 75 inherited admission guards, 12 local inequalities, four lower conductor covers, the top complement and the corrected contact. At $(\delta,p)=(0.42608,1/2)$ the uncorrected top row fails. A separate in-memory Lean 4.34.1 run recomputed 160 successful Bernstein sign checks directly over rational numbers and checked the quadratic discriminant, the negative control and the exact comparison to $\theta_*$. That replay checks finite arithmetic. The open estimate and its end-to-end analytic integration are still required before any new zero-free bound or tracker submission.

Prepared with OpenAI Codex assistance. The underlying return and source faces are Joseph Bebel's, building on the contributors credited in #103. The arithmetic helper and earlier slope targets are Jacob Sussman's.
