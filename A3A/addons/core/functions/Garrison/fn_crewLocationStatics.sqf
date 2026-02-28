#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_crewLocationStatics

Description:
    Event handler for "locationSpawned" event to crew statics/vehicles at a
    watchpost, roadblock, etc.

Parameters:
    0: _marker - Location marker name <STRING>
    1: _locationType - Type of location (City, Synd_HQ, emplacements...) <STRING>
    2: _hasSpawned - Whether the location has just been spawned (true) or despawned (false) <BOOL>

Optional:

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
if !(isServer) exitWith { Error("A3A_fnc_crewLocationStatics called on client!") };

if !assert(params[
    ["_marker", nil, [""]],
    ["_locationType", nil, [""]],
    ["_hasSpawned", nil, [false]]
]) exitWith {};

Debug_3("Location spawned at marker=%1, type=%2, spawned=%3",str _marker,str _locationType,str _hasSpawned);

if !(_hasSpawned) exitWith {
    Debug_2("Location %1 at marker %2 despawned, skipping crewing statics",str _locationType,str _marker);
};

if !(_locationType in [
    "RebelAAEmpl",
    "RebelAtEmpl",
    "RebelHmgEmpl",
    "RebelRoadblock"
]) exitWith {
    Debug_1("Not interested in location type %1",str _locationType);
};

[{
    params["_marker","_locationType"];
    Debug_2("Crewing statics/vehicles near %1 marker %2",str _locationType,str _marker);
    [_marker] spawn A3A_fnc_updateRebelStatics;
}, [_marker, _locationType], 5] call CBA_fnc_waitAndExecute;

nil;
