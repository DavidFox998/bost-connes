import BostConnes.Threshold

namespace BostConnes
open Real

-- The two three-prime comparisons are explicit numerical certificate inputs
-- until their logarithmic interval proofs are formalized.
noncomputable def C_S3_2_3_19 : ℝ := 2 * log 2 + 3 * log 3 / 2 + 19 * log 19 / 18
noncomputable def C_S3_2_3_191 : ℝ :=
  Finset.sum ({2, 3, 191} : Finset ℕ) (fun p => (p : ℝ) * log p / (p - 1))

def S3_threshold_certificate : Prop :=
  C_S3_2_3_19 < 2 * sqrt 13 ∧ 2 * sqrt 13 < C_S3_2_3_191

theorem C_2_3_19_below_threshold
    (h_certificate : S3_threshold_certificate) : C_S3_2_3_19 < 2 * sqrt 13 :=
  h_certificate.1

theorem C_2_3_191_above_threshold
    (h_certificate : S3_threshold_certificate) : 2 * sqrt 13 < C_S3_2_3_191 :=
  h_certificate.2

def ZoeSearchSpec : Prop := ∃ S : Finset ℕ, S.card = 3 ∧
  (Finset.sum S (fun p => (p : ℝ) * log p / (p - 1)) > 2 * sqrt 13)

theorem M7_S4_not_unique
    (h_certificate : S3_threshold_certificate) : ZoeSearchSpec := by
  use {2, 3, 191}
  constructor
  · decide
  · simpa [C_S3_2_3_191] using C_2_3_191_above_threshold h_certificate

end BostConnes
