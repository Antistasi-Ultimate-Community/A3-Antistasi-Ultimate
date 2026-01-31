/*
    A3A_fnc_updateRebelStatics
    Search rebel marker area for empty statics, move garrison riflemen into them.
    Attempts to find existing local garrison static group, otherwise creates one.

    Arguments:
    0. <Array>, <String> or <Object>. Position/unit within marker or marker name.

    Scope: Wherever you want to put garrison groups, probably server or HC
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_target"];

// If position or object target, identify rebel marker
private _marker = _target;
if !(_target isEqualType "") then {
    // Arbitrary search limit of 500m
    _marker = [_target, 500] call A3A_fnc_nearestFriendlyMarker;
};
if (_marker isEqualTo "") exitWith {};

// Find all non-mortar statics within marker; may include bunkers.
private _statics = staticsToSave select {
    !(_x isKindOf "Air") &&
    { [_x, _marker] call A3A_fnc_isWithinMarkerArea };
};
if (_statics isEqualTo []) exitWith {};

// Find unlocked & unoccupied statics
private _freeStatics = _statics select {
    (isNull gunner _x) &&
    { !(_x getVariable["lockedForAI", false]) }
};
if (_freeStatics isEqualTo []) exitWith {};

// Identify all garrison riflemen in area
private _possibleCrew = allUnits select {
    (isNull objectParent _x) &&
    { _x getVariable ["markerX", ""] isEqualTo _marker } &&
    { _x getVariable ["UnitType", ""] isEqualTo FactionGet(reb,"unitRifle") } &&
    { [_x] call A3A_fnc_canFight } &&
    { [_x, _marker] call A3A_fnc_isWithinMarkerArea }
};
if (_possibleCrew isEqualTo []) exitWith {};

// Identify current local static group for marker, if any
private _staticGroup = grpNull;

_statics findIf {
    private _unit = gunner _x;

    (!isNull _unit) &&
    { local _unit } &&
    { _unit getVariable ["markerX", ""] isEqualTo _marker } &&
    {
        _staticGroup = group _unit;
        true;
    };
};

if (isNull _staticGroup) then {
    _staticGroup = createGroup [teamPlayer, true];
};

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
            // Sanity check; vehicle _can_ be gone, blown up, whatever
            if (isNull _veh) exitWith {};

            {
                if (isNull _veh) exitWith {};
                if (isNull objectParent _x) then {
                    switch (assignedVehicleRole _x) do {
                        case ["Gunner"]: { _x moveInGunner _veh };
                        case ["Commander"]: { _x moveInCommander _veh };
                        case ["Turret"]: {
                            private _path = _x call BIS_func_turretPath;
                            if !(_path isEqualTo []) then {
                                _x moveInTurret [_veh, _path];
                            };
                        };
                    };
                };
            } forEach _units;
        };
    };
    
    _veh setVehicleRadar ([0, 1] select (getNumber(configOf _veh >> "radarType") in [2, 4]));
    
} forEach _freeStatics;

_staticGroup setBehaviour "AWARE";
_staticGroup setCombatMode "WHITE";
