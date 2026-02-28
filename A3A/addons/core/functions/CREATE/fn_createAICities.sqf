#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer and hasInterface) exitWith{};

params ["_markerX"];

private _groups = [];
private _soldiers = [];
private _dogs = [];

private _positionX = getMarkerPos _markerX;

private _num = [_markerX] call A3A_fnc_sizeMarker;
private _patrolSize = _num;

private _sideX = sidesX getVariable [_markerX,sideUnknown];
private _faction = Faction(_sideX);

if ((markersX - controlsX - milAdministrationsX) findIf {(getMarkerPos _x inArea _markerX) and (sidesX getVariable [_x,sideUnknown] != _sideX)} != -1) exitWith {};
_num = round (_num / 100);

ServerInfo_1("Spawning City Patrol in %1", _markerX);

private _dataX = server getVariable _markerX;
private _prestigeOPFOR = _dataX select 2;
private _prestigeBLUFOR = _dataX select 3;

private _isAAF = true;
private _params = nil;
if (_markerX in destroyedSites) then {
	_isAAF = false;
	_params = [_positionX,Invaders, selectRandom (_faction get "groupSpecOpsRandom")];
} else {
	_num = round (_num * (_prestigeOPFOR + _prestigeBLUFOR)/100);
	private _frontierX = [_markerX] call A3A_fnc_isFrontline;
	if (_frontierX) then {
		_num = _num * 2;
		_params = [_positionX, Occupants, (selectRandom ([_faction, "groupsTierSmall"] call SCRT_fnc_unit_flattenTier))];
	} else {
		_params = [_positionX, Occupants, _faction get "groupPolice"];
	};
};
if (_num < 1) then {_num = 1};

private _countX = 0;
private _groupX = nil;
private _roadPositions = (_positionX nearRoads round(_patrolSize / 2));

private _civNonHuman = Faction(civilian) getOrDefault ["attributeCivNonHuman", false];

if (_civNonHuman && {(selectRandom [1,2,3]) isEqualTo 2}) exitWith {
	["locationSpawned", [_markerX, "City", true]] call EFUNC(Events,triggerEvent);

	waitUntil {sleep 1;(spawner getVariable _markerX == 2)};

	["locationSpawned", [_markerX, "City", false]] call EFUNC(Events,triggerEvent);
};

while {(spawner getVariable _markerX != 2) and (_countX < _num)} do {
	private _spawnPosition = [];

	if (count _roadPositions >= 1) then {
		_spawnPosition = selectRandom _roadPositions;
		_roadPositions deleteAt (_roadPositions find _spawnPosition);
	} else {
		_spawnPosition = _positionX;
	};

	_groupX = [_spawnPosition, (_params # 1), (_params # 2)] call A3A_fnc_spawnGroup;

	// Forced non-spawner for performance and consistency with other garrison patrols
	{
		[_x, "", false] call A3A_fnc_NATOinit; 
		_soldiers pushBack _x;
	} forEach units _groupX;

	sleep 1;

	// Only spawn dog units with Occupant forces.
	if (_isAAF) then {
		if (random 10 < 2.5) then {
			private _dog = [_groupX, "Fin_random_F", _spawnPosition, [], 0, "FORM"] call A3A_fnc_createUnit;
			_dogs pushBack _dog;
			[_dog] spawn A3A_fnc_guardDog;
		};
	};
	[_groupX, "Patrol_Area", 25, 150, 150, false, _positionX, true] call A3A_fnc_patrolLoop;
	_groups pushBack _groupX;
	_countX = _countX + 1;
};

["locationSpawned", [_markerX, "City", true]] call EFUNC(Events,triggerEvent);

waitUntil {sleep 1;(spawner getVariable _markerX == 2)};

{if (alive _x) then {deleteVehicle _x}} forEach _soldiers;
{deleteVehicle _x} forEach _dogs;
{ deleteGroup _x } forEach _groups;

["locationSpawned", [_markerX, "City", false]] call EFUNC(Events,triggerEvent);
