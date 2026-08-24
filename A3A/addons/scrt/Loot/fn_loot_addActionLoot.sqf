/*
	author: Socrates
	description: Adds auto looter action to vehicle.
	returns: nothing
*/
#include "..\script_component.hpp"

params ["_vehicle"];

private _lootActionID = _vehicle getVariable ["lootActionID", Nil];

//Check if action exists already
if(!isnil "_lootActionID") then
{
	_vehicle removeAction _lootActionID;
};

//add action
_lootActionID = [_vehicle,
	localize "STR_antistasi_actions_loot_around_text",
	"\a3\missions_f_oldman\data\img\holdactions\holdaction_box_ca.paa",
	"\a3\missions_f_oldman\data\img\holdactions\holdaction_box_ca.paa",
	"vehicle player == player && _this distance _target < 5",
	"vehicle player == player && _caller distance _target < 5",
	{},
	{},
	{
		[_this select 0, lootCrateDistance] remoteExec ["SCRT_fnc_loot_gatherLoot", 2];
	},
	{},
	[],
	2,
	5,
	false,
	false
] call BIS_fnc_holdActionAdd;

Verbose("Loot action to loot truck has been added.");

_vehicle setVariable ["lootActionID", _lootActionID, false];

//add event handler to remove action from vehicle when it's killed
_vehicle addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	[_unit] remoteExec ["SCRT_fnc_loot_removeActionLoot",0, _unit];
}];

_lootActionID;
