	// ---------- Invaders ---------- //
    class O_Soldier_base_F : SoldierWB {
        class EventHandlers;
    };
    class GVAR(Invaders_Base) : O_Soldier_base_F {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        displayName = "Invaders Base";
        faction = QGVAR(Invaders);
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
                PostInit = UNIT_INIT_HANDLER;
            };
        };
    };
    class GVAR(Invaders_Militia_Rifleman) : GVAR(Invaders_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_UnitType_Rifleman;
        editorSubcategory = QGVAR(Militia);
        role = "Rifleman";
        nameSound = "veh_infantry_s";
        textSingular = "infantry";
        textPlural = "infantry";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Invaders_Militia_SquadLeader) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Invaders_Militia_Radioman) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class GVAR(Invaders_Militia_Medic) : GVAR(Invaders_Militia_Rifleman) {
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
    class GVAR(Invaders_Militia_Engineer) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Invaders_Militia_ExplosivesExpert) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Invaders_Militia_Grenadier) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Invaders_Militia_LAT) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Invaders_Militia_AT) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        iconManAT = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Invaders_Militia_AA) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Invaders_Militia_MachineGunner) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Invaders_Militia_Marksman) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Invaders_Militia_Sniper) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Invaders_Militia_PatrolSniper) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class GVAR(Invaders_Militia_PatrolSpotter) : GVAR(Invaders_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class GVAR(Invaders_Military_Rifleman) : GVAR(Invaders_Militia_Rifleman) {
        editorSubcategory = QGVAR(Military);
        GVAR(unitPrefix) = QUOTE(military);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Invaders_Military_SquadLeader) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Invaders_Military_Radioman) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class GVAR(Invaders_Military_Medic) : GVAR(Invaders_Military_Rifleman) {
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
    class GVAR(Invaders_Military_Engineer) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Invaders_Military_ExplosivesExpert) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Invaders_Military_Grenadier) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Invaders_Military_LAT) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Invaders_Military_AT) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Invaders_Military_AA) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Invaders_Military_MachineGunner) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Invaders_Military_Marksman) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Invaders_Military_Sniper) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Invaders_Military_PatrolSniper) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class GVAR(Invaders_Military_PatrolSpotter) : GVAR(Invaders_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class GVAR(Invaders_Elite_Rifleman) : GVAR(Invaders_Militia_Rifleman) {
        editorSubcategory = QGVAR(Elite);
        GVAR(unitPrefix) = QUOTE(elite);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Invaders_Elite_SquadLeader) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Invaders_Elite_Radioman) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class GVAR(Invaders_Elite_Medic) : GVAR(Invaders_Elite_Rifleman) {
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
    class GVAR(Invaders_Elite_Engineer) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Invaders_Elite_ExplosivesExpert) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Invaders_Elite_Grenadier) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Invaders_Elite_LAT) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Invaders_Elite_AT) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Invaders_Elite_AA) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Invaders_Elite_MachineGunner) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Invaders_Elite_Marksman) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Invaders_Elite_Sniper) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Invaders_Elite_PatrolSniper) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class GVAR(Invaders_Elite_PatrolSpotter) : GVAR(Invaders_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class GVAR(Invaders_SpecialForces_Rifleman) : GVAR(Invaders_Militia_Rifleman) {
        editorSubcategory = QGVAR(SpecialForces);
        nameSound = "veh_infantry_SF_s";
        textSingular = "specop";
        textPlural = "specops";
        GVAR(unitPrefix) = QUOTE(SF);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Invaders_SpecialForces_SquadLeader) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Invaders_SpecialForces_Radioman) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class GVAR(Invaders_SpecialForces_Medic) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Medic;
        attendant = 1;
        icon = "iconManMedic";
        picture = "pictureHeal";
        role = "CombatLifeSaver";
        GVAR(unitType) = QUOTE(Medic);
    };
    class GVAR(Invaders_SpecialForces_Engineer) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Invaders_SpecialForces_ExplosivesExpert) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Invaders_SpecialForces_Grenadier) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Invaders_SpecialForces_LAT) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Invaders_SpecialForces_AT) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Invaders_SpecialForces_AA) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Invaders_SpecialForces_MachineGunner) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Invaders_SpecialForces_Marksman) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Invaders_SpecialForces_Sniper) : GVAR(Invaders_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Invaders_Police_Standard) : GVAR(Invaders_Militia_Rifleman) {
        editorSubcategory = QGVAR(Police);
        GVAR(unitPrefix) = QUOTE(police);
        GVAR(unitType) = QUOTE(Standard);
    };
    class GVAR(Invaders_Police_SquadLeader) : GVAR(Invaders_Police_Standard) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Invaders_Other_Crew) : GVAR(Invaders_Militia_Rifleman) {
        editorSubcategory = QGVAR(Other);
        displayName = $STR_A3U_Zeus_UnitType_Crew;
        role = "Crew";
        GVAR(unitPrefix) = QUOTE(other);
        GVAR(unitType) = QUOTE(Crew);
    };
    class GVAR(Invaders_Other_Pilot) : GVAR(Invaders_Other_Crew) {
        displayName = $STR_A3U_Zeus_UnitType_Pilot;
        role = "Pilot";
        nameSound = "veh_infantry_pilot_s";
        textSingular = "pilot";
        textPlural = "pilots";
        GVAR(unitType) = QUOTE(Pilot);
    };
    class GVAR(Invaders_Other_Official) : GVAR(Invaders_Other_Crew) {
        displayName = $STR_A3U_Zeus_UnitType_Official;
        icon = "iconManOfficer";
        role = "Officer";
        nameSound = "veh_infantry_officer_s";
        textSingular = "officer";
        textPlural = "officers";
        GVAR(unitType) = QUOTE(Official);
    };
    class GVAR(Invaders_Other_Traitor) : GVAR(Invaders_Other_Crew) {
        displayName = $STR_A3U_Zeus_UnitType_Traitor;
        role = "Rifleman";
        GVAR(unitType) = QUOTE(Traitor);
    };
    class GVAR(Invaders_Other_Unarmed) : GVAR(Invaders_Other_Crew) {
        displayName = $STR_A3U_Zeus_UnitType_Unarmed;
        role = "Unarmed";
        GVAR(unitType) = QUOTE(Unarmed);
    };

    // ------------ Invader Vehicles ------------ //
    class GVAR(Invaders_Vehicle_Basic) : GVAR(Vehicle_Car_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_Basic;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesBasic);
    };
    class GVAR(Invaders_Vehicle_LightUnarmed) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_LightUnarmed;
        GVAR(vehType) = QUOTE(vehiclesLightUnarmed);
    };
    class GVAR(Invaders_Vehicle_MilitiaCar) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaCar;
        GVAR(vehType) = QUOTE(vehiclesMilitiaCars);
    };
    class GVAR(Invaders_Vehicle_Police) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_Police;
        GVAR(vehType) = QUOTE(vehiclesPolice);
    };
    class GVAR(Invaders_Vehicle_LightArmed) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_LightArmed;
        GVAR(vehType) = QUOTE(vehiclesLightArmed);
    };
    class GVAR(Invaders_Vehicle_MilitiaLightArmed) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaLightArmed;
        GVAR(vehType) = QUOTE(vehiclesMilitiaLightArmed);
    };
    class GVAR(Invaders_Vehicle_Truck) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_Truck;
        GVAR(vehType) = QUOTE(vehiclesTrucks);
    };
    class GVAR(Invaders_Vehicle_CargoTruck) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_CargoTruck;
        GVAR(vehType) = QUOTE(vehiclesCargoTrucks);
    };
    class GVAR(Invaders_Vehicle_AmmoTruck) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_AmmoTruck;
        GVAR(vehType) = QUOTE(vehiclesAmmoTrucks);
    };
    class GVAR(Invaders_Vehicle_RepairTruck) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_RepairTruck;
        GVAR(vehType) = QUOTE(vehiclesRepairTrucks);
    };
    class GVAR(Invaders_Vehicle_FuelTruck) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_FuelTruck;
        GVAR(vehType) = QUOTE(vehiclesFuelTrucks);
    };
    class GVAR(Invaders_Vehicle_MilitiaTruck) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaTruck;
        GVAR(vehType) = QUOTE(vehiclesMilitiaTrucks);
    };
    class GVAR(Invaders_Vehicle_Medical) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_Medical;
        GVAR(vehType) = QUOTE(vehiclesMedical);
    };
    class GVAR(Invaders_Vehicle_AA) : GVAR(Invaders_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_AA;
		editorSubcategory = "EdSubcat_AAs";
        GVAR(vehType) = QUOTE(vehiclesAA);
    };
    class GVAR(Invaders_Vehicle_APC) : GVAR(Vehicle_APC_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_APC;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesAPCs);
    }; 
    class GVAR(Invaders_Vehicle_LightAPC) : GVAR(Invaders_Vehicle_APC) {
        displayName = $STR_A3U_Zeus_VehicleType_LightAPC;
        GVAR(vehType) = QUOTE(vehiclesLightAPCs);
    };
    class GVAR(Invaders_Vehicle_MilitiaAPC) : GVAR(Invaders_Vehicle_APC) {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaAPC;
        GVAR(vehType) = QUOTE(vehiclesMilitiaAPCs);
    };
    class GVAR(Invaders_Vehicle_IFV) : GVAR(Invaders_Vehicle_APC) {
        displayName = $STR_A3U_Zeus_VehicleType_IFV;
        GVAR(vehType) = QUOTE(vehiclesIFVs);
    };
    class GVAR(Invaders_Vehicle_Tank) : GVAR(Vehicle_Tank_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_Tank;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesTanks);
    };
    class GVAR(Invaders_Vehicle_LightTank) : GVAR(Invaders_Vehicle_Tank) {
        displayName = $STR_A3U_Zeus_VehicleType_LightTank;
        GVAR(vehType) = QUOTE(vehiclesLightTanks);
    };
    class GVAR(Invaders_Vehicle_TransportBoat) : GVAR(Vehicle_Ship_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_TransportBoat;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesTransportBoats);
    }; 
    class GVAR(Invaders_Vehicle_GunBoat) : GVAR(Invaders_Vehicle_TransportBoat) {
        displayName = $STR_A3U_Zeus_VehicleType_GunBoat;
        GVAR(vehType) = QUOTE(vehiclesGunBoats);
    };
    class GVAR(Invaders_Vehicle_LightHeli) : GVAR(Vehicle_Heli_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_LightHeli;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesHelisLight);
    };
    class GVAR(Invaders_Vehicle_LightAttackHeli) : GVAR(Invaders_Vehicle_LightHeli) {
        displayName = $STR_A3U_Zeus_VehicleType_LightAttackHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisLightAttack);
    };
    class GVAR(Invaders_Vehicle_AttackHeli) : GVAR(Invaders_Vehicle_LightHeli) {
        displayName = $STR_A3U_Zeus_VehicleType_AttackHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisAttack);
    };
    class GVAR(Invaders_Vehicle_TransportHeli) : GVAR(Invaders_Vehicle_LightHeli) {
        displayName = $STR_A3U_Zeus_VehicleType_TransportHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisTransport);
    };
	class GVAR(Invaders_Vehicle_CASPlane) : GVAR(Vehicle_Plane_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_CASPlane;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(vehiclesPlanesCAS);
    };
    class GVAR(Invaders_Vehicle_AAPlane) : GVAR(Invaders_Vehicle_CASPlane) {
        displayName = $STR_A3U_Zeus_VehicleType_AAPlane;
        GVAR(vehType) = QUOTE(vehiclesPlanesAA);
    };
    class GVAR(Invaders_Vehicle_TransportPlane) : GVAR(Invaders_Vehicle_CASPlane) {
        displayName = $STR_A3U_Zeus_VehicleType_TransportPlane;
        GVAR(vehType) = QUOTE(vehiclesPlanesTransport);
    };
    class GVAR(Invaders_Vehicle_StaticMG) : GVAR(Vehicle_StaticMG_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_StaticMG;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(staticMGs);
    };
    class GVAR(Invaders_Vehicle_StaticAT) : GVAR(Vehicle_StaticAT_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_StaticAT;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(staticAT);
    };
    class GVAR(Invaders_Vehicle_StaticAA) : GVAR(Vehicle_StaticAA_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_StaticAA;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(staticAA);
    };
	class GVAR(Invaders_Vehicle_Mortar) : GVAR(Vehicle_StaticMortar_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Invaders);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_Mortar;
        GVAR(vehFaction) = QUOTE(inv);
        GVAR(vehType) = QUOTE(staticMortars);
    };
