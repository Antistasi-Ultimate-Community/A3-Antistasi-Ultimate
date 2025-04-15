/*
    A3A_fnc_updateRebelStatics
    Search rebel marker area for empty statics, move garrison riflemen into them.
    Attempts to find existing local garrison static group, otherwise creates one.

    Arguments:
    0. <Array> or <String>. Position within marker or marker name.

    Scope: Wherever you want to put garrison groups, probably server or HC
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target"];

// If position or object target, identify rebel marker
private _marker = _target;
if !(_target isEqualType "") then
{
    _marker = "";
    private _markers = markersX select { _target inArea _x && {sidesX getVariable [_x, sideUnknown] == teamPlayer} };
    private _mindist = 10000;
    {
        private _dist = (getMarkerPos _x) distance2d _target;
        if (_dist > _mindist) then { continue };
        _marker = _x; _mindist = _dist;
    } forEach _markers;
};
if (_marker isEqualTo "") exitWith {};

// Find all non-mortar statics within marker
private _statics = staticsToSave inAreaArray _marker;
_statics = _statics select {!(_x isKindOf "StaticMortar") and !(_x isKindOf "Air")};           // may include bunkers. Don't bother with mortars yet //why not bother with mortars?
if (count _statics == 0) exitWith {};

// Find unlocked & unoccupied statics
private _freeStatics = _statics select {
    isNil { _x getVariable "lockedForAI" }
    and isNull (gunner _x)
};
if (count _freeStatics == 0) exitWith {};

// Identify all garrison riflemen in area
private _possibleCrew = allUnits inAreaArray _marker;
_possibleCrew = _possibleCrew select {
    _x getVariable ["markerX", ""] isEqualTo _marker
    and _x getVariable ["UnitType", ""] isEqualTo FactionGet(reb,"unitRifle")
    and isNull objectParent _x
    and [_x] call A3A_fnc_canFight
};
if (count _possibleCrew == 0) exitWith {};

// Identify current local static group for marker, if any
private _staticGroup = grpNull;
{
    private _unit = gunner _x;
    if (isNull _unit or !(local _unit)) then { continue };
    if !(_unit getVariable ["markerX", ""] isEqualTo _marker) then { continue };
    _staticGroup = group _unit; break;
} forEach _statics;

if (isNull _staticGroup) then { _staticGroup = createGroup [teamPlayer, true] };

{
    private _veh = _x;
    private _assignedUnits = [];
    
    // 1. Get all possible positions
    private _allTurrets = allTurrets _veh;
    private _positions = [];
    
    // 2. Check main positions
    if (isNull gunner _veh) then {
        _positions pushBack ["Gunner", [-1]];
    };
    
    if ((_veh emptyPositions "Commander") > 0 && isNull commander _veh) then {
        _positions pushBack ["Commander", [-1]];
    };
    
    // 3. Add turrets
    {
        if (isNull (_veh turretUnit _x)) then {
            _positions pushBack ["Turret", _x];
        };
    } forEach _allTurrets;

    // 4. Assign units
    {
        if (count _possibleCrew == 0) exitWith {};
        private _unit = _possibleCrew deleteAt 0;
        _assignedUnits pushBack _unit;
        
        switch (_x#0) do {
            case "Gunner": {
                _unit assignAsGunner _veh;
                _unit moveInGunner _veh;
            };
            case "Commander": {
                _unit assignAsCommander _veh;
                _unit moveInCommander _veh;
            };
            case "Turret": {
                if !(_x#1 isEqualTo [-1]) then {
                    _unit assignAsTurret [_veh, _x#1];
                    _unit moveInTurret [_veh, _x#1];
                };
            };
        };
    } forEach _positions;

    // 5. Fix lost assignments
    if (count _assignedUnits > 0) then {
        [_assignedUnits] joinSilent _staticGroup;
        [_staticGroup, clientOwner] remoteExec ["setGroupOwner", 2];
        
        // Double check after 1 second
        [_veh, _assignedUnits] spawn {
            params ["_veh", "_units"];
            sleep 1;
            {
                if (isNull objectParent _x) then {
                    switch (assignedVehicleRole _x) do {
                        case ["Gunner"]: { _x moveInGunner _veh };
                        case ["Commander"]: { _x moveInCommander _veh };
                        case ["Turret"]: { 
                            private _path = _x call BIS_fnc_turretPath;
                            if !(_path isEqualTo []) then {
                                _x moveInTurret [_veh, _path];
                            };
                        };
                    };
                };
            } forEach _units;
        };
    };
    
    _veh setVehicleRadar 1;
    
} forEach _freeStatics;

_staticGroup setBehaviour "AWARE";
_staticGroup setCombatMode "YELLOW";
