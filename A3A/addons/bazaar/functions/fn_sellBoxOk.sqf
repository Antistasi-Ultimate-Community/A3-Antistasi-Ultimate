// Shared: can a player sell out of this vehicle or crate (v1.1.1)? Anything
// with cargo space that players can open themselves - not a person, not a
// locked inventory or a locked vehicle, not a Bazaar crate (sealed goods / a smuggling run),
// not Antistasi's arsenal or vehicle boxes at HQ.
// [object] -> bool
params [["_b", objNull, [objNull]]];
if (isNull _b || {!alive _b} || {_b isKindOf "CAManBase"} || {isObjectHidden _b}) exitWith { false };
if (maxLoad _b <= 0 && {!(_b isKindOf "WeaponHolder")}) exitWith { false };
if (lockedInventory _b) exitWith { false };
if (_b isKindOf "AllVehicles" && {(locked _b) >= 2}) exitWith { false };	// a locked vehicle (someone else's) stays shut
if ((_b getVariable ["ABZ_crate", []]) isNotEqualTo [] || {(_b getVariable ["ABZ_runId", -1]) >= 0}) exitWith { false };
!(_b in [missionNamespace getVariable ["boxX", objNull], missionNamespace getVariable ["vehicleBox", objNull]])
