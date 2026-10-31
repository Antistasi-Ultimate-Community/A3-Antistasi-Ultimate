// SERVER: drops a sealed bulk crate into the world near a position and
// registers it. Also used by fn_load to restore saved crates.
// [_pos, _class, _count, _player] -> crate
if (!isServer) exitWith { objNull };
params [["_pos", [0,0,0], [[]]], ["_class", "", [""]], ["_count", 25, [0]], ["_player", objNull, [objNull]]];
if (_class == "") exitWith { objNull };

private _c = [_pos] call ABZ_fnc_makeCrate;
private _owner = if (isNull _player) then { "" } else { name _player };
_c setVariable ["ABZ_crate", [_class, _count], true];
_c setVariable ["ABZ_owner", _owner, true];
ABZ_crates pushBack _c;
_c
