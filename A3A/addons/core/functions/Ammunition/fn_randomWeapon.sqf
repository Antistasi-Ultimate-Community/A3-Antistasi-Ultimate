/*
    Author:
        jwoodruff40, wersal454
    
    Description:
        Equip unit with random weapon of preferred type using A3A_rebelGear
        Adds magazines by mass. Uses random compatible and unlocked magazine of selected weapon.
    
    Params:
        _unit <OBJECT> <Default: None> the unit to equip
        _weaponType <STRING> <Default: None> the type of weapon, e.g. "MachineGuns"
        _totalMagWeight <SCALAR> <Default: 50> total mass of weapon magazines to add
    
    Dependencies:
        N/A
    
    Scope:
        N/A
    
    Environment:
        Scheduled, any machine
    
    Usage:
        [_unit, "MachineGuns", 150] call A3A_fnc_equipRebel;
    
    Return:
        Nothing
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_weaponType", ["_totalMagWeight", 50]];

call A3A_fnc_fetchRebelGear;        // Send current version of rebelGear from server if we're out of date

private _isPrimary = _weaponType isNotEqualTo "Handguns";

private _pool = A3A_rebelGear get _weaponType;
if (_isPrimary && {_pool isEqualTo []}) then {
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

private _categories = _weapon call A3A_fnc_equipmentClassToCategories;
if ("GrenadeLaunchers" in _categories && {"Rifles" in _categories} ) then {
    // lookup real underbarrel GL magazine, because not everything is 40mm
    private _config = configFile >> "CfgWeapons" >> _weapon;
    private _glmuzzle = getArray (_config >> "muzzles") select 1;		// guaranteed by category
    _glmuzzle = configName (_config >> _glmuzzle);                      // bad-case fix. compatibleMagazines is case-sensitive as of 2.12
    private _glmag = (A3A_rebelGear get "Magazines") getOrDefault [_glmuzzle, ""] select 0;
    if (_glmag != "") then { _unit addMagazines [_glmag, 5] };
};

_unit addWeapon _weapon;
private _magazine = selectRandom ((A3A_rebelGear get "Magazines") get _weapon);
if !(isNil "_magazine") then {
    private _magweight = 5 max getNumber (configFile >> "CfgMagazines" >> _magazine >> "mass");
    _unit addWeaponItem [_weapon, _magazine];
    _unit addMagazines [_magazine, round (random 0.5 + _totalMagWeight / _magWeight)];
};

// Optics
private _compatOptics = A3A_rebelOpticsCache getOrDefault [_weapon, []];
if (isNil "_compatOptics") then {
    private _compatItems = compatibleItems _weapon; // cached, should be fast
    private _opticType = switch (_weaponType) do {
        case ("Handguns"): { "OpticsAll" };
        case ("Rifles");
        case ("MachineGuns"): { "OpticsMid" };
        case ("SniperRifles"): { "OpticsLong" };
        default { "OpticsClose" };
    };
    _compatOptics = _compatItems arrayIntersect (A3A_rebelGear get _opticType);
    if (_compatOptics isEqualTo []) then {
        _compatOptics = _compatItems arrayIntersect (A3A_rebelGear get "OpticsAll");
    };
    // save in cache
    A3A_rebelOpticsCache set [_weapon, _compatOptics];
};

// Silencers/Muzzles
private _compatSilencers = A3A_rebelSilencersCache getOrDefault [_weapon, []];
if (isNil "_compatSilencers") then {
    private _compatItems = compatibleItems _weapon; // cached, should be fast
    _compatSilencers = _compatItems arrayIntersect (A3A_rebelGear get "MuzzleAttachments");
    // save in cache
    A3A_rebelSilencersCache set [_weapon, _compatSilencers];
};

// Bipods
private _compatBipods = A3A_rebelBipodsCache getOrDefault [_weapon, []];
if (_isPrimary && {isNil "_compatBipods"}) then {
    private _compatItems = compatibleItems _weapon; // cached, should be fast
    _compatBipods = _compatItems arrayIntersect (A3A_rebelGear get "Bipods");
    // save in cache
    A3A_rebelBipodsCache set [_weapon, _compatBipods];
};

//// silencers and bipods
if (_compatOptics isNotEqualTo []) then { _unit addWeaponItem [_weapon, selectRandom _compatOptics] };
if (_compatSilencers isNotEqualTo []) then { _unit addWeaponItem [_weapon, selectRandom _compatSilencers] };
if (_compatBipods isNotEqualTo []) then { _unit addWeaponItem [_weapon, selectRandom _compatBipods] };
