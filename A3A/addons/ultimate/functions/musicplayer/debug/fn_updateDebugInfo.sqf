//fn_updateDegugInfo.sqf
#include "..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _debugText = _display displayCtrl 85121;
if (isNull _debugText) exitWith {};

if (count A3U_currentTrack == 0) then {
    _debugText ctrlSetStructuredText parseText "<t color='#CCCCCC'>Нет выбранного трека</t>";
} else {
    private _itemClass = A3U_currentTrack#1;
    private _debugInfo = "";
    if (A3U_playbackMode == "music") then {
        _debugInfo = [_itemClass] call A3U_fnc_getTrackDebugInfo;
    } else {
        _debugInfo = [_itemClass] call A3U_fnc_getSoundDebugInfo;
    };
    _debugText ctrlSetStructuredText parseText _debugInfo;
};