"""Exact port of the optimization layer of tracker PR #67
(GTimG/QuasiRiemannTracker, submissions/two-level-affine-20261019,
src/Candidate/Cycle63/Optimization/*.lean), generalized so that the affine
steps can be nested to any depth.

Every function uses only + - * / min max, so it runs on fractions.Fraction
(exact) and on mpmath.mpf (search). Square roots appear only in
`marked_bin_width` (rounded up to 8 digits, as in Lean) and in the top-row
closed form `theta_min`, which take a `sqrt` argument.

Names follow the Lean definitions; the Lean name is given in each docstring.
"""
from fractions import Fraction as Q

# ---------------------------------------------------------------- constants
import os as _os
# SlotPrice.betaBound: the prior bound on the Hecke zero supremum that the slot price uses.
# PR #67/#68 use Levy's 10499/12000; QRH_BETA overrides it (e.g. with PR #68's own proved
# 8748087/10^7, see certify_gao_depth.py --five-beta / --six-beta).
BETA = Q(_os.environ.get("QRH_BETA", "10499/12000"))
KAPPA = 2 * BETA - 1                      # SlotPrice.slotPrice
UNIT = Q(1, 10**8)                        # Slacks.allowanceUnit
ALPHA = UNIT                              # lowReserveWeight
MESH = UNIT                               # cellMesh
SLOT_FLOOR = Q(17, 500)                   # slotFloor
FIRST_CELL_TOP = SLOT_FLOOR + MESH        # firstCellTop
TAIL = UNIT                               # tailSlack
REGION_MARGIN = UNIT                      # TwoLevelLedger.regionMargin
GLC = ALPHA * (1 - Q(1, 2) / KAPPA) / 128  # geometryLossCap
FLC = 33 * GLC / 128                      # frequencyLossCap
MARKED_RATE = GLC / 432
MARKED_PAD = MARKED_RATE
PLAIN_COST = Q(3, 4)                      # plainCapacityCost
CHOSEN = (1 + 1 / (6 * PLAIN_COST)) / 3   # chosenPerUnit


