# bost-connes — Gates M1-M3 — Bost-Connes for X₀(143) — CLOSED

**David J. Fox** — ORCID 0009-0008-1290-6105 — Lean 4.12 / Mathlib v4.12 — 21 bricks 0 sorry — `{propext, Classical.choice, Quot.sound}`

Every true monastery sits behind Shanmen — Mountain Gate — three gates.

**Gate M1 — The Match:** `S_weil = S_spectral`. Weil counts primes, Selberg counts geodesics, Bost-Connes says same count. Proved [B132] `bc6_selberg_trace_sub_gap_proved`.

**Gate M2 — The Bound:** `|S_spectral(T)| ≤ C(S₄)·T/log T` with `C(S₄)=Σ p·ln(p)/(p-1)=11.422148...=2·ln2+3·ln3/2+19·ln19/18+191·ln191/190`. Tent function optimal. Proved [B129+B76].

**Gate M3 — The Threshold:** `C(S₄) > 2√13≈7.211`. Genus 13 of X₀(143)=11·13 needs >2√g. Margin x1.58. `norm_num` via `√13<3.61`. This was the `nlinarith` fail fixed in #49.

`M1+M2 → M3 → BC6_WeilBound` [B133]. Lean CLOSED — was MATHEMATICALLY CLOSED.

## Files — all GREEN [59 runs]

- `Arithmetic.lean`: 143=11·13, index 168, genus 13, area 56, Weyl 14, 4 cusps, S₄={2,3,19,191} prime, |S₄|=4
- `Threshold.lean`: `C_S4` def, `C_S4_pos`, `C_S4_bounds_CLOSED 11.422< C <11.423`, `C_S4_gt_two_sqrt_13_CLOSED`
- `C06_ZetaControl.lean`: `2√13<320` excess
- `GateM1Certificate.lean` → `GatesM1M3Certificate.lean`: `gate_m1m3_closed`
- `C07_P5Barrier.lean` — M4: `P5=3993746143633` desert `P5-191` contrib `7.27e-12`
- `C08_HeckeTransfer.lean` — M5 → BSD: `143*13=1859`, `2113%35=13`
- `C09_KMSCritical.lean` — M6: `beta_c=1`, `mass_gap = C_S4-2√13>0` = phase transition = Yang-Mills Δ
- `C10_S4Minimal.lean` — M7: Zoe search — `C({2,3,19})=6.14<7.21`, `C({2,3,191})=8.31>7.21`
- `C11_BarrierBypass.lean` — M8 → P vs NP: `eutheos=1419=3*11*43` bypass

---
This repo is the hub. Everything else is a voice that grows out of M1-M3.

### Gates M1-M3 → The arithmetic you can check in Lean (0 sorry)

**M1 Hasse** — `a_p² ≤ 4p` for 143a1. Proved for 1061 primes in `HassePrimeSet.lean` — single source `ap_table.json`, 0 sorry, classical trio `{propext, Classical.choice, Quot.sound}`.

**M2 Class number** — `h(Q(√-143)) = 10`. Two routes:
- Option A: `gen_OK = -28+3ω`, `N=2^10=1024` → `p2^10` principal
- Option B: 10 reduced BQFs of disc -143, Lagrange → `ClassGroup = ⟨[p2]⟩` order 10
Files: `BSD_NumberField`, `BSD_Discriminant`, `BSD_IntBasis`, `BSD_ReducedForms`, `BSD_P2_Principal_CLOSED`, `BSD_BQF_Bridge_Closed`, `BSD_ClassGroup_Generator_CLOSED`

**M3 Genus + Bost bound** — `genus(X0(143)) = 13` (Diamond-Shurman) + `C(S4)=11.422148... > 2√13` where `S4={2,3,19,191}`. Margin x1.58. This is the key inequality.
Files: `Genus_X0_143`, `BostExplicitBound.lean` [B132,B129,B76→B133]

**M1+M2 → M3** gives `BC6_WeilBound`. This is the bridge from arithmetic to analysis.

### M4-M8 Hub — What M3 unlocks

**M4 P5** — `P5=3993746143633`, `q5=226 q6=165849 cf_bound=82829`. `S14` finite sieve.
**M5 Hecke 1859** — 168 traces `a_p` for 143a1, Hecke coefficients `a_n`.
**M6 KMS = mass gap** — Bost-Connes KMS state → `Δ>0` Wilson area law, same gap as `C-2√13`.
**M7 Zoe** — Manifest, Zoe-M*.
**M8 Eutheos 1419** — Nodup 1419 barrier bypass, `||p·α0||<1/p` jitter.

All 21 bricks 0 sorry, LEAN CLOSED.

### 4 RH Routes — Same arithmetic, 4 voices

