# A smaller reserve in the density-split LOW profile

All analytic applications remain conditional on the preprint's 7/8 theorem.
This algebraic observation was developed with OpenAI Codex assistance from
Sil's source-step payment argument and the wider-density interface.

Let `eta >= 0`, `L0 >= 0`, `sigma >= 0`, `u >= sigma`, `0 <= q <= 3/4`,
`B0 <= 1`, `tl >= 0`, and `tl <= L0*epsilon/24`. Assume

```
F <= (L0-L)*v + (6*B0-L0)*u + (B0+1)*tl,
L0*sigma - q*((L0-L)*v + (6*B0-L0)*sigma) = eta*L0*sigma,
q*(6*B0-L0) <= L0.
```

Then `q*F <= L0*(u + epsilon/16)`. Indeed, multiplication by `q >= 0`
and substitution of the assumed identity give

```
q*F <= (1-eta)*L0*sigma
       + q*(6*B0-L0)*(u-sigma) + q*(B0+1)*tl
    <= L0*u - eta*L0*sigma + (3/2)*tl
    <= L0*u + L0*epsilon/16.
```

The second inequality uses `u-sigma >= 0`, `q*B0 <= q <= 3/4`,
`q <= 3/4` and `tl >= 0`. The last uses `eta*L0*sigma >= 0` and the
assumed upper bound on `tl`. Thus `1/1000` is not required in this argument.

For the chosen source profile, put

```
X = 1+D*v,
E = (L0-L)*X + (6*B0-L0)*A,
sigma = A*v/X,
q = (1-eta)*L0*A/E.
```

When `X` and `E` are nonzero, the LOW identity follows exactly by
canceling the denominators. `low_payment.py` checks that identity and
the payment decomposition symbolically over the rationals. The new
candidate uses `eta=1/10000` and hence multiplier `9999/10000`.
Every other source gate, denominator, count admission and return margin
must still pass its own exact certificate. Strict positivity of the
LOW-per-width gate remains required; the zero-reserve limit is not used.

The affected Lean arithmetic is the profile and its identities in
`Source/HybridGates.lean` and the premise of `Density/StepGates.ds_low_aux`.
The small analytic height buffers elsewhere also written `1/1000` are
unrelated and are retained. No preprint estimate is strengthened by this
change, and no optimality claim is made.
