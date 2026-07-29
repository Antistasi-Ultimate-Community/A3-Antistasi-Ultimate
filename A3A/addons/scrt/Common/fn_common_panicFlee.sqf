#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_unit"];

if !(local _unit) exitWith {
	Error("Function miscalled with non-local unit");
	[_unit] remoteExec ["SCRT_fnc_common_panicFlee", _unit];
};

if (vehicle _unit != _unit) exitWith {}; 				//fleeing vehicles is hilarious

if (_unit getVariable ["surrendered", false]) exitWith {};
_unit setVariable ["surrendered", true, true];

if (typeOf _unit == "Fin_random_F") exitWith {};		// dogs do not run?

if (!alive _unit) exitWith {};							// Used to happen with ACE, seems to be fixed
if (lifeState _unit isEqualTo "INCAPACITATED") exitWith {};

private _unitSide = side group _unit;
_unit disableAI "AUTOTARGET";
_unit disableAI "TARGET";
_unit setSkill 0;
unassignVehicle _unit;			// stop them getting back into vehicles
[_unit] orderGetin false;
_unit setUnitPos "UP";
_unit setSpeaker "NoVoice";

// prevent surrendered units from spawning garrisons
if (_unit getVariable ["spawner", false]) then { _unit setVariable ["spawner", nil, true] };

// find or create suitable group for surrendered unit
private _grpIdx = allGroups findIf { local _x && (side _x == _unitSide) && {_x getVariable ["fleeingGroup", false]} };
if (_grpIdx == -1) then {
	private _grp = createGroup _unitSide;
	_grp setVariable ["fleeingGroup", true, true];
	[_unit] joinSilent _grp;
} else {
	[_unit] joinSilent (allGroups select _grpIdx);
};

private _sTime = time + 1;
waitUntil {(stance _unit) isEqualTo "STAND" || {time > _sTime}};
sleep 0.5;

private _weapons = weaponsItems _unit;
if (count _weapons > 0) then {
	private _weaponHolder = "WeaponHolderSimulated" createVehicle [0,0,0];
	_weaponHolder addWeaponWithAttachmentsCargoGlobal [_weapons select 0, 1];
	_weaponHolder setPos (_unit modelToWorld [0,.2,1.2]);
	_weaponHolder disableCollisionWith _unit;
	private _dir = random(360);
	_weaponHolder setVelocity [1.5 * sin(_dir), 1.5 * cos(_dir), 4];

	private _positionAtl = getPosATL _unit;

	if (count _weapons > 1) then {
		private _weaponHolderStatic = createVehicle ["GroundWeaponHolder", _positionAtl, [], 0, "NONE"];
		_weaponHolderStatic addWeaponWithAttachmentsCargoGlobal [_weapons select 1, 1];
	};

	if (count _weapons > 2) then {
		private _weaponHolderStatic = createVehicle ["GroundWeaponHolder", 
			[(_positionAtl select 0) + random 1, (_positionAtl select 1) + random 1, _positionAtl select 2],[], 0, "NONE"];
		_weaponHolderStatic addWeaponWithAttachmentsCargoGlobal [_weapons select 2, 1];
	};
};

removeAllWeapons _unit;

_unit switchMove "ApanPercMsprSnonWnonDf";

if !(_unit getVariable "isRival") then {
	if (_unitSide == Occupants ) then {
		[-2, 0, getPos _unit] remoteExec ["A3A_fnc_citySupportChange", 2];
	} else {
		[0, 1, getPos _unit] remoteExec ["A3A_fnc_citySupportChange", 2];
	};
};

// check for zone capture
private _markerX = _unit getVariable "markerX";
if (!isNil "_markerX") then { [_markerX, _unitSide] remoteExec ["A3A_fnc_zoneCheck",2] };

// // timed cleanup functions
[_unit] spawn A3A_fnc_postmortem;
[_unit, _unitSide, false, true, true] spawn A3A_fnc_fleeToSide;