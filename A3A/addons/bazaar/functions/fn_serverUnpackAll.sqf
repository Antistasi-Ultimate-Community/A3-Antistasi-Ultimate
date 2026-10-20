// SERVER: "Unpack From The Truck" (v1.1.0) - one action at HQ unpacks every
// sealed bulk crate within 20m of the player: on the ground, strapped on,
// in Antistasi's logistics or in ACE cargo. Smuggling-run crates are left
// alone (they're for handing over, not unpacking).
if (!isServer) exitWith {};
call ABZ_fnc_syncCommit;	// Antistasi just saved? commit that state before the crates go
params [["_player", objNull, [objNull]]];
if (isNull _player || {!alive _player}) exitWith {};
if !([_player] call ABZ_fnc_atHQ) exitWith {
	["ABZ_notify", [localize "STR_A3U_Bazaar_Notify_HQOnly_2"], _player] call CBA_fnc_targetEvent;
};

// 2D distance to the crate itself (an ACE-loaded one hangs 100m under its
// vehicle; one on a long truck bed sits metres from the vehicle's centre)
// An ACE-loaded crate hangs 100m under its vehicle (and swings sideways on a
// slope), so it is measured from the vehicle; every crate (or its vehicle)
// must itself be at HQ, the same test the single unpack uses.
private _outside = 0;
private _here = ABZ_crates select {
	!isNull _x && {(_x getVariable ["ABZ_crate", []]) isNotEqualTo []} && {
		private _v = attachedTo _x;
		private _o = [_x, _v] select (!isNull _v && {_x in (_v getVariable ["ace_cargo_loaded", []])});
		(_o distance2D _player) <= 20
		&& {isNull _v || {alive _v}}
		&& {isNull _v || {call ABZ_fnc_isAntistasi} || {!surfaceIsWater getPosASL _v}}	// no opening a crate over the sea
		&& {
			private _hq = [[_x, _v] select (!isNull _v)] call ABZ_fnc_atHQ;
			if (!_hq) then { _outside = _outside + 1 };
			_hq
		}
	}
};
// a vehicle Antistasi logistics is loading or unloading right now waits
private _busy = _here select {
	private _v = attachedTo _x;
	!isNull _v && {_v getVariable ["LoadingCargo", false]} && {!(_x in (_v getVariable ["ace_cargo_loaded", []]))}
};
_here = _here - _busy;
if (_here isEqualTo []) exitWith {
	["ABZ_notify", [switch (true) do {
		case (_busy isNotEqualTo []): { localize "STR_A3U_Bazaar_Notify_VehicleLoading" };
		case (_outside > 0): { localize "STR_A3U_Bazaar_Notify_BringCloser_Arsenal" };
		default { localize "STR_A3U_Bazaar_Notify_NoCratesNearby" };
	}], _player] call CBA_fnc_targetEvent;
};

private _labels = [];
private _notes = [];
private _manage = false;
{
	([_x, _player] call ABZ_fnc_unpackCrate) params ["_ok", "_msg", "_m", "_label"];
	if (_ok) then {
		_labels pushBack _label;
		_notes pushBack _msg;
		_manage = _manage || _m;
	};
} forEach _here;
if (_labels isEqualTo []) exitWith {};
if (_manage) then { [] spawn { sleep 1; call A3A_fnc_arsenalManage } };

["ABZ_notify", [format [localize "STR_A3U_Bazaar_Notify_CrateUnpacked", count _labels, ["s", ""] select (count _labels == 1), _notes joinString "\n"]], _player] call CBA_fnc_targetEvent;
if (missionNamespace getVariable ["ABZ_announce", true]) then {
	["ABZ_chat", [format [localize "STR_A3U_Bazaar_Chat_CratesDelivered", name _player, count _labels, ["s", ""] select (count _labels == 1), _labels joinString ", "]]] call CBA_fnc_globalEvent;
};
diag_log format ["[ABZ] %1 unpacked %2 crate(s) at once: %3", name _player, count _labels, _labels];
call ABZ_fnc_queueSave;
