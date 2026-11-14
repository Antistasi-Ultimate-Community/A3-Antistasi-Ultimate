params ["_moneyToAdd", "_player", ["_isSilent", false]];

if (!isPlayer _player || {!(side _player in [teamPlayer, civilian])}) exitWith {};

_player = _player getVariable ["owner",_player];
private _storedMoney = _player getVariable ["moneyX",0];

_storedMoney = _storedMoney + _moneyToAdd;
_player setVariable ["moneyX",_storedMoney, true];

if (_moneyToAdd > 1) then {
	if (!_isSilent) then {
		_textX = format [
			"<br/><br/><br/><br/><br/><br/>%1 <t color='#00FF00'>+%2%3</t>", 
			(localize "STR_antistasi_actions_common_notifications_money_found_title"), 
			_moneyToAdd,
			A3A_faction_civ get "currencySymbol"
		];
		[petros,"income",_textX] remoteExec ["A3A_fnc_commsMP",_player];
	} else {
		[] remoteExec ["A3A_fnc_statistics",_player];
	};
};
