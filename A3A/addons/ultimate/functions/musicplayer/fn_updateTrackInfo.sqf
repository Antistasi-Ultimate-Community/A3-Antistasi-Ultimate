//fn_updateTrackinfo.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

// Название текущего элемента
private _trackInfo = _display displayCtrl 85110;
private _text = if (count A3U_currentTrack > 0) then {
    format ["<t align='center' size='1.1'>%1</t>", A3U_currentTrack#0]
} else {
    "<t align='center' size='1.1'>Выберите трек</t>"
};
_trackInfo ctrlSetStructuredText parseText _text;

// Управление иконкой мода
private _iconCtrl = _display displayCtrl 85111;

if (count A3U_currentTrack > 0) then {
    private _itemClass = A3U_currentTrack#1;
    private _modInfo = [_itemClass] call A3U_fnc_getTrackModIcon; // одна функция для обоих режимов
    _modInfo params ["_icon", "_modName"];
    
    if (_icon != "") then {
        _iconCtrl ctrlSetText _icon;
        _iconCtrl ctrlSetTooltip (if (_modName != "") then {_modName} else {"Неизвестный мод"});
        _iconCtrl ctrlShow true;
    } else {
        // Если иконки нет – показываем заглушку (например, стандартный знак вопроса)
        _iconCtrl ctrlSetText "\a3\ui_f\data\gui\cfg\hints\icon_unknown_ca.paa";
        _iconCtrl ctrlSetTooltip (if (_modName != "") then {_modName} else {"Неизвестный мод"});
        _iconCtrl ctrlShow true;
    };
} else {
    // Нет трека – скрываем иконку
    _iconCtrl ctrlShow false;
};

_trackInfo ctrlCommit 0;
_iconCtrl ctrlCommit 0;