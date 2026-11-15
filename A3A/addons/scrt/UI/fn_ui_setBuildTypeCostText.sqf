#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

private _display = findDisplay A3A_IDD_CONSTRUCTION_MENU;

if (str (_display) == "no display") exitWith {};

private _costLocalized = localize "STR_antistasi_dialogs_price";

private _costTextBox = _display displayCtrl A3A_IDC_CONSTRUCTION_MENU_COSTS_TEXT;
private _comboBox = _display displayCtrl A3A_IDC_CONSTRUCTION_MENU_BUILD_TYPE_COMBO_BOX;
private _index = lbCurSel _comboBox;
private _buildType = _comboBox lbData _index;

switch (_buildType) do {
    case ("TRENCH"): {
        _costTextBox ctrlSetText format ["%1: 100%2", _costLocalized, A3A_faction_civ get "currencySymbol"];
    };
    case ("OBSTACLE"): {
        _costTextBox ctrlSetText format ["%1: 250%2", _costLocalized, A3A_faction_civ get "currencySymbol"];
    };
    case ("LIGHT_BUNKER"): {
        _costTextBox ctrlSetText format ["%1: 1000%2", _costLocalized, A3A_faction_civ get "currencySymbol"];
    };
    case ("HEAVY_BUNKER"): {
        _costTextBox ctrlSetText format ["%1: 2000%2", _costLocalized, A3A_faction_civ get "currencySymbol"];
    };
    case ("MISC"): {
        _costTextBox ctrlSetText format ["%1: 50%2", _costLocalized, A3A_faction_civ get "currencySymbol"];
    };
    default {
        [2,"Bad build type.", "fn_setBuildTypeCostText"] call A3A_fnc_log;
    };
};