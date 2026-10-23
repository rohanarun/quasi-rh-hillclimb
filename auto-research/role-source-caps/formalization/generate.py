#!/usr/bin/env python3
"""Generate a source-only Lean integration, never a verification receipt.

Subhanjan Das, substantially assisted by OpenAI Codex. New code MIT;
the imported Collet/OpenAI sources retain their inherited licenses.
"""

import hashlib
import json
import re
import zipfile
from fractions import Fraction
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
UP = "Submissions.hailey_collet_1252270103."
NS = "QRH87477137"
ARCHIVE_SHA = "e69c31261bb4f7b997679220f7b0c32063af4721dd95dcb787d8b5074f95adfa"
GRAPH_SHA = "e3802dcab42b566c558898ac072a0a72b51df447c24dadd45e90878fa6d826ac"
HEADER = """/- Prepared by Subhanjan Das, substantially AI-assisted with OpenAI Codex.
New integration MIT; imported Hailey Collet/OpenAI sources retain their notices.
GENERATED SOURCE ONLY: compilation and endpoint verification are outstanding. -/
"""


def sha(data):
    return hashlib.sha256(data).hexdigest()


def q(value):
    value = Fraction(value)
    return f"({value.numerator} / {value.denominator})"


def write(path, content):
    path = HERE / "src" / path
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(HEADER + content)


def imports(modules):
    return "".join(f"import {m}\n" for m in modules)


