#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3USPCM_music_fnc_overrideMusic

Description:
    Override default music script

Parameters:

Optional:

Example:
    (begin example)
    [] call A3USPCM_music_fnc_overrideMusic;
    (end example)

Returns:
    Nothing

Author:
    goreSplatter
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(overrideMusic),_this);

GVAR(A3A_fnc_music) = A3A_fnc_music;
A3A_fnc_music = {
    call FUNC(music);
};

addMusicEventHandler["MusicStop", {
    TRACE_2(QFUNC(MusicStop),_this,musicON);
    if !musicON exitWith {
        params["_musicClassname","_eventHandlerId","_currentPosition","_totalLength"];

        // When not almost finished with the track, remove it from the lastTracks array
        if (_currentPosition < _totalLength - 4) then {
            GVAR(lastTracks) = GVAR(lastTracks) - [_musicClassname];
        };
    };

    private _pause = GVAR(pause);
    private _delay = [_pause / 2, _pause] call FUNCMAIN(utilRandomRange);

    TRACE_2(QFUNC(MusicStop),_pause,_delay);

    GVAR(waitScript) = [_delay] spawn {
        params["_delay"];
        uiSleep _delay;
        [] call FUNC(playNextTrack);
    };
}];

nil;
