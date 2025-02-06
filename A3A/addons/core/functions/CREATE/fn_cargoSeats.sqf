#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _filename = "fn_cargoSeats";
params ["_veh", "_sideX"];

private _faction = Faction(_sideX);
/* private _isOrbital = _veh in ((_faction get "vehiclesDropPod")); */
private _isMilitia = _veh in ((_faction get "vehiclesMilitiaLightArmed") + (_faction get "vehiclesMilitiaTrucks") + (_faction get "vehiclesMilitiaCars") + (_faction get "vehiclesMilitiaAPCs"));
//private _isRivals = _veh in FactionGet(all, "vehiclesRivals");

private _totalSeats = [_veh, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
private _crewSeats = [_veh, false] call BIS_fnc_crewCount; // Number of crew seats only
private _cargoSeats = _totalSeats - _crewSeats;
if (_veh in (_faction get "vehiclesPolice")) then { _cargoSeats = 6 min _cargoSeats };

/* if (_veh in (_faction get "vehiclesDropPod")) exitWith {selectRandom [_faction, "groupsTierSquads", 2] call SCRT_fnc_unit_flattenTier }; *////;

if (_cargoSeats < 2) exitwith { [] };

if (_cargoSeats < 4) exitWith
{
	if (_isMilitia) exitWith { selectRandom ([_faction, "groupsTierSmall", 0] call SCRT_fnc_unit_flattenTier) };
	//if (_isRivals) exitWith { selectRandom (A3A_faction_riv get "groupsSentry") };
	if (_veh in (_faction get "vehiclesPolice")) exitWith { _faction get "groupPolice" };
	selectRandom ([_faction, "groupsTierSmall"] call SCRT_fnc_unit_flattenTier);
};

if (_cargoSeats < 6 or { _cargoSeats == 6 and random 3 < 1}) exitWith			// 6-man normally uses clipped full squad
{
	if (_isMilitia) exitWith { selectRandom ([_faction, "groupsTierMedium", 0] call SCRT_fnc_unit_flattenTier) };
	//if (_isRivals) exitWith { selectRandom (A3A_faction_riv get "groupsFireteam") };
	if (_veh in (_faction get "vehiclesPolice")) exitWith { (_faction get "groupPolice") + [_faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt"] };
	selectRandom ([_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier);
};

private _squad = call {
	if (_isMilitia) exitWith { selectRandom ([_faction, "groupsTierSquads", 0] call SCRT_fnc_unit_flattenTier) };
	//if (_isRivals) exitWith { selectRandom (A3A_faction_riv get "groupsSquad") };
    selectRandom ([_faction, "groupsTierSquads"] call SCRT_fnc_unit_flattenTier);
};
while { count _squad > _cargoSeats } do {
	_squad deleteAt (1 + floor random (count _squad - 1));		// don't remove the squad leader
};
_squad;
