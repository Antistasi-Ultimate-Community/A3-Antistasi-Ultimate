#include "\x\a3a\addons\gui\dialogues\ids.inc"

params ["_mode"];

switch (_mode) do {
	case ("onLoad"): {
		closeDialog 0;
		createDialog "A3A_SetupDialog_InGame";

		private _display = findDisplay A3A_IDD_SETUPDIALOG;
		private _params = A3A_saveData get "params";
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
		A3A_saveData set ['params', ['getParams'] call A3A_fnc_setupParamsTab];

		private _savedParamsHM = createHashMapFromArray (A3A_saveData get "params");
		{
			if (getArray (_x/"texts") isEqualTo [""]) then { continue };                // spacer/title
			private _val = _savedParamsHM getOrDefault [configName _x, getNumber (_x/"default")];
			if (getArray (_x/"values") isEqualTo [0,1]) then {
				if (_val isEqualType 0) then { _val = _val != 0 };                      // number -> bool
			} else {
				if (_val isEqualType false) then { _val = [0, 1] select _val };         // bool -> number
			};
			missionNamespace setVariable [configName _x, _val, true];                   // just publish them all, doesn't really hurt
		} forEach ("true" configClasses (configFile/"A3A"/"Params"));

		closeDialog 0;
	};
};
