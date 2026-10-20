// Shared (client pre-check + server authority): does the undercover rule
// let this unit trade at a stall at this position?
// Returns "" when yes, otherwise the reason to show the player.
// Rule (setting ABZ_undercoverMode): 0 never required, 1 always required,
// 2 waived in towns the rebels hold. Antistasi only.
params [["_unit", objNull, [objNull]], ["_pos", [0, 0, 0], [[]]]];
private _mode = missionNamespace getVariable ["ABZ_undercoverMode", 1];
if (_mode == 0 || {!(call ABZ_fnc_isAntistasi)} || {captive _unit}) exitWith { "" };

private _held = false;
if (_mode == 2 && {!isNil "sidesX"}) then {
	private _city = [citiesX, _pos] call BIS_fnc_nearestPosition;
	_held = (sidesX getVariable [_city, sideUnknown]) == teamPlayer;
};
if (_held) exitWith { "" };

localize [
	"STR_A3U_Bazaar_Undercover_ComeBackUndercover",
	"STR_A3U_Bazaar_Undercover_TakeTownFirst"
] select (_mode == 2)
