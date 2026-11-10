# Preserve Gauss orthogonality under growing column divisors

The [smooth Gauss projection](smooth-gauss-profiles.md) gives orthogonality after restriction by fixed divisors. A centered divisibility basis extends this to a fixed positive power of the row scale. The quotient symbols require an additional branch index at primes of the Gauss label.

## Divisibility basis with exact quotient zeros

Work on the same good squarefree ray block and fixed deletion \(F\), at column scale \(X=AB\). For a good prime \(\mathfrak p\nmid F\) with norm \(q\), define
\[
 R_{\mathfrak p}(n)=\frac{q+1}{\sqrt q}\,1_{\mathfrak p\mid n}-\frac1{\sqrt q}.
\]
In the squarefree lattice main term, the event \(\mathfrak p\mid n\) has probability \(1/(q+1)\), independently at distinct good primes outside the fixed deletion and ray modulus. Thus \(R_{\mathfrak p}\) has mean zero and variance one. For squarefree \(m\) put \(R_m=\prod_{\mathfrak p\mid m}R_{\mathfrak p}\). Its expansion in \(1_{\ell\mid n}\), \(\ell\mid m\), has total absolute coefficient mass \(O_\epsilon((\mathrm Nm)^{1/2}U^\epsilon)\).

Take sixth-power-free labels \(d\) with \(\mathrm Nd\le D=U^{0.199}\). For each \(d\), split into branches \(h=(n,\operatorname{rad}d)\), and use squarefree indices \(m\) prime to \(dF\) with \(\mathrm Nm\le L=U^{1/100000}\). Omit impossible branches at the deleted primes. On the branch \(n=hv\), use the symbol \(\chi_v(d)\), which has modulus one since \(v\) is prime to \(d\). With the smooth modes \(\phi_k\) of the previous projection, take the basis
\[
 b_{d,h,m,k}(n)=\sqrt{\frac{\mathrm Nh}{X}}\,
       1_{(n,\operatorname{rad}d)=h}\,
       R_m(n)\phi_k(\mathrm Nn/X)\overline{\chi_{n/h}(d)},
 \qquad |k|\le M=\lfloor U^\rho\rfloor .
\]
For \(d=1\) the sole branch is \(h=1\).

For a requested quotient \(n/g\) with \(g\mid n\), the symbol \(\chi_{n/g}(d)\) is nonzero precisely on the branch \(h=(g,\operatorname{rad}d)\). On that branch the extra restriction is \(g/h\mid n\), and
\(\chi_{n/g}(d)=\chi_{n/h}(d)/\chi_{g/h}(d)\).
Thus the basis retains the zero values when a label prime survives in the quotient, and retains the nonzero value when that prime was removed.

## Gram estimates

For fixed \(d,h\) the normalized lattice main term is diagonal in \(m,k\). This follows from independence of the centered divisibility variables outside \(dF\) and the continuous smooth-mode orthogonality. The factor \(\mathrm Nh\) in the squared normalization cancels the probability cost of forcing \(h\). The remaining Euler density is bounded below by a subpower. Distinct branches for the same label are disjoint.

