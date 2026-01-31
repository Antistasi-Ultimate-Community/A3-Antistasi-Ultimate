#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/* ----------------------------------------------------------------------------
Function: A3A_fnc_crewLocationStatics

Description:
    Event handler for "locationSpawned" event to crew statics/vehicles at a
    watchpost, roadblock, etc.

Parameters:
    0: _marker - Location markler name <STRING>
    1: _emplacementType - Type of emplacement <TYPE>
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
    ["_emplacementType", nil, [""]],
    ["_hasSpawned", nil, [false]]
]) exitWith {};

Debug_3("location spawned at marker=%1, type=%2, spawned=%3",str _marker,str _emplacementType,str _hasSpawned);

if !(_hasSpawned) exitWith {
    Debug_1("Location at marker %1 despawned, skipping crewing statics",str _marker);
};

if !(_emplacementType in [
    "RebelAAEmpl",
    "RebelAtEmpl",
    "RebelHmgEmpl",
    "RebelRoadblock"
]) exitWith {
    Debug_1("Not interested in emplacement type %1",str _emplacementType);
};

Debug_1("Crewing statics/vehicles near marker %1",str _emplacementType);
[_marker] spawn A3A_fnc_updateRebelStatics;

nil;