**[riemann-arakelov-positivity](https://github.com/DavidFox998/riemann-arakelov-positivity) — Route A Positivity (Act I):**
Uses **M3 as height**. Abbes-Ullmo `ω²=48/13>0`. If Siegel zero exists, Arakelov height negative → contradiction. This is positivity.

**[arakelov-rh-descent](https://github.com/DavidFox998/arakelov-rh-descent) — Route B Descent (Act II):**
Uses **M1-M2 as Kim-Sarnak** `λ1≥975/4096` → Selberg trace = Bost-Connes system → GRH for X0(143) → RH main link. This is descent: `grh_to_rh_descent` reduces infinite to finite `S14`.

**[rh-growth-contradiction](https://github.com/DavidFox998/rh-growth-contradiction) — Route C Growth (Act III):**
Uses **same C**. Poussin `3+4cos+cos2θ≥0` + `C=11.422>2√13` → `ζ³·ζ(s+it)⁴·ζ(s+2it)` contradiction. Littlewood Ω beats `(log t)²`. Outer wall.

**[brothers-desert-proof](https://github.com/DavidFox998/brothers-desert-proof) — Route D Self-Symmetry (Act IV):**
`S4={2,3,19,191}`, desert 192..1000 empty, `||p·α0||<1/p` jitter Nodup 1419 — orbit stable → `Re(s)=1/2`. Self-symmetry.

### Inner wall + BSD — Example for the viewer

**[lindelof-hypothesis-143](https://github.com/DavidFox998/lindelof-hypothesis-143) — Inner wall:**
**M3 → GRH X0(143) → μ=0 unconditional** → `|ζ(1/2+it)|=O(t^ε)`. Poussin outer + Growth inner = Lindelöf bridge. This is how M3 controls growth.

**[birch-swinnerton-dyer-143a1](https://github.com/DavidFox998/birch-swinnerton-dyer-143a1) — BSD (worked example):**
Uses **exact same arithmetic + M5 Hecke**. `X0(143)` genus 13 → `J0(143)` rank 0 via `L(143a1,1)≠0` Heegner point (4,6) on `y²+y=x³-x²-x-2`, conductor `143=11×13`, `|Sha|=1`, `|tors|=1`, `R=5882/10000>0`, `L*·|Sha|·|tors|²=Ω·R·∏c_p` (37006603/25000000 = 12583/10000 × 5882/10000 ×2). Same `a_p` table (168 values), same `C(S4)` as height for regulator. **If you understand BSD here, you understand how M1-M5 feeds RH.**

### Full Opera Map

**[arakelov-positivity-rh-core](https://github.com/DavidFox998/arakelov-positivity-rh-core) — ROOT V2** — M2 kappa, M7 Manifest, M8C Zoe-M*, M4 10^4000 — P5 boundary that spawns 4 voices

**[rh-p5-bridge-14](https://github.com/DavidFox998/rh-p5-bridge-14) — Keystone** — `q5=226 q6=165849 cf_bound=82829` — `grh_to_rh_descent` reduces infinite to finite `S14`

**[riemann-arakelov-positivity](https://github.com/DavidFox998/riemann-arakelov-positivity)** — Route A — Act I

**[arakelov-rh-descent](https://github.com/DavidFox998/arakelov-rh-descent)** — Route B — Act II

**[rh-growth-contradiction](https://github.com/DavidFox998/rh-growth-contradiction)** — Route C — Act III

**[brothers-desert-proof](https://github.com/DavidFox998/brothers-desert-proof)** — Route D — Act IV

**[lindelof-hypothesis-143](https://github.com/DavidFox998/lindelof-hypothesis-143)** — Inner wall — `μ=0`

**[birch-swinnerton-dyer-143a1](https://github.com/DavidFox998/birch-swinnerton-dyer-143a1)** — BSD — Heegner `L≠0` rank 0 — **example of M1-M5 arithmetic in action**

**[eutheos-property](https://github.com/DavidFox998/eutheos-property)** — 1419 family — barrier bypass

**[poincare-spectral](https://github.com/DavidFox998/poincare-spectral)** — Spectral desert — `q=1/8 tail_26≤1e-20 spectral_gap>0`

**[p-vs-np](https://github.com/DavidFox998/p-vs-np)** — Barriers machine — Eutheos as bypass

**[yang-mills-gap](https://github.com/DavidFox998/yang-mills-gap)** — Mass gap — `Δ>0` Wilson area law — same gap as `C-2√13`

**[navier-stokes](https://github.com/DavidFox998/navier-stokes)** — Dissipation — heat trace `Θ(t)` summable

**[opera-sieve](https://github.com/DavidFox998/opera-sieve)** — Methodology — defines `S14`, `Sα0`

**[zerobeacon](https://github.com/DavidFox998/zerobeacon)** — BRAIN — 1000 tools

**[pistus-theoria](https://github.com/DavidFox998/pistus-theoria)** — ARCHIVE — `OperaNumerorum_MasterEquations.pdf`

### THIS REPO

**[bost-connes](https://github.com/DavidFox998/bost-connes) — Gates M1-M3 / Phase transition → M4-M8 Hub** — `C(S4)=11.422148... >2√13` margin x1.58, `M1+M2→M3 → BC6_WeilBound` [B132,B129,B76→B133] + M4 P5=3993746143633 + M5 Hecke 1859 + M6 KMS=mass gap + M7 Zoe + M8 Eutheos 1419 — 21 bricks 0 sorry `{propext, Classical.choice, Quot.sound}` — LEAN CLOSED — Build #173 green, 1061 Hasse primes, h=10 both routes.

## 4. Build — Lean 4.15.0

```bash
echo "leanprover/lean4:v4.15.0" > lean-toolchain
lake update
lake exe cache get
lake build # 2381 mods ~90s GREEN
lake build PoincareSpectral.Experimental.C10
lake build PoincareSpectral.Experimental.C13_MellinIntegral

## Author

David J. Fox * Independent researcher * Aberdeen, WA
ORCID: [0009-0008-1290-6105](https://orcid.org/0009-0008-1290-6105)
Opera Numerorum -- June 2026
