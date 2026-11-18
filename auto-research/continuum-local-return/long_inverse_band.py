"""Exact comparisons for the long detector's Fourier interval at tracker #143."""
from fractions import Fraction as F
from itertools import product
from math import gcd


def require(condition, label):
    if not condition:
        raise ValueError(label)
    print(f"{label}: OK")


def main():
    s, e, gain = F('8e-7'), F('6e-8'), F('6e-7')
    # marked_window.py encloses the cutoff; crossing.py gives the shifted band.
    r_lo = F('1.12796') - F('1e-6')
    r_hi = F('1.12903') + F('2e-6')
    require(F('1.1279') < r_lo < r_hi < F('1.1291'), 'physical dyad enclosure')
    require((r_lo - s - 1) / 6 > F('.021') > s, 'prime lift correction is short')
    require(5*s/6 - e - gain == F(1, 150000000), 'reserve in the local count')
    require(s - e == F(74, 10**8), 'logarithmic width of each dual interval')
    require(r_lo - s > 1, 'projected dyads stay in the uniform sector range')

    # All sector inequalities below worsen when r decreases to one, and when
    # the shortening increases to s. Thus test the worst pair r=1, s=8e-7.
    r = F(1)
    xi, split = F('.04')*r, F('.235')*r
    lam = r - split
    reflection = r/2 + xi/2 + 2*split + F('6.5')*s
    linear = lam + (r+s+4*xi)/5
    cubic = (2*lam+r+s+2*xi)/3
    require(max(reflection, (r+s+xi)/2, linear, cubic) < r-s,
            'completed reflection and cubic/quadratic sector')

    # In the grouped sieve the reflected and reopened branches meet at
    # (r - xi)/4 + 4*v - 4*s. Compare the coefficients of s exactly.
    require(1 - 5*F('.199995') - 28*s == F(13, 5000000),
            'uniform valuation-one cutoff inside the grouped sieve')
    require(F(13, 2) - 8 < -1 and 4 - F(28, 4) <= -3
            and 3 - F(28, 6) < -1, 'grouped reflection, conductor and cubic margins')
    xi, alpha, lam = F(1, 5), F(2, 5), F(4, 5)
    require(xi + max(2*alpha, lam) == xi + max(alpha, lam, 2*(alpha+lam)/3) == 1,
            'limiting equality for the two grouped sieves')

    # The four branches of the full sextic sieve on the sixth-power-free core.
    for v, powerful, label in ((2*r/67+s, 0, 'arbitrary core'),
                               (r/40, 51*r/200, 'mixed powerful core')):
        core_length = r+s-6*v
        switch = 11*v/2 + powerful/4 - 4*s
        column = r-switch
        require(v >= 2*s and 35*v+powerful/2 >= r+19*s
                and 67*v+5*powerful/2 >= 2*r+56*s, f'{label} sufficient guards')
        completed = max(r+s-5*v-powerful/2, r+4*s-11*v-powerful/2+2*switch)
        sieve = v + max(core_length, column, 5*core_length/6+column/3,
                        core_length/3+5*column/6)
        require(max(completed, sieve) < r-s, f'{label} completed and sieve prices')

    # For rational-squarefree columns, a common split prime occurs first at
    # the same place or at the opposite place. Solitary primes give exactly
    # the quotient of the product of norms by the squared integer gcd.
    primes = (7, 13, 19)
    for first in product(range(3), repeat=len(primes)):
        for second in product(range(3), repeat=len(primes)):
            n = m = same = opposite = solitary = 1
            for p, a, b in zip(primes, first, second):
                if a:
                    n *= p
                if b:
                    m *= p
                if a and b:
                    if a == b:
                        same *= p
                    else:
                        opposite *= p
                elif a or b:
                    solitary *= p
            if gcd(n,m) != same*opposite or n*m != (same*opposite)**2*solitary:
                raise ValueError((first, second))
    print('split-prime orientation and conductor identities: OK (729 pairs)')


if __name__ == '__main__':
    main()
