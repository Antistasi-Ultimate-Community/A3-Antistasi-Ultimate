class CfgVehicles {
    // Base classes
    class SoldierWB;
    
    class Car;
    class Car_F : Car {
        class EventHandlers;
    };
    class APC;
    class APC_F : APC {
        class EventHandlers;
    };
    class Tank;
    class Tank_F : Tank {
        class EventHandlers;
    };
    class Ship;
    class Ship_F : Ship {
        class EventHandlers;
    };
    class Helicopter;
    class Helicopter_F : Helicopter {
        class EventHandlers;
    };
    class Air;
    class Air_F : Air {
        class EventHandlers;
    };
    class StaticWeapon;
    class StaticWeapon_F : StaticWeapon {
        class EventHandlers;
    };
    class StaticMortar;
    class StaticMortar_F : StaticMortar {
        class EventHandlers;
    };
    
    // Custom classes for Antistasi Units / Vehicles in Eden / Zeus
    #include "CfgVehicles\A3U_Rebels.hpp"
    #include "CfgVehicles\A3U_Occupants.hpp"
    #include "CfgVehicles\A3U_Invaders.hpp"
    #include "CfgVehicles\A3U_Rivals.hpp"
};
