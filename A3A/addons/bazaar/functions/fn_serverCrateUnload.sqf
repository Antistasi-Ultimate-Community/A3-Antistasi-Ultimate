// SERVER: fallback unloader - sets every Bazaar crate strapped to a vehicle
// down behind it.
if (!isServer) exitWith {};
params [["_veh", objNull, [objNull]], ["_player", objNull, [objNull]]];
if (isNull _veh) exitWith {};

private _loaded = (_veh getVariable ["ABZ_loaded", []]) select { !isNull _x && {(attachedTo _x) isEqualTo _veh} };
if (_loaded isEqualTo []) exitWith {};
if (speed _veh > 5) exitWith {
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_StopVehicle"], _player] call CBA_fnc_targetEvent;
};

private _back = abs (((boundingBoxReal _veh) select 0) select 1);
{
	detach _x;
	private _p = _veh getPos [_back + 2 + 1.2 * _forEachIndex, (getDir _veh) + 180];
	_x setPosATL [_p select 0, _p select 1, 0];
	_x setVelocity [0, 0, 0];
} forEach _loaded;
_veh setVariable ["ABZ_loaded", [], true];

["ABZ_notify", [format [localize "STR_A3U_Bazaar_Notify_CrateUnloaded", count _loaded]], _player] call CBA_fnc_targetEvent;
