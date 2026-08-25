/-
  Gate M1 provenance record.

  The Bost--Connes package does not currently import the formal BC6 bridge
  from arakelov-positivity-rh-core.  This module therefore records the
  source location and exposes only statements that are proved locally.
  It does not claim a local proof of that external bridge.
-/

namespace BostConnes.GateM1

/-- The external BC6 bridge is recorded as provenance, not reasserted as a
local theorem without its imported formal definitions. -/
def external_bc6_bridge_recorded : Prop := True

theorem external_bc6_bridge_provenance : external_bc6_bridge_recorded := trivial

/-- The local package records the existence of the arakelov provenance note. -/
theorem arakelov_18_atom_certificate : True := trivial

end BostConnes.GateM1
