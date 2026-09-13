#include "..\..\script_component.hpp"
#include "placerDefines.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_initBuilderCollisionHelper

Description:
    Run the collision helper while builder mode is active.

    Prevents wreaking havoc with the temp object on objects in the build radius.

Parameters:
    0: _centerObject - The object around which we're building <OBJECT>
    1: _buildingRadius - The radius around the center object within which building is allowed <NUMBER>

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(initBuilderCollisionHelper),_this);

#define HASH_OF(thing) ((thing) getVariable[QGVAR(uuid), ""])

if !assert(params[
    ["_centerObject", nil, [objNull]],
    ["_buildingRadius", nil, [0]]
]) exitWith {};
if !assert(!isNull _centerObject) exitWith {};

if (!isNil QGVAR(builderPreventCollisions) && { !GVAR(builderPreventCollisions) }) exitWith {
    Warning_1("Debug flag %1 is set, skipping builder collision helper",QGVAR(builderPreventCollisions));
};

// Global variables init
GVAR(builderCollisionEvent) = [] call CBA_fnc_createUUID;
GVAR(builderKnownObjects) = [];
GVAR(builderLastHash) = "";

// This is always called by the trigger. Let's not worry about whether the
// damned trigger actually does its damned job and, you know, triggers.
FUNC(builderCollisionHelperTriggerCondition) = {
    params["","","_triggerObjects"];

    private _new = _triggerObjects - GVAR(builderKnownObjects);
    GVAR(builderKnownObjects) append _new;

    if (_new isNotEqualTo []) then {
        Debug_1("New collision objects: %1",_new);
        [GVAR(builderCollisionEvent), [_new]] spawn CBA_fnc_localEvent;
    };

    false;
};

// Temporary event handler when new objects are found in the trigger area.
// Update collision detection for temporary object and everything new.
private _eh = [GVAR(builderCollisionEvent), {
    params["_objects"];

    // During placer shutdown the DB or temp object may already be gone.
    if (isNil "A3A_building_EHDB") exitWith {};

    private _tempObject = A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT;
    if (isNull _tempObject) exitWith {};

    // Ignore null objects and the temp object itself.
    private _validObjects = _objects select { !isNull _x && { _x != _tempObject } };
    if (_validObjects isEqualTo []) exitWith {};

    Debug_2("builder-eh(%1): %2",GVAR(builderCollisionEvent),_validObjects);
    _validObjects apply { _tempObject disableCollisionWith _x };
}] call CBA_fnc_addEventHandler;

// Spools us up a routine to check whether the temporary builder object has
// changed. Reset known objects so the new temp object gets the full list.
FUNC(builderCollisionHelperObjectUpdate) = {
    waitUntil { isNil "A3A_building_EHDB" || { GVAR(builderLastHash) isNotEqualTo HASH_OF(A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT) } };
    if (isNil "A3A_building_EHDB") exitWith {};

    private _tempObject = A3A_building_EHDB get BUILD_OBJECT_TEMP_OBJECT;
    _tempObject setPhysicsCollisionFlag false;

    // This happens between "createVehicleLocal" and "setVariable[uuid]"
    waitUntil { HASH_OF(_tempObject) isNotEqualTo "" };

    GVAR(builderLastHash) = HASH_OF(_tempObject);
    GVAR(builderKnownObjects) = [];

    // Did you mean: recursion?
    [] spawn FUNC(builderCollisionHelperObjectUpdate);
};

[] spawn FUNC(builderCollisionHelperObjectUpdate);

// Create the trigger that will detect new objects in the build area. I'd surely
// like to use the trigger and its "activation" callback, but the latter only
// seems to fire once. So we're doing the detection in the condition instead.
// Also, don't call me Shirley.
private _trigger = createTrigger["EmptyDetector", position _centerObject, false];

// Make radius a little bigger. Temp object can't move outside the radius, but
// fast objects might be too fast for the trigger's default 0.5 polling
// interval.
_trigger setTriggerArea[_buildingRadius + 25, _buildingRadius + 25, 0, false];
_trigger setTriggerActivation["ANY", "PRESENT", true];
_trigger setTriggerStatements[
    QUOTE([ARR_3(this,thisTrigger,thisList)] call FUNC(builderCollisionHelperTriggerCondition)),
    QUOTE(nil), QUOTE(nil)
];

// Main loop. Just wait until builder mode terminates.
Info("Entering builder collision helper loop");
waitUntil { isNil "A3A_building_EHDB" };
Info("Exited builder collision helper loop");

// Cleanup. Kill the trigger and temporary event handler.
deleteVehicle _trigger;
[GVAR(builderCollisionEvent), _eh] call CBA_fnc_removeEventHandler;
GVAR(builderCollisionEvent) = nil;
GVAR(builderKnownObjects) = nil;

nil;
