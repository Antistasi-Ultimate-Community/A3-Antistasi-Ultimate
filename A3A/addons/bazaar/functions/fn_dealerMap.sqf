// Shared: the Arms Dealer's price list that applies right now, built the
// way HALs builds its own: only the categories of the stores the dealer
// (traderX) actually stocks - HALs_store_trader_type, set by Antistasi when
// it spawns him - walked in order, the LAST listing of a class winning
// (HALs overwrites its price per exact class name, so a vanilla listing
// after a DLC one is the price he really charges). Folded to lowercase
// class -> [cheapest, dearest] - different only if a mod spells one class
// two ways. Before the dealer exists, every store's list (ABZ_dealerList,
// cheapest and dearest of all listings) stands in - the safe side.
// Cached per store set (several kept, so a dealer leaving and coming back
// costs nothing).
// -> [map, exact (true when read from the dealer's own stores), cache key]
private _trader = missionNamespace getVariable ["traderX", objNull];
private _types = [];
if (_trader isEqualType objNull && {!isNull _trader}) then {
	_types = _trader getVariable ["HALs_store_trader_type", []];
	if !(_types isEqualType []) then { _types = [] };
};
if (_types isEqualTo []) exitWith { [missionNamespace getVariable ["ABZ_dealerList", createHashMap], false, []] };
if (isNil "ABZ_dealerMapCaches") then { ABZ_dealerMapCaches = createHashMap };
private _ck = str _types;
private _hit = ABZ_dealerMapCaches getOrDefault [_ck, []];
if (_hit isNotEqualTo []) exitWith { [_hit select 0, true, _hit select 1] };

private _root = configFile >> "cfgHALsAddons" >> "cfgHALsStore";
private _raw = createHashMap;	// exact class name -> price, last listing wins (like HALs)
{
	if (_x isEqualType "") then {
		{
			{
				_raw set [configName _x, (getNumber (_x >> "price")) max 0];
			} forEach ("true" configClasses (_root >> "categories" >> _x));
		} forEach (getArray (_root >> "stores" >> _x >> "categories"));
	};
} forEach _types;
private _m = createHashMap;
{
	if (_y > 0) then {
		private _k = toLower _x;
		private _old = _m getOrDefault [_k, [_y, _y]];
		_m set [_k, [(_old select 0) min _y, (_old select 1) max _y]];
	};
} forEach _raw;
private _key = +_types;
ABZ_dealerMapCaches set [_ck, [_m, _key]];
[_m, true, _key]
