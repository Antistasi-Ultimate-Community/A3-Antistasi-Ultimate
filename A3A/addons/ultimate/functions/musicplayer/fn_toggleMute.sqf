//fn_toggleMute
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _volOn = _display displayCtrl 85108;
private _volOff = _display displayCtrl 85109;
private _slider = _display displayCtrl 85107;

if (A3U_muted) then {
    // Выходим из мута
    A3U_volume = A3U_volumeBeforeMute;
    A3U_muted = false;
    0 fadeMusic A3U_volume;
    _slider sliderSetPosition A3U_volume; // ← добавить
} else {
    // Включаем мут
    A3U_volumeBeforeMute = A3U_volume;
    A3U_muted = true;
    0 fadeMusic 0;
    _slider sliderSetPosition 0; // ← добавить
};

// Обновляем UI
if (A3U_muted) then {
    _volOn ctrlShow false;
    _volOff ctrlShow true;
    _volOff ctrlSetTooltip "Включить звук";
} else {
    _volOn ctrlShow true;
    _volOff ctrlShow false;
    _volOn ctrlSetTooltip "Выключить звук";
};