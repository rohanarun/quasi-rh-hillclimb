# The residual moment on squarefree rows

Assume the preprint's 7/8 theorem and the physical hypotheses of the [four-factor reduction](four-factors.md). Let $c=1/100000$, let $q$ denote the ideal norm and let $q_u\asymp U$. The [radical-dependent physical bound](physical-radical.md) leaves rows with $q_{\operatorname{rad}(u)}>U^{1-c}$. In this class one can place the residual moment on squarefree rows with a controlled moving twist.

Use primary generators outside the fixed set $S$ and write $u=\xi w k$, where $\xi$ ranges over the six units, $(w,k)=1$, $k$ is squarefree and each prime in $w$ has valuation between two and five. The physical rows are coprime to $S$. A bounded factor on $S$, if included in the larger detector family, may instead be fixed with the unit. Set $E=q_u/q_{\operatorname{rad}(u)}\ll U^c$. Since $j\le2(j-1)$ for each $j\ge2$,

$$
q_w\le E^2\ll U^{2c},
\qquad q_{\operatorname{rad}(w)}\le E\ll U^c,
\qquad q_k\asymp U/q_w .
$$

There are $O(U^c)$ choices of $w$. Every powerful ideal has the form $a^2b^3$ with $b$ squarefree, uniquely by reducing its exponents modulo two. Ideal counting gives at most $O(X^{1/2}\sum_b q_b^{-3/2})=O(X^{1/2})$ such ideals up to norm $X$. This is the preprint's powerful-part decomposition with a sharper range supplied by the retained radical condition. [Pinned decomposition, annulus and frozen mask](https://github.com/openai/math/blob/1581d4cbdd69a0faf34b2089614fe2a814316a6a/preprints/The-Quasi-Riemann-Hypothesis-September-30-2026/build/paper.tex#L5238-L5321).

Fix $w,\xi$, the dyads, sign $\varsigma$ and original ray presentation $\nu$. In **both** inverse columns replace the original character by its equal expression
$\nu(n)\chi_n(\xi w)^{\varsigma}\chi_n(k)^{\varsigma}$, with negative powers zero at nonunits. In particular a prime of $w$ keeps both its prescribed phase and its original zero. The factor depending on $w$ stays in the coefficients, with $w$ uniform and $S$ fixed. The row outside this factor is squarefree in the actual residual annulus, and retains the original rowwise norm powers, the common inner frequency and all restrictions defining the fibre. Column lengths here and below continue to be measured in the original $U$.

Here is a sufficient **open** squarefree-row estimate. For $X_j=U^{x_j}$ in the four-factor intervals, let $M_{j,k}^{(w)}$ denote the centrally normalized inverse sum just described with the original profile. Assume for every prescribed $\epsilon>0$ the uniform bound

$$
\sum_{k\text{ in the residual fibre}} |M_{1,k}^{(w)} M_{2,k}^{(w)}|^2
\ll_\epsilon q_{\operatorname{rad}(w)}^{100}U^{63/50+\epsilon}.
$$

The constants must be uniform over the moving $w$, with the prescribed small physical height payment. Fixing the unit and $w$ and then summing this hypothesis gives exponent at most $63/50+101c+\epsilon$. On each surviving row the squared product is $\gg U^{\delta(x_1+x_2)-\epsilon}$. The [rational replay](four_factors.py) proves $R+\delta(x_1+x_2)>63/50+1/250$ and $1/250-101c>10^{-7}$. After reserving the small power losses, this counts the survivors within $O(U^{R-10^{-7}})$. The exceptional sets already had that count independently. This suffices for the local count used by the return. The variable twist allowance in this implication is explicit. No estimate with that allowance and the required exponent has been established here.

Prepared with OpenAI Codex assistance, building on the preprint's squarefree-row decomposition and the marked counts in tracker #143.
