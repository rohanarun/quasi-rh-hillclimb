# A coefficient-uniform obstruction inside the high squarefree shell

The [centered dual shell](centered-dual-shell.md) is easier at large projector divisors. At small common divisors, removing the diagonal alone cannot yield a coefficient-uniform estimate of the strength needed in the draft. The sharp sextic sieve gives an obstruction even on an annular squarefree frequency block, after passing to coprime column pairs and retaining the radial Fourier kernel. This calculation concerns arbitrary square-summable coefficients.

## Localize the sharp sieve

Write \(H=U^h,\ Y=U^y\) with \(h=1.240,\ y=1.129\). Let \(M\) have entries \(\chi_a(k)\) for good squarefree frequencies and columns of norms at most \(H,Y\). The matching upper and lower bounds give
\[
 \|M\|^2=U^{\tau+o(1)},\qquad
 \tau=5h/6+y/3=1.409666\ldots .
\]
Here and below an arbitrarily small power loss is meant, with a constant depending on that loss. The other three exponents \(h,y,h/3+5y/6\) are strictly smaller. [Xu–Sang, Theorem 1.1](https://arxiv.org/html/2610.17675v2#S1.SS1).

Fix \(\nu=0.001\). Discard rows below \(U^{h-\nu}\) and columns below \(U^{y-\nu}\). Each discarded operator has squared norm smaller by a fixed power, by the same upper bound. The operator triangle inequality preserves the lower bound on the retained rectangle. Partition into norm dyads and fixed column ray classes. There are at most a power of \(\log U\) blocks. A second use of the triangle inequality gives one annular row and column block, with a single column ray class, whose squared norm is \(\gg_\epsilon U^{\tau-\epsilon}\). Choose a unit column vector realizing this bound. The ordinary diagonal of its Gram form costs \(O(H)\), since each symbol has modulus at most one. Hence the off-diagonal form still has size \(\gg_\epsilon U^{\tau-\epsilon}\).

## Extract an exact coprime block

For an off-diagonal pair write its exact gcd as \(g\) and its columns as \(ga,gb\). The residual columns are squarefree, prime to \(g\), in a single ray class, with \((a,b)=1\) and \(a\ne b\). The common symbol contributes exactly \(1_{(k,g)=1}\). Write \(x_g(a)=x(ga)\) for the restricted coefficient vector and let \(C_g\) be the matrix with the off-diagonal coprime Gram kernel on these residual columns, using that row mask. The original off-diagonal form is \(\sum_g\langle C_gx_g,x_g\rangle\). The total coefficient mass satisfies
\[
 \sum_g\|x_g\|_2^2\ll_\epsilon U^\epsilon\|x\|_2^2,
\]
because a column is counted once per divisor, and the divisor bound is uniform.

For clarity, the ordinary sieve upper bound also bounds the exact coprime off-diagonal matrix, up to subpowers. Open \(1_{(a,b)=1}\) with \(\sum_{e\mid a,b}\mu(e)\). Each inner bilinear form is bounded by Cauchy–Schwarz in \(k\) and the ordinary sieve at column length at most \(Y/(\mathrm Ng\,\mathrm Ne)\). Row masks from \(g,e\) have modulus at most one. In each form the two coefficient masses are those of the shortened vectors, so summing over \(e\) costs a divisor bound by Cauchy–Schwarz. Removing the diagonal costs at most \(O(H)\). The same proof allows a bounded multiplier on the frequency rows, with a factor of its supremum norm.

It follows that the sum of contributions with \(\mathrm Ng>U^\nu\) is smaller than \(U^\tau\) by a fixed power. Indeed the leading term in the upper bound with column length \(Y/U^\nu\) loses at least \(U^{\nu/3}\), and the sum of coefficient masses over \(g\) costs only a subpower. Choose the preliminary loss in the sieve lower bound inside this margin. Therefore some \(g\) of norm at most \(U^\nu\) has a normalized coprime form of magnitude \(\gg_\epsilon U^{\tau-\epsilon}\), again by the total coefficient mass. The selected frequency annulus lies above \(U^{h-\nu}\), and both shortened column norms lie above a constant times \(U^{y-2\nu}\). The row mask in this extracted block is the exact moving puncture at \(g\).

## Retain the radial Poisson weight

Use the form on this block with the conjugation convention appropriate to the [first Poisson step](signed-range.md). A single column ray class makes the CRT reciprocity phase constant. Normalized one-column Gauss factors have modulus one on the good squarefree columns and are absorbed into the arbitrary coefficient vector. This preserves its squared mass.

With row dilation one, let \(V\) be the common shortened column dyad scale. The radial kernel is a smooth function of \(U\mathrm Nk/(\mathrm Na\,\mathrm Nb)\), whose value at zero is \(\widehat w(0)>0\) for the nonnegative smooth majorant \(w\). Throughout the block its argument is \(O(U^{1+h-2(y-2\nu)})=O(U^{-0.014})\). After subtracting \(\widehat w(0)\), all fixed derivatives in the logarithms of the two normalized column norms are \(O(U^{-0.007})\). This follows from smoothness in the lattice Fourier variable, whose modulus is the square root of that argument, and radiality. Localize the two column norms to fixed annuli and Fourier separate those logarithms. The integrated supremum in \(k\) of the resulting coefficient is \(O(U^{-0.007})\), by integration by parts. For each separated term use the coprime matrix upper bound with bounded frequency multiplier just proved. The resulting error is \(O_\epsilon(U^{\tau-0.007+\epsilon})\). Thus the constant term supplies the same lower exponent for the weighted form.

The factor \(1/\sqrt{\mathrm Na\,\mathrm Nb}\) in the Poisson scalar is removed by comparable diagonal rescalings on the chosen annulus, leaving the scalar \(U/V\). Since \(V\ll U^y\), the resulting normalized form can have size at least \(U^{1-y+\tau-\epsilon}=U^{1.280666\ldots-\epsilon}\). This exceeds the required \(U^{1.104+\epsilon}\) budget by a fixed power. More generally, for any fixed frequency exponent \(h\) strictly between \(0.8765\) and \(1.258\), choose the localization width \(\nu\) sufficiently small in terms of \(h\). The proof uses the larger of the two mixed sieve exponents. Each loses a fixed power under row or column shortening, and their maximum exceeds the two diagonal exponents in this interval. The upper endpoint gives \(1+h<2y\), while the lower endpoint gives \(1-y+h/3+5y/6>1.104\). The [Lean replay](ContactFactorization.lean) checks the rational exponent comparisons.
u) sufficiently small in terms of (h). The proof uses the larger of the two mixed sieve exponents; each loses a fixed power under row or column shortening. Their maximum exceeds the two diagonal exponents in this interval. The upper endpoint gives (1+h<2y), while the lower endpoint gives (1-y+h/3+5y/6>1.104). Thus the obstruction applies across this interval. The [Lean replay](ContactFactorization.lean) checks the rational exponent comparisons.

This obstruction concerns a high-frequency block with an allowed moving row deletion and arbitrary \(\ell^2\) column coefficients. It does not assert such growth for the detector's Möbius–ordinary coefficients, for a coefficient class with additional size restrictions, or for the sum of all signed blocks. In particular, the lower bound leaves room for an estimate using those coefficients or cancellation between blocks.

Prepared with OpenAI Codex assistance.
