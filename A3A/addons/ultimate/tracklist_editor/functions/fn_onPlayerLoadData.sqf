#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_onPlayerLoadData

Description:
    CBA event callback when loaded player data is available.

Parameters:
    0: _loadData - Loaded save game data <HASHMAP>

Optional:

Returns:
    Nothing

Environment:
    Client, Unscheduled

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(onPlayerLoadData),_this);

if !assert(params[
    ["_loadData", nil, [createHashMap]]
]) exitWith {};

GVAR(tracks) = _loadData get QGVAR(tracks);

if (isNil QGVAR(tracks)) then {
    Info("No saved tracks found, using tracks from config");
    GVAR(tracks) = false;
} else {
    Info("Loading saved playlist");

    if !(GVAR(tracks) isEqualType []) then {
        Warning("Invalid playlist data type, initializing with config instead");
        Trace_1("invalid value",GVAR(tracks));

        GVAR(tracks) = false;
    };
};

if (GVAR(tracks) isNotEqualTo false) then {
    GVAR(tracks) = createHashMapFromArray GVAR(tracks);
} else {
    GVAR(tracks) = createHashMap;

    ["Combat","Stealth","Night","Default"] apply {
        private _key = toLower _x;
        GVAR(tracks) set[_key, getArray(configFile >> QUOTE(PREFIX) >> QGVAR(Config) >> "Tracks" >> _x >> "tracks")];
    };
};

Trace_1("loaded",GVAR(tracks));

nil;
