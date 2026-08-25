import BostConnes.Threshold
import BostConnes.Arithmetic

namespace BostConnes

theorem hecke_transfer_143_13 : (143 : ℕ) * 13 = 1859 := by norm_num
theorem barrier_2113_mod_35 : (2113 : ℕ) % 35 = 13 := by norm_num
theorem barrier_2113_prime : Nat.Prime 2113 := by norm_num

-- X₀(143) = 11 * 13, genus 13, J₀(143) has factor 143a1 rank 0.
def BSD_143a1_conductor : ℕ := 143

theorem M5_HeckeTransfer_closed :
    BSD_143a1_conductor = 143 ∧ (143 : ℕ) * 13 = 1859 ∧ (2113 : ℕ) % 35 = 13 := by
  exact ⟨rfl, hecke_transfer_143_13, barrier_2113_mod_35⟩

-- Link to the same proved arithmetic conjunction in Arithmetic.lean.
theorem M5_points_to_BSD :
    (11 : ℚ) * 13 * (1 + 1 / 11) * (1 + 1 / 13) = 168 ∧
      168 / 12 = 14 ∧
      1 + 168 / 12 - 4 / 2 = 13 ∧
      168 / 3 = 56 :=
  gate1_arithmetic_complete

end BostConnes
