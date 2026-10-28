#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;
params ["_displayId","_direction"];

private _display = findDisplay _displayId;

if (str (_display) == "no display") exitWith {
    Error("Commander Menu Display is not Detected");
};

_currentMenu = menuSliderArray select menuSliderCurrent;	
_selectedMenu = [];
_menuSliderTarget = 0;
switch (_direction) do {
    case "LEFT": {
        _menuSliderTarget = if (menuSliderCurrent isEqualTo 0) then {((count menuSliderArray) - 1)} else {menuSliderCurrent - 1};
        _selectedMenu = menuSliderArray select _menuSliderTarget;
    };
    case "RIGHT": {
        _menuSliderTarget = if (menuSliderCurrent isEqualTo ((count menuSliderArray) - 1)) then {0} else {menuSliderCurrent + 1};
        _selectedMenu = menuSliderArray select _menuSliderTarget;
    };
};	

// Slide current menu out to the left
{
    if (_forEachIndex != 0) then {
        _thisCtrl = (_display displayCtrl _x);				
        _thisCtrl ctrlSetPosition [-0.4 * safezoneW + safezoneX, (ctrlPosition _thisCtrl) select 1, (ctrlPosition _thisCtrl) select 2, (ctrlPosition _thisCtrl) select 3];
        _thisCtrl ctrlCommit 0.1;
    };
} forEach _currentMenu;
sleep 0.1;

// Slide next menu in from the left
_leftPos = 0 * pixelGridNoUIScale * pixelW;
{
    if (_forEachIndex == 0) then {
        ctrlSetText [A3A_IDC_MENU_TAB_SELECTOR_TITLE, _x];
    } else {
        _thisCtrl = (_display displayCtrl _x);				
        _thisCtrl ctrlSetPosition [safezoneX, (ctrlPosition _thisCtrl) select 1, (ctrlPosition _thisCtrl) select 2, (ctrlPosition _thisCtrl) select 3];
        _thisCtrl ctrlCommit 0.2;
    };
} forEach _selectedMenu;	

menuSliderCurrent = _menuSliderTarget;

if(_displayId == A3A_IDD_COMMANDER_MENU) then {
    private _tabId = _selectedMenu select 1;
    switch (_tabId) do {
        case (A3A_IDC_COMMANDER_MENU_SUPPORT_TAB): {
            ["ADD"] call SCRT_fnc_ui_manageSupportTabEventHandler;
        };
        default {
            ["REMOVE"] call SCRT_fnc_ui_manageSupportTabEventHandler;
            ["REMOVE"] call SCRT_fnc_ui_hqTabEventHandler;
            ["REMOVE"] call SCRT_fnc_ui_establishOutpostEventHandler;
            ["REMOVE"] call SCRT_fnc_ui_disbandGarrisonEventHandler;
            ["REMOVE"] call SCRT_fnc_ui_recruitGarrisonEventHandler;
            ["REMOVE"] call SCRT_fnc_ui_minefieldEventHandler;
            ["REMOVE"] call SCRT_fnc_ui_assignRivalsAttackLocationEventHandler;
            [] spawn SCRT_fnc_ui_clearSupport;
            [] call SCRT_fnc_ui_clearOutpost;
            [] call SCRT_fnc_ui_clearRivals;
        };
    };
};