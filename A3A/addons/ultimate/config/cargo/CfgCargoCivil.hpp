class cargo_civil : cargo_base
{
    weight = 1;
    class cargoTypes
    {
        class general {
            weight = 1;
            cargo[] = {{"Land_PaperBox_01_small_stacked_F", 3}};
        };
        class food : general {
            cargo[] = {{"Land_FoodSacks_01_cargo_white_idap_F", 3}};
        };
        class water : general {
            cargo[] = {{"Land_WaterBottle_01_stack_F", 3}};
        };
        class medicine : general {
            weight = 0.8;
            cargo[] = {{"C_IDAP_supplyCrate_F", 3}, {"C_IDAP_CargoNet_01_supplies_F", 3}};
        };
        class fuel : general {
            weight = 0.8;
            cargo[] = {{"CargoNet_01_barrels_F", 3}};
        };
    };
};