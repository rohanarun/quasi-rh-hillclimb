"""Minimal outward-rounded interval arithmetic over exact rationals.

Endpoints are fractions.Fraction; after each operation they are rounded outward to a
grid of 10^-DIGITS, so every result encloses the exact real value. Used only for the
quantities that involve square roots (the top-row closed form and the window top)."""
from fractions import Fraction as Q
import math

DIGITS = 60
_N = 10**DIGITS


def _down(x):
    return Q(math.floor(x * _N), _N)


def _up(x):
    return Q(math.ceil(x * _N), _N)


class I:
    __slots__ = ("lo", "hi")

    def __init__(self, lo, hi=None):
        if isinstance(lo, I):
            self.lo, self.hi = lo.lo, lo.hi
            return
        lo = Q(lo)
        hi = lo if hi is None else Q(hi)
        if lo > hi:
            raise ValueError(f"interval endpoints out of order: {lo} > {hi}")
        self.lo, self.hi = lo, hi

    @staticmethod
    def _c(x):
        return x if isinstance(x, I) else I(x)

    def __add__(self, o):
        o = I._c(o)
        return I(_down(self.lo + o.lo), _up(self.hi + o.hi))
    __radd__ = __add__

    def __neg__(self):
        return I(-self.hi, -self.lo)

    def __sub__(self, o):
        return self + (-I._c(o))

    def __rsub__(self, o):
        return I._c(o) - self

    def __mul__(self, o):
        o = I._c(o)
        p = [self.lo * o.lo, self.lo * o.hi, self.hi * o.lo, self.hi * o.hi]
        return I(_down(min(p)), _up(max(p)))
    __rmul__ = __mul__

    def __truediv__(self, o):
        o = I._c(o)
        if o.lo <= 0 <= o.hi:
            raise ZeroDivisionError("interval division by an interval containing 0")
        return self * I(_down(1 / o.hi), _up(1 / o.lo))

    def __rtruediv__(self, o):
        return I._c(o) / self

    def __pow__(self, n):
        if n != 2:
            raise ValueError(f"only interval squaring (n == 2) is supported, got {n!r}")
        return self * self

    def sqrt(self):
        if self.lo < 0:
            raise ValueError(f"interval sqrt requires nonnegative lower bound, got {self.lo}")
        return I(_sqrt_down(self.lo), _sqrt_up(self.hi))

    def __lt__(self, o):   # certainly less
        return self.hi < I._c(o).lo

    def __gt__(self, o):   # certainly greater
        return self.lo > I._c(o).hi

    def __le__(self, o):
        return self.hi <= I._c(o).lo

    def __ge__(self, o):
        return self.lo >= I._c(o).hi

    def mid(self):
        return (self.lo + self.hi) / 2

    def __float__(self):
        return float(self.mid())

    def __repr__(self):
        return f"[{float(self.lo):.15g}, {float(self.hi):.15g}]"


def _sqrt_down(x):
    # largest k/N with (k/N)^2 <= x
    k = math.isqrt(x.numerator * _N * _N // x.denominator)
    while Q(k, _N) ** 2 > x:
        k -= 1
    return Q(k, _N)


def _sqrt_up(x):
    k = _sqrt_down(x)
    return k if k * k == x else k + Q(1, _N)


def isqrt(x):
    return I._c(x).sqrt()
