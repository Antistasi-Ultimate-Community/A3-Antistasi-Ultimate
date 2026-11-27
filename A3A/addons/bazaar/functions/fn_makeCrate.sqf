// SERVER: puts an empty, sealed Bazaar crate on the ground near a position,
// ready for Antistasi's logistics (or ACE cargo) to load. The caller tags it
// (bulk crate: fn_serverDeliverCrate; smuggling run: fn_runSpawnCrate) and
// registers it in ABZ_crates.
// A position out at sea (a crate saved while riding in a boat or a
// helicopter) is moved to the nearest dry land - over water a crate would
// land on the sea floor, out of everyone's reach.
// [pos] -> crate
params [["_pos", [0, 0, 0], [[]]]];
if (surfaceIsWater _pos) then {
	// widening search; a result further than asked for is BIS_fnc_findSafePos
	// giving up (it then returns the map's default spot) - not "nearest land"
	{
		private _land = [_pos, 0, _x, 3, 0, 0.5, 0, [], [[], []]] call BIS_fnc_findSafePos;
		if (_land isEqualType [] && {count _land >= 2} && {!surfaceIsWater _land} && {(_land distance2D _pos) <= _x}) exitWith { _pos = [_land select 0, _land select 1, 0] };
	} forEach [1500, 5000, 15000];
};
private _spot = _pos findEmptyPosition [1, 14, ABZ_crateClass];
if (_spot isEqualTo [] || {surfaceIsWater _spot}) then { _spot = _pos getPos [3, random 360] };

private _c = createVehicle [ABZ_crateClass, _spot, [], 0, "CAN_COLLIDE"];
_c setDir random 360;
_c setPosATL [_spot select 0, _spot select 1, 0];
clearWeaponCargoGlobal _c;
clearMagazineCargoGlobal _c;
clearItemCargoGlobal _c;
clearBackpackCargoGlobal _c;
_c lockInventory true;	// sealed: nothing comes out until it is unpacked (or handed over)
_c setVariable ["ABZ_heat", 0];

// Antistasi's own logistics can load this crate class into vehicles - hand
// it the load/unload actions. Without it, ACE cargo if present; the Bazaar's
// own load action covers everything else (see fn_applyPlayerActions).
if (!isNil "A3A_Logistics_fnc_addLoadAction") then {
	[_c] call A3A_Logistics_fnc_addLoadAction;
} else {
	if (!isNil "ace_cargo_fnc_setSize") then {
		[_c, 2] call ace_cargo_fnc_setSize;
		_c setVariable ["ace_cargo_canLoad", true, true];
	};
};
_c
