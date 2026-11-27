// SERVER: sends a player their open buy-back receipts, so the SELL list
// can show the full-price buy-back (the server decides again on the sale).
// -> ABZ_receipts [[trader id, class, qty left, unit price, seconds left], ...]
params [["_player", objNull, [objNull]]];
if (isNull _player) exitWith {};
private _uid = getPlayerUID _player;
private _list = (ABZ_receipts getOrDefault [_uid, []]) select { time < ((_x select 4) + 3) && {(_x select 2) > 0} };	// +3s: fn_serverSell's grace
ABZ_receipts set [_uid, _list];
// a receipt for gear that has become unlimited since it was bought isn't
// honoured (fn_serverSell) - so the menu doesn't offer it either
private _show = _list select { (_x param [6, false]) || {!([[_x select 1]] call ABZ_fnc_isUnlockedAny)} };
["ABZ_receipts", [_show apply { [_x select 0, _x select 1, _x select 2, _x select 3, ((_x select 4) - time) max 0] }], _player] call CBA_fnc_targetEvent;
