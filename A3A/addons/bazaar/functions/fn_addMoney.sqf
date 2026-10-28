// Adds (or subtracts, if negative) personal Antistasi money.
// Must run on the machine where the player is local.
// Uses the official Antistasi function when available.
params [["_amount", 0, [0]]];

if (_amount == 0) exitWith {};
if (!hasInterface) exitWith {};

if (!isNil "A3A_fnc_resourcesPlayer") then {
	[_amount] call A3A_fnc_resourcesPlayer;
} else {
	private _m = player getVariable ["moneyX", -1];
	if (_m >= 0) then {
		player setVariable ["moneyX", ((_m + _amount) max 0), true];
	};
};
