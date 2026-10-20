// SERVER: a player handed items to a trader (already removed client-side).
// Prices are recomputed here - never trusted from the client.
//   - a trader only buys what he'd sell himself (fn_sellClass), and nothing
//     the Antistasi arsenal already has unlimited (fn_isUnlockedAny)
//   - items the trader's JOB asks for pay the job bounty and stay with him
//   - everything else pays the sell fraction and lands on his table
//   - magazines are paid by the round: a part-used one pays for what's left
//     in it, only full ones count toward a job, and every refusal hands back
//     exactly the rounds that were handed over
// [player, id, heldClass, qty, expJobN, expReward, rounds]
//   expJobN/expReward: what the player's menu said would count toward the
//   job, and at what bounty. rounds: per-magazine round counts (magazines only).
if (!isServer) exitWith {};
call ABZ_fnc_syncCommit;	// Antistasi just saved? commit that state before this sale changes it
// _backTo (v1.1.1): a vehicle or crate the items were taken out of
// (fn_serverSellCargo) - anything handed back goes back into it
params [["_player", objNull, [objNull]], ["_id", -1, [0]], ["_held", "", [""]], ["_qty", 1, [0]], ["_expJobN", 0, [0]], ["_expReward", 0, [0]], ["_rounds", [], [[]]], ["_backTo", objNull, [objNull]]];
if (isNull _player || {_held == ""} || {_qty <= 0}) exitWith {};

private _class = [_held] call ABZ_fnc_sellClass;
private _back = [_class, _held] select (_class == "");	// what a refund hands back
private _cm = configFile >> "CfgMagazines" >> _back;
private _isMag = isClass _cm;
private _cap = 1 max getNumber (_cm >> "count");
if (_isMag) then {
	// one count per magazine, clamped to what a magazine can hold
	_rounds = _rounds select { _x isEqualType 0 };
	while { count _rounds < _qty } do { _rounds pushBack _cap };
	_rounds = (_rounds select [0, _qty]) apply { round ((_x max 0) min _cap) };
} else {
	_rounds = [];
};
private _fnc_refund = {
	params ["_msg"];
	if (isNull _backTo) then {
		["ABZ_give", [_back, _qty, _rounds], _player] call CBA_fnc_targetEvent;
	} else {
		[_backTo, _back, _qty, _rounds, _player] call ABZ_fnc_cargoGive;
	};
	["ABZ_notify", [_msg + localize "STR_A3U_Bazaar_Notify_HandedBack"], _player] call CBA_fnc_targetEvent;
};

if (_class == "") exitWith { [localize "STR_A3U_Bazaar_Notify_TraderWontBuy"] call _fnc_refund };

private _e = [_id] call ABZ_fnc_vendorEntry;
private _why = [_player, _e] call ABZ_fnc_serverCanTrade;
if (_why != "") exitWith { [_why] call _fnc_refund };

// anything the Antistasi arsenal already has UNLIMITED can be pulled from it
// forever - buying it would be an infinite money machine. The one exception
// is a buy-back of what was bought right here moments ago (never more than
// the price paid, for no more than were bought - nothing to farm); the rest
// goes back.
private _unl = [[_held, _class]] call ABZ_fnc_isUnlockedAny;
private _rcLive = ((ABZ_receipts getOrDefault [getPlayerUID _player, []]) findIf {
	time < ((_x select 4) + 3) && {(_x select 2) > 0} && {(_x select 0) == _id} && {(_x select 1) == _class} && {_x param [6, false]}
}) > -1;
if (_unl && {!_rcLive}) exitWith {
	[localize "STR_A3U_Bazaar_Notify_UnlimitedArsenal"] call _fnc_refund;
};
// faction mode: the war chest is paid in this same step (fn_serverPay), so
// never while Antistasi is halfway through changing it - otherwise a save
// could hold the sale without its payment
if ((missionNamespace getVariable ["ABZ_funds", 0]) == 1 && {missionNamespace getVariable ["resourcesIsChanging", false]}) exitWith {
	[localize "STR_A3U_Bazaar_Notify_WarChestCounting"] call _fnc_refund;
};
[_e] call ABZ_fnc_entryPad;

// full units (whole items; for magazines, full magazines) and loose rounds
private _full = if (_isMag) then { { _x >= _cap } count _rounds } else { _qty };
private _partRounds = 0;
if (_isMag) then { { if (_x < _cap) then { _partRounds = _partRounds + _x } } forEach _rounds };

