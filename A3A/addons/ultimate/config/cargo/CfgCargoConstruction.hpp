class cargo_construction : cargo_base
{
    weight = 0.3;
    class cargoTypes
    {
        class wood {
            weight = 0.6;
            cargo[] = {{"Land_WoodenPlanks_01_pine_F", 1}};
        };
        class iron {
            weight = 0.4;
            cargo[] = {{"Land_Pipes_large_F", 1}};
        };
    };
};