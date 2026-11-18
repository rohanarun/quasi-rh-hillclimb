"""Exact comparisons for the full eighteenth moment using a forced prime mark."""

from fractions import Fraction as Q


DELTA_MIN = Q('.18')
DELTA_MAX = Q('.48')
NU_CUTOFF = Q('.003')
CORE_FRACTION = 1 - 6 * NU_CUTOFF
SMALL_Z = Q('.095')
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
    positive('ordinary width stays inside the second condition', Q(5, 6) - Q('.83') - 12 * MESH)
    positive('second native condition for a single prime', 3 - 2 * Q('.83') - 8 * PRIME_CAP)
    positive('second native condition for packed prime slots', 3 - (4 - 2 * Q('.70')))
    positive('all actual mark widths below tested total', length - max(PRIME_CAP, Q('.15')))

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
        positive('upper inverse width', Q('.83') - rhi)
        positive('ordinary width selects the second cap', 2 * (tlo - rhi) - Q(1, 6))

        def margin(capacity, charge=0):
            # E - d*(L-capacity) is affine in d with capacity fixed.
            return excess - max(dlo * (length - capacity), dhi * (length - capacity)) - charge

        composite = (14 + 36 * tlo) / 69 - 3 * MESH
        native_packed = (1 + 3 * rlo) / 4 - 3 * MESH

        def native_single(r):
            return margin(r + PRIME_CAP, max(0, r + 2 * PRIME_CAP - 1) + ROW_FEE)

        least = min(margin(composite), margin(native_packed, ROW_FEE),
                    native_single(rlo), native_single(rhi))
        positive(f'forced-mark saving for delta in [{dlo}, {dhi}]', least)
        minimum = min(minimum, least)
    print(f'9z <= {length}: exponent {1 + excess}, interval margin >= {minimum}')


if __name__ == '__main__':
    check_j_upper(9 * Q('.09862'), Q('.03945'))
    check_j_upper(9 * Q('.0987'), Q('.03970'))
    verify(Q('.09862'), Q('.03065'))
    verify(Q('.0987'), Q('.03090'))
