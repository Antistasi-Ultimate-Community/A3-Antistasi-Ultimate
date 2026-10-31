/*
Maintainer: Socrates
    Wrapper for flatten function, which will return tiered group array with only current tier units.

Arguments:
    <HASHMAP> Faction
	<STRING> Hashmap's key with tiered group
	<NUMBER> Forced tier (from 0 to 2)


Return Value:
    <ARRAY> Array of group arrays:
	[
		[unit(militia, "SquadLeader"), unit(militia, "Marksman"), unit(militia, "Radioman"), unit(militia, "LAT"), unit(militia, "Sniper")],
		[unit(militia, "SquadLeader"), unit(militia, "MachineGunner"), unit(militia, "Radioman"), unit(militia, "LAT"), unit(militia, "Rifleman")],
		...
	]

Scope: Client, Server
Environment: Any
Public: Yes

Example:
[_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier;
*/

params [
    ["_faction", createHashMap, [createHashMap]], 
    ["_key", "", [""]],
	["_forceTier", -1, [0]]
];

(_faction get _key) apply {[_x, _forceTier] call SCRT_fnc_unit_getTiered}
