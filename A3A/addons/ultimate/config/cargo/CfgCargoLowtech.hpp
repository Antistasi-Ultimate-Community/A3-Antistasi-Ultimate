class cargo_civil_lowTech : cargo_lowTech_base
{
    weight = 0.7;
    class cargoTypes
    {
        class general {
            weight = 1;
            cargo[] = {{"Land_WoodenCrate_01_F", 4}, {"Land_WoodenBox_F", 4}};
        };
        class food : general {
            cargo[] = {{"Land_FoodSacks_01_large_brown_F", 3}, {"Land_Sacks_goods_F", 3}};
        };
        class medicine : general {
            weight = 0.8;
            cargo[] = {{"Land_WoodenCrate_01_stack_x3_F", 3}, {"Land_WoodenCrate_01_stack_x5_F", 3}};
        };
    };
};

class cargo_construction_lowTech : cargo_lowTech_base
{
    weight = 0.3;
    class cargoTypes
    {
        class brick {
            weight = 0.4;
            cargo[] = {{"Land_Bricks_V1_F", 3}, {"Land_Bricks_V4_F", 3}};
        };
        class hedgehog {
            weight = 0.4;
            cargo[] = {{"Land_CzechHedgehog_01_old_F", 3}};
        };
        class iron {
            weight = 0.2;
            cargo[] = {{"Land_IronPipes_F", 1}};
        };
    };
};