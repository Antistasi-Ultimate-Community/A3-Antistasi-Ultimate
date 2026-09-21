/*
Author: Maxhdez
    Shows/hides the vanilla group info bar (squad bar) according to the A3A_showGroupBar parameter.

Arguments:
    -

Return Value:
    <NIL>

Scope: Client
Environment: Unscheduled
Public: No
Dependencies:
    <BOOLEAN> A3A_showGroupBar

Example:
    [] call A3A_fnc_updateGroupBarShown;
*/

if (!hasInterface) exitWith {};

private _state = missionNamespace getVariable ["A3A_showGroupBar", true];

// showHUD has no getter, so the element array is cached in A3A_hudState to avoid
// clobbering elements another system may have changed. Index 6 is the group info bar.
private _hudState = missionNamespace getVariable ["A3A_hudState", [true, true, true, true, true, true, true, true]];
_hudState set [6, _state];
A3A_hudState = _hudState;

showHUD _hudState;
