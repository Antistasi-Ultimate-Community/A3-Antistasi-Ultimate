// Client: the vehicle "Into vehicle nearby" delivers to - the nearest living
// vehicle with cargo space within 15m of the player.
private _v = (player nearEntities [["Car", "Tank", "Helicopter", "Ship", "Plane"], 15]) select {
	alive _x && {maxLoad _x > 0}
};
if (_v isEqualTo []) exitWith { objNull };
_v = [_v, [], { player distance _x }, "ASCEND"] call BIS_fnc_sortBy;
_v select 0
