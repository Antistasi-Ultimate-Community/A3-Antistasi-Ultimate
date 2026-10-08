#include "\x\a3a\addons\gui\dialogues\ids.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode"];

switch (_mode) do {
	case ("onLoad"): {
		closeDialog 0;
		createDialog "A3A_SetupDialog_InGame";

		private _display = findDisplay A3A_IDD_SETUPDIALOG;
		private _params = ([missionNamespace, "A3A_saveData", createHashMap] call BIS_fnc_getServerVariable) getOrDefault["params", []];
		_display setVariable ["savedParams", _params];

		["switchTab", ["params"]] call A3A_fnc_setupDialog;
		private _paramsTable = _display displayCtrl A3A_IDC_SETUP_PARAMSTABLE;
		waitUntil {sleep 0.1; !isNil {_paramsTable getVariable "allTextCtrls"}};
		["fillParams"] call A3A_fnc_setupParamsTab;
	};
	case ("ResetParams"): {
		["fillParams"] call A3A_fnc_setupParamsTab;
	};
	case ("SaveParams"): {
		private _params = ['getParams'] call A3A_fnc_setupParamsTab;
		private _savedParamsHM = createHashMapFromArray _params;
		[_savedParamsHM] remoteExec[QFUNCMAIN(setGameParameters), 2];

		closeDialog 0;
	};
};
