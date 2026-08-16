/*
	Author:
		jwoodruff40
	
	Description:
		Initializes a module spawned by Zeus. Validates / fixes arguments and calls the appropriate function.
	
	Params:
		_module <OBJECT> : The module object spawned by Zeus.
	
	Dependencies: // ! Update
		N/A
	
	Scope: // ! Update
		N/A
	
	Environment: // ! Update
		N/A
	
	Usage:
		Only intended to be called from the init event handler of Zeus-spawned A3U modules.
		[_module] call A3A_zeus_fnc_initModule;
	
	Return:
		Nothing
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_module"];

private _fnc_addToGroup = {
	params ["_module", ["_cfg", configNull]];

	private _category = (_cfg >> "category") call BIS_fnc_getCfgData;
	private _group = missionNamespace getVariable format ["bis_fnc_initmodules_%1", _category];
	[_module] joinSilent _group;

	Debug_2("Module %1 joined group %2", _module, _group);
};

private _fnc_validateArgsAndRun = {
	params ["_module", ["_cfg", configNull]];

	Debug_1("Module: %1 | Validating args.", _module);

	private _category = (_cfg >> "category") call BIS_fnc_getCfgData;
	private _target = attachedTo _module;
	Debug_2("Module: %1 | Attached To: %2", _module, _target);
	
	private ["_argsValidated"];
	switch (_category) do {
		case (QGVAR(Supports_Occupants));
		case (QGVAR(Supports_Invaders)) : {
			private _args = createHashMapFromArray [["type", ""], ["side", ""], ["caller", "attack"], ["maxSpend", 500], ["target", false], ["position", getPosATL _module], ["reveal", 1], ["delay", 0]];
			{
				_x params ["_k", "_v"];
				if !(_k in keys _args) then { continue };
				if (_v isEqualType "") then {
					private _result = call compile _v;
					if !(isNil "_result") then { _v = _result };
				};
				_args set [_k, _v];
			} forEach (configProperties [_cfg >> "arguments"] apply {[configName _x, _x call BIS_fnc_getCfgData]});

			private _supportTypes = keys ([A3A_supportTypesOcc, A3A_supportTypesInv] select ((_args get "side") isEqualTo Invaders));
			if (!((_args get "type") in _supportTypes)) exitWith {
				private _message = format [localize "STR_A3U_Zeus_Misc_Dialog_NoSupportOfType", (_args get "type")];
				[objNull, _message] call BIS_fnc_showCuratorFeedbackMessage;
				deleteVehicle _module;
			};
			
			_argsValidated = ["type", "side", "caller", "maxSpend", "target", "position", "reveal", "delay"] apply {_args get _x};
			
			/*
			* This is only relevant for the support modules right now (those that call A3A_fnc_createSupport)
			* Will explore refactoring and / or generalizing later based on other modules implemented
			*/
			if (!isNull _target) then {
				_argsValidated set [4, _target];
				_argsValidated set [5, getPosATL _target];
			};
		};
		case (QGVAR(Misc)): {
			_argsValidated = [_target];
		};
		default {
			_argsValidated = [];
		};
	};

	private _function = (_cfg >> "function") call BIS_fnc_getCfgData;
	Debug_3("Module: %1 | Validated args: %2 | Function: %3", _module, _argsValidated, _function);
	if (_function isEqualType "") then { _function = missionNamespace getVariable _function };
	if (isNil "_function") exitWith { Error_2("Module: %1 attempted to spawn invalid function: %2", _module, _function) };

	_argsValidated spawn _function;
	deleteVehicle _module;
};

Debug_1("Initializing module: %1", _module);

if (isNil "_module") exitWith {};

private _cfg = configOf _module;

/*
! I still have no clue why CBA_fnc_execNextFrame is necessary for this to work properly,
! but I've refactored this ~7000 times and taking the inspiration to do it like this from ZEN
!     is the only way I've gotten it to work.
! Without using it, the module never seems to get attached to an object (attachedTo _module returns <Null-object>).
! At this point I'm tired of fighting with it.
! None of this is copied straight from ZEN, but _fnc_addToGroup and the following code have the closest resemblance / argument.
! ZEN is GPLv3 which I understand to be compatible with our license (MIT), so I'll just credit mharis001 for the code,
!     as adapted from https://github.com/zen-mod/ZEN/blob/8e911df8fa8e257cf4f083bbcd73ee27971854a4/addons/modules/functions/fnc_initModule.sqf,
!     as of 19 January 2026
*/
if (isServer) then { [_fnc_addToGroup, [_module, _cfg]] call CBA_fnc_execNextFrame };

if (!local _module) exitWith {};

[_fnc_validateArgsAndRun, [_module, _cfg]] call CBA_fnc_execNextFrame;