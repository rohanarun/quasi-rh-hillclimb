# A spacing condition on zeros in the critical detector

Assume the preprint’s $7/8$ theorem and the marked count inputs of tracker #143. This gives the required $O_\epsilon(U^{R-10^{-7}+\epsilon})$ count on one class of rows with distinct near-edge zeros. Their ordinates can have unequal gaps on the natural $1/\log U$ scale. The proof uses evaluations of the same detector on one actual Hecke presentation, with its original Euler deletions. The height factors and order of the physical parameter choices are those of the [four-factor count](four-factors.md).

Fix the physical and buffered bins. Write $a=(1+\delta)/2$, $B=2t_0\in(2.25,2.26)$ and $\lambda=10^{-6}$. Choose any fixed $0<d\le10^{-10}$, then the preliminary losses and a bin mesh $e<d/100$. Let $J=\lfloor .30d\log U\rfloor$. Consider $J+1$ distinct zeros $\rho_0,\ldots,\rho_J$ of one admitted nonprincipal presentation in the buffered detection range. Take $\Re\rho_j\ge a-d$ and require their ordinates to lie in an interval of length $d$. For example all ordinates may be required to have absolute value at most $3iT_1$ for the source height label $i$. The upper bin guard gives $\Re\rho_j<a+2e$. Put $s_* = \min_j\Re\rho_j + i\min_j\Im\rho_j$ and
$$
 z_j=(\rho_j-s_*)\log U,\qquad
 b_j=\frac{\exp(Bz_j)}{\prod_{k\ne j}(z_j-z_k)} .
$$
Then $\Re z_j\ge0$ and $Z=\max |z_j|\le1.5d\log U$.

**Count.** Rows admitting any such packet with
$$
 \left|\sum_{j=0}^J b_j\right|\ \ge\ U^{-.20d}\sum_{j=0}^J|b_j|                  \tag{1}
$$
satisfy the saved count. In particular, outside that exceptional set every eligible packet must fail (1). The criterion is unchanged by translating the common reference point $s_*$, since this multiplies all $b_j$ by the same scalar. Below we use the displayed choice of $s_*$ to prove the count. A sufficient spacing condition that does not require computing the $b_j$ is given at the end.

## A linear combination of the detector evaluations

Let $w_j=b_j/(\sum_k b_k)$ and define $P(\alpha)=\sum_j w_j e^{-\alpha z_j}$. Its value at zero is one, and (1) gives $\sum|w_j|\le U^{.20d}$. Use the Gamma detector $\mathcal J$ with cutoff $U^{B-5\lambda}$ from the [multiplicity proof](detector-multiplicity.md). Each evaluation at $\rho_j$ is $O(U^{-1})$. The combination $\sum_jw_j\mathcal J(\rho_j)$ is therefore $o(1)$. On the original Dirichlet series this is exactly the detector at $s_*$ with the additional multiplier $P(\alpha)$, where $\alpha=\log_U N(ln)$ is the exponent of its total ideal norm. The unit term is unchanged and the original convolution vanishes at all other norms up to the cutoff. The tail must consequently have magnitude $1+o(1)$. This argument permits the nodes and weights to vary with each row. [Original detector and profiles](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L4510-L4681).

For every fixed derivative order $m$, the derivatives with respect to the unscaled log norm are bounded by $U^{.20d}(Z/\log U)^m$ on $\alpha\ge0$. This bounds the common Fourier weight in the detector separation and permits the same tail truncation after increasing its fixed order. The dyads of total exponent at least $4.3$ have ordinary exponent greater than $2$ and remain negligible by the reflected ordinary estimate. On the rest, restoring the powers from $\Re s_*$ and the common weight costs at most $U^{(4.3+.20)d+\epsilon_1}$ in the magnitude. Some original dyad has an integral of magnitude at least a negative power of $\log U$. The squared saturation debit on its unfiltered factors is at most $9d$ apart from the freely chosen losses. Even twice this debit is below the $5\cdot10^{-8}$ reserve in the four-factor comparisons. Those comparisons therefore place that same contributing dyad inside $|\alpha-B|\le6\lambda$ throughout its actual annulus, except on the stated row count. The Fourier variable may be row-dependent. The separated inverse and ordinary profiles and their allowed heights are the ones in the original source, so the count requires no union over sets of zeros. [Four-factor localization and its margins](four-factors.md) · [Filtered dyads and height allowances](detector-multiplicity.md).

