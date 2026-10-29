"""Render a source-backed comparison; full proof status comes only from a replay receipt."""
import argparse
import csv
import json
import os
import zipfile
from datetime import datetime
from fractions import Fraction
from pathlib import Path
from zoneinfo import ZoneInfo

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--evidence", type=Path, default=ROOT / "verification/pr8-independent")
parser.add_argument("--submission", type=Path, default=ROOT / "submissions/hailey-collet-1252270103")
parser.add_argument("--replay", type=Path)
parser.add_argument("--output", type=Path, default=ROOT / "graphs/pr8-comparison")
args = parser.parse_args()
os.environ.setdefault("MPLCONFIGDIR", str(args.evidence / "matplotlib-cache"))
import matplotlib
matplotlib.use("Agg")
import matplotlib.dates as mdates
import matplotlib.pyplot as plt
from matplotlib.ticker import FormatStrFormatter

catalogue = json.loads((args.evidence / "tracker-catalogue.json").read_text())
summary = json.loads((args.submission / "verification/summary.json").read_text())
pr = json.loads((args.evidence / "pr8.json").read_text())
tracker_pr = json.loads((args.evidence / "tracker-pr69.json").read_text())
target = Fraction(summary["result"]["theta"])
# Preserve the original plotted proposals and their historical timestamps.
with (ROOT / "graphs/timeline.csv").open() as stream:
    conditional = [dict(row, pr=(2 if "Sudarsh" in row["contributor"] else
                                6 if "PR #68" in row["contributor"] else 1),
                        timestamp_source="original timeline.csv (UTC)")
                   for row in csv.DictReader(stream) if row["status"].startswith("conditional")]
conditional += json.loads((ROOT / "graphs/conditional-pr-refinements.json").read_text())
assert all(row["status"] == "conditional, not Lean-verified" for row in conditional)
assert len({(r["time_utc"], r["contributor"], r["theta_exact"]) for r in conditional}) == len(conditional)

records = [r for r in catalogue["records"] if r["status"] == "framework-verified"]
# Tracker records accepted after the frozen catalogue snapshot (sourced from the
# tracker's verifier receipts; see graphs/tracker-updates.json).
updates = json.loads((ROOT / "graphs/tracker-updates.json").read_text())
known = {r["id"] for r in records}
records += [r for r in updates["records"] if r["id"] not in known and r["status"] == "framework-verified"]
pending = [r for r in updates["records"] if r["status"] == "pending"]
fraction = lambda r: Fraction(int(r["theta"]["numerator"]), int(r["theta"]["denominator"]))
best = min(records, key=fraction)
baseline = next(r for r in records if r["id"] == "openai-baseline")
base = fraction(baseline)
previous = next(r for r in records if r.get("pr") == 68)  # accepted record at the 22 Oct snapshot
pr8_record = next(r for r in records if r.get("pr") == 69)
assert fraction(pr8_record) == target, "tracker #69 must be the PR #8 endpoint"
assert tracker_pr["headRefOid"] == summary["result"]["source_commit"]
verified = False
receipt = None
if args.replay:
    receipt = json.loads(args.replay.read_text())
    identity = json.loads((args.evidence / "run-identity.json").read_text())
    compilation = json.loads((args.evidence / "compilation-audit.json").read_text())
    assert identity["source_commit"] == compilation["source_commit"] == summary["result"]["source_commit"]
    verified = (receipt.get("status") == "passed"
                and receipt.get("compiled_modules") == summary["completed"]["source_modules"]
                and receipt.get("axiom_audit_passed") is True
                and receipt.get("sources_unchanged") is True
                and receipt.get("endpoint", {}).get("exit_code") == 0
                and receipt.get("kernel-replay", {}).get("exit_code") == 0)

tz = ZoneInfo("America/New_York")
date = lambda s: datetime.fromisoformat(s.replace("Z", "+00:00")).astimezone(tz)
stamp = lambda r: date(r.get("timeline_at") or r.get("submitted_at") or r["first_verified_at"])
events = sorted((r for r in records if fraction(r) <= base), key=stamp)
frontier, incumbent = [], None
for record in events:
    value = fraction(record)
    if incumbent is None or value < incumbent:
        frontier.append(record)
        incumbent = value
