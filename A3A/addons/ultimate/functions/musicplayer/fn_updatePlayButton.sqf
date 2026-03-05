//fn_updatePlayButton.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _ctrl = _display displayCtrl 85103;

private _tooltip = if (A3U_isPlaying) then {"Пауза"} else {"Воспроизвести"};

//_ctrl ctrlSetText _icon;
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;