# Use lower-order character classes in the weighted row Gram matrix

The [weighted row Gram reduction](weighted-detector-row-gram.md) leaves pairs with small good gcd and relatively large primitive ratio conductor. The conductor can be large even if one of the two lower-order components of the ratio has very small support. This note controls those pairs by grouping the actual detector rows into classes of their good prime valuations.

## Class blocks and their neighbors

Keep the weighted operator \(D T_{\rm in}\) of the previous reduction, with column cutoff \(N=U^{0.8445}\) and \(\|D\|^2\ll_\epsilon U^{0.014616+\epsilon}\). For two good physical ideals \(u,v\) define the squarefree ideals
\[
 \Delta_k(u,v)=\prod_{\mathfrak p:\ v_{\mathfrak p}(u)\not\equiv
                        v_{\mathfrak p}(v)\pmod k}\mathfrak p,
 \qquad k=2,3.
\]
These are the good conductor supports of the quadratic and cubic powers, respectively, of the ratio character. In particular, the good primitive ratio conductor is supported on the union of the two sets, because a nonzero digit modulo six differs modulo two or three. The bad-prime factor is bounded on the fixed ray data.

For \(k=2\), fix the parity representative \(a\), with valuations zero or one. Rows in that class are \(a d^2\) with \(d\) cube-free of norm \(O(U^{1/2})\). After taking the adjoint row sum, the symbol of \(a\) is a fixed column multiplier of modulus at most one. The variable is the cubic symbol of \(d\). For \(k=3\), fix the representative with valuations zero, one or two. The rows are \(a d^3\) with \(d\) squarefree of norm \(O(U^{1/3})\), and the variable is the quadratic symbol. The same conclusions hold on arbitrary subsets of the original fibre. Fixed units and ray refinements cost only constants.

The cubic sieve of [de Faveri, Theorem 1.1](https://arxiv.org/html/2610.04045v1#Thmtheorem1) applies to cube-free rows and columns, and the quadratic sieve of [Goldmakher–Louvel](https://arxiv.org/abs/1112.1642) applies to squarefree rows and columns. For all good columns at norm at most \(N\), freeze the cubic or square power in the column. Its only effect on the variable row coefficients is a common zero mask. Summing those roots gives the respective squared operator bounds, up to subpowers,
\[
 N+N^{1/3}H+(NH)^{2/3},\qquad N+N^{1/2}H.
\]
Here \(H\) is the norm cutoff for the variable \(d\). These estimates bound the squared adjoint column sum from a single row class by the displayed constant times its squared coefficient mass.

Fix a class and impose \(\mathrm N\Delta_k\le U^\xi\). The differing primes then form a squarefree ideal of norm at most \(U^\xi\). At each such prime there are at most \(k-1\) new digits. Ideal counting and the divisor bound give \(O_\epsilon(U^{\xi+\epsilon})\) neighboring classes, uniformly in the starting class. For each neighboring class pair use Cauchy–Schwarz in the adjoint column sums. Sum over the class pairs using their degree bound and \(2xy\le x^2+y^2\). Thus the signed Gram form restricted by \(\mathrm N\Delta_k\le U^\xi\) costs at most the single-class sieve bound times \(U^{\xi+\epsilon}\) and the squared row coefficient mass. This takes absolute values of whole class-pair sums. The phases within a class remain in the adjoint polynomial.

## Apply the bound with the exact gcd restriction

The same class-pair estimate applies if the exact good gcd is restricted to any set of norms. For each such \(g\), open the coprimality of the quotient rows with the divisor projector, then divide both original rows by \(ge\). Subtracting the same digits from both rows preserves \(\Delta_k\). The reduced rows remain sixth-power-free and their common symbol at \(ge\) is an Euler zero mask. Within each reduced class the variable root has norm bounded by the original \(U^{1/k}\), and the graph of reduced class pairs has the same degree bound. The summed shortened row coefficient masses cost only a divisor power, as in the [exact gcd argument](detector-row-gram.md). This proves the class estimate also with \(\mathrm Ng<U^{0.1555}\). Apply it to \(D^*z\) to pay the outside prime weights.

For \(k=2\), take \(H=U^{1/2}\). The cubic sieve, class degree, and outside weight give a strict margin below \(1-1/14000\) at \(\xi=0.088\). There is a larger range if both parity representatives have norm at least \(U^{0.1555}\). In this case the variable root length is at most \(U^{0.42225}\), also after extracting \(ge\). In fact if \(a'\) is the reduced representative, then \(\mathrm N(ge)\mathrm Na'\ge\mathrm Na\) prime by prime. Now all cubic terms are at most \(U^{0.8445}\), so \(\xi=0.140\) is permitted on this restricted class family.

For \(k=3\), \(H=U^{1/3}\) already bounds both quadratic terms by \(U^{0.8445}\). The degree loss \(\xi=0.140\) and the outside weight fit the same budget. The [Lean replay](ContactFactorization.lean) checks the numerical comparisons.

## Remaining row pairs

The low ratio-conductor estimate of the weighted reduction applies to any symmetric restriction by the class conditions, so one may intersect each new estimate with \(Q>U^{0.698}\) by subtracting its low-conductor part. On this high-conductor range the two new sectors are disjoint, since even their enlarged cutoffs give \(\mathrm N\Delta_2\,\mathrm N\Delta_3\le U^{0.280}\). This is too small for the ratio conductor there.

It is therefore sufficient to estimate the weighted signed Gram form on the actual marked inverse vector for small good gcd and high primitive ratio conductor, with \(\mathrm N\Delta_2>U^{0.088}\) and \(\mathrm N\Delta_3>U^{0.140}\). When both parity representatives are large as above, one can also require \(\mathrm N\Delta_2>U^{0.140}\). The remaining sector includes pairs of largely squarefree sextic rows whose two lower-order ratio components both have large conductor.

The [squarefree detector Poisson calculation](detector-dual-frequencies.md) bounds low frequencies and some high power layers on the squarefree part of the remaining row norm.

Prepared with OpenAI Codex assistance.
