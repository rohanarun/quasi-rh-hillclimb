# Structured marks: a partial lemma, and why λ = 2 survives it

23 October 2026. Subhanjan Das (@subhanjandas), with substantial assistance from
Claude (Anthropic).
Line numbers refer to openai/math `fd4aeeb`, `build/paper.tex`.

**Summary.** The preprint treats the slot ("mark") coefficient inside its
reflected energy as an arbitrary bounded function of the slot tuple. In
fact, after cubic reflection the tuple coefficient contains a pairwise
cubic-residue phase between every two active slot primes. Exploiting it
with Heath-Brown's bilinear cubic large sieve gives an unconditional
saving of z_a/3 in the *row branch* of the terminal estimate (Lemma S
below). This would change the inverse capacity from (1−r)/2 to (1−r)/(5/3)
**if** the row branch were the only constraint. Exact algebra shows that
the *column branch* independently forces r + 2z < m at the
initialization node, so λ = 2 is not moved. The same conclusion holds for
a zero-free-region bootstrap of the slot sums. The true wall is the
growth of the dual length by 2z_a when mark primes enter the reflection
conductor.

## 1. The tuple coefficient after reflection

`cor:marked-reflection` (7360–7405): each active mark prime q contributes
the local factor q_q^{−1/2} χ_q(λ⁴μ)^{−2} and a scalar −ω_{q,0}·χ_q(σ_q)^{−2}.
By `eq:reflection-cross-prime-phase` (2271),

  χ_p(σ_p)^{−2} ω_{p,j} = ξ_{p,j} χ_p(c/p)^{2j+2},

with |ξ_{p,j}| = 1 depending only on p, j. For two active marks
(j = 0), `eq:reflection-pair-phase` (7446) gives the pair
factor (q/p)₃². Row primes (j = 1) and marks have pair factor
(q/p)₃³ = 1, and frozen primes give per-prime factors (text after
`eq:reflection-pair-phase`). Hence, after the sector is fixed,

  A(P) = ∏_{p | P} c(p) · ∏_{p < q, p,q | P} (q/p)₃^{±2},

