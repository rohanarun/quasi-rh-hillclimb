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

theorem gaussProjectionMargins :
    (1 : Rat) + 103 / 1000 < 138 / 125 ∧
    (3 / 2 : Rat) * (103 / 1000) < 1 / 2 ∧
    (189 / 250 : Rat) + 1 / 13000 < 1 := by
  decide +kernel

theorem dualSieveMargins :
    (1 : Rat) + (618 / 1000) / 6 < 138 / 125 ∧
    (1 + (748 / 1000) : Rat) / 2 < 138 / 125 ∧
    (2 / 3 : Rat) + (748 / 1000) / 2 < 138 / 125 ∧
    (11 / 12 : Rat) + (748 / 1000) / 4 < 138 / 125 ∧
    (1 : Rat) + (870 / 1000) / 3 - (28 / 25) / 6 < 138 / 125 ∧
    (1 : Rat) + (1258 / 1000) / 3 - (1129 / 1000) / 6 > 138 / 125 := by
  decide +kernel

theorem cubicReflectionSectorMargins :
    (22503 / 20000 : Rat) - 1 / 4000 - 1 / 3500 - 1 / 1000000 > 281 / 250 ∧
    (189 / 500 : Rat) + 1 / 26000 < 379 / 1000 ∧
    (2 / 3 : Rat) - (103 / 1000) / 2 - (281 / 250) / 3 +
      (3 / 2) * (379 / 1000) + (1 / 1000000) / 2 + 293 / 1000 < 138 / 125 ∧
    (5 / 6 : Rat) * (13 / 40) + (13 / 6) * (1 / 100) < 293 / 1000 ∧
    (13 / 6 : Rat) * (135 / 1000) < 293 / 1000 := by
  decide +kernel

theorem lowerOrderDualMargins :
    (1134 / 1000 : Rat) + 1 / 13000 + 1 / 26000 < 1135 / 1000 ∧
    (1 : Rat) + 103 / 1000 < 138 / 125 ∧
    (1 / 2 : Rat) + 103 / 1000 < 138 / 125 ∧
    (2 / 3 : Rat) + 103 / 1000 < 138 / 125 ∧
    (2 / 3 : Rat) + (1135 / 1000) / 3 + 58 / 1000 < 138 / 125 ∧
    (2 / 3 : Rat) * (87 / 1000) = 58 / 1000 ∧
    (1 : Rat) - 1129 / 1000 + (2 / 3) * (629 / 1000 + 1129 / 1000) <
      1044 / 1000 := by
  decide +kernel

theorem centeredDualShellMargin :
    (1 : Rat) + 1135 / 1000 - 2 * (516 / 1000) < 138 / 125 := by
  decide +kernel

theorem powerfulDetectorMargins :
    (435 / 1000 : Rat) * (2 / 3500 + 1 / 8) + 1 / 64000 < 547 / 10000 ∧
    (189 / 500 : Rat) + 1 / 26000 < 379 / 1000 ∧
    (547 / 10000 : Rat) < 55 / 1000 ∧
    2 * deltaLo * pLo * (2 / 9) * 3 < 1 ∧
    (547 / 10000 : Rat) <
      45 / 1000 + 2 * deltaLo * pLo * (2 / 9) * (242 / 1000 - 3 * (45 / 1000)) ∧
    (547 / 10000 : Rat) <
      40 / 1000 + 2 * deltaLo * pLo * (2 / 9) * (242 / 1000 - 2 * (40 / 1000)) := by
  decide +kernel

theorem amplitudeDispersionMargins :
    (2138 / 10000 : Rat) < (11 / 3 - 4 * (43669 / 50000)) / 0.8096863501 ∧
    (11 / 3 - 4 * (43669 / 50000) : Rat) / 0.80963635 < 214 / 1000 ∧
    (1219 / 10000 : Rat) < (1 - (756 / 1000 + 1 / 13000)) / 2 ∧
    (1 - (3 / 4 - 1 / 4000) : Rat) / 2 < 1254 / 10000 ∧
    (1219 / 10000 : Rat) <
      (1 - 1 / 10000000000 - 2 * (378 / 1000 + 1 / 26000)) / (2 + 1 / 1000000000) ∧
    (1 - 2 * (3 / 8 - 1 / 3500) : Rat) / 2 < 1254 / 10000 ∧
    (413 / 1000 : Rat) < (1219 / 10000) / (214 / 1000) ∧
    (413 / 1000 : Rat) < 1 - (1254 / 10000) / (2138 / 10000) ∧
    (2 : Rat) - 4 * pLo / (2 + 1 / 1000000000) < 1003 / 1000 ∧
    deltaHi * (1 - pLo) * (1003 / 1000) / (1 - pLo + 1003 / 1000) < 147 / 1000 ∧
    eta + (147 / 1000) * (1 / 5850 + eta / minSlope) <
      2 * deltaLo * (413 / 1000) * (137 / 1000000) := by
  decide +kernel

