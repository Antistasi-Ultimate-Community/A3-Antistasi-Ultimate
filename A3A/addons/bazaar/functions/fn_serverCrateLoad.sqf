// SERVER: fallback loader for servers WITHOUT Antistasi's logistics - straps
// a sealed crate onto a vehicle (up to 4 per vehicle). attachTo needs the
// crate local, and crates are server-created, so this runs here.
if (!isServer) exitWith {};
params [["_crate", objNull, [objNull]], ["_veh", objNull, [objNull]], ["_player", objNull, [objNull]]];
if (isNull _crate || {isNull _veh}) exitWith {};
if ((_crate getVariable ["ABZ_crate", []]) isEqualTo []) exitWith {};
if (!isNull attachedTo _crate) exitWith {};
if (speed _veh > 5) exitWith {
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_StopVehicle"], _player] call CBA_fnc_targetEvent;
};

private _loaded = (_veh getVariable ["ABZ_loaded", []]) select { !isNull _x && {(attachedTo _x) isEqualTo _veh} };
if (count _loaded >= 4) exitWith {
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_NoRoom"], _player] call CBA_fnc_targetEvent;
};

private _bb = boundingBoxReal _veh;
private _len = ((_bb select 1) select 1) - ((_bb select 0) select 1);
private _h = ((_bb select 1) select 2) * 0.55;
// the first free strap (one may have come off in the middle - fn_crateRelease)
private _used = _loaded apply { _x getVariable ["ABZ_slot", -1] };
private _s = ([0, 1, 2, 3] - _used) param [0, 0];
private _off = [[0.55, -0.15], [-0.55, -0.15], [0.55, -0.35], [-0.55, -0.35]] select _s;
_crate attachTo [_veh, [_off select 0, (_off select 1) * _len, _h]];
_crate setVariable ["ABZ_slot", _s];
_loaded pushBack _crate;
_veh setVariable ["ABZ_loaded", _loaded, true];

["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_CrateLoaded"], _player] call CBA_fnc_targetEvent;
