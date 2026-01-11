	// ---------- Invaders ---------- //
    class O_Soldier_base_F : SoldierWB {
        class EventHandlers;
    };
    class A3U_Invaders_Base : O_Soldier_base_F {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        displayName = "Invaders Base";
        faction = "A3U_Invaders";
        editorSubcategory = "EdSubcat_Personnel";
        icon = "iconMan";
        picture = "";
        role = "Rifleman";
        nameSound = "veh_infantry_s";
        textSingular = "infantry";
        textPlural = "infantry";
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
        GVAR(unitFaction) = QUOTE(inv);
        class EventHandlers {
            class ADDON {
                PostInit = QUOTE([ARR_4(_this#0,getText(configOf(_this#0) >> QQGVAR(unitFaction)),getText(configOf(_this#0) >> QQGVAR(unitPrefix)),getText(configOf(_this#0) >> QQGVAR(unitType)))] call A3U_fnc_zeus_unitInit);
            };
        };
    };
    class A3U_Invaders_Militia_Rifleman: A3U_Invaders_Base {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_UnitType_Rifleman;
        editorSubcategory = "A3U_Militia";
        role = "Rifleman";
        nameSound = "veh_infantry_s";
        textSingular = "infantry";
        textPlural = "infantry";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class A3U_Invaders_Militia_SquadLeader : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class A3U_Invaders_Militia_Radioman : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class A3U_Invaders_Militia_Medic : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Medic;
        attendant = 1;
        icon = "iconManMedic";
        picture = "pictureHeal";
        role = "CombatLifeSaver";
        nameSound = "veh_infantry_medic_s";
        textSingular = "medic";
        textPlural = "medics";
        GVAR(unitType) = QUOTE(Medic);
    };
    class A3U_Invaders_Militia_Engineer : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class A3U_Invaders_Militia_ExplosivesExpert : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class A3U_Invaders_Militia_Grenadier : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class A3U_Invaders_Militia_LAT : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class A3U_Invaders_Militia_AT : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        iconManAT = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class A3U_Invaders_Militia_AA : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class A3U_Invaders_Militia_MachineGunner : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class A3U_Invaders_Militia_Marksman : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class A3U_Invaders_Militia_Sniper : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class A3U_Invaders_Militia_PatrolSniper : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class A3U_Invaders_Militia_PatrolSpotter : A3U_Invaders_Militia_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class A3U_Invaders_Military_Rifleman : A3U_Invaders_Militia_Rifleman {
        editorSubcategory = "A3U_Military";
        GVAR(unitPrefix) = QUOTE(military);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class A3U_Invaders_Military_SquadLeader : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class A3U_Invaders_Military_Radioman : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class A3U_Invaders_Military_Medic : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Medic;
        attendant = 1;
        icon = "iconManMedic";
        picture = "pictureHeal";
        role = "CombatLifeSaver";
        nameSound = "veh_infantry_medic_s";
        textSingular = "medic";
        textPlural = "medics";
        GVAR(unitType) = QUOTE(Medic);
    };
    class A3U_Invaders_Military_Engineer : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class A3U_Invaders_Military_ExplosivesExpert : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class A3U_Invaders_Military_Grenadier : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class A3U_Invaders_Military_LAT : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class A3U_Invaders_Military_AT : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class A3U_Invaders_Military_AA : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class A3U_Invaders_Military_MachineGunner : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class A3U_Invaders_Military_Marksman : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class A3U_Invaders_Military_Sniper : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class A3U_Invaders_Military_PatrolSniper : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class A3U_Invaders_Military_PatrolSpotter : A3U_Invaders_Military_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class A3U_Invaders_Elite_Rifleman : A3U_Invaders_Militia_Rifleman {
        editorSubcategory = "A3U_Elite";
        GVAR(unitPrefix) = QUOTE(elite);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class A3U_Invaders_Elite_SquadLeader : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class A3U_Invaders_Elite_Radioman : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class A3U_Invaders_Elite_Medic : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Medic;
        attendant = 1;
        icon = "iconManMedic";
        picture = "pictureHeal";
        role = "CombatLifeSaver";
        nameSound = "veh_infantry_medic_s";
        textSingular = "medic";
        textPlural = "medics";
        GVAR(unitType) = QUOTE(Medic);
    };
    class A3U_Invaders_Elite_Engineer : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class A3U_Invaders_Elite_ExplosivesExpert : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class A3U_Invaders_Elite_Grenadier : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class A3U_Invaders_Elite_LAT : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class A3U_Invaders_Elite_AT : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class A3U_Invaders_Elite_AA : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class A3U_Invaders_Elite_MachineGunner : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class A3U_Invaders_Elite_Marksman : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class A3U_Invaders_Elite_Sniper : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class A3U_Invaders_Elite_PatrolSniper : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class A3U_Invaders_Elite_PatrolSpotter : A3U_Invaders_Elite_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class A3U_Invaders_SpecialForces_Rifleman : A3U_Invaders_Militia_Rifleman {
        editorSubcategory = "A3U_SpecialForces";
        nameSound = "veh_infantry_SF_s";
        textSingular = "specop";
        textPlural = "specops";
        GVAR(unitPrefix) = QUOTE(SF);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class A3U_Invaders_SpecialForces_SquadLeader : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class A3U_Invaders_SpecialForces_Radioman : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class A3U_Invaders_SpecialForces_Medic : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Medic;
        attendant = 1;
        icon = "iconManMedic";
        picture = "pictureHeal";
        role = "CombatLifeSaver";
        GVAR(unitType) = QUOTE(Medic);
    };
    class A3U_Invaders_SpecialForces_Engineer : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class A3U_Invaders_SpecialForces_ExplosivesExpert : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class A3U_Invaders_SpecialForces_Grenadier : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class A3U_Invaders_SpecialForces_LAT : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        GVAR(unitType) = QUOTE(LAT);
    };
    class A3U_Invaders_SpecialForces_AT : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        GVAR(unitType) = QUOTE(AT);
    };
    class A3U_Invaders_SpecialForces_AA : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class A3U_Invaders_SpecialForces_MachineGunner : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class A3U_Invaders_SpecialForces_Marksman : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class A3U_Invaders_SpecialForces_Sniper : A3U_Invaders_SpecialForces_Rifleman {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class A3U_Invaders_Police_Standard : A3U_Invaders_Militia_Rifleman {
        editorSubcategory = "A3U_Police";
        GVAR(unitPrefix) = QUOTE(police);
        GVAR(unitType) = QUOTE(Standard);
    };
    class A3U_Invaders_Police_SquadLeader : A3U_Invaders_Police_Standard {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class A3U_Invaders_Other_Crew : A3U_Invaders_Militia_Rifleman {
        editorSubcategory = "A3U_Other";
        displayName = $STR_A3U_Zeus_UnitType_Crew;
        role = "Crew";
        GVAR(unitPrefix) = QUOTE(other);
        GVAR(unitType) = QUOTE(Crew);
    };
    class A3U_Invaders_Other_Pilot : A3U_Invaders_Other_Crew {
        displayName = $STR_A3U_Zeus_UnitType_Pilot;
        role = "Pilot";
        nameSound = "veh_infantry_pilot_s";
        textSingular = "pilot";
        textPlural = "pilots";
        GVAR(unitType) = QUOTE(Pilot);
    };
    class A3U_Invaders_Other_Official : A3U_Invaders_Other_Crew {
        displayName = $STR_A3U_Zeus_UnitType_Official;
        icon = "iconManOfficer";
        role = "Officer";
        nameSound = "veh_infantry_officer_s";
        textSingular = "officer";
        textPlural = "officers";
        GVAR(unitType) = QUOTE(Official);
    };
    class A3U_Invaders_Other_Traitor : A3U_Invaders_Other_Crew {
        displayName = $STR_A3U_Zeus_UnitType_Traitor;
        role = "Rifleman";
        GVAR(unitType) = QUOTE(Traitor);
    };
    class A3U_Invaders_Other_Unarmed : A3U_Invaders_Other_Crew {
        displayName = $STR_A3U_Zeus_UnitType_Unarmed;
        role = "Unarmed";
        GVAR(unitType) = QUOTE(Unarmed);
    };

    // ------------ Invader Vehicles ------------ //
    class A3U_Invaders_Vehicle_Basic : A3U_Vehicle_Car_Base {
        scope = 2;
        scopeCurator = 2;
        //crew = "A3U_Invaders_Other_Crew";
        faction = "A3U_Invaders";
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_Basic;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesBasic);
    };
    class A3U_Invaders_Vehicle_LightUnarmed : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_LightUnarmed;
        GVAR(vehType) = QUOTE(vehiclesLightUnarmed);
    };
    class A3U_Invaders_Vehicle_MilitiaCar : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaCar;
        GVAR(vehType) = QUOTE(vehiclesMilitiaCars);
    };
    class A3U_Invaders_Vehicle_Police : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_Police;
        GVAR(vehType) = QUOTE(vehiclesPolice);
    };
    class A3U_Invaders_Vehicle_LightArmed : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_LightArmed;
        GVAR(vehType) = QUOTE(vehiclesLightArmed);
    };
    class A3U_Invaders_Vehicle_MilitiaLightArmed : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaLightArmed;
        GVAR(vehType) = QUOTE(vehiclesMilitiaLightArmed);
    };
    class A3U_Invaders_Vehicle_Truck : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_Truck;
        GVAR(vehType) = QUOTE(vehiclesTrucks);
    };
    class A3U_Invaders_Vehicle_CargoTruck : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_CargoTruck;
        GVAR(vehType) = QUOTE(vehiclesCargoTrucks);
    };
    class A3U_Invaders_Vehicle_AmmoTruck : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_AmmoTruck;
        GVAR(vehType) = QUOTE(vehiclesAmmoTrucks);
    };
    class A3U_Invaders_Vehicle_RepairTruck : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_RepairTruck;
        GVAR(vehType) = QUOTE(vehiclesRepairTrucks);
    };
    class A3U_Invaders_Vehicle_FuelTruck : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_FuelTruck;
        GVAR(vehType) = QUOTE(vehiclesFuelTrucks);
    };
    class A3U_Invaders_Vehicle_MilitiaTruck : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaTruck;
        GVAR(vehType) = QUOTE(vehiclesMilitiaTrucks);
    };
    class A3U_Invaders_Vehicle_Medical : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_Medical;
        GVAR(vehType) = QUOTE(vehiclesMedical);
    };
    class A3U_Invaders_Vehicle_AA : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_AA;
		editorSubcategory = "EdSubcat_AAs";
        GVAR(vehType) = QUOTE(vehiclesAA);
    };
    class A3U_Invaders_Vehicle_AT : A3U_Invaders_Vehicle_Basic {
        displayName = $STR_A3U_Zeus_VehicleType_AT;
        GVAR(vehType) = QUOTE(vehiclesAT);
    };
    class A3U_Invaders_Vehicle_APC : A3U_Vehicle_APC_Base {
        scope = 2;
        scopeCurator = 2;
        //crew = "A3U_Invaders_Other_Crew";
        faction = "A3U_Invaders";
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_APC;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesAPCs);
    }; 
    class A3U_Invaders_Vehicle_LightAPC : A3U_Invaders_Vehicle_APC {
        displayName = $STR_A3U_Zeus_VehicleType_LightAPC;
        GVAR(vehType) = QUOTE(vehiclesLightAPCs);
    };
    class A3U_Invaders_Vehicle_MilitiaAPC : A3U_Invaders_Vehicle_APC {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaAPC;
        GVAR(vehType) = QUOTE(vehiclesMilitiaAPCs);
    };
    class A3U_Invaders_Vehicle_IFV : A3U_Invaders_Vehicle_APC {
        displayName = $STR_A3U_Zeus_VehicleType_IFV;
        GVAR(vehType) = QUOTE(vehiclesIFVs);
    };
    class A3U_Invaders_Vehicle_Tank : A3U_Vehicle_Tank_Base {
        scope = 2;
        scopeCurator = 2;
        //crew = "A3U_Invaders_Other_Crew";
        faction = "A3U_Invaders";
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_Tank;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesTanks);
    };
    class A3U_Invaders_Vehicle_LightTank : A3U_Invaders_Vehicle_Tank {
        displayName = $STR_A3U_Zeus_VehicleType_LightTank;
        GVAR(vehType) = QUOTE(vehiclesLightTanks);
    };
    class A3U_Invaders_Vehicle_TransportBoat : A3U_Vehicle_Ship_Base {
        scope = 2;
        scopeCurator = 2;
        //crew = "A3U_Invaders_Other_Crew";
        faction = "A3U_Invaders";
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_TransportBoat;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesTransportBoats);
    }; 
    class A3U_Invaders_Vehicle_GunBoat : A3U_Invaders_Vehicle_TransportBoat {
        displayName = $STR_A3U_Zeus_VehicleType_GunBoat;
        GVAR(vehType) = QUOTE(vehiclesGunBoats);
    };
    class A3U_Invaders_Vehicle_LightHeli : A3U_Vehicle_Heli_Base {
        scope = 2;
        scopeCurator = 2;
        //crew = "A3U_Invaders_Other_Pilot";
        faction = "A3U_Invaders";
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_LightHeli;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesHelisLight);
    };
    class A3U_Invaders_Vehicle_LightAttackHeli : A3U_Invaders_Vehicle_LightHeli {
        displayName = $STR_A3U_Zeus_VehicleType_LightAttackHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisLightAttack);
    };
    class A3U_Invaders_Vehicle_AttackHeli : A3U_Invaders_Vehicle_LightHeli {
        displayName = $STR_A3U_Zeus_VehicleType_AttackHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisAttack);
    };
    class A3U_Invaders_Vehicle_TransportHeli : A3U_Invaders_Vehicle_LightHeli {
        displayName = $STR_A3U_Zeus_VehicleType_TransportHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisTransport);
    };
	class A3U_Invaders_Vehicle_CASPlane : A3U_Vehicle_Plane_Base {
        scope = 2;
        scopeCurator = 2;
        //crew = "A3U_Invaders_Other_Pilot";
        faction = "A3U_Invaders";
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_CASPlane;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesPlanesCAS);
    };
    class A3U_Invaders_Vehicle_AAPlane : A3U_Invaders_Vehicle_CASPlane {
        displayName = $STR_A3U_Zeus_VehicleType_AAPlane;
        GVAR(vehType) = QUOTE(vehiclesPlanesAA);
    };
    class A3U_Invaders_Vehicle_TransportPlane : A3U_Invaders_Vehicle_CASPlane {
        displayName = $STR_A3U_Zeus_VehicleType_TransportPlane;
        GVAR(vehType) = QUOTE(vehiclesPlanesTransport);
    };
    class A3U_Invaders_Vehicle_StaticMG : A3U_Vehicle_StaticWeapon_Base {
        scope = 2;
        scopeCurator = 2;
        //crew = "A3U_Invaders_Other_Crew";
        faction = "A3U_Invaders";
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_StaticMG;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(staticMGs);
    };
    class A3U_Invaders_Vehicle_StaticAT : A3U_Invaders_Vehicle_StaticMG {
        displayName = $STR_A3U_Zeus_VehicleType_StaticAT;
        GVAR(vehType) = QUOTE(staticAT);
    };
    class A3U_Invaders_Vehicle_StaticAA : A3U_Invaders_Vehicle_StaticMG {
        displayName = $STR_A3U_Zeus_VehicleType_StaticAA;
        GVAR(vehType) = QUOTE(staticAA);
    };
	class A3U_Invaders_Vehicle_Mortar : A3U_Vehicle_StaticMortar_Base {
        scope = 2;
        scopeCurator = 2;
        //crew = "A3U_Invaders_Other_Crew";
        faction = "A3U_Invaders";
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_Mortar;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(staticMortars);
    };
