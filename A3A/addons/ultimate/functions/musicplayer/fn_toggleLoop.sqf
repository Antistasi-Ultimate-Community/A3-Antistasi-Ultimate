//fn_toggleLoop.sqf
#include "..\..\script_component.hpp"

A3U_loopEnabled = !A3U_loopEnabled;

private _display = findDisplay 85000;
if (!isNull _display) then {
    private _btn = _display displayCtrl 85113;
    private _tooltip = if (A3U_loopEnabled) then {
        if (A3U_playbackMode == "music") then {
            "Повтор трека (выкл)"
        } else {
            "Повтор звука (выкл)"
        }
    } else {
        if (A3U_playbackMode == "music") then {
            "Повтор трека (вкл)"
        } else {
            "Повтор звука (вкл)"
        }
    };
    _btn ctrlSetTooltip _tooltip;

    // Меняем цвет иконки
    if (A3U_loopEnabled) then {
        _btn ctrlSetBackgroundColor [0.95,0.95,0.95,1]; // светло-серый (акцент)
    } else {
        _btn ctrlSetBackgroundColor [1,1,1,1]; // белый
    };
};