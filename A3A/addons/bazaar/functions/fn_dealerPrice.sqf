// Shared: what Antistasi Ultimate's own Arms Dealer (the HALs store) does
// with this class right now -> [he sells it for, he buys it back for], or
// [] when he doesn't deal in it at all (or the dealer is switched off).
// "Sells for" is 1e9 when he has nothing that becomes this class; "buys back
// for" is 0 when he doesn't take it or anything it becomes.
//
// The Bazaar must never pay more than the dealer would (you asked for
// "reduced prices compared to the black market"), and must never sell for
// less than the dealer pays back - otherwise buying at one and selling at
// the other is free money. Mirrors HALs:
//   - list prices from only the stores the dealer stocks (fn_dealerMap);
//     he sells only what they list, and buys back a class not listed there
//     at its scope-2 parent's price, like HALs' sell screen does (before
//     the dealer exists: both, worst case)
//   - the mission's weapon black-market discount, the dealer's sale, and
//     the store's sell factor
// and follows items through the arsenal, attachment switches and presets:
// he effectively sells this class as cheap as anything of his you can get
// it out of (fn_dealerReach / fn_yields), and buys it back as dear as
// anything it turns into (fn_turnsInto).
params [["_class", "", [""]]];
if (_class == "") exitWith { [] };
private _off = missionNamespace getVariable ["disableTrader", false];
if (_off isEqualTo true || {_off isEqualTo 1}) exitWith { [] };
(call ABZ_fnc_dealerMap) params ["_map", "_exact"];
if (count _map == 0) exitWith { [] };

// one class's listings: its own; the scope-2 parent's when it has none
private _fnc_listing = {
	params ["_c"];
	private _own = _map getOrDefault [toLower _c, []];
	private _par = [];
	private _parent = inheritsFrom (configFile >> "CfgWeapons" >> _c);
	if (isClass _parent && {getNumber (_parent >> "scope") == 2}) then {
		_par = _map getOrDefault [toLower (configName _parent), []];
	};
	if (_exact && {_own isNotEqualTo []}) exitWith { [_own] };
	[_own, _par] select { _x isNotEqualTo [] }
};

private _ls = [_class] call _fnc_listing;
private _lMin = 1e9;
private _lMax = 0;
{ _lMax = _lMax max (_x select 1) } forEach _ls;
// he only SELLS what his stores list (the parent's price is for buying
// back); before his stores are known, assume the worst - parent too
if (_exact) then {
	private _own = _map getOrDefault [toLower _class, []];
	if (_own isNotEqualTo []) then { _lMin = _own select 0 };
} else {
	{ _lMin = _lMin min (_x select 0) } forEach _ls;
};
// cheapest dealer item you can get this class out of (fn_dealerReach)
_lMin = _lMin min (((call ABZ_fnc_dealerReach) select 1) getOrDefault [toLower _class, 1e9]);
// dearest pay-back for anything this class turns into
private _self = toLower _class;
{
	if (_x != _self) then {
		{ _lMax = _lMax max (_x select 1) } forEach ([_x] call _fnc_listing);
	};
} forEach ([_class] call ABZ_fnc_turnsInto);
if (_lMin >= 1e9 && {_lMax <= 0}) exitWith { [] };

private _disc = missionNamespace getVariable ["A3U_blackMarketDiscountWeapon", 0];
if !(_disc isEqualType 0) then { _disc = 0 };
private _ldMin = if (_lMin >= 1e9) then { 1e9 } else { round (_lMin - ((_disc / 10) * _lMin)) };
private _ldMax = round (_lMax - ((_disc / 10) * _lMax));
private _trader = missionNamespace getVariable ["traderX", objNull];
private _sale = 0;
if (_trader isEqualType objNull && {!isNull _trader}) then {
	_sale = _trader getVariable ["HALs_store_trader_sale", 0];
	if !(_sale isEqualType 0) then { _sale = 0 };
	_sale = (_sale min 1) max 0;
};
private _sf = missionNamespace getVariable ["HALs_store_sellFactor", getNumber (configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "sellFactor")];
if (!(_sf isEqualType 0) || {_sf <= 0}) then { _sf = 0.5 };
_sf = _sf min 1;
[[_ldMin * (1 - _sale), 1e9] select (_lMin >= 1e9), _ldMax * _sf]