with |c(p)| ≤ 1 arbitrary. The preprint keeps only |A(P)| ≤ 1 (7480–7481: "the tuple coefficient may be a
general bounded function of the tuple").

## 2. Lemma S (structured mark bound): statement and proof

**Lemma S.** In the setting of `lem:hybrid-energy` (7510) after its
quadratic reduction (`eq:hybrid-after-quadratic-reduction`, 7594), suppose the
mark coefficient has the form above. Split the active slots into two
groups with nominal lengths z₁ + z₂ = z_a. Then for every column ideal j
in the reduction, and every fixed D, r, h, t,

  |Σ_{P'} A_{D,r}(P') q_{P'}^{−1/2} χ_{P'}(j)^{−2} 1_{(P',ht)=1}|²
   ≪_ε Z^ε (Z^{z₁} + Z^{z₂} + Z^{2z_a/3}).

*Proof.* Write P' = P₁P₂ with P_i the primes from group i. The
D-splitting and the r-twist χ_{P'}(r)^{−2} are multiplicative in P', and
the pair phases between groups are (P₂/P₁)₃^{±2} by multiplicativity of
the cubic residue symbol on coprime squarefree primary ideals. All other
factors depend on P₁ alone or on P₂ alone, so the sum is a bilinear form
Σ_{P₁,P₂} α_j(P₁) β_j(P₂) (P₂/P₁)₃^{±2}, where the masks are coefficient
restrictions. Apply Cauchy–Schwarz in P₁ and Heath-Brown's cubic large
sieve (`eq:cubic-large-sieve`, 7491; both variables squarefree, arbitrary
coefficients, either orientation by conjugation and cubic reciprocity):
the square is at most
(Z^{z₁} + Z^{z₂} + Z^{2(z₁+z₂)/3}) · Σ|α_j|² · Σ|β_j|². Each Σ|α|², Σ|β|²
is at most ∏_{slots} Σ_{p ∈ slot} q_p^{−1} ≪ Z^ε. ∎

With balanced groups (|z₁ − z₂| ≤ w, the slot mesh), the saving relative
to the trivial bound Z^{z_a} is at least z_a/3 − O(w), for **every**
dual length v. The preprint's saving u = min{v, z_a, (v+z_a)/3}
(`old-eq:4.7`, 7779) vanishes as v → 0. So Lemma S strictly improves the
hybrid bound when v < z_a/3:

  u_new = max{ min(v, z_a, (v+z_a)/3), z_a/3 − O(w) }.

This is new as far as this project knows. It uses only the bilinear
structure, not the size of the individual Gauss-sum factors, and it is
unconditional.

## 3. Why λ does not move (exact algebra)

`scripts/branch_algebra.py` (SymPy) and `lean/QRHResearch/BranchAlgebra.lean`
(Lean, checked) evaluate the three terminal branches at the
initialization node with the paper's own relations:
D′ = r + z − 2G, z₀ = z − G, M = 2D′ − m − 2P₁, F = D′ − P₁, Q ≤ P₁ + G
(11751, 11909, 12197–12211), and the worst case P₁ = G = 0, z_a = z₀:

| Branch | Source in the paper | Requirement at initialization |
|---|---|---|
| Row (max = residual row length H) | 9901–9906: E_ref ≤ M + z_a − u | r + (2 − κ)z < m with saving κz; κ = 0 (paper), κ = 1/3 (Lemma S) |
| Column (max = dual length v + ℓ_b) | `old-eq:4.10` (9910), with `eq:inverse-terminal-width` (9884) | necessary: 2M + Q + 2z₀ < 2F, i.e. **r + 2z < m**, for any coefficient structure |
| Mixed (u ≥ v/2) | `old-eq:4.11` | 2r + 8z ≤ 3m |

The column branch is a large-sieve "diagonal" term: when the dual
variable is longer than the residual rows, the energy is the dual length.
That length is T_d = 2H + 2A₀ + 2z_a − N* − N₀ − 3B₀ (`old-eq:4.4`, 7759): the
active mark primes enter the reflection conductor c and the dual length
q_c²/X counts them twice. (The exact closing requirement also subtracts the
small nonnegative lengths V and 3ĥ, so the displayed condition is necessary,
which is all the obstruction needs.) In that branch u = z_a already, so better
coefficient bounds cannot help.

**Conclusion.** Within the reflect-with-marks architecture the inverse
capacity (1−r)/2 is forced by two branches. Lemma S removes one of them.
The remaining target is the column branch.

## 4. The remaining target (precise)

**Column-branch target.** In `lem:reflected-energy`, for retained dyads
with v + ℓ_b ≥ H (dual longer than residual rows), prove a bound whose
dual-length term grows by less than 2z_a in the active mark length.

Two concrete routes:

1. *Cancellation in the dual coefficients.* The dual coefficients are
   cubic theta coefficients d(μ)α(μ)ϑ(λ⁴μ) twisted by χ_P(λ⁴μ)^{−2} and,
   through the rows, by quadratic characters. The column term treats them
   as arbitrary. Sums of cubic Gauss sums with character twists are
   controlled by Kubota–Patterson theory (unconditional exponent 5/6:
   Heath-Brown 2000; asymptotic under GRH: Dunn–Radziwiłł). Caution:
   Dunn–de Faveri–Hoffstein show the cubic sieve's extremal sequences are
   exactly Gauss-sum-like, so gains here are not automatic.
2. *Keep marks out of the conductor.* Any reformulation in which the
   slot primes twist the reflected sum without entering its conductor
   squared would remove the 2z_a. The marked reflection's inactive
   branch already does this (an inactive mark is absent from the
   conductor); the obstacle is the active branch, which the zero-mask
   expansion 1_{q|A} = 1 − χ_q(A)⁰ forces.

## 5. The zero-free-region bootstrap (recorded and closed)

Bounding each slot sum pointwise by an earlier zero-free region θ_I
would give a saving (2 − 2θ_I)z_a ≈ z_a/4 in the row branch. That is
weaker than Lemma S and, more importantly, also cannot touch the column
branch. Moreover, after reflection the per-prime factors carry phases
ξ_{p,0} (Gauss-sum type), so the slot sums are no longer pure
Hecke-character prime sums. Closed.

## 6. Lean formalization

`lean/` (Lean 4.34.1, Mathlib `d13f23b`, the toolchain of PR #8) checks:
the margin identities and the three branch conditions with the obstruction
`capacity_unchanged` (`BranchAlgebra.lean`); Lemma S's analytic core
`structured_mark_bound` and the exponent bookkeeping `balanced_saving`
(`LemmaS.lean`), with Heath-Brown's cubic large sieve and the residue-symbol
factorization as explicit hypotheses. All theorems use only `propext`,
`Classical.choice` and `Quot.sound`, and a fresh `leanchecker` replay passes.

## 7. Conditional payoff, for orientation only

If the column-branch target were proved with a saving matching Lemma S,
the capacity would become (1−r)/(5/3). In the λ what-if model (paper's
second condition kept) this gives θ ≈ 0.87387 (model; floating point;
sources fixed at PR #27), a gain of about 9.0·10⁻⁴ over the model's
λ = 2 value. This is **not** a claim.
