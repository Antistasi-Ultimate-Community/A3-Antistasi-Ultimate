/*
Maintainer: Socrates
    Searches for empty car that is applicable for car demo charge.

Arguments:
    <MARKER> Any marker (usually city or control). 

Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <BOOL> areRivalsEnabled
    <BOOL> areRivalsDefeated
    <BOOL> areRivalsDiscovered
    <INTEGER> inactivityLevelRivals

Example:
[_markerX] call SCRT_fnc_rivals_trySpawnCarDemo;
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params [
    ["_site", "", [""]]
];

if (_site isEqualTo "") exitWith {
    Error("Unknown marker, aborting.");
};

if (!areRivalsEnabled) exitWith {};
if (areRivalsDefeated) exitWith {};
if (!areRivalsDiscovered) exitWith {};
if (!(_site in ([] call SCRT_fnc_rivals_getLocations))) exitWith {};
if (!([] call SCRT_fnc_rivals_rollProbability)) exitWith {};

[getMarkerPos _site] spawn SCRT_fnc_rivals_encounter_carDemo;