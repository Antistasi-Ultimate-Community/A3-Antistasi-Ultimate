#include "..\..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3U_fnc_lockpickGetPlayerItem

Description:
    Find lockpick kit in player's inventory

Parameters:
    0: _unit - the unit to search <OBJECT>

Optional:

Example:

Returns:
    * Magazine class if found <STRING>
    * Empty string if not found <STRING>

Author:
    UnseenKill
---------------------------------------------------------------------------- */
if !assert(params[
    ["_unit", nil, [objNull]]
]) exitWith { "" };

if !assert(!isNull _unit) exitWith { "" };
if !GVAR(allowLockpickKits) exitWith { "" };

private _mags = magazineCargo player select {
    _x isKindOf QGVAR(LockpickKitBase)
} apply {
    [getNumber(configFile >> "CfgMagazines" >> _x >> "count"), _x];
};

// No lockpick kits found
if (_mags isEqualTo []) exitWith { "" };

// Always return the most abundant lockpick kit class
_mags sort false;

_mags select 0 select 1;
