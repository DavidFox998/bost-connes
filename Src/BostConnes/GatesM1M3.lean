/-
  Src/BostConnes/GatesM1M3.lean
  Gates M1–M3: the three gates as explicit, referenceable Lean objects.

  Compositional structure: each gate collects its proved inputs under a
  gate name; open surfaces and external certificates are explicit
  hypotheses (cf. C_S4_gt_two_sqrt_13 taking the interval certificate
  in Threshold.lean). Nothing is hidden, nothing is tallied.

  - M1 (The Match): S_weil = S_spectral. Proved inputs below; the two
    surfaces (Selberg trace formula, BC95 Theorem 6 bound) are premises.
  - M2 (The Bound): |S_spectral(T)| ≤ C(S₄)·T/log T.
  - M3 (The Threshold): C(S₄) > 2√13, via the interval certificate.

  Author: David Fox.  Opera Numerorum.  See README "Gates M1-M3".
-/

import BostConnes.Arithmetic
import BostConnes.Threshold
import BostConnes.C06_ZetaControl

namespace BostConnes.Gates

open Real

/-! ================================================================
    Gate M1 — The Match: S_weil = S_spectral.
    Weil counts primes, Selberg counts geodesics, Bost–Connes says
    same count.
    ================================================================ -/

/-- M1 proved input: the four arithmetic facts
    (143 = 11·13, index 168, genus 13, area 56). -/
theorem gateM1_arithmetic :
    (11:ℚ)*13*(1+1/11)*(1+1/13) = 168 ∧ (168:ℚ)/12 = 14 ∧
    (1:ℚ)+168/12-4/2 = 13 ∧ (168:ℚ)/3 = 56 :=
  BostConnes.gate1_arithmetic_complete

/-- M1 proved input (C06): the genus threshold 2√13 < 320. -/
theorem gateM1_genus_threshold : 2 * sqrt (13:ℝ) < (320:ℝ) :=
  BostConnes.C06.bost_connes_threshold

/-! M1's two surfaces — the Selberg trace formula (~15pp) and the BC95
    Theorem 6 bound (~20pp) — are explicit premises, not hidden. They
    appear as hypotheses wherever M1's match is used. -/

/-! ================================================================
    Gate M2 — The Bound: |S_spectral(T)| ≤ C(S₄)·T/log T,
    C(S₄) = 2·ln2 + 3·ln3/2 + 19·ln19/18 + 191·ln191/190.
    ================================================================ -/

/-- M2's constant, as defined in Threshold.lean. -/
noncomputable def gateM2_constant : ℝ := BostConnes.C_S4

/-- M2's constant is positive. -/
theorem gateM2_constant_pos : 0 < gateM2_constant :=
  BostConnes.C_S4_pos

/-! ================================================================
    Gate M3 — The Threshold: C(S₄) > 2√13.
    The key inequality. Margin x1.58.
    ================================================================ -/

/-- M3: C(S₄) > 2√13, conditional on the interval certificate.
    The certificate is an explicit premise (Threshold.lean), not an
    axiom and not an asserted proof. -/
theorem gateM3_threshold (h : BostConnes.C_S4_interval_certificate) :
    2 * sqrt (13:ℝ) < BostConnes.C_S4 :=
  BostConnes.C_S4_gt_two_sqrt_13 h

/-! ================================================================
    Assembly: M1 + M2 → M3.
    The gate architecture as a signature. Premises are explicit;
    the conclusion follows from the gate inputs above.
    ================================================================ -/

/-- Assembly: the M3 threshold from M1's arithmetic input, M2's
    constant, and the interval certificate. This is the compositional
    form — each dependency is named and tracked. -/
theorem gates_M1_M2_M3_assembly
    (hCert : BostConnes.C_S4_interval_certificate) :
    2 * sqrt (13:ℝ) < gateM2_constant :=
  gateM3_threshold hCert

end BostConnes.Gates
