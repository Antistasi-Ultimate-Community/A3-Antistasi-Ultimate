#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_tracklist_editor_fnc_initEvents

Description:
    Set up load/save and music event handlers

Parameters:

Optional:

Example:
    (begin example)
    [] call A3A_ultimate_tracklist_editor_fnc_initEvents;
    (end example)

Returns:
    Nothing

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */
Trace_1(QFUNC(initEvents),_this);

[CBA_EVENT_CLIENT_PLAYER_LOAD, { call FUNC(onPlayerLoadData) }] call CBA_fnc_addEventHandler;
[CBA_EVENT_CLIENT_PLAYER_SAVE, { call FUNC(onPlayerSaveData) }] call CBA_fnc_addEventHandler;

addMusicEventHandler["MusicStop", {
    Trace_2(QFUNC(MusicStop),_this,musicON);
    if !musicON exitWith {
        params["_musicClassname","_eventHandlerId","_currentPosition","_totalLength"];

        // When not almost finished with the track, remove it from the lastTracks array
        if (_currentPosition < _totalLength - 4) then {
            GVAR(lastTracks) = GVAR(lastTracks) - [_musicClassname];
        };
    };

    private _pause = GVAR(pause);
    private _delay = [_pause / 2, _pause] call FUNCMAIN(randomRange);

    Trace_2(QFUNC(MusicStop),_pause,_delay);

    GVAR(waitScript) = [_delay] spawn {
        params["_delay"];
        uiSleep _delay;
        [] call FUNC(playNextTrack);
    };
}];

nil;
