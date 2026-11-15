#include "..\UILayouts\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

disableSerialization;

createDialog "constructionMenu";

private _display = findDisplay A3A_IDD_CONSTRUCTION_MENU;

if (str (_display) == "no display") exitWith {};

private _comboBox = _display displayCtrl A3A_IDC_CONSTRUCTION_MENU_BUILD_TYPE_COMBO_BOX;

_comboBox lbAdd localize "STR_antistasi_dialogs_trenches";
_comboBox lbSetData [0, "TRENCH"];
_comboBox lbAdd localize "STR_antistasi_dialogs_veh_obstacles";
_comboBox lbSetData [1, "OBSTACLE"];
_comboBox lbAdd localize "STR_antistasi_dialogs_light_bunkers";
_comboBox lbSetData [2, "LIGHT_BUNKER"];
_comboBox lbAdd localize "STR_antistasi_dialogs_heavy_bunkers";
_comboBox lbSetData [3, "HEAVY_BUNKER"];
_comboBox lbAdd localize "STR_antistasi_dialogs_misc";
_comboBox lbSetData [4, "MISC"];

_comboBox lbSetCurSel 0;