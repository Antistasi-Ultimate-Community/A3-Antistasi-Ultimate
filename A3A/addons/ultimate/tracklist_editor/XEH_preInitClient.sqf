#include "script_component.hpp"

GVAR(lastTracks) = [];
GVAR(tracks) = nil;
GVAR(waitScript) = nil;

[CBA_EVENT_CLIENT_PLAYER_LOAD, {
    if assert(params[["_saveData", nil, [createHashMap]]]) then {
        GVAR(tracks) = _saveData get QGVAR(tracks);
        [] call FUNC(loadTracks);
    };
}] call CBA_fnc_addEventHandler;

[CBA_EVENT_CLIENT_PLAYER_SAVE, {
    if assert(params[["_saveData", nil, [createHashMap]]]) then {
        if (GVAR(tracks) isEqualType createHashMap) then {
            _saveData set[QGVAR(tracks), +GVAR(tracks)];
        };
    };
}] call CBA_fnc_addEventHandler;

nil;
