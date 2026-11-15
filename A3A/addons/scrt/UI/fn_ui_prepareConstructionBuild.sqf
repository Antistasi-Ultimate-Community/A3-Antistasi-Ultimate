#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

private _display = findDisplay A3A_IDD_CONSTRUCTION_MENU;

if (str (_display) == "no display") exitWith {};

private _comboBox = _display displayCtrl A3A_IDC_CONSTRUCTION_MENU_BUILD_TYPE_COMBO_BOX;
private _index = lbCurSel _comboBox;
private _constructionType = _comboBox lbData _index;

_comboBox = _display displayCtrl A3A_IDC_CONSTRUCTION_MENU_BUILDING_COMBO_BOX;
_index = lbCurSel _comboBox;
private _construction = _comboBox lbData _index;

//closing both Y menu and constructionMenu
closeDialog 0;
closeDialog 0;
[_constructionType, _construction] call SCRT_fnc_build_prepareAndStartConstruction;