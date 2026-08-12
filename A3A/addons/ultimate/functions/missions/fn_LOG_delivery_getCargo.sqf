#include "..\..\script_component.hpp"

private _cargoTypes = [
    "CIVIL", 1,
    "CIVILFUEL", 0.8, // Explosive, active fuel
    "CIVILFOOD", 1,
    "CIVILWATER", 1,
    "CIVILMEDICINE", 0.8,
    "CONSTRUCTIONWOOD", 0.3,
    "CONSTRUCTIONIRON", 0.2,
    "VEHICLETANK", 0.6, // No active fuel
    "VEHICLEPLANE", 0.4, // Explosive, active fuel
    "WEAPONS", 0.6, // No active fuel
    "EXPLOSIVES", 0.4 // Explosive, active fuel
];

private _cargoType = selectRandomWeighted _cargoTypes;
private _cargo = nil;

// Hardcoded though could easily be passed to config. I just don't see reason to make it like that atm
// Explosives should blow up if shot, so they should be a bit more dangerous to transport (blowing up eh, and paying more)

switch (_cargoType) do {
    case "CIVIL": {
        _cargo = ["Land_PaperBox_01_small_stacked_F", "Land_PaperBox_01_small_stacked_F"];
    };
    case "CIVILFUEL": {
        _cargo = ["CargoNet_01_barrels_F", "CargoNet_01_barrels_F"];
    };
    case "CIVILFOOD": {
        _cargo = ["Land_FoodSacks_01_cargo_white_idap_F", "Land_FoodSacks_01_cargo_white_idap_F"];
    };
    case "CIVILWATER": {
        _cargo = ["Land_WaterBottle_01_stack_F", "Land_WaterBottle_01_stack_F"];
    };
    case "CIVILMEDICINE": {
        _cargo = selectRandom [
            ["C_IDAP_supplyCrate_F", "C_IDAP_supplyCrate_F"], ["C_IDAP_CargoNet_01_supplies_F", "C_IDAP_CargoNet_01_supplies_F"]
        ];
    };
    case "CONSTRUCTIONWOOD": {
        _cargo = ["Land_WoodenPlanks_01_pine_F"];
    };
    case "CONSTRUCTIONIRON": {
        _cargo = ["Land_IronPipes_F"];
    };
    case "VEHICLETANK": {
        _cargo = selectRandom [
            ["Land_TankTracks_01_long_F", "Land_TankTracks_01_long_F"], 
            ["Land_TankEngine_01_F"]
        ];
    };
    case "VEHICLEPLANE": {
        _cargo = ["Land_JetEngineStarter_01_F"];
    };
    case "WEAPONS": {
        _cargo = selectRandom [
            ["B_CargoNet_01_ammo_F", "B_CargoNet_01_ammo_F"], 
            ["B_supplyCrate_F", "B_supplyCrate_F"]
        ];
    };
    case "EXPLOSIVES": {
        _cargo = ["Box_NATO_AmmoVeh_F", "Box_NATO_AmmoVeh_F"];
    };
    default {
        Error_1("Invalid _cargoType: %1", _cargoType)
    };
};

// Make sure to give any possible cargo type a proper vehicle price

[_cargoType, _cargo];