/*
Maintainer: Socrates
    Returns locations players know about (or don't).

Arguments:
	<STRING> KNOWN, UNKNOWN or nothing at all

Return Value:
    <ARRAY> Known locations

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <HASHMAP> rivalsLocationsMap

Example:
[] call SCRT_fnc_rivals_getLocations;
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [["_mode", ""]];

if (!(_mode in ["KNOWN", "UNKNOWN", ""])) exitWith {
	Error_1("Wrong value: %1", _mode);
};

if (areRivalsDefeated || !areRivalsDiscovered || !areRivalsEnabled) exitWith {
	[];
};

private _locations = switch (_mode) do {
	case "KNOWN": {
		(rivalsLocationsMap apply { 
			private _marker = _x;
			private _isKnown = _y;
			[nil,_marker] select _isKnown
		}) select {!isNil "_x"};
	};
	case "UNKNOWN": {
		(rivalsLocationsMap apply { 
			private _marker = _x;
			private _isKnown = _y;
			[nil,_marker] select !(_isKnown)
		}) select {!isNil "_x"};
	};
	default {
		keys rivalsLocationsMap;
	};
};

if (isNil "_locations") then {
	_locations = [];
};

Debug_2("Returning locations %1 with %2 filter", str _locations, _mode);

_locations