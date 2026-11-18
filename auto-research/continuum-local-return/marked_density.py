"""Exact comparisons for the full eighteenth moment using a forced prime mark."""

from fractions import Fraction as Q


DELTA_MIN = Q('.15')
DELTA_MAX = Q('.51')
NU_CUTOFF = Q('.004')
CORE_FRACTION = 1 - 6 * NU_CUTOFF
SMALL_Z = Q('.094')
PRIME_CAP = Q('.1012')
CUTOFF_PRIME = Q('.051')
LARGE_PRIME = Q('.084')
RESIDUAL_RATIO = Q('9.4')
NEEDED_MARK = Q('.0833')
MESH = Q('.000001')
AMPLIFICATION = Q(5, 6)
ROW_FEE = Q('.000001')
GRID = 50000


def positive(name, value):
    if value <= 0:
        raise ValueError(f'{name}: nonpositive margin {value}')


def check_j_upper(length, upper):
    # J(l) = (sqrt(15l) - sqrt(10))^2/6 when l > 2/3.
    positive('positive square-root branch', length - Q(2, 3))
    difference = 15 * length + 10 - 6 * upper
    positive('sign before squaring', difference)
    positive('unmarked moment upper bound', 600 * length - difference**2)


def verify(z_upper, excess):
    length = 9 * z_upper
    positive('upper prime width at a retained core', PRIME_CAP - z_upper / CORE_FRACTION)
    check_j_upper(9 * SMALL_Z, excess)
    check_j_upper(length / CORE_FRACTION, (excess + 5 * NU_CUTOFF) / CORE_FRACTION)

    def old_cost(delta):
        return delta * (length - 10 / (15 - 6 * delta))

    positive('old low-delta endpoint', excess - old_cost(DELTA_MIN))
    positive('old high-delta endpoint', excess - old_cost(DELTA_MAX))
    positive('old cost increasing up to low endpoint', length * (15 - 6 * DELTA_MIN)**2 - 150)
    positive('old cost decreasing after high endpoint', 150 - length * (15 - 6 * DELTA_MAX)**2)

    def cutoff(delta):
        return (Q(5, 6) + excess - delta * length) / (Q(5, 6) - delta)

    def inverse_edge(delta):
        return length - excess / delta

    positive('lower detector cutoff', cutoff(DELTA_MIN) - 1)
    positive('upper detector cutoff', Q(3, 2) - cutoff(DELTA_MAX))
    positive('cutoff increasing', Q(5, 6) * (1 - length) + excess)
    positive('core exponent pays sixth-power lifts', 1 + excess - DELTA_MAX * length - Q(1, 6))
    positive('at most one prime above the smooth cutoff', 2 * CUTOFF_PRIME - PRIME_CAP)
    if SMALL_Z / (SMALL_Z - LARGE_PRIME) != RESIDUAL_RATIO:
        raise ValueError('residual slope ratio')
    positive('small prime from a residual inverse', CUTOFF_PRIME - (PRIME_CAP - CUTOFF_PRIME))
    positive('second native condition for a large prime', 3 - 2 * Q('.84') - 8 * PRIME_CAP)
    positive('second native condition for small packed slots', 3 - (4 - 2 * Q('.70')))
    ordinary_cap = (Q(5, 6) - 2 * Q(133, 372)) / 4
    inverse_cap = 2 * (1 - Q('.70')) / 7
    positive('absorption of a residual amplitude debit',
             length - RESIDUAL_RATIO * max(NEEDED_MARK + MESH, ordinary_cap, inverse_cap))

    # The composite comparison eliminates r by convex combination. The one
    # large-prime estimate is concave separately in r and the prime width.
    minimum = Q(1)
    for i in range(int(DELTA_MIN * GRID), int(DELTA_MAX * GRID)):
        dlo, dhi = Q(i, GRID), Q(i + 1, GRID)
        tlo = cutoff(dlo)
        rlo = tlo - inverse_edge(dhi) / 2
        rhi = inverse_edge(dhi)
        if rlo > rhi:
            continue
        positive('lower inverse width', rlo - Q('.70'))
        positive('upper inverse width', Q('.84') - rhi)
        positive('ordinary width selects the second cap', 2 * (tlo - rhi) - Q(1, 6))

        def margin(capacity, charge=0):
            # E - d*(L-capacity) is affine in d with capacity fixed.
            return excess - max(dlo * (length - capacity), dhi * (length - capacity)) - charge

        needed = rhi - rlo
        positive('maximum needed inverse mark', NEEDED_MARK - needed)
        # (1-r)/2 - (Y-r) is increasing in r; use opposite bounds for r,Y.
        positive('small-prime ceiling at the native moment',
                 (1 - rlo) / 2 - needed - CUTOFF_PRIME - MESH)
        composite = (97 + 180 * tlo) / 372 - 5 * MESH

        def native_single(r, b):
            charge = AMPLIFICATION * max(0, r + 2 * b - 1) + ROW_FEE
            return margin(r + b, charge)

        least = min(margin(composite),
                    *(native_single(r, b) for r in (rlo, rhi)
                      for b in (LARGE_PRIME, PRIME_CAP)))
        positive(f'forced-mark saving for delta in [{dlo}, {dhi}]', least)
        minimum = min(minimum, least)
    print(f'9z <= {length}: exponent {1 + excess}, tiny/large-prime margin >= {minimum}')


def check_target_comparison():
    delta, length, excess = Q(1, 3), Q('.88758'), Q('.00029')
    tmax = (Q(5, 6) + excess - delta * length) / (Q(5, 6) - delta)
    if tmax != Q(161329, 150000):
        raise ValueError('target cutoff')
    # The two capacities intersect at r = (252*t-13)/372.
    for cutoff in (1, tmax):
        r = (252 * cutoff - 13) * Q(1, 372)
        m = cutoff - r
        capacity = (2 + 5 * r) / 7
        if capacity != 3 * m / 2 + Q(5, 24) or not (0 < r < 1 and Q(1, 6) < 2 * m < Q(5, 6)):
            raise ValueError('admissible capacity intersection')
    gap = delta * (length - capacity) - excess
    if capacity != Q(726487, 930000) or gap != Q(981533, 27900000):
        raise ValueError('target moment comparison')
    print(f'target comparison at density 1/3: row-count deficit {gap}')


if __name__ == '__main__':
    check_j_upper(9 * Q('.09862'), Q('.03945'))
    check_j_upper(9 * Q('.0987'), Q('.03970'))
    verify(Q('.09862'), Q('.02694'))
    verify(Q('.0987'), Q('.02718'))
    check_target_comparison()