theorem centeredCoprimeObstructionMargins :
    let h : Rat := 1240 / 1000
    let y : Rat := 1129 / 1000
    let v : Rat := 1 / 1000
    let t := 5 * h / 6 + y / 3
    h < t - v ∧ y < t - v ∧ h / 3 + 5 * y / 6 < t - v ∧
    1 + h - 2 * (y - 2 * v) = -(14 / 1000) ∧
    1 - y + t = 1921 / 1500 ∧ (138 / 125 : Rat) < 1921 / 1500 ∧
    1 - y + (8765 / 10000) / 3 + 5 * y / 6 = 138 / 125 ∧
    2 * y - 1 = 1258 / 1000 := by
  decide +kernel

theorem columnGaussProjectionMargins :
    let b : Rat := 749 / 1000
    let c : Rat := 374 / 1000
    let d : Rat := 197 / 1000
    (3 / 2) * d < (b + c) / 2 ∧
    1 - b / 4 < 138 / 125 ∧
    1 - b / 4 - (11 / 10) * c + (71 / 20) * d < 138 / 125 ∧
    1 - b / 4 - (b + c) + (7 / 2) * d < 138 / 125 ∧
    d < 1 := by
  decide +kernel

theorem fullColumnProjectionMargins :
    let theta : Rat := 8749 / 10000
    let bLo : Rat := 749 / 1000
    let bHi : Rat := 757 / 1000
    let cLo : Rat := 374 / 1000
    let d : Rat := 197 / 1000
    (-(11 / 10) * cLo + (31 / 20) * d < 0) ∧
    -(bLo + cLo) + (3 / 2) * d < 0 ∧
    1 / 6 + (2 * theta - 1) * bHi - cLo / 10 + (31 / 20) * d < 138 / 125 ∧
    1 / 6 - 2 * (1 - theta) * bLo + (3 / 2) * d < 138 / 125 ∧
    1 + 11 / 20 - 1 / 6 = (83 / 60 : Rat) ∧
    1 / 6 + (2 * theta - 1) * bHi - cLo / 10 + (83 / 60) * (293 / 1000) < 138 / 125 ∧
    (1 / 10000000000 : Rat) + (1 / 1000000000) / 2 < 1 / 100000000 ∧
    (1 / 100000000 : Rat) + 1 / 4000 + 2 / 26000 + 1 / 1000000 < 33 / 100000 ∧
    (1.104 : Rat) < (1 + 5 * (22503 / 20000 : Rat)) / 6 - eta -
      deltaHi * (1 / 4000 + 1 / 3500 + 1 / 1000000) ∧
    1 / 20000 < 2 * (7 / 8 - theta) * bLo - (33 / 100000) / 12 -
      (5 / 6 - deltaLo) * (1 / 13000 + 1 / 26000) - eta := by
  decide +kernel

theorem conductorOrdinaryMargins :
    let theta : Rat := 8749 / 10000
    let bLo : Rat := 749 / 1000
    let bHi : Rat := 757 / 1000
    let cLo : Rat := 374 / 1000
    let d : Rat := 207 / 1000
    let base := 1 / 6 + (2 * theta - 1) * bHi - (1 - theta) * cLo
    1 - theta < theta / 2 ∧
    base + (5 / 6 + theta / 2) * (327 / 1000) < 138 / 125 ∧
    base + (1 + theta / 2) * (4 / 10) - (96 / 100) / 6 < 138 / 125 ∧
    (3 / 2) * d < (bLo + cLo) / 2 ∧
    (1 + theta / 2) * d < (2 - theta) * cLo ∧
    1 - 2 * (1 - theta) * bLo - (2 - theta) * cLo + (3 + theta / 2) * d < 138 / 125 ∧
    1 - 2 * (1 - theta) * bLo - (bLo + cLo) + (7 / 2) * d < 138 / 125 ∧
    base + (1 + theta / 2) * d < 138 / 125 ∧
    1 / 6 - 2 * (1 - theta) * bLo + (3 / 2) * d < 138 / 125 := by
  decide +kernel

