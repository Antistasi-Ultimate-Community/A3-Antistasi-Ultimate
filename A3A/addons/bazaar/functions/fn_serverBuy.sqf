// SERVER: BUY pressed. Re-validates everything (the client only pre-checks),
// charges the money, takes the quantity off the slot, and delivers: single
// items straight into the buyer's kit, bulk as a sealed crate by the stall,
// military vehicles parked nearby or into the HQ garage.
// Crates are set down 5m out to the trader's side, never at his feet.
if (!isServer) exitWith {};
call ABZ_fnc_syncCommit;	// Antistasi just saved? commit that state before this purchase changes it
// _dest: 0 = into the buyer's kit, 1 = into _veh's cargo, 2 = into an open crate by the stall
// _wantClass/_wantPrice: what the player's menu showed in that row
params [["_player", objNull, [objNull]], ["_id", -1, [0]], ["_slot", -1, [0]], ["_qty", 1, [0]], ["_dest", 0, [0]], ["_veh", objNull, [objNull]], ["_wantClass", "", [""]], ["_wantPrice", -1, [0]]];
if (isNull _player) exitWith {};

private _e = [_id] call ABZ_fnc_vendorEntry;
private _why = [_player, _e] call ABZ_fnc_serverCanTrade;
if (_why != "") exitWith { ["ABZ_notify", [_why], _player] call CBA_fnc_targetEvent };

private _stock = _e select 6;
if (_slot < 0 || {_slot >= count _stock}) exitWith {
	["ABZ_notify", ["That item isn't on the table any more."], _player] call CBA_fnc_targetEvent;
};
(_stock select _slot) params ["_class", "_price", "_tier", "_left", "_bulk", "_kind"];
// never below today's price rules (a setting changed since the roll, or a
// crate size): a row that has to go up trips the "table changed" refresh
// below, so the buyer sees and confirms the new price
if (_kind isNotEqualTo "vehicle" && {_price isEqualType 0}) then {
	private _now = if (_bulk) then { [_class] call ABZ_fnc_cratePrice } else { [_class] call ABZ_fnc_unitPrice };
	if (_now > _price || {_bulk && {_now != _price}}) then { (_stock select _slot) set [1, _now]; _price = _now };	// a crate: exactly today's crate price
};
// the table changed under the player's menu (restock while it was open):
// never buy "whatever is in that row now" - show the new table instead
if (_class != _wantClass || {_price != _wantPrice}) exitWith {
	["ABZ_notify", ["The trader's table changed while you were looking - here's the new one. Nothing was charged."], _player] call CBA_fnc_targetEvent;
	["ABZ_shopData", [_e, _player] call ABZ_fnc_shopPayload, _player] call CBA_fnc_targetEvent;
};
_qty = (round _qty) max 1;
if (_bulk) then { _qty = 1 };
if (_left <= 0) exitWith {
	["ABZ_notify", ["SOLD OUT - come back after the restock."], _player] call CBA_fnc_targetEvent;
};
if (_qty > _left) exitWith {
	["ABZ_notify", [format ["Only %1 left.", _left]], _player] call CBA_fnc_targetEvent;
};

