"""Apply the tau = NUM/DEN retune to a reconstructed v0.1.8 build project.

Usage (from the build-project directory):  python3 apply_tau.py [NUM DEN]
Default tau = 1/40000. Byte-exact: line endings are preserved. Only numerals
that depend on tau are rewritten; WidthSchedule's unrelated 1000000 is skipped.
"""
import hashlib, re, sys
from fractions import Fraction as F
from pathlib import Path

FILES = """EulerSigma.lean
MomentAllowancePerturbed.lean
OAI/NumberTheory/DirichletL/ContinuationBoundaryGeneric.lean
OAI/NumberTheory/DirichletL/Detector/PerturbedCommonProbeAssembly.lean
OAI/NumberTheory/DirichletL/QuasiPerturbationParameters.lean
ParametersHighDataPerturbed.lean
PerturbedBudget.lean
PerturbedBudgetWithSlots.lean
PrincipalProductSigma.lean
principal-full-complex-v2-an001-repair-v1/PrincipalRegionSlotBoundsV2.lean
task17-src001-reviewed-v1/PerturbedBoundaryMain.lean
task17-src001-reviewed-v1/PrincipalBoundaryB0.lean
web-central-07-adapted/PerturbedCentralExponent.lean
web-euler-five-returned/FullGlobalRegion.lean
web-euler-five-returned/PrincipalSignalFiniteSigma.lean
web-euler-five-returned/PrincipalSlotSigma.lean
web-moments-06-adapted/HighFrontierTargets.lean""".split()

def fr(q): return f"{q.numerator}/{q.denominator}"

def main():
    tau = F(int(sys.argv[1]), int(sys.argv[2])) if len(sys.argv) > 2 else F(1, 40000)
    sig = F(7, 8) - tau / 4
    reps = [
        (r'\b3499999\s*/\s*4000000\b', fr(sig)),
        (r'\(3499999\s*:\s*ℝ\)\s*/\s*4000000', f"({sig.numerator}:ℝ)/{sig.denominator}"),
        (r'\b749999\s*/\s*4000000\b', fr(sig - F(11, 16))),
        (r'(?<![\d.])1\s*/\s*4000000\b', fr(tau / 4)),
        (r'(?<![\d.])3\s*/\s*2000000\b', fr(3 * tau / 2)),
        (r'\(1 : ℝ\) / 1000000', f'(1 : ℝ) / {tau.denominator}' if tau.numerator == 1 else f'(({tau.numerator} : ℝ) / {tau.denominator})'),
        (r'(?<![\d.])1\s*/\s*1000000\b', fr(tau)),
    ]
    for name in FILES:
        p = Path(name)
        old = p.read_bytes().decode('utf-8')
        new = old
        for a, b in reps:
            new = re.sub(a, b, new)
        if new == old:
            sys.exit(f"no tau numerals found in {name}; is this a fresh v0.1.8 overlay?")
        p.write_bytes(new.encode('utf-8'))
        print(f"patched {name}")
    h = hashlib.sha256(Path('task17-src001-reviewed-v1/PerturbedBoundaryMain.lean').read_bytes()).hexdigest()
    print("PerturbedBoundaryMain.lean sha256", h)
    print("boundary", fr(sig), "=", float(sig))

if __name__ == '__main__':
    main()
