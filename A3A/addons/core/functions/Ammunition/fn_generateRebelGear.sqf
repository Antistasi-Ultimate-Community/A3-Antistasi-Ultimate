/*
    Author:
        jwoodruff40
    
    Description:
        Generates the A3A_rebelGear hashmap of all equipment used to equip rebel AI
    
    Params:
        None
    
    Dependencies:
        N/A
    
    Scope:
        N/A
    
    Environment:
        Scheduled, any machine
    
    Usage:
        [] call A3A_fnc_generateRebelGear;
    
    Return:
        Nothing
*/

#include "..\..\script_component.hpp"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"     // jna_datalist indices
FIX_LINE_NUMBERS()
if (!isServer) exitWith { Error("Server-only function miscalled") };
Info("Started updating A3A_rebelGear");

// Base weight mappings, MIN->0, MAX->1
// #define ITEM_MIN 10
#define ITEM_MAX 50

private _fnc_addItemNoUnlocks = {
    params ["_array", "_class", "_amount", ["_arrayWeight", 1]];
    if (_amount < 0) exitWith { _array append [_class, _arrayWeight] };
    if (_amount <= A3A_guestItemLimit) exitWith {};
    _array pushBack _class;
    _array pushBack (linearConversion [A3A_guestItemLimit, ITEM_MAX, _amount, 0, 1, true] * _arrayWeight); // multiply weight (preference) by ratio of amount of item to max amount of that item such that items rebels have more of are more likely to be selected
};

private _fnc_addItemUnlocks = {
    params ["_array", "_class", "_amount", ["_arrayWeight", 1]];
    if (_amount < 0) exitWith { _array append [_class, _arrayWeight] };
};

private _fnc_addItem = [_fnc_addItemUnlocks, _fnc_addItemNoUnlocks] select (minWeaps < 0);

private _fnc_getAvailableMagazines = {
    params ["_class", "_categories", ["_baseClass", ""]];

    private _hasMags = false;
    private _allMags = jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL;
    private _cmpMags = compatibleMagazines ([[_baseClass, _class], _class] select (_baseClass == ""));
    {
        _x params ["_magClass", "_magQty"];
        private _unlocked = [_magQty == -1, _magQty == -1 || {_magQty > A3A_guestItemLimit}] select (minWeaps < 0);
        if (_unlocked && {_magClass in _cmpMags}) then { (_rebelGear get "Magazines") getOrDefault [_class, [], true] pushBack _magClass; _hasMags = true; };
    } forEach (_allMags);

    if ("GrenadeLaunchers" in _categories && {"Rifles" in _categories} ) then {
        // lookup real underbarrel GL magazine, because not everything is 40mm
        private _config = configFile >> "CfgWeapons" >> _class;
        private _glmuzzle = getArray (_config >> "muzzles") select 1;		// guaranteed by category
        _glmuzzle = configName (_config >> _glmuzzle);                      // bad-case fix. compatibleMagazines is case-sensitive as of 2.12
        [_glmuzzle, [], _class] call _fnc_getAvailableMagazines;    
    };

    _hasMags;
};

// Work with temporary array so that we're not transferring partials
private _rebelGear = createHashMapFromArray [
    ["Rifles", []],
    ["SMGs", []],
    ["Shotguns", []],
    ["MachineGuns", []],
    ["SniperRifles", []],
    ["GrenadeLaunchers", []],
    
    ["RocketLaunchers", []],
    ["MissileLaunchersAT", []],
    ["MissileLaunchersAA", []],

    ["Handguns", []],

    ["Magazines", createHashMap],

    ["ArmoredVests", ["", [1.5, 0.5] select (minWeaps < 0)]],
    ["CivilianVests", []],
    ["ArmoredHeadgear", ["", [1.5, 0.5] select (minWeaps < 0)]],
    ["BackpacksCargo", []],

    ["NVGs", ["", 0.5]],
    ["Radios", []],
    ["MineDetectors", []],
    ["Toolkits", []],
    ["Medikits", []],

    ["SmokeGrenades", []],
    ["Grenades", []],
    ["ExplosiveCharges", []],

    ["OpticsClose", []],
    ["OpticsMid", []],
    ["OpticsLong", []],
    ["OpticsAll", []],
    ["LightAttachments", []],
    ["LaserAttachments", []],
    ["MuzzleAttachments", []],
    ["Bipods", []]
];

