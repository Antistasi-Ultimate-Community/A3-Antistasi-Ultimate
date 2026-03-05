//fn_volumeChanged.sqf
#include "..\..\script_component.hpp"

params ["_ctrlVolume", "_value"];

private _display = ctrlParent _ctrlVolume;
private _volOn = _display displayCtrl 85108;
private _volOff = _display displayCtrl 85109;
private _slider = _display displayCtrl 85107;

// Если был включён mute, снимаем его
if (A3U_muted) then {
    A3U_muted = false;
};

// Установка громкости
A3U_volume = linearConversion [0, 1, _value, 0, 1, true];
0 fadeMusic A3U_volume;

// Обновляем UI
_volOn ctrlShow true;
_volOff ctrlShow false;
_volOn ctrlSetTooltip "Выключить звук";
_slider sliderSetPosition A3U_volume;

//_volOn ctrlCommit 0;
//_volOff ctrlCommit 0;