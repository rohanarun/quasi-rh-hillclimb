"""Exact algebra: which terminal branches force the inverse capacity r + 2z <= m.

Inputs are the paper's own relations (openai/math fd4aeeb, build/paper.tex):
  initialization (11751, 11909, 12197-12211):
      D' = r + z - 2G,  z0 = z - G,  M = 2D' - m - 2P1,  F = D' - P1,  Q <= P1 + G
  terminal step (9880-9935, eq:inverse-terminal-width, old-eq:4.9-4.11):
      row branch     E_row <= M + z_a - u_row           (paper: u_row >= 0)
      column branch  E_col <= O/2 + T_d - S0 - B0,  T_d - S0 - B0 <= 2M - O + Q + V - N* + 2 z_a
      mixed branch   E_mix <= O/2 + (T_d - S0 - B0)/2 + z_a - (u - v/2)    (u >= v/2)
  closing requires each E < F = N + V (V, O >= 0; N* = N at leading order).
We put P1 = G = 0, V = O = 0, z_a = z0 = z (the worst case used in the paper) and ask
for the condition on (r, z, m) that each branch imposes, for a structured mark
saving u_row = kappa*z (kappa = 0: paper; kappa = 1/3: bilinear cubic-residue bound).
"""
import sympy as sp
r, z, m, kappa = sp.symbols("r z m kappa", nonnegative=True)
Dp = r + z; z0 = z; M = 2*Dp - m; F = Dp; Q = 0; N = F
row = sp.simplify((M + z - kappa*z) - F)            # must be < 0
col = sp.simplify((2*M + Q + 2*z) - (N + N))        # O/2 + 2M - O + Q + V - N + 2z < N + V, O=V=0
mix = sp.simplify(sp.Rational(1, 2)*(2*M + Q + 2*z - N) + z - F)  # with u = v/2 worst case
print("row branch    E_row - F =", sp.factor(row), "  -> needs", sp.solve(sp.Eq(row, 0), m)[0], "< m")
print("column branch E_col - F =", sp.factor(col), "  -> needs", sp.solve(sp.Eq(col, 0), m)[0], "< m")
print("mixed (paper's second invariant 3M + 6z0 <= 4F):",
      sp.factor(sp.expand(3*M + 6*z0 - 4*F)), "<= 0  ->  2r + 8z <= 3m")
for k in [0, sp.Rational(1, 3)]:
    print(f"kappa = {k}: row branch needs r + {sp.nsimplify(2 - k)} z < m;"
          f" column branch still needs r + 2 z < m")
assert sp.simplify(col - 2*(r + 2*z - m)) == 0
assert sp.simplify(row.subs(kappa, 0) - (r + 2*z - m)) == 0
