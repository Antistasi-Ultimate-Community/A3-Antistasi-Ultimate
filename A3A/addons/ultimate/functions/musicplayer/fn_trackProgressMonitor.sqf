//fn_trackProggressMonitor.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _slider = _display displayCtrl 85106;
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
        private _config = configFile >> "CfgMusic" >> (A3U_currentTrack#1);
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
                
                // Обновление слайдера, если не идёт перетаскивание
                if !(_display getVariable ["isDragging", false]) then {
                    _slider sliderSetPosition A3U_trackProgress;
                };
                
                // Автопереход при окончании трека – только для повтора
                if (A3U_trackProgress >= 0.99) then {
                    if (A3U_loopEnabled) then {
                        // Повтор текущего трека
                        A3U_trackProgress = 0;
                        A3U_trackStartTime = diag_tickTime;
                        playMusic (A3U_currentTrack#1);
                        0.5 fadeMusic A3U_volume;
                    };
                    // Для не-loop ничего не делаем – переход произойдёт в MusicStop
                };
            };
        };
    } else {
        // Если трек не играет, но выбран (пауза или просто выбран), показываем текущий прогресс
        if (count A3U_currentTrack > 0) then {
            private _config = configFile >> "CfgMusic" >> (A3U_currentTrack#1);
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