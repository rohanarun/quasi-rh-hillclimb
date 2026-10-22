import BudgetLemmas

/-! Axiom audit and concrete boundary checks for the structural budget lemmas. -/

open QuasiRhBudget

-- The extension witness satisfies the new supply condition but fails h < 5 ell.
example : supplySlack (31 / 200) (4 / 5) = 27 / 200 := by norm_num [supplySlack]
example : 5 * (31 / 200 : ℝ) - 4 / 5 = -1 / 40 := by norm_num
example : extensionRadius (31 / 200) (4 / 5) (161 / 28800) = 161 / 57600 := by
  norm_num [extensionRadius, supplySlack]
example : meshThreshold (31 / 200) (4 / 5) (1 / 1000) (1 / 1000) = 27 / 29600 := by
  norm_num [meshThreshold, supplyGap, supplySlack]

example : slotCount (31 / 200) (27 / 29600) = 340 := by
  have hf : ⌊(31 / 200 : ℝ) / (27 / 29600)⌋₊ = 169 :=
    (Nat.floor_eq_iff (by norm_num)).2 (by norm_num)
  unfold slotCount
  rw [hf]

-- When ell/threshold is exactly 1000, K = 2000 would give equality.
example : slotCount (31 / 200) (31 / 200000) = 2002 := by norm_num [slotCount]
example : 2 * (31 / 200 : ℝ) / 2000 = 31 / 200000 := by norm_num

-- A zero supply slack cannot admit any positive frequency extension.
example (zeta : ℝ) (hzeta : 0 < zeta) :
    (28 / 185) / (4 / 5 + zeta) < 7 / 37 := by
  apply no_extension_at_supply_boundary (by norm_num) hzeta
  norm_num [supplySlack]

/-- info: 'QuasiRhBudget.old_low_threshold' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.old_low_threshold
/-- info: 'QuasiRhBudget.high_exponent_affine' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.high_exponent_affine
/-- info: 'QuasiRhBudget.floor_specialization' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.floor_specialization
/-- info: 'QuasiRhBudget.floor_old_specialization' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.floor_old_specialization
/-- info: 'QuasiRhBudget.floor_ideal_specialization' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.floor_ideal_specialization
/-- info: 'QuasiRhBudget.floor_old_identity' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.floor_old_identity
/-- info: 'QuasiRhBudget.old_floor_obstruction' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.old_floor_obstruction
/-- info: 'QuasiRhBudget.floor_ideal_identity' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.floor_ideal_identity
/-- info: 'QuasiRhBudget.ideal_floor_obstruction' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.ideal_floor_obstruction
/-- info: 'QuasiRhBudget.floor_supply_identity' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.floor_supply_identity
/-- info: 'QuasiRhBudget.supply_floor_obstruction' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.supply_floor_obstruction
/-- info: 'QuasiRhBudget.target_floor_saving' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.target_floor_saving
/-- info: 'QuasiRhBudget.row_factor_bounds' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.row_factor_bounds
/-- info: 'QuasiRhBudget.row_denominator_lower' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.row_denominator_lower
/-- info: 'QuasiRhBudget.balanced_count_closed_form' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.balanced_count_closed_form
/-- info: 'QuasiRhBudget.balanced_count_bounds' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.balanced_count_bounds
/-- info: 'QuasiRhBudget.balanced_slope_bounds' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.balanced_slope_bounds
/-- info: 'QuasiRhBudget.extension_radius_pos' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.extension_radius_pos
/-- info: 'QuasiRhBudget.extension_below_one' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.extension_below_one
/-- info: 'QuasiRhBudget.extension_supply' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.extension_supply
/-- info: 'QuasiRhBudget.no_extension_at_supply_boundary' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.no_extension_at_supply_boundary
/-- info: 'QuasiRhBudget.supply_extension_iff' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.supply_extension_iff
/-- info: 'QuasiRhBudget.affine_margin_extension' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.affine_margin_extension
/-- info: 'QuasiRhBudget.constructive_extension' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.constructive_extension
/-- info: 'QuasiRhBudget.slot_count_pos' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.slot_count_pos
/-- info: 'QuasiRhBudget.slot_count_even' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.slot_count_even
/-- info: 'QuasiRhBudget.slot_width_lt' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.slot_width_lt
/-- info: 'QuasiRhBudget.normalized_slot_width_lt' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.normalized_slot_width_lt
/-- info: 'QuasiRhBudget.scaled_slot_width_lt' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.scaled_slot_width_lt
/-- info: 'QuasiRhBudget.mesh_threshold_pos' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.mesh_threshold_pos
/-- info: 'QuasiRhBudget.even_mesh' depends on axioms: [propext, Classical.choice, Quot.sound] -/
#guard_msgs in
#print axioms QuasiRhBudget.even_mesh
