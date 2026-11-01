/*
	Author:
		Creep'nCrunch / jwoodruff40
	
	Description:
		(re)rolls the legacy vendor's stock with *all* items and vehicles from ABZ_Pool and ABZ_vehPool instead of limited selections
		Quantities kept in stock are still determined by rarity tiers, but refreshed when this function is run instead of needing a server restart
		Bulk unlock crates generated randomly, but more of them than at the other vendors
		Basically, a bastardized version of fn_rollStock
	
	Params:
		None
	
	Dependencies:
		N/A
	
	Scope:
		Server
	
	Environment:
		Scheduled
	
	Usage:
		spawn ABZ_fnc_legacyVendorRestock;
	
	Return:
		Nothing
*/
#include "..\script_component.hpp"
if (!isServer) exitWith {};

// * Nothing to do until the legacy vendor exists and the equipment pool has been built by fn_buildPool
if (ABZ_legacyVendorEntry isEqualTo [] || {ABZ_pool isEqualTo []}) exitWith {};

// * This function is assumed to be slow (e.g. an RHS/3CB modset adds about 13k items) and is triggered with each pass of the vendor loop (fn_vendorLoop)
// * Use a timeout instead of boolean flag so an unexpected early exit condition won't block restocking forever
if (time < (missionNamespace getVariable ["ABZ_legacyVendorRestockTimeout", 0])) exitWith {};
ABZ_legacyVendorRestockTimeout = time + 600;

// ---------------------------------------------------------------------------
// Part 1: every equipment item, with a limited quantity
//
// ABZ_pool [class, basePrice, tier, kind, subtype] --> Stock rows [class, price, tier, qtyLeft, isBulkCrate, kind]
//   tier: 0 common, 1 uncommon, 2 rare, 3 exotic
//   kind: "weapon", "ammo", "gear", "clothing"
// ---------------------------------------------------------------------------

// War-tier scaling of quantities (same rule as fn_rollStock)
private _tf = call ABZ_fnc_tierFactor;
private _fQty = [0.75 + 0.75 * _tf, 1] select (_tf isEqualTo 0.45);

// [min, max] quantity per rarity tier
private _qtyByTier = [[5, 15], [3, 8], [1, 3], [1, 1]];

// Build one stock row for every equipment item
private _stock = ABZ_pool apply {
	_x params ["_c", "", "_tier", "_kind"];
	(_qtyByTier select _tier) params ["_lo", "_hi"];
	private _qty = _lo + floor random (_hi - _lo + 1);
	if (_kind isEqualTo "ammo") then { _qty = _qty * 3 };
	[_c, [_c] call ABZ_fnc_unitPrice, _tier, 1 max round (_qty * _fQty), false, _kind]
};

// ---------------------------------------------------------------------------
// Part 2: a few bulk unlock crates (each crate = one arsenal unlock of that item)
//
// "random" selection on every restock
// ---------------------------------------------------------------------------

// Rarity gate by war tier: [highest tier of single items, highest tier of bulk crates] allowed right now.
private _gate = call ABZ_fnc_progressGate;
private _bulkCands = (ABZ_pool select { (_x select 2) <= (_gate select 1) }) call BIS_fnc_arrayShuffle; // Filter the available items by war tier and shuffle
_bulkCands = _bulkCands select [0, 100]; // Trim to the first 100 (somewhat arbitrary number) items to reduce computational cost of subsequent checks
_bulkCands = _bulkCands select { !([[_x select 0]] call ABZ_fnc_isUnlockedAny) }; // Remove already unlocked items

private _bulkWeights = [20, 45, 30, 5]; // [common, uncommon, rare, exotic]
for "_i" from 1 to round (missionNamespace getVariable ["ABZ_legacyVendorBulkSlots", 12]) do {
	if (_bulkCands isEqualTo []) exitWith {};
	private _pick = _bulkCands selectRandomWeighted (_bulkCands apply { _bulkWeights select (_x select 2) }); // pick a random item weighted by its tier
	_bulkCands deleteAt (_bulkCands find _pick);
	_pick params ["_c", "", "_tier", "_kind"];
	_stock pushBack [_c, [_c] call ABZ_fnc_cratePrice, _tier, 1, true, _kind]; // add bulk crate to stock
};

// ---------------------------------------------------------------------------
// Part 3: one of every military vehicle in the vehicle catalog
// TODO: build a rarity <--> quantity map for vehicles, similar to equipment items
// TODO: update fn_buildVehPool (with CBA setting) to include *all* vehicles (not just those from the factions in use), simliar to equipment items
//
// ABZ_vehPool [class, category, source side variable] --> vehicle stock row [class, price, tier, 1, false, "vehicle", category, source side variable]
// ---------------------------------------------------------------------------
{
	_x params ["_c", "_cat", "_sideVar"];
	private _tierV = (ABZ_vehCats getOrDefault [_cat, ["", 1]]) select 1; // rarity from category (ABZ_vehCats: [name, tier, weight, heavy])
	_stock pushBack [_c, [_c, _cat] call ABZ_fnc_vehPrice, _tierV, 1, false, "vehicle", _cat, _sideVar];
} forEach ABZ_vehPool;

// ---------------------------------------------------------------------------
// Part 4: swap in the new table in one step (players browsing see the old table until it is complete),
// start the next restock countdown, and count this restock. The entry is the vendor's array (fn_vendorCreate):
//   6 stock   7 next restock time   8 restocks done
// ---------------------------------------------------------------------------
ABZ_legacyVendorEntry set [6, _stock];
ABZ_legacyVendorEntry set [7, time + 60 * (missionNamespace getVariable ["ABZ_rotationMinutes", 90])];
ABZ_legacyVendorEntry set [8, (ABZ_legacyVendorEntry select 8) + 1];
ABZ_legacyVendorRestockTimeout = 0;		// release the busy flag so the next timed restock can run
Info_1("[ABZ] Legacy Vendor restocked: %1 rows",count _stock);
