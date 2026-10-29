# Reducing the auxiliary floor-row reserve

This argument is conditional on the same preprint 7/8 theorem and analytic
inputs as the Sil/Collet return. It changes an auxiliary proof margin, not
the central-cube estimate. Substantially AI-assisted by OpenAI Codex.

Let `t > 0`, `t <= 1/100000000`, `0 < ell < 1`, and suppose the transport
parameters satisfy

```
0 <= e <= t/10000,
(N+8)*eps <= t/100,
0 <= mesh <= t,
nu <= t/8,
sigma <= t/8.
```

Then the total loss charged to the floor rows satisfies

```
26*e + (N+8)*eps + t + mesh*ell + nu + sigma
 <= (26/10000 + 1/100 + 1 + 1 + 1/8 + 1/8)*t
 = (11313/5000)*t
 <= 11313/500000000000.
```

The first inequality uses `mesh*ell <= mesh <= t`; every other term is
bounded by the corresponding displayed hypothesis. These hypotheses are
already supplied by `TransportParameters.exists_compatible_data` and its
`_with_mesh` variant. The bound on `t` is `BaselineData.t_small` in Collet's
`Record1252270103Return/GenericData.lean`, line 49. Thus either constructor
continues to satisfy its floor-budget obligation with any fixed reserve
`rho >= 11313/500000000000`; in particular, `rho=1/250` is sufficient.
All chosen auxiliary parameters and their quantifier order can be retained.

The normalized floor argument uses the reserve only through these matched
inequalities:

```
floorSourceExponent(v) <= signal(theta) - rho,
floorRealLoss(N,v,e,eps,loss,mesh) + nu + saving <= rho.
```

Adding them gives
`floorSourceExponent(v) + floorRealLoss(...) + nu <= signal(theta)-saving`.
This is the exponent comparison in `CubeFloorSaving`; it does not require
the special number `1/200`. The supplied loss bound and `v <= h+rowExtension < 1`
are unchanged. The new exact return candidate must check the geometric
floor inequality with the same new reserve.

The source audit is against tracker main `e14f7e7924faaa0a19b37979ed532cbe3df6d830`,
directory `submissions/2026-10-26-sil-density-split/src/Submissions/sil_density_split_20261026/ReturnD`.
The necessary matched occurrences are:

- `TransportGeometry.lean`: `BoundsN.floor_margin`.
- `Transport/Transport/FloorExponent.lean`: `floor_source_margin`.
- `Transport/TransportParameters.lean`: the `floor_budget` field and both
  constructors' final floor-budget goals.
- `Transport/Transport/CubeFloorSaving.lean` and `CubeFloorCollected.lean`:
  the `htotal` floor-budget hypotheses.
- `Transport/Transport/SharedNonfloor.lean`, `NonfloorTransport.lean`, and
  `HighApproximation.lean`: the transported `hfloorbudget` hypotheses.

Every other occurrence of `1/200`, including the small-conductor threshold,
height losses and slot-mesh denominators, has a distinct role and is retained.
The bridge into the endpoint must use the consistently changed transport
modules. No preprint `build/paper.tex` lemma or line is changed.

This ordered-field argument establishes the margin replacement. A full
new Lean integration is deferred until all ten exact advances are recorded.
