#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

private _display = findDisplay A3A_IDD_COMMANDER_MENU;

if (str (_display) == "no display") exitWith {};

private _costTextBox = _display displayCtrl A3A_IDC_COMMANDER_MENU_SUPPORT_COSTS_TEXT;
private _comboBox = _display displayCtrl A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX;
private _index = lbCurSel _comboBox;
private _supportType =  lbData [A3A_IDC_COMMANDER_MENU_SUPPORT_TYPE_COMBOBOX, _index];

supportType = _supportType;

switch (supportType) do {
    case ("SUPPLY");
    case ("SMOKE");
    case ("FLARE");
    case ("RECON"): {
        _costTextBox ctrlSetText format [localize "STR_commander_menu_abilities_cost_support_point", 1];
    };
    case ("VEH_AIRDROP"): {
        _costTextBox ctrlSetText format [localize "STR_commander_menu_abilities_cost_support_point_and_money", 1, 200, A3A_faction_civ get "currencySymbol"];
    };
    case ("NAPALM");
    case ("HE");
    case ("CLUSTER");
    case ("CHEMICAL"): {
        _costTextBox ctrlSetText localize "STR_commander_menu_abilities_cost_airstrike";
    };
    case ("PARADROP"): {
        _costTextBox ctrlSetText format [localize "STR_commander_menu_abilities_cost_support_point_and_money", 1, 500, A3A_faction_civ get "currencySymbol"];
    };
    case ("LOOTHELI"): {
        _costTextBox ctrlSetText format [localize "STR_commander_menu_abilities_cost_support_point_and_money", 1, 2000, A3A_faction_civ get "currencySymbol"];
    };
    default {
        _costTextBox ctrlSetText format [localize "STR_commander_menu_abilities_cost_support_point", 1];
    };
};

if (supportType == "PARADROP") then {
    private _markersX = markersX select {sidesX getVariable [_x,sideUnknown] != teamPlayer};
    _markersX = _markersX - controlsX;

    forbiddenParadropZones = [];

    {
        private _localMarker = createMarkerLocal [format ["%1forbiddenzone", count forbiddenParadropZones], getMarkerPos _x];
        _localMarker setMarkerShapeLocal "ELLIPSE";
        _localMarker setMarkerSizeLocal [500,500];
        _localMarker setMarkerTypeLocal "hd_warning";
        _localMarker setMarkerColorLocal "ColorRed";
        _localMarker setMarkerBrushLocal "DiagGrid";
        forbiddenParadropZones pushBack _localMarker;
    } forEach _markersX;
} else { 
    if (!isNil "forbiddenParadropZones") then {
        {deleteMarkerLocal _x} forEach forbiddenParadropZones;
    };
};

if (supportType != "LOOTHELI" && {getMarkerColor "LootHeliAreaMarker" != ""}) then {
    deleteMarkerLocal "LootHeliAreaMarker";
};