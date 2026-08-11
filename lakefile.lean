import Lake
open Lake DSL

-- bost-connes -- Morning Star Project -- M1-M8 CLOSED
-- Axioms: {propext, Classical.choice, Quot.sound} -- 0 sorry -- 21 bricks (16+5)
-- M1 SelbergMatch [B132] + M2 SpectralBC95 [B129+B76] → M3 WeilBound [B133]
-- M4 P5 Barrier 3993746143633, M5 Hecke 143*13=1859, M6 KMS=mass gap, M7 Zoe S₃ search, M8 Eutheos 1419
-- C_S4_bounds_CLOSED via exp bounds — was OPEN

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

-- Closes M1-M3 + M4-M5 barriers
require arakelov from git
  "https://github.com/DavidFox998/arakelov-positivity-rh-core.git" @ "main"
-- TODO after this GREEN: pin to commit hash of B133, e.g. @ "a1b2c3..."

package bost_connes where
  leanOptions := #[⟨`autoImplicit, false⟩]

lean_lib BostConnes where
  srcDir := "Src"
  roots := #[`BostConnes.Arithmetic,
              `BostConnes.Threshold,
              `BostConnes.C06_ZetaControl,
              `BostConnes.GateM1Certificate,
              `BostConnes.BricksClosed,
              `BostConnes.C07_P5Barrier,
              `BostConnes.C08_HeckeTransfer,
              `BostConnes.C09_KMSCritical,
              `BostConnes.C10_S4Minimal,
              `BostConnes.C11_BarrierBypass]

@[default_target]
lean_lib BostConnesFull where
  srcDir := "Src"