// --- military vehicles: every refusal is checked BEFORE any money moves ---
if (_kind isEqualTo "vehicle") exitWith {
	private _slotArr = _stock select _slot;
	private _cat = _slotArr param [6, ""];
	private _sideVar = _slotArr param [7, ""];
	if !(isClass (configFile >> "CfgVehicles" >> _class)) exitWith {
		["ABZ_notify", ["That vehicle isn't available on this server."], _player] call CBA_fnc_targetEvent;
	};
	([_cat] call ABZ_fnc_vehReq) params ["_met", "", "_plain"];
	if (!_met) exitWith {
		["ABZ_notify", [format ["The trader won't hand it over until your side can keep it running - it %1.", _plain]], _player] call CBA_fnc_targetEvent;
	};

	// garage delivery when the server wants it and the garage can take it
	private _garage = (missionNamespace getVariable ["ABZ_vehDelivery", 0]) == 1
		&& {!isNil "HR_GRG_fnc_addVehiclesByClass"} && {!isNil "HR_GRG_fnc_getCatIndex"}
		&& {([_class] call HR_GRG_fnc_getCatIndex) >= 0};
	private _full = false;
	if (_garage && {!isNil "HR_GRG_Vehicles"} && {!isNil "HR_GRG_VehCap"}) then {
		private _n = 0;
		{ _n = _n + count _x } forEach HR_GRG_Vehicles;
		_full = _n >= (call HR_GRG_VehCap);
	};
	if (_full) exitWith {
		["ABZ_notify", ["The HQ garage is full - make room in it first."], _player] call CBA_fnc_targetEvent;
	};
	private _spot = [];
	if (!_garage) then { _spot = [_e select 2, _class, _cat] call ABZ_fnc_vehSpot };
	if (!_garage && {_spot isEqualTo []}) exitWith {
		["ABZ_notify", [["No clear spot to park it around here - try again from another trader.", "No water deep enough for a boat near this stall."] select (_cat == "BOAT")], _player] call CBA_fnc_targetEvent;
	};

	private _personal = (missionNamespace getVariable ["ABZ_funds", 0]) != 1 || {(call ABZ_fnc_getFactionMoney) < 0};
	if !([_player, _price] call ABZ_fnc_serverCharge) exitWith {};
	_slotArr set [3, 0];
	[_player, _class, _sideVar, _spot, _personal] call ABZ_fnc_serverDeliverVeh;
	diag_log format ["[ABZ] %1 bought vehicle %2 (%3) for $%4 from trader #%5", name _player, _class, _cat, _price, _id];
	["ABZ_shopData", [_e, _player] call ABZ_fnc_shopPayload, _player] call CBA_fnc_targetEvent;
	call ABZ_fnc_queueSave;
};

// where crates are set down: 5m out to the trader's side (fn_dropSpot)
private _drop = [_e] call ABZ_fnc_dropSpot;

// vehicle delivery needs a real vehicle beside the buyer BEFORE any money moves
if (!_bulk && {_dest == 1} && {isNull _veh || {!alive _veh} || {_player distance _veh > 15} || {maxLoad _veh <= 0}}) exitWith {
	["ABZ_notify", ["No vehicle with cargo space within 15m of you - park it closer, or deliver to your kit or a crate."], _player] call CBA_fnc_targetEvent;
};

private _total = _price * _qty;
if !([_player, _total] call ABZ_fnc_serverCharge) exitWith {};
(_stock select _slot) set [3, _left - _qty];

private _name = [_class] call ABZ_fnc_displayNameOf;
if (_bulk) then {
	private _n = call ABZ_fnc_bulkSize;
	[_drop, _class, _n, _player] call ABZ_fnc_serverDeliverCrate;
	["ABZ_notify", [format ["Bought a sealed crate: %1x %2 for $%3.\nIt's beside the stall. Load it up, get it to HQ, and UNPACK it into the arsenal.", _n, _name, _total]], _player] call CBA_fnc_targetEvent;
	diag_log format ["[ABZ] %1 bought a bulk crate of %2x %3 for $%4 from trader #%5", name _player, _n, _class, _total, _id];
} else {
	switch (_dest) do {
		case 1: {
			[_veh, _class, _qty] call ABZ_fnc_addCargo;
			["ABZ_notify", [format ["Bought %1x %2 for $%3 - loaded into the %4.", _qty, _name, _total, getText (configOf _veh >> "displayName")]], _player] call CBA_fnc_targetEvent;
		};
		case 2: {
			[_drop, _class, _qty, _player] call ABZ_fnc_serverOpenCrate;
			["ABZ_notify", [format ["Bought %1x %2 for $%3 - it's in the open crate beside the stall.", _qty, _name, _total]], _player] call CBA_fnc_targetEvent;
		};
		default {
			["ABZ_give", [_class, _qty], _player] call CBA_fnc_targetEvent;
			["ABZ_notify", [format ["Bought %1x %2 for $%3.", _qty, _name, _total]], _player] call CBA_fnc_targetEvent;
		};
	};
	diag_log format ["[ABZ] %1 bought %2x %3 for $%4 from trader #%5 (dest %6)", name _player, _qty, _class, _total, _id, _dest];
	// the buy-back window: this trader takes them back at this price for a minute
	[_player, _id, _class, _qty, _price] call ABZ_fnc_receiptAdd;
};

// refresh the buyer's menu with the new quantities
["ABZ_shopData", [_e, _player] call ABZ_fnc_shopPayload, _player] call CBA_fnc_targetEvent;
call ABZ_fnc_queueSave;
