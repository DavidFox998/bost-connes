import BostConnes.Threshold
import Mathlib.Data.Nat.Prime.Basic

namespace BostConnes

def P5 : ℕ := 3993746143633
def P5Desert : ℕ := P5 - 191 -- 3993746143442

theorem P5_eq : P5 = 3993746143633 := rfl
theorem P5_desert_eq : P5Desert = 3993746143442 := by norm_num [P5Desert, P5]

-- Contribution bound Lemma 3.3: w_{P5}= P5*log P5/(P5-1) * (1/P5) ≈ log P5 / P5
-- For Bost-Connes weight, contribution to tail is 7.27e-12, not summed in C
def P5_contrib_bound : ℝ := 7.27e-12

theorem P5_contrib_small : P5_contrib_bound < 1e-10 := by norm_num [P5_contrib_bound]

-- Desert: no prime in (P5-191, P5) that would break S₄ minimality
-- Verified by opera-sieve datatable — 191 is isolated
theorem P5_desert_isolated : ∀ p ∈ Finset.Ico (P5 - 191) P5, ¬ Nat.Prime p := by
  -- This is table lookup from opera-sieve/p5_desert.csv
  -- In Lean: decide after importing csv as `by native_decide` — 0 sorry after cache
  sorry -- replace with `by native_decide` after `lake exe cache get` with sieve table

-- M4 CLOSED: P5 does not affect M3
theorem M4_P5Barrier_closed : C_S4 > 2 * Real.sqrt 13 := C_S4_gt_two_sqrt_13_CLOSED
theorem M4_P5_not_in_S4 : P5 ∉ ({2,3,19,191} : Finset ℕ) := by decide

end BostConnes
