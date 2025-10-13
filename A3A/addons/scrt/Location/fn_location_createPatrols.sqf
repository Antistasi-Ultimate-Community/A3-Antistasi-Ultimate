/*
Maintainer: Socrates
    Creates patrols for any outpost type. 
	Rough copy of typical patrol function from createAiOutposts/Airplane/Resource.


Return Value:
    <STRING> Unit class
    <ARRAY> Group of unit classnames

Scope: Client, Server
Environment: Scheduled
Public: Yes

Example:
[_markerX, _positionX, _sideX, 4] call SCRT_fnc_location_createPatrols;
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [
	["_marker", "", [""]],
	["_markerPosition", [], [[]]],
	["_side", sideUnknown, [sideUnknown]],
	["_faction", createHashMap, [createHashMap]],
	["_patrolCount", 4, [0]]
];

private _countX = 0;
private _arrayGroups = [_faction, "groupsTierSmall"] call SCRT_fnc_unit_flattenTier;
private _sniperGroup = FactionGetTiered(_faction, "groupTierSniper");

if ([_marker, false] call A3A_fnc_fogCheck < 0.3) then {
	_arrayGroups deleteAt 0;
};

private _typeGroup = nil;
private _groupX = nil;
private _spawnPosition = nil;

while {_countX < _patrolCount} do {
	_typeGroup = selectRandom _arrayGroups;

	_spawnPosition = [_markerPosition, 25, round (_size / 2), 2, 0, -1, 0] call A3A_fnc_getSafePos;
	if (_spawnPosition isEqualTo [0,0]) exitWith {
		ServerDebug("Unable to find spawn position for patrol unit.");
	};

	_groupX = [_spawnPosition, _side, _typeGroup, false, true] call A3A_fnc_spawnGroup;
	if !(isNull _groupX) then {
		sleep 1;
		if ((random 10 < 2.5) && {_typeGroup isNotEqualTo _sniperGroup}) then {
			_dog = [_groupX, "Fin_random_F",_spawnPosition,[],0,"FORM"] call A3A_fnc_createUnit;
			_dogs pushBack _dog;
			[_dog] spawn A3A_fnc_guardDog;
			sleep 1;
		};

		[_groupX, "Patrol_Area", 25, 150, 300, false, [], false] call A3A_fnc_patrolLoop;
		_groups pushBack _groupX;
		
		{[_x,_markerX] call A3A_fnc_NATOinit; _soldiers pushBack _x} forEach units _groupX;
	};
	_countX = _countX +1;
};