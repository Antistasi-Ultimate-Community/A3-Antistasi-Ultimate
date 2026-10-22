class cargo_armaments : cargo_base
{
    weight = 0.4;
    class cargoTypes
    {
        class weapons {
            weight = 0.6;
            cargo[] = {{"B_CargoNet_01_ammo_F", 2}};
        };
        class explosives {
            weight = 0.4;
            cargo[] = {{"Box_NATO_AmmoVeh_F", 2}};
        };
    };
};