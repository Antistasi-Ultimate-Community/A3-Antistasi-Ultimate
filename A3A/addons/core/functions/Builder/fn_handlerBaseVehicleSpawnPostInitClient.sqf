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

private["_helper"];

getArray(configOf _object >> "hiddenSelections") apply {
    _object setObjectTexture[_x, '#(rgb,512,512,3)text(1,1,"PuristaMedium",0.1,"#0000ff7f","#ff0000","Spawn\nHelper")'];
};

// Preview object; do nothing
if (_object getVariable[QGVAR(isTempObject), false]) exitWith {};

_object setVariable[QGVAR(associatedObjects), []];

// Show VR area circle outside of teardown mode if enabled in settings.
if (GVAR(spawnHelperShowLocation)) then {
    _helper = createVehicleLocal["VR_Area_01_circle_4_yellow_F", getPosATL _object, [], 0, "CAN_COLLIDE"];
    _helper setVectorUp surfaceNormal getPosATL _object;
    _helper setDir getDir _object;
    _object getVariable QGVAR(associatedObjects) pushBack _helper;
};

// Can't attach to temp object because of collision detection thing
_helper = "Sign_Arrow_Direction_Blue_F" createVehicleLocal[0, 0, 0];
_helper attachTo[_object, [0, 0, 1.5]];
_object getVariable QGVAR(associatedObjects) pushBack _helper;

_object addEventHandler["Deleted", {
    params["_object"];
    _object getVariable QGVAR(associatedObjects) apply {
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
