    // ------------ Rebel Units ------------ //
    class I_Soldier_base_F : SoldierWB {
        class EventHandlers;
    };
    class GVAR(Rebels_Base) : I_Soldier_base_F {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        faction = QGVAR(Rebels);
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
        GVAR(unitFaction) = QUOTE(reb);
        class EventHandlers {
            class ADDON {
                PostInit = UNIT_INIT_HANDLER;
            };
        };
    };
    class GVAR(Rebels_Rifleman) : GVAR(Rebels_Base) {
        scope = 2;
        scopeCurator = 2;
        editorSubcategory = QGVAR(Militia);
        displayName = $STR_A3U_Zeus_UnitType_Rifleman;
        role = "Rifleman";
        nameSound = "veh_infantry_s";
        textSingular = "infantry";
        textPlural = "infantry";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Rebels_SquadLeader) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
		icon = "iconManLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Rebels_staticCrew) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SCrew;
        role = "Crewman";
        GVAR(unitType) = QUOTE(staticCrew);
    };
    class GVAR(Rebels_Medic) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Medic;
		attendant = 1;
		icon = "iconManMedic";
		picture = "pictureHeal";
        role = "CombatLifeSaver";
        GVAR(unitType) = QUOTE(Medic);
    };
    class GVAR(Rebels_Engineer) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
		canDeactivateMines = 1;
		engineer = 1;
		icon = "iconManEngineer";
		picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Rebels_ExplosivesExpert) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
		canDeactivateMines = 1;
		icon = "iconManExplosive";
		picture = "pictureExplosive";
        role = "Sapper";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Rebels_Grenadier) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Rebels_LAT) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
		icon = "iconManAT";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Rebels_AT) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
		icon = "iconManAT";
        role = "MissileSpecialist";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Rebels_AA) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
		role = "MissileSpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Rebels_MachineGunner) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
		icon = "iconManMG";
        role = "MachineGunner";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Rebels_Marksman) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Rebels_Sniper) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Rebels_Unarmed) : GVAR(Rebels_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Unarmed;
        role = "Unarmed";
        GVAR(unitType) = QUOTE(Unarmed);
    };

	// ------------ Rebel Vehicles ------------ //
    class GVAR(Rebels_Vehicle_Basic) : GVAR(Vehicle_Car_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Rebels);
        side = 2;
        displayName = $STR_A3U_Zeus_VehicleType_Basic;
		GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(vehiclesBasic);
    };
    class GVAR(Rebels_Vehicle_LightUnarmed) : GVAR(Rebels_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_LightUnarmed;
        GVAR(vehType) = QUOTE(vehiclesLightUnarmed);
    };
    class GVAR(Rebels_Vehicle_LightArmed) : GVAR(Rebels_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_LightArmed;
        GVAR(vehType) = QUOTE(vehiclesLightArmed);
    };
    class GVAR(Rebels_Vehicle_Truck) : GVAR(Rebels_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_Truck;
        GVAR(vehType) = QUOTE(vehiclesTruck);
    };
    class GVAR(Rebels_Vehicle_AA) : GVAR(Rebels_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_AA;
		editorSubcategory = "EdSubcat_AAs";
        GVAR(vehType) = QUOTE(vehiclesAA);
    };
    class GVAR(Rebels_Vehicle_AT) : GVAR(Rebels_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_AT;
        GVAR(vehType) = QUOTE(vehiclesAT);
    };
    class GVAR(Rebels_Vehicle_CivCar) : GVAR(Rebels_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_CivCar;
        GVAR(vehType) = QUOTE(vehiclesCivCar);
    };
    class GVAR(Rebels_Vehicle_CivTruck) : GVAR(Rebels_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_CivTruck;
        GVAR(vehType) = QUOTE(vehiclesCivTruck);
    };
	class GVAR(Rebels_Vehicle_Boat) : GVAR(Vehicle_Ship_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_Boat;
        faction = QGVAR(Rebels);
        side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(vehiclesBoat);
    };
    class GVAR(Rebels_Vehicle_CivBoat) : GVAR(Rebels_Vehicle_Boat) {
        displayName = $STR_A3U_Zeus_VehicleType_CivBoat;
        GVAR(vehType) = QUOTE(vehiclesCivBoat);
    };
	class GVAR(Rebels_Vehicle_CivHeli) : GVAR(Vehicle_Heli_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_CivHeli;
        faction = QGVAR(Rebels);
		side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(vehiclesCivHeli);
    };
	class GVAR(Rebels_Vehicle_Plane) : GVAR(Vehicle_Plane_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_Plane;
        faction = QGVAR(Rebels);
		side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(vehiclesPlane);
    };
    class GVAR(Rebels_Vehicle_CivPlane) : GVAR(Rebels_Vehicle_Plane) {
        displayName = $STR_A3U_Zeus_VehicleType_CivPlane;
        GVAR(vehType) = QUOTE(vehiclesCivPlane);
    };
	class GVAR(Rebels_Vehicle_StaticMG) : GVAR(Vehicle_StaticMG_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_StaticMG;
        faction = QGVAR(Rebels);
		side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(staticMGs);
    };
    class GVAR(Rebels_Vehicle_StaticAT) : GVAR(Vehicle_StaticAT_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Rebels);
        side = 2;
        displayName = $STR_A3U_Zeus_VehicleType_StaticAT;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(staticAT);
    };
    class GVAR(Rebels_Vehicle_StaticAA) : GVAR(Vehicle_StaticAA_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Rebels);
        side = 2;
        displayName = $STR_A3U_Zeus_VehicleType_StaticAA;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(staticAA);
    };
	class GVAR(Rebels_Vehicle_Mortar) : GVAR(Vehicle_StaticMortar_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_Mortar;
        faction = QGVAR(Rebels);
		side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(staticMortars);
    };
