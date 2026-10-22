"""Exact arithmetic controls for the early analytic audit; no L-function proof.

Run with standard-library Python, including under python -O. See
audit/2026-10-22-early-analytic-prerequisites.md for hypotheses and proofs.
"""

from fractions import Fraction as F


def check(condition, message):
    if not condition:
        raise RuntimeError(message)


def height_witness(m, d_min, tau0, a, b, c_beta):
    """The finite orders a and b must already be fixed independently of N."""
    if min(m, d_min, tau0) <= 0 or a < 0:
        raise ValueError("Require m, d_min, tau0 > 0 and a >= 0")
    tau = min(d_min / 100, tau0, m / (4 * (a + 1)))
    q = (b - c_beta + m / 2) / tau
    n = max(0, q.numerator // q.denominator + 1)
    return tau, n


def main():
    # Coefficients of (1, ell, h), so these are identities, not sampled points.
    lx = (F(1), F(1), F(-1))
    b = (F(-1), F(-3), F(2))
    sigma0 = (F(11, 12), F(-1, 4), F(0))
    c = tuple(x / 2 + y for x, y in zip(lx, (F(-1), F(0), F(1, 6))))
    residue_c = tuple(x / 3 + y for x, y in zip(lx, (F(-5, 6), F(1, 6), F(0))))
    low = tuple(x / 2 + y / 12 for x, y in zip(lx, b))
    check(c == residue_c, "Residue and geometric Mellin intercepts disagree")
    check(tuple(x + y for x, y in zip(sigma0, c)) == low,
          "C(sigma0) does not equal the low exponent")

    ell, h = F(2953, 17700), F(405989, 500000)
    theta = F(11, 12) - ell / 4
    low_value = F(5, 12) + ell / 4 - h / 3
    check(theta == F(20649, 23600), "Audited boundary regression")
    check(F(1, 2) < theta < F(7, 8), "Continuation boundary domain")
    check(theta - F(11, 16) != low_value,
          "Failure control: the old intercept must not survive this geometry")
    print("PASS: exact affine identities and incorrect-intercept control")

    # Affine extrema over a in [1/2,1], e in [0,1/1000]. Strict radius
    # gaps use e > 0; the closed envelope checks the remaining inequalities.
    gap_lhs = (F(303, 200), F(49, 100), F(-1))
    gap_rhs = (F(3, 2) * F(101, 100), F(3, 2) - F(101, 100), F(-1))
    check(gap_lhs == gap_rhs, "Quadratic denominator-cap factorization")
    for a in (F(1, 2), F(1)):
        for e in (F(0), F(1, 1000)):
            r = {j: 2 - a - j * e for j in (2, 3, 4, 6, 8)}
            check(r[6] >= F(497, 500) > F(49, 100), "Inner disk nesting")
            check(r[3] - r[4] == e, "Borel-Caratheodory radius gap")
            check(r[4] - r[6] == 2 * e, "Three-circles radius gap")
            check(r[6] - r[8] == 2 * e, "Cauchy radius gap")
            check(2 - r[2] >= F(1, 2), "Principal regularizer domain")
            r0, r4 = F(49, 100), r[4]
            check(r4 <= F(3, 2) and r4 + F(101, 100) > 0,
                  "Signs in the interpolation-gap factorization")
            check(2 * e * r0 / (r4 * (r4 - r0)) >= F(196, 303) * e,
                  "Rational interpolation-gap coefficient")
    print("PASS: disk envelope and exact rational interpolation-gap bound")

    # Illustrative height orders, not constants extracted for a Hecke target.
    gap = (F(7, 8) - theta) / 2
    omega, m, d_min = gap / 2, F(1, 10**6), F(1, 10**7)
    beta = theta + gap
    c_beta = low_value + gap
    cases = [
        (F(0), F(-2), F(1, 1000)),
        (F(3), F(2), F(1, 10**10)),
        (F(10**12), F(10**12), F(1, 7)),
        (F(1, 3), c_beta - m / 2, F(1, 1000)),
    ]
    for a, b, tau0 in cases:
        tau, n = height_witness(m, d_min, tau0, a, b, c_beta)
        check(0 < tau <= min(d_min / 100, tau0), "Height ceiling")
        check(a * tau < m / 4, "Retained height cost")
        check(b - n * tau < c_beta - m / 2, "Strict discarded-tail saving")
        if n:
            check(b - (n - 1) * tau >= c_beta - m / 2,
                  "One-order-smaller failure control")
        epsilon = min(gap - omega, m / 2)
        check(0 < epsilon < gap and beta - epsilon > theta,
              "Continuation region remains in the correction domain")
    check(height_witness(m, d_min, F(1, 1000), F(0), F(-2), c_beta)[1] == 0,
          "Negative quotient must allow N=0")
    check(height_witness(m, d_min, F(1, 1000), F(1, 3), c_beta - m / 2, c_beta)[1] == 1,
          "Zero quotient requires N=1 for strictness")
    for bad in [(F(0), d_min, F(1), F(0)),
                (m, F(0), F(1), F(0)),
                (m, d_min, F(0), F(0)),
                (m, d_min, F(1), F(-1))]:
        try:
            height_witness(*bad, F(0), c_beta)
        except ValueError:
            pass
        else:
            raise RuntimeError("An invalid height hypothesis was accepted")
    print("PASS: four height regimes, strict floor controls, invalid hypotheses")

    toy_theta, toy_beta, e = F(3, 4), F(7, 8), F(1, 2000)
    for n in (1, 2, 10, 10**6):
        rho = toy_beta - F(1, n + 8)
        sigma_n = F(1, 2 * (n + 8))
        omega_n = toy_beta - toy_theta - sigma_n
        check(toy_theta < rho < toy_beta - sigma_n < toy_beta,
              "Toy contour must stay right of its zero")
        check(toy_theta < (toy_theta + rho) / 2 < rho,
              "Toy residue contour must cross exactly its one pole")
        check(0 < omega_n < toy_beta - toy_theta
              and toy_theta + omega_n == toy_beta - sigma_n,
              "The same family must also test the low-saving quantifier")
        check(abs(2 - rho) < 2 - toy_theta - 2 * e,
              "Boundary-based disk should contain a toy zero")
        check(abs(2 - rho) > 2 - toy_beta - 2 * e,
              "Supremum-based disk should exclude every toy zero")
    for requested_saving in (F(1, 10), F(1, 10**6), F(1, 10**30)):
        q = 1 / requested_saving
        n = q.numerator // q.denominator + 1
        check(F(1, 2 * (n + 8)) < requested_saving,
              "Toy savings have no common positive lower bound")
        check(toy_beta - F(1, n + 8) > toy_beta - requested_saving,
              "A toy pole must obstruct every proposed common saving")
    print("PASS: toy-family contour, circular-domain and nonuniform-saving controls")
    print("All exact controls passed. This is not a full analytic or Lean verification.")


if __name__ == "__main__":
    main()