For distinct complex numbers $z_j$, interpolation of the monomials and comparison of the leading coefficient give $\sum_j z_j^r/\prod_{k\ne j}(z_j-z_k)=0$ for $0\le r<J$. Hence $P^{(r)}(B)=0$ for all these orders. On the interval between $B$ and $\alpha$ in the remaining annulus, $|P^{(J)}|\le U^{.20d}Z^J$ because that interval is positive. Taylor’s integral remainder gives, for each fixed $m<J$,
$$
 (\log U)^{-m}|P^{(m)}(\alpha)|
 \le U^{.20d}\left(\frac Z{\log U}\right)^m
          \frac{(6\lambda Z)^{J-m}}{(J-m)!}.
$$
For large $U$, $J-m\ge .29d\log U$. The factorial bound $k!\ge(k/\mathrm e)^k$ and $6\lambda(1.5)\mathrm e/.29<e^{-9}$ give a bound $O_m(U^{(.20-9\cdot.29)d})$ for each of these seminorms. Apply it to the common product test before Fourier separation. The original unfiltered dyad costs at most $U^{2.261d+\epsilon_1}$ on this annulus. Thus its weighted integral is $O(U^{-.149d+\epsilon_1})$, contradicting its lower bound after choosing $\epsilon_1<d/100$. This proves (1). [Rational guards](zero_clusters.py).

## Alternating phases on an inclined line

Order the nodes by $t_j=\Im z_j$. Suppose successive gaps $t_{j+1}-t_j$ are at least one. Assume there are real numbers $c,s$ and $|s|\le1$ such that the real deviations $\Re z_j-c-st_j$ lie in an interval of width $.01/\log(J+2)$. Finally, for some phase $\phi$, assume each $e^{iBt_j}$ lies within angle $1/4$ of $(-1)^j e^{i\phi}$. These conditions allow skipped periods and independent variations of the ordinates inside the indicated phase intervals. They imply (1) for large $U$.

Indeed $z_j-z_k=(s+i)(t_j-t_k)$ plus a real error of size at most $.01/\log(J+2)$. Relative to this leading factor the argument changes by at most $.02/(|j-k|\log(J+2))$. In the product over $k\ne j$ these errors total at most $.04(1+\log J)/\log(J+2)<.08$ for large $U$. The signs in the unperturbed denominator give $(-1)^{J-j}$ times a phase independent of $j$. After a common rotation, the $b_j$ consequently lie within angle $.33$ of the positive real axis. Their sum has magnitude at least half their total absolute mass. This proof applies also when the real parts vary along the line across a fixed fraction of $d$.

The centered cluster theorem gives a lower count and, at some radius, an arbitrarily shallow packet. To see why vertical spacing alone leaves (1) open, take model nodes on one vertical line with scaled imaginary parts $2\pi n/B$ for distinct integers $n$. The factors $e^{Bz_j}$ all coincide. The degree-zero interpolation identity then gives $\sum_j b_j=0$ for every subset with at least two nodes, even when the ordinates are evenly spaced. Whether actual Hecke zeros avoid this phase alignment on enough rows remains open, as does the proposed all-moduli endpoint. [Cluster centered on the selected zero](selected-zero-cluster.md) · [Ordinary-witness cluster](zero-clusters.md) · [Conditional endpoint and remaining physical input](lean/README.md).

Prepared with OpenAI Codex assistance.
