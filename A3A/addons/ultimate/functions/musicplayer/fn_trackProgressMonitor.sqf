//fn_trackProggressMonitor.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

while {!isNull findDisplay 85000} do {
    if (A3U_isPlaying && {count A3U_currentTrack > 0}) then {
        private _config = configFile >> "CfgMusic" >> (A3U_currentTrack#1);
        if (isClass _config) then {
            private _totalDuration = getNumber (_config >> "duration");
            
            if (_totalDuration > 0) then {
                private _currentTime = diag_tickTime - A3U_trackStartTime;
                A3U_trackProgress = (_currentTime / _totalDuration) min 1;
                
                // Обновление прогресс-бара
                private _progressCtrl = _display displayCtrl 85106;
                if (!isNull _progressCtrl) then {
                    _progressCtrl progressSetPosition A3U_trackProgress;
                };
                
                /* // Автопереход к следующему треку
                if (A3U_trackProgress >= 0.99) then {
                    if (A3U_loopEnabled) then {
                        // перезапустить текущий трек с начала
                        [] call A3U_fnc_playTrack;
                    } else {
                        call A3U_fnc_nextTrack;
                    };
                }; */
            };
        };
    };
    sleep 0.1;
};
