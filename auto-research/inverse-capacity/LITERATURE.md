# Literature used

| Source | What it gives | How it is used here |
|---|---|---|
| OpenAI, *The Quasi-Riemann Hypothesis* preprint, openai/math `fd4aeeb`, `build/paper.tex` (git blob `268c4e32…`) | The whole method; line numbers below refer to it | Traced the inverse capacity to the cubic large sieve (CUBIC_SIEVE_BARRIER.md) |
| D. R. Heath-Brown, *Kummer's conjecture for cubic Gauss sums*, Israel J. Math. 120 (2000), Thm 2 | Cubic large sieve U + V + (UV)^{2/3} | Preprint `eq:cubic-large-sieve` (7491), origin of the mark saving u |
| V. Blomer, L. Goldmakher, B. Louvel, *L-functions with n-th order twists*, IMRN 2014 ([arXiv:1112.1650](https://arxiv.org/abs/1112.1650)) | Same bound for all orders n ≥ 3; recursion method | Preprint's sextic large sieve (4707) |
| A. Dunn, A. de Faveri, J. Hoffstein, *Non-orthogonality of the cubic and quartic large sieves via Rankin–Selberg*, [arXiv:2607.07911](https://arxiv.org/abs/2607.07911) (July 2026) | Thm 1.1: Ξ₃(A,B) ≫ (AB)^{−ε}(A + B + (AB)^{2/3}), so Heath-Brown is sharp; conjectured order-n norm (AB)^{o(1)}(A + B + A^{1−1/n}B^{2/n} + A^{2/n}B^{1−1/n}) | The barrier: no general-coefficient route to λ < 2 |
| A. Dunn, M. Radziwiłł, *Bias in cubic Gauss sums: Patterson's conjecture*, [arXiv:2109.07463](https://arxiv.org/abs/2109.07463) | Under GRH for Hecke L-functions over Q(ω): Σ_{p≡1(3)} (S_p/2√p) W(p/X) ~ c·X^{5/6}/log X (corrected Patterson conjecture); Heath-Brown proved X^{5/6+ε} unconditionally | Bounds how strongly prime-supported coefficients can correlate with Gauss sums; relevant to the structured-coefficient route |
| M. H. Hamdar, *Hecke L-functions away from the central line*, [arXiv:2509.06152](https://arxiv.org/abs/2509.06152) | First moment of cubic Hecke L-functions across the strip, via Heath-Brown's sieve | Context only; no large-sieve improvement |
| *Metaplectic cusp forms and the large sieve*, [arXiv:2403.13151](https://arxiv.org/abs/2403.13151) (Algebra & Number Theory 2025) | Thm 4.1 records a cubic sieve with one non-squarefree variable: M^{1/3}(M+N) | Possible tool for the unrestricted-row form; not used yet |

The Dunn–de Faveri–Hoffstein results were read from the arXiv HTML
version and a summary page; the PDF could not be opened from this
environment. Their exact statements should be checked against the paper
before being cited in a submission.
