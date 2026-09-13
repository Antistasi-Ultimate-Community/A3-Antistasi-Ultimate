#define BOOL_CREW_VEHICLE ([ARR_2(true,cbChecked ((findDisplay 312) displayCtrl 25460))] select (isClass (configFile >> QUOTE(QUOTE(CfgPatches)) >> QUOTE(QUOTE(zen_common)))))
#define UNIT_INIT_HANDLER QUOTE([ARR_4(_this#0,getText(configOf(_this#0) >> QQGVAR(unitFaction)),getText(configOf(_this#0) >> QQGVAR(unitPrefix)),getText(configOf(_this#0) >> QQGVAR(unitType)))] call FUNC(initUnit))
#define VEH_INIT_HANDLER QUOTE([ARR_4(_this#0,getText(configOf(_this#0) >> QQGVAR(vehFaction)),getText(configOf(_this#0) >> QQGVAR(vehType)),BOOL_CREW_VEHICLE)] call FUNC(initVehicle))
#define MODULE_INIT_HANDLER QUOTE(_this call FUNC(initModule))

class CfgVehicles {
    // Base classes
    class SoldierWB;
    class Civilian;
	
    class Car;
    class Car_F : Car {
        class EventHandlers;
    };
    class GVAR(Vehicle_Car_Base) : Car_F {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_Cars";
		class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class APC;
    class APC_F : APC {
        class EventHandlers;
    };
    class GVAR(Vehicle_APC_Base) : APC_F {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_APCs";
		class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class Tank;
    class Tank_F : Tank {
        class EventHandlers;
    };
    class GVAR(Vehicle_Tank_Base) : Tank_F {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_Tanks";
		class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class Ship;
    class Ship_F : Ship {
        class EventHandlers;
    };
    class GVAR(Vehicle_Ship_Base) : Ship_F {
        scope = 1;
        scopeCurator = 1;
		editorSubcategory = "EdSubcat_Boats";
		class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class Helicopter;
    class Helicopter_F : Helicopter {
        class EventHandlers;
    };
    class GVAR(Vehicle_Heli_Base) : Helicopter_F {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_Helicopters";
        class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class Plane;
    class Plane_Base_F : Plane {
        class EventHandlers;
    };
    class GVAR(Vehicle_Plane_Base) : Plane_Base_F {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_Planes";
        class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class StaticWeapon;
    class StaticMGWeapon : StaticWeapon {
        class EventHandlers;
    };
    class GVAR(Vehicle_StaticMG_Base) : StaticMGWeapon {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_Turrets";
        class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class StaticAAWeapon : StaticWeapon {
        class EventHandlers;
    };
    class GVAR(Vehicle_StaticAA_Base) : StaticAAWeapon {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_Turrets";
        class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class StaticATWeapon : StaticWeapon {
        class EventHandlers;
    };
    class GVAR(Vehicle_StaticAT_Base) : StaticATWeapon {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_Turrets";
        class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    class StaticMortar;
    class StaticMortar_F : StaticMortar {
        class EventHandlers;
    };
    class GVAR(Vehicle_StaticMortar_Base) : StaticMortar_F {
        scope = 1;
        scopeCurator = 1;
        editorSubcategory = "EdSubcat_Turrets";
        class EventHandlers {
            class ADDON {
                PostInit = VEH_INIT_HANDLER;
            };
        };
    };
    
    class Module_F;
    class GVAR(Module_Base) : Module_F {
        scope = 1;
        scopeCurator = 1;
        category = "";
        displayName = "";
        function = "";
        class EventHandlers {
            init = MODULE_INIT_HANDLER;
        };
    };

    // Custom classes for Antistasi Units / Vehicles in Eden / Zeus
    #include "CfgVehicles\A3U_Rebels.hpp"
    #include "CfgVehicles\A3U_Occupants.hpp"
    #include "CfgVehicles\A3U_Invaders.hpp"
    #include "CfgVehicles\A3U_Rivals.hpp"
    #include "CfgVehicles\A3U_Civilians.hpp"

    // Custom modules for Antistasi supports / events in Zeus
    #include "CfgVehicles\A3U_Modules.hpp"
};
