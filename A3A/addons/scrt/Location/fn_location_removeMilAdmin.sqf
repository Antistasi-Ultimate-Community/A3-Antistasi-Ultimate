/*
Maintainer: Socrates
    Removes military administration from active pool and puts it into captured miladmins array.

Arguments:
    <OBJECT> Military Administration building
    <STRING> Reason of call - could be either DESTROY, CAPTURE, SILENT or LOADSTAT

Scope: Client, Server
Environment: Any
Public: Yes

Example:
[_milAdministration, "DESTROY"] call SCRT_fnc_location_removeMilAdmin;
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [
	["_milAdministration", objNull, [objNull]],
	["_cause", "CAPTURE", [""]]
];

if (_milAdministration isEqualTo objNull) exitWith {
	Error("For some reason miladministration object is null.");
};

if (_milAdministration in A3A_destroyedMilAdministrations) exitWith {
	Warning("Military administration is already destroyed, aborting.");
};

_milAdministration removeAllEventHandlers "Killed";

A3A_destroyedMilAdministrations pushBack _milAdministration;
private _mrk = [milAdministrationsX, _milAdministration] call BIS_fnc_nearestPosition;
_mrk setMarkerColor "ColorBlack";
_mrk setMarkerType "A3AU_miladmin_dead_mrk";
sidesX setVariable [_mrk, teamPlayer, true];

//otherwise it will be looped
if (_cause isNotEqualTo "LOADSTAT") then {
	publicVariable "A3A_destroyedMilAdministrations";
};

switch (_cause) do {
	case "CAPTURE": {
		["TaskSucceeded", ["", (localize "STR_notifiers_miladmin_captured")]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
		["TaskFailed", ["", (localize "STR_notifiers_miladmin_captured")]] remoteExec ["BIS_fnc_showNotification", Occupants];
		[-25, 25, position _milAdministration] remoteExec ["A3A_fnc_citySupportChange",2];
	};
	case "DESTROY": {
		["TaskSucceeded", ["", (localize "STR_notifiers_miladmin_destroyed")]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
		["TaskFailed", ["", (localize "STR_notifiers_miladmin_destroyed")]] remoteExec ["BIS_fnc_showNotification", Occupants];
		[Occupants, 15, 60] remoteExec ["A3A_fnc_addAggression",2];
		[-25, 25, position _milAdministration] remoteExec ["A3A_fnc_citySupportChange",2];

		private _players = [300, _milAdministration] call SCRT_fnc_common_getNearPlayers;

		if (_players isNotEqualTo []) then {
			private _position = getPos _milAdministration;
			private _reveal = [_position, Occupants] call A3A_fnc_calculateSupportCallReveal;
			[Occupants, (selectRandom _players), _position, 4, _reveal] remoteExec ["A3A_fnc_requestSupport", 2];

			private _base = [Occupants, _position] call A3A_fnc_availableBasesLand; 
			if (isNil "_base") exitWith { Info("QRF cancelled because no land bases available"); -1 }; 

			[_base, 1] call A3A_fnc_addTimeForIdle;
			[Occupants, _base, _milAdministration, "defence", 2] spawn A3A_fnc_createAttackForcePolice;
		};
	};
	case "SILENT";
	case "LOADSTAT": {
		[_milAdministration] call BIS_fnc_createRuin;
		[_milAdministration, true] remoteExecCall ["hideObject", -clientOwner];
	};
	default {
		Error("Unknown cause of administration removal.");
	};
};