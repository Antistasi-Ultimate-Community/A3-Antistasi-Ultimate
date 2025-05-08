/*
    Equip unit with random weapon of preferred type using A3A_rebelGear
    Adds magazines by mass. Uses default magazine of selected weapon

Parameters:
    0. <OBJECT> Rebel unit to equip with primary weapon.
    1. <STRING> Preferred weapon type ("Rifles", "MachineGuns" etc).
    2. <NUMBER> Optional, total mass of carried magazines to add.

Returns:
    Nothing

Environment:
    Scheduled, any machine
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_weaponType", ["_totalMagWeight", 50]];

call A3A_fnc_fetchRebelGear;        // Send current version of rebelGear from server if we're out of date

private _pool = A3A_rebelGear get _weaponType;
if (_pool isEqualTo []) then {
    _pool = A3A_rebelGear get "Rifles";
    if (_pool isEqualTo []) then {
        _pool = A3A_rebelGear get "SMGs";
        if (_pool isEqualTo []) then {
            private _pistolPool = A3A_rebelGear get "Handguns";
            for "_i" from 1 to (count _pistolPool) step 2 do { 
                _pistolPool set [_i, 0.5]
            };
            _pool = (A3A_rebelGear get "Shotguns") + (A3A_rebelGear get "SniperRifles") + _pistolPool;
        };
    };
};
private _weapon = selectRandomWeighted _pool;

if (isNil "_weapon") exitWith {};

// Probably shouldn't ever be executed
if !(primaryWeapon _unit isEqualTo "") then {
    if (_weapon == primaryWeapon _unit) exitWith {};
    private _magazines = getArray (configFile / "CfgWeapons" / (primaryWeapon _unit) / "magazines");
    {_unit removeMagazines _x} forEach _magazines;			// Broken, doesn't remove mags globally. Pain to fix.
    _unit removeWeapon (primaryWeapon _unit);
};

private _categories = _weapon call A3A_fnc_equipmentClassToCategories;
if ("GrenadeLaunchers" in _categories && {"Rifles" in _categories} ) then {
    // lookup real underbarrel GL magazine, because not everything is 40mm
    private _config = configFile >> "CfgWeapons" >> _weapon;
    private _glmuzzle = getArray (_config >> "muzzles") select 1;		// guaranteed by category
    _glmuzzle = configName (_config >> _glmuzzle);                      // bad-case fix. compatibleMagazines is case-sensitive as of 2.12
    private _glmag = (A3A_rebelGear get "Magazines") getOrDefault [_glmuzzle, ""] select 0;
    if (_glmag != "") then { _unit addMagazines [_glmag, 5] };
};

private _magazine = selectRandom ((A3A_rebelGear get "Magazines") get _weapon);
private _magweight = 5 max getNumber (configFile >> "CfgMagazines" >> _magazine >> "mass");

_unit addWeapon _weapon;
if ("Handguns" in _categories) then {
    _unit addHandgunItem _magazine;
} else {
    _unit addPrimaryWeaponItem _magazine;
};
_unit addMagazines [_magazine, round (random 0.5 + _totalMagWeight / _magWeight)];


// Optics
private _compatOptics = A3A_rebelOpticsCache get _weapon;
if (isNil "_compatOptics") then {
    private _compatItems = compatibleItems _weapon; // cached, should be fast
    _compatOptics = _compatItems arrayIntersect call {
        if (_weaponType in ["Rifles", "MachineGuns"]) exitWith { A3A_rebelGear get "OpticsMid" };
        if (_weaponType == "SniperRifles") exitWith { A3A_rebelGear get "OpticsLong" };
        A3A_rebelGear get "OpticsClose";
    };
    if (_compatOptics isEqualTo []) then {
        _compatOptics = _compatItems arrayIntersect call {
            if (_weaponType in ["Rifles", "MachineGuns"]) exitWith { A3A_rebelGear get "OpticsClose" };
            A3A_rebelGear get "OpticsMid";
        };
    };
    // save in cache
    A3A_rebelOpticsCache set [_weapon, _compatOptics];
};

// Silencers/Muzzles
private _compatSilencers = A3A_rebelSilencersCache get _weapon;
if (isNil "_compatSilencers") then {
    private _compatItems = compatibleItems _weapon; // cached, should be fast
    _compatSilencers = _compatItems arrayIntersect call {
        A3A_rebelGear get "MuzzleAttachments";
    };
    // save in cache
    A3A_rebelSilencersCache set [_weapon, _compatSilencers];
};

// Bipods
private _compatBipods = A3A_rebelBipodsCache get _weapon;
if (isNil "_compatBipods") then {
    private _compatItems = compatibleItems _weapon; // cached, should be fast
    _compatBipods = _compatItems arrayIntersect call {
        A3A_rebelGear get "Bipods";
    };
    // save in cache
    A3A_rebelBipodsCache set [_weapon, _compatBipods];
};

//// silencers and bipods
if (_compatOptics isNotEqualTo []) then { _unit addPrimaryWeaponItem (selectRandom _compatOptics) };
if (_compatSilencers isNotEqualTo []) then { _unit addPrimaryWeaponItem (selectRandom _compatSilencers) };
if (_compatBipods isNotEqualTo []) then { _unit addPrimaryWeaponItem (selectRandom _compatBipods) };
