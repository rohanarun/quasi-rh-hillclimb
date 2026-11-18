"""Exact limiting inequalities for the radical-deficient physical class at the #143 contact."""

from fractions import Fraction as F


def require(condition, description):
    if not condition:
        raise ValueError(description)


def main():
    radical_deficit = F(1, 100000)
    reflection_gain = radical_deficit / 3
    target = F('0.87334585')
    theta_upper = F(174669171221343715360237, 200000000000000000000000)
    d_low, h_low, h_high = F('.76'), F('.815324503'), F('.815324505')
    ell_low = F(11, 3) - 4 * theta_upper
    ell_high = F(11, 3) - 4 * target
    delta_low, delta_high, p_low = F('.417'), F('.435'), F('.499')
    residual_ratio = -F('.143') + delta_low * (F('.585') - F('.331') / 2)
    j_upper = F(5, 2)
    row_debit = (3 + 4 * delta_high) * (theta_upper - target)
    edge_margin_debit = j_upper * row_debit
    transport_debit = 6 * F(7, 10**9)
    fee = F(1, 10**9)
    source_cost = D_extension = F(1, 10**10)
    band_low = h_low - F(1, 100000)

    # At the final edge the affine branch remains below the hard physical cap.
    # y_t=h-2 ell_t, and all D in the band exceed band_low.
    cap_slack = F(3, 40) - ((h_high - 2*ell_low)/band_low - F(1, 2))
    require(cap_slack > reflection_gain, 'hard cap at critical edge')
    require(-radical_deficit + reflection_gain + radical_deficit / 2 < 0,
            'coefficient mass must have a strict power reserve')
    saved = band_low * delta_low * p_low * reflection_gain / 2
    require(saved > transport_debit + fee, 'reflected physical row throughout band')

    # This p restriction holds on every D in [.76,h] for large error-slot width.
    p_gap = radical_deficit * d_low / (4 * ell_high)
    large_error_margin = delta_low * residual_ratio * p_gap
    require(residual_ratio > F('.0319'), 'critical rectangle coefficient')
    require(large_error_margin / j_upper > transport_debit + fee, 'large error-slot class')
    switch_margin = F(1, 125)/j_upper
    require(switch_margin > transport_debit + fee, 'second interpolation endpoint')
    require(F(1, 100000)/(h_high - d_low)*switch_margin > transport_debit + fee,
            'unmodified branch through the start of the band')
    # The full width loss of the positive face is small even with b retained.
    require((1+10*F(3,40))/2 < 1, 'positive source width cost is less than s')
    # In the large-error case use the inherited 15s/16 row estimate; in the
    # small-error case b increases cap derivative in s by < 5b globally.
    require(fee - D_extension - (F(15,16)+5*reflection_gain)*source_cost > fee/2,
            'positive source and enlarged conductor fee')

    for label, value in [('hard cap slack', cap_slack), ('saved physical row', saved),
                         ('row debit', row_debit), ('masked amplitude gap', p_gap),
                         ('large error margin', large_error_margin),
                         ('margin debit', edge_margin_debit)]:
        print(f'{label}: {value}')


if __name__ == '__main__':
    main()
