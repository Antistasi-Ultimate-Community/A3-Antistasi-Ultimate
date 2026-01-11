/*
	Author:
		jwoodruff40
	
	Description:
		Initializes a unit spawned by Zeus with appropriate loadout and settings.
	
	Params:
		_unit <OBJ> : The unit spawned by Zeus to initialize.
		_unitFaction <STR> : The faction of the unit to initialize (e.g. "reb", "occ", "inv", "riv").
		_unitPrefix <STR> : The prefix for the unit's loadout (e.g. "militia", "military", "elite", "SF", "Police", "other").
		_unitType <STR> : The type of the unit's loadout (e.g. "Rifleman", "SquadLeader", "staticCrew").
	
	Dependencies: // ! Update
		N/A
	
	Scope: // ! Update
		N/A
	
	Environment: // ! Update
		N/A
	
	Usage:
		Only intended to be called from the PostInit event handler of Zeus-spawned A3U vehicles.
		[_unit, "occ", "military", "Rifleman"] call A3U_fnc_zeus_unitInit;
	
	Return:
		Nothing
*/

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_unitFaction", "_unitPrefix", "_unitType"];

_unit setVariable ["unitPrefix", _unitPrefix];
_unit setVariable ["unitType", format ["loadouts_%1_%2_%3", _unitFaction, _unitPrefix, _unitType]];

switch (_unitFaction) do {
	case ("reb"): {
		if (_unitType isEqualTo "Unarmed") then { // Unarmed rebels aren't given a loadout in equipRebel (called by fiaInit)
			private _faction = A3A_faction_reb;
			_unit setUnitLoadout selectRandom (((_faction get "loadouts") get (format ["%1_%2", _unitPrefix, _unitType])) select 0);
		};
		[_unit, false] call A3A_fnc_fiaInit;
	};
	case ("occ");
	case ("inv");
	case ("riv"): {
		private _faction = missionNamespace getVariable ("A3A_faction_" + _unitFaction);
		if (isNil "_faction") exitWith {};
		_unit setUnitLoadout selectRandom (((_faction get "loadouts") get (format ["%1_%2", _unitPrefix, _unitType])) select 0);
		[_unit, "", false] call A3A_fnc_NATOinit;
	};
	default {
		Error_2("Unknown faction %1 for unit %2", _unitFaction, _unit)
	};
};
