"""Replay the complete piecewise-linear optimization using exact arithmetic."""
from fractions import Fraction as F
from itertools import combinations

cutoff = F(31, 20)
price = F(653, 500)
count_floor = F(".62567")
value_floor = F(".08516")
eta = F("1e-7")


def solve(faces):
    matrix = [[F(x) for x in normal] + [rhs] for normal, rhs in faces]
    for col in range(4):
        pivot = next((i for i in range(col, 4) if matrix[i][col]), None)
        if pivot is None:
            return
        matrix[col], matrix[pivot] = matrix[pivot], matrix[col]
        matrix[col] = [x / matrix[col][col] for x in matrix[col]]
        for i in range(4):
            if i != col:
                scale = matrix[i][col]
                matrix[i] = [v - scale*w for v, w in zip(matrix[i], matrix[col])]
    return tuple(row[-1] for row in matrix)


def exponent(point):
    d, s, a, y = point
    b = max(0, min(y, d-y))
    phi = max(a, b, 5*a/6 + b/3, a/3 + 5*b/6)
    return F(1, 6) + y/3 + s/2 + (phi-a)/2


def maximize(limit, order_six_limit=None):
    # d, s, a, y respectively log D, log(D_+ D_-), log A, log Y.
    base = [
        ((-1, 0, 0, 0), 0), ((1, 0, 0, 0), limit),
        ((0, -1, 0, 0), 0), ((-1, 1, 0, 0), 0),
        ((0, 1, -2, 0), 0), ((0, -1, 1, 0), 0),
        ((0, 0, 0, -1), 0), ((0, 0, 0, 1), 1),
    ]
    if order_six_limit is not None:
        base.append(((0, 1, 0, 0), order_six_limit))
    # b is affine on each of the three cells, so the maximum of the
    # convex, piecewise-affine exponent is realized at a cell vertex.
    cells = [
        [((-1, 0, 0, 2), 0)],                          # 2y <= d
        [((1, 0, 0, -2), 0), ((-1, 0, 0, 1), 0)],    # y <= d <= 2y
        [((1, 0, 0, -1), 0)],                          # d <= y
    ]
    points = set()
    for constraints in cells:
        faces = base + constraints
        for subset in combinations(faces, 4):
            point = solve(subset)
            if point is not None and all(
                sum(c*x for c, x in zip(normal, point)) <= rhs
                for normal, rhs in faces
            ):
                points.add(point)
    return max((exponent(point), point) for point in points)


def check(condition, message):
    if not condition:
        raise ArithmeticError(message)
    print("OK", message)


if __name__ == "__main__":
    maximum, point = maximize(cutoff)
    check(maximum == F(125, 96), f"covered maximum {maximum} at {point}")
    maximum_small, _ = maximize(F(1))
    check(maximum_small == 1, "all d <= 1 cost at most 1")
    order_six_maximum, _ = maximize(F(104), F(7, 6))
    check(order_six_maximum == F(47, 36), "order-six conductor product cutoff 7/6")
    check(price - order_six_maximum == F(1, 2250), "order-six range margin 1/2250")
    check(F(125, 96) < price, f"moment margin {price-F(125,96)}")
    check(price - 8*value_floor == F(".62472"), "conditional count .62472")
    check(price - 8*value_floor < count_floor - 2*eta,
          f"count margin {count_floor-2*eta-price+8*value_floor}")
    cutoff_small = F(".303")
    sixth = max(F(1), 3*cutoff_small, F(5, 6) + cutoff_small,
                F(1, 3) + F(5, 2)*cutoff_small)
    check(8*(1-F(".5748")) == F("3.4016"), "physical dual upper exponent 3.4016")
    check(sixth == F(5, 6) + cutoff_small, "short sixth moment at N <= U^.303")
    check(sixth - 6*value_floor == F(46903, 75000) < count_floor - 2*eta,
          "short reflected physical count below target")
    obstruction = exponent(tuple(map(F, (2, 2, 1, 1))))
    check(obstruction == F(19, 12) > price, "uncertified core at conductor exponent 2")
    for length, expected in [(F(6, 5), F(4, 3)), (F(8, 5), F(5, 3))]:
        sieve = max(1, length, F(5, 6) + length/3, F(1, 3) + 5*length/6)
        check(sieve == expected, f"ordinary sieve at column length exponent {length}")
    check(1 - 4*value_floor == F(".65936"), "ordinary fourth-moment count at the spike")
