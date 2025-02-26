#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
#define OccAndInv(VEH) (FactionGet(occ, VEH) + FactionGet(inv, VEH))

_veh = cursortarget;

if (isNull _veh) exitWith {[localize "STR_A3A_reinf_airstrike_header", localize "STR_A3A_reinf_airstrike_not_looking_at_veh"] call SCRT_fnc_misc_deniedHint;};
if (!alive _veh) exitWith {[localize "STR_A3A_reinf_airstrike_header", localize "STR_A3A_reinf_airstrike_destroyed"] call SCRT_fnc_misc_deniedHint;};

if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {
	[localize "STR_A3A_reinf_airstrike_header", localize "STR_A3A_reinf_airstrike_enemies_near"] call SCRT_fnc_misc_deniedHint
};

private _near = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] isEqualTo teamplayer};
_near = _near select {(player inArea _x) && (_veh inArea _x)};

if (_near isEqualTo []) exitWith {
	[localize "STR_A3A_reinf_airstrike_header", format [localize "STR_A3A_reinf_airstrike_hq_airp",FactionGet(reb,"name")]] call SCRT_fnc_misc_deniedHint;
};

private _rebAircraftTypes = FactionGet(reb,"vehiclesPlane") + FactionGet(reb,"vehiclesCivPlane") + FactionGet(reb, "vehiclesCivHeli");
if (typeOf _veh in _rebAircraftTypes) exitWith {
	[localize "STR_A3A_reinf_airstrike_header", format [localize "STR_A3A_reinf_airstrike_reb_planes",FactionGet(reb,"name")]] call SCRT_fnc_misc_deniedHint;
};

if ({isPlayer _x} count crew _veh > 0) exitWith {
	[localize "STR_A3A_reinf_airstrike_header", localize "STR_A3A_reinf_airstrike_veh_empty"] call SCRT_fnc_misc_deniedHint;
};

private _maxQuantity = round (({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX) * 2);
if (bombRuns > _maxQuantity) exitWith {
	[localize "STR_A3A_reinf_airstrike_header", format [localize "STR_A3A_reinf_airstrike_limit", str _maxQuantity]] call SCRT_fnc_misc_deniedHint;
};

private _owner = _veh getVariable "ownerX";
private _exit = false;
if (!isNil "_owner" && {_owner isEqualType "" && {getPlayerUID player != _owner}}) then {
	_exit = true;
};

if (_exit) exitWith {
    [localize "STR_A3A_reinf_airstrike_header", localize "STR_A3A_reinf_airstrike_not_owner"] call SCRT_fnc_misc_deniedHint;
};

if (!(_veh isKindOf "Air")) exitWith {
	[localize "STR_A3A_reinf_airstrike_header", localize "STR_A3A_reinf_airstrike_air_only"] call SCRT_fnc_misc_deniedHint;
};

_typeX = typeOf _veh;

if (isClass (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo")) then {
	if (count getArray (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo" >> "dissasembleTo") > 0) then {
		_exit = true;
	};
};
if (_exit) exitWith {
    [localize "STR_A3A_reinf_airstrike_header", localize "STR_A3A_reinf_airstrike_backpack_drones"] call SCRT_fnc_misc_deniedHint;
};

private _pointsX = 1;

if (_typeX in (FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack"))) then {_pointsX = 5};
if (_typeX in (OccAndInv("vehiclesPlanesCAS") + OccAndInv("vehiclesPlanesAA") + OccAndInv("vehiclesPlanesLargeAA") + OccAndInv("vehiclesPlanesLargeCAS") + OccAndInv("vehiclesPlanesGunship"))) then {_pointsX = 10};

deleteVehicle _veh;

private _newBombRuns = bombRuns + _pointsX;
if (_newBombRuns > _maxQuantity) then {
	_newBombRuns = _maxQuantity;
};

bombRuns = _newBombRuns;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics", theBoss];

[localize "STR_A3A_reinf_airstrike_header", localize "STR_A3A_reinf_airstrike_success"] call A3A_fnc_customHint;
playSound "A3AP_UiSuccess";