def decimal_up(x, digits):
    """Smallest multiple of 10^-digits that is >= x (Lean `bracket_up`)."""
    n = 10**digits
    xq = Q(x) if not isinstance(x, Q) else x
    k = -((-xq.numerator * n) // xq.denominator)
    return Q(k, n)


def _marked_bin_width():
    """Slacks.markedBinWidth = sqrt(62 GLC/(4096 firstCellTop)) rounded up to 8 digits.
    Computed exactly: the least k/10^8 with (k/10^8)^2 >= the radicand."""
    rad = 62 * GLC / (4096 * FIRST_CELL_TOP)
    n = 10**8
    import math
    k = math.isqrt(rad.numerator * n * n // rad.denominator)
    while Q(k, n) ** 2 < rad:
        k += 1
    while k > 0 and Q(k - 1, n) ** 2 >= rad:
        k -= 1
    return Q(k, n)


MARKED_BIN_WIDTH = _marked_bin_width()
TINY = 62 * GLC / (2048 * MARKED_BIN_WIDTH)  # tinySlotLoss
SUPPLY_LOSS = GLC + TINY                     # supplyLoss


def marked_loss_at(s):
    return (130 * MARKED_RATE + 2 * MARKED_BIN_WIDTH * s + 131 * (159 * MARKED_RATE)
            + MARKED_PAD + GLC / 32 + GLC / 8)


# ---------------------------------------------------------------- bins
def density(q):          # TopRow.density  rho(q)
    return 1 - 10 * q / (3 * (5 - 2 * q))


def cost(q):             # SecondLevel.amplifierCost  5 - 6 rho
    return 5 - 6 * density(q)


def half_gain(d):
    return d * (5 - 6 * d) / (5 - 2 * d)


def cap_unit(d):
    return (Q(5, 3) - 2 * d) / (5 - 2 * d + CHOSEN * (5 - 6 * d))


def inverse_cap(d):
    return cap_unit(d) / 2


def plain_cap(d):
    return cap_unit(d) / (6 * PLAIN_COST)


def cap_coefficient(d):
    return half_gain(d) * (2 * inverse_cap(d) + plain_cap(d)) / 3


def dominant_root(d):
    c = cap_coefficient(d)
    return c / ((6 * density(d) - 1 - TAIL) + 6 * c)


def common_rate_parts(d):
    """commonRateAt d = d - max(3/19, 4 rho - 5/4); returned as the two candidates
    (the rate is their minimum)."""
    return d - Q(3, 19), d - (4 * density(d) - Q(5, 4))


def common_rate(d):
    a, b = common_rate_parts(d)
    return min(a, b)


def supplied(b):
    return b - MESH - SUPPLY_LOSS


# ---------------------------------------------------------------- regions
class Region:
    """A region A + (6 price - 1) z <= intercept * M."""

    def __init__(self, price, intercept):
        self.price, self.intercept = price, intercept

    def overshoot(self, A, z, M):
        return A + (6 * self.price - 1) * z - self.intercept * M

    def __repr__(self):
        return f"Region(price={float(self.price):.12f}, intercept={float(self.intercept):.12f})"


OLD = Region(KAPPA, Q(1))


def amp_ratio(reg, q):   # LowRegion.amplifierRatio price intercept q
    return q / (6 * (reg.price - q * reg.intercept))


def region_over(q, base, m=REGION_MARGIN):
    """SecondLevel.regionSlope/regionIntercept/regionPrice, generalized from the old
    region (slotPrice, 1) to an arbitrary base region (k, I): the states on which a step
    at junction q that deletes into `base` pays its LOW and HIGH reserves with one
    amplifier, with margin m. For base = OLD this is exactly the Lean definition."""
    k, I = base.price, base.intercept
    R = 6 * (k - q * I) / (q * cost(q))           # secondRatio
    c = (6 * k - 1) / (1 + R * q)                  # regionSlope
    Ip = (I + R * (1 - density(q)) - m) / (1 + R * q)  # regionIntercept
    return Region((1 + c) / 6, Ip)


# ---------------------------------------------------------------- the first-step ledger
class Ledger:
    """Channels.lean, for a ledger whose LOW children are deleted into `reg`."""

    def __init__(self, reg):
        self.reg = reg
        self.P, self.I = reg.price, reg.intercept

    def weight(self, q):
        return amp_ratio(self.reg, q) * cost(q)

    def low_reserve_at(self, q):
        return ALPHA * (1 - q * self.I / self.P)

    def high_fee(self, q, s):
        return self.low_reserve_at(q) + marked_loss_at(s)

    def plane_amp(self, q, lam, B, b):
        return amp_ratio(self.reg, q) * (B - self.I + (6 * self.P - lam) * b) + ALPHA

    def plane_high(self, q, lam, B, d, b):
        return (1 - density(d) - d * (B - (lam - 1) * (b - MESH))
                - self.plane_amp(q, lam, B, b) * (5 - 6 * density(d)))

    def plane_freq(self, q, lam, B, r, b):
        return (1 - 6 * r) * (1 - 6 * self.plane_amp(q, lam, B, b) - FLC)

    def rate_channel_parts(self, q, lam, B, d, b):
        h = self.plane_high(q, lam, B, d, b)
        a, c = common_rate_parts(d)
        return h + a * supplied(b), h + c * supplied(b)

    def rate_channel(self, q, lam, B, d, b):
        return min(self.rate_channel_parts(q, lam, B, d, b))

    def linear_channel(self, q, lam, B, d, b):
        return self.plane_high(q, lam, B, d, b) + half_gain(d) * supplied(b)

    def mixed_channel(self, q, lam, B, r, d, b):
        return (self.plane_high(q, lam, B, d, b)
                + half_gain(d) * (2 * supplied(b) + plain_cap(d) * self.plane_freq(q, lam, B, r, b)) / 3)

    def inverse_channel(self, q, lam, B, r, d, b):
        return (self.plane_high(q, lam, B, d, b)
                + half_gain(d) * (2 * inverse_cap(d) * self.plane_freq(q, lam, B, r, b) + supplied(b)) / 3)

    def capped_channel(self, q, lam, B, r, d, b):
        return (self.plane_high(q, lam, B, d, b)
                + half_gain(d) * (2 * inverse_cap(d) + plain_cap(d)) * self.plane_freq(q, lam, B, r, b) / 3)

    def plain_weight(self, q, r):
        return 2 * amp_ratio(self.reg, q) * half_gain(q) * plain_cap(q) * (1 - 6 * r)

    def channel_slope(self, q, r):
        W, Wp = self.weight(q), self.plain_weight(q, r)
        return (q - 2 * half_gain(q) / 3 + 6 * self.P * (W + Wp)) / (q + W + Wp)

    def channel_intercept(self, q, r, s):
        W, Wp = self.weight(q), self.plain_weight(q, r)
        lam = self.channel_slope(q, r)
        return (self.mixed_channel(q, lam, 0, r, q, s) - self.high_fee(q, s)) / (q + W + Wp)

    def plane(self, q, s):
        """(planeSlope, planeIntercept, root cutoff)"""
        r = dominant_root(q)
        return self.channel_slope(q, r), self.channel_intercept(q, r, s), r

    def rate_margin(self, q, s):
        """TwoLevelLedger.twoLevelRateMargin (rate channel less the fee at d = q, lowest cell)."""
        lam, B, _ = self.plane(q, s)
        return self.rate_channel(q, lam, B, q, FIRST_CELL_TOP) - self.high_fee(q, s)

    def unmarked_margin(self, q, lam, B, s, d, b):
        return self.plane_high(q, lam, B, d, b) - self.high_fee(q, s)


# ---------------------------------------------------------------- top row (TopRow.lean)
def cutoff_den(lam, d):
    return Q(25, 2) * lam - 10 + (6 - 9 * lam) * d


def root_coeffs(lam, B):
    a2 = 6 * B * (6 - 9 * lam) + 18 * lam * (6 - 6 * lam - 3 * B)
    a1 = (7 * lam * (6 - 9 * lam) + 6 * B * (Q(25, 2) * lam - 10)
          - 15 * lam * (6 - 6 * lam - 3 * B) + 18 * lam * (Q(25, 2) * lam - 10))
    a0 = -8 * lam * (Q(25, 2) * lam - 10)
    return a2, a1, a0


def root_disc(lam, B):
    a2, a1, a0 = root_coeffs(lam, B)
    return a1 * a1 - 4 * a2 * a0


def delta_star(lam, B, sqrt):
    a2, a1, _ = root_coeffs(lam, B)
    return (-a1 + sqrt(root_disc(lam, B))) / (2 * a2)


def bound_at(lam, d):
    return (7 * lam * (1 + d) + 11 * d) / (9 * lam + 6 * lam * d + 12 * d)


def theta_min(lam, B, sqrt):
    return bound_at(lam, delta_star(lam, B, sqrt))


def h_star(lam, B, sqrt):
    ds = delta_star(lam, B, sqrt)
    th = bound_at(lam, ds)
    return -8 * cutoff_den(lam, ds) * ((6 * lam + 12) * th - 7 * lam - 11) / sqrt(root_disc(lam, B))


def kappa2(lam, B, sqrt):
    a2, _, _ = root_coeffs(lam, B)
    th = theta_min(lam, B, sqrt)
    return (6 - 9 * lam) * ((6 * lam + 12) * th - 7 * lam - 11) / (3 * lam) + h_star(lam, B, sqrt) * a2 / (24 * lam)


# WindowTangency.lean
def ell_at(th):
    return Q(11, 3) - 4 * th


def capped_level_const(th, h):
    return th - Q(1, 2) - 13 * h / 75 + (h - 2 * ell_at(th)) / 2 + ell_at(th) / 2 - h / 4 + 17 * h / 50 - h / 8


def capped_level_slope(lam, B, th, h):
    return -Q(1, 2) - ell_at(th) / 2 + (2 * (h - 2 * ell_at(th)) - (2 - B) * h) / lam / 4


def capped_quad(lam, B, th, h, s):
    L = capped_level_slope(lam, B, th, h)
    C0 = capped_level_const(th, h)
    A = -Q(3, 2) * L - 3 * h / 4 * (1 + s / 2)
    Bq = Q(25, 12) * L - Q(3, 2) * C0 + 3 * h / 4 * (Q(5, 6) * (1 + s / 2) + Q(25, 12))
    C = Q(25, 12) * C0 - 3 * h / 4 * Q(125, 72)
    return A, Bq, C


def balanced_top(lam, B, th, h, sqrt):
    tA = 25 * h * h / 256
    _, B0, C = capped_quad(lam, B, th, h, 0)
    A0, _, _ = capped_quad(lam, B, th, h, 0)
    tB = 5 * h / 8 * B0 + 3 * h / 2 * C
    tC = B0 * B0 - 4 * A0 * C
    return (-tB - sqrt(tB * tB - 4 * tA * tC)) / (2 * tA)


# ---------------------------------------------------------------- nested steps
class Chain:
    """An n-level affine chain.

    junctions = (q_0, q_1, ..., q_{n-1}): q_0 is the first step's junction; step j >= 1
    runs at q_j. regions[j] is the region step j deletes its LOW children into:
    regions[n-1] = region_over(q_{n-1}, OLD) ... wait: the last step deletes into OLD.
    Concretely, with n levels:
        T_{n-1} = OLD                         (the last step deletes into the old region)
        T_{j}   = region_over(q_{j+1}, T_{j+1})  for j = n-2, ..., 0
    and step j deletes into T_j. The first step's ledger is Ledger(T_0).
    For n = 2 this is PR #67: T_0 = region(q_1 over OLD), T_1 = OLD.
    """

    def __init__(self, junctions, s):
        self.q = list(junctions)
        self.n = len(self.q)
        self.s = s
        T = [None] * self.n
        T[self.n - 1] = OLD
        for j in range(self.n - 2, -1, -1):
            T[j] = region_over(self.q[j + 1], T[j + 1])
        self.T = T
        self.ledger = Ledger(T[0])
        self.lam, self.B, self.r = self.ledger.plane(self.q[0], s)

    # first step cell functions (TwoLevelHigh.lean)
    def total_A(self, b):            # twoLevelTotalA (with mesh)
        return self.B - (self.lam - 1) * (b - MESH)

    def first_amp(self, b):          # firstAmp
        return self.ledger.plane_amp(self.q[0], self.lam, self.B, b)

    def cascade(self, b):
        """Deletions d_j and amplifiers a_j of the zero-extraction child at the upper
        corner of cell b, step by step (cell-uniform choice, Report D risk 3).
        Returns lists a[0..n-1], d[0..n-2] and the per-step overshoots g[1..n-1]."""
        reg0 = self.T[0]
        gap = self.B - reg0.intercept + (6 * reg0.price - self.lam) * b      # planeGap
        a = [self.first_amp(b)]
        d = [(gap + 6 * reg0.intercept * a[0]) / (6 * reg0.price)]          # fixedDeletion
        A = self.B - (self.lam - 1) * b - d[0]                               # planeTotalLength mesh 0
        z = b - d[0]
        M = 1 - 6 * a[0]
        g = [gap]
        for j in range(1, self.n):
            reg = self.T[j]
            gj = reg.overshoot(A, z, M)
            aj = amp_ratio(reg, self.q[j]) * gj + ALPHA
            g.append(gj)
            a.append(aj)
            if j < self.n - 1:
                dj = (gj + 6 * reg.intercept * aj) / (6 * reg.price)
                d.append(dj)
                A, z, M = A - dj, z - dj, M - 6 * aj
        return a, d, g

    def high_at(self, depth, delta, b):
        """Joint HIGH reserve of the depth-`depth` HIGH rows (depth 2 = HIGH rows of
        step 1, ...), in the bin delta (>= q_{depth-1}) and the cell b:
        (1-rho) - delta TA + sum_{i<depth-1} (delta - q_i) d_i - (a_0+...+a_{depth-1}) cost(delta).
        For n = depth = 2 this is TwoLevelHigh.highTwoAt."""
        a, d, _ = self.cascade(b)
        v = (1 - density(delta)) - delta * self.total_A(b)
        for i in range(depth - 1):
            v += (delta - self.q[i]) * d[i]
        v -= sum(a[:depth]) * cost(delta)
        return v

    def growth(self, depth, b):
        """TwoLevelHigh.highTwoGrowth generalized: the least rate at which the
        reserve grows in the bin above q_{depth-1}."""
        a, d, _ = self.cascade(b)
        qd = self.q[depth - 1]
        return (Q(50, 3) * (1 - 6 * sum(a[:depth])) / (5 - 2 * qd) ** 2
                - (self.total_A(b) - sum(d[:depth - 1])))

    def low_reserves(self):
        """alpha (1 - q_j I_j / k_j) for each step j (the LOW reserve after the deletion)."""
        return [ALPHA * (1 - self.q[j] * self.T[j].intercept / self.T[j].price) for j in range(self.n)]

    def theta(self, sqrt):
        return theta_min(self.lam, self.B, sqrt)
