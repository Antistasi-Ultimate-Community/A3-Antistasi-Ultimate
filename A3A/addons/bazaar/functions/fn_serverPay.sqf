// SERVER: pays a player, into whichever pot "Purchases paid from" uses -
// the mirror image of fn_serverCharge. Exactly ONE pot is paid: the war
// chest in faction mode (when Antistasi's war chest is readable), otherwise
// the player's personal money.
if (!isServer) exitWith {};
params [["_player", objNull, [objNull]], ["_amount", 0, [0]]];
if (isNull _player || {_amount <= 0}) exitWith {};

private _done = false;
if ((missionNamespace getVariable ["ABZ_funds", 0]) == 1) then {
	private _srv = missionNamespace getVariable ["server", objNull];
	private _f = if (isNull _srv) then { -1 } else { _srv getVariable ["resourcesFIA", -1] };
	if (_f isEqualType 0 && {_f >= 0} && {!isNil "A3A_fnc_resourcesFIA"}) then {
		_done = true;
		// in the same step as the sale (see fn_serverCharge); fn_serverSell
		// refuses while Antistasi is halfway through a change, so the queued
		// fallback below is only a safety net
		if (missionNamespace getVariable ["resourcesIsChanging", false]) then {
			[0, _amount] spawn A3A_fnc_resourcesFIA;	// [HR, money]
		} else {
			_srv setVariable ["resourcesFIA", round (_f + _amount), true];
		};
	};
	// no readable war chest: fall through to personal money
};
if (_done) exitWith {};	// (an exitWith inside the block above would only leave that block)

private _mx = _player getVariable ["moneyX", -1];
if (_mx isEqualType 0 && {_mx >= 0}) then {
	_player setVariable ["moneyX", _mx + _amount, true];
};
