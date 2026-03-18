#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_handlerBaseVehicleSpawnPostInitClient

Description:
    CBA extended post-init handler for base vehicle spawn helper arrow buildable
    objects (client side).

Parameters:
    0: _object - Spawn helper arrow object <OBJECT>

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(handlerBaseVehicleSpawnPostInitClient),_this);

if !assert(params[
    ["_object", nil, [objNull]]
]) exitWith {};
if !assert(!isNull _object) exitWith {};

// Preview object; do nothing
if (_object getVariable[QGVAR(isTempObject), false]) exitWith {};

// Can't attach to temp object because of collision detection thing
private _helper = "Sign_Arrow_Direction_Blue_F" createVehicleLocal position _object;
_helper attachTo[_object, [0, 0, 1.5]];

_object addEventHandler["Deleted", {
    params["_object"];
    attachedObjects _object apply {
        deleteVehicle _x;
    };
}];

// Object created in base builder preview
if !(isNil "A3A_building_EHDB") exitWith {};

_object hideObject true;
_helper hideObject true;

GVAR(builderObjectsHidden) pushBackUnique _helper;
GVAR(builderObjectsHidden) pushBackUnique _object;

nil;
