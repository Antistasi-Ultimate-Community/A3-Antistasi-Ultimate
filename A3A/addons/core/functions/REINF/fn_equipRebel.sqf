/*
    Author:
        jwoodruff40, wersal454
    
    Description:
        Fully equips a rebel infantry unit based on their class and unlocked gear
    
    Params:
        _unit <OBJECT> <Default: None> the unit to equip
        _recruitType <SCALAR> <Default: 0> the type of recruit; 0 = player or player's squad, 1 = high command unit, 2 = garrison unit
        _forceClass <STRING> <Default: ""> to override the unit type, e.g. "unitUnarmed"
    
    Dependencies:
        N/A
    
    Scope:
        N/A
    
    Environment:
        Scheduled, any machine
    
    Usage:
        [_unit, 0] call A3A_fnc_equipRebel;
    
    Return:
        Nothing
*/

/*
loadout = [[primary], [secondary], [handgun], [uniform], [vest], [backpack], "headgear", "facewear", [binoculars], [assigned items]]
assigned items = [map, gps/uav term, radio, compass, watch, nvg]
*/

#include "..\..\script_component.hpp"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"
FIX_LINE_NUMBERS()

params ["_unit", "_recruitType", ["_forceClass", ""]];

call A3A_fnc_fetchRebelGear;        // Send current version of rebelGear from server if we're out of date

// TODO: add types unitAA and unitAT(name?) when UI is ready
private _unitType = if (_forceClass != "") then {_forceClass} else {_unit getVariable "unitType"};
private _typeTag = _unitType splitString "_" select 3;
private _rebelLoadouts = +rebelLoadouts;
private _customLoadout = _rebelLoadouts get _unitType;

private _fnc_addCharges = {
    params ["_unit", "_totalWeight"];

    private _charges = A3A_rebelGear get "ExplosiveCharges";
    if (_charges isEqualTo []) exitWith {};

    private _weight = 0;
    while { _weight < _totalWeight } do {
        private _charge = selectRandomWeighted _charges;
        _weight = _weight + getNumber (configFile / "CfgMagazines" / _charge / "mass");
        _unit addItemToBackpack _charge;
    };
};

private _fnc_addRadio = {
    params ["_unit"];
    
    private _radio = selectRandomWeighted (A3A_rebelGear get "Radios");
    if (!isNil "_radio") then {_unit linkItem _radio};
};

private _fnc_addFacewear = {
    params ["_unit"];

    private _goggles = goggles _unit;
    if (goggles _unit != _goggles && {randomizeRebelLoadoutUniforms}) then {
        removeGoggles _unit;
        _unit addGoggles _goggles;
    };
};

private _fnc_addHeadgear = {
    params ["_unit"];
    
    private _helmet = selectRandomWeighted (A3A_rebelGear get "ArmoredHeadgear");
    if (_helmet == "") then { _helmet = selectRandom (A3A_faction_reb get "headgear") };
    _unit addHeadgear _helmet;
};

private _fnc_addVest = {
    params ["_unit"];

    private _vest = selectRandomWeighted (A3A_rebelGear get "ArmoredVests");
    if (_vest == "") then { _vest = selectRandomWeighted (A3A_rebelGear get "CivilianVests") };
    _unit addVest _vest;
};

private _fnc_addBackpack = {
    params ["_unit"];

    private _backpack = selectRandomWeighted (A3A_rebelGear get "BackpacksCargo");
    if !(isNil "_backpack") then { _unit addBackpack _backpack };
};

private _fnc_addGrenades = {
    params ["_unit", ["_gType", ""], ["_gAmount", 1]];

    private _types = [[_gType], ["SmokeGrenades", "Grenades"]] select (_gType == "");

    {
        private _grenades = A3A_rebelGear get _x;
        if (_grenades isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _grenades, _gAmount] }
    } forEach _types;
};

private _fnc_addPrimary = {
    params ["_unit", "_overrideClass"];

    private _weaponType = if !(isNil "_overrideClass") then { _overrideClass } else { switch (_typeTag) do {
        case ("Sniper");
        case ("Marksman"): { "SniperRifles" };
        case ("MachineGunner"): { "MachineGuns" };
        case ("Grenadier"): { "GrenadeLaunchers" };
        case ("Medic"): { "SMGs" };
        default { "Rifles" };
    }};
    
    private _totalMagWeight = switch (_typeTag) do {
        case ("Rifleman"): { 70 };
        case ("MachineGunner"): { 150 };
        case ("Medic");
        case ("AA"): { 40 };
        default { 50 };
    };
    
    [_unit, _weaponType, _totalMagWeight] call A3A_fnc_randomWeapon;
};

