"""Rational lower bounds for the unchanged competing counts at the #143 contact."""

from fractions import Fraction as Q


def main():
    lo, hi = Q(2129, 5000), Q(4259, 10000)
    p = Q(1, 2)
    v_lo, v_hi = Q(5, 6) - hi, Q(5, 6) - lo
    contact_upper = Q(5, 9) + hi / 6

    # For K >= 7/10, w decreases with u = p/(3K), which lies in [0, 5/21].
    def w(u):
        return 2 * (1 - p) * (1 - u) / (3 - p - 2 * u)

    w_lo, w_hi = w(p / (3 * Q(7, 10))), w(0)
    old_gap = (1 - hi + lo * v_lo * w_lo / (2 * (v_hi + hi * w_hi))
               - contact_upper)

    # Same uncapped C branch on both native windows. The only varying input
    # to U, D and A would be amplitude, fixed here at p = 1/2.
    def native_factors(B, lam):
        U = (1 - p) * (1 - 2 * p * B / lam)
        D, A = 3 - p - 4 * p / lam, 2 - 4 * p / lam
        return U, v_hi * D + hi * (1 - p) * A

    U, j_upper = native_factors(1 - Q(1, 10**12), 2 + Q(1, 10**11))
    native_gap = 1 - hi + lo * v_lo * U / j_upper - contact_upper
    if not (old_gap > Q(1, 250) and native_gap > Q(18, 100000)):
        raise ValueError("a competing branch can reach the marked contact")

    U40, j40_upper = native_factors(1 - Q(1, 10**10), 2 + Q(1, 10**9))
    pr40_left = 1 + lo * U40 / j40_upper - Q(1, 24000)
    marked_cutoff_upper = Q(3, 2) * Q(1881, 2500)
    if not (pr40_left - marked_cutoff_upper > Q(1, 2000)
            and Q(".8096863501") < Q(".815324503")):
        raise ValueError("the two contact locations overlap")
    print("Old count excess at contact >", old_gap)
    print("Native count excess at contact >", native_gap)
    print("PR #40 inverse-length window starts above", pr40_left)
    print("Tracker #143 critical long length <", marked_cutoff_upper)


if __name__ == "__main__":
    main()
