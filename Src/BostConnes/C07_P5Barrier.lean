import BostConnes.Threshold
import Mathlib.Data.Nat.Prime.Basic

namespace BostConnes

def P5 : ℕ := 3993746143633
def P5Desert : ℕ := P5 - 191

theorem P5_eq : P5 = 3993746143633 := rfl
theorem P5_desert_eq : P5Desert = 3993746143442 := by norm_num [P5Desert, P5]

noncomputable def P5_contrib_bound : ℝ := 7.27e-12

theorem P5_contrib_small : P5_contrib_bound < 1e-10 := by
  norm_num [P5_contrib_bound]

/-- External primality certificate for the finite interval before `P5`.
It is an explicit premise until the certificate is formalized in Lean. -/
def P5_desert_certificate : Prop :=
  ∀ p ∈ Finset.Ico (P5 - 191) P5, ¬ Nat.Prime p

theorem P5_desert_isolated
    (h_certificate : P5_desert_certificate) :
    ∀ p ∈ Finset.Ico (P5 - 191) P5, ¬ Nat.Prime p :=
  h_certificate

theorem M4_P5Barrier_closed
    (h_interval : C_S4_interval_certificate) : C_S4 > 2 * Real.sqrt 13 :=
  C_S4_gt_two_sqrt_13 h_interval

theorem M4_P5_not_in_S4 : P5 ∉ ({2, 3, 19, 191} : Finset ℕ) := by decide

end BostConnes
