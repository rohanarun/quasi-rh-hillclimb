# Why the coefficient 2 exists, a proven barrier, and the one open route

23 October 2026. Subhanjan Das (@subhanjandas), with substantial assistance from
Claude (Anthropic).

> **Update (see `STRUCTURED_MARK.md`).** The "open route" below has been
> carried out for the row branch (Lemma S, proved and Lean-checked in its
> analytic core). A second, independent branch of the same terminal estimate
> (the column branch) also forces the coefficient 2, so this route alone does
> not move θ.
This file traces the coefficient 2 in the preprint's marked inverse
moment to a single inequality, records a published barrier, and states
the remaining route as a precise target. **Nothing here is a new proof.**

## The chain of dependencies (all line numbers: openai/math `fd4aeeb`, `build/paper.tex`)

1. **Count → capacity.** The inverse witness line uses
   z_M(r) = (1−r)/2 (Prop. `detector-counts`, 15185; capacity text
   just before it).
2. **Capacity → marked moment.** z_M(r) is the first condition of
   `lem:marked` (9250): r + 2z ≤ m − c₁, at row width m = 1.
3. **Marked → canonical invariant.** The initialization (11601–12340)
   reaches `lem:canonical-moment` (9296) with margins recorded at
   12206–12211:
   F − M − (P₁+G) − z₀ = m − r − 2z + 2G. The canonical invariant
   (`eq:inverse-fixed-invariant`, 9807) demands F − M − Q − z₀ ≥ c.
4. **Invariant → reflected energy.** In the terminal step (9890–9935),
   the row branch of the reflected-energy bound gives
   E_ref ≤ M + z_a. For this to be at most F, the recursion carries
   M + z₀ ≤ F in its invariant.
5. **Reflected energy → mark saving.** In `lem:reflected-energy`
   (7747, `old-eq:4.6`), the mark contributes z_a − u with
   u = min{v, z_a, (v+z_a)/3} (`old-eq:4.7`).
6. **Mark saving → cubic large sieve.** That u is exactly the saving
   of `lem:hybrid-energy` (7510, `old-eq:4.6b` at 7523), whose last step applies
   Heath-Brown's cubic large sieve (`eq:cubic-large-sieve`, 7491):
   U + V + (UV)^{2/3}. With N = Z^v and L = Z^{z_a}, the saving
   NL / (N + L + (NL)^{2/3}) is Z^{min(v, z_a, (v+z_a)/3)} = Z^u.

So the coefficient 2 is the (UV)^{2/3} term of the cubic large sieve,
propagated through the reflected-energy terminal step into the
canonical invariant and back to the inverse capacity.

## The barrier

Dunn, de Faveri and Hoffstein, *Non-orthogonality of the cubic and
quartic large sieves via Rankin–Selberg*, arXiv:2607.07911 (July 2026),
Theorem 1.1: for all A, B ≥ 1,

  Ξ₃(A, B) ≫_ε (AB)^{−ε} (A + B + (AB)^{2/3}).

Heath-Brown's cubic large sieve is therefore **sharp up to ε** for
arbitrary coefficients. Consequence for this project: no improvement of
the general cubic large sieve can lower the coefficient 2. Any route
through step 6 must use the structure of the actual coefficients. (The
same paper conjectures the order-n operator norm
(AB)^{o(1)}(A + B + A^{1−1/n}B^{2/n} + A^{2/n}B^{1−1/n}); for n = 6 this
gives a sharp target for the sextic analogue.)

## The open route: structured slot coefficients

In the cubic sieve of step 6, the coefficient variable is the mark P′
(a product of slot primes) and the coefficient is a product of slot
coefficients. In the QRH application those coefficients are not
arbitrary. A physical prime's coefficient is a fixed finite combination
of Hecke characters times a smooth weight (paper.tex, proof of
`prop:detector-counts`, lines 15140–15160:
ν̄(p)1_{p∈1_T} = |T|⁻¹ Σ_θ (ν̄θ)(p)). So the needed sums are products of

  Σ_{p ~ P} θ(p) W(q_p/P) (j/p)₃^{−2},

that is, **prime sums of Hecke characters**, averaged over the row j.
The extremal sequences behind the Dunn–de Faveri–Hoffstein lower bound
come from the bias of cubic Gauss sums. **Heuristic (not proved here):**
a fixed Hecke character times a smooth prime weight should not correlate
with cubic Gauss sums at the main-term scale. The arguments of cubic
Gauss sums at primes are equidistributed (Heath-Brown–Patterson, 1979);
their sum over primes is X^{5/6+ε}, i.e. relative size X^{-1/6}
(Heath-Brown unconditionally; the asymptotic c·X^{5/6}/log X, Patterson's
conjecture, is proved under GRH by Dunn–Radziwiłł, arXiv:2109.07463).
Whether that secondary bias already obstructs the needed saving is part
of the open problem.

**Target (precise).** Prove `lem:hybrid-energy` with
{N + L + (NL)^{2/3}} replaced by {N + L + N^{a}L^{b}} for some a + b < 4/3
in the relevant range, **for mark coefficients of the slot product form
with Hecke-character prime coefficients**. Then rerun steps 5→1: u
grows, the canonical invariant charges the mark by less than z₀, and
the inverse capacity becomes (1−r)/λ with λ < 2.

## Caveats

- The second condition 2r + 8z ≤ 3m comes from the other branch of the
  same terminal bound (`old-eq:4.11`) and would need the same treatment.
- The canonical recursion's Poisson steps (9945–11600) carry the mark
  through every node; each use of the invariant must be rechecked.
- Prime sums of characters with a varying conductor j are close to
  zero-density questions themselves; an unconditional saving must not
  assume the zero-free region being proved.
