#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_ace_compat_fnc_onEventClientPlayerSave

Description:
    CBA_EVENT_CLIENT_PLAYER_SAVE event handler.

    Stores player variables from ACE into player's pluginsData.

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
TRACE_1(QFUNC(onEventClientPlayerSave),_this);

if !assert(params[
    ["_pluginsData", nil, [createHashMap]]
]) exitWith {};

private _toSave = createHashMap;

if !([player] call ace_medical_status_fnc_hasStableVitals) then {
    WARNING("Player does not have stable vitals, skipping medical state serialization");
} else {
    _toSave set["medical_state", player call ace_medical_fnc_serializeState];
};

_toSave set["acex_field_rations_hunger", player getVariable["acex_field_rations_hunger", 0]];
_toSave set["acex_field_rations_thirst", player getVariable["acex_field_rations_thirst", 0]];

Info_1("Storing ACE variables into pluginsData: %1",_toSave);

_pluginsData set[QSUBADDON, _toSave];

nil;
