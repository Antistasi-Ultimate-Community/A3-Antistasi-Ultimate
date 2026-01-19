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
		[_module] call A3U_zeus_fnc_initModule;
	
	Return:
		Nothing
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_module"];

if (isNil "_module") exitWith {};

private _cfg = configOf _module;
private _args = (configProperties [_cfg >> "arguments"]) apply { _x call BIS_fnc_getCfgData };
private _function = getText (_cfg >> "function");

Debug_3("Initializing module: %1 with args: %2 and function: %3", _module, _args, _function);

private _argsValidated = [];
{
	if (!(_x isEqualType "")) then { _argsValidated pushBack _x; continue; };

	/*
	* Arguments for the module's function are stored in the arguments property of the module config.
	* Arguments that aren't a string, array, bool, or number are converted to string,
	*     so if we have a string argument, we try to compile and run it.
	* If the result is Nil, it's either *not* code or *bad* code, so we pass the string as is.
	*/
	private _result = call compile _x;
	_argsValidated pushBack ([_result, _x] select (isNil "_result"));
} forEach (_args);

Debug_1("Validated function args: %1", _argsValidated);

if (_function isEqualType "") exitWith {
	_function = missionNamespace getVariable _function;

	if (isNil "_function") then {
		Error_1("Module initialization attempted with invalid function name: %1", _function);
	};

	_argsValidated spawn _function;
	deleteVehicle _module;
};

if (_function isEqualType {}) exitWith {
	_argsValidated spawn _function;
	deleteVehicle _module;
};