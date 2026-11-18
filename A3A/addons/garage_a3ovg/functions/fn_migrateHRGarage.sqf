#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_garage_a3ovg_fnc_migrateHRGarage

Description:
    Migrates legacy HR Garage stored vehicle data to A3OVG.

Parameters:
    None

Optional:
    None

Returns:
    Nothing

Environment:
    Server, Scheduled (but probably doesn't need to be)

Author:
    jwoodruff40
---------------------------------------------------------------------------- */
Debug_1("%1: starting HR Garage --> A3OVG migration check.",QFUNC(migrateHRGarage));

if (!isServer) exitWith {};

private _storage = [] call A3OVG_core_fnc_getStorage;


// Check if we need to migrate HR Garage data to A3OVG
private _migrated = _storage call ["read", ["garage_migrated", ""]];
if (!isNil "_migrated" && {_migrated isEqualType false} && {_migrated}) exitWith {
    Debug("HR Garage data already migrated to A3OVG, skipping.");
};

private _hrData = ["HR_Garage"] call A3A_fnc_returnSavedStat;

if (isNil "_hrData" || { !(_hrData isEqualType []) } || { _hrData isEqualTo [] }) exitWith {
    Info("No HR Garage data found in campaign save; marking migration as complete.");
    _storage call ["write", ["garage_migrated", "", true]];
};

_hrData params [
    ["_categories", [], [[]]],
    ["_lastUID", 0, [0]], // ! not used, unneeded by A3OVG
    ["_sources", [[],[],[]], [[]]] // ! not used, handled automagically by A3OVG
];

Info_1("Migrating HR Garage save data to A3OVG (%1 categories).", count _categories);

// Create vehicle object, apply saved state, then give to A3OVG to store vehicle object in garage
// Unlike HR_Garage, damage / fuel is not restored automatically when sources present in garage
private _fnc_applyState = {
    params ["_tempVehicle", "_state"];

    _state params [
        ["_fuelState", 1, [[], 0]],
        ["_damageState", 0, [[], 0]],
        ["_ammoData", [], [[], 0]],
        ["_ammoCargo", [], [[]]]
    ];

    // Fuel state: <ARRAY> [fuel, fuel cargo, ACE fuel cargo] or <SCALAR> fuel
    if (_fuelState isEqualType 0) then {
        _tempVehicle setFuel _fuelState;
    } else {
        _fuelState params [["_fuel", 1, [0]], ["_fuelCargo", -1, [0]], "_aceFuel"];
        _tempVehicle setFuel _fuel;
        _tempVehicle setFuelCargo _fuelCargo;
        if (!isNil "_aceFuel" && { !isNil "ace_refuel_fnc_setFuel" }) then {
            [_tempVehicle, _aceFuel] call ace_refuel_fnc_setFuel;
        };
    };

    // Damage state: <ARRAY> [overall damage, hitpoint damage, repair cargo] or <SCALAR> damage
    if (_damageState isEqualType 0) then {
        _tempVehicle setDamage _damageState;
    } else {
        _damageState params [["_damage", 0, [0]], ["_hitDamage", [], [[]]], ["_repairCargo", -1, [0]]];
        _tempVehicle setDamage _damage;
        if (_hitDamage isNotEqualTo [] && { _hitDamage select 0 isEqualTo [] }) then { _hitDamage = _hitDamage select 1 };
        { _tempVehicle setHitIndex [_forEachIndex, _x, false] } forEach _hitDamage;
        _tempVehicle setRepairCargo _repairCargo;
    };

    // Ammo data: <ARRAY> [[isPylon, weapon/pylon data], ...] or <SCALAR> total vehicle ammo
    if (_ammoData isEqualType 0) then {
        _tempVehicle setVehicleAmmo _ammoData;
    } else {
        if (_ammoData isNotEqualTo []) then {
            private _weaponData = _ammoData select { !(_x select 0) };
            private _pylonData = _ammoData - _weaponData;

            { _tempVehicle removeMagazinesTurret [_x select 0, _x select 1] } forEach (magazinesAllTurrets _tempVehicle select { !("pylon" in toLower (_x select 0)) });
            { _tempVehicle addMagazineTurret (_x select 1) } forEach _weaponData;
            {
                (_x select 1) params ["_index", "", "_turret", "_magazine", "_count"];
                _tempVehicle setPylonLoadout [_index, _magazine, false, _turret];
                _tempVehicle setAmmoOnPylon [_index, _count];
            } forEach _pylonData;
        };
    };

    // Ammo cargo: <ARRAY> [vanilla/Antistasi ammo cargo, ACE ammo cargo]
    if (_ammoCargo isNotEqualTo []) then {
        _tempVehicle setAmmoCargo (_ammoCargo select 0);
        if ((_ammoCargo param [1, -1]) > -1 && { !isNil "ace_rearm_fnc_setSupplyCount" }) then {
            [_tempVehicle, _ammoCargo select 1] call ace_rearm_fnc_setSupplyCount;
        };
    };
};

private _migrated = 0;
private _skipped = 0;
{
    // should be hashmap of vehicle UID : vehicle data;
    // but may be array of [vehicle UID, vehicle data] depending on exactly when and where this code runs due to save conversion routines,
    // so check just in case we refactor when / where this code is called
    private _storedVehicles = if (_x isEqualType createHashMap) then {
        values _x
    } else {
        _x apply { _x param [1, []] }
    };

    {
        _x params [
            ["_displayName", "", [""]],
            ["_className", "", [""]],
            ["_lockUID", "", [""]],
            ["_checkoutUID", "", [""]], // ! not used
            ["_state", [], [[]]],
            ["_lockName", "", [""]], // ! not used
            ["_customization", [], [[]]]
        ];

        if (_className isEqualTo "" || { !isClass(configFile >> "CfgVehicles" >> _className) }) then {
            Error_2("Cannot migrate vehicle %1 (%2): class does not exist, skipping.",_displayName,_className);
            _skipped = _skipped + 1;
            continue;
        };

        private _tempVehicle = _className createVehicle [0,0,1000];

        if (isNull _tempVehicle) then {
            Error_2("Cannot migrate vehicle %1 (%2): vehicle creation failed, skipping.",_displayName,_className);
            _skipped = _skipped + 1;
            continue;
        };

        [_tempVehicle, _state] call _fnc_applyState;
        if (_customization isNotEqualTo []) then {
            ([_tempVehicle] + _customization) call BIS_fnc_initVehicle;
        };

        private _vehicle = [_tempVehicle] call A3OVG_vehicle_fnc_new;

        // HR Garage stores lock UID but no owner; A3OVG *requires* owner UID but does not require lock UID
        _vehicle call ["setOwner", [_lockUID]];
        if (_lockUID isNotEqualTo "") then {
            _vehicle call ["setLocked", [_lockUID]];
        };

        if (_vehicle call ["write", []]) then {
            Debug_2("Migrated vehicle %1 (%2) to A3OVG.",_displayName,_className);
            _migrated = _migrated + 1;
        } else {
            Error_2("Failed to write migrated vehicle %1 (%2) to A3OVG storage, skipping.",_displayName,_className);
            _skipped = _skipped + 1;
        };

        deleteVehicle _tempVehicle;
    } forEach _storedVehicles;
} forEach _categories;

// mark garage migration as complete
// TODO: move to a flag in campaign data when we move the garage data itself into campaign data / savePluginsData
_storage call ["write", ["garage_migrated", "", true]];

Info_2("HR Garage --> A3OVG migration complete: %1 vehicles migrated, %2 skipped.",_migrated,_skipped);

nil;
