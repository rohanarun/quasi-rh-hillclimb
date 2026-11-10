# Use the distribution of the detector's prime amplitudes

The inherited count retains the mean prime amplitude \(p\) of a fixed detector bin. The same selection argument gives a stronger count on bins with sufficient amplitude variation. This applies to the actual detector rows, including squarefree rows, in the [short-factor reduction](factorization.md).

## A quantitative selection gain

Write \(w_i\) for the length of prime slot \(i\) at base \(U\). If \(g_i\in[0,\delta/2]\) is its binned amplitude, write \(\alpha_i=g_i/\delta\), \(W=\sum_i w_i\), and \(p=\sum_i w_i\alpha_i/W\). Put
\[
 A=\sum_i w_i(\alpha_i-p)_+,\qquad
 W_+=\sum_{\alpha_i>p}w_i .
\]
The fixed bin determines all these quantities. Slots with zero binned amplitude need no lower bound. These are the same bins and slots used by [the inherited amplitude-class argument](https://github.com/GTimG/QuasiRiemannTracker/blob/3243c97f7a4d25ceacdf241abe91be4f0c0a2fb4/submissions/2026-11-01-closest-fraction-contact/src/Candidate/Local/Qrh/JointDetector/BoundaryPhysical/PhysicalDirect/AmplitudeClass.lean).

Let \(F(z)\) be the weighted sum of amplitudes when the highest \(\alpha_i\) are taken up to length \(z\), with at most one fractional slot. Then \(F(z)-pz\) is concave, vanishes at \(0,W\), and equals \(A\) at \(W_+\). When \(A>0\), its two chords give
\[
 F(z)-pz\ \ge\
 A\min\!\left\{\frac{z}{W_+},\frac{W-z}{W-W_+}\right\}
 \ \ge\ A\min\!\left\{\frac zW,1-\frac zW\right\}.
\]
When \(A=0\), the latter inequality is immediate. Drop the possible fractional slot and any zero-amplitude slots. The gain in \(\log_U\) of the squared selected product is at least \(2\delta F(z)\) up to the usual mesh and capacity decrement losses. The selected indices are fixed on the bin, and zero-amplitude slots were only used to define the fractional fill. [OpenAI's whole-slot rounding and lower bounds](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15112).

## Apply the gain at both short-factor capacities

The two lengths are \(z_b=(1-b)/2\) and \(z_c=(B_{\rm face}-2c)/\Lambda\). In the remaining short-factor rectangle both belong to \((0.1219,0.1254)\). In the local conductor window the stock \(W=\ell/d\) belongs to \((0.2138,0.214)\). Thus \(\min(z/W,1-z/W)>0.413\) at either capacity. We may use different selections in the two moments, since each supplies a separate count on the same joint saturation fibre. Use the inherited marked inverse and uncapped ordinary moments at their original capacities with the strengthened lower bounds. Their resulting count exponents, before the small losses, are at most
\[
 I(b)-2\delta(0.413)A,\qquad P(c)-2\delta(0.413)A .
\]

There is no need to pay for the two worst length drops simultaneously. With \(u=\delta(1-p)\), \(v=\delta A_C\), write
\[
 I(b)-R_0=u(b_0-b),\qquad P(c)-R_0=v(c_0-c).
\]
A weighted average gives
\[
 \min\{I(b),P(c)\}-R_0
 \le \frac{uv}{u+v}\,[t_0-b-c].
\]
The factorization has \(a+b+c=r+o(1)\), \(a\le1/5850\) and \(r\ge t_0-\eta/V\), so the bracket is at most \(1/5850+\eta/(239/600)+o(1)\). On the rectangle the harmonic factor is less than \(0.147\), using \(\delta\le0.435,\ 1-p\le0.501\) and \(A_C<1.003\). Therefore a sufficient condition for the count \(U^{R_0-\eta+\epsilon}\) is
\[
 2\delta(0.413)A >
 \eta+0.147\left(\frac1{5850}+\frac{\eta}{239/600}\right).
\]
In particular, \(A\ge0.000137\) suffices with a fixed margin. The [Lean replay](ContactFactorization.lean) checks the rational bounds for the two capacities, the stock and the gain. One can also retain the exact two chord gains separately in the minimum of the two count exponents.

This reduction covers sufficiently uneven amplitude bins before the physical return. The remaining bins can have almost constant amplitude. Indeed \(A\le W(1/2-p)\), so the uniform threshold above cannot hold near \(p=1/2\). Those bins still require an additional count or a stronger return estimate. Liu's coefficient-two moving-width moment is stated over fields containing \(\mu_{12}\), so the direct count here uses the existing Eisenstein moments in the draft. [Liu, §2 and Theorem 4.9](https://hexagonmath.org/pdf/2611.00082v1#page=4).

Prepared with OpenAI Codex assistance.
