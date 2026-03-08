//fn_trackProggressMonitor.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

// Определяем, какой контрол прогресса использовать
private _progressCtrl = if (A3U_playbackMode == "music") then {
    _display displayCtrl 85106  // слайдер
} else {
    _display displayCtrl 85117  // простой прогресс-бар
};

private _timer = _display displayCtrl 85115;

private _fnc_formatTime = {
    params ["_seconds"];
    private _mins = floor (_seconds / 60);
    private _secs = floor (_seconds % 60);
    format ["%1%2:%3%4", 
        ["","0"] select (_mins < 10), _mins,
        ["","0"] select (_secs < 10), _secs]
};

while {!isNull findDisplay 85000} do {
    if (A3U_isPlaying && {count A3U_currentTrack > 0}) then {
        private _itemClass = A3U_currentTrack#1;
        private _config = if (A3U_playbackMode == "music") then {
            configFile >> "CfgMusic" >> _itemClass
        } else {
            (configFile >> "CfgSounds" >> _itemClass)
        };
        if (!isClass _config) then { _config = missionConfigFile >> "CfgSounds" >> _itemClass; };
        
        if (isClass _config) then {
            private _totalDuration = getNumber (_config >> "duration");
            
            if (_totalDuration > 0) then {
                private _currentTime = diag_tickTime - A3U_trackStartTime;
                A3U_trackProgress = (_currentTime / _totalDuration) min 1;
                
                // Обновление таймера
                private _currentSeconds = _currentTime min _totalDuration;
                private _timeStr = format ["%1 / %2", 
                    [_currentSeconds] call _fnc_formatTime,
                    [_totalDuration] call _fnc_formatTime
                ];
                _timer ctrlSetText _timeStr;
                
                // Обновляем прогресс
                if (A3U_playbackMode == "music") then {
                    if !(_display getVariable ["isDragging", false]) then {
                        _progressCtrl sliderSetPosition A3U_trackProgress;
                    };
                } else {
                    _progressCtrl progressSetPosition A3U_trackProgress;
                };
                
                // Автопереход при окончании (только для музыки, для звуков можно реализовать loop)
                if (A3U_trackProgress >= 0.99) then {
                    if (A3U_loopEnabled) then {
                        if (A3U_playbackMode == "music") then {
                            A3U_trackProgress = 0;
                            A3U_trackStartTime = diag_tickTime;
                            playMusic (A3U_currentTrack#1);
                            0.5 fadeMusic A3U_volume;
                        } else {
                            // Для звуков - перезапуск
                            [] call A3U_fnc_playTrack;
                        };
                    };
                };
            };
        };
    } else {
        // Если трек не играет, но выбран, показываем прогресс из переменной
        if (count A3U_currentTrack > 0) then {
            private _itemClass = A3U_currentTrack#1;
            private _config = if (A3U_playbackMode == "music") then {
                configFile >> "CfgMusic" >> _itemClass
            } else {
                (configFile >> "CfgSounds" >> _itemClass)
            };
            if (!isClass _config) then { _config = missionConfigFile >> "CfgSounds" >> _itemClass; };
            if (isClass _config) then {
                private _totalDuration = getNumber (_config >> "duration");
                private _currentSeconds = A3U_trackProgress * _totalDuration;
                private _timeStr = format ["%1 / %2", 
                    [_currentSeconds] call _fnc_formatTime,
                    [_totalDuration] call _fnc_formatTime
                ];
                _timer ctrlSetText _timeStr;
            };
        } else {
            _timer ctrlSetText "00:00 / 00:00";
        };
    };
    sleep 0.1;
};