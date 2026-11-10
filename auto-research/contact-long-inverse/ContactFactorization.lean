import Std

namespace ContactFactorization

def deltaLo : Rat := 417 / 1000
def deltaHi : Rat := 435 / 1000
def pLo : Rat := 499 / 1000
def eta : Rat := 1 / 64000
def step : Rat := 1 / 8750
def cut : Rat := 1 / 5900
def gain : Rat := 1 / 14000

def minSlope : Rat := 5 / 6 - deltaHi
def minInverseSlope : Rat := deltaLo / 2
def maxInverseSlope : Rat := deltaHi * (1 - pLo)
def minPlainSlope : Rat := deltaLo

theorem contactRadicalBracket :
    (32 : Rat)^2 < 1081 ∧ (1081 : Rat) < (33 : Rat)^2 ∧
    (5 / 12 : Rat) < (61 - 33) / 66 ∧ (61 - 32 : Rat) / 66 < 1 / 2 := by
  decide +kernel

theorem asymmetricCutMargins :
    eta < minSlope * (cut - step) ∧
    cut < 1 / 5850 ∧
    cut + eta / minSlope + eta / minPlainSlope < 1 / 4000 ∧
    cut + eta / minSlope + eta / minInverseSlope < 1 / 3500 ∧
    eta / minInverseSlope < 1 / 13000 ∧
    eta / minPlainSlope < 1 / 26000 ∧
    eta + maxInverseSlope / 4000 < gain := by
  decide +kernel

theorem asymmetricCutMarginsWithBuffer :
    eta + (1 / 10000000 : Rat) < minSlope * (cut - step - 1 / 10000000) ∧
    cut + 1 / 10000000 < 1 / 5850 ∧
    cut + eta / minSlope + eta / minPlainSlope + 1 / 10000000 < 1 / 4000 ∧
    cut + eta / minSlope + eta / minInverseSlope + 1 / 10000000 < 1 / 3500 ∧
    eta + maxInverseSlope / 4000 + 1 / 10000000 < gain := by
  decide +kernel

theorem squarefreeReturnMargins :
    (1.104 : Rat) <
      (1 + 5 * (22503 / 20000 : Rat)) / 6 - eta -
        deltaHi * (1 / 4000 + 1 / 3500) ∧
    (749 / 1000 : Rat) < 2 * (3 / 8 - 1 / 3500) ∧
    (1 : Rat) - (251 / 500 : Rat) / 2 = 749 / 1000 := by
  decide +kernel

theorem signedRangeMargins :
    eta < deltaLo / 20000 ∧
    (1134 / 1000 : Rat) + 1 / 13000 + 1 / 26000 - 13 / 40 < 81 / 100 ∧
    (5 / 6 : Rat) + (81 / 100) / 3 < 138 / 125 ∧
    (1 / 3 : Rat) + 5 * (81 / 100) / 6 < 138 / 125 ∧
    (1 / 6 : Rat) + 81 / 100 < 138 / 125 ∧
    (1 : Rat) + 103 / 1000 < 138 / 125 := by
  decide +kernel

#print axioms signedRangeMargins
#print axioms squarefreeReturnMargins
#print axioms contactRadicalBracket
#print axioms asymmetricCutMargins
#print axioms asymmetricCutMarginsWithBuffer

end ContactFactorization
