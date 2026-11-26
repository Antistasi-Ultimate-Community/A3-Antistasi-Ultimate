#include "..\..\script_component.hpp"
/*
	Maintainer:
		Creep'nCrunch / jwoodruff40
	
	Description:
		Fills a loot crate using bazaar rollStock function, which handles quantities by rarity tier and war level,
		and whether to include all items in game or just those used by the factions in game
	
	Params:
		_crate <OBJECT> <Default: objNull>
	
	Dependencies:
		ABZ_fnc_buildPool, ABZ_fnc_rollStock, ABZ_fnc_addCargo
	
	Scope:
		Server
	
	Environment:
		Unscheduled
	
	Usage:
		[_crate] call A3A_fnc_fillLootCrate;
	
	Return:
		Nothing
*/
params [["_crate", objNull, [objNull]]];

if (_crate isEqualTo objNull) exitWith {
	Error("fillLootCrate was called with an invalid crate object");
};

if (!isServer) exitWith {
	Error("fillLootCrate was not called on the server? Recalling on server");
	_this remoteExec ["A3A_fnc_fillLootCrate", 2];
};

//Empty the crate
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

// Build pool if not already built (e.g. if bazaar traders are disabled)
if (ABZ_pool isEqualTo []) then { [] call ABZ_fnc_buildPool };

//Double max types if the crate is an ammo truck
private _crateQtyScalar = [1,2] select (typeOf _crate in FactionGet(all,"vehiclesAmmoTrucks"));

/* Do we need this?
private _quantityScalingFactor = if (minWeaps < 0) then {1} else {
	private _playerCount = if(!isNil "spoofedPlayerCount") then {spoofedPlayerCount} else {A3A_activePlayerCount};
	//Scale it down to a 50% loot rate at 20 players.
	1 / (1 + _playerCount / 20);
};
_crateQtyScalar = _crateQtyScalar * _quantityScalingFactor;
*/

/* Crate functions:
addWeaponWithAttachmentsCargoGlobal
addMagazineCargoGlobal
addItemCargoGlobal
addBackpackCargoGlobal
*/

private _stock = [[], _crateQtyScalar] call ABZ_fnc_rollStock;

{
	_x params [
		["_class", "", [""]],
		"", // price
		"", // rarity tier
		["_qty", 0, [0]],
		["_isBulk", false, [false]], // bulk unlock crate
		["_kind", "", [""]]
	];
	
	if (_class isEqualTo "" || {_qty <= 0} || {_kind isEqualTo ""} || {_kind isEqualTo "vehicle"}) then { continue };
	if (_isBulk && {minWeaps > 0}) then { _qty = minWeaps };

	[_crate, _class, _qty] call ABZ_fnc_addCargo;
} forEach _stock;
