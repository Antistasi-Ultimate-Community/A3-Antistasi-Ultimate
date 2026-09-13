#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_opened"];

Verbose_1("[A3U HOVER DEBUG] Map EH opened=%1", _opened);
[false] call A3U_fnc_markerBrowser;   // always force close on open & close

if (_opened) then {
    [true] call A3U_fnc_mapHover;
} else {
    [false] call A3U_fnc_mapHover;
    ['off'] call SCRT_fnc_ui_toggleMenuBlur;
};