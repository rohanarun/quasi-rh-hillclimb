# Failed and negligible branches

Every entry is a floating-point diagnostic unless marked *exact*. "Gain"
means how much lower θ gets. Earlier failed branches from PR #27's
research log (multi-face counts, earlier HIGH parents, wider physical
width, re-deriving K, idealized sources) are not repeated here.

| Branch | What was tried | Result | Why it fails or stalls |
|---|---|---|---|
| Adaptive per-stage caps | Each intermediate source stage gets cap = previous crossing + margin (margins 3·10⁻⁴, 10⁻⁴, 3·10⁻⁵); final stage at the return's cap | Count face B up by 1.83·10⁻⁶ at equal Λ; θ gain ≈ 7·10⁻⁹ per chain; margin irrelevant | Each stage's own HIGH facet at b = cap binds only weakly; *exact* NF check passes, so this is valid but tiny |
| Adaptive caps + 1/16000 steps | Both chains, 41,056 stages | *Exact:* certified θ = 0.87477127 (10⁻⁸ below PR #27) | Finite tuning is at its limit; continuum estimate ≈ 0.87477126 |
| Better sixth-power slope α | α = 5/6 − 10⁻³ / −10⁻² | θ gain 6.5·10⁻⁶ / 6.6·10⁻⁵ | The long line moves both intercept and slope; weight 0.31 |
| Better source faces (plain line) | ∂θ/∂B_C = −3.6·10⁻³, ∂θ/∂B_P = −6.25·10⁻³ | ≤ ~3·10⁻⁴ even for ideal faces | Plain line weight only 0.185, and admission windows reject much stronger faces |
| Sextic amplification on the marked moment | Sum over ua⁶ rows to enlarge capacity | No gain: exponent derivative 5/6 − q > 0 | The amplification divides by P = (H/U)^{1/6}, which never pays for the extra rows |
| Halász–Montgomery large values | Replace the second-moment count by a large-values estimate | Not applicable as is | Off-diagonal row correlations are character sums of conductor ~U⁶ with length ≤ U; Pólya–Vinogradov/Burgess give nothing |
| Splitting slots (Hölder) | Bound part of the slot product by its bin maximum | No gain | The bin gives matching upper and lower bounds, so the split slots cancel out of the count |
| General cubic large sieve improvement | Hope to beat Heath-Brown's (UV)^{2/3} | **Blocked by a theorem** | Dunn–de Faveri–Hoffstein (arXiv 2607.07911) prove it sharp for arbitrary coefficients |

## Structured-mark round

| Branch | What was tried | Result | Why it fails or stalls |
|---|---|---|---|
| Zero-free-region bootstrap on slot sums | Bound each prime-slot sum pointwise by an earlier zero-free region θ_I (row branch saving (2−2θ_I)z ≈ z/4) | Does not move λ | Column branch of the terminal estimate still forces r + 2z < m; after reflection the per-prime factors carry Gauss-type phases ξ_{p,0}, so the sums are not pure Hecke prime sums |
| Structured marks (Lemma S) | Use the pairwise cubic-residue phases (q/p)₃² between active slot primes with Heath-Brown's bilinear cubic sieve | **Proved** saving z_a/3 in the row branch (unconditional) | Same column-branch obstruction: λ stays 2 (exact algebra, `scripts/branch_algebra.py`, `lean/QRHResearch/BranchAlgebra.lean`) |
| Moving the counted conductor range below d = h | Shrink the intermediate range so the binding edge d = h is handled as a tail | Not available | Rows beyond Z^{h+ζ} are tails only because h is the probe's dual length (paper.tex 15853–15918); d ≤ h is intrinsic |
| Heath-Brown-identity detector (cap inverse witnesses at length 1 to remove the long line) | Replace the μ * 1 split by a Heath-Brown/Vaughan identity | Loses | Product witnesses reduce to a single short witness with a smaller spike; the count gets worse |
| Coupled inverse × plain moment | Joint moment instead of the minimum of two counts | Rough hand estimate: count ≈ 1 − δ at the binding point, about the same as λ = 1 (θ ≈ 0.8728 in the model) | Open problem, already identified in earlier work (PR #26 research log, @thebest program); no new input found |
