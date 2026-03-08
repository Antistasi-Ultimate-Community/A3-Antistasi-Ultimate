//fn_volumeChanged.sqf
#include "..\..\script_component.hpp"

params ["_ctrlVolume", "_value"];

private _display = ctrlParent _ctrlVolume;
private _volOn = _display displayCtrl 85108;
private _volOff = _display displayCtrl 85109;
private _slider = _display displayCtrl 85107;

// Снимаем мьют, если был включён
if (A3U_muted) then { A3U_muted = false; };

// Установка громкости
A3U_volume = linearConversion [0, 1, _value, 0, 1, true];

// Применяем громкость в зависимости от режима
if (A3U_playbackMode == "music") then {
    private _boostFactor = [1, 2, 3, 4, 5] select A3U_boostLevel;
    0 fadeMusic (A3U_volume * _boostFactor);
} else {
    // Для звуков: если сейчас играет, перезапускаем с новой громкостью
    if (A3U_isPlaying && {A3U_playbackMode == "sound"}) then {
        [] call A3U_fnc_playTrack;
    };
};

if (A3U_playbackMode == "music") then {
    _volOn ctrlShow true;
    _volOff ctrlShow false;
    _volOn ctrlSetTooltip "Выключить звук";
    _slider sliderSetPosition A3U_volume;
};