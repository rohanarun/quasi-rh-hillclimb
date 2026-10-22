"""Chart of the zero-free half-plane improvement. Writes graphs/improvement.png.
Values are exact rationals from auto-research/results.md and edge.py."""
import os
from fractions import Fraction as Fr
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch

SURF, INK, INK2, MUTED, GRID = "#fcfcfb", "#0b0b0b", "#52514e", "#8a8984", "#e6e5e0"
BLUE, BLUE_LT, GRAY = "#2a78d6", "#a9c8ef", "#b9b8b2"
plt.rcParams.update({"font.family": ["Inter", "DejaVu Sans"], "font.size": 11,
                     "text.color": INK, "axes.labelcolor": INK2, "xtick.color": INK2, "ytick.color": INK2})

fig = plt.figure(figsize=(12, 5.6), facecolor=SURF)
fig.text(0.04, 0.94, "Quasi-RH: pushing the zero-free half-plane past 7/8", fontsize=17, weight="semibold")
fig.text(0.04, 0.895, "Conditional on OpenAI's 7/8 preprint. Re-tuning its Part II parameters moves the boundary left by ~4·10⁻⁵.",
         fontsize=11, color=INK2)

# ---------- left: where the boundary sits on Re s ----------
ax = fig.add_axes([0.04, 0.16, 0.38, 0.62], facecolor=SURF)
ax.set_xlim(0.49, 1.01); ax.set_ylim(0, 1)
ax.axvspan(7/8, 1.0, ymin=0.38, ymax=0.62, color=BLUE_LT, lw=0)
ax.hlines(0.5, 0.5, 7/8, color=INK2, lw=1)
marks = [(0.5, "RH  1/2", GRAY, "below", "left"), (float(Fr(1573, 1818)), "ideal low, h < 5ℓ:\nσ₀ > 0.865236…", GRAY, "above", "right"),
         (7/8, "preprint 7/8 + ours", BLUE, "below", "right"), (11/12, "Part I\n11/12", GRAY, "above", "left"),
         (1.0, "", GRAY, "below", "right")]
for x, lab, c, pos, ha in marks:
    ax.plot([x, x], [0.36, 0.64], color=c, lw=2, solid_capstyle="round")
    y, va = (0.30, "top") if pos == "below" else (0.70, "bottom")
    dx = {"left": -0.004, "right": 0.004, "center": 0}[ha]
    ax.text(x + dx, y, lab, ha=ha, va=va, fontsize=10, color=INK if c == BLUE else INK2, linespacing=1.25)
ax.text(0.9583, 0.5, "zero-\nfree", ha="center", va="center", fontsize=9.5, color=INK2, linespacing=1.1)
ax.set_yticks([]); ax.set_xticks([0.5, 0.6, 0.7, 0.8, 0.9, 1.0])
for s in ("left", "right", "top"): ax.spines[s].set_visible(False)
ax.spines["bottom"].set_color(GRID); ax.set_xlabel("Re s", color=INK2)
ax.set_title("Boundary on the full scale", loc="left", fontsize=12.5, weight="semibold", pad=10)

# ---------- right: gain below 7/8 ----------
bx = fig.add_axes([0.66, 0.16, 0.31, 0.62], facecolor=SURF)
rows = [("Preprint (Sep 30)", Fr(0), "7/8", GRAY),
        ("First re-tune", Fr(1, 28000), "7/8 − 1/28000", BLUE_LT),
        ("Certified + audited", Fr(1, 23600), "7/8 − 1/23600", BLUE),
        ("hillclimb.py (final section)", Fr(1, 23304), "7/8 − 1/23304", BLUE_LT)]
edge = 4.293
for i, (lab, g, exact, c) in enumerate(rows):
    y = len(rows) - 1 - i; v = float(g) * 1e5
    if v > 0:
        bx.add_patch(FancyBboxPatch((0, y - 0.28), v, 0.56, boxstyle="round,pad=0,rounding_size=0.06",
                                    mutation_aspect=0.12, fc=c, ec="none"))
    bx.text(-0.08, y, lab, ha="right", va="center", fontsize=10.5, color=INK)
    bx.text(max(v, edge) + 0.15 if v else 0.1, y, f"{exact}\n({v:.2f})" if v else exact, ha="left", va="center", fontsize=9.5, color=INK2, linespacing=1.15)
bx.axvline(edge, color=INK2, lw=1, ls=(0, (3, 3)))
bx.text(edge - 0.1, len(rows) - 0.3, "edge of the frozen\nmethod: 4.293", ha="right", va="bottom", fontsize=9, color=INK2)
bx.set_xlim(0, 6.6); bx.set_ylim(-0.6, len(rows) + 0.35); bx.set_yticks([])
bx.set_xticks([0, 1, 2, 3, 4, 5]); bx.grid(axis="x", color=GRID, lw=0.8); bx.set_axisbelow(True)
for s in ("left", "right", "top"): bx.spines[s].set_visible(False)
bx.spines["bottom"].set_color(GRID)
bx.set_xlabel("gain below 7/8   (×10⁻⁵)", color=INK2)
bx.set_title("Zoom: how far below 7/8", loc="left", fontsize=12.5, weight="semibold", pad=10, x=-0.6)

fig.text(0.04, 0.03, "All results conditional on the preprint's 7/8 theorem; audit is AI-assisted, not refereed.  "
         "github.com/rohanarun/quasi-rh-hillclimb", fontsize=9, color=MUTED)
out = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "graphs", "improvement.png")
os.makedirs(os.path.dirname(out), exist_ok=True)
fig.savefig(out, dpi=200, facecolor=SURF)
print("wrote", os.path.normpath(out))
