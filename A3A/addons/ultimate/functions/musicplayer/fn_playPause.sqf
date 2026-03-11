// fn_playPause.sqf
/*  
    Author: wersal

    Description:
        Handles the play/pause button.
        For music mode: toggles playback, saves paused position.
        For sound mode: starts or stops sound via remote execution.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

if (A3U_playbackMode == "music") then {
    // music mode
    if (A3U_isPlaying) then {
        // Pause
        A3U_playerState set [1, false];
        A3U_playerState set [2, A3U_trackProgress];
        A3U_pausedProgress = A3U_trackProgress;
        playMusic "";
        A3U_isPlaying = false;
    } else {
        if (A3U_currentTrack isEqualTo []) then {
            private _tracksList = (findDisplay 85000) displayCtrl 85102;
            if (lbSize _tracksList > 0) then {
                _tracksList lbSetCurSel 0;
            };
        } else {
            [] call A3U_fnc_playTrack;
        };
    };
} else {
    // Sound mode
    private _target = uiNamespace getVariable ["A3U_soundTarget", objNull];
    if (isNull _target) exitWith { systemChat localize "STR_A3U_error_no_object"; };

    if (A3U_isPlaying) then {
        // Stop sound – delete all sources on clients
        [_target] remoteExec ["A3U_fnc_stopSound", 0];
        A3U_isPlaying = false;
    } else {
        // Start current sound
        [] call A3U_fnc_playTrack;
    };
};

[] call A3U_fnc_updatePlayButton;