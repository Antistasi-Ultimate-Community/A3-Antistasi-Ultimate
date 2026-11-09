// Client (fallback loader only): the vehicle a crate could be strapped to -
// the nearest stationary car/truck, tank, helicopter or boat within 8m.
private _v = (player nearEntities [["Car", "Tank", "Helicopter", "Ship"], 8]) select {
	alive _x && {speed _x < 5} && {!(_x isKindOf "Motorcycle")}
};
if (_v isEqualTo []) exitWith { objNull };
_v = [_v, [], { player distance _x }, "ASCEND"] call BIS_fnc_sortBy;
_v select 0