private _fnc_addSecondary = {
    params ["_unit", "_overrideClass"];

    if !((_typeTag in ["LAT", "AT", "AA"]) || (_typeTag == "Rifleman" && {random 20 < tierWar})) exitWith {}; 
    
    private _weapon = if (isNil "_overrideClass") then {
        private _rLaunchers = A3A_rebelGear get "RocketLaunchers";
        private _dLaunchers = _rLaunchers arrayIntersect AllDisposable;
        private _mLaunchersAT = A3A_rebelGear get "MissileLaunchersAT";
        private _mLaunchersAA = A3A_rebelGear get "MissileLaunchersAA";

        private _launcherPool = createHashMapFromArray [
            ["Rifleman", _dLaunchers],
            ["LAT", _rLaunchers],
            ["AT", _mLaunchersAT],
            ["AA", _mLaunchersAA]
        ];
        
        if (_launcherPool get _typeTag isEqualTo []) exitWith {};
        selectRandomWeighted (_launcherPool get _typeTag);
    } else {
        _overrideClass;
    };

    if (isNil "_weapon") exitWith {};
    [_unit, _weapon, 100] call A3A_fnc_randomWeapon;
};

private _fnc_addHandgun = {
    params ["_unit", "_overrideClass"];

    private _weaponType = if !(isNil "_overrideClass") then { _overrideClass } else { "Handguns" };
    [_unit, _weaponType, 10] call A3A_fnc_randomWeapon;
};

private _fnc_addBinoculars = {
    params ["_unit", "_overrideClass"];

    if !(_typeTag isEqualTo "SquadLeader") exitWith {};
    private _binoType = if !(isNil "_overrideClass") then { _overrideClass } else { "Binoculars" };
    [_unit, _binoType, 5] call A3A_fnc_randomWeapon;
};

private _fnc_addAssignedItems = {
    params ["_unit", "_overrideClass"];

    if (isNil "_overrideClass") then {
        _unit call _fnc_addRadio;
        _unit linkItem (selectRandom (A3A_faction_reb get "compasses"));
        _unit linkItem (selectRandom (A3A_faction_reb get "maps"));
        _unit linkItem (selectRandom (A3A_faction_reb get "watches"));
    } else {
        { if (!isNil "_x") then { _unit linkItem _x } } forEach (_overrideClass);
    };

    if ((hmd _unit) isEqualTo "" && {isNil "_overrideClass" || {!isNil {_overrideClass select 5}}}) then {
        private _nvg = selectRandomWeighted (A3A_rebelGear get "NVGs");
        if (!isNil "_nvg") then { _unit linkItem _nvg };
    };
};

