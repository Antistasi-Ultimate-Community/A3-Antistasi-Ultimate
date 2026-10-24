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
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_LostWithVehicle"], _player] call CBA_fnc_targetEvent;
};
if (!isNull _carrier && {_carrier getVariable ["LoadingCargo", false]} && {!(_crate in (_carrier getVariable ["ace_cargo_loaded", []]))}) exitWith {
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_VehicleLoading"], _player] call CBA_fnc_targetEvent;
};
if (!isNull _carrier && {surfaceIsWater getPosASL _carrier} && {!(call ABZ_fnc_isAntistasi)}) exitWith {
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_BringAshore"], _player] call CBA_fnc_targetEvent;
};
private _where = [_crate, _carrier] select (!isNull _carrier);
if (_player distance2D _crate > 8) exitWith {	// 2D: an ACE-loaded crate hangs 100m under its vehicle
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_GetCloser"], _player] call CBA_fnc_targetEvent;
};
if !([_where] call ABZ_fnc_atHQ) exitWith {
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_HQOnly"], _player] call CBA_fnc_targetEvent;
};

([_crate, _player] call ABZ_fnc_unpackCrate) params ["_ok", "_msg", "_manage", "_label"];
if (!_ok) exitWith {};
if (_manage) then { [] spawn { sleep 1; call A3A_fnc_arsenalManage } };
["ABZ_notify", [_msg], _player] call CBA_fnc_targetEvent;
if (missionNamespace getVariable ["ABZ_announce", true]) then {
	["ABZ_chat", [format [localize "STR_A3U_Bazaar_Chat_CrateDelivered", name _player, _label]]] call CBA_fnc_globalEvent;
};
call ABZ_fnc_queueSave;
