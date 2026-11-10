# Split the prime marks in the detector row Gram matrix

The [row Gram reduction](detector-row-gram.md) places the entire marked inverse product in the column operator. Some of the prime slots can instead be kept as row weights. This shortens the column length and lowers the cutoff for large row gcds on the actual joint saturation fibre.

## Keep part of the prime product outside the column operator

Use the same short inverse length \(b<0.756+1/13000\), the same selected prime product \(Q_b\), and total slot width at most \((1-b)/2\). Factor the selected list of whole slots as \(Q_b=Q_{\rm in}Q_{\rm out}\). Choose a sublist of width at most \(0.8445-b\), within one mesh interval of that value if the total list is longer. For example, add slots successively until the next one would exceed this width, or take the whole list if it fits. The choices are fixed within the common amplitude fibre. The remaining width satisfies
\[
 z_{\rm out}\le
 \max\{0,(1+b)/2-0.8445+\text{mesh}\}<0.0336
\]
when the slot mesh is at most \(10^{-5}\).

The inherited buffered prime bound gives
\[
 \sup_{u\ \text{in the fibre}}|Q_{\rm out}(u)|^2
       \ll_\epsilon U^{\delta z_{\rm out}+\epsilon}
       \ll_\epsilon U^{0.014616+\epsilon},
\]
using \(\delta\le0.435\). The smooth norm heights stay inside the same buffer. [OpenAI's prime bound in a bin](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L15014).

Write \(T_{\rm in}\) for the row operator with column cutoff \(N=U^{0.8445}\) and \(a_{\rm in}\) for the normalized coefficient vector of \(M_bQ_{\rm in}\). As in the previous reduction, its squared coefficient mass is a subpower. Let \(D\) be the diagonal operator with entries \(Q_{\rm out}(u)\). Then the actual marked inverse values are \(z=DT_{\rm in}a_{\rm in}\), and their row Gram matrix is \(DT_{\rm in}T_{\rm in}^*D^*\). This identity retains the outside slot phases and zeros. The operator bound for any of its signed sectors can be obtained from the unweighted sector by applying it to \(D^*z\).

## Larger row gcds

Use the exact gcd and coprimality projector on \(T_{\rm in}T_{\rm in}^*\). The [unrestricted-column sieve calculation](detector-row-gram.md) gives
\[
 N+N^{1/6}H+H^{5/6}N^{1/3}+H^{1/3}N^{5/6},
 \qquad H\ll U/(\mathrm Ng\,\mathrm Ne).
\]
Here the columns may still range over all good ideals in a smooth cutoff, so the small-conductor completion is unchanged in form. The signed gcd bound again sums the row coefficient masses with only divisor multiplicity losses, now for \(D^*z\). If \(\mathrm Ng\ge U^{0.1555}\), then \(H\ll U^{0.8445}\), so the largest term is at most \(U^{7(0.8445)/6}\) up to fixed factors. Including the outside weight gives exponent
\[
 \tfrac76(0.8445)+0.014616=0.999866<1-1/14000 .
\]
This covers the diagonal and all the larger gcd pairs in the weighted kernel.

## Lower ratio conductors and the remaining vector

For the smooth column sum at \(N=U^{0.8445}\), primitive completion still gives \(O_\epsilon(U^\epsilon\sqrt Q)\) at ratio conductor \(Q\), with the extra punctures kept. The old cardinality estimate gives at most \(U^{0.636+\epsilon}\) rows on the fibre. For \(Q\le U^{0.698}\) the symmetric Schur bound, including the outside weight, has exponent at most \(0.636+0.698/2+0.014616<1-1/14000\). The [Lean replay](ContactFactorization.lean) checks the mesh, weight and exponent margins.

Thus it suffices to estimate the signed Gram form on the actual marked vector \(z\) for the pairs with \(\mathrm Ng<U^{0.1555}\) and \(Q>U^{0.698}\), with the kernel including the outside product \(Q_{\rm out}(u)\overline{Q_{\rm out}(v)}\). The Cauchy–Schwarz argument is the same, using \(DT_{\rm in}\) in place of \(T\). The original unweighted kernel provides a separate reduction with a larger low-conductor range. Each reduction has its own remaining signed form.

Prepared with OpenAI Codex assistance.
