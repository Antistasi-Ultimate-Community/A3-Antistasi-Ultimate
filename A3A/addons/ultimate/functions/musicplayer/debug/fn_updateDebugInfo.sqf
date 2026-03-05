#include "..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _debugText = _display displayCtrl 85121;
if (isNull _debugText) exitWith {};

if (count A3U_currentTrack == 0) then {
    _debugText ctrlSetStructuredText parseText "<t color='#CCCCCC'>Нет выбранного трека</t>";
} else {
    private _trackClass = A3U_currentTrack#1;
    private _debugInfo = [_trackClass] call A3U_fnc_getTrackDebugInfo;
    _debugText ctrlSetStructuredText parseText _debugInfo;
};