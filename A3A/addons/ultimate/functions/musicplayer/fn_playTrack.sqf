//fn_playTrack.sqf
#include "..\..\script_component.hpp"

//params ["_trackClass"];
if (A3U_currentTrack isEqualTo []) exitWith {
    systemChat "Ошибка: трек не выбран!";
};

// Сохраняем состояние
A3U_playerState = [
    A3U_currentTrack,
    true, // isPlaying
    A3U_trackProgress,
    A3U_volume,
    A3U_trackStartTime,
    A3U_pausedProgress
];
private _trackClass = A3U_currentTrack#1;

if (A3U_isPlaying) then {
    0.5 fadeMusic 0;
    playMusic "";
};
playMusic _trackClass;
A3U_isPlaying = true;
A3U_trackStartTime = diag_tickTime;

private _display = findDisplay 85000;
private _slider = _display displayCtrl 85107;

if (A3U_muted) then {
    0 fadeMusic 0;
    _slider sliderSetPosition 0;
} else {
    0.5 fadeMusic A3U_volume;
    _slider sliderSetPosition A3U_volume;
};

// Обновление UI громкости
if (!isNull _display) then {
    private _volOn = _display displayCtrl 85108;
    private _volOff = _display displayCtrl 85109;
    private _slider = _display displayCtrl 85107;

    if (A3U_muted) then {
        _volOn ctrlShow false;
        _volOff ctrlShow true;
        _volOff ctrlSetTooltip "Включить звук";
    } else {
        _volOn ctrlShow true;
        _volOff ctrlShow false;
        _volOn ctrlSetTooltip "Выключить звук";
        _slider sliderSetPosition A3U_volume;
    };
};

[] call A3U_fnc_updatePlayButton;
[] call A3U_fnc_updateTrackInfo;