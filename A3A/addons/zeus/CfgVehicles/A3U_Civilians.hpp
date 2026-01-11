    // ------------ Civilian Units ------------ //
    class Civilian_F : Civilian {
		class EventHandlers;
	};
	class A3U_Civilians_Base: Civilian_F {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        faction = "A3U_Civilians";
        icon = "iconMan";
        picture = "";
        uniformClass = "";
        backpack = "";
        items[] = {};
        respawnItems[] = {};
        linkedItems[] = {};
        respawnLinkedItems[] = {};
        weapons[] = {"Throw", "Put"};
        respawnWeapons[] = {"Throw", "Put"};
        magazines[] = {};
        respawnMagazines[] = {};
        GVAR(unitFaction) = QUOTE(civ);
        class EventHandlers {
            class ADDON {
                PostInit = UNIT_INIT_HANDLER;
            };
        };
    };
    class A3U_Civilians_Man: A3U_Civilians_Base {
        scope = 2;
        scopeCurator = 2;
        editorSubcategory = "A3U_Other";
        displayName = $STR_A3U_Zeus_UnitType_Man;
        //role = "Rifleman";
        nameSound = "veh_infantry_civilian_s";
        textSingular = "civilian";
        textPlural = "civilians";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Man);
    };
	class A3U_Civilians_Press : A3U_Civilians_Man {
		displayName = $STR_A3U_Zeus_UnitType_Press;
		GVAR(unitType) = QUOTE(Press);
	};
	class A3U_Civilians_Worker : A3U_Civilians_Man {
		displayName = $STR_A3U_Zeus_UnitType_Worker;
		GVAR(unitType) = QUOTE(Worker);
	};

	// ------------ Civilian Vehicles ------------ //
    class A3U_Civilians_Vehicle_Car : A3U_Vehicle_Car_Base {
        scope = 2;
        scopeCurator = 2;
		//crew = "A3U_Civilians_Man";
        faction = "A3U_Civilians";
        side = 3;
        GVAR(vehFaction) = QUOTE(civ);
        displayName = $STR_A3U_Zeus_VehicleType_CivCar;
        GVAR(vehType) = QUOTE(vehiclesCivCar);
    };
    class A3U_Civilians_Vehicle_Industrial : A3U_Civilians_Vehicle_Car {
        displayName = $STR_A3U_Zeus_VehicleType_CivIndustrial;
        GVAR(vehType) = QUOTE(vehiclesCivIndustrial);
    };
	class A3U_Civilians_Vehicle_Repair : A3U_Civilians_Vehicle_Car {
        displayName = $STR_A3U_Zeus_VehicleType_CivRepair;
        GVAR(vehType) = QUOTE(vehiclesCivRepair);
    };
	class A3U_Civilians_Vehicle_Medical : A3U_Civilians_Vehicle_Car {
        displayName = $STR_A3U_Zeus_VehicleType_CivMedical;
        GVAR(vehType) = QUOTE(vehiclesCivMedical);
    };
	class A3U_Civilians_Vehicle_Boat : A3U_Vehicle_Ship_Base {
        scope = 2;
        scopeCurator = 2;
		//crew = "A3U_Civilians_Man";
        displayName = $STR_A3U_Zeus_VehicleType_CivBoat;
        faction = "A3U_Civilians";
        side = 3;
        GVAR(vehFaction) = QUOTE(civ);
        GVAR(vehType) = QUOTE(vehiclesCivBoat);
    };
