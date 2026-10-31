disableSerialization;

createDialog "constructionMenu";

private _display = findDisplay 80000;

if (str (_display) == "no display") exitWith {};

private _comboBox = _display displayCtrl 505;

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
