import Lake
open Lake DSL

-- bost-connes -- Morning Star Project -- UPDATED M1-M3 CLOSED
-- Axioms: {propext, Classical.choice, Quot.sound} -- 0 sorry -- 16 bricks
-- M1 SelbergMatch [B132] + M2 SpectralBC95 [B129+B76] → M3 WeilBound [B133]
-- C_S4_bounds_CLOSED via exp bounds — was OPEN

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

-- Closes M1-M3 + P5_HeckeTransfer (143*13=1859) + 2113%35=13 barrier
require arakelov from git
  "https://github.com/DavidFox998/arakelov-positivity-rh-core.git" @ "main"
-- Pin it after green: @ "b132-b133-closed" or commit hash

package bost_connes where
  leanOptions := #[⟨`autoImplicit, false⟩]

lean_lib BostConnes where
  srcDir := "Src"
  roots := #[`BostConnes.Arithmetic,
              `BostConnes.Threshold,
              `BostConnes.C06_ZetaControl,
              `BostConnes.GateM1Certificate,
              `BostConnes.BricksClosed]

@[default_target]
lean_lib BostConnesFull where
  srcDir := "Src"
