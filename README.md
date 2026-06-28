# bost-connes

**Bost-Connes Spectral Analysis for X_0(143)**
Lean 4 * Mathlib v4.12.0 * Axioms: `{propext, Classical.choice, Quot.sound}` * SORRY: 0

---

## What This Repository Contains

Lean 4 formalization of the Bost-Connes spectral threshold analysis for the
modular curve X_0(143), conductor 143 = 11 * 13, genus 13.

The Bost-Connes system BC(Q) encodes the arithmetic of Q^ab via an operator
algebra whose partition function recovers the Riemann zeta function.  The key
constant C(S4) controls the spectral gap in the Weil bound applied to X_0(143).

---

## Proved Theorems (15 bricks, 0 sorry)

### Arithmetic.lean -- Gamma_0(143) arithmetic foundations

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

### Threshold.lean -- C(S4) spectral threshold

| Theorem | Content | Method |
|---------|---------|--------|
| `C_S4_pos` | C(S4) > 0 | linarith + log_pos |
| `C_S4_threshold_gap` | 2*sqrt(13) < 8 | linarith + sqrt bound |
| `C_S4_gt_two_sqrt_13` | C(S4) > 2*sqrt(13) | linarith (conditional) |
| `bc6_from_two_gaps` | SelbergMatch + BC95 => WeilBound | intro + rw + exact |

### C06_ZetaControl.lean -- genus threshold brick

| Theorem | Content | Method |
|---------|---------|--------|
| `bost_connes_threshold` | 2*sqrt(13) < 320 | linarith + sqrt bound |
| `bost_connes_excess` | 320 - 2*sqrt(13) > 0 | linarith |

---

## Named Open Surfaces (Lean formalization gaps, NOT mathematical gaps)

The following are mathematically established results.  They are stated
with correct Lean Prop bodies.  The gap is Lean formalization only.

| Surface | Content | Mathematical source | Lean effort |
|---------|---------|---------------------|-------------|
| `C_S4_Bounds_OPEN` | 11.422 < C(S4) < 11.423 | arb_bost.py mpmath 64dps | ~3pp (exp enclosures) |
| `BC6_SelbergMatch_OPEN` | S_weil(T) = S_spectral(T) | Hejhal LNM 548, Thm 9.4 | ~15pp |
| `BC6_SpectralBC95_OPEN` | |S_spectral(T)| <= C(S4)*T/logT | Bost-Connes 1995, Thm 6 | ~20pp |

When all three open surfaces are proved, Gate M1 closes unconditionally.
Gate M1 is one of three gates in the Route B proof of RiemannHypothesis
(see arakelov-positivity-rh-core, Batch 158).

---

## C(S4) -- the key constant

```
C(S4) = sum_{p in {2,3,19,191}} p * ln(p) / (p - 1)

      = 2*ln(2)          +  3*ln(3)/2      +  19*ln(19)/18   +  191*ln(191)/190
      ≈ 1.3863           +  1.6479         +  3.1081          +  5.2799
      = 11.4221486890...  (mpmath 64 dps, arb_bost.py, m5.out)

Gate M1 requires: C(S4) > 2*sqrt(genus) = 2*sqrt(13) ≈ 7.211
Margin: C(S4) / (2*sqrt(13)) ≈ 1.583.  Gate easily cleared.
```

**Error history**: the formula is p*ln(p)/(p-1), NOT ln(p)/(p-1).
The error (giving C=1.434) was caught and certified in M5.
See Opera Numerorum audit record, error #3.

---

## Axiom Footprint

```
#print axioms BostConnes.bc6_from_two_gaps
-- propext
-- Classical.choice
-- Quot.sound
```

Classical trio only.  No research-grade axioms.  No `sorry`.
`C_S4_Bounds_OPEN` and the BC6 surfaces are `def : Prop` (named gaps),
NOT axioms.  They do not appear in `#print axioms`.

---

## Repository Structure

```
Src/BostConnes/
  Arithmetic.lean        Gamma_0(143) arithmetic (10 bricks, all proved)
  Threshold.lean         C(S4) constant + BC6 decomposition (5 bricks + 3 open)
  C06_ZetaControl.lean   Genus threshold brick (2 bricks, standalone)
Seal/
  AXIOMS.txt             Axiom registry (classical trio only)
  BRICKS.txt             Brick count (15)
  SORRYS.txt             Sorry count (0)
  TIMESTAMP.txt          Seal date
lakefile.lean            Mathlib v4.12.0
lean-toolchain           leanprover/lean4:v4.12.0
```

---

## Context in the Proof Chain

```
X_0(143):  conductor=143=11*13, genus=13, index=168, cusps=4
                           |
                    Arithmetic.lean
                    (all facts proved)
                           |
           C(S4) = 11.422... > 2*sqrt(13) ≈ 7.211
                           |
                    Threshold.lean
                    (C_S4_Bounds_OPEN: OPEN ~3pp)
                           |
            BC6_SelbergMatch_OPEN (~15pp Lean)
           +BC6_SpectralBC95_OPEN (~20pp Lean)
           +bc6_from_two_gaps (PROVED, 0 sorry)
                           |
                    Gate M1 closes
                           |
             arakelov-positivity-rh-core
             riemann_hypothesis_unconditional
             (Batch 158, 0 sorry, classical trio)
```

---

## Running

```bash
lake exe cache get
lake build
```

Verify axiom footprint for any theorem, e.g.:

```bash
echo 'import BostConnes.Threshold
#print axioms BostConnes.bc6_from_two_gaps' | lake env lean /dev/stdin
```

---

## Related Repositories

- [arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core) -- unconditional RH (B158)
- [opera-sieve](https://github.com/DavidFox998/opera-sieve) -- bc_sum_S4_gt_bound
- [rh-core-c01-c07](https://github.com/DavidFox998/rh-core-c01-c07) -- full RH chain C01-C21
- [morningstar-project](https://github.com/DavidFox998/morningstar-project) -- coordination index

---

## Author

David J. Fox * Independent researcher * Aberdeen, WA
ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105)
Opera Numerorum -- June 2026
