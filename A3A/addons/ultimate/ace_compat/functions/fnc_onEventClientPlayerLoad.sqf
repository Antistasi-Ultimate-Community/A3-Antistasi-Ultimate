#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_ace_compat_fnc_onEventClientPlayerLoad

Description:
    CBA_EVENT_CLIENT_PLAYER_LOAD event handler.

    Restore ACE player variables from player's pluginsData.

Parameters:
    0: _pluginsData - Custom save data for player <HASHMAP>

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(onEventClientPlayerLoad),_this);

if !assert(params[
    ["_pluginsData", nil, [createHashMap]]
]) exitWith {};

private _aceData = _pluginsData get QSUBADDON;

if (isNil "_aceData") exitWith {
    WARNING("No ACE data found in pluginsData, skipping ACE variable restoration");
    nil;
};

Info_1("Loading ACE variables from pluginsData: %1",_aceData);

if ("medical_state" in _aceData) then {
    [player, _aceData get "medical_state"] call ace_medical_fnc_deserializeState;
};

player setVariable["acex_field_rations_hunger", _aceData getOrDefault["acex_field_rations_hunger", 0]];
player setVariable["acex_field_rations_thirst", _aceData getOrDefault["acex_field_rations_thirst", 0]];

nil;
