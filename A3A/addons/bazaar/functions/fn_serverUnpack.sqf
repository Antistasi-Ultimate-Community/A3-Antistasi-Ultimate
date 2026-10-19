// SERVER: "Unpack Crate Into Arsenal" on one sealed crate at HQ - on the
// ground or still loaded in a vehicle (v1.1.0: no more "unload it first";
// it comes out of the vehicle properly - fn_crateRemove).
if (!isServer) exitWith {};
call ABZ_fnc_syncCommit;	// Antistasi just saved? commit that state before the crate goes
params [["_crate", objNull, [objNull]], ["_player", objNull, [objNull]]];
if (isNull _crate || {isNull _player}) exitWith {};
if ((_crate getVariable ["ABZ_crate", []]) isEqualTo []) exitWith {};
private _carrier = attachedTo _crate;
if (!isNull _carrier && {!alive _carrier}) exitWith {
	["ABZ_notify", ["That crate went up with the vehicle."], _player] call CBA_fnc_targetEvent;
};
if (!isNull _carrier && {_carrier getVariable ["LoadingCargo", false]} && {!(_crate in (_carrier getVariable ["ace_cargo_loaded", []]))}) exitWith {
	["ABZ_notify", ["That vehicle is loading or unloading - try again in a moment."], _player] call CBA_fnc_targetEvent;
};
if (!isNull _carrier && {surfaceIsWater getPosASL _carrier} && {!(call ABZ_fnc_isAntistasi)}) exitWith {
	["ABZ_notify", ["Bring it ashore before opening that crate."], _player] call CBA_fnc_targetEvent;
};
private _where = [_crate, _carrier] select (!isNull _carrier);
if (_player distance2D _crate > 8) exitWith {	// 2D: an ACE-loaded crate hangs 100m under its vehicle
	["ABZ_notify", ["Get closer to the crate."], _player] call CBA_fnc_targetEvent;
};
if !([_where] call ABZ_fnc_atHQ) exitWith {
	["ABZ_notify", ["This crate can only be unpacked at HQ, near the arsenal."], _player] call CBA_fnc_targetEvent;
};

([_crate, _player] call ABZ_fnc_unpackCrate) params ["_ok", "_msg", "_manage", "_label"];
if (!_ok) exitWith {};
if (_manage) then { [] spawn { sleep 1; call A3A_fnc_arsenalManage } };
["ABZ_notify", [_msg], _player] call CBA_fnc_targetEvent;
if (missionNamespace getVariable ["ABZ_announce", true]) then {
	["ABZ_chat", [format ["[Bazaar] %1 delivered a crate of %2 to the arsenal.", name _player, _label]]] call CBA_fnc_globalEvent;
};
call ABZ_fnc_queueSave;
