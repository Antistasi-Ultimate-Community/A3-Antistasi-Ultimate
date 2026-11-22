/*
	Function: HALs_store_fnc_initModule;
	Author: HallyG
	Module initialisation.

	Argument(s):
	None

	Return Value:
	None

	Example:
	[] call HALs_store_fnc_initModule;
__________________________________________________________________*/
if (!isNil "HALs_store_moduleInit") exitWith {};
HALs_store_moduleInit = true;

if (isServer) then {call HALs_store_fnc_initServer};
if (hasInterface) then {call HALs_store_fnc_initClient};
