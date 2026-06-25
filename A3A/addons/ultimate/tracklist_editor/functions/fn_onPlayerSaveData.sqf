#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_onPlayerSaveData

Description:
    CBA event callback when player data is supposed to be augmented.

Parameters:
    0: _saveData - Save game data <HASHMAP>

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onPlayerSaveData),_this);

if !assert(params[
    ["_saveData", nil, [createHashMap]]
]) exitWith {};

if assert(GVAR(tracks) isEqualType createHashMap) then {
    _saveData set[QGVAR(tracks), +GVAR(tracks)];
};

nil;
