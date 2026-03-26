#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_despawnQueueProcessor

Description:
    Periodically process entity despawn queue, removing entities that have been
    marked for cleanup after a certain amount of time has passed.

Parameters:

Optional:

Returns:
    Nothing

Environment:
    Server, Scheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(despawnQueueProcessor),_this);

if (isNil QGVAR(despawnQueue)) then {
    GVAR(despawnQueue) = [];
};

Info_1("Processing despawn queue with %1 entities.",count GVAR(despawnQueue));

// Block queue
GVAR(despawnerRunning) = true;

// Process queue
GVAR(despawnQueue) = GVAR(despawnQueue) select {
    // Already deleted by somebody else or invalid
    if (isNull _x || { isNil(_x getVariable QGVAR(despawnTTL)) }) then { continueWith false };

    // Still alive, retain queue entry
    if (alive _x) then { continueWith true };

    // First seen dead; mark time of death
    if (isNil(_x getVariable QGVAR(despawnTime))) then {
        private _ttl = _x getVariable QGVAR(despawnTTL);
        _x setVariable[QGVAR(despawnTime), diag_tickTime + _ttl];
    };

    // Check expiration date
    private _time = _x getVariable QGVAR(despawnTime);
    if (_time > diag_tickTime) then { continueWith true };

    // Get with the cleaning
    Verbose_1("Entity %1 is dead long enough; despawning now.",_x);

    group _x deleteGroupWhenEmpty true;

    if !(_x isKindOf "CAManBase" || {isNull objectParent _x}) then {
        deleteVehicle _x;
    } else {
        (objectParent _x) deleteVehicleCrew _x;
    };

    false;
};

Info_1("Despawn queue processor retained %1 entities.",count GVAR(despawnQueue));

// Unblock queue
missionNamespace setVariable[QGVAR(despawnerRunning), nil];

// Rerun this after a minute
[FUNCMAIN(despawnQueueProcessor), nil, GVAR(despawnQueueProcessorDelay)] call CBA_fnc_waitAndExecute;

nil;
