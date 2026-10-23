#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

params ["_severity", "_header", "_message", "_time", ["_displayId", A3A_IDD_COMMANDER_MENU]];

private _display = findDisplay _displayId;

if (str (_display) == "no display") exitWith {};

private _timeOut = time + _time;
private _title = _display displayCtrl A3A_IDC_MENU_MESSAGEBOX_TITLE;
private _text = _display displayCtrl A3A_IDC_MENU_MESSAGEBOX_TEXT;

switch (true) do {
    case (_severity isEqualTo (localize "STR_notifiers_info_type")): {
        _title ctrlSetTextColor [0,0,1,1];
    };

    case (_severity isEqualTo (localize "STR_notifiers_fail_type")): {
        playSound "A3AP_UiFailure";
        _title ctrlSetTextColor [0.9,0,0,1];
    };

    case (_severity isEqualTo (localize "STR_notifiers_success_type")): {
        playSound "A3AP_UiSuccess";
        _title ctrlSetTextColor [0,0.8,0,1];
    };
};

_title ctrlSetText _header;
_text ctrlSetStructuredText _message; 

{
    _x ctrlSetFade 0;
    _x ctrlCommit 0.3;
} forEach [_title, _text];

waitUntil {time > _timeOut};

{
    _x ctrlSetFade 1;
    _x ctrlCommit 10;
} forEach [_title, _text];