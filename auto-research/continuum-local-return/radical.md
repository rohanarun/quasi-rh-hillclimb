# The long inverse count on small-radical rows

Let $u$ be an Eisenstein integer whose principal ideal is sixth-power-free, and write $q$ for the ideal norm. The radical of $(u)$ is the product of its distinct prime ideal divisors. For $X\ge1$ and any $\epsilon>0$,

$$
\#\{u:q_{(u)}\asymp U,\ q_{\mathrm{rad}(u)}\le X\}\ll_\epsilon X^{1+\epsilon}.
$$

Indeed, each fixed radical $b$ allows at most $5^{\omega(b)}$ choices for the positive valuations, since each belongs to $\{1,2,3,4,5\}$. A principal ideal has six generators. For each $\epsilon>0$, absorb the finitely many prime ideals of norm less than $5^{1/\epsilon}$ in a constant to obtain $5^{\omega(b)}\ll_\epsilon q_b^\epsilon$. There are $O(X)$ ideals of norm at most $X$ by lattice point counting in the Eisenstein integers. Summing proves the estimate. Any restrictions selecting a detector fibre or a height can only reduce its count. [Physical rows in the pinned preprint](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L5238-L5288).

On the parameter rectangle and inverse-length band of [the proposal](../proposals/2026-11-17-local-continuum-return.md), set $L(r)=1/6+(5/6-\delta)r$ and $G=6\cdot10^{-7}$. The exact tangent enclosures give

$$
L(r)-G>\frac58+\frac1{3000}.
$$

For the lower endpoint use $r\ge1+\delta[1-p(1+6g_0-4g_1)]/[3(5/6-\delta)+2\delta(1-p(1+2g_1))]-10^{-6}$. Bound the positive numerator below and denominator above throughout the rectangle. With $X=U^{5/8}$ the elementary count proves the requested bound for all these fibres. The remaining rows include every squarefree $(u)$ of norm comparable to $U$ for sufficiently large $U$. [Exact replay](radical.py) · [Tangent and cutoff enclosures](crossing.md).

The zero-free application assumes the preprint's 7/8 theorem. Prepared with substantial OpenAI Codex assistance, building on the source row decomposition and tracker #143.
