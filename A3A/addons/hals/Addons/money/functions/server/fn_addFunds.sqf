/*
	Function: HALs_money_fnc_addFunds
	Author: HallyG

	Arguments(s):
	0: Unit <OBJECT>
	1: Funds <NUMBER>

	Return Value:
	None

	Example:
	[player, 100] call HALs_money_fnc_addFunds;
__________________________________________________________________*/
params [
	["_unit", objNull, [objNull]],
	["_funds", 0, [0]]
];

if (!local _unit) exitWith {
	[_unit, _funds] remoteExec ["HALs_money_fnc_addFunds", _unit, false]
};

private _money = ((_unit getVariable ["moneyX", 0]) + _funds) max 0;
_money = round _money;

_unit setVariable ["moneyX", _money, true];
_sign = ["", "+"] select (_funds > 0);

_textX = format ["<br/><br/><br/><br/><br/><br/><t color='#00FF00'>%1 %2 %3</t>", _sign, _funds, A3A_faction_civ get "currencySymbol"];
[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",_unit];