private _fnc_addClassEquip = {
    params ["_unit"];

    private _items = items _unit;
    
    switch (_typeTag) do {
        case ("Rifleman"): {
            [_unit, "Grenades", 2] call _fnc_addGrenades;
            [_unit, "SmokeGrenades", 1] call _fnc_addGrenades;
        };
        case ("ExplosivesExpert"): {
            _unit enableAIFeature ["MINEDETECTION", true]; //This should prevent them from Stepping on the Mines as an "Expert" (It helps, they still step on them)

            private _hasMineDetector = (_items arrayIntersect (A3A_rebelGear get "MineDetectors")) isNotEqualTo [];
            if (!_hasMineDetector) then {
                private _mineDetector = selectRandomWeighted (A3A_rebelGear get "MineDetectors");
                if !(isNil "_mineDetector") then { _unit addItem _mineDetector };
            };

            private _hasToolkit = (_items arrayIntersect (A3A_rebelGear get "Toolkits")) isNotEqualTo [];
            if (!_hasToolkit) then {
                private _toolkit = selectRandomWeighted (A3A_rebelGear get "Toolkits");
                if !(isNil "_toolkit") then { _unit addItem _toolkit };
            };

            [_unit, "Grenades", 2] call _fnc_addGrenades;
            [_unit, 50] call _fnc_addCharges;
        };
        case ("Engineer"): {
            [_unit, "SmokeGrenades", 3] call _fnc_addGrenades;

            private _hasToolkit = (_items arrayIntersect (A3A_rebelGear get "Toolkits")) isNotEqualTo [];
            if (!_hasToolkit) then {
                private _toolkit = selectRandomWeighted (A3A_rebelGear get "Toolkits");
                if !(isNil "_toolkit") then { _unit addItem _toolkit };
            };

            [_unit, 50] call _fnc_addCharges;
        };
        case ("Medic"): {
            [_unit, "SmokeGrenades", 5] call _fnc_addGrenades;

            // not-so-temporary hack
            private _medItems = [];
            {
                for "_i" from 1 to (_x#1) do { _medItems pushBack (_x#0) };
            } forEach (["MEDIC",independent] call A3A_fnc_itemset_medicalSupplies);
            {
                _medItems deleteAt (_medItems find _x);
            } forEach items _unit;
            {
                _unit addItemToBackpack _x;
            } forEach _medItems;
        };
        case ("SquadLeader"): {
            [_unit, "Grenades", 1] call _fnc_addGrenades;
            [_unit, "SmokeGrenades", 2] call _fnc_addGrenades;
        };
        default {
            Error_1("Unknown unit class: %1", _typeTag);
        };
    };
};

private _fnc_addUniform = {
    params ["_unit", "_overrideClass"];

    if (isNil "_overrideClass") then { _unit forceAddUniform (selectRandom (A3A_faction_reb get 'uniforms')) };

    private _uniform = uniformContainer _unit;

    switch (_typeTag) do {
        case ("Rifleman");
        case ("Engineer");
        case ("Grenadier");
        case ("SquadLeader"): {
            { _uniform addItemCargo _x; } forEach ((["STANDARD", independent] call A3A_fnc_itemset_medicalSupplies) + ([] call A3A_fnc_itemset_miscEssentials));
        };
        default {
            { _uniform addItemCargo _x; } forEach ((["MINIMAL", independent] call A3A_fnc_itemset_medicalSupplies) + ([] call A3A_fnc_itemset_miscEssentials));
        };
    };
};

if (!isNil "_customLoadout") then {
    // * Apply the loadout, then override it
    private _tempLoadout = +_customLoadout;
    _unit setUnitLoadout _tempLoadout;
    
    if (isNil {_customLoadout select 3}) then { _unit call _fnc_addUniform } else { [_unit, uniform _unit] call _fnc_addUniform};
    if (isNil {_customLoadout select 6}) then { _unit call _fnc_addHeadgear };
    if (isNil {_customLoadout select 7}) then { _unit call _fnc_addFacewear };
    if (isNil {_customLoadout select 4}) then { _unit call _fnc_addVest };
    if (isNil {_customLoadout select 5}) then { _unit call _fnc_addBackpack };
    if (isNil {_customLoadout select 9}) then { _unit call _fnc_addAssignedItems } else { [_unit, _customLoadout select 9] call _fnc_addAssignedItems };
    if (isNil {_customLoadout select 0}) then { _unit call _fnc_addPrimary } else { [_unit, _customLoadout select 0] call _fnc_addPrimary };
    if (isNil {_customLoadout select 1}) then { _unit call _fnc_addSecondary } else { [_unit, _customLoadout select 1] call _fnc_addSecondary };
    if (isNil {_customLoadout select 2}) then { _unit call _fnc_addHandgun } else { [_unit, _customLoadout select 2] call _fnc_addHandgun };
    //if (isNil {_customLoadout select 8}) then { _unit call _fnc_addBinoculars } else { [_unit, _customLoadout select 8] call _fnc_addBinoculars }; // TODO: Need to fix this
    
    // * Don't cheese allowing launchers with rifleman.
    // * If rifleman and launcher added to loadout, still subject to chance whether rifleman will equip it.
    // * LAT / AT / AA is guaranteed.
    if (_typeTag == "Rifleman" && {random 20 > tierWar}) then {
        _unit removeWeapon (secondaryWeapon _unit)
    };
} else {
    _unit call _fnc_addUniform;
    _unit call _fnc_addHeadgear;
    _unit call _fnc_addFacewear;
    _unit call _fnc_addVest;
    _unit call _fnc_addBackpack;
    _unit call _fnc_addAssignedItems;
    _unit call _fnc_addPrimary;
    _unit call _fnc_addSecondary;
    _unit call _fnc_addHandgun;
    //_unit call _fnc_addBinoculars; // TODO: Need to fix this
};

_unit call _fnc_addClassEquip; // TODO: Need to rework / remove this if cargo is overridden

// remove backpack if empty, otherwise squad troops will throw it on the ground
if (backpackItems _unit isEqualTo []) then { removeBackpack _unit };

Verbose_3("Class %1, type %2, loadout %3", _unitType, _recruitType, str (getUnitLoadout _unit));

if (_recruitType isEqualTo 0) then { _unit setVariable ["orgLoadout", getUnitLoadout _unit, true] };