theorem coreInverseAverageMargins :
    let theta : Rat := 8749 / 10000
    let bHi : Rat := 757 / 1000
    let cHi : Rat := 379 / 1000
    (1 - theta) / 2 < 5 / 12 ∧
    (theta - 1 / 2) + (1 - theta) / 2 = theta / 2 ∧
    1 / 6 + (5 / 6) * bHi + (2 * theta - 1) * cHi < 138 / 125 ∧
    1 / 6 + (5 / 6) * (783 / 1000) + (2 * theta - 1) * cHi < 138 / 125 ∧
    1 / 6 + (5 / 6) * (9 / 10) + (theta - 1 / 2) * (42 / 100) < 138 / 125 := by
  decide +kernel

theorem lowerOrderPrimalMargins :
    let theta : Rat := 8749 / 10000
    let lam := theta - 1 / 2
    let b : Rat := 757 / 1000
    let g : Rat := 374 / 1000
    let c : Rat := 106 / 1000
    let q : Rat := 188 / 1000
    (1 - theta) / 2 < 1 / 3 ∧
    1 / 6 < theta / 4 ∧
    1 / 6 < (1 + lam) / 3 ∧
    (1 + lam) * (1 + c) / 2 < 138 / 125 ∧
    b - (1 - theta) * g + theta / 4 + (1 + theta / 4) * c < 138 / 125 ∧
    (2 / 3) * b - (1 - theta) * g + 1 / 3 + theta / 4 +
      (2 / 3 + theta / 4) * c < 138 / 125 ∧
    (1 + lam) * (1 + 2 * q) / 3 < 138 / 125 ∧
    1 / 6 + b - (1 - theta) * g + (theta - 1) * (783 / 1000) / 6 +
      (1 + theta / 3) * q < 138 / 125 := by
  decide +kernel

theorem multiGaussProfileMargins :
    let theta : Rat := 8749 / 10000
    let b : Rat := 749 / 1000
    let bHi : Rat := 757 / 1000
    let c : Rat := 374 / 1000
    let d : Rat := 207 / 1000
    let loss : Rat := 1 / 100000
    (3 / 2) * d + loss < (b + c) / 2 ∧
    1 - 2 * (1 - theta) * b - (2 - theta) * c +
      (3 + theta / 2) * d + loss < 138 / 125 ∧
    1 - 2 * (1 - theta) * b - (b + c) + (7 / 2) * d + loss < 138 / 125 ∧
    1 / 6 + (2 * theta - 1) * bHi - (1 - theta) * c +
      (1 + theta / 2) * d + loss < 138 / 125 ∧
    loss < 1 / 20000 := by
  decide +kernel

theorem growingDivisorProjectionMargins :
    let theta : Rat := 8749 / 10000
    let b : Rat := 749 / 1000
    let bHi : Rat := 757 / 1000
    let c : Rat := 374 / 1000
    let d : Rat := 199 / 1000
    let l : Rat := 1 / 100000
    let modeLoss : Rat := 1 / 100000
    2 * d + 2 * l + modeLoss < (b + c) / 2 ∧
    (2 - theta / 2) * d < (2 - theta) * c ∧
    8 * l + (3 / 2) * d < b + c ∧
    1 - 2 * (1 - theta) * b - (2 - theta) * c +
      (4 - theta / 2) * d + 8 * l + modeLoss < 138 / 125 ∧
    1 - 2 * (1 - theta) * b - (b + c) +
      (7 / 2) * d + 8 * l + modeLoss < 138 / 125 ∧
    1 / 6 + (2 * theta - 1) * bHi - (1 - theta) * c +
      (2 - theta / 2) * d + 8 * l + modeLoss < 138 / 125 ∧
    1 / 6 - 2 * (1 - theta) * b + (3 / 2) * d +
      8 * l + modeLoss < 138 / 125 ∧
    1 - 2 * (1 - theta) * b + 4 * l + modeLoss < 138 / 125 ∧
    4 * l + modeLoss = 1 / 20000 := by
  decide +kernel

