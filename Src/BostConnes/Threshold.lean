/-
  Src/BostConnes/Threshold.lean
  Bost-Connes spectral threshold C(S4) for X_0(143).

  The elementary positivity and square-root bounds below are proved in Lean.
  The decimal logarithm enclosure is retained as an explicit external
  certificate until its interval-arithmetic derivation is formalized.
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
  have h3 : 0 < log 3 := by linarith [log_pos (show (1 : ℝ) < 3 by norm_num)]
  have h19 : 0 < log 19 := by linarith [log_pos (show (1 : ℝ) < 19 by norm_num)]
  have h191 : 0 < log 191 := by linarith [log_pos (show (1 : ℝ) < 191 by norm_num)]
  linarith

theorem C_S4_threshold_gap : 2 * sqrt 13 < 8 := by
  have h : sqrt 13 < 4 := by
    rw [show (4 : ℝ) = sqrt 16 by
      rw [show (16 : ℝ) = 4 ^ 2 from by norm_num]
      exact (sqrt_sq (by norm_num : (0 : ℝ) ≤ 4)).symm]
    exact sqrt_lt_sqrt (by norm_num) (by norm_num)
  linarith

/-- The numerical logarithm enclosure supplied by an external interval
certificate.  It is an explicit premise, not an axiom or an asserted Lean proof. -/
def C_S4_interval_certificate : Prop :=
  (11422 : ℝ) / 1000 < C_S4 ∧ C_S4 < (11423 : ℝ) / 1000

/-- A certified interval for `C_S4` implies the spectral threshold bound. -/
theorem C_S4_gt_two_sqrt_13
    (h_interval : C_S4_interval_certificate) : 2 * sqrt 13 < C_S4 := by
  have h_lower : (11422 : ℝ) / 1000 < C_S4 := h_interval.1
  linarith [C_S4_threshold_gap]

end BostConnes
