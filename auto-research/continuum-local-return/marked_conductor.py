"""Exact vertex checks for the complete marked fourth-moment conductor sector."""

from fractions import Fraction as F
from itertools import combinations


PAIR_LIMIT = F(463, 250)
ORDER_SIX_LIMIT = F(5833, 6250)

# Each (normal, bound) denotes normal · (D, s, y) ≤ bound.
DOMAIN = [
    ((-1, 0, 0), 0), ((0, -1, 0), 0), ((0, 0, -1), 0),
    ((0, 0, 1), 1), ((-1, 1, 0), 0), ((2, -1, 0), PAIR_LIMIT),
]
# The three affine pieces of b=max(0,min(y,D-y)).
LENGTH_REGIONS = [
    [((-1, 0, 2), 0)],
    [((1, 0, -2), 0), ((-1, 0, 1), 0)],
    [((1, 0, -1), 0)],
]


def cross(a, b):
    return (
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    )


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def vertices(constraints):
    points = set()
    for (a, limit_a), (b, limit_b), (c, limit_c) in combinations(constraints, 3):
        bc, ca, ab = cross(b, c), cross(c, a), cross(a, b)
        determinant = dot(a, bc)
        if determinant == 0:
            continue
        point = tuple(
            F(limit_a * x + limit_b * y + limit_c * z, determinant)
            for x, y, z in zip(bc, ca, ab)
        )
        if all(dot(normal, point) <= limit for normal, limit in constraints):
            points.add(point)
    return points


def bounds(point):
    d, s, y = point
    b = max(F(0), min(y, d - y))
    base = F(1, 6) + y / 3
    return (
        base + s / 2,
        base + s / 4 + b / 2,
        base + 11 * s / 24 + b / 6,
        base + s / 3 + 5 * b / 12,
    )


def exact_maxima(sector):
    points = set()
    for region in LENGTH_REGIONS:
        points.update(vertices(DOMAIN + sector + region))
    return tuple(max(column) for column in zip(*(bounds(point) for point in points)))


def verify(label, actual, expected):
    if actual != expected:
        raise ArithmeticError(f"{label}: obtained {actual}, expected {expected}")
    print(f"OK {label}: {actual}")


if __name__ == "__main__":
    verify("D ≤ 1", exact_maxima([((1, 0, 0), 1)]),
           (1, F(5, 6), F(23, 24), F(7, 8)))
    verify("D ≥ 1, s ≤ 5833/6250",
           exact_maxima([((-1, 0, 0), -1), ((0, 1, 0), ORDER_SIX_LIMIT)]),
           (F(12083, 12500), F(73519, 75000), F(148979, 150000), 1))
    gain = F(".425") * F(".49995") * F("1e-5") / 2 - F("3.8e-6") / 4
    verify("physical margin beyond 3η/4", gain - 3 * F("1e-7") / 4,
           F(5983, 160000000000))
