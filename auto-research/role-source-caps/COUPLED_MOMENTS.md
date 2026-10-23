# The larger target: retain the witness/numerator correlation

Subhanjan Das (@subhanjandas), substantially AI-assisted with OpenAI Codex.
22 October 2026. Research assessment, not a new analytic estimate.

The finite candidate in this directory makes no change to an analytic lemma.
A significant further gain needs an input that survives the complete source
and return arguments. Improving an auxiliary scalar sum or a large-divisor
tail has not supplied that input in our preceding checkpoints.

## Prior work and the missing estimate

Thibaud Gloaguen's @thebest contribution in
[QuasiRiemannTracker PR #30](https://github.com/GTimG/QuasiRiemannTracker/pull/30)
already investigates the actual zero witness together with the reflected
numerator and prime marks. Its [joint-moment note](https://github.com/Grogros4/QuasiRiemannTracker/blob/7822221d645dd36b9f275ef4ff502cddbe7bcb21/research/thebest/joint-moment.md) and
[Gram expansion](https://github.com/Grogros4/QuasiRiemannTracker/blob/7822221d645dd36b9f275ef4ff502cddbe7bcb21/research/thebest/gram-expansion.md) distinguish a useful mixed bound from separate moment
bounds. No priority is claimed here for that direction.

For fixed common profiles, let M be an inverse witness, A a plain reflected
numerator, and Q the selected marks. A relevant proposed interface has shape

    sum over eligible buffered rows |M|^2 |A|^2 |Q|^2
        <= U^(1+lambda+epsilon).

The analogous plain and long-inverse interfaces are also required. Inserting
the saturated witnesses before Cauchy can improve the numerator estimate if
lambda is strictly below a certain critical loss. PR #30 computes that loss
at an older binding geometry; its quoted numerical threshold must not be
used as a certificate for the new source-return geometry here.

That contribution also expands the exact mixed Gram form, preserving
zero-extension and support radicals. For a fixed number of normalized
annular factors, the full sixth-power diagonal is at most
W_rows times U^epsilon. Thus a diagonal counting argument does not supply
the missing obstruction or improvement. The signed off-diagonal form,
uniformly over the requisite heights, profiles and arithmetic masks, remains
the substantive analytic target. A large-sieve bound for arbitrary columns
does not automatically exploit these particular tensor coefficients.

## A tempting cancellation and its exact limitation

There is a familiar algebraic reason to investigate inverse/plain products.
For one common completely multiplicative character psi, extended by zero,
and real heights t,u, the unrestricted divisor convolution is

**(CM1)**

```math
\sum_{ab=n}\mu(a)\psi(a)\psi(b)
       (Na)^{-it}(Nb)^{-iu}
=\psi(n)(Nn)^{-iu}
  \prod_{p\mid n}\bigl(1-(Np)^{-i(t-u)}\bigr).
```

For psi(n)=0 both sides vanish. Otherwise, factor the divisor sum prime
by prime; only valuations zero and one of the squarefree divisor a survive.
This proves CM1, including nonsquarefree n. At t=u it is the standard
identity mu*1=1_at_the_unit. No new cancellation theorem is being asserted.

With two different fixed twists nu_I,nu_A, the local factor on unit primes
becomes

    1 - (nu_I(p)/nu_A(p)) * (Np)^(-i(t-u)).

It need not vanish even at equal heights. Annular restrictions on a and b
also prevent replacing their truncated convolution by CM1. The same-zero
witness proof in Collet's foundations.tex, Lemma 14.2, already uses the exact
complete convolution cancellation. Reusing it is not an improvement.

For the common-twist case, on unit n>1, writing k=omega(n), the elementary
bound |1-exp(ix)|<=min(2,|x|) gives

**(CM2)**

```math
\left|\prod_{p\mid n}(1-(Np)^{-i\tau})\right|
 \le 2^k\min(1,|\tau|\log Nn),\qquad \tau=t-u.
```

To obtain a fixed power U^(-rho) from this bound at polynomial norm scales,
one needs a separation as small as U^(-rho)/log U, after divisor costs.
The mixed interfaces allow independent heights; they supply no such
localization. A tiny favorable neighborhood of t=u does not control the
rest of their positive moment. CM2 is therefore a diagnostic, not a new
QRH norm bound or proof of decorrelation.

## A concrete criterion for a substantive next result

A worthwhile continuation must bound the actual signed off-diagonal
quadratic form, or prove a valid joint inverse/plain moment, in a neighborhood
of every newly binding return branch. It must retain fixed twists, independent
heights, natural character zeros, admissible common profile suprema and the
coefficient shifts in the physical numerator. The long inverse branch cannot
be left unchanged if it remains binding. Only after those estimates are
proved should the changed source/return budget be searched and certified.

No spectral, random-matrix or physics analogy currently supplies that
uniform estimate. The perspective here is useful because it names the
arithmetic correlation to preserve, without converting an analogy or a
complete-residue toy calculation into a zero-free claim.

## Attribution and scope

Hailey Collet supplies the source/return framework, physical numerator,
same-zero witnesses and their convolution argument. OpenAI supplies the
original QRH preprint and its Hecke inputs. The joint-moment program and
sixth-power Gram diagonal analysis above are credited to Thibaud Gloaguen's
@thebest contribution. CM1 is a standard Dirichlet-convolution identity;
CM2 is its elementary phase bound. All inherited notices and earlier
source-specific credits remain. This note is substantially AI-assisted;
it has not received independent human analytic review.