with zipfile.ZipFile(args.submission / "lean-sources.zip") as archive:
    metadata = json.loads(archive.read("metadata.json"))
author = ", ".join(a["name"] for a in metadata["authors"])
candidate_time = date(pr["createdAt"])
retrieved_at = json.loads((args.evidence / "retrieval.json").read_text())["retrieved_at"]
checked_label = date(retrieved_at).strftime("%b %d, %Y %H:%M %Z")
gain = fraction(previous) - fraction(best)
relative_gain = (base - fraction(best)) / (base - fraction(previous))
INK, MUTED, BLUE, GREEN, AMBER, BG = "#17243a", "#53647b", "#2864b5", "#077b61", "#ad601c", "#f8fafc"
TEAL, PURPLE = "#3f8a8c", "#6a3fb5"
accent = GREEN if verified else AMBER
plt.rcParams.update({"font.family": "DejaVu Sans", "text.color": INK,
                     "axes.labelcolor": MUTED, "xtick.color": MUTED, "ytick.color": MUTED,
                     "font.size": 11, "svg.fonttype": "none"})
fig = plt.figure(figsize=(20, 16.5), facecolor=BG)
fig.text(.06, .955, "Quasi-Riemann Hypothesis: progress in the zero-free boundary", fontsize=25, weight="bold")
fig.text(.06, .922, "All-moduli Dirichlet nonvanishing for Re(s) > θ, excluding the principal pole. Lower θ is stronger.", fontsize=12, color=MUTED)
best_name = ", ".join(a["name"] for a in best["authors"])
fig.text(.06, .845, f"θ = {float(fraction(best)):.10g}", fontsize=36, weight="bold", color=BLUE)
fig.text(.06, .8, f"Current accepted tracker record · {best_name} · tracker #{best['pr']} · {fraction(best)}", fontsize=12)
status = (f"This repo's PR #8 ({author}, θ = {float(target):.10f}) was accepted as tracker #69"
          + (" after a fresh native Lean replay here" if verified else ""))
fig.text(.06, .755, status, fontsize=12, color=accent, weight="bold")
# Accepted tracker entries that came from this repo or its maintainer but were
# superseded before admission (not on the frontier) are still shown and credited.
off_frontier = [r for r in records if r not in frontier and r.get("hillclimb_pr")
                and r is not pr8_record and fraction(r) < fraction(previous)]
own = next((r for r in frontier if r.get("pr") == 84), None)
if off_frontier or own:
    parts = []
    if own:
        parts.append(f"tracker #84 ({float(fraction(own)):g}, Rohan Arun) accepted {stamp(own):%d %b}")
    repo_acc = sorted((r for r in records if r.get("hillclimb_pr") and r is not pr8_record), key=lambda r: r["pr"])
    if repo_acc:
        names = ", ".join(sorted({x["name"] for r in repo_acc for x in r["authors"]}))
        parts.append("this repo's PRs " + ", ".join(f"#{r['hillclimb_pr']}" for r in repo_acc) + f" ({names}) became tracker "
                     + ", ".join(f"#{r['pr']}" for r in repo_acc) + ", all Lean-accepted")
    fig.text(.06, .727, "Also: " + "; ".join(parts), fontsize=11, color=PURPLE, weight="bold")
fig.text(.66, .865, f"{float(relative_gain):.2f}×", fontsize=32, weight="bold", color=BLUE)
fig.text(.66, .83, "the improvement beyond 7/8", fontsize=12)
fig.text(.66, .8, f"of the 22 Oct record ({float(fraction(previous))}, tracker #68)", fontsize=12, color=MUTED)
fig.text(.66, .755, f"Boundary reduction since then: {float(gain):.10f}", fontsize=11, color=MUTED)

ax = fig.add_axes([.07, .1, .47, .54], facecolor=BG)
times, values = [stamp(r) for r in frontier], [float(fraction(r)) for r in frontier]
now = max(stamp(r) for r in updates["records"] if r["status"] == "framework-verified").replace(hour=23, minute=59)
ax.step(times + [now], values + [values[-1]], where="post", color=BLUE, lw=2.4)
ax.scatter(times, values, s=26, color=BLUE, zorder=3)
ax.scatter([stamp(pr8_record)], [float(target)], s=95, marker="D", color=accent, edgecolor=accent, lw=2, zorder=4)
for r in off_frontier:
    ax.scatter([stamp(r)], [float(fraction(r))], s=70, facecolor=BG, edgecolor=GREEN, lw=2, zorder=5)
