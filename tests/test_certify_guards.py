"""Regression checks for root certify.py exit status and python -O interval guards."""
from pathlib import Path
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
DEPTH3 = ROOT / "depth3"


def _run_py(args, optimize=False, cwd=ROOT):
    cmd = [sys.executable]
    if optimize:
        cmd.extend(["-O", "-B"])
    else:
        cmd.append("-B")
    cmd.extend(args)
    return subprocess.run(cmd, cwd=str(cwd), capture_output=True, text=True, check=False)


class CertifyExitStatusAndIntervalGuardTests(unittest.TestCase):
    def test_default_audited_point_passes_under_normal_and_optimized(self):
        for opt in (False, True):
            res = _run_py([str(ROOT / "certify.py")], optimize=opt)
            self.assertEqual(res.returncode, 0, msg=res.stderr or res.stdout)
            self.assertIn("J>0 on box: True", res.stdout)
            self.assertIn("adaptive endpoint F>0 on delta in [0,5/6], y in [0,1/2]: True", res.stdout)
            self.assertNotIn("FAIL", res.stdout)
            self.assertIn("paper point (1/6, 13/16) certifies: True", res.stdout)

    def test_false_adaptive_endpoint_exits_nonzero(self):
        # Exact failure input documented in verification/lean-audit-2026-10/README.md (#1).
        for opt in (False, True):
            res = _run_py(
                [str(ROOT / "certify.py"), "3000", "405967/500000", "--maxdepth", "10"],
                optimize=opt,
            )
            self.assertEqual(res.returncode, 1, msg=res.stdout)
            self.assertIn(
                "adaptive endpoint F>0 on delta in [0,5/6], y in [0,1/2]: False",
                res.stdout,
            )

    def test_failed_side_constraint_exits_nonzero(self):
        for opt in (False, True):
            res = _run_py(
                [str(ROOT / "certify.py"), "5900", "1/2", "--maxdepth", "6"],
                optimize=opt,
            )
            self.assertEqual(res.returncode, 1, msg=res.stdout)
            self.assertIn("FAIL", res.stdout)

    def test_depth3_interval_and_crossing_guards_hold_under_python_optimize(self):
        probe = (
            "import sys; sys.path.insert(0, 'depth3'); "
            "from interval import I, isqrt; "
            "checks = ["
            "lambda: I(2, 1), "
            "lambda: I(2) ** 3, "
            "lambda: isqrt(I(-4, -1))"
            "]; "
            "ok = True\n"
            "for fn in checks:\n"
            "    try:\n"
            "        fn()\n"
            "        ok = False\n"
            "    except ValueError:\n"
            "        pass\n"
            "if not ok:\n"
            "    raise SystemExit(1)\n"
        )
        res = _run_py(["-c", probe], optimize=True)
        self.assertEqual(res.returncode, 0, msg=res.stderr or res.stdout)

    def test_depth3_certifiers_pass_under_python_optimize(self):
        res3 = _run_py([str(DEPTH3 / "certify_depth3.py")], optimize=True, cwd=DEPTH3)
        self.assertEqual(res3.returncode, 0, msg=res3.stderr or res3.stdout)
        res_gao = _run_py([str(DEPTH3 / "certify_gao_depth.py")], optimize=True, cwd=DEPTH3)
        self.assertEqual(res_gao.returncode, 0, msg=res_gao.stderr or res_gao.stdout)


if __name__ == "__main__":
    unittest.main()
