//fn_playPause.sqf
#include "..\..\script_component.hpp"

if (A3U_playbackMode == "music") then {
    // музыкальный режим
    if (A3U_isPlaying) then {
        // Пауза
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
        diag_log format ["[playPlayPause] start with A3U_currentTrack=%1", A3U_currentTrack];
        } else {
            [] call A3U_fnc_playTrack;
        };
    };
} else {
    // Звуковой режим
    private _target = uiNamespace getVariable ["A3U_soundTarget", objNull];
    if (isNull _target) exitWith { systemChat "Ошибка: нет объекта"; };

    if (A3U_isPlaying) then {
        // Останавливаем звук – удаляем все источники на клиентах
        [_target] remoteExec ["A3U_fnc_stopSound", 0];
        A3U_isPlaying = false;
    } else {
        // Запускаем текущий звук
        [] call A3U_fnc_playTrack;
    };
};

[] call A3U_fnc_updatePlayButton;