// the job changed under the player's menu (another player delivered, or a
// restock rolled a new job): never pay the sell fraction for items handed
// over expecting the bounty - hand them back and show the new table
private _job = _e select 12;
private _srvJobN = 0;
if (_job isNotEqualTo [] && {(_job select 0) == _class} && {(_job select 2) < (_job select 1)}) then {
	_srvJobN = _full min ((_job select 1) - (_job select 2));
};
if (_unl) then { _srvJobN = 0 };	// unlimited gear never fills a job
if (_expJobN > 0 && {_srvJobN < _expJobN || {(_job param [3, 0]) < _expReward}}) exitWith {
	[localize "STR_A3U_Bazaar_Notify_JobChanged"] call _fnc_refund;
	["ABZ_shopData", [_e, _player] call ABZ_fnc_shopPayload, _player] call CBA_fnc_targetEvent;
};

private _name = [_class] call ABZ_fnc_displayNameOf;
private _total = 0;
private _msgs = [];

// --- buy-back window (v1.1.0): what this player bought from THIS trader
// moments ago comes back at the full price paid - whole items / full
// magazines, into the same pot that paid for them. The job (if any) gets
// first pick; a bought item can't normally be a job item anyway.
private _bbN = 0;
private _bbPay = 0;
if ((missionNamespace getVariable ["ABZ_buyBackSeconds", 60]) > 0) then {
	private _uid = getPlayerUID _player;
	private _fac = call ABZ_fnc_factionPays;
	// +3s grace: the menu's clock runs a little behind the server's (latency)
	private _list = (ABZ_receipts getOrDefault [_uid, []]) select { time < ((_x select 4) + 3) && {(_x select 2) > 0} };
	private _avail = _full - _srvJobN;
	{
		_x params ["_tid", "_cls", "_q", "_pr", "_exp", "_f"];
		// unlimited gear: only a receipt for gear that was already unlimited when bought
		if (_avail > 0 && {_tid == _id} && {_cls == _class} && {_f isEqualTo _fac} && {!_unl || {_x param [6, false]}}) then {
			private _take = _q min _avail;
			_x set [2, _q - _take];
			_avail = _avail - _take;
			_bbN = _bbN + _take;
			_bbPay = _bbPay + _take * _pr;
		};
	} forEach _list;
	ABZ_receipts set [_uid, _list select { (_x select 2) > 0 }];
};
if (_bbN > 0) then {
	_total = _total + _bbPay;
	_msgs pushBack format [localize "STR_A3U_Bazaar_Notify_BuyBack", _bbN, _name, _bbPay];
};

// --- job delivery first (whole items / full magazines only) ---
private _jobN = _srvJobN;
if (_jobN > 0) then {
	_job params ["", "_wanted", "_delivered", "_reward"];
	_delivered = _delivered + _jobN;
	_job set [2, _delivered];
	_total = _total + _jobN * _reward;
	_msgs pushBack format [localize "STR_A3U_Bazaar_Notify_JobDelivered", _jobN, _name, _delivered, _wanted, _jobN * _reward];
	if (_delivered >= _wanted) then {
		private _bonus = round (0.5 * _wanted * _reward);
		_total = _total + _bonus;
		_msgs pushBack format [localize "STR_A3U_Bazaar_Notify_JobBonus", _bonus];
		if (missionNamespace getVariable ["ABZ_announce", true]) then {
			["ABZ_chat", [format [localize "STR_A3U_Bazaar_Chat_JobFinished", name _player, _e select 5, _e select 1, _wanted, _name]]] call CBA_fnc_globalEvent;
		};
	};
};

