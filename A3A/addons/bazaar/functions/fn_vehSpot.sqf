// SERVER: where a vehicle bought at this stall gets parked -> [pos, dir] or
// [] when there is nowhere suitable (the purchase is then refused BEFORE
// any money moves).
//   boats       nearest boat-deep water within ABZ_boatRange (450m)
//   helicopters a flat, clear spot 25-300m out
// Everything stays well inside 500m of the buyer: Antistasi's garbage
// cleaner deletes rebel vehicles with no rebel within 500m.
//   ground      Antistasi's own vehicle-spot finder (roads first), never
//               closer than 12m to the stall
params [["_stall", [0, 0, 0], [[]]], ["_class", "", [""]], ["_cat", "", [""]]];

if (_cat == "BOAT") exitWith {
	private _w = [_stall, ABZ_boatRange] call ABZ_fnc_waterNear;
	if (_w isEqualTo []) then { [] } else { [_w, random 360] }
};

if (_cat == "HELI") exitWith {
	private _p = [_stall, 25, 300, 12, 0, 0.15, 0, [], [[0, 0, 0], [0, 0, 0]]] call BIS_fnc_findSafePos;
	if ((_p select 0) == 0 && {(_p select 1) == 0}) then { [] } else { [[_p select 0, _p select 1, 0], random 360] }
};

private _r = [];
if (!isNil "SCRT_fnc_common_findSafePositionForVehicle") then {
	_r = [_stall, _class, 150] call SCRT_fnc_common_findSafePositionForVehicle;
};
if (isNil "_r" || {!(_r isEqualType [])} || {count _r < 2} || {((_r select 0) distance2D _stall) < 12}) then {
	private _e = _stall findEmptyPosition [12, 150, _class];
	_r = if (_e isEqualTo []) then { [] } else { [_e, random 360] };
};
_r