private _opticsMidCount = 0;
{
    {
        _x params ["_class", "_amount"];
        private _categories = _class call A3A_fnc_equipmentClassToCategories;
        private _mainCategory = _categories select 0;

        switch (_mainCategory) do {
            // Primary Weapons
            case "Rifles";
            case "SniperRifles";
            case "GrenadeLaunchers";
            case "MachineGuns";
            case "SMGs";
            case "Shotguns";
            case "PrimaryWeaponsCatchAll" : {
                if !([_class, _categories] call _fnc_getAvailableMagazines) exitWith {}; // * Don't add weapon to hashmap if we don't have mags for it
                _arrayWeight = [_class, _categories] call A3A_fnc_itemArrayWeight;
                _array = _rebelGear getOrDefault [[_mainCategory, "GrenadeLaunchers"] select ("GrenadeLaunchers" in _categories), [], true];
                [_array, _class, _amount, _arrayWeight] call _fnc_addItem;
            };
            
            // Secondary Weapons
            case "RocketLaunchers": {
                if !([_class, _categories] call _fnc_getAvailableMagazines) exitWith {}; // * Don't add weapon to hashmap if we don't have mags for it
                _arrayWeight = [_class, _categories] call A3A_fnc_itemArrayWeight;
                _array = _rebelGear getOrDefault ["RocketLaunchers", [], true]; 
                [_array, _class, _amount, _arrayWeight] call _fnc_addItem;
            };
            case "MissileLaunchers": {
                if !([_class, _categories] call _fnc_getAvailableMagazines) exitWith {}; // * Don't add weapon to hashmap if we don't have mags for it
                switch true do {
                    case ("AA" in _categories): {
                        _array = _rebelGear getOrDefault ["MissileLaunchersAA", [], true];
                        [_array, _class, _amount] call _fnc_addItemNoUnlocks
                    };
                    case ("AT" in _categories): {
                        _array = _rebelGear getOrDefault ["MissileLaunchersAT", [], true];
                        [_array, _class, _amount] call _fnc_addItemNoUnlocks
                    };
                };
            };

            // Handguns
            case "Handguns": {
                if !([_class, _categories] call _fnc_getAvailableMagazines) exitWith {}; // * Don't add weapon to hashmap if we don't have mags for it
                _arrayWeight = [_class, _categories] call A3A_fnc_itemArrayWeight;
                _array = _rebelGear getOrDefault ["Handguns", [], true];
                [_array, _class, _amount, _arrayWeight] call _fnc_addItem;
            };

            // Gear
            case "Vests": {
                _array = _rebelGear getOrDefault [["CivilianVests", "ArmoredVests"] select ("ArmoredVests" in _categories), ["", [1.5,0.5] select (minWeaps < 0)], true];
                [_array, _class, _amount] call _fnc_addItem;
            };
            case "Headgear": {
                //_array = _rebelGear getOrDefault [["CosmeticHeadgear", "ArmoredHeadgear"] select ("ArmoredHeadgear" in _categories), ["", [1.5,0.5] select (minWeaps < 0)], true];    // not used, rebels have template-defined basic headgear
                _array = _rebelGear getOrDefault ["ArmoredHeadgear", [], true];
                if ("ArmoredHeadgear" in _categories) then { [_array, _class, _amount] call _fnc_addItem };
            };
            case "Backpacks": {
                _array = _rebelGear getOrDefault ["BackpacksCargo", [], true];
                if ("BackpacksCargo" in _categories) then { [_array, _class, _amount] call _fnc_addItem };
            };

            // Weapon Attachments
            case "Optics": {
                switch true do {
                    case ("OpticsMid" in _categories): {                      // most common first
                        _array = _rebelGear getOrDefault ["OpticsMid", [], true];
                        [_array, _class, _amount] call _fnc_addItem;
                        _opticsMidCount = [_opticsMidCount + _amount, 1e6] select (_amount < 0);
                    };
                    case ("OpticsClose" in _categories): {
                        _array = _rebelGear getOrDefault ["OpticsClose", [], true];
                        [_array, _class, _amount] call _fnc_addItem;
                    };
                    case ("OpticsLong" in _categories): {
                        _array = _rebelGear getOrDefault ["OpticsLong", [], true];
                        [_array, _class, _amount] call _fnc_addItem;
                    };
                };
            };
            case "PointerAttachments": {
                switch true do {
                    case ("LightAttachments" in _categories): {
                        _array = _rebelGear getOrDefault ["LightAttachments", [], true];
                        [_array, _class, _amount] call _fnc_addItem;
                    };
                    case ("LaserAttachments" in _categories): {
                        _array = _rebelGear getOrDefault ["LaserAttachments", [], true];
                        [_array, _class, _amount] call _fnc_addItem;
                    };
                };
            };
            case "MuzzleAttachments": {
                _array = _rebelGear getOrDefault ["MuzzleAttachments", [], true];
                [_array, _class, _amount] call _fnc_addItem;
            };
            case "Bipods": {
                _array = _rebelGear getOrDefault ["Bipods", [], true];
                [_array, _class, _amount] call _fnc_addItem;
            };

            // Items
            case "NVGs": {
                _array = _rebelGear getOrDefault ["NVGs", ["", 0.5], true];
                if !("NVGThermal" in _categories) then { [_array, _class, _amount] call _fnc_addItem };
            };
            case "Radios";
            case "MineDetectors";
            case "Toolkits";
            case "Medikits";
            case "CargoMiscCatchAll": {
                _array = _rebelGear getOrDefault [_mainCategory, [], true];
                [_array, _class, _amount] call _fnc_addItem;
            };

            default {
                // Grenades / Explosives
                switch true do {
                    case ("SmokeGrenades" in _categories): {
                        _array = _rebelGear getOrDefault ["SmokeGrenades", [], true];
                        [_array, _class, _amount] call _fnc_addItem
                    };
                    case ("Grenades" in _categories): {
                        _array = _rebelGear getOrDefault ["Grenades", [], true];
                        [_array, _class, _amount] call _fnc_addItem
                    };
                    case ("ExplosiveCharges" in _categories): {
                        _array = _rebelGear getOrDefault ["ExplosiveCharges", [], true];
                        [_array, _class, _amount] call _fnc_addItemNoUnlocks
                    };
                };
            };
        };
    } forEach (jna_datalist select _x); 
} forEach [
    IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,
    IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,
    IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,
    IDC_RSCDISPLAYARSENAL_TAB_VEST,
    IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,
    IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,
    IDC_RSCDISPLAYARSENAL_TAB_NVGS,
    IDC_RSCDISPLAYARSENAL_TAB_RADIO,
    IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC,
    IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,
    IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,
    IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,
    IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,
    IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,
    IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD
];

