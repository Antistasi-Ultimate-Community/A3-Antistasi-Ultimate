//fn_trackProggressMonitor.sqf
#include "..\..\script_component.hpp"

A3U_fnc_trackProgressMonitor = {
    while {!isNull findDisplay 85000} do {
        if (A3U_isPlaying) then {
            private _config = configFile >> "CfgMusic" >> (A3U_currentTrack#1);
            private _totalDuration = getNumber (_config >> "duration");

            if (_totalDuration > 0) then {
                private _currentTime = diag_tickTime - A3U_trackStartTime;
                A3U_trackProgress = (_currentTime / _totalDuration) min 1;

                // Обновление прогресс-бара
                private _display = findDisplay 85000;
                if (!isNull _display) then {
                    private _progressCtrl = _display displayCtrl 85106;
                    _progressCtrl progressSetPosition A3U_trackProgress;
                };

                // Автопереход к следующему треку
                if (A3U_trackProgress >= 0.99) then {
                    call A3U_fnc_nextTrack;
                };
            };
        };
        sleep 0.1;
    };
};