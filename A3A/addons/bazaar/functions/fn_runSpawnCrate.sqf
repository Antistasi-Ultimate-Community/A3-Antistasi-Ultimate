// SERVER: the sealed crate of a smuggling run. Looks and loads like a bulk
// crate and runs the same seizure risk (it's in ABZ_crates), but it carries
// no goods (no ABZ_crate) - it can't be unpacked, sold or opened, only
// handed over at the destination stall.
// [pos, runId, holder name, destination trader name, destination town] -> crate
params [["_pos", [0, 0, 0], [[]]], ["_runId", -1, [0]], ["_owner", "", [""]], ["_destName", "", [""]], ["_destTown", "", [""]]];
private _c = [_pos] call ABZ_fnc_makeCrate;
_c setVariable ["ABZ_runId", _runId, true];
_c setVariable ["ABZ_runInfo", [_owner, _destName, _destTown], true];
_c setVariable ["ABZ_owner", _owner, true];
_c setVariable ["ABZ_lastSeen", [getPosATL _c, time]];	// fn_runWatch starts from here
ABZ_crates pushBack _c;
_c
