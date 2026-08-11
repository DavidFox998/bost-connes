import BostConnes.Threshold

namespace BostConnes
open Real

-- Is S₄ minimal? Can 3 primes clear 2√13?
-- C({2,3,19})=1.386+1.647+3.108=6.141 <7.211 NO
-- C({2,3,191})=1.386+1.647+5.279=8.313 YES but 191 alone is heavy
-- C({2,19,191})=1.386+3.108+5.279=9.774 YES
-- S₄ is chosen for EMI -30dB + Nodup 1419 — not minimal in C but minimal in barrier sense

def C_S3_2_3_19 : ℝ := 2*log 2 + 3*log 3/2 + 19*log 19/18
def C_S3_2_3_191 : ℝ := 2*log 2 + 3*log 3/2 + 191*log 191/190

theorem C_2_3_19_below_threshold : C_S3_2_3_19 < 2 * sqrt 13 := by
  unfold C_S3_2_3_19 C_S4
  nlinarith [C_S4_bounds_CLOSED, Real.sqrt_lt_sqrt (by norm_num) (by norm_num)]

theorem C_2_3_191_above_threshold : 2 * sqrt 13 < C_S3_2_3_191 := by
  unfold C_S3_2_3_191
  nlinarith [C_S4_bounds_CLOSED]

-- Zoe task: search 35 brothers ≡153 mod 211 pop6 for better S₃
-- This file is the spec for zerobeacon swarm
def ZoeSearchSpec : Prop := ∃ S : Finset ℕ, S.card = 3 ∧ 
  (Finset.sum S (fun p => (p : ℝ) * log p / (p-1)) > 2 * sqrt 13)

theorem M7_S4_not_unique : ZoeSearchSpec := by
  use {2,3,191}; constructor; decide; nlinarith [C_2_3_191_above_threshold]

end BostConnes
