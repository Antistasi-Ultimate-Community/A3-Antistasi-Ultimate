/*
	Author:
		jwoodruff40
	
	Description:
		Adds a group to HC (High Command) for the rebel commander.
	
	Params:
		_target <OBJECT> : The object module was placed on.
	
	Dependencies: // ! Update
		N/A
	
	Scope: // ! Update
		N/A
	
	Environment: // ! Update
		N/A
	
	Usage:
		Only intended to be called from the init event handler of Zeus-spawned A3U add to high command module.
		[_target] call A3A_zeus_fnc_addToHC;
	
	Return:
		Nothing
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target"];

if (isNil "_target" || {isNull _target}) exitWith {
	private _message = localize "STR_A3U_Zeus_Misc_Dialog_InvalidTarget";
	[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

private _group = group _target;

switch (true) do {
	case ((side _group) isNotEqualTo teamPlayer);
	case (isPlayer (leader _group));
	case ((units _group) isEqualTo []) : {
		private _message = localize "STR_A3U_Zeus_Misc_Dialog_InvalidGroup";
		[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
		nil;
	};
	case ((count hcAllGroups theBoss) >= 10) : {
		private _message = localize "STR_A3A_reinf_addFIASquadHC_error_too_many_hc";
		[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
		nil;
	};
	default {
		_group setGroupIdGlobal ["Squd-" + str ({side (leader _x) == teamPlayer} count allGroups)];
		theBoss hcSetGroup [_group];
		petros directSay "SentGenReinforcementsArrived";
	};
};
