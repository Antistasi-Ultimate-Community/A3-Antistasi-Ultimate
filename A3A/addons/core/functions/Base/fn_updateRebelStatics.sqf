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

private _fnc_scanHorizon = {
    // Start scanning horizon after five seconds
    params["_units"];
    sleep 5;

    _units = _units select { !isNull objectParent _x }; // If assignment still didn't work, don't bother
    _units apply {
        private _vehicle = _x getVariable[QGVAR(assignedVehicle), objNull];

        // If we're in a vehicle with both gunner and commander
        // (i.e. a TANK), don't have both turrets scanning wildly; only
        // have the commander do it. Don't scan if they're in a building.
        if (isNull commander _vehicle || { _x isEqualTo commander _vehicle }) then {
            Debug_2("Scanning horizon for %1 in %2",_x,_vehicle);
            [_x, nil, false] spawn SCRT_fnc_common_scanHorizon;
        };
    };
};

if (_target isEqualType objNull && {unitIsUAV _target}) exitWith { // UAVs (incl SAM / Radar statics) use virtual crew, so bypass checks for locally garrisoned AI
    private _assignedUnits = units ([teamPlayer, _target] call A3A_fnc_createVehicleCrew);
    private _canReport = getNumber(configOf _target >> "reportRemoteTargets") isEqualTo 1; // only radar UAVs need to scan horizon
    if (GVAR(rebelStaticsScanHorizon) && {_canReport}) then { [_assignedUnits] spawn _fnc_scanHorizon }; 
};

// If position or object target, identify rebel marker
private _marker = _target;
if !(_target isEqualType "") then {
    // Arbitrary search limit of 500m
    _marker = [_target, 500] call A3A_fnc_nearestFriendlyMarker;
};
if (_marker isEqualTo "") exitWith {};

// Find all statics within marker; may include bunkers.
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

private _assignedUnits = [];

_freeStatics apply {
    private _vehicle = _x;

    // 1. Get all possible positions
    private _allTurrets = allTurrets _vehicle;
    private _positions = [];

    // 2. Check main positions
    if (isNull gunner _vehicle) then {
        _positions pushBack ["Gunner"];
    };

    if (isNull commander _vehicle) then {
        _positions pushBack ["Commander"];
    };

    // 3. Add turrets
    {
        if (isNull (_vehicle turretUnit _x)) then {
            _positions pushBack ["Turret", _x];
        };
    } forEach _allTurrets;

    // 4. Assign units
    {
        if (_possibleCrew isEqualTo []) then { break };
        private _unit = _possibleCrew deleteAt 0;

        _unit setVariable[QGVAR(assignedVehicle), _vehicle];
        _assignedUnits pushBack _unit;

        _x params["_position",["_turret", nil]];

        switch (_position) do {
            case "Gunner": {
                _unit assignAsGunner _vehicle;
                _unit moveInGunner _vehicle;
            };
            case "Commander": {
                _unit assignAsCommander _vehicle;
                _unit moveInCommander _vehicle;
            };
            case "Turret": {
                if (_turret isNotEqualTo [-1]) then {
                    _unit assignAsTurret [_vehicle, _turret];
                    _unit moveInTurret [_vehicle, _turret];
                };
            };
        };
    } forEach _positions;

    _vehicle setVehicleRadar ([0, 1] select (getNumber(configOf _vehicle >> "radarType") in [2, 4]));
};

// 5. Fix lost assignments
if (_assignedUnits isNotEqualTo []) then {
    [_assignedUnits] joinSilent _staticGroup;
    [_staticGroup, clientOwner] remoteExec ["setGroupOwner", 2];

    // Double check after 1 second
    [_assignedUnits] spawn {
        params ["_units"];
        sleep 1;

        _units select {
            (alive _x) && { isNull objectParent _x } &&
            { !isNull(_x getVariable[QGVAR(assignedVehicle), objNull]) } &&
            { alive(_x getVariable QGVAR(assignedVehicle)) }
        } apply {
            private _unit = _x;
            private _vehicle = _unit getVariable QGVAR(assignedVehicle);
            private _assignedRole = assignedVehicleRole _unit;

            _assignedRole params[["_type", ""], ["_turret", []]];

            switch (toLower _type) do {
                case "gunner": { _x moveInGunner _vehicle };
                case "commander": { _x moveInCommander _vehicle };
                case "turret": { _x moveInTurret[_vehicle, _turret] };
            };
        };
    };

    if GVAR(rebelStaticsScanHorizon) then { [_assignedUnits] spawn _fnc_scanHorizon };
};

_staticGroup setBehaviour "AWARE";
_staticGroup setCombatMode "WHITE";

nil;
