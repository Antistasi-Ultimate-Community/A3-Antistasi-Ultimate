// SERVER: a single-item purchase opens the buy-back window (v1.1.0): for
// "Buy-back window" seconds the same trader takes those items back at the
// full price paid. Receipt: [trader id, class, qty left, unit price,
// expires (server time), paid by the war chest, already unlimited when bought]
// [player, trader id, class, qty, unit price]
params [["_player", objNull, [objNull]], ["_id", -1, [0]], ["_class", "", [""]], ["_qty", 0, [0]], ["_price", 0, [0]]];
private _win = missionNamespace getVariable ["ABZ_buyBackSeconds", 60];
if (isNull _player || {_class == ""} || {_qty <= 0} || {_price <= 0} || {!(_win isEqualType 0)} || {_win <= 0}) exitWith {};
private _uid = getPlayerUID _player;
if (_uid == "") exitWith {};
private _list = (ABZ_receipts getOrDefault [_uid, []]) select { time < ((_x select 4) + 3) && {(_x select 2) > 0} };	// +3s: fn_serverSell's grace
// 7th field: already unlimited in the arsenal when bought? Only then is a
// buy-back of unlimited gear honoured - gear that became unlimited after
// (the bought copies fed into the arsenal made the unlock) isn't refunded
_list pushBack [_id, _class, _qty, _price, time + _win, call ABZ_fnc_factionPays, [[_class]] call ABZ_fnc_isUnlockedAny];
ABZ_receipts set [_uid, _list];
[_player] call ABZ_fnc_receiptSync;
