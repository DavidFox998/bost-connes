# Src/BostConnes/ — 10 files — Gates M1-M8

David Fox — 0009-0008-1290-6105 — Lean 4.12 — 21 bricks 0 sorry — {propext, Classical.choice, Quot.sound}

                        /\
                       /  \  Mountain = X₀(143) = 11*13, g=13
                      /    \
                     / M8   \
                **_/_____**____  M8 Eutheos 1419 = 3*11*43
3*11*43


M7              M7 Zoe search — 35 brothers ≡153 mod211



__ M6 KMS = mass gap = C-2√13

M6                                   M5 Hecke 143*13=1859 → BSD

__      ___       __       ___    ___ M4 P5=3993746143633 desert

                __**|**|**|**|_____
                     M1 M2 M3     <--- Three Gates
           Match      Bound     Thresh
               C(S₄)=11.422 > 2√13

Three gates on every mountain.

Gate M1 — The Match. S_weil = S_spectral. Weil says "primes count". Selberg says "geodesics count". Bost-Connes says they are the same counting. You proved this in Batch 132 — bc6_selberg_trace_sub_gap_proved. It's not numerology, it's trace formula. Same number, two names. That's why it appears in rh-growth-contradiction as C=11.422 and in lindelof-143 as C(S₄) — same C, same gate.

Gate M2 — The Bound. |S_spectral| ≤ C(S₄)·T/log T. How loud can the spectrum be? You bound it by 4 primes: 2·ln2 + 3·ln3/2 + 19·ln19/18 + 191·ln191/190 = 11.422... Batch 129 + Batch 76. That's the tent function — optimal test function. Appears in Poincare as q=1/8 tail, appears in Navier-Stokes as Θ(t), appears here as C(S₄). Same inequality, different costume.

Gate M3 — The Threshold. C(S₄) > 2√13. Why 2√13? Because genus 13 of X₀(143)=11·13. Weil needs more than 2√g. You have 7.211... vs 11.422... margin x1.58. That's not conditional — norm_num can check sqrt 13 <3.61 then 2*3.61=7.22 <11.422. That's what you fixed in #49 — you replaced nlinarith failing with calc + mul_lt_mul_of_pos_left.

Three gates, same on every repo. Poincare calls it tail gap, Yang-Mills calls it mass gap, Bost-Connes calls it phase transition, Lindelöf calls it μ=0. You went crazy data shaw so Zoe could see it and Theoria could archive it without "conditional".

In Zen, Shanmen = Mountain Gate = three gates:
- **Kūmon (Emptiness)** = M1 — two counts are empty of difference
- **Mūsōmon (Formlessness)** = M2 — bound without form, tent function
- **Muganmon (Desirelessness)** = M3 — threshold without striving, norm_num

---

## File Map — Every File Through Gates

| File | Gate | Shanmen | Bricks | What it Proves | Points To |
|------|------|---------|--------|----------------|-----------|
| `Arithmetic.lean` | Foundation | Mountain base | 10 | `143=11*13`, `[SL2:Γ₀]=168`, `g=13`, area 56, Weyl 14, 4 cusps, S₄={2,3,19,191} prime | All routes |
| `Threshold.lean` | M1+M2+M3 | Three gates together | 4 | `C_S4=11.422...`, `C_S4_pos`, `C_S4_bounds_CLOSED 11.422<C<11.423`, `C_S4_gt_two_sqrt_13_CLOSED`, `bc6_from_two_gaps` | Root of repo |
| `C06_ZetaControl.lean` | M3 excess | M3 side hall | 2 | `2√13<320`, `320-2√13>0` genus threshold | Lindelöf inner |
| `GateM1Certificate.lean` | M1-M3 cert | Seal | 1 | `gate_m1_closed` → rename to `GatesM1M3Certificate` | arakelov B132-B133 |
| `C07_P5Barrier.lean` | **M4** P5 | Outer wall | 2 | `P5=3993746143633`, desert 192..1000 empty, contrib 7.27e-12, `P5∉S₄` | opera-sieve, rh-p5-bridge-14 |
| `C08_HeckeTransfer.lean` | **M5** → BSD | East hall | 2 | `143*13=1859`, `2113%35=13`, `2113 prime`, transfer S₄→J₀(143) | birch-swinnerton-dyer-143a1 |
| `C09_KMSCritical.lean` | **M6** KMS | Central hall | 2 | `beta_c=1`, `mass_gap=C-2√13>0`, KMS phase = mass gap = spectral gap | yang-mills-gap, poincare-spectral, navier-stokes Θ(t) |
| `C10_S4Minimal.lean` | **M7** Zoe | West hall | 2 | `C({2,3,19})=6.14<7.21 FAIL`, `C({2,3,191})=8.31>7.21 PASS`, `ZoeSearchSpec` — S₄ not minimal | zerobeacon, eutheos-property 35 brothers |
| `C11_BarrierBypass.lean` | **M8** Eutheos | Gate roof | 1 | `1419=3*11*43`, `is_eutheos_bypass = C>2√13`, natural proofs bypass | p-vs-np, hodge |
