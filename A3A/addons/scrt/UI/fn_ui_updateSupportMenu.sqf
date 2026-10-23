#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

private _display = findDisplay A3A_IDD_COMMANDER_MENU;
if (str (_display) != "no display") then {
    private _supportControl = _display displayCtrl A3A_IDC_COMMANDER_MENU_SUPPORT_POINTS_TEXT;
	_supportControl ctrlSetText format [(localize "STR_commander_menu_abilities_available_supports" + " %1" + "/%2"), supportPoints, maxSupportPoints];

    if (supportPoints < 1) then {
        _supportControl ctrlSetTextColor [1, 0, 0, 1];
    };

    private _airstrikesControl = _display displayCtrl A3A_IDC_COMMANDER_MENU_SUPPORT_AIRSTRIKE_POINTS_TEXT;
	_airstrikesControl ctrlSetText format [
        (localize "STR_commander_menu_abilities_available_airstrikes" + " %1" + "/%2"), 
        (floor bombRuns), 
        (({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX) * 2)
    ];

    if (bombRuns < 1) then {
        _airstrikesControl ctrlSetTextColor [1, 0, 0, 1];
    };

    private _airportsControl = _display displayCtrl A3A_IDC_COMMANDER_MENU_SUPPORT_CAPTURED_AIRPORTS_TEXT;
    private _airports = { sidesX getVariable [_x, sideUnknown] isEqualTo teamPlayer } count airportsX;
	_airportsControl ctrlSetText format [(localize "STR_commander_menu_abilities_captured_airports" + " %1" + "/%2"), _airports, (count airportsX)];

    if (_airports < 1) then {
        _airportsControl ctrlSetTextColor [1, 0, 0, 1];
    };
};