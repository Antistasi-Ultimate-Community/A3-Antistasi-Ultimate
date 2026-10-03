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
		{
			if (getArray (_x/"texts") isEqualTo [""]) then { continue };                // spacer/title
			private _val = _savedParamsHM getOrDefault [configName _x, getNumber (_x/"default")];
			if (getArray (_x/"values") isEqualTo [0,1]) then {
				if (_val isEqualType 0) then { _val = _val != 0 };                      // number -> bool
			} else {
				if (_val isEqualType false) then { _val = [0, 1] select _val };         // bool -> number
			};
			[missionNamespace, configName _x, _val] call BIS_fnc_setServerVariable;
		} forEach ("true" configClasses (configFile/"A3A"/"Params"));

		closeDialog 0;

		private _saveData = [missionNamespace, "A3A_saveData", createHashMap] call BIS_fnc_getServerVariable;
		sleep 1;
		_saveData set ["params", _params];
		[missionNamespace, "A3A_saveData", _saveData] call BIS_fnc_setServerVariable;
	};
};
