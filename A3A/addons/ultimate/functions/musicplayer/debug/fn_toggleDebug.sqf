#include "..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _debugBg = _display displayCtrl 85120;
private _debugText = _display displayCtrl 85121;
private _toggleBtn = _display displayCtrl 85122;
private _debugCopyBtn = _display displayCtrl 85123;  // IDC кнопки копирования

// Переменная состояния (можно хранить в миссии или в дисплее)
if (isNil "A3U_debugVisible") then { A3U_debugVisible = false; };

A3U_debugVisible = !A3U_debugVisible;

// Показать/скрыть элементы
_debugBg ctrlShow A3U_debugVisible;
_debugText ctrlShow A3U_debugVisible;
_debugCopyBtn ctrlShow A3U_debugVisible;

// Если включили и есть трек – обновить данные
if (A3U_debugVisible && {count A3U_currentTrack > 0}) then {
    [] call A3U_fnc_updateDebugInfo;
};

// Сменить текст кнопки (опционально)
//_toggleBtn ctrlSetText (if (A3U_debugVisible) then {"Debug ON"} else {"Debug OFF"});