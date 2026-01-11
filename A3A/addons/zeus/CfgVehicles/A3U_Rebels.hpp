    // ------------ Rebel Units ------------ //
    class I_Soldier_base_F : SoldierWB {
        class EventHandlers;
    };
    class A3U_Rebels_Base: I_Soldier_base_F {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        faction = "A3U_Rebels";
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
    class A3U_Rebels_Rifleman: A3U_Rebels_Base {
        scope = 2;
        scopeCurator = 2;
        editorSubcategory = "A3U_Militia";
        displayName = $STR_A3U_Zeus_UnitType_Rifleman;
        role = "Rifleman";
        nameSound = "veh_infantry_s";
        textSingular = "infantry";
        textPlural = "infantry";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class A3U_Rebels_SquadLeader : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
		icon = "iconManLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class A3U_Rebels_staticCrew : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_SCrew;
        role = "Crewman";
        GVAR(unitType) = QUOTE(staticCrew);
    };
    class A3U_Rebels_Medic : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Medic;
		attendant = 1;
		icon = "iconManMedic";
		picture = "pictureHeal";
        role = "CombatLifeSaver";
        GVAR(unitType) = QUOTE(Medic);
    };
    class A3U_Rebels_Engineer : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
		canDeactivateMines = 1;
		engineer = 1;
		icon = "iconManEngineer";
		picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class A3U_Rebels_ExplosivesExpert : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
		canDeactivateMines = 1;
		icon = "iconManExplosive";
		picture = "pictureExplosive";
        role = "Sapper";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class A3U_Rebels_Grenadier : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class A3U_Rebels_LAT : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
		icon = "iconManAT";
        GVAR(unitType) = QUOTE(LAT);
    };
    class A3U_Rebels_AT : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
		icon = "iconManAT";
        role = "MissileSpecialist";
        GVAR(unitType) = QUOTE(AT);
    };
    class A3U_Rebels_AA : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
		role = "MissileSpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class A3U_Rebels_MachineGunner : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
		icon = "iconManMG";
        role = "MachineGunner";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class A3U_Rebels_Marksman : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class A3U_Rebels_Sniper : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class A3U_Rebels_Unarmed : A3U_Rebels_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Unarmed;
        role = "Unarmed";
        GVAR(unitType) = QUOTE(Unarmed);
    };

	// ------------ Rebel Vehicles ------------ //
    class A3U_Rebels_Vehicle_Basic : A3U_Vehicle_Car_Base {
        scope = 2;
        scopeCurator = 2;
		//crew = "A3U_Rebels_staticCrew";
        faction = "A3U_Rebels";
        side = 2;
        displayName = $STR_A3U_Zeus_VehicleType_Basic;
		GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(vehiclesBasic);
    };
    class A3U_Rebels_Vehicle_LightUnarmed : A3U_Rebels_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_LightUnarmed;
        GVAR(vehType) = QUOTE(vehiclesLightUnarmed);
    };
    class A3U_Rebels_Vehicle_LightArmed : A3U_Rebels_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_LightArmed;
        GVAR(vehType) = QUOTE(vehiclesLightArmed);
    };
    class A3U_Rebels_Vehicle_Truck : A3U_Rebels_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_Truck;
        GVAR(vehType) = QUOTE(vehiclesTruck);
    };
    class A3U_Rebels_Vehicle_AA : A3U_Rebels_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_AA;
		editorSubcategory = "EdSubcat_AAs";
        GVAR(vehType) = QUOTE(vehiclesAA);
    };
    class A3U_Rebels_Vehicle_AT : A3U_Rebels_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_AT;
        GVAR(vehType) = QUOTE(vehiclesAT);
    };
    class A3U_Rebels_Vehicle_CivCar : A3U_Rebels_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_CivCar;
        GVAR(vehType) = QUOTE(vehiclesCivCar);
    };
    class A3U_Rebels_Vehicle_CivTruck : A3U_Rebels_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_CivTruck;
        GVAR(vehType) = QUOTE(vehiclesCivTruck);
    };
	class A3U_Rebels_Vehicle_Boat : A3U_Vehicle_Ship_Base {
        scope = 2;
        scopeCurator = 2;
		//crew = "A3U_Rebels_staticCrew";
        displayName = $STR_A3U_Zeus_VehicleType_Boat;
        faction = "A3U_Rebels";
        side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(vehiclesBoat);
    };
    class A3U_Rebels_Vehicle_CivBoat : A3U_Rebels_Vehicle_Boat {
        displayName = $STR_A3U_Zeus_VehicleType_CivBoat;
        GVAR(vehType) = QUOTE(vehiclesCivBoat);
    };
	class A3U_Rebels_Vehicle_CivHeli : A3U_Vehicle_Heli_Base {
        scope = 2;
        scopeCurator = 2;
		//crew = "A3U_Rebels_staticCrew";
        displayName = $STR_A3U_Zeus_VehicleType_CivHeli;
        faction = "A3U_Rebels";
		side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(vehiclesCivHeli);
    };
	class A3U_Rebels_Vehicle_Plane : A3U_Vehicle_Plane_Base {
        scope = 2;
        scopeCurator = 2;
		//crew = "A3U_Rebels_staticCrew";
        displayName = $STR_A3U_Zeus_VehicleType_Plane;
        faction = "A3U_Rebels";
		side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(vehiclesPlane);
    };
    class A3U_Rebels_Vehicle_CivPlane : A3U_Rebels_Vehicle_Plane {
        displayName = $STR_A3U_Zeus_VehicleType_CivPlane;
        GVAR(vehType) = QUOTE(vehiclesCivPlane);
    };
	class A3U_Rebels_Vehicle_StaticMG : A3U_Vehicle_StaticWeapon_Base {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_StaticMG;
		//crew = "A3U_Rebels_staticCrew";
        faction = "A3U_Rebels";
		side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(staticMGs);
    };
    class A3U_Rebels_Vehicle_StaticAT : A3U_Rebels_Vehicle_StaticMG {
        displayName = $STR_A3U_Zeus_VehicleType_StaticAT;
        GVAR(vehType) = QUOTE(staticAT);
    };
    class A3U_Rebels_Vehicle_StaticAA : A3U_Rebels_Vehicle_StaticMG {
        displayName = $STR_A3U_Zeus_VehicleType_StaticAA;
        GVAR(vehType) = QUOTE(staticAA);
    };
	class A3U_Rebels_Vehicle_Mortar : A3U_Vehicle_StaticMortar_Base {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_Mortar;
		//crew = "A3U_Rebels_staticCrew";
        faction = "A3U_Rebels";
		side = 2;
        GVAR(vehFaction) = QUOTE(reb);
        GVAR(vehType) = QUOTE(staticMortars);
    };
