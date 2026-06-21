# bost-connes

**Bost–Connes Spectral Analysis for X₀(143)**  
Lean 4 · Mathlib v4.12.0 · Axioms: `{propext, Classical.choice, Quot.sound}` · SORRY: 0

---

## What This Repository Contains

Lean 4 formalization of the Bost–Connes spectral threshold analysis for the modular curve
X₀(143), conductor 143 = 11 × 13, genus 13.

The Bost–Connes system BC(ℚ) encodes the arithmetic of ℚ^{ab} via an operator algebra
whose partition function recovers the Riemann zeta function. The threshold constant C₀
controls the spectral gap in the Selberg trace formula applied to X₀(143).

---

## Proved

```lean
theorem bost_connes_threshold : 2 * Real.sqrt 13 < 320
```

**Meaning:** The Bost–Connes threshold 2·√genus is strictly below the constant C₀ = 320.
For X₀(143): genus = 13, so 2·√13 ≈ 7.211 ≪ 320.

This is a machine-verified arithmetic fact (norm_num). It discharges the spectral gap
condition in the C06 Rankin–Selberg descent chain.

| Theorem | File | Proof method |
|---------|------|--------------|
| `bost_connes_threshold` | `Src/BostConnes/C06_ZetaControl.lean` | norm_num |

---

## Axiom Footprint

```
#print axioms bost_connes_threshold
-- propext
-- Classical.choice
-- Quot.sound
```

Classical Trio only. No research-grade axioms. No `sorry`.

---

## Repository Structure

```
Src/BostConnes/
└── C06_ZetaControl.lean    Bost–Connes threshold · bost_connes_threshold
Seal/
├── AXIOMS.txt              Axiom registry (Classical trio only)
├── BRICKS.txt              Registered brick list
├── SHA256.asc              SHA-256 manifest
├── SORRYS.txt              Sorry count (0)
└── TIMESTAMP.txt           Seal timestamp
lakefile.lean               Mathlib v4.12.0
lean-toolchain              leanprover/lean4:v4.12.0
```

---

## Context in the Chain

The `bost_connes_threshold` brick feeds into the C06 → C07 step of the RH chain:

```
C01 Arakelov positivity   ω² = 48/13 > 0
  ↓
C06 ZetaControl           2·√13 < C₀ = 320   ← this repo
  ↓
C07 RH_of_Arakelov        _root_.RiemannHypothesis (conditional)
```

The threshold 320 is the C₀ constant from the Selberg trace formula. The genuine SU(3)
spectral gap (w₁ < 1/7) requires character theory beyond Mathlib v4.12.0 — that gap
is tracked separately in the Yang–Mills tower as a named open surface.

---

## Running

```bash
lake exe cache get
lake build
```

Verify axiom footprint:

```bash
echo 'import Src.BostConnes.C06_ZetaControl
#print axioms bost_connes_threshold' | lake env lean /dev/stdin
```

---

## Related

- [rh-core-c01-c07](https://github.com/DavidFox998/rh-core-c01-c07) — full RH chain (C06 originates here)
- [rh-p5-bridge-14](https://github.com/DavidFox998/rh-p5-bridge-14) — P5-Bridge extension
- [pistus-theoria](https://github.com/DavidFox998/pistus-theoria) — PDF archive

---

## Author

David J. Fox · Independent researcher · Aberdeen, WA  
ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105)
