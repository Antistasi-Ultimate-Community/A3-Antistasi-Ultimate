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