/*
	Author:
		MaxxLite, Silence
	
	Description:
		calculates the amount of money a player has and donates it to other player/faction depending on set %
	
	Params:
		_unit <player> <Default: ObjNull>
		_target <target> <Default: ObjNull>
		_moneyPercent <float> <Default: 0>
	
	Usage:
		[player, cursorTarget, 1] call A3A_fnc_donateMoneyPercentage; - sends money to a player _unit is looking at
		[player, ObjNull, 0.25] call A3A_fnc_donateMoneyPercentage; - sends money to faction
	
	Return:
		_return <true> (if does not return true the script has failed)
*/

params [
  ["_unit", ObjNull],
  ["_target", ObjNull],
  ["_moneyPercent", 0]
];

if (_unit isEqualTo ObjNull) exitWith {false};

private _resourcesPlayer = 0;
private _pointsXJC = 0;
private _pointsXJ = 0;

private _resourcesPlayer = _unit getVariable "moneyX";

private _amount = round (_resourcesPlayer * _moneyPercent);

if (_resourcesPlayer <= 0) exitWith {
    [localize "STR_A3A_OrgPlayers_donateMoney_header", format [localize "STR_A3A_OrgPlayers_donateMoney_less250", A3A_faction_civ get "currencySymbol"]] call SCRT_fnc_misc_deniedHint;
};

if (_target isEqualTo ObjNull) exitWith {
    [0, _amount] remoteExec ["A3A_fnc_resourcesFIA",2];

    _pointsXJC = round (_resourcesPlayer / 250);
    _pointsXJ = (_unit getVariable "score") + _pointsXJC;

    _unit setVariable ["score", _pointsXJ, true];

    [-_amount] call A3A_fnc_resourcesPlayer;
    [localize "STR_A3A_OrgPlayers_donateMoney_header", format [localize "STR_A3A_OrgPlayers_donateMoney_success", _amount, A3A_faction_civ get "currencySymbol"]] call A3A_fnc_customHint;
};

if (!isPlayer _target) exitWith {
    [localize "STR_A3A_OrgPlayers_donateMoney_header",localize "STR_A3A_OrgPlayers_donateMoney_no_player"] call SCRT_fnc_misc_deniedHint;
};

[-_amount] call A3A_fnc_resourcesPlayer;
[_amount] remoteExec ["A3A_fnc_resourcesPlayer", _target];

[localize "STR_A3A_OrgPlayers_donateMoney_header", format [localize "STR_A3A_OrgPlayers_donateMoney_player", name _target, A3A_faction_civ get "currencySymbol",_amount]] call A3A_fnc_customHint;