#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_dynamic_hover_menu_fnc_canFastTravel

Description:
    Condition callback for fast travel action

Parameters:
    0: _marker - name of the map marker <STRING>
    1: _player - the player object <OBJECT>

Optional:

Example:

Returns:
    <BOOL> indicating whether fast travel is possible

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(canFastTravel),_this);

if !assert(params[
    ["_marker", nil, [""]],
    ["_player", nil, [objNull]]
]) exitWith { false };

(limitedFT != 3) &&
{ sidesX getVariable[_marker, sideUnknown] isEqualTo teamPlayer } &&
{ !([_marker] call A3A_fnc_isSiteDestroyed) };
