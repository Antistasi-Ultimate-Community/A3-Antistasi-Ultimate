// SERVER: the spawned trader unit for an id, or objNull when despawned.
params [["_id", -1, [0]]];
private _o = ABZ_vendorObjs getOrDefault [_id, []];
if (_o isEqualTo []) exitWith { objNull };
_o select 0
