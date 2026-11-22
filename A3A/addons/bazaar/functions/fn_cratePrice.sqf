// Shared: what one sealed bulk crate of this class costs - the single rule
// for rolled stock (fn_rollStock) and restored saves (fn_load).
//   unit price (fn_unitPrice) x crate size x the crate multiplier this server
//   uses (the unlock markup when a crate unlocks, the volume discount when it
//   can't), rounded to $5 - but never cheaper per item than Antistasi's Arms
//   Dealer pays back for it (unpack, take from the arsenal, sell to the
//   dealer = free money).
// [class] -> number
params [["_class", "", [""]]];
private _unit = [_class] call ABZ_fnc_unitPrice;
private _bulkMult = if (call ABZ_fnc_unlocksEnabled) then {
	missionNamespace getVariable ["ABZ_bulkMultiplier", 1.5]
} else {
	missionNamespace getVariable ["ABZ_bulkDiscount", 0.6]
};
private _bulkSize = call ABZ_fnc_bulkSize;
private _p = 5 * round ((_unit * _bulkSize * _bulkMult) / 5);
private _dealer = [_class] call ABZ_fnc_dealerPrice;
if (_dealer isNotEqualTo []) then {	// at "Price multiplier" 0 too
	_p = _p max (5 * ceil ((1.1 * (_dealer select 1) * _bulkSize) / 5));
};
_p
