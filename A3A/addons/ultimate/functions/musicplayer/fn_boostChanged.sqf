#include "..\..\script_component.hpp"

params ["_ctrl", "_value"];

private _intValue = round _value; // 0-4
A3U_boostLevel = _intValue;

// Обновляем тултип слайдера
private _dbValues = [0,2,3,4,5];
_ctrl ctrlSetTooltip format ["Усиление: +%1 дБ", _dbValues select _intValue];

if (A3U_isPlaying) then {
    if (A3U_playbackMode == "music") then {
        // Для музыки меняем громкость с новым бустом без перезапуска
        private _boostFactor = [1.0, 2, 3, 4, 5] select A3U_boostLevel;
        if (A3U_muted) then {
            0 fadeMusic 0;
        } else {
            0.5 fadeMusic (A3U_volume * _boostFactor);
        };
    } else {
        // Для звука перезапускаем трек с новым бустом
        [] call A3U_fnc_playTrack;
    };
};