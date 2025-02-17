/*
 * Author: Ampersand
 * Show all magazines of the current type with ammo counts.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call A3A_fnc_monitorMagazines;
 *
 * Public: No
 */
#include "..\..\..\script_component.hpp"


if !(RRTurretMagazines) exitwith {};

private _player = missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player];
private _vehicle = vehicle _player;
private _turretPath = _vehicle unitTurret _player;
private _mag = _vehicle currentMagazineTurret _turretPath;
private _mags = magazinesAllTurrets [_vehicle, true] select {(_x # 0) == _mag && {(_x # 1) isEqualTo _turretPath}} apply {
    _x # 2
};
_total = 0;
_mags apply {_total = _total + _x};
hintSilent format ["%1 = %2", _mags joinString " + ", _total];