# Track A points from this repo (unchanged scope: Lean anchor and final-section certificate).
track_a = [("2026-10-22T01:32:12Z", Fraction(139999, 160000), "rohanarun", "repo #9 · Lean (τ = 1/40000)"),
           ("2026-10-22T17:45:17Z", Fraction(4374785349, 5000000000), "thakrarsagar", "repo #12 · Track A certificate")]
for r in pending:
    ax.scatter([stamp(r)], [float(fraction(r))], s=70, facecolor=BG, edgecolor=MUTED, lw=1.8, zorder=5)
    ax.plot([stamp(r)] * 2, [float(fraction(r)), values[-1]], color=MUTED, lw=1, ls=":", zorder=2)
ax.scatter([date(t) for t, *_ in track_a], [float(v) for _, v, *_ in track_a], s=70, marker="s", color=TEAL, zorder=4)
conditional_time = lambda row: date(row["time_utc"].replace(" ", "T") + ("Z" if not row["time_utc"].endswith("Z") else ""))
conditional_groups = {number: [r for r in conditional if r["pr"] == number]
                      for number in sorted({r["pr"] for r in conditional})}
conditional_endpoints = []
for number, group in conditional_groups.items():
    ordered = sorted(group, key=lambda r: (conditional_time(r), -Fraction(r["theta_exact"])))
    ax.plot([conditional_time(r) for r in ordered],
            [float(Fraction(r["theta_exact"])) for r in ordered],
            color=AMBER, lw=1.5, ls="--", marker="_", markevery=[len(ordered)-1],
            markersize=9, markeredgewidth=1.5, zorder=4)
    conditional_endpoints.append(min(group, key=lambda r: Fraction(r["theta_exact"])))
ax.set_title("Tracker progress and conditional PR contributions", loc="left", pad=16, fontsize=12, weight="bold")
ax.set_ylabel("Zero-free boundary θ")
ax.yaxis.set_major_formatter(FormatStrFormatter("%.5f"))
ax.xaxis.set_major_locator(mdates.AutoDateLocator(minticks=4, maxticks=6, tz=tz))
ax.xaxis.set_major_formatter(mdates.DateFormatter("%b %d", tz=tz))
ax.margins(x=.05, y=.08)

# Keep labels in boundary order in their own column. Even vertical spacing
# separates the crowded recent points while retaining a leader to every point.
fig.text(.59, .69, "Contributor · source PR · boundary θ", fontsize=12, weight="bold")
def tracker_color(r):
    if r is pr8_record or r in off_frontier or r.get("hillclimb_pr"):
        return accent
    return PURPLE if r is own else BLUE
points = [
    (stamp(r), fraction(r), ", ".join(a["name"] for a in r["authors"]),
     (f"#{r['pr']} (repo PR #{r['hillclimb_pr']})" if r.get("hillclimb_pr") else f"#{r['pr']}") if r.get("pr") else "",
     tracker_color(r), r["id"] == best["id"] or r is pr8_record or r is own or r in off_frontier or bool(r.get("hillclimb_pr")))
    for r in frontier + off_frontier
]
points += [(date(t), v, name, source, TEAL, True) for t, v, name, source in track_a]
points += [(stamp(r), fraction(r), ", ".join(a["name"] for a in r["authors"]), f"tracker #{r['pr']} · pending", MUTED, False) for r in pending]
for row in conditional_endpoints:
    points.append((conditional_time(row), Fraction(row["theta_exact"]),
                   row["contributor"].split(" · ")[0],
                   f"repo #{row['pr']} · conditional", AMBER, True))
