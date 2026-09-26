#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_dynamic_hover_menu_fnc_canRebuildAssets

Description:
    Condition callback for rebuild assets action

Parameters:
    0: _marker - name of the map marker <STRING>
    1: _player - the player object <OBJECT>

Optional:

Example:

Returns:
    <BOOL> indicating whether rebuilding assets is possible

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(canRebuildAssets),_this);

if !assert(params[
    ["_marker", nil, [""]],
    ["_player", nil, [objNull]]
]) exitWith { false };

if (_player isNotEqualTo theBoss || { !([_marker] call FUNCMAIN(isSiteDestroyed)) }) exitWith { false };
if (_marker in citiesX) exitWith { false };
if (sidesX getVariable[_marker, sideUnknown] isEqualTo teamPlayer) exitWith { true };

private _isRadioTower = _marker in mrkAntennas;
private _nearestTerritoryIsPlayer = true;

if (_isRadioTower) then {
    private _mainMarkers = (resourcesX + airportsX + factories + outposts + seaports + milbases) - controlsX;
    private _nearestTerritory = [_mainMarkers, markerPos _marker] call BIS_fnc_nearestPosition;
    if (sidesX getVariable[_nearestTerritory, sideUnknown] != teamPlayer) then {
        _nearestTerritoryIsPlayer = false;
    };
};

(_isRadioTower && _nearestTerritoryIsPlayer);
