"""Exact rational checks for the reflected physical dyad and extra prime marks."""

from fractions import Fraction as F


def positive(label, margin):
    if margin <= 0:
        raise ArithmeticError(f"{label}: {margin}")
    print(f"OK {label}: {margin}")


def verify():
    target = F(17466917, 20000000)
    ell = F(11, 3) - 4 * target
    unit = F(1, 10**6)
    eta = F(1, 10**7)
    required_gain = 3 * eta / 4
    s_max = F(1, 10**9)
    lambda_max = 2 + 10 * s_max
    q_min = F(".425") * F(".49995")
    q_max = F(".4267") / 2
    h_low, h_high = F(".815324503"), F(".815324505")
    k_low, k_high = -F("1e-5"), F("1e-10")

    # x0=(2 ell + k)/(h+k). Both numerators are positive and h>2 ell.
    positive("x0 decreases with h", 2 * ell + k_low)
    positive("x0 increases with k", h_low - 2 * ell)
    x_low = (2 * ell + k_low) / (h_high + k_low)
    x_high = (2 * ell + k_high) / (h_low + k_high)
    positive("physical x0 lower enclosure", x_low - F(".42505871"))
    positive("physical x0 upper enclosure", F(".42506577") - x_high)
    positive("positive affine capacity", 1 - s_max - 2 * x_high)
    positive("affine capacity below cap", F(3, 40) - (1 - 2 * x_low) / 2)

    short_extra = F(".9") * unit
    upper = F(".80") * unit
    dilation = F(".75") * unit
    positive("short-side source budget", 2 * unit - lambda_max * short_extra)
    positive("short-side saving in excess of target",
             q_min * short_extra / 2 - required_gain - F("2e-8"))
    positive("high-dilation saving beyond target",
             F(".425") * dilation / 4 - required_gain)
    positive("uniform Fourier tail slack", upper - dilation)
    if upper + unit != F("1.8e-6"):
        raise ArithmeticError("incorrect window width")

    lower_width = (1 - s_max - 2 * x_high) / lambda_max
    decrement = F(".81") * unit
    positive("whole-window budget for a fixed smaller width",
             2 * decrement - 2 * upper)
    positive("nonuniform test width lower bound", lower_width - decrement - F(".0747"))
    positive("nonuniform full-window saving in excess of target",
             (5 * unit * F(".0747") - q_max * decrement) / 2
             - required_gain - F("2.5e-8"))

    # The minimum of b is at the longest dyad, maximum at the shortest.
    b_min = (1 - s_max - 2 * (x_high + upper)) / lambda_max
    b_max = (1 - 2 * (x_low - unit)) / 2
    positive("complete marked column below .926",
             F(".926") - (2 * (x_high + upper) + b_max + F("1e-5")))
    positive("positive base width on the window", b_min)
    positive("extra selection below .076", F(".076") - b_max - unit)
    positive("larger source width cap above .076", F(3, 20) - 1000 * s_max / 1143 - F(".076"))
    positive("physical slot supply above .2", ell / (h_high + k_high) - F(".2"))
    positive("extra conductor headroom at slot width 1e-9",
             F("2.01e-6") - 2 * (unit + F("1e-9")))
    fee = q_min * unit / 2 - eta / 4 - required_gain
    if fee != F("6.239375e-9"):
        raise ArithmeticError(f"incorrect extra-mark margin: {fee}")
    positive("margin after Fourier slack of 1e-8", fee - q_max * F("1e-8") / 2)

    # The unrestricted power sieve comparison at the stationary geometry.
    positive("pointwise buffer", F(".086") - ((1 - F(".62567")) / 4 - q_min * lower_width / 2))
    positive("prime gain times length exceeds v0", q_min * F(".425") - F(".086"))
    positive("small-power count exceeds .73", F(7, 6) - 2 * q_max - F(".73"))
    positive("large-power count exceeds .87", F(1, 3) + 3 * (5 * F(".425") / 6 - 2 * F(".086")) - F(".87"))


if __name__ == "__main__":
    verify()