// Mix in some short-range optics if mid-range count is low
private _opticMid = _rebelGear get "OpticsMid";
private _opticClose = _rebelGear get "OpticsClose";
private _opticLong = _rebelGear get "OpticsLong";

if (_opticsMidCount < ITEM_MAX*2) then {
    if (_opticsMidCount == 0) exitWith { _opticMid = _opticClose };
    private _mixCount = round (count _opticMid * (ITEM_MAX / _opticsMidCount));
    if (_mixCount >= count _opticClose) exitWith { _opticMid append _opticClose };

    private _opticClose2 = +_opticClose;
    for "_i" from 1 to _mixCount do {
        private _optic = selectRandom _opticClose2;
        _opticClose2 deleteAt (_opticClose2 find _optic);
        _opticMid pushBack _optic;
    };
};

_rebelGear set ["OpticsAll", _opticClose + _opticMid + _opticLong];     // for launchers

// Update everything while unscheduled so that version numbers match
isNil {
    A3A_rebelGearVersion = time;
    _rebelGear set ["Version", A3A_rebelGearVersion];
    A3A_rebelGear = _rebelGear;

    // Clear these locally
    A3A_rebelOpticsCache = createHashMap;
    A3A_rebelFlashlightsCache = createHashMap;
    A3A_rebelLasersCache = createHashMap;
    A3A_rebelSilencersCache = createHashMap;
    A3A_rebelBipodsCache = createHashMap;
};
// Only broadcast the version number so that clients & HCs can request as required
publicVariable "A3A_rebelGearVersion";

Info("Finished updating A3A_rebelGear");

/*
// Alternatively just broadcast it
A3A_rebelGear = _rebelGear;
publicVariable "A3A_rebelGear";
*/
