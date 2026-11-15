// SERVER: removes a Bazaar crate from the world for good (unpacked,
// delivered, seized, failed run, reset) without leaving its vehicle
// believing it still carries it: ACE cargo gets its own removal (frees the
// space), Antistasi logistics its own unload (fn_crateRelease), then the
// crate is deleted. A crate on a destroyed vehicle is simply deleted.
// While Antistasi logistics is sliding cargo on or off the vehicle, the
// removal waits until it's done (up to 30s) - pulling a crate out from under
// it would jam the vehicle's cargo for good. The crate is forgotten at once.
params [["_c", objNull, [objNull]]];
if (isNull _c) exitWith {};
isNil { private _i = ABZ_crates find _c; if (_i > -1) then { ABZ_crates deleteAt _i } };	// forget it first, while it still compares as itself
// a crate standing free may be one Antistasi logistics is about to load
// (its load is a scheduled script that attaches the crate only once it
// runs - seconds later on a busy server): it disappears for the players at
// once, and is really removed only after it has stayed free for ~30s. A load
// that started meanwhile has attached it, and it is unloaded properly below.
if (isNull attachedTo _c && {!isNil "A3A_Logistics_fnc_unload"} && {(_c getVariable ["ABZ_removing", 0]) < 10}) exitWith {
	_c setVariable ["ABZ_removing", (_c getVariable ["ABZ_removing", 0]) + 1];
	_c hideObjectGlobal true;
	_c enableSimulationGlobal false;
	[{ [_this] call ABZ_fnc_crateRemove }, _c, 3] call CBA_fnc_waitAndExecute;
};
private _v = attachedTo _c;
private _inAce = !isNull _v && {_c in (_v getVariable ["ace_cargo_loaded", []])};
if (!isNull _v && {alive _v} && {!_inAce} && {!isNil "A3A_Logistics_fnc_unload"} && {_v getVariable ["LoadingCargo", false]}) exitWith {
	[
		{ params ["_c", "_v"]; isNull _c || {!alive _v} || {!(_v getVariable ["LoadingCargo", false])} },
		{ params ["_c"]; [_c] call ABZ_fnc_crateRemove },
		[_c, _v], 30,
		{ params ["_c"]; if (!isNull _c) then { detach _c; deleteVehicle _c } }
	] call CBA_fnc_waitUntilAndExecute;
};
if (_inAce && {alive _v} && {!isNil "ace_cargo_fnc_removeCargoItem"}) then {
	[_c, _v] call ace_cargo_fnc_removeCargoItem;	// deletes it
} else {
	if (!isNull _v) then { [_c] call ABZ_fnc_crateRelease };
};
if (!isNull _c) then {
	if (!isNull attachedTo _c) then { detach _c };
	deleteVehicle _c;
};
