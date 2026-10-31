// Shared: what a trader pays for one (FULL, for magazines) of this item.
//   = the Bazaar's own price for it (fn_unitPrice) x "Sell payout",
//     always below that price (no buy-and-sell-back loop at any setting),
//   and never more than 90% of what Antistasi's Arms Dealer would pay
//     (or below his own selling price) - reduced versus the black market,
//   and below the per-item price of a bulk crate of it (no
//     buy-a-crate-sell-it-back loop).
// 0 = he won't buy it (not something he'd sell, or payout set to 0).
// rows (optional): stock rows already on a table - [class, price, tier,
// qty, isBulk, kind, ...]; a single-item row of this class caps the payout
// at that row's price x the payout too, so a row priced before a restart
// or a settings change can never be bought cheap and sold straight back.
params [["_class", "", [""]], ["_rows", [], [[]]]];
_class = [_class] call ABZ_fnc_sellClass;
if (_class == "") exitWith { 0 };

private _frac = missionNamespace getVariable ["ABZ_sellFraction", 0.3];
if (_frac <= 0) exitWith { 0 };
private _buy = [_class] call ABZ_fnc_unitPrice;
if (_buy <= 0) exitWith { 0 };

private _p = (floor (_buy * _frac)) min (_buy - 1);
private _dealer = [_class] call ABZ_fnc_dealerPrice;
if (_dealer isNotEqualTo []) then {
	_dealer params ["_dSells", "_dPays"];
	_p = _p min (floor (0.9 * _dSells));	// 1e9 when he sells nothing that becomes it
	if (_dPays > 0) then { _p = _p min (floor (0.9 * _dPays)) };	// 0 when he doesn't take it
};
// never above 90% of the per-item price of a bulk crate of it, whichever
// crate pricing this server uses (volume discount when unlocks are off,
// the bulk multiplier when they're on) - no buy-a-crate-sell-it-back loop
private _bulk = if (call ABZ_fnc_unlocksEnabled) then {
	missionNamespace getVariable ["ABZ_bulkMultiplier", 1.5]
} else {
	missionNamespace getVariable ["ABZ_bulkDiscount", 0.6]
};
if (_bulk isEqualType 0 && {_bulk > 0}) then {
	_p = _p min (floor (0.9 * _buy * _bulk));
};
{
	if (_x isEqualType [] && {count _x >= 6} && {(_x select 0) isEqualType ""} && {(_x select 0) == _class} && {!(_x select 4)} && {(_x select 5) != "vehicle"}) then {
		private _rp = _x select 1;
		if (_rp isEqualType 0) then { _p = _p min (floor (_rp * _frac)) min (_rp - 1) };
	};
} forEach _rows;
_p max 0
