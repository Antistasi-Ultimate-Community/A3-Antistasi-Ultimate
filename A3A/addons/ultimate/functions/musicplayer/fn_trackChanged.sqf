//fn_trackChanged.sqf
#include "..\..\script_component.hpp"

params ["_ctrlTracks", "_index"];

if (_index == -1) exitWith {};

private _newTrack = [_ctrlTracks lbText _index, _ctrlTracks lbData _index];
if (count A3U_currentTrack > 0 && {A3U_currentTrack#1 == _newTrack#1}) exitWith {
    systemChat "[trackChanged] same track, ignored";
    diag_log format ["[trackChanged] same track: %1", _newTrack#1];
};

private _trackData = [
    _ctrlTracks lbText _index,
    _ctrlTracks lbData _index
];

systemChat format ["[trackChanged] new track: %1, old progress: %2", _trackData#0, A3U_trackProgress];
diag_log format ["[trackChanged] new track: %1 (%2), old progress: %3", _trackData#0, _trackData#1, A3U_trackProgress];

A3U_currentTrack = _trackData;
A3U_trackProgress = 0; // Сброс прогресса для нового трека

if (A3U_isPlaying) then {
    [] call A3U_fnc_playTrack;
};

[] call A3U_fnc_updateTrackInfo;

// Синхронизация громкости (как было)
private _display = findDisplay 85000;
if (!isNull _display) then {
    private _slider = _display displayCtrl 85107;
    private _volOn = _display displayCtrl 85108;
    private _volOff = _display displayCtrl 85109;

    if (A3U_muted) then {
        _volOn ctrlShow false;
        _volOff ctrlShow true;
        _volOff ctrlSetTooltip "Включить звук";
        _slider sliderSetPosition 0;
    } else {
        _volOn ctrlShow true;
        _volOff ctrlShow false;
        _volOn ctrlSetTooltip "Выключить звук";
        _slider sliderSetPosition A3U_volume;
    };
};

if (!isNil "A3U_debugVisible" && {A3U_debugVisible}) then {
    [] call A3U_fnc_updateDebugInfo;
};