/*
Maintainer: Socrates, based on Wurzel0701's aggro code
    Reduces rivals activity by given amount of activity.

Arguments:
    <NUMBER> The amount of activity to reduce
    <NUMBER> The amount of minutes the activity should decay
    <BOOL> Silent update without visual representation

Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> inactivityStackRivals

Example:
[60, 15] call SCRT_fnc_rivals_reduceActivity;
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params
[
    ["_activityChange", 0, [0]],
    ["_activityTime", 0, [0]],
    ["_silent", false, [false]]
];

if (!areRivalsEnabled) exitWith {};
if (!areRivalsDiscovered) exitWith {};
if (areRivalsDefeated) exitWith {};

_fn_convertMinutesToDecayRate =
{
    params ["_points", "_minutes"];
    if(_minutes == 0) then
    {
        Warning("Minute parameter is 0, assuming 1");
        _minutes = 1;
    };
    (-1) * (_points / _minutes);
};

if(_activityChange == 0) exitWith {};

//Wait until all other activity change operations are done
waitUntil {!activityIsChanging};
activityIsChanging = true;

private _decayRate = [_activityChange, _activityTime] call _fn_convertMinutesToDecayRate;

inactivityStackRivals pushBack [_activityChange, _decayRate];

[_silent] call SCRT_fnc_rivals_calculateActivity;
activityIsChanging = false;