// --- the rest is an ordinary sale ---
private _restFull = _full - _jobN - _bbN;
// capped by every single-item row of it on any trader's table (fn_sellPrice)
private _allRows = [];
{ _allRows append (_x param [6, []]) } forEach ABZ_vendors;
private _price = [_class, _allRows] call ABZ_fnc_sellPrice;
if (_unl) then { _price = 0 };	// only the buy-back above is paid for unlimited gear
// a trader who pays nothing for it (Sell payout 0) doesn't take it either:
// whatever the job didn't need goes back, part-used magazines as they were
if (_price <= 0 && {_restFull > 0 || {_partRounds > 0}}) then {
	private _backRounds = [];
	private _backN = _restFull;
	if (_isMag) then {
		for "_r" from 1 to _restFull do { _backRounds pushBack _cap };
		{ if (_x < _cap) then { _backRounds pushBack _x } } forEach _rounds;
		_backN = count _backRounds;
	};
	if (_backN > 0) then {
		if (isNull _backTo) then {
			["ABZ_give", [_back, _backN, _backRounds], _player] call CBA_fnc_targetEvent;
		} else {
			[_backTo, _back, _backN, _backRounds, _player] call ABZ_fnc_cargoGive;
		};
		_msgs pushBack format [switch (true) do {
			case (_unl): { localize "STR_A3U_Bazaar_Notify_UnlimitedHandedBack" };
			case (_bbN > 0 && {_jobN == 0}): { localize "STR_A3U_Bazaar_Notify_NotBoughtHereHandedBack" };
			default { localize "STR_A3U_Bazaar_Notify_NotNeededHandedBack" };
		}, _backN, _name];
	};
	_restFull = 0;
	_partRounds = 0;
};
private _restPay = _restFull * _price;
if (_partRounds > 0) then { _restPay = _restPay + round (_price * _partRounds / _cap) };
if (_restFull > 0 || {_partRounds > 0}) then {
	_total = _total + _restPay;
	if (_partRounds > 0) then {
		_msgs pushBack format [localize "STR_A3U_Bazaar_Notify_MagazinesSold", _qty - _jobN - _bbN, _name, _restPay];
	} else {
		_msgs pushBack format [localize "STR_A3U_Bazaar_Notify_ItemsSold", _restFull, _name, _restPay];
	};
};

// what you sell shows up on the table (at the trader's own buy price);
// loose rounds are repacked into full magazines
private _sold = _restFull + (floor (_partRounds / _cap));
private _toTable = _sold + _bbN;	// bought-back items go back on the table they came from
// never what an open job asks for (any trader's, under any name it turns
// into): buying it back off the table to hand in would pay the bounty for
// nothing. The trader keeps those.
private _jobNames = createHashMap;
{
	private _oj = _x param [12, []];
	if (_oj isNotEqualTo [] && {(_oj select 2) < (_oj select 1)}) then { _jobNames set [toLower (_oj select 0), true] };
} forEach ABZ_vendors;
if (_toTable > 0 && {count _jobNames > 0} && {(([_class] call ABZ_fnc_yields) findIf { _x in _jobNames }) > -1}) then { _toTable = 0 };
if (_toTable > 0) then {
	private _stock = _e select 6;
	private _slot = _stock findIf { (_x select 0) == _class && {!(_x select 4)} };
	if (_slot > -1) then {
		(_stock select _slot) set [3, ((_stock select _slot) select 3) + _toTable];
		// never below today's price (a row from a restored save or before a
		// price change would otherwise sell the new arrivals cheap)
		(_stock select _slot) set [1, ((_stock select _slot) select 1) max ([_class] call ABZ_fnc_unitPrice)];
	} else {
		if (count _stock < 40) then {
			([_class] call ABZ_fnc_itemKind) params ["_kind", "_sub"];
			private _tier = [[_class, _kind, _sub] call ABZ_fnc_itemPrice] call ABZ_fnc_tierOf;
			_stock pushBack [_class, [_class] call ABZ_fnc_unitPrice, _tier, _toTable, false, _kind];
		};
	};
	// Wanted List alerts for what players sold onto the table
	if (_sold > 0) then {
		private _ri = _stock findIf { (_x select 0) == _class && {!(_x select 4)} };
		if (_ri > -1) then { [_e, [_stock select _ri], [], "sold"] call ABZ_fnc_announceRoll };
	};
};

if (_total > 0) then { [_player, _total] call ABZ_fnc_serverPay };
if (_bbN > 0) then { [_player] call ABZ_fnc_receiptSync };
["ABZ_notify", [_msgs joinString "\n"], _player] call CBA_fnc_targetEvent;
diag_log format ["[ABZ] %1 handed %2x %3 (as %4) to trader #%5: $%6 (job %7, part rounds %8)", name _player, _qty, _held, _class, _id, _total, _jobN, _partRounds];

// the seller's menu gets the updated table and job too
["ABZ_shopData", [_e, _player] call ABZ_fnc_shopPayload, _player] call CBA_fnc_targetEvent;
call ABZ_fnc_queueSave;
