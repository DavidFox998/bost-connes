import Lake
open Lake DSL
-- bost-connes -- Morning Star Project
-- Axiom footprint: {propext, Classical.choice, Quot.sound}
-- sorry: 0, mathlib v4.12.0
-- Bricks: 16 (see Seal/BRICKS.txt)
-- Gate M1: MATHEMATICALLY CLOSED [arakelov B133]
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"
lean_lib BostConnes where
  srcDir := "Src"
  roots  := #[`BostConnes.Arithmetic,
              `BostConnes.Threshold,
              `BostConnes.C06_ZetaControl,
              `BostConnes.GateM1Certificate]
