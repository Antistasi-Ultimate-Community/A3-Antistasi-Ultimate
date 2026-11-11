// Can a bulk crate turn into an arsenal UNLOCK on this server?
// Antistasi with arsenal unlocks on (minWeaps >= 0): yes, by Antistasi's
// own rules. Unlocks disabled (minWeaps < 0): only if the server opted in
// to "Bulk crates unlock anyway". Outside Antistasi: never - there is no
// arsenal, a crate just opens.
// Safe on clients: minWeaps is published by the mission, settings by CBA.
if !(call ABZ_fnc_isAntistasi) exitWith { false };
private _min = missionNamespace getVariable ["minWeaps", -1];
if (_min isEqualType 0 && {_min >= 0}) exitWith { true };
missionNamespace getVariable ["ABZ_bulkUnlockAnyway", false]
