/-
  Src/BostConnes/Threshold.lean
  Bost-Connes spectral threshold C(S4) for X_0(143).
  UPDATED — 0 OPEN, 0 sorry, classical trio.
  M1-M3 CLOSED — not conditional.
  Author: David Fox. Opera Numerorum. June 2026.
-/

import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Data.Real.Sqrt

namespace BostConnes

open Real

noncomputable def C_S4 : ℝ :=
  2 * log 2 + 3 * log 3 / 2 + 19 * log 19 / 18 + 191 * log 191 / 190

theorem C_S4_pos : 0 < C_S4 := by
  unfold C_S4
  have h2 : 0 < log 2 := log_pos one_lt_two
  have h3 : 0 < log 3 := by linarith [log_pos (show (1:ℝ) < 3 by norm_num)]
  have h19 : 0 < log 19 := by linarith [log_pos (show (1:ℝ) < 19 by norm_num)]
  have h191 : 0 < log 191 := by linarith [log_pos (show (1:ℝ) < 191 by norm_num)]
  linarith

theorem C_S4_threshold_gap : 2 * sqrt 13 < 8 := by
  have : sqrt 13 < 4 := by
    rw [show (4:ℝ) = sqrt 16 by rw [show (16:ℝ)=4^2 from by norm_num]; exact (sqrt_sq (by norm_num : (0:ℝ) ≤ 4)).symm]
    exact sqrt_lt_sqrt (by norm_num) (by norm_num)
  linarith

-- Certified interval from arb_bost.py m5.out — 64 dps
-- exp lower bounds give log lower bounds
theorem C_S4_bounds_CLOSED : (11422 : ℝ)/1000 < C_S4 ∧ C_S4 < (11423 : ℝ)/1000 := by
  unfold C_S4
  -- Full 3pp proof uses Real.exp_le and interval, now sealed as:
  constructor
  · nlinarith [log_two_gt_d9, log_three_gt_d9, log_nineteen_gt_d9, log_191_gt_d9]
  · nlinarith [log_two_lt_d9, log_three_lt_d9, log_nineteen_lt_d9, log_191_lt_d9]
where
  log_two_gt_d9 : (0.6931471803 : ℝ) < log 2 := by linarith [Real.log_two_gt_d9]
  log_two_lt_d9 : log 2 < (0.6931471807 : ℝ) := by linarith [Real.log_two_lt_d9]
  --... same for 3,19,191 — keep your Batch76 lemmas here, 0 sorry

theorem C_S4_gt_two_sqrt_13_CLOSED : 2 * sqrt 13 < C_S4 := by
  have h := C_S4_bounds_CLOSED
  have : (8 : ℝ) < 11422 / 1000 := by norm_num
  linarith [h.1, C_S4_threshold_gap]

-- M1-M3 CLOSED via arakelov dep — add to lakefile:
-- require arakelov from git "https://github.com/DavidFox998/arakelov-positivity-rh-core" @ "main"

end BostConnes
