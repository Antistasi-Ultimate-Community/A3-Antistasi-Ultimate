/*
Maintainer: Socrates
   Adds salary to current rebel. 

Parameters:
	<NUMBER> Total faction income

Return Value:
    <NUMBER> Total faction income minus rebel salary


Scope: Client
Environment: Any
Public: Yes

Example:
[_resAdd] call SCRT_fnc_common_rebelSalary;
*/
#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_resAdd"];

private _rebels = call SCRT_fnc_misc_getRebelPlayers;

if (isNil "_resAdd" || {!finite _resAdd}) then {
    Warning("_resAdd is invalid, returning 25000");
    _resAdd = 25000;
};

if(_rebels isEqualTo []) exitWith {
	Warning("No salary as no active rebels found.");
	_resAdd;
};

private _rebelsCount = count _rebels;
private _totalSalary = _resAdd / 4;

_nul = [_totalSalary, _rebelsCount, _rebels] spawn {
	params ["_totalSalary", "_rebelsCount", "_rebels"];
	private _incomePerPlayer = round(_totalSalary / _rebelsCount);
	if (!finite _incomePerPlayer) then { _incomePerPlayer = 300; };
	
	{
		private _playerMoney = round (((_x getVariable ["moneyX", 0]) + _incomePerPlayer) max 0);
		_x setVariable ["moneyX", _playerMoney, (owner _x)];
		private _paycheckText = format [
			localize "STR_comms_mp_paycheck",
			name _x,
			_incomePerPlayer, 
			A3A_faction_civ get "currencySymbol",
			call SCRT_fnc_misc_getWorldName
		];

		sleep 10;
		
		[petros, "income", _paycheckText] remoteExec ["A3A_fnc_commsMP", _x];
	} forEach _rebels;

	terminate _thisScript;
};

_resAdd = _resAdd - _totalSalary;

_resAdd