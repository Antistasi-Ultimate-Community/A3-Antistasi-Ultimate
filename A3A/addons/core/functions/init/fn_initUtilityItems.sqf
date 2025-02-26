/*
    Initialize data for buyable items
    Sets global vars A3A_utilityItemList and A3A_utilityItemHM

Arguments: none
Returns: none

Environment: Server, must be called after faction loading
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _fuelDrum = FactionGet(reb,"vehicleFuelDrum");
private _fuelTank = FactionGet(reb,"vehicleFuelTank");
private _medCrate = FactionGet(reb,"vehicleMedicalBox");
private _medTent = FactionGet(reb,"vehicleHealthStation");
private _ammoStation = FactionGet(reb,"vehicleAmmoStation");
private _repairStation = FactionGet(reb,"vehicleRepairStation");
private _reviveKitBox = FactionGet(reb, "reviveKitBox");
private _lootCrate = [FactionGet(reb,"lootCrate"), lootCratePrice];
private _lightSource = [FactionGet(reb,"vehicleLightSource"), 100];

private _items = [];

if (lootCratesEnabled) then {
    _items pushBack [_lootCrate#0, _lootCrate#1, localize "STR_A3AP_buyvehdialog_loot_crate", "lootbox", ["move", "place", "loot"]];
};

if (reviveKitsEnabled) then {
    _items pushBack [_reviveKitBox#0, _reviveKitBox#1, localize "STR_A3AP_buyvehdialog_revive_kit_box", "revivebox", ["cmmdr", "move", "place", "revivekit"]];
};

_items append [
    [_fuelDrum#0, _fuelDrum#1, localize "STR_A3AP_buyvehdialog_fuel_drum", "refuel", ["fuel", "move", "save", "rotate"]],
    [_fuelTank#0, _fuelTank#1, localize "STR_A3AP_buyvehdialog_fuel_tank", "refuel", ["cmmdr", "fuel", "place", "move", "rotate", "save"]],
    [_medTent#0, _medTent#1, localize "STR_A3AP_buyvehdialog_medical_tent", "heal", ["place", "move", "rotate", "pack"]],
    [_ammoStation#0, _ammoStation#1, localize "STR_A3AP_buyvehdialog_ammo_station", "rearm", ["cmmdr", "place", "move", "rotate", "save"]],
    [_repairStation#0, _repairStation#1, localize "STR_A3AP_buyvehdialog_repair_station", "repair", ["cmmdr", "place", "move", "rotate", "pack", "save"]],
    [_lightSource#0, _lightSource#1, localize "STR_A3AP_buyvehdialog_light", "", ["move"]],
    ["Land_PlasticCase_01_small_black_F", 250, "Build Box (Extra Small)", "", ["place", "move", "build"]],
    ["Land_PlasticCase_01_medium_black_F", 500, "Build Box (Small)", "", ["place", "move", "build"]],
    ["A3AU_Build_Box_Large_1", 2500, "Build Box (Medium)", "", ["place", "move", "build"]],
    ["Land_PlasticCase_01_large_black_F", 5000, "Build Box (Large)", "", ["place", "move", "build"]]
    // TODO: get larger box from somewhere
];

if(A3A_hasACE) then {
    _items pushBack [_medCrate#0, _medCrate#1, localize "STR_A3AP_buyvehdialog_medical_box", "heal", ["noclear", "move"]];
    _items pushBack ["ACE_Wheel", 5, "", "", []];
    _items pushBack ["ACE_Track", 5, "", "", []];       // check names
};

// Add packed variants so that they can be initialized properly
{
    private _packClass = getText (configFile >> "A3A" >> "A3A_Logistics_Packable" >> _x#0 >> "packObject");
    if (_packClass == "") then { Error_1("Packable item %1 has no packed object", _x#0); continue };
    _items pushBack [_packClass, -1, "", "", ["move", "unpack"]];
} forEach (_items select { "pack" in _x#4 });

A3A_utilityItemList = _items select { _x#1 >= 0 } apply { _x#0 };
A3A_utilityItemHM = (_items apply { _x#0 }) createHashMapFromArray _items;
