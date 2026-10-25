#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_dynamic_hover_menu_fnc_doRebuildAssets

Description:
    Callback to execute rebuild assets command

Parameters:
    0: _marker - the marker to rebuild assets at <STRING>
    1: _player - player executing the callback <OBJECT>

Optional:

Example:

Returns:
    Nothing

Environment:
    Client, Scheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(doRebuildAssets),_this);

if !assert(params[
    ["_marker", nil, [""]],
    ["_player", nil, [objNull]]
]) exitWith {};

if !assert(MARKER_EXISTS(_marker)) exitWith {};
if !assert(!isNull _player) exitWith {};

// BIS_fnc_guiMessage needs scheduled env
if !(canSuspend) exitWith { _this spawn FUNC(doRebuildAssets) };

private _cost = 5000;
if (_marker in mrkAntennas) then { _cost = 3500; };

private _civFaction = missionNamespace getVariable ["A3A_faction_civ", createHashMap];
private _currencySymbol = _civFaction getOrDefault ["currencySymbol", "$"];

private _messageText = format ["<t align='center'>%1<br/><br/>%2</t>", format [localize "STR_A3U_CONTEXT_REBUILD_COST", _cost, _currencySymbol], localize "STR_A3U_CONTEXT_REBUILD_CONFIRM"];

private _result = [
    parseText _messageText, 
    localize "STR_antistasi_dialogs_hq_garrisons_rebuild_assets_button", 
    true, 
    true, 
    uiNamespace getVariable QGVAR(mapDisplay)
] call BIS_fnc_guiMessage;

if (_result) then {
    [_marker, markerPos _marker] call A3A_fnc_rebuildAssets;
};

nil;
