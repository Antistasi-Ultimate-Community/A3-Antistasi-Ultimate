// fn_playTrack.sqf
/*  
    Author: wersal

    Description:
        Starts playback of the current track (music) or sound.
        For music, uses playMusic with possible offset.
        For sound, calls fn_playSound3D via remoteExec.

    Params:
        None

    Returns:
        Nothing

    License: VPN-DPC
*/

#include "..\..\script_component.hpp"

if (A3U_currentTrack isEqualTo []) exitWith {
    systemChat localize "STR_A3U_error_no_track";
};

// Save state
A3U_playerState = [
    A3U_currentTrack,
    true,
    A3U_trackProgress,
    A3U_volume,
    A3U_trackStartTime,
    A3U_currentTrackList,
    A3U_currentTrackIndex,
    A3U_currentCategory,
    A3U_categoryMode,
    A3U_muted,
    A3U_shuffleEnabled,
    A3U_loopEnabled,
    A3U_playbackMode
];

private _itemClass = A3U_currentTrack#1;
private _display = findDisplay 85000;

if (A3U_playbackMode == "music") then {
    // Music mode
    if (A3U_isPlaying) then {
        0.5 fadeMusic 0;
        playMusic "";
    };

    private _startTime = 0;
    private _config = configFile >> "CfgMusic" >> _itemClass;
    private _duration = getNumber (_config >> "duration");
    if (_duration > 0 && A3U_trackProgress > 0) then {
        _startTime = A3U_trackProgress * _duration;
    };

    playMusic [_itemClass, _startTime];
    A3U_isPlaying = true;
    A3U_trackStartTime = diag_tickTime - _startTime;

    // Volume control
    if (A3U_muted) then {
        0 fadeMusic 0;
    } else {
        private _boostFactor = [1, 2, 3, 4, 5] select A3U_boostLevel;
        0.5 fadeMusic (A3U_volume * _boostFactor);
    };

} else {
    // Sound mode
    private _target = uiNamespace getVariable ["A3U_soundTarget", objNull];
    if (isNull _target) exitWith { systemChat localize "STR_A3U_error_no_object_specified"; };

    private _soundClass = A3U_currentTrack#1;
    private _volume = sliderPosition (_display displayCtrl 85107);
    private _pitch = 1; // can add a pitch slider later

    // Get current settings
    private _loudspeaker = A3U_loudspeaker;
    private _boost = A3U_boostLevel;

    // Play for all clients
    [_target, _soundClass, _volume, _pitch, _loudspeaker, _boost] remoteExec ["A3U_fnc_playSound3D", 0];

    A3U_isPlaying = true;
    A3U_trackStartTime = diag_tickTime;

    // Save state on server for JIP
    if (isServer) then {
        A3U_currentSound = _soundClass;
        A3U_soundTarget = _target;
        A3U_soundVolume = _volume;
        A3U_soundPitch = _pitch;
        A3U_loudspeakerState = _loudspeaker;
        A3U_boostLevelState = _boost;
        publicVariable "A3U_currentSound";
        publicVariable "A3U_soundTarget";
        publicVariable "A3U_soundVolume";
        publicVariable "A3U_soundPitch";
        publicVariable "A3U_loudspeakerState";
        publicVariable "A3U_boostLevelState";
    };
};

// Update volume UI
if (!isNull _display) then {
    private _volOn = _display displayCtrl 85108;
    private _volOff = _display displayCtrl 85109;
    private _slider = _display displayCtrl 85107;

    if (A3U_playbackMode == "music") then {
        if (A3U_muted) then {
            _volOn ctrlShow false;
            _volOff ctrlShow true;
            _volOff ctrlSetTooltip localize "STR_A3U_mute_on";
            _slider sliderSetPosition 0;
        } else {
            _volOn ctrlShow true;
            _volOff ctrlShow false;
            _volOn ctrlSetTooltip localize "STR_A3U_mute_off";
            _slider sliderSetPosition A3U_volume;
        };
    };
};

[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;