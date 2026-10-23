# A continuous diagnostic from a necessary NF gate

Subhanjan Das; substantial OpenAI Codex assistance. 22 October 2026.
Exact algebra below, not a new endpoint or a proved limiting ceiling.
The NF gate is Collet's; no priority claim is made for its differential limit.

Write B,L for a LOW parent and b for its crossing with the next source.
Assume the saved regime 22/23<=B<=1, 1<L<9B/2, 1/2<=q<=3/4, and
1-6qB/L>0. The first density gate at nu=q, after inserting the crossing
identity, has its non-accounting part

```math
\frac q{15-6q}\{10-(15-6q)B+[(15-6q)L-12q]b\}.
```

The omitted terms subtract positive quantities: q*L_child*e,
6q(5-6q)e/(15-6q), a(5-6rho), and the positive NF fee. Here
rho=1-10q/(15-6q) and the exact amplifier a>0. In particular
5-6rho=(66q-15)/(15-6q)>0. Positivity therefore requires

**(FD1)**

```math
b> f(q):=\frac{(15-6q)B-10}{(15-6q)L-12q}.
```

The denominator is positive in the stated regime. Direct differentiation
gives f'(q)=60(3B-L-2)/[(15-6q)L-12q]^2<0.
Since q<L/(6B)<3/4, every such finite step necessarily satisfies

**(FD2)**

```math
b>F(B,L):=\frac{B(15B-L-10)}{L(15B-L-2)}.
```

The companion checker verifies the stated regime and strict FD2 for every
saved stage, and checks both rational identities symbolically.

If one *formally* takes infinitesimal slope decrements, sets the crossing
equal to this lower bound and omits the fixed accounting costs and all other
gates, the candidate flow is

**(FD3)**

```math
\frac{dB}{dL}=F(B,L).
```

It has the explicit first integral

**(FD4)**

```math
I(B,L)=\frac{B(L+2-3B)^4}{L^5},\qquad I_BF+I_L=0.
```

Starting from B=1,L=K=4.4973108 gives I=(K-1)^4/K^5.
Equivalently, for r=L/B,

    1/B = 3/2-r/2 + [(K-1)/(2*K^(5/4))]*r^(5/4).

This connects the finite source search with an explicitly solvable flow.
At the saved count slope L=3.1518108 it predicts B approximately
.96259283010, versus the certified finite B=.96258631988264.
At physical L=3.2773108 it predicts B approximately .96773280785,
versus finite .96772063836150. These are floating diagnostics only.

**Limit of the deduction:** FD2 is necessary, not sufficient. FD3 is not
proved to be the limit of admissible NF chains, nor an upper envelope for
finite graphs. A tangent-step inequality alone does not give that comparison.
The other density gates, global caps, finite step sizes, and fixed positive
accounting reserves remain. No infinite induction, improved source premise,
optimality claim or zero-free boundary follows from this flow calculation.

The useful next test is whether a rigorously controlled finite schedule
approaches this curve, and whether changing an analytic input shifts it.
This note supplies an algebraic diagnostic for that test, not its answer.
