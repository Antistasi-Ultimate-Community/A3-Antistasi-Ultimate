/*
    Author:
        Silence

    The idea of this config is to create a list of cargo types that the logistics system can choose from

    We have the following classes and values, using cargo_potatoes as an example:
    class cargo_potatoes : cargo_base
    {
        weight = 0.4; // Weight per category for selectRandomWeighted. Built into an array during runtime (should probably cache...)
        class cargoTypes
        {
            class potato_sacks {
                weight = 0.6; // Weight per type within category. This doesn't need to add up to 1, but it's good practice
                cargo[] = {{"potato_sacks", 2}}; // Array of either "class", amount | OR | "class", "class". Can use any amount or any number of elements.
            };
            class potato_pallets {
                weight = 0.4;
                cargo[] = {{"potato_pallets_variation_1", "potato_pallets_variation_2"}};
            };
        };
    };
*/

class CfgCargo
{
    class cargo_base 
    {
        weight = 0;
        flag[] = {"modern"};
        class cargoTypes {};
    }; // Needs a requiredAddons check I believe... I cri

    class cargo_lowTech_base : cargo_base
    {
        flag[] = {"modern", "lowTech"};
    };

    #include "CfgCargoArmaments.hpp"
    #include "CfgCargoCivil.hpp"
    #include "CfgCargoConstruction.hpp"
    #include "CfgCargoVehicle.hpp"

    #include "CfgCargoLowtech.hpp"
};