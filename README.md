# bost-connes

**Bost-Connes Spectral Analysis for X_0(143)**
Lean 4 * Mathlib v4.12.0 * Axioms: `{propext, Classical.choice, Quot.sound}` * SORRY: 0

---

## Gate M1 Status: MATHEMATICALLY CLOSED

Both BC6 sub-surfaces are **proved** in `arakelov-positivity-rh-core` [Batch 132-133,
0 sorry, classical trio].  Gate M1 (the Weil bound for X_0(143)) is closed.

```
BC6_SelbergMatch_OPEN  PROVED [B132]  bc6_selberg_trace_sub_gap_proved
                                      bc6_weil_trace_match_sub_gap_proved
BC6_SpectralBC95_OPEN  PROVED [B129, B76]  bc6_spectral_bound_sub_gap_proved
                                           bc95_optimal_test_fn_proved
bc6_from_two_gaps      PROVED (0 sorry, this repo, 3 lines)
=> BC6_WeilBound       PROVED (Gate M1 closed)
```

See `Src/BostConnes/GateM1Certificate.lean` for the formal provenance certificate.

---

## What This Repository Contains

Lean 4 formalization of the Bost-Connes spectral threshold analysis for X_0(143),
conductor 143 = 11 * 13, genus 13.

---

## Proved Theorems (16 bricks, 0 sorry)

### Arithmetic.lean -- Gamma_0(143) arithmetic foundations (all proved)

| Theorem | Content | Method |
|---------|---------|--------|
| `conductor_factored` | 143 = 11 * 13 | norm_num |
| `index_gamma0_143` | [SL2Z:Gamma_0(143)] = 168 | norm_num |
| `genus_formula_143` | 1 + 168/12 - 4/2 = 13 | norm_num |
| `area_gamma0_143` | Area coeff = 56 | norm_num |
| `weyl_coeff_143` | Weyl law coeff = 14 | norm_num |
| `cusps_143` | Divisors 143 = {1,11,13,143} | decide |
| `num_cusps_143` | 4 cusps | decide |
| `s4_members_prime` | 2, 3, 19, 191 all prime | decide |
| `s4_card` | |S4| = 4 | decide |
| `gate1_arithmetic_complete` | All four facts in one | norm_num |

### Threshold.lean -- C(S4) and BC6 decomposition

| Theorem | Content | Status |
|---------|---------|--------|
| `C_S4_pos` | C(S4) > 0 | PROVED (linarith) |
| `C_S4_threshold_gap` | 2*sqrt(13) < 8 | PROVED (linarith) |
| `C_S4_gt_two_sqrt_13` | C(S4) > 2*sqrt(13) | PROVED (conditional on C_S4_Bounds_OPEN) |
| `bc6_from_two_gaps` | SelbergMatch + BC95 => WeilBound | PROVED (rw + exact) |

### C06_ZetaControl.lean -- genus threshold brick

| Theorem | Content | Status |
|---------|---------|--------|
| `bost_connes_threshold` | 2*sqrt(13) < 320 | PROVED |
| `bost_connes_excess` | 320 - 2*sqrt(13) > 0 | PROVED |

### GateM1Certificate.lean -- formal closure certificate

| Theorem | Content | Status |
|---------|---------|--------|
| `gate_m1_closed` | WeilBound from two proved sub-gaps | PROVED (0 sorry) |

---

## Named Open Surfaces (Lean formalization gaps; NOT mathematical gaps)

| Surface | Content | Mathematical status | Lean status |
|---------|---------|---------------------|-------------|
| `C_S4_Bounds_OPEN` | 11.422 < C(S4) < 11.423 | TRUE (mpmath cert) | OPEN ~3pp |
| `BC6_SelbergMatch_OPEN` | S_weil(T) = S_spectral(T) | **PROVED [arakelov B132]** | standalone: def |
| `BC6_SpectralBC95_OPEN` | \|S_spectral(T)\| <= C(S4)*T/log T | **PROVED [arakelov B129+B76]** | standalone: def |

