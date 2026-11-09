// Shared: what the Bazaar charges for ONE of this class - the single source
// for stock prices, sold-item table prices, job bounties and sell payouts.
//   base price by what the item is (fn_itemPrice) x rarity markup x the
//   server's price multiplier, rounded to $5 - but never less than 10% above
//   what Antistasi's Arms Dealer pays back for it (fn_dealerPrice), so the
//   Bazaar can't be bought out and sold on to the dealer at a profit. A
//   preset weapon adds the price of every part it comes with.
// [class] -> number (0 = free on this server)
params [["_class", "", [""]]];
([_class] call ABZ_fnc_itemKind) params ["_kind", "_sub"];
if (_kind == "") exitWith { 0 };
private _base = [_class, _kind, _sub] call ABZ_fnc_itemPrice;
private _markup = ([[_base] call ABZ_fnc_tierOf] call ABZ_fnc_rarityInfo) select 3;
private _mult = missionNamespace getVariable ["ABZ_priceMultiplier", 1];
private _p = 5 * round ((_base * _markup * _mult) / 5);
private _dealer = [_class] call ABZ_fnc_dealerPrice;
// (kept at "Price multiplier" 0 too: free stock he buys back would be free money)
if (_dealer isNotEqualTo []) then {
	_p = _p max (5 * ceil ((1.1 * (_dealer select 1)) / 5));
};
// a preset weapon comes with its parts (scope, laser, suppressor...): it
// costs the gun plus each part, so it can't be bought cheap and stripped
// for parts to sell on. Parts are priced as what a trader deals them as.
if (_kind == "weapon") then {
	{
		private _part = getText (_x >> "item");
		if (_part != "") then {
			private _pc = [_part] call ABZ_fnc_sellClass;
			if (_pc == "") then { _pc = _part };
			if (_pc != _class) then { _p = _p + ([_pc] call ABZ_fnc_unitPrice) };
		};
	} forEach ("true" configClasses (configFile >> "CfgWeapons" >> _class >> "LinkedItems"));
};
_p
