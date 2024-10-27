/*
Author: wersal
Attempts to convert given vehicle into an implacement 

Arguments:
    <OBJECT> Player who is trying to move out the crew.
    <OBJECT> cursorObject of the player.

Return Value:
<NIL> nil

Scope: Server/HC, All calls need to be executed on one machine, using an HC is also possible.
Environment: Unscheduled, is used to moveout crew, execution cannot be stacked and exploited.
Public: No
Dependencies:
<STRING> ownerX found on vehicles, contains UID of player who bought it.
<ARRAY> Template vehicle arrays.

Example:
// From a button control:
action = "if (player == theBoss) then {closeDialog 0; nul = [player,cursorObject] remoteExecCall [""A3A_fnc_moveOutCrew"",2]} else {["localize "STR_A3A_Base_moveOutCrew_header"", ""Only the Commander can move out vehicle crew.""] call A3A_fnc_customHint;};";

// Testing spam:
for "_i" from 1 to 1000 do {
    [player,cursorObject] remoteExecCall ["A3A_fnc_moveOutCrew",2];
};

*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    ["_player",objNull,[objNull]],
    ["_veh",objNull,[objNull]]
];

#define OccAndInv(VAR) (FactionGet(occ, VAR) + FactionGet(inv, VAR))
private _vehicle = _veh;
private _crewgroup = crew _vehicle;
if (isNull _player) exitWith { Error("_player is null.") };
if (isNull _vehicle) exitWith {
    [localize "STR_A3A_Base_moveOutCrew_header", localize "STR_A3A_reinf_airstrike_not_looking_at_veh"] remoteExecCall ["SCRT_fnc_misc_deniedHint",_player];
};

_owner = _vehicle getVariable ["ownerX",""];
if !(_owner isEqualTo "" || {getPlayerUID _player isEqualTo _owner}) exitWith {  // crew cannot be moved out if owned by another player.
    [localize "STR_A3A_Base_moveOutCrew_header", localize "STR_A3A_Base_sellVehicle_err2"] remoteExecCall ["SCRT_fnc_misc_deniedHint",_player];
};

if ((side _vehicle ==  west) || (side _vehicle == east)/*  && alive driver _vehicle */) exitWith {
    [localize "STR_A3A_Base_moveOutCrew_header", localize "STR_A3A_Base_moveOutCrew_err0"] remoteExecCall ["SCRT_fnc_misc_deniedHint",_player];
};

/* if !(isNull _crewgroup || _crewgroup isNull) exitWith {
	[localize "STR_A3A_Base_moveOutCrew_header", localize "STR_A3A_Base_moveOutCrew_err0"] remoteExecCall ["SCRT_fnc_misc_deniedHint",_player];
}; */ //need to think about it

if (isNil {_veh getVariable "lockedForAI"} || _veh getVariable "lockedForAI") then {
	_target setVariable ["lockedForAI", nil, true];
	[_target] remoteExec ["A3A_fnc_updateRebelVehicleEmplacements", 2];
	[localize "STR_A3A_Base_moveOutCrew_header", localize "STR_A3A_Base_moveOutCrew_success"] remoteExecCall ["A3A_fnc_customHint",_player];
} else {
	_target setVariable ["lockedForAI", true, true]; 
	// kick any AIs out of the vehicle
	{
	    if (isPlayer _x) then { continue };
	    [_x] remoteExec ["unassignVehicle", _x];
	    moveOut _x;
	} forEach (crew _target);
};

nil;