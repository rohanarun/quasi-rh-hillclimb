# Center the smooth dual shell before completion

The [dual sieve](dual-sieve.md) estimates positive norms after opening the coprimality projector. A different treatment is available when the opened columns have a large common divisor or the projector divisor is large. For this treatment keep a complete smooth frequency shell. Center it before bounding any of the projector terms.

## Remove the artificial diagonal

Fix \(g,\ell\) and the two residual columns \(a,b\) of the [signed range reduction](signed-range.md), with \(\mathrm Na,\mathrm Nb\asymp Y_0=X/G\). The true off-diagonal contribution has \((a,b)=1\). The only coprime pair with \(a=b\) is the unit pair, which belongs to the physical diagonal already handled there. Work with \(a\ne b\) before opening the projector.

On the coprime pairs, CRT writes the nonzero-frequency kernel as two bounded one-column Gauss factors, a fixed-ray reciprocity phase, and \(\overline{\chi_a(k)}\chi_b(k)\) or its conjugate. The dilation by \(\ell\) has only bounded column factors. Use that formula to extend the kernel off coprime pairs, keeping the same smooth function of the two norms and the frequency. For this extension the exact identity is
\[
 \sum_{\substack{a\ne b\\(a,b)=1}} K(a,b)
   =\sum_e\mu(e)\sum_{v_1\ne v_2}K(ev_1,ev_2).
\]
The extension here includes the squarefree and support conditions on \(a,b\), and the identity is applied for each smooth shell. Equivalently, if the artificial diagonal has already been included in the tensor with this extension, then for any \(a=b\ne1\) its coefficient after the entire \(e\)-sum is \(\sum_{e\mid a}\mu(e)=0\). This cancellation is exact and does not require summing over frequency shells. It does require the whole \(e\)-sum if the artificial diagonal is left in the tensors. Keeping \(v_1\ne v_2\) explicitly avoids that dependence.

## Complete in the frequency variable

Let \(Y=Y_0/E\), where \(\mathrm Ne\asymp E\), and let \(t=(v_1,v_2)\) with \(\mathrm Nt\asymp T\). The opened columns \(v_i\) are squarefree and prime to \(e\). Write \(v_1=tz_1,\ v_2=tz_2\). The frequency character is a primitive nonprincipal character modulo \(z_1z_2\) on the good primes, with the puncture \((k,et)=1\). Its good conductor norm satisfies \(Q\asymp (Y/T)^2\). It is nonprincipal since \(v_1\ne v_2\). The fixed bad-prime ray data can be included as a bounded weight modulo a fixed modulus coprime to \(z_1z_2\).

For a smooth shell \(\mathrm Nk\asymp H\), expand the puncture with \(d\mid et\) and put \(k=d k'\). These divisors are coprime to \(z_1z_2\). The shell weight, including the original radial Fourier kernel, is smooth at scale \(H/\mathrm Nd\) after this substitution. Its normalized derivatives are bounded uniformly on the retained shells and have rapid decay beyond the Fourier scale. There is no need to separate the two column profiles for this estimate because the two columns are held fixed.

Poisson summation in \(k'\) gives a bound \(O(\sqrt Q)\) for each divisor and each bounded shell seminorm. In detail, writing \(V=H/\mathrm Nd\), the primitive complete sums have modulus at most \(\sqrt Q\) and the zero frequency vanishes. With the fixed ray modulus absorbed into constants, the resulting absolute bound is
\[
 \ll_B \frac{V}{\sqrt Q}\sum_{h\ne0}
                  (1+V\,\mathrm Nh/Q)^{-B}\ll_B\sqrt Q
 \qquad(B>2).
\]
The last inequality is the planar lattice count for nonzero vectors. It holds even for \(V>Q\), where the bound can be improved by rapid decay. A finite Fourier expansion of the fixed periodic ray weight gives the same estimate with constant factors, by CRT. Summing over \(d\mid et\) gives \(U^\epsilon Y/T\). Since \(\mathrm Nd\ll ET\) for every deletion divisor, the same calculation gives arbitrary decay whenever \(HTE/Y_0^2\) exceeds a fixed positive power of \(U\). At the Fourier scale \(H\asymp LY_0^2/U\), this happens when \(e_0+\log_U T+\log_U L>1\) with a fixed gap, where \(e_0=\log_U E\). The Gauss factors from the first Poisson step are constant during this completion. The second Poisson step is only applied to the frequency character.

## Sum the centered columns

For fixed \(g,e\), there are \(O(T(Y/T)^2)=O(Y^2/T)\) pairs in the \(t\)-dyad. Their original coefficient products are \(O_\epsilon(X^{-1}U^\epsilon)\). Count \(O(GE)\) choices of \(g,e\) and a divisor bound for \(\ell\mid g\). The Poisson scalar is \(U/(LY_0)\), and \(GEY\asymp X\). Hence the resulting shell contribution is at most
\[
 U^\epsilon\,\frac{U}{LY_0}\frac{Y^2}{T^2}.
\]
Writing \(y=\log_U Y_0,\ e_0=\log_U E,\ t_0'=\log_U T,\ \lambda=\log_U L\), this is the exponent \(1+y-\lambda-2(e_0+t_0')\). The window \(y<1.135\) gives a strict margin below \(1.104\) when \(e_0+t_0'+\lambda/2\ge0.516\). This holds for every complete smooth shell, including shells at the full Fourier cutoff. The [Lean replay](ContactFactorization.lean) checks the numerical margin.

This estimate is for centered terms and smooth shells. An arithmetic restriction on the shell, such as restricting \(k\) to squarefree ideals, would need its own treatment before frequency completion. Also, the earlier positive-norm sieve bounds include the artificial diagonal in each \(e\)-term. In a joint use of these estimates, one must retain its exact cancellation or use centered bounds throughout that shell. The centered small-divisor contribution at the full Fourier scale is still open.

The [centered sieve obstruction](centered-sieve-obstruction.md) gives a lower bound for arbitrary coefficients on an annular high squarefree block, even after removing the diagonal.

Prepared with OpenAI Codex assistance.
