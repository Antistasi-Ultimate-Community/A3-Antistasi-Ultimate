//fn_volumeChanged.sqf
#include "..\..\script_component.hpp"

params ["_ctrlVolume", "_value"];

// Установка громкости через fadeMusic (0 сек. для мгновенного изменения)
A3U_volume = linearConversion [0, 1, _value, 0, 1, true];
0 fadeMusic A3U_volume;

// Обновление иконки громкости
private _display = ctrlParent _ctrlVolume;
private _iconCtrl = _display displayCtrl 85108;

private _icon = switch true do {
    case (A3U_volume >= 0.66): {"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_volume_up_ca.paa"};
    case (A3U_volume >= 0.33): {"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_volume_mid_ca.paa"};
    default {"\a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_volume_down_ca.paa"};
};

_iconCtrl ctrlSetText _icon;