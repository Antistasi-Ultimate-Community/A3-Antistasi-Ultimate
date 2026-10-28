#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

private _display = findDisplay A3A_IDD_CONSTRUCTION_MENU;

if (str (_display) == "no display") exitWith {};

private _buildingTypeCombobox = _display displayCtrl A3A_IDC_CONSTRUCTION_MENU_BUILD_TYPE_COMBO_BOX;
private _index = lbCurSel _buildingTypeCombobox;
private _constructionType = _buildingTypeCombobox lbData _index;
private _shopLookupArray = nil;

switch(_constructionType) do {
	case("TRENCH"): {
        _shopLookupArray = ["Land_BagFence_Corner_F", "Land_BagFence_End_F", "Land_BagFence_Long_F", "Land_BagFence_Round_F", "Land_BagFence_Short_F", "Land_SandbagBarricade_01_half_F", "Land_SandbagBarricade_01_hole_F", "Land_SandbagBarricade_01_F"];
    };
    case("OBSTACLE"): {
        _shopLookupArray = ["Land_CzechHedgehog_01_new_F", "Land_Razorwire_F"];
    };
    case("LIGHT_BUNKER"): {
        _shopLookupArray = ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_GuardBox_01_brown_F"];
    };
    case("HEAVY_BUNKER"): {
        _shopLookupArray = ["Land_Bunker_02_light_double_F"];
    };
    case("MISC"): {
        _shopLookupArray = ["Land_HelipadCircle_F", "Land_HelipadSquare_F", "Land_u_Addon_01_V1_F"];
    };
    default { 
        [1, format ["Bad Construction Type - %1 ", _constructionType], "fn_ui_setAvailableBuildingTypes"] call A3A_fnc_log;
    };
};

if (isNil "_shopLookupArray") exitWith {
    Error("Fatal Error - no lookup array for building menu, aborting.");
};


private _buildingCombobox = _display displayCtrl A3A_IDC_CONSTRUCTION_MENU_BUILDING_COMBO_BOX;
lbClear _buildingCombobox;

private _fillCombo = {
    params ["_buildings", "_comboBox"];

    {
        private _name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
        _comboBox lbAdd _name;
        _comboBox lbSetData [_forEachIndex, _x];
    } forEach _buildings;
};

[_shopLookupArray, _buildingCombobox] call _fillCombo;

_buildingCombobox lbSetCurSel 0;