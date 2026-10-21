// SERVER: hands over a bought military vehicle. Payment has already been
// taken; every refusal reason was checked before that (fn_serverBuy).
// [_player, _class, _sideVar, _spot, _personal]
//   _spot []           -> into the Antistasi HQ garage
//   _spot [pos, dir]   -> parked there, the buyer drives it home
#include "..\script_component.hpp"
params [["_player", objNull, [objNull]], ["_class", "", [""]], ["_sideVar", "", [""]], ["_spot", [], [[]]], ["_personal", false, [false]]];
private _name = [_class] call ABZ_fnc_displayNameOf;

if (_spot isEqualTo []) exitWith {
	[[_class], ""] call HR_GRG_fnc_addVehiclesByClass;	// "" = unlocked faction vehicle
	["ABZ_notify", [format [localize "STR_A3U_Bazaar_Notify_VehDelivered", _name]], _player] call CBA_fnc_targetEvent;
	ServerInfo_2("[ABZ] %1 bought vehicle %2 -> HQ garage",name _player,_class);
};

_spot params ["_pos", "_dir"];
private _veh = createVehicle [_class, _pos, [], 0, "NONE"];
_veh allowDamage false;
_veh setDir _dir;
_veh setVelocity [0, 0, 0];
// locked for a 5s grace while damage is off: nobody can get in, so the
// vehicle stays server-local and the server can turn damage back on
// (allowDamage only acts where the vehicle is local)
_veh lock 2;

// register it with Antistasi as a REBEL vehicle from the start (never as
// the enemy side first - that would route through Antistasi's "captured"
// path: enemy resources, aggression and city-support changes)
if (!isNil "A3A_fnc_AIVEHinit" && {!isNil "teamPlayer"}) then {
	[_veh, teamPlayer] call A3A_fnc_AIVEHinit;
} else {
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
};
// keep the paint job of the side it was "liberated" from
private _side = missionNamespace getVariable [_sideVar, sideUnknown];
if (!isNil "SCRT_fnc_misc_tryInitVehicle" && {_side isEqualType west} && {_side != sideUnknown}) then {
	[_veh, _side] call SCRT_fnc_misc_tryInitVehicle;
};
// bought with personal money: only the buyer may sell it (Antistasi's rule)
if (_personal && {!isNull _player}) then { _veh setVariable ["ownerX", getPlayerUID _player, true] };
_veh setVariable ["ABZ_bought", true, true];
[_veh] spawn {
	params ["_v"];
	sleep 5;
	if (isNull _v) exitWith {};
	_v allowDamage true;
	_v lock 0;
	// Antistasi's AIVEHinit registers a rebel vehicle parked inside a friendly
	// zone (staticsToSave - kept by the save loop, spared by the garbage
	// cleaner) - but it skips any vehicle that is locked at that moment
	// (fn_AIVEHinit.sqf: `if !(locked _veh < 2) exitWith {}`), and ours was
	// locked for the grace above. Do that registration now, the way AU does.
	// Registered wherever it stands (land vehicles and helicopters): AU's
	// save only keeps entries near a rebel zone anyway, and an UNregistered
	// vehicle is one AU's save refunds to whoever sits at its controls
	// (fn_savePlayer adds its price to the crew's saved money) - which would
	// hand the purchase price back on the next reload.
	// Not boats: AU's save loop never saves a staticsToSave entry that is on
	// water, so registering a moored boat would stop it being saved at all.
	if (alive _v
		&& {!isNil "staticsToSave"}
		&& {_v isKindOf "LandVehicle" || {_v isKindOf "Air"}}
		&& {!(_v in staticsToSave)}) then {
		if (!isNil "A3A_fnc_lockStatic" && {!unitIsUAV _v} && {!isNil "A3A_fnc_isWithinNearestFriendlyMarker"} && {[_v] call A3A_fnc_isWithinNearestFriendlyMarker}) then {
			_v call A3A_fnc_lockStatic;
		};
		staticsToSave pushBack _v;
		publicVariable "staticsToSave";
	};
};

// tell the buyer where it is, and mark it on their map
private _dist = round (_player distance2D _veh);
private _brg = _player getDir _veh;
private _compass = ["north", "north-east", "east", "south-east", "south", "south-west", "west", "north-west"] select ((round (_brg / 45)) mod 8);
["ABZ_vehMark", [getPosATL _veh, _name], _player] call CBA_fnc_targetEvent;
["ABZ_notify", [format [localize "STR_A3U_Bazaar_Notify_VehBought", _name, _dist, _compass]], _player] call CBA_fnc_targetEvent;
ServerInfo_3("[ABZ] %1 bought vehicle %2 -> parked at %3",name _player,_class,_pos);
