    // ------------ Civilian Units ------------ //
    class Civilian_F : Civilian {
		class EventHandlers;
	};
	class GVAR(Civilians_Base) : Civilian_F {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        faction = QGVAR(Civilians);
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
    class GVAR(Civilians_Man) : GVAR(Civilians_Base) {
        scope = 2;
        scopeCurator = 2;
        editorSubcategory = QGVAR(Other);
        displayName = $STR_A3U_Zeus_UnitType_Man;
        //role = "Rifleman";
        nameSound = "veh_infantry_civilian_s";
        textSingular = "civilian";
        textPlural = "civilians";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Man);
    };
	class GVAR(Civilians_Press) : GVAR(Civilians_Man) {
		displayName = $STR_A3U_Zeus_UnitType_Press;
		GVAR(unitType) = QUOTE(Press);
	};
	class GVAR(Civilians_Worker) : GVAR(Civilians_Man) {
		displayName = $STR_A3U_Zeus_UnitType_Worker;
		GVAR(unitType) = QUOTE(Worker);
	};

	// ------------ Civilian Vehicles ------------ //
    class GVAR(Civilians_Vehicle_Car) : GVAR(Vehicle_Car_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Civilians);
        side = 3;
        GVAR(vehFaction) = QUOTE(civ);
        displayName = $STR_A3U_Zeus_VehicleType_CivCar;
        GVAR(vehType) = QUOTE(vehiclesCivCar);
    };
    class GVAR(Civilians_Vehicle_Industrial) : GVAR(Civilians_Vehicle_Car) {
        displayName = $STR_A3U_Zeus_VehicleType_CivIndustrial;
        GVAR(vehType) = QUOTE(vehiclesCivIndustrial);
    };
	class GVAR(Civilians_Vehicle_Repair) : GVAR(Civilians_Vehicle_Car) {
        displayName = $STR_A3U_Zeus_VehicleType_CivRepair;
        GVAR(vehType) = QUOTE(vehiclesCivRepair);
    };
	class GVAR(Civilians_Vehicle_Medical) : GVAR(Civilians_Vehicle_Car) {
        displayName = $STR_A3U_Zeus_VehicleType_CivMedical;
        GVAR(vehType) = QUOTE(vehiclesCivMedical);
    };
	class GVAR(Civilians_Vehicle_Boat) : GVAR(Vehicle_Ship_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_CivBoat;
        faction = QGVAR(Civilians);
        side = 3;
        GVAR(vehFaction) = QUOTE(civ);
        GVAR(vehType) = QUOTE(vehiclesCivBoat);
    };
