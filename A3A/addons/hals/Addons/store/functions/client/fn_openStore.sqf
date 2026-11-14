/*
	Function: HALs_store_fnc_openStore
	Author: HallyG
	Force open store dialog.

	Argument(s):
	0: Trader <OBJECT>

	Return Value:
	None

	Example:
	[trader1] call HALs_store_fnc_openStore;
__________________________________________________________________*/
params [
	["_trader", objNull, [objNull]]
];

if (!hasInterface) exitWith {};
if (isNull _trader) exitWith {};
if (isNil {_trader getVariable "HALs_store_trader_type"}) exitWith {};

player setVariable ["HALs_store_trader_current", _trader, true];

createDialog "RscDisplayStore";