theorem projectedGaussObstructionMargins :
    let h : Rat := 1240 / 1000
    let y : Rat := 1129 / 1000
    let p : Rat := 41 / 1000
    let d : Rat := 199 / 1000
    let l : Rat := 1 / 100000
    let t := 5 * h / 6 + y / 3
    5 * p > d ∧
    h + (2 * y - h) / 12 < t - p / 6 ∧
    p + y < t - p / 6 ∧
    h / 6 + y < t ∧ h / 3 + 5 * y / 6 < t ∧
    (4 / 5 : Rat) < y - p / 2 - 3 * d / 2 - 2 * l - 1 / 100000 ∧
    (2 * y - 1 - h) / 2 = 9 / 1000 ∧
    p / 6 < 9 / 1000 ∧
    1 - y + t - p / 6 = 7643 / 6000 ∧
    (138 / 125 : Rat) < 7643 / 6000 := by
  decide +kernel

theorem phaseProjectionMargins :
    let d : Rat := 184 / 1000
    let h : Rat := 1188 / 1000
    let y : Rat := 1129 / 1000
    let p : Rat := 200 / 1000
    let t := 5 * h / 6 + y / 3
    (3 / 2) * d < (749 / 1000 + 374 / 1000) / 2 ∧
    1 / 6 + (3 / 2) * (379 / 1000) + 1 / 2000000 + 2 * d +
      1 / 100000 < 138 / 125 ∧
    (199 / 1000 : Rat) < p ∧
    h + (2 * y - h) / 12 < t - p / 6 ∧
    p + y < t - p / 6 ∧
    h / 6 + y < t ∧ h / 3 + 5 * y / 6 < t ∧
    (7 / 10 : Rat) < y - p / 2 - (3 / 2) * (199 / 1000) - 3 / 100000 ∧
    p / 6 < (2 * y - 1 - h) / 2 ∧
    1 - y + t - p / 6 = 301 / 250 ∧
    (138 / 125 : Rat) < 301 / 250 := by
  decide +kernel

theorem jointGaussProjectionMargins :
    let xLo : Rat := 1123 / 1000
    let xHi : Rat := 1135 / 1000
    let d : Rat := 136 / 1000
    let w : Rat := 1 / 1000000
    let theta : Rat := 8749 / 10000
    xLo / 2 - (7 / 4) * (2 * d) - w > 1 / 100 + 1 / 10000 ∧
    xLo / 3 - (4 / 3) * (2 * d) - (2 / 3) * w > 1 / 100 + 1 / 10000 ∧
    (1 : Rat) / 6 + (3 / 2) * (379 / 1000) + w / 2 + 2 * d < 138 / 125 ∧
    1 / 6 + xHi - 2 / 100 - 2 * (1 - theta) * (749 / 1000) < 138 / 125 ∧
    (1 + theta / 2) * d < (2 - theta) * (374 / 1000) := by
  decide +kernel

#print axioms jointGaussProjectionMargins
#print axioms phaseProjectionMargins
#print axioms projectedGaussObstructionMargins
#print axioms growingDivisorProjectionMargins
#print axioms multiGaussProfileMargins
#print axioms lowerOrderPrimalMargins
#print axioms coreInverseAverageMargins
#print axioms conductorOrdinaryMargins
#print axioms fullColumnProjectionMargins
#print axioms columnGaussProjectionMargins
#print axioms centeredCoprimeObstructionMargins
#print axioms amplitudeDispersionMargins
#print axioms powerfulDetectorMargins
#print axioms centeredDualShellMargin
#print axioms lowerOrderDualMargins
#print axioms cubicReflectionSectorMargins
#print axioms dualSieveMargins
#print axioms gaussProjectionMargins
#print axioms signedRangeMargins
#print axioms squarefreeReturnMargins
#print axioms contactRadicalBracket
#print axioms asymmetricCutMargins
#print axioms asymmetricCutMarginsWithBuffer

end ContactFactorization
