#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_verifyLoadedTracks

Description:
    Verify loaded tracks data from player save data.

Parameters:

Optional:

Example:

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(verifyLoadedTracks),_this);

INFO("Custom playlist not loaded, initializing...");

if (isNil QGVAR(tracks)) then {
    INFO("No saved tracks found, using tracks from config");
    GVAR(tracks) = false;
} else {
    INFO("Loading saved playlist");

    if !(GVAR(tracks) isEqualType []) then {
        WARNING("Invalid playlist data type, initializing with config instead");
        TRACE_1("invalid value",GVAR(tracks));

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

TRACE_1("loaded",GVAR(tracks));

nil;