points.sort(key=lambda p: p[1], reverse=True)
contributor_labels = []
for index, (time, boundary, name, source, color, highlight) in enumerate(points):
    label_y = .665 - index * (.565 / max(1, len(points) - 1))
    value = f"{float(boundary):.12f}".rstrip("0").rstrip(".")
    label = " · ".join(part for part in (name, source, value) if part)
    annotation = ax.annotate(
        label, (time, float(boundary)), xycoords="data",
        xytext=(.59, label_y), textcoords="figure fraction",
        ha="left", va="center", fontsize=11,
        color=color if highlight else INK,
        weight="bold" if highlight else "normal", annotation_clip=False,
        arrowprops=dict(arrowstyle="-", color=color if highlight else MUTED,
                        lw=.7, alpha=.8, shrinkA=5, shrinkB=3,
                        relpos=(0, .5), connectionstyle="arc3,rad=0"),
    )
    contributor_labels.append(annotation)

for a in (ax,):
    a.grid(axis="y", color="#dce4ed", linewidth=.7)
    a.set_axisbelow(True)
    a.tick_params(length=0, pad=8)
    for spine in a.spines.values():
        spine.set_visible(False)
foot = ("Blue: accepted tracker records (frontier). Green: this repo's PRs accepted on the tracker (diamond: PR #8 as #69; hollow: PR #30 as #85, admitted after #86).\n"
        "Purple: tracker #84. Teal squares: Track A points. Gray hollow: open tracker PR, not yet admitted. Orange dashed: conditional PRs in this repo, not Lean-verified.")
fig.text(.06, .038, "Tracker records after 22 Oct come from verifier receipts and merged tracker PRs; #89 and #91–#94 were merged together on 29 Oct and are placed at submission time. See graphs/tracker-updates.json.", fontsize=9, color=MUTED)

fig.text(.06, .058, foot, fontsize=9, color=MUTED, linespacing=1.6)
fig.text(.06, .012, f"Updated {updates['as_of']} · {len(records)} accepted tracker entries and {len(conditional)} conditional PR points. Timeline dates shown in America/New_York.\n"
         "Comparison of cited sources, not a worldwide-record claim. Sources: GTimG/QuasiRiemannTracker catalogue, receipts and merged PRs; rohanarun/quasi-rh-hillclimb PRs #1–3, #6, #8, #9, #12, #26–28, #30, #32, #34, #36, #39; original timeline.csv; frozen source package.", fontsize=9, color=MUTED, linespacing=1.7)
# (scope note moved into the sources line below)
# Measure the rendered labels, shrink long entries only as needed, and ensure
# the expanded contributor list stays on the canvas without overlapping.
from matplotlib.text import Text
fig.canvas.draw()
renderer = fig.canvas.get_renderer()
for label in contributor_labels:
    box = Text.get_window_extent(label, renderer)
    available = fig.bbox.width * .98 - box.x0
    if box.width > available:
        label.set_fontsize(label.get_fontsize() * available / box.width)
fig.canvas.draw()
renderer = fig.canvas.get_renderer()
boxes = [Text.get_window_extent(label, renderer) for label in contributor_labels]
assert all(0 <= b.x0 < b.x1 <= fig.bbox.width and 0 <= b.y0 < b.y1 <= fig.bbox.height for b in boxes)
assert all(not a.overlaps(b) for i, a in enumerate(boxes) for b in boxes[i+1:])
assert all(label.arrow_patch is not None for label in contributor_labels)
args.output.parent.mkdir(parents=True, exist_ok=True)
for suffix in ("png", "svg"):
    fig.savefig(args.output.with_suffix("."+suffix), dpi=200, facecolor=BG)
    if suffix == "svg":
        svg = args.output.with_suffix(".svg")
        svg.write_text("\n".join(line.rstrip() for line in svg.read_text().splitlines()) + "\n")
args.output.with_suffix(".json").write_text(json.dumps({"candidate_theta": str(target), "accepted_best_theta": str(fraction(best)), "previous_record_theta": str(fraction(previous)),
    "difference_exact": str(gain), "relative_gain_beyond_baseline_exact": str(relative_gain),
    "conditional_points": conditional, "independent_native_lean_passed": verified, "tracker_acceptance": True, "tracker_pr": 69,
    "current_record": {"id": best["id"], "tracker_pr": best["pr"], "theta": str(fraction(best))},
    "catalogue_as_of": catalogue["as_of"], "tracker_updates_as_of": updates["as_of"], "retrieved_at": retrieved_at, "source_commit": summary["result"]["source_commit"]}, indent=2)+"\n")
print(args.output.with_suffix(".png"))