For distinct labels \(d,d'\), expand the two centered divisibility polynomials. In each term factor out the least common multiple \(z\) of the forced divisors and the two branch indices \(h,h'\). Discard inconsistent terms. On writing \(n=zv\), the two symbols become the symbols on \(v\), times fixed phases, with \(v\) prime to both labels. Their ratio is nonprincipal because the sixth-power-free digits of the labels differ. Its good conductor norm \(Q\) satisfies \(Q\le\mathrm Nd\,\mathrm Nd'\). The squarefree completion bound of the [column Gram calculation](column-gauss-projection.md) at scale \(X/\mathrm Nz\), with the original normalization restored, gives an error per expanded term at most
\[
 U^\epsilon (1+M)^C X^{-1/2}
          \sqrt{\frac{\mathrm Nh\,\mathrm Nh'}{\mathrm Nz}}\,Q^{1/4}.
\]
The square root is at most \(D^{1/2}\), and is at most one when one label is \(1\). The same-label lattice error has the analogous bound with \(Q=1\). Counting the indices and the expansion coefficients, the total Gram error in operator norm is \(O_\epsilon((1+M)^C U^\epsilon X^{-1/2}D^2L^2)\). The squared Frobenius norm of the cross block between unit and nonunit labels is \(O_\epsilon((1+M)^C U^\epsilon X^{-1}D^{3/2}L^4)\). The number of branch indices for a fixed label costs a subpower. These estimates give a Gram lower bound by a subpower for sufficiently small \(\rho>0\).

## Price the enlarged projection

Put \(\theta_0=8749/10000,\ \alpha=(1-\theta_0)/2,\ K=A^{-2(1-\theta_0)}\). To bound an overlap with the actual mixed coefficient, expand \(R_m\) and allocate the forced ideal \(z=h\ell\) between the inverse and ordinary factors, with \(\ell\mid m\). This contributes the factor \((\mathrm Nz)^{-1/2}\) from central normalization, multiplied by \((\mathrm Nh)^{1/2}\) from the basis. For the nonunit label the [primitive-conductor ordinary estimate](primitive-conductor-ordinary.md) can lose at most \((\mathrm Nz)^\alpha\) from shortening the ordinary length. The factor at \(\ell\) is harmless since \(\alpha<1/2\), so the only additional conductor cost in the overlap is \((\mathrm Nh)^\alpha\le D^\alpha\). For unit labels the trivial ordinary bound decreases on shortening. All exact zero masks on the two factors are retained.

Define
\[
 E=B^{-(2-\theta_0)}D^{\,2-\theta_0/2}+X^{-1}D^{3/2}.
\]
The squared mass of the overlaps for unit labels is \(O_\epsilon((1+M)^C U^\epsilon K L^2)\). For other labels it is \(O_\epsilon((1+M)^C U^\epsilon K L^2 B^{-(2-\theta_0)}D^{2-\theta_0/2})\); here \(1+\theta_0/2+2\alpha=2-\theta_0/2\) includes the count of labels and the squared branch cost. Eliminating the unit block by the Schur complement gives squared coefficient mass \(O_\epsilon((1+M)^C U^\epsilon K L^6E)\) for the nonunit block. The return to the original basis gives mass \(O_\epsilon((1+M)^C U^\epsilon K L^2)\) for the unit block: the potential extra term is bounded by the same quantity since \(L^8 X^{-1}D^{3/2}E\) decays by a fixed power.

For the row norm of a basis vector, the same expansion replaces the column length by \(X/\mathrm Nz\), with extra scalar \((\mathrm Nh/\mathrm Nz)^{1/2}\le1\) after central normalization. Use the ordinary zero-slot moment on rows whose good core differs from \(d\). For the exceptional rows with core \(d\), use trivial counting and the sixth-root estimate. Each row is exceptional for at most one label. Summing over the branches, divisors and modes within a label by Cauchy–Schwarz costs at most \(L^2(1+M)^C U^\epsilon\), including the expansion coefficient mass. Thus the full smooth squared norm of the removed vector is at most
\[
 (1+M)^C U^\epsilon
 \left[L^4(UK+U^{1/6}XK)+L^8(UKD^2E+U^{1/6}XKE)\right].
\]
The nonunit terms and the regular unit term fit \(1.104\), and the exceptional unit term fits its varying budget. Its loss is \(4/100000+1/100000=1/20000\), strictly inside the margin already proved there. Thus one can pay the divisor loss and take \(\rho>0\) with mode loss at most \(U^{1/100000}\). The [Lean replay](ContactFactorization.lean) checks these margins.

## Consequence for the coprimality step

After this projection, for every good squarefree \(g\) of norm at most \(L\), the restricted vector on \(g\mid n\) is orthogonal up to arbitrary power accuracy to smooth quotient tests with symbols \(\chi_{n/g}(d)\) for all \(d\) in the stated range. Indeed, use the required branch and expand the indicator \(1_{g/h\mid n}\) in the centered basis at divisors of \(g/h\). The smooth norm profile on \(n/g\), normalized at \(X/\mathrm Ng\), is in the same norm coordinate as the original profile and uses the same approximation. Normalization changes by at most polynomial factors. Extra quotient deletions may also be imposed by inclusion–exclusion when the product of \(g\) and their squarefree support has norm at most \(L\). The conclusion holds after multiplying both vectors by the same normalized Gauss factor. Larger divisors and an estimate for the high-frequency residual remain open.

Prepared with OpenAI Codex assistance.
