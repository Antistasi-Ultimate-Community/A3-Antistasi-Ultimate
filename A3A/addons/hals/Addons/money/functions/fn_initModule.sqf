/*
	Function: HALs_money_fnc_init
	Author: HallyG
	Module initialisation.

	Argument(s):
	None

	Return Value:
	None	

	Example:
	[] call HALs_money_fnc_initModule;
__________________________________________________________________*/
if (!isNil "HALs_money_moduleInit") exitWith {};
HALs_money_moduleInit = true;

if (isServer) then {call HALs_money_fnc_initServer};
if (hasInterface) then {call HALs_money_fnc_initClient};
