#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_playTrack

Description:
    Play a track

Parameters:
    0: _track - Track name <STRING>

Optional:
    1: _remember - save to "last played" buffer (default: true) <BOOL>

Example:
    (begin example)
    ["Track08_Night_ambient"] call A3A_ultimate_tracklist_editor_fnc_playTrack;
    ["Track08_Night_ambient", false] call A3A_ultimate_tracklist_editor_fnc_playTrack;
    (end example)

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(playTrack),_this);

params[
    ["_track",nil,[""]],
    ["_remember",true,[true]]
];

if !assert(!isNil "_track") exitWith {};

if _remember then {
    GVAR(lastTracks) pushBack _track;

    while { count GVAR(lastTracks) > REMEMBER_TRACKS } do {
        GVAR(lastTracks) deleteAt 0;
    };
};

1.25 fadeMusic GVAR(volume);
playMusic _track;

nil;
