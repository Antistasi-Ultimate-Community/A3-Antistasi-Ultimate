#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_despawnQueueEntity

Description:
    Queue an entity into despawn queue.

    Entities are processed by the despawn queue processor after their death
    occured and a certain amount of time (TTL) has passed. 

    Alive entities will be retained in the queue until they die, at which point
    they're then processed as described above.

Parameters:
    0: _entity - The entity to be queued for despawn <OBJECT>

Optional:
    1: _ttl - Time to live for the entity in the despawn queue after its death <NUMBER>
        Default: `cleantime` server variable

Example:
    (begin example)
    [someUnit] call A3A_fnc_despawnQueueEntity;
    [someUnit, 120] call A3A_fnc_despawnQueueEntity; // Queue with custom TTL of 2 minutes
    (end example)

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNCMAIN(despawnQueueEntity),_this);

if !assert(isServer) exitWith { Error("Function can only be called on the server.") };

_this spawn {
    if !assert(params[
        ["_entity", nil, [objNull]]
    ]) exitWith {};
    if (isNull _entity) exitWith {};

    waitUntil { isNil QGVAR(despawnerRunning) };

    private _ttl = params[1, cleantime, [0]];

    _entity setVariable[QGVAR(despawnTTL), _ttl];
    GVAR(despawnQueue) pushBackUnique _entity;

    Debug_2("Entity %1 queued for despawn with TTL of %2 seconds.",_entity,_ttl);
};

nil;
