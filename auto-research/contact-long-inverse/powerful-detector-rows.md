# Use the ordinary moment on rows with repeated prime powers

The [short-factor reduction](factorization.md) leaves actual detector rows where a full ordinary polynomial \(S_c\) and a medium inverse polynomial are simultaneously near their pointwise bounds. The ordinary fourth moment alone gives the required count on a subset of these rows if its effective width is computed separately for each frozen prime-power part. This is a count on the detector fibres before any full smooth row majorization.

## Freeze the higher powers in the physical row

Physical rows have sixth-power-free ideal valuations. Separate the unit, the fixed ray data, and the bounded powers at fixed bad primes. Write the good part as \(h_1h_2^2h_3^3h_4^4h_5^5\), with pairwise coprime squarefree \(h_j\). On dyads write \(x_j=\log_U\mathrm Nh_j\) up to \(O(1/\log U)\). Then \(\sum jx_j=1+O(1/\log U)\). Put
\[
 v=\sum_{j=2}^5 jx_j,\qquad
 \rho=\sum_{j=2}^5 x_j,\qquad
 D=v-\rho,\qquad J=v-2\rho=x_3+2x_4+3x_5 .
\]
Freeze \(h_2,h_3,h_4,h_5\). There are \(O(U^\rho)\) such choices on their dyads. In a frozen family the remaining row \(h_1\) has length \(U^{1-v}\). The twist by \(h_2^2h_3^3h_4^4h_5^5\) has radical norm \(U^\rho\). Thus the effective width of the ordinary moment is \(M=1-v+\rho=1-D\), up to fixed dyadic constants.

Use the literal factorization of the original row symbol. It leaves the phases and all original zeros in the shared character of both ordinary factors and every prime slot. The moving factor belongs in that shared character, while the slot coefficients remain the original fixed finite ray combinations. Conjugate the whole product if the detector uses the negative orientation. Within the moment only the positive sum is enlarged from the actual \(h_1\) labels to element rows of the shortened length, subject to the inducing-character restriction of the moment. On the actual rows the primitive inducing character ramifies at a good prime, so it lies outside the fixed finite ray family. The resulting dependence on the frozen factors is only through the effective width and the uniform mask and profile bounds. [OpenAI, Lemma 18.1 and its row conventions](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L12494).

## Count the saturated ordinary witnesses

The inherited slot selection in a fixed amplitude bin gives a product of squared size \(U^{2\delta p z-o(1)}\) at requested total slot capacity \(z\), with the usual capacity decrement and mesh losses. Partition by the selected index set and profile data as in the inherited count. This argument uses only the original available slots and their sizes on these same rows. The ordinary witness obtained after the inverse factorization retains the common character and is a full ordinary polynomial with a permitted separated smooth profile. Hence two copies give squared product \(U^{2\delta c-o(1)}\). [OpenAI's detector count from selected witnesses](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15112).

In the moving-twist version of the fourth moment take \(\kappa=3/4\), permitted by the inherited \(7/8\) bound. With positive marks, its capacity condition is \(2c+(9/2)z\le M\). With no marks the condition on \(c\) is absent. Thus the exponent obtained by taking
\[
 z_*=\frac29(1-D-2c)_+
\]
is valid up to arbitrarily small losses, by requesting a slightly smaller capacity when necessary and using the zero-slot version for capacities below the loss allowance. This requests fewer slots than the inherited short plain count in the same window. The total after summing the frozen choices is
\[
 \#\{\text{rows on the joint fibre in these dyads}\}
 \ll_\epsilon U^{1-J-2\delta c-2\delta p z_*+\epsilon}.
\]
The extra saving compared to the unmarked count on width one is \(J+2\delta p z_*\).

To compare with \(R_0-\eta\), use the uncapped crossing \(R_0=P(c_0)\) from the [short-factor reduction](factorization.md). The required saving satisfies
\[
 \begin{aligned}
 1-R_0+\eta-2\delta c
 &= \delta\left(2(c_0-c)+\frac{2p(B_{\rm face}-2c_0)}{\Lambda}\right)+\eta\\
 &\le 0.435\left(\frac2{3500}+\frac18\right)+\frac1{64000}
 <0.0547.
 \end{aligned}
\]
Here \(c_0>3/8,\ c\ge c_0-1/3500,\ B_{\rm face}\le1,\ \Lambda\ge2,\ p\le1/2\). Consequently all dyads with \(J+2\delta p z_*\ge0.0547\) fit the desired count with room for the preliminary losses. This includes the following uniform sectors.

| Sector | Sufficient condition |
| --- | --- |
| Without using marks | \(J\ge0.055\) |
| With marks | \(J\ge0.045\) and \(D\le3J\) |
| With marks | \(J\ge0.040\) and \(D\le2J\) |

For the last two rows, \(c<0.379,\ \delta\ge0.417,\ p\ge0.499\). For \(b=2\) or \(3\), the resulting lower bound \(J+(2\cdot0.417\cdot0.499)(2/9)(0.242-bJ)_+\) increases with \(J\). Its values at the two indicated endpoints exceed \(0.0547\). The [Lean replay](ContactFactorization.lean) checks the numerical bounds. For example, a cubic layer with no other repeated-prime layer has \(D=2J\), so cubic layers with \(x_3\ge0.040\) fit even when their primitive conductors are too large for [the earlier pointwise conductor cutoff](squarefree.md).

This removes these actual row dyads from the open joint count. Squarefree rows and rows with only exponent-two repetitions remain in the complementary sector. The reduction imposes no arithmetic restriction on a signed Poisson frequency shell.

Prepared with OpenAI Codex assistance.
