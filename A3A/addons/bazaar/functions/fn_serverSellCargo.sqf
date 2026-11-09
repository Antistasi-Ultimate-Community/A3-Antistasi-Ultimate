// SERVER: "SELL from vehicle / crate" (v1.1.1) - the trader takes N of a
// class straight out of a vehicle or crate beside the player, so nothing has
// to be carried (or a weapon drawn, breaking undercover). Everything is
// worked out here from the real cargo:
//   - weapons: the ones he'd buy as this class (fn_weaponSplit), stripped -
//     fitted parts and loaded magazines go back into the same cargo
//   - magazines: full ones first, each with its exact rounds
//   - items: never uniforms or vests (their pockets), never backpacks
// Then it is an ordinary sale (fn_serverSell: price, job, buy-back, table),
// with refunds handed back into the same vehicle or crate.
// [player, trader id, container, class, how many, expJobN, expReward]
#include "..\script_component.hpp"
if (!isServer) exitWith {};
call ABZ_fnc_syncCommit;	// Antistasi just saved? commit that state first
params [["_player", objNull, [objNull]], ["_id", -1, [0]], ["_box", objNull, [objNull]], ["_class", "", [""]], ["_n", 1, [0]], ["_expJobN", 0, [0]], ["_expReward", 0, [0]]];
if (isNull _player || {_class == ""}) exitWith {};
private _fnc_say = { params ["_m"]; ["ABZ_notify", [_m], _player] call CBA_fnc_targetEvent };
if !([_box] call ABZ_fnc_sellBoxOk) exitWith { [localize "STR_A3U_Bazaar_Notify_CantSellOut"] call _fnc_say };
if (_player distance _box > 20) exitWith { [localize "STR_A3U_Bazaar_Notify_BringCloser"] call _fnc_say };
private _e = [_id] call ABZ_fnc_vendorEntry;
private _why = [_player, _e] call ABZ_fnc_serverCanTrade;
if (_why != "") exitWith { [_why] call _fnc_say };
if (([_class] call ABZ_fnc_sellClass) isEqualTo "") exitWith { [localize "STR_A3U_Bazaar_Notify_TraderWontBuy"] call _fnc_say };
_n = (round _n) max 1;

private _taken = 0;
private _rounds = [];
private _whyNot = "";
switch (true) do {
	case ([_class] call ABZ_fnc_isWeaponType): {
		for "_k" from 1 to _n do {
			private _pick = [];
			{
				([_x] call ABZ_fnc_weaponSplit) params ["_sold", "_parts", "_mags", "_w"];
				if (_sold != "" && {_sold == _class}) exitWith { _pick = [_x, _parts, _mags] };
				if (_w != "" && {(_x select 0) == _class}) then { _whyNot = _w };
			} forEach (weaponsItemsCargo _box);
			if (_pick isEqualTo []) exitWith {};
			_pick params ["_entry", "_parts", "_mags"];
			private _stuck = [_box, _entry, _box, _parts, _mags] call ABZ_fnc_cargoTakeWeapon;
			if (_stuck != "") exitWith { _whyNot = _stuck };
			_taken = _taken + 1;
		};
	};
	case (isClass (configFile >> "CfgMagazines" >> _class)): {
		// full magazines first (best price, and only full ones count toward a job)
		private _all = magazinesAmmoCargo _box;
		private _mine = [];
		{ if ((_x select 0) == _class) then { _mine pushBack [_x select 1, _forEachIndex] } } forEach _all;
		_mine sort false;
		_mine = _mine select [0, _n];
		if (_mine isNotEqualTo []) then {
			private _drop = _mine apply { _x select 1 };
			_rounds = _mine apply { _x select 0 };
			clearMagazineCargoGlobal _box;
			{ if !(_forEachIndex in _drop) then { _box addMagazineAmmoCargo [_x select 0, 1, _x select 1] } } forEach _all;
			_taken = count _rounds;
		};
	};
	case (isClass (configFile >> "CfgVehicles" >> _class)): { _whyNot = localize "STR_A3U_Bazaar_Notify_TakeOutBackpack" };
	case ((getNumber (configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "type")) in [701, 801]): { _whyNot = localize "STR_A3U_Bazaar_Notify_TakeOutClothing" };
	default {
		// CBA_fnc_removeItemCargo rebuilds every uniform and vest in there:
		// magazines and items come back, but a weapon in one could come back
		// with a built-in part it no longer had, and a container packed inside
		// one would come back empty - so not while one holds either
		private _bps = everyBackpack _box;
		private _deep = (everyContainer _box) select {
			!((_x select 1) in _bps) && {(weaponCargo (_x select 1)) isNotEqualTo [] || {(everyContainer (_x select 1)) isNotEqualTo []}}
		};
		private _before = { _x == _class } count (itemCargo _box);
		if (_deep isNotEqualTo []) then {
			_whyNot = format [localize "STR_A3U_Bazaar_Notify_DeepContainer", [(_deep select 0) select 0] call ABZ_fnc_displayNameOf];
		} else {
			if (_before > 0) then {
				[_box, _class, _n min _before] call CBA_fnc_removeItemCargo;	// keeps everything else, stored uniforms/vests included
				_taken = _before - ({ _x == _class } count (itemCargo _box));
			};
		};
	};
};
if (_taken <= 0) exitWith {
	[[localize "STR_A3U_Bazaar_Notify_NothingLikeThat", format [localize "STR_A3U_Bazaar_Notify_TraderWontTake", _whyNot]] select (_whyNot != "")] call _fnc_say;
};
ServerInfo_6("[ABZ] %1 sells %2x %3 out of %4 (%5) to trader #%6",name _player,_taken,_class,typeOf _box,_box,_id);
// the sale itself - refunds go back into the same cargo
[_player, _id, _class, _taken, _expJobN, _expReward, _rounds, _box] call ABZ_fnc_serverSell;