def main():
    archive = REPO / "submissions/hailey-collet-1252270103/lean-sources.zip"
    graph_file = HERE.parent / "sources.json"
    if sha(archive.read_bytes()) != ARCHIVE_SHA:
        raise ValueError("Inherited archive hash mismatch")
    if sha(graph_file.read_bytes()) != GRAPH_SHA:
        raise ValueError("Saved source graph bytes changed")
    graph = json.loads(graph_file.read_text())
    if len(graph) != 3911:
        raise ValueError("Unexpected number of stages")
    known = {"natural"}
    for node in graph:
        if not re.fullmatch(r"(count|physical)_[1-9][0-9]*", node["id"]):
            raise ValueError("Invalid Lean identifier")
        if node["id"] in known or node["low"] not in known:
            raise ValueError("Non-acyclic graph")
        if node["high"] != node["low"]:
            raise ValueError("This generator requires identical LOW/HIGH parents")
        known.add(node["id"])

    data = imports([UP + "Record1252270103Finite.SourceFormulas"])
    data += "set_option autoImplicit false\nnamespace QRH87477137\n"
    data += "open Record1252270103Finite\n"
    for node in graph:
        values = [q(node[k]) for k in ("B", "L", "cap", "q")]
        values += ["1 / 10^17", "1 / 10^12", "1 / 10^10"]
        data += f"def {node['id']} : Source := ⟨{', '.join(values)}⟩\n"
    data += "end QRH87477137\n"
    write(f"{NS}/Data.lean", data)

    # All data live in one module; finite proofs can compile independently.
    chunk_size = 32
    validity_modules = []
    for chunk_index, offset in enumerate(range(0, len(graph), chunk_size)):
        module = f"{NS}.Validity.V{chunk_index:03d}"
        validity_modules.append(module)
        body = imports([NS + ".Data", UP + "Record1252270103Graph.GraphContract"])
        body += "set_option autoImplicit false\nset_option maxHeartbeats 0\n"
        body += "namespace QRH87477137\nopen Record1252270103Finite QRH.Record1252270103Graph\n"
        for node in graph[offset:offset + chunk_size]:
            name, parent = node["id"], node["low"]
            body += f"theorem {name}_valid : SourceValid {name} {parent} (some {parent}) := by decide +kernel\n"
            body += f"theorem {name}_accounting : NFAccounting {name} := by\n"
            body += f"  norm_num [NFAccounting, {name}]\n"
        body += "end QRH87477137\n"
        write(module.replace(".", "/") + ".lean", body)

    base = imports([NS + ".Data", UP + "Record1252270103Source.Core.Endpoint"])
    base += """set_option autoImplicit false
namespace QRH87477137
noncomputable section
open Record1252270103Finite QRH.Record1252270103Graph
open QRH.Record1252270103Source.Endpoint OAI.SevenEighths
def Ready (s : Source) : Prop := ParentGood s ∧ P s

theorem natural_ready (hbeta : (51/100 : ℝ) ≤ HeckeZeroSupremum.beta) :
    Ready natural := by
  have hk := final_natural_cap seed_step hbeta
  refine ⟨?_, ?_⟩
  · norm_num [ParentGood, natural]
  · simpa [P, natural, finalK] using
      natural_global_source finalK (by norm_num [finalK])
        (by norm_num [finalK]) hbeta hk

theorem next_ready (hbeta : (51/100 : ℝ) ≤ HeckeZeroSupremum.beta)
    {n low : Source} (hv : SourceValid n low (some low))
    (ha : NFAccounting n) (hlow : Ready low) : Ready n := by
  refine ⟨parent_good_of_source_valid hv, ?_⟩
  exact nf_step n low (some low) hbeta (final_natural_cap seed_step hbeta)
    hv hlow.1 ha hlow.2 (by simpa using hlow.2)
end
end QRH87477137
"""
    write(NS + "/SourceBase.lean", base)

    # Each proof refers to earlier opaque theorems, rather than expanding a
    # 3,911-deep expression or assuming a new analytic induction axiom.
    previous_module = NS + ".SourceBase"
    source_modules = []
    for chunk_index, offset in enumerate(range(0, len(graph), chunk_size)):
        module = f"{NS}.Sources.S{chunk_index:03d}"
        source_modules.append(module)
        body = imports([previous_module, validity_modules[chunk_index]])
        body += "set_option autoImplicit false\nnamespace QRH87477137\n"
        body += "open OAI.SevenEighths\n"
        for node in graph[offset:offset + chunk_size]:
            name, parent = node["id"], node["low"]
            body += f"theorem {name}_ready (hbeta : (51/100 : ℝ) ≤ HeckeZeroSupremum.beta) : Ready {name} :=\n"
            body += f"  next_ready hbeta {name}_valid {name}_accounting ({parent}_ready hbeta)\n"
        body += "end QRH87477137\n"
        write(module.replace(".", "/") + ".lean", body)
        previous_module = module

    selected = imports([previous_module]) + """set_option autoImplicit false
namespace QRH87477137
open OAI.SevenEighths QRH.Record1252270103Graph
theorem selected_global_sources
    (hbeta : (51/100 : ℝ) ≤ HeckeZeroSupremum.beta) :
    P count_2691 ∧ P physical_1220 :=
  ⟨(count_2691_ready hbeta).2, (physical_1220_ready hbeta).2⟩
end QRH87477137
#print axioms QRH87477137.selected_global_sources
"""
    write(NS + "/GlobalSources.lean", selected)

    geom = imports([UP + "Record1252270103Return.TransportGeometry"])
    geom += """set_option autoImplicit false
namespace QRH87477137
noncomputable section
open QRH.Record1252270103Return
def theta : ℝ := 87477137 / 100000000
def height : ℝ := 1250109 / 1562500
def ell : ℝ := 11/3 - 4*theta
def x : ℝ := 1+ell-height
def y : ℝ := height-2*ell
def parameters : Geometry.Parameters where
  theta := theta
  ell := ell
  x := x
  y := y
"""
    simplify = "norm_num [theta, height, ell, x, y]"
    for field in ["ell_pos", "sixth_lt_ell", "ell_lt_fifth", "ell_lt_x", "x_lt_y",
                  "y_lt_half", "x_add_y", "dilation_gap", "tuple_margin_neg", "signal_boundary"]:
        geom += f"  {field} := by {simplify}\n"
    geom += "local instance : Geometry.Parameters := parameters\n"
    geom += "def bounds : Geometry.Bounds where\n"
    for field in ["theta_bounds", "h_interval", "ly_coarse", "ell_interval", "small_saving", "floor_margin"]:
        geom += f"  {field} := by norm_num [Geometry.theta, Geometry.h, Geometry.ell, Geometry.x, Geometry.y, Geometry.dPlus, Geometry.signal, Geometry.signalShift, parameters, theta, height, ell, x, y]\n"
    geom += "end\nend QRH87477137\n#print axioms QRH87477137.parameters\n#print axioms QRH87477137.bounds\n"
    write(NS + "/Geometry.lean", geom)

    targets = imports(["Mathlib.NumberTheory.LSeries.DirichletContinuation",
                       "Mathlib.NumberTheory.LSeries.RiemannZeta"])
    targets += """set_option autoImplicit false
namespace QRH87477137.Targets
def dirichlet : Prop := ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (s : ℂ),
  (87477137 / 100000000 : ℝ) < s.re → ¬ (χ = 1 ∧ s = 1) →
    _root_.DirichletCharacter.LFunction χ s ≠ 0
def zeta : Prop := ∀ s : ℂ,
  (87477137 / 100000000 : ℝ) < s.re → s ≠ 1 → riemannZeta s ≠ 0
end QRH87477137.Targets
"""
    write(NS + "/Targets.lean", targets)

    with zipfile.ZipFile(archive) as z:
        inventory = {n: sha(z.read(n)) for n in z.namelist() if n.endswith(".lean")}
        interfaces = {n: h for n, h in inventory.items() if any(
            part in n for part in ["SourceFormulas.lean", "GraphContract.lean",
                                   "Source/Core/Endpoint.lean", "Return/Schedule.lean",
                                   "Return/AdmittedWindow.lean"])}
    generated = {p.relative_to(HERE).as_posix(): sha(p.read_bytes())
                 for p in sorted((HERE / "src").rglob("*.lean"))}
    manifest = {
        "schema": 1, "candidate_theta": "87477137/100000000",
        "lean_toolchain": "leanprover/lean4:v4.34.1",
        "inherited_archive_sha256": ARCHIVE_SHA, "graph_file_sha256": GRAPH_SHA,
        "graph_canonical_sha256": sha(json.dumps(graph, sort_keys=True, separators=(",", ":")).encode()),
        "source_stages": len(graph), "generated_files": generated,
        "inherited_interfaces": interfaces,
        "source_target": NS + ".GlobalSources",
        "source_theorem": NS + ".selected_global_sources",
        "independent_statement_module": NS + ".Targets",
        "required_endpoint_module": NS + ".Endpoint",
        "required_endpoint_theorem": NS + ".Endpoint.dirichlet_nonvanishing",
        "status": "generated_uncompiled_incomplete",
        "endpoint_bridge_present": False,
        "lean_verified": False,
    }
    (HERE / "generated-manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"Generated {len(generated)} source files for {len(graph)} stages; NOT Lean-verified.")


if __name__ == "__main__":
    main()
