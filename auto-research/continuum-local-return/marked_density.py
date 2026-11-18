"""Exact comparisons for the full eighteenth moment using a forced prime mark."""

from fractions import Fraction as Q


DELTA_MIN = Q('.16')
DELTA_MAX = Q('.50')
NU_CUTOFF = Q('.0035')
CORE_FRACTION = 1 - 6 * NU_CUTOFF
SMALL_Z = Q('.0945')
PRIME_CAP = Q('.101')
MESH = Q('.000001')
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
    positive('ordinary width stays inside the second condition', Q(5, 6) - Q('.832') - 12 * MESH)
    positive('second native condition for a single prime', 3 - 2 * Q('.832') - 8 * PRIME_CAP)
    positive('second native condition for packed prime slots', 3 - (2 * Q('.70') + 16 * (1 - Q('.70')) / (4 - DELTA_MAX)))
    positive('all actual mark widths below tested total', length - max(PRIME_CAP, 2 * (1 - Q('.70')) / (4 - DELTA_MAX)))

    # A grid bounds delta only. The convex combination eliminates the inverse
    # width in the composite case. The native function is concave in that width.
    minimum = Q(1)
    for i in range(int(DELTA_MIN * GRID), int(DELTA_MAX * GRID)):
        dlo, dhi = Q(i, GRID), Q(i + 1, GRID)
        tlo = cutoff(dlo)
        rlo = tlo - inverse_edge(dhi) / 2
        rhi = inverse_edge(dhi)
        if rlo > rhi:
            continue
        positive('lower inverse width', rlo - Q('.70'))
        positive('upper inverse width', Q('.832') - rhi)
        positive('ordinary width selects the second cap', 2 * (tlo - rhi) - Q(1, 6))

        def margin(capacity, charge=0):
            # E - d*(L-capacity) is affine in d with capacity fixed.
            return excess - max(dlo * (length - capacity), dhi * (length - capacity)) - charge

        composite = (97 + 180 * tlo) / 372 - 5 * MESH
        native_packed = rlo + (1 - rlo) / (4 - dlo)

        def native_single(r):
            return margin(r + PRIME_CAP, max(0, r + 2 * PRIME_CAP - 1) + ROW_FEE)

        least = min(margin(composite), margin(native_packed, ROW_FEE),
                    native_single(rlo), native_single(rhi))
        positive(f'forced-mark saving for delta in [{dlo}, {dhi}]', least)
        minimum = min(minimum, least)
    print(f'9z <= {length}: exponent {1 + excess}, interval margin >= {minimum}')


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
    verify(Q('.09862'), Q('.02814'))
    verify(Q('.0987'), Q('.02838'))
    check_target_comparison()
