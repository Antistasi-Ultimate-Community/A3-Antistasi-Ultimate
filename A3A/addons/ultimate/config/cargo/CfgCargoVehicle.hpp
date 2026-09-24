class cargo_vehicle : cargo_base
{
    weight = 0.3;
    class cargoTypes
    {
        class tank_tracks {
            weight = 0.6;
            cargo[] = {{"Land_TankTracks_01_long_F", 2}};
        };
        class tank_engine {
            weight = 0.4;
            cargo[] = {{"Land_TankEngine_01_F", 1}};
        };
    };
};