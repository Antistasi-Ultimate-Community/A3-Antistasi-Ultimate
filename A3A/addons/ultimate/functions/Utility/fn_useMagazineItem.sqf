#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_fnc_useMagazineItem

Description:
    Decrease rounds count of magazines used like items in inventory

Parameters:
    0: _unit - the unit owning the magazine <OBJECT>
    1: _magazine - the magazine having been used <STRING>

Optional:

Example:
    (begin example)
    [player, "30Rnd_65x39_caseless_mag"] call A3A_fnc_useMagazineItem;
    (end example)

Returns:
    Success indicator <BOOL>

Scope:
    Client

Author:
    UnseenKill
---------------------------------------------------------------------------- */
if !assert(params[
    ["_unit", nil, [objNull]],
    ["_magazine", nil, [""]]
]) exitWith { false };

if !assert(!isNull _unit) exitWith { false };

private _config = configFile >> "CfgMagazines" >> _magazine;
if !assert(isClass(_config)) exitWith { false };

// Quick check if the mag exists at all
if !(_magazine in magazineCargo _unit) exitWith {
    Debug_2("Magazine %1 not found in unit %2", _magazine, _unit);
    false;
};

private _containers = [backpackContainer _unit, vestContainer _unit, uniformContainer _unit];
private _index = _containers findIf {
    !isNull _x && { _magazine in magazineCargo _x }
};

if !assert(_index >= 0) exitWith {};

private _container = _containers select _index;

// If it's single use, don't make a show of finding any half-used magazines
if (getNumber(_config >> "count") isEqualTo 1) exitWith {
    _container addMagazineCargo[_magazine, -1];
    true;
};

// Find the magazine with the least remaining ammo
private _mags = magazinesAmmoCargo _container;

_mags = _mags select { (_x select 0) isEqualTo _magazine };
_mags sort true;

if !assert(_mags isNotEqualTo []) exitWith {};

(_mags deleteAt 0) params[
    ["_magClass", "", [""]],
    ["_ammoCount", 0, [0]]
];

// Fully remove _one_ of the least used magazines
_container addMagazineAmmoCargo[_magClass, -1, _ammoCount];

// Put it back into the same container if rounds remain
if (_ammoCount > 1) then {
    _container addMagazineAmmoCargo[_magClass, 1, _ammoCount - 1];
};

true;
