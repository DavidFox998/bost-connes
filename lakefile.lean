import Lake
open Lake DSL
-- bost-connes -- Morning Star Project
-- Axiom footprint: {propext, Classical.choice, Quot.sound}
-- sorry: 0, mathlib v4.12.0
-- Bricks: 15 (see Seal/BRICKS.txt)
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"
lean_lib BostConnes where
  srcDir := "Src"
  roots  := #[`BostConnes.Arithmetic,
              `BostConnes.Threshold,
              `BostConnes.C06_ZetaControl]
