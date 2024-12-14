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

/* {
    if (count _possibleCrew == 0) exitWith {};
    private _unit = _possibleCrew deleteAt 0;
    [_unit] joinSilent _staticGroup;
    [_x, clientOwner] remoteExec ["setOwner", 2];                      // otherwise unit tends to jump back off for some reason
    [_staticGroup, clientOwner] remoteExec ["setGroupOwner", 2];            // required because joinSilent won't switch locality if the group is empty

    // Wait until the unit is local before we do anything else
    [_unit, _x] spawn {
        params ["_unit", "_static"];
        private _timeout = time + 10;
        waitUntil { sleep 1; _timeout < time or (local _unit and local _static) };
        if (isNull objectParent _unit and isNull gunner _static and isNull objectParent _static and isNull attachedTo _static) then {
            _unit assignAsGunner _static;
            _unit moveInGunner _static;
        };
    };
    _x setVehicleRadar 1;
} forEach _freeStatics;
 */


{
    if ((_x emptyPositions "Commander") == 0) then {
        if (count _possibleCrew == 0) exitWith {};
        private _unit = _possibleCrew deleteAt 0;
        [_unit] joinSilent _staticGroup;
        [_x, clientOwner] remoteExec ["setOwner", 2];                      // otherwise unit tends to jump back off for some reason
        [_staticGroup, clientOwner] remoteExec ["setGroupOwner", 2];            // required because joinSilent won't switch locality if the group is empty
        // Wait until the unit is local before we do anything else
        [_unit, _x] spawn {
            params ["_unit", "_static"];
            private _timeout = time + 10;
            waitUntil { sleep 1; _timeout < time or (local _unit and local _static) };
            if (isNull objectParent _unit and isNull gunner _static and isNull objectParent _static and isNull attachedTo _static) then {
                _unit assignAsGunner _static;
                _unit moveInGunner _static;
            };
        };
        _x setVehicleRadar 1;
    } else {
        if (count _possibleCrew == 0) exitWith {};
        private _unitGunner = _possibleCrew deleteAt 0; 
        private _unitCommander = _possibleCrew deleteAt 1;

        [_unitGunner] joinSilent _staticGroup;
        [_unitCommander] joinSilent _staticGroup; 

        [_x, clientOwner] remoteExec ["setOwner", 2];
        [_staticGroup, clientOwner] remoteExec ["setGroupOwner", 2]; 

        [_unitGunner, _unitCommander, _x] spawn {
            params ["_unitGunner", "_unitCommander", "_static"];
            private _timeout = time + 10;
            waitUntil { sleep 1; _timeout < time or (local _unitGunner and local _unitCommander and local _static) };
            if (isNull objectParent _unitGunner and isNull gunner _static and isNull objectParent _static and isNull attachedTo _static) then {
                _unitGunner assignAsGunner _static;
                _unitGunner moveInGunner _static;
            };
            if (isNull objectParent _unitCommander and isNull commander _static and {count crew _static < 2}) then {
                _unitCommander assignAsCommander _static;
                _unitCommander moveInCommander _static;
            };
        };
        _x setVehicleRadar 1;
    };
} forEach _freeStatics;