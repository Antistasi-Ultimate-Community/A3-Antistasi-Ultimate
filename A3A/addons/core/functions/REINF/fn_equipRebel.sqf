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
private _customLoadout = rebelLoadouts get _unitType;

private _fnc_addSecondary = {
    params ["_unit"];

    if !((_typeTag in ["LAT", "AT", "AA"]) || (_typeTag == "Rifleman" && {random 20 < tierWar})) exitWith {}; 
    
    private _rLaunchers = A3A_rebelGear get "RocketLaunchers";
    private _dLaunchers = [];
    private _mLaunchersAT = A3A_rebelGear get "MissileLaunchersAT";
    private _mLaunchersAA = A3A_rebelGear get "MissileLaunchersAA";

    {
        if ("Disposable" in (_x call A3A_fnc_equipmentClassToCategories)) then { _dLaunchers append [_x, _rlaunchers select (_rlaunchers find _x) + 1 ] };
    } forEach (_rlaunchers select {_x isEqualType ""});

    private _launcherPool = createHashMapFromArray [
        ["Rifleman", _dLaunchers],
        ["LAT", _rLaunchers],
        ["AT", _mLaunchersAT],
        ["AA", _mLaunchersAA]
    ];
    
    if (_launcherPool get _typeTag isEqualTo []) exitWith {};
    private _weapon = selectRandomWeighted (_launcherPool get _typeTag);

    _unit addWeapon _weapon;
    private _magazine = selectRandom ((A3A_rebelGear get "Magazines") get _weapon);
    _unit addSecondaryWeaponItem _magazine;

    if ("Disposable" in (_weapon call A3A_fnc_equipmentClassToCategories)) exitWith {};
    private _magWeight = 20 max getNumber (configFile / "CfgMagazines" / _magazine / "mass");
    _unit addMagazines [_magazine, round (random 0.5 + 100 / _magWeight)];

    private _compatOptics = A3A_rebelOpticsCache get _weapon;
    if (isNil "_compatOptics") then {
        private _compatItems = compatibleItems _weapon; // cached, should be fast
        _compatOptics = _compatItems arrayIntersect (A3A_rebelGear get "OpticsAll");
        A3A_rebelOpticsCache set [_weapon, _compatOptics];
    };
    if (_compatOptics isNotEqualTo []) then { _unit addSecondaryWeaponItem (selectRandom _compatOptics) };
};

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
    params ["_unit"];

    private _weaponType = switch (_typeTag) do {
        case ("Sniper");
        case ("Marksman"): { "SniperRifles" };
        case ("MachineGunner"): { "MachineGuns" };
        case ("Grenadier"): { "GrenadeLaunchers" };
        case ("Medic"): { "SMGs" };
        default { "Rifles" };
    };
    
    private _totalMagWeight = switch (_typeTag) do {
        case ("Rifleman"): { 70 };
        case ("MachineGunner"): { 150 };
        case ("Medic");
        case ("AA"): { 40 };
        default { 50 };
    };
    
    [_unit, _weaponType, _totalMagWeight] call A3A_fnc_randomWeapon;
};

private _fnc_addHandgun = {
    params ["_unit"];

    [_unit, "Handguns", 10] call A3A_fnc_randomWeapon;
};

private _fnc_addClassEquip = {
    params ["_unit"];

    switch (_typeTag) do {
        case ("Rifleman"): {
            [_unit, "Grenades", 2] call _fnc_addGrenades;
            [_unit, "SmokeGrenades", 1] call _fnc_addGrenades;
        };
        case ("ExplosivesExpert"): {
            _unit enableAIFeature ["MINEDETECTION", true]; //This should prevent them from Stepping on the Mines as an "Expert" (It helps, they still step on them)

            private _mineDetector = selectRandomWeighted (A3A_rebelGear get "MineDetectors");
            if !(isNil "_mineDetector") then { _unit addItem _mineDetector };

            private _toolkit = selectRandomWeighted (A3A_rebelGear get "Toolkits");
            if !(isNil "_toolkit") then { _unit addItem _toolkit };

            [_unit, 50] call _fnc_addCharges;
        };
        case ("Engineer"): {
            private _toolkit = selectRandomWeighted (A3A_rebelGear get "Toolkits");
            if !(isNil "_toolkit") then { _unit addItem _toolkit };

            [_unit, 50] call _fnc_addCharges;
        };
        case ("Medic"): {
            [_unit, "SmokeGrenades", 2] call _fnc_addGrenades;

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
            [_unit, "SmokeGrenades", 2] call _fnc_addGrenades;
        };
        default {
            Error_1("Unknown unit class: %1", _typeTag);
        };
    };
};

