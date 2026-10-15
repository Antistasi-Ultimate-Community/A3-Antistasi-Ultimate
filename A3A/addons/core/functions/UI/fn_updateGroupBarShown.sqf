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

// Read the live HUD state so only the group info bar is touched and every other
// element keeps whatever value another system last set it to.
private _hud = shownHUD;
_hud set [6, missionNamespace getVariable ["A3A_showGroupBar", true]];   // 6 = group info bar
showHUD _hud;
