//fn_updatePlayButton.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _ctrl = _display displayCtrl 85103;

// Для music и sound используем одинаковые подсказки
private _tooltip = if (A3U_isPlaying) then {"Пауза"} else {"Воспроизвести"};
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;