/*
Maintainer: Socrates, based on Wurzel0701's aggro code
    Rolls probability of something happening tied to current rivals inactivity.

Arguments:
    <NUMBER> The amount of activity to reduce
    <NUMBER> The amount of minutes the aggro should decay

Return Value:
    <BOOL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NUMBER> inactivityLevelRivals

Example:
[] call SCRT_fnc_rivals_rollProbability;
*/


if (!areRivalsEnabled || {!areRivalsDiscovered || {areRivalsDefeated}}) exitWith {
    false;
};

private _gate = (100 - 20 * inactivityLevelRivals) max 0;

(random 100) < _gate