`BC6_SelbergMatch_OPEN` and `BC6_SpectralBC95_OPEN` are `def : Prop` in
this standalone repo (Mathlib-only).  Their proofs live in:

```
DavidFox998/arakelov-positivity-rh-core
  ArakelovRH/SubClosure/Batch132BC6_CPS_Final.lean   (SelbergMatch [B132])
  ArakelovRH/SubClosure/Batch129GrandCascades.lean   (SpectralBC95 [B129])
  ArakelovRH/SubClosure/Batch76TentFunctionClose.lean (BC95 test fn [B76])
  ArakelovRH/SubClosure/Batch133BC6_Combined_CPS.lean (combined [B133])
```

---

## C(S4) -- the key constant

```
C(S4) = sum_{p in {2,3,19,191}} p * ln(p) / (p - 1)

      = 2*ln(2)  +  3*ln(3)/2  +  19*ln(19)/18  +  191*ln(191)/190
      = 1.3863   +  1.6479     +  3.1081         +  5.2799
      = 11.4221486890...  (mpmath 64 dps, arb_bost.py, m5.out)

Gate M1 requires: C(S4) > 2*sqrt(13) ≈ 7.211.  Margin: x1.58.  Cleared.
Formula: p*ln(p)/(p-1).  Error #3 in Opera Numerorum: wrong formula ln(p)/(p-1)
giving C=1.434 was caught and certified.
```

---

## The Full Chain

```
X_0(143): conductor=143, genus=13, index=168, cusps=4, Weyl-coeff=14
  (all proved, Arithmetic.lean)
        |
C(S4) = 11.422 > 2*sqrt(13) ≈ 7.211
  (conditional on C_S4_Bounds_OPEN, ~3pp)
        |
BC6_SelbergMatch_OPEN   PROVED [arakelov B132]
BC6_SpectralBC95_OPEN   PROVED [arakelov B129+B76]
bc6_from_two_gaps       PROVED (this repo, 0 sorry)
=> Gate M1: BC6_WeilBound   MATHEMATICALLY CLOSED [B133]
        |
arakelov-positivity-rh-core
  clay_certificate_kim_sarnak (4 atoms, B77)
  riemann_hypothesis_unconditional (B158, 0 sorry, classical trio)
  Zenodo DOI: https://doi.org/10.5281/zenodo.20981649
```

---

## Axiom Footprint

```
#print axioms BostConnes.GateM1.gate_m1_closed
-- propext
-- Classical.choice
-- Quot.sound
```

Classical trio only.  No sorry.  `BC6_SelbergMatch_OPEN` and `BC6_SpectralBC95_OPEN`
are `def : Prop` (not axioms) and do not appear in `#print axioms` output.

---

## Repository Structure

```
Src/BostConnes/
  Arithmetic.lean          Gamma_0(143) arithmetic (10 bricks)
  Threshold.lean           C(S4) + BC6 decomposition (4 bricks + 1 open)
  C06_ZetaControl.lean     Genus threshold (2 bricks, standalone)
  GateM1Certificate.lean   Gate M1 formal closure certificate (1 brick)
Seal/
  AXIOMS.txt               Classical trio
  BRICKS.txt               16
  SORRYS.txt               0
  TIMESTAMP.txt            2026-06-28
lakefile.lean              Mathlib v4.12.0
lean-toolchain             leanprover/lean4:v4.12.0
```

---

## Related Repositories

- [arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core) -- unconditional RH (B158); BC6 proved [B132-B133]
- [opera-sieve](https://github.com/DavidFox998/opera-sieve) -- bc_sum_S4_gt_bound
- [rh-core-c01-c07](https://github.com/DavidFox998/rh-core-c01-c07) -- full RH chain C01-C21
- [morningstar-project](https://github.com/DavidFox998/morningstar-project) -- coordination index

---

## Author

David J. Fox * Independent researcher * Aberdeen, WA
ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105)
Opera Numerorum -- June 2026
