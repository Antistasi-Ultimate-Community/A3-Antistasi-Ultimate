/*
	Function: HALs_store_fnc_addActionTrader
	Author: HallyG
	Add an open store action to all targets.

	Argument(s):
	0: Trader <OBJECT>
	1: Target (Default: false) <ARRAY, GROUP, NUMBER, OBJECT, SIDE, STRING, BOOLEAN>

	Return Value:
	None

	Example:
	[trader1, west] call HALs_store_fnc_addActionTrader;
__________________________________________________________________*/
params [
	["_trader", objNull, [objNull]],
	["_target", false, [0, objNull, "", sideUnknown, grpNull, [], false]]
];

if (isNull _trader) exitWith {};
if (isNil {_trader getVariable "HALs_store_trader_type"}) exitWith {};

if (_target isEqualType false) then {
	if (hasInterface) then {
		[
			_trader,
			format [localize "STR_HALS_STORE_OPEN_ACTION", _trader getVariable ["HALs_store_name", localize "STR_HALS_STORE_ACTION"]],
			"\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
			"\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
			"alive _target && _this distance _target < 3 && isNull objectParent _this",
			"_this distance _target < 3",
			{},
			{},
			{
				params ["_trader", "_caller", "_actionId", "_arguments"];

				[_trader] call HALs_store_fnc_openStore;
			}, {}, [], 0.5, nil, false, false
		] call BIS_fnc_holdActionAdd;
	};
} else {
	if (isServer) then {
		[_trader] remoteExecCall ["HALs_store_fnc_addActionTrader", _target, _trader];
	};
};
