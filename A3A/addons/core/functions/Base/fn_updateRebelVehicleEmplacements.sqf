/*
    A3A_fnc_updateRebelVehicleEmplacements
    Search rebel marker area for empty vehicles(that are meant to be garrisoned), move garrison riflemen into them.
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

// Find all non-mortar vehicles within marker
private _vehicles = vehiclesToSave inAreaArray _marker;
_vehicles = _vehicles select { !(_x isKindOf "StaticWeapon") and !(_x isKindOf "StaticMortar") and !(_x isKindOf "Air")};           // we don't air vehicles(yet), if we find a way to either prevent ai from leaving the area or we have an ability to store their original position
if (count _vehicles == 0) exitWith {};

// Find unlocked & unoccupied vehicles
private _freeVehicless = _vehicles select {
    isNil { _x getVariable "lockedForAI" }
    and isNull (gunner _x) 
    and isNull (driver _x)
};
if (count _freeVehicles == 0) exitWith {};

// Identify all garrison riflemen in area
private _possibleCrew = allUnits inAreaArray _marker;
_possibleCrew = _possibleCrew select {
    _x getVariable ["markerX", ""] isEqualTo _marker
    and _x getVariable ["UnitType", ""] isEqualTo FactionGet(reb,"unitRifle")
    and isNull objectParent _x
    and [_x] call A3A_fnc_canFight
};
if (count _possibleCrew == 0) exitWith {};

// Identify current local vehicle group for marker, if any
private _vehiclesGroup = grpNull;
{
    private _unit = gunner _x;
    if (isNull _unit or !(local _unit)) then { continue };
    if !(_unit getVariable ["markerX", ""] isEqualTo _marker) then { continue };
    _vehiclesGroup = group _unit; break;
} forEach _vehicles;

if (isNull _vehiclesGroup) then { _vehicleGroup = createGroup [teamPlayer, true] };

{
    if (count _possibleCrew == 0) exitWith {};
    private _unit = _possibleCrew deleteAt 0;
    [_unit] joinSilent _vehicleGroup;
    [_x, clientOwner] remoteExec ["setOwner", 2];                      // otherwise unit tends to jump back off for some reason
    [_vehicleGroup, clientOwner] remoteExec ["setGroupOwner", 2];            // required because joinSilent won't switch locality if the group is empty

    // Wait until the unit is local before we do anything else
    [_unit, _x] spawn {
        params ["_unit", "_vehicle"];
        private _timeout = time + 10;
        waitUntil { sleep 1; _timeout < time or (local _unit and local _vehicle) };
        if (isNull objectParent _unit and isNull gunner _vehicle and isNull objectParent _vehicle and isNull attachedTo _vehicle) then {
            _unit assignAsGunner _vehicle;
            _unit moveInGunner _vehicle;
        };
    };
} forEach _freeVehicles;
