// SERVER: an OPEN (unlocked) crate beside the stall for single-item
// purchases sent "as a crate". Repeat buys by the same player within a
// few minutes land in the same crate. Antistasi's logistics can load it.
// [_stallPos, _class, _qty, _player] -> crate
if (!isServer) exitWith { objNull };
params [["_pos", [0,0,0], [[]]], ["_class", "", [""]], ["_qty", 1, [0]], ["_player", objNull, [objNull]]];
if (_class == "" || {isNull _player}) exitWith { objNull };

private _uid = getPlayerUID _player;
private _c = objNull;
{
	if (alive _x && {(_x getVariable ["ABZ_openCrate", ""]) == _uid} && {isNull attachedTo _x}) exitWith { _c = _x };
} forEach (nearestObjects [_pos, [ABZ_crateClass], 12]);

if (isNull _c) then {
	private _spot = _pos findEmptyPosition [1, 14, ABZ_crateClass];
	if (_spot isEqualTo []) then { _spot = _pos getPos [3, random 360] };
	_c = createVehicle [ABZ_crateClass, _spot, [], 0, "CAN_COLLIDE"];
	_c setDir random 360;
	_c setPosATL [_spot select 0, _spot select 1, 0];
	clearWeaponCargoGlobal _c;
	clearMagazineCargoGlobal _c;
	clearItemCargoGlobal _c;
	clearBackpackCargoGlobal _c;
	_c setVariable ["ABZ_openCrate", _uid, true];
	if (!isNil "A3A_Logistics_fnc_addLoadAction") then {
		[_c] call A3A_Logistics_fnc_addLoadAction;
	} else {
		if (!isNil "ace_cargo_fnc_setSize") then {
			[_c, 2] call ace_cargo_fnc_setSize;
			_c setVariable ["ace_cargo_canLoad", true, true];
		};
	};
};

[_c, _class, _qty] call ABZ_fnc_addCargo;
_c
