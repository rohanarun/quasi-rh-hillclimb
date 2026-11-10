# Remove a family of smooth Gauss profiles

The earlier [column projection](primitive-conductor-ordinary.md) handles one fixed smooth profile for each label \(d\). A growing smooth basis gives a reduction that is uniform in the norm profiles used in the high-frequency separation. The removed component still fits the varying moment budget on the full smooth average. This addresses the profiles at the original column scale and at quotients by fixed divisors.

## A continuous orthogonal basis for each label

Fix a ray and Euler-mask block. Let \(\phi\) be a real smooth bump on a fixed norm annulus, positive on its interior. Write
\[
 C_\phi=\int_0^\infty\phi(t)^2\,dt,\quad
 F(t)=C_\phi^{-1}\int_0^t\phi(x)^2\,dx,\quad
 \phi_m(t)=\phi(t)e^{2\pi i mF(t)}.
\]
The substitution \(s=F(t)\) gives \(\int\phi_m\overline{\phi_{m'}}=C_\phi\,1_{m=m'}\). Each fixed derivative order of \(\phi_m\) is bounded polynomially in \(1+|m|\). For good sixth-power-free labels \(\mathrm Nd\le D=U^{0.207}\) and \(|m|\le M=\lfloor U^\rho\rfloor\), use the vectors
\[
 b_{d,m}(n)=X^{-1/2}\phi_m(\mathrm Nn/X)\overline{\chi_n(d)}
\]
on the same squarefree ray block as before. Here \(\rho>0\) will be a sufficiently small fixed constant.

For one label \(d\), the Gram block has main term \(c_d I\), with \(c_d\gg_\epsilon U^{-\epsilon}\). Indeed, the squarefree lattice density in the ray and with the fixed exclusions multiplies the continuous inner product above. Its per-entry error is \(O_\epsilon((1+M)^C X^{-1/2}U^\epsilon)\), by the same square-divisor expansion as in the [single-profile Gram calculation](column-gauss-projection.md). For distinct labels the error bound is \(O_\epsilon((1+M)^C X^{-1/2}Q^{1/4}U^\epsilon)\), with \(Q\le \mathrm Nd\,\mathrm Nd'\), by smooth completion. All exponents denoted by \(C\) can be fixed before \(\rho\) is chosen. Counting the modes and labels in the row sums costs at most \(O_\epsilon((1+M)^C X^{-1/2}D^{3/2}U^\epsilon)\). This is smaller than the least main diagonal entry, by the strict Gram margin for \(D\) and sufficiently small \(\rho\).

## Price the projection including the unit block

Let \(a\) be the actual squarefree mixed column vector and \(P\) the orthogonal projection onto this basis. Put \(\theta_0=8749/10000\) and
\[
 K=A^{-2(1-\theta_0)},\qquad
 E=B^{-(2-\theta_0)}D^{1+\theta_0/2}+X^{-1}D^{3/2}.
\]
The [overlap bounds](primitive-conductor-ordinary.md) hold for each \(\phi_m\) with polynomial loss in \(1+|m|\): the only additional input is its finite profile seminorm in the Mellin separation. Thus the squared mass of the overlaps for \(d=1\) is \(O_\epsilon((1+M)^C U^\epsilon K)\), and the corresponding mass for \(d\ne1\) is \(O_\epsilon((1+M)^C U^\epsilon K B^{-(2-\theta_0)}D^{1+\theta_0/2})\).

In the Gram matrix the squared norm of the cross block from unit modes to other modes is at most its squared Frobenius norm, \(O_\epsilon((1+M)^C U^\epsilon X^{-1}D^{3/2})\), using the conductor bound \(Q\le D\) when one label is \(1\). Eliminate the entire unit block by the Schur complement. The inverse norms of that block and of the Schur complement are bounded by subpowers from the full Gram lower bound. Returning to the original basis, the coefficients \(c_{d,m}\) of \(Pa\) satisfy
\[
 \sum_m|c_{1,m}|^2\ll_\epsilon(1+M)^CU^\epsilon K,\qquad
 \sum_{d\ne1,m}|c_{d,m}|^2\ll_\epsilon(1+M)^CU^\epsilon K E.
\]
The first estimate uses that \(E\) and \(X^{-1}D^{3/2}\) have negative exponents.

In the full smooth row average, use the ordinary zero-slot moment on pairs for which the label differs from the good core of the row. The sum of the resulting squared ordinary norms over modes and nonunit labels is \(O_\epsilon((1+M)^C U^{1+\epsilon}D^2)\). For unit modes alone this sum is \(O_\epsilon((1+M)^C U^{1+\epsilon})\). On the exceptional pairs each row has just one label, so Cauchy–Schwarz costs a factor for its modes alone. The sixth-root count and trivial squarefree ordinary bound are unchanged. This gives the following squared row bounds for the projected part:
\[
 (1+M)^C U^\epsilon
 \left[ UK(1+D^2 E)+U^{1/6}XK E+U^{1/6}XK\right].
\]
The first two terms have fixed positive margins at exponent \(1.104\), and the last has a margin greater than \(1/20000\) at the varying budget by the [unit-label calculation](full-column-projection.md). Take the preliminary losses small and choose \(\rho>0\) so that the common polynomial loss costs at most \(U^{1/100000}\). The number of modes then grows by a fixed positive power while the entire projection fits the sufficient moment budget. The [Lean replay](ContactFactorization.lean) checks the numerical room for this loss.

## Approximate any interior smooth profile

Let \(W\) be supported in a compact subannulus where \(\phi>0\). The function \(W/\phi\), expressed in the coordinate \(s=F(t)\), extends by zero to a smooth periodic function. Truncate its Fourier expansion at \(|m|\le M\). The uniform error is \(O_N(M^{-N})\) for any fixed \(N\), with the corresponding finite seminorm. Consequently \((I-P)a\) has overlap \(O_J(U^{-J})\) with the \(W\)-profile vector for every allowed label and every fixed \(J\). This follows by Cauchy–Schwarz, since the normalized column vector has subpower norm and the error in the normalized test vector is \(O_N(M^{-N})\). The statement also allows profile derivative bounds \(O_j(U^{\rho j/2})\) on that fixed subannulus, by taking more Fourier derivatives. Multiplying both vectors by the same normalized Gauss factor preserves the conclusion. This gives the orthogonality simultaneously for a family of smooth separated tests at small polynomial norm heights.

The construction can also retain any fixed finite collection of prime divisibility conditions. Partition the squarefree columns by the subset of those primes that divides \(n\). In each cell write \(n=mv\) with the frozen product \(m\) and \(v\) coprime to the entire fixed prime set. Allocate \(m\) between the two factors. Each allocation is the same normalized mixed block at shortened lengths, with fixed deletions and a scalar \(O((\mathrm Nm)^{-1/2})\). The Gram and overlap bounds apply at the quotient scale, with constants depending on this finite set. Recombination on the rows only introduces a scalar \(\chi_m(u)\) of modulus at most one and finitely many cells. For any divisor \(g\) supported on the fixed set, a smooth profile on the quotient \(n/g\) in a cell with \(g\mid m\) is a smooth profile in \(v\) after fixed rescaling. Its label symbol factors as \(\chi_{m/g}(d)\chi_v(d)\). The corresponding orthogonality therefore holds after restricting to such fixed divisibility conditions and taking the quotient, including after applying the same Gauss multiplier on both sides.

This removes the smooth Gauss profiles on these blocks. A high-frequency estimate for the remaining coefficients and control under divisibility conditions of growing norm are still required.

The [growing divisor projection](growing-divisor-projection.md) extends this to a fixed positive power of the row scale and retains the exact zeros of the quotient symbols.

Prepared with OpenAI Codex assistance.
