# A growing Gauss-row projection fits the mixed moment budget

This proves a bound for an actual projection of the squarefree-row mixed polynomial in the [squarefree reduction](squarefree.md). It uses the inherited short moments, elementary lattice Poisson summation and a Gram estimate. No pole transfer to coprime squarefree columns is required. The complementary row space and the full mixed moment remain open.

Fix the separated profiles and common deletion in one of the small-powerful-part blocks. Write \(F(z)\) for the centrally normalized coprime squarefree convolution of the inverse and ordinary factors, of lengths \(U^\beta,U^\gamma\). Here \(\beta\le b_0+1/13000<1\). The ordinary factor has no Möbius coefficient. All rows and labels below are good primary Eisenstein ideals, with the fixed bad-prime set excluded. Write \(w\) for a fixed, nonnegative smooth annular row weight of scale \(U\), and assume \(w\) is not identically zero.

On the squarefree rows let
\[
 f(z)=w(\mathrm Nz/U)^{1/2}F(z),\qquad
 v_R(z)=U^{-1/2}w(\mathrm Nz/U)^{1/2}
             \gamma_1(z)\overline{\chi_z(R)} .
\]
Here \(\gamma_1(z)\) is the normalized sextic Gauss sum, of modulus one on the good squarefree rows. Use one vector per good sixth-power-free ideal \(R\) with \(\mathrm NR\le K\). These are the row vectors in [bramble_trace, §7](https://rstation.ai/problems/riemann_hypothesis/papers/10/v1). That source decomposes the pairing with a single vector into a primitive pole and a contour. Its growing-family projection result in §8 assumes a Gram bound. The calculation below bounds the combined pairing for the specific mixed polynomial and establishes the needed Gram bound in a smaller label range.

## Overlap with each row vector

Open the coprimality of the two squarefree factors of \(F(z)\) by the Möbius projector. If \(g\) is extracted from both factors, the central normalization produces \((\mathrm Ng)^{-1}\), the common character factor is bounded by one with its zeros retained, and the remaining factors are prime to \(g\). Expand the ordinary squarefree condition by the square divisor \(e^2\), giving a further \((\mathrm Ne)^{-1}\). The resulting two annular polynomials have lengths shortened by \(g\) and \(ge^2\), with the common moving Euler deletions. The extraction is the one used in the pointwise argument in [the squarefree reduction](squarefree.md), here estimated by row norms.

The unmarked inverse second moment has exponent one for every length exponent at most one. The ordinary fourth moment without marks gives an ordinary second moment of size \(O_\epsilon(U^{1+\epsilon})\) by Cauchy–Schwarz and row counting. These inherited estimates apply to the fixed twists and separated profiles in the detector. [Xu–Sang, Theorem 2.2 and Lemma 6.1](https://arxiv.org/html/2610.17675v2).

The added Euler deletions preserve the second-moment exponents. On the inverse side expand the geometric inverse Euler factors over all powers of primes of the deletion. Minkowski costs at most the product of \((1-(\mathrm Np)^{-1/2})^{-1}\) over those primes, a subpower of the polynomial deletion norm. On the ordinary side the corresponding finite expansion has weights \((\mathrm Nd)^{-1/2}\). All residual scales are smaller, with fixed smooth seminorm and polynomial height costs. Fixed norm twists cost only allowed small powers in the common height range.

For each \(g,e\), Cauchy–Schwarz on the squarefree rows therefore bounds the sum of the absolute product of the two separated factors by \(O_\epsilon(U^{1+\epsilon})\). Sum the harmonic weights \((\mathrm Ng\,\mathrm Ne)^{-1}\) over the polynomial ranges. Since \(|\gamma_1(z)\chi_z(R)|\le1\), this proves
\[
 |\langle f,v_R\rangle|\ll_\epsilon U^{1/2+\epsilon}
\]
uniformly in \(R\). It bounds the combined overlap directly, including the contribution represented by the contour.

## Gram matrix for small labels

Let \(V\) have columns \(v_R\), and let \(G=V^*V\). Its diagonal is the weighted density of squarefree rows prime to \(R\), divided by \(U\). Uniformly for polynomial \(K\), this is
\[
 G_{R,R}=c_w\prod_{\mathfrak p\mid R}(1+(\mathrm N\mathfrak p)^{-1})^{-1}
        +O_\epsilon(U^{-1/2+\epsilon}K^\epsilon)
\]
for \(c_w>0\) depending on the fixed data. For instance, expand the squarefree indicator and the \(R\)-prime exclusions, then use lattice counting for multiples of the resulting ideals. A lattice progression of norm scale \(Y\) has weighted error \(O(\sqrt Y+1)\); the sum of those errors is \(O_\epsilon(U^{1/2+\epsilon}K^\epsilon)\) before dividing by \(U\). In detail, after writing the row as \(d^2z_0\), open the \(R\)-prime exclusions on \(z_0\) and count multiples of \(e\mid\operatorname{rad}R\). The errors are bounded by \(\sum_{\mathrm Nd\ll\sqrt U}\sum_{e\mid\operatorname{rad}R}(\sqrt U/(\mathrm Nd\sqrt{\mathrm Ne})+1)\). Extending the main-term \(d\)-sum to infinity costs \(O_\epsilon(\sqrt U K^\epsilon)\). The positive Euler product on the diagonal is \(\gg_\epsilon K^{-\epsilon}\).

For \(R\ne R'\), the Gauss factors cancel in the Gram entry. Reciprocity gives a finite fixed local character times a character with good primitive conductor \(D\ll K^2\), with explicit zero masks at the canceled primes. This good character is nonprincipal: some prime valuation of \(R\) differs from that of \(R'\) modulo six, as both labels are sixth-power-free. Open the squarefree row indicator by \(d^2\mid z\). At each \(d\), open the canceled-prime masks by divisors. For a nonprincipal primitive character of good conductor \(D\), Poisson on the fixed Eisenstein lattice bounds a smooth row sum by \(O(\sqrt D)\), uniformly in its scale. The zero frequency vanishes; the Gauss factor and rapid decay give this bound also when the dual range is short. Fixed local classes alter only the constant. The canceled-prime divisor count costs \(K^\epsilon\).

Split at \(\mathrm Nd=U^{1/2}D^{-1/4}\). The small \(d\) use \(O(\sqrt D)\); the large \(d\) use absolute counting with the original masks, \(O(U/(\mathrm Nd)^2)\) per \(d\) in the nonempty range. The total, after normalization, gives
\[
 |G_{R,R'}|\ll_\epsilon U^{-1/2+\epsilon}K^{1/2+\epsilon}.
\]
There are \(O(K)\) labels. Hence the off-diagonal row sum is \(O_\epsilon(U^{-1/2+\epsilon}K^{3/2+\epsilon})\). For \(K\le U^{103/1000}\) it is smaller than half the smallest diagonal entry for sufficiently large \(U\). This proves \(G\) invertible with \(\|G^{-1}\|\ll_\epsilon U^\epsilon\).

## Projection and remaining estimate

Let \(P=VG^{-1}V^*\). The overlap estimate and the Gram bound imply
\[
 \|Pf\|_2^2=(V^*f)^*G^{-1}(V^*f)
       \ll_\epsilon U^{1+\epsilon}K
       \ll_\epsilon U^{1.103+\epsilon}.
\]
This is below the required \(U^{138/125+\epsilon}\) budget, uniformly for the projected squarefree-row component. [The Lean replay](ContactFactorization.lean) checks the exponent comparisons.

Consequently the squarefree-row part of the full mixed moment can be reduced to \(\|(I-P)f\|_2^2\), with the entire small-label projection already bounded. This is a projection in the original row space, not a subtraction from the signed Poisson sum. It does not imply that the difficult contribution lies in the removed projection. The complementary squarefree-row norm and the nonsquarefree rows not excluded by the conductor condition still need a bound at the target exponent. The conditional scalar endpoint and the tracker record are unchanged.

Prepared with OpenAI Codex assistance.