private _fnc_addNightEquip = {
    params ["_unit"];

    private _nvg = selectRandomWeighted (A3A_rebelGear get "NVGs");
    if (_nvg != "") then { 
        _unit linkItem _nvg;
        private _weapon = primaryWeapon _unit;
        private _compatLasers = A3A_rebelLasersCache get _weapon;
        if (isNil "_compatLasers") then {
            private _compatItems = compatibleItems _weapon; // cached, should be fast
            _compatLasers = _compatItems arrayIntersect (A3A_rebelGear get "LaserAttachments");
            A3A_rebelLasersCache set [_weapon, _compatLasers];
        };
        if (_compatLasers isNotEqualTo []) then {
            private _LaserAttachment = selectRandom _compatLasers;
            _unit addPrimaryWeaponItem _LaserAttachment;		// should be used automatically by AI as necessary
        };
        private _weaponsecondary = secondaryWeapon _unit;
        private _compatSecondaryLasers = A3A_rebelLasersCache get _weaponsecondary;
        if (isNil "_compatSecondaryLasers") then {
            private _compatItems = compatibleItems _weaponsecondary; // cached, should be fast
            _compatSecondaryLasers = _compatItems arrayIntersect (A3A_rebelGear get "LaserAttachments");
            A3A_rebelLasersCache set [_weaponsecondary, _compatSecondaryLasers];
        };
        if (_compatSecondaryLasers isNotEqualTo []) then {
            private _LaserAttachment = selectRandom _compatSecondaryLasers;
            _unit addSecondaryWeaponItem _LaserAttachment;		// should be used automatically by AI as necessary
        };
        private _weaponhandgun = handgunWeapon _unit;
        private _compatHandgunLasers = A3A_rebelLasersCache get _weaponhandgun;
        if (isNil "_compatHandgunLasers") then {
            private _compatItems = compatibleItems _weaponhandgun; // cached, should be fast
            _compatHandgunLasers = _compatItems arrayIntersect (A3A_rebelGear get "LaserAttachments");
            A3A_rebelLasersCache set [_weaponhandgun, _compatHandgunLasers];
        };
        if (_compatHandgunLasers isNotEqualTo []) then {
            private _LaserAttachment = selectRandom _compatHandgunLasers;
            _unit addHandgunItem _LaserAttachment;		// should be used automatically by AI as necessary
        };
    } else {
        private _weapon = primaryWeapon _unit;
        private _compatLights = A3A_rebelFlashlightsCache get _weapon;
        if (isNil "_compatLights") then {
            private _compatItems = compatibleItems _weapon; // cached, should be fast
            _compatLights = _compatItems arrayIntersect (A3A_rebelGear get "LightAttachments");
            A3A_rebelFlashlightsCache set [_weapon, _compatLights];
        };
        if (_compatLights isNotEqualTo []) then {
            private _flashlight = selectRandom _compatLights;
            _unit addPrimaryWeaponItem _flashlight;		// should be used automatically by AI as necessary
        };
        private _weaponsecondary = secondaryWeapon _unit;
        private _compatSecondaryLights = A3A_rebelFlashlightsCache get _weaponsecondary;
        if (isNil "_compatSecondaryLights") then {
            private _compatItems = compatibleItems _weaponsecondary; // cached, should be fast
            _compatSecondaryLights = _compatItems arrayIntersect (A3A_rebelGear get "LightAttachments");
            A3A_rebelFlashlightsCache set [_weaponsecondary, _compatSecondaryLights];
        };
        if (_compatSecondaryLights isNotEqualTo []) then {
            private _flashlight = selectRandom _compatSecondaryLights;
            _unit addSecondaryWeaponItem _flashlight;		// should be used automatically by AI as necessary
        };
        private _weaponhandgun = handgunWeapon _unit;
        private _compatHandgunLights = A3A_rebelFlashlightsCache get _weaponhandgun;
        if (isNil "_compatHandgunLights") then {
            private _compatItems = compatibleItems _weaponhandgun; // cached, should be fast
            _compatHandgunLights = _compatItems arrayIntersect (A3A_rebelGear get "LightAttachments");
            A3A_rebelFlashlightsCache set [_weaponhandgun, _compatHandgunLights];
        };
        if (_compatHandgunLights isNotEqualTo []) then {
            private _flashlight = selectRandom _compatHandgunLights;
            _unit addHandgunItem _flashlight;		// should be used automatically by AI as necessary
        };
    };
};

private _fnc_addUniform = {
    params ["_unit"];

    _unit forceAddUniform (selectRandom (A3A_faction_reb get 'uniforms'));

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

private _unarmedLoadout = (A3A_faction_reb get "loadouts" get "militia_Unarmed") select 0 select 0;
_unit setUnitLoadout _unarmedLoadout;

if (!isNil "_customLoadout") then {
    // * Apply the loadout, then override it
    _unit setUnitLoadout _customLoadout;
    
    if (randomizeRebelLoadoutUniforms) then {
        _unit call _fnc_addUniform;
        _unit call _fnc_addHeadgear;
        _unit call _fnc_addFacewear;
    };

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
    _unit call _fnc_addPrimary;
    _unit call _fnc_addSecondary;
    _unit call _fnc_addHandgun;
    _unit call _fnc_addNightEquip;
};

_unit call _fnc_addRadio;
_unit call _fnc_addClassEquip;
_unit linkItem (selectRandom (A3A_faction_reb get "compasses"));
_unit linkItem (selectRandom (A3A_faction_reb get "maps"));
_unit linkItem (selectRandom (A3A_faction_reb get "watches"));

// remove backpack if empty, otherwise squad troops will throw it on the ground
if (backpackItems _unit isEqualTo []) then { removeBackpack _unit };

Verbose_3("Class %1, type %2, loadout %3", _unitType, _recruitType, str (getUnitLoadout _unit));
