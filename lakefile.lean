import Lake
open Lake DSL
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.12.0"
lean_lib Towers where
  roots := #[`Towers.RH.Chain.C06_ZetaControl]
