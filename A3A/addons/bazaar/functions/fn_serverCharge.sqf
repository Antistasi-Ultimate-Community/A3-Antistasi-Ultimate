// SERVER: authoritative charge for a purchase. The client only pre-checks
// for UX; the deduction happens HERE so no client-side state (money not yet
// synced, free-trade fallback) can turn a purchase silently free.
// Honors "Purchases paid from". Returns true = paid (or legitimately free).
if (!isServer) exitWith { false };
params [["_player", objNull, [objNull]], ["_price", 0, [0]]];

if (_price <= 0) exitWith { true };
if (isNull _player) exitWith { false };

// faction war chest
private _ok = false;
private _done = false;
if ((missionNamespace getVariable ["ABZ_funds", 0]) == 1) then {
	private _srv = missionNamespace getVariable ["server", objNull];
	private _f = if (isNull _srv) then { -1 } else { _srv getVariable ["resourcesFIA", -1] };
	if (_f isEqualType 0 && {_f >= 0} && {!isNil "A3A_fnc_resourcesFIA"}) then {
		_done = true;
		// Deducted HERE, in the same unscheduled step as the delivery, so an
		// Antistasi save can never hold the goods without their cost (and two
		// quick buys can never both pass against the same balance). Safe:
		// Antistasi's own A3A_fnc_resourcesFIA reads and writes the war chest
		// only while it holds resourcesIsChanging - clear means nobody is
		// halfway through a change. If it's held, refuse rather than wait.
		if (missionNamespace getVariable ["resourcesIsChanging", false]) then {
			["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_WarChestChanging"], _player] call CBA_fnc_targetEvent;
		} else {
			if (_f < _price) then {
				["ABZ_notify", [format [localize "STR_A3U_Bazaar_Notify_NotEnoughWarChest", _price, _f]], _player] call CBA_fnc_targetEvent;
			} else {
				_srv setVariable ["resourcesFIA", round ((_f - _price) max 0), true];
				_ok = true;
			};
		};
	};
	// no readable war chest: fall through to personal money
};
if (_done) exitWith { _ok };

// personal money
private _mx = _player getVariable ["moneyX", -1];
if !(_mx isEqualType 0) exitWith { true };
if (_mx < 0) exitWith {
	if (!isNil "A3A_fnc_resourcesPlayer") then {
		// Antistasi, but this player's money hasn't synced yet - never hand out free gear
		["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_MoneyNotSynced"], _player] call CBA_fnc_targetEvent;
		false
	} else {
		true	// non-Antistasi mission: the Bazaar trades for free by design
	};
};
if (_mx < _price) exitWith {
	["ABZ_notify", [format [localize "STR_A3U_Bazaar_Notify_NotEnoughMoney", _price, _mx]], _player] call CBA_fnc_targetEvent;
	false
};

// same public-variable write Antistasi's own resourcesPlayer performs
_player setVariable ["moneyX", _mx - _price, true];
true
