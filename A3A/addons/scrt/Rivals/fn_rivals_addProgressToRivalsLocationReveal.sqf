/*
Maintainer: Socrates
    Adds or reduces next rivals location reveal so players can attack it.

Arguments:
    <NUMBER> The amount of reveal to add

Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NUMBER> nextRivalsLocationReveal

Example:
[60] call SCRT_fnc_rivals_addProgressToRivalsLocationReveal;
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

#define GATE 100

params ["_value"];


private _newValue = nextRivalsLocationReveal + _value;

if (([] call SCRT_fnc_rivals_getLocations) isEqualTo []) exitWith {};

if (_newValue > GATE) then {
    Info("Gate value exceeded, revealing new location...");
    nextRivalsLocationReveal = 0;  
    [] call SCRT_fnc_rivals_revealLocation;
} else {
    Info_1("New nextRivalsLocationReveal value: %1",str _newValue);
    nextRivalsLocationReveal = _newValue;
};

publicVariable "nextRivalsLocationReveal";
