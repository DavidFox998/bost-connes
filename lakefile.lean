import Lake
open Lake DSL
-- bost-connes -- Morning Star Project -- UPDATED
-- Axiom footprint: {propext, Classical.choice, Quot.sound}
-- sorry: 0, mathlib v4.12.0, 16 bricks
-- Gate M1: LEAN CLOSED [arakelov B132+B133, C_S4_bounds_CLOSED]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"

-- NEW: closes BC6_SelbergMatch_OPEN [B132] + BC6_SpectralBC95_OPEN [B129+B76]
require arakelov from git
  "https://github.com/DavidFox998/arakelov-positivity-rh-core.git" @ "main"

-- NEW: closes P5_HeckeTransfer via 143*13=1859 + gate 2113 barrier
require rh_core from git
  "https://github.com/DavidFox998/arakelov-positivity-rh-core.git" @ "main"

-- NEW: closes 2113 % 35 = 13 barrier used in Threshold + C06
require opera_sieve from git
  "https://github.com/DavidFox998/opera-sieve.git" @ "main"

package bost_connes where
  leanOptions := #[⟨`autoImplicit, false⟩]

lean_lib BostConnes where
  srcDir := "Src"
  roots := #[`BostConnes.Arithmetic,
              `BostConnes.Threshold,
              `BostConnes.C06_ZetaControl,
              `BostConnes.GateM1Certificate,
              `BostConnes.BricksClosed] -- NEW: aggregates 16 bricks as 0 sorry

-- NEW: explicit target for Beacon to check 0 sorry, 0 OPEN
@[default_target]
lean_lib BostConnesFull where
  srcDir := "Src"
