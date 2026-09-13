	// ---------- Occupant Units ---------- //
    class B_Soldier_base_F : SoldierWB {
        class EventHandlers;
    };
    class GVAR(Occupants_Base) : B_Soldier_base_F {
        scope = 1;
        scopeCurator = 1;
        scopeArsenal = 1;
        faction = QGVAR(Occupants);
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
        GVAR(unitFaction) = QUOTE(occ);
        class EventHandlers {
            class ADDON {
                PostInit = UNIT_INIT_HANDLER;
            };
        };
    };
    class GVAR(Occupants_Militia_Rifleman) : GVAR(Occupants_Base) {
        scope = 2;
        scopeCurator = 2;
        editorSubcategory = QGVAR(Militia);
        role = "Rifleman";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Occupants_Militia_SquadLeader) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Occupants_Militia_Radioman) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class GVAR(Occupants_Militia_Medic) : GVAR(Occupants_Militia_Rifleman) {
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
    class GVAR(Occupants_Militia_Engineer) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Occupants_Militia_ExplosivesExpert) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Occupants_Militia_Grenadier) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Occupants_Militia_LAT) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Occupants_Militia_AT) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Occupants_Militia_AA) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Occupants_Militia_MachineGunner) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Occupants_Militia_Marksman) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Occupants_Militia_Sniper) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Occupants_Militia_PatrolSniper) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_S";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class GVAR(Occupants_Militia_PatrolSpotter) : GVAR(Occupants_Militia_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class GVAR(Occupants_Military_Rifleman) : GVAR(Occupants_Militia_Rifleman) {
        editorSubcategory = QGVAR(Military);
        GVAR(unitPrefix) = QUOTE(military);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Occupants_Military_SquadLeader) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Occupants_Military_Radioman) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class GVAR(Occupants_Military_Medic) : GVAR(Occupants_Military_Rifleman) {
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
    class GVAR(Occupants_Military_Engineer) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Occupants_Military_ExplosivesExpert) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Occupants_Military_Grenadier) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Occupants_Military_LAT) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Occupants_Military_AT) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Occupants_Military_AA) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Occupants_Military_MachineGunner) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Occupants_Military_Marksman) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Occupants_Military_Sniper) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Occupants_Military_PatrolSniper) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_S";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class GVAR(Occupants_Military_PatrolSpotter) : GVAR(Occupants_Military_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class GVAR(Occupants_Elite_Rifleman) : GVAR(Occupants_Militia_Rifleman) {
        editorSubcategory = QGVAR(Elite);
        GVAR(unitPrefix) = QUOTE(elite);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Occupants_Elite_SquadLeader) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Occupants_Elite_Radioman) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class GVAR(Occupants_Elite_Medic) : GVAR(Occupants_Elite_Rifleman) {
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
    class GVAR(Occupants_Elite_Engineer) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Occupants_Elite_ExplosivesExpert) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Occupants_Elite_Grenadier) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Occupants_Elite_LAT) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Occupants_Elite_AT) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Occupants_Elite_AA) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Occupants_Elite_MachineGunner) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Occupants_Elite_Marksman) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Occupants_Elite_Sniper) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Occupants_Elite_PatrolSniper) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSniper;
        role = "Sniper";
        nameSound = "veh_infantry_sniper_S";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(PatrolSniper);
    };
    class GVAR(Occupants_Elite_PatrolSpotter) : GVAR(Occupants_Elite_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_PSpotter;
        role = "Spotter";
        GVAR(unitType) = QUOTE(PatrolSpotter);
    };
    class GVAR(Occupants_SpecialForces_Rifleman) : GVAR(Occupants_Militia_Rifleman) {
        editorSubcategory = QGVAR(SpecialForces);
        nameSound = "veh_infantry_SF_s";
        textSingular = "specop";
        textPlural = "specops";
        GVAR(unitPrefix) = QUOTE(SF);
        GVAR(unitType) = QUOTE(Rifleman);
    };
    class GVAR(Occupants_SpecialForces_SquadLeader) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Occupants_SpecialForces_Radioman) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Radioman;
        role = "RadioOperator";
        GVAR(unitType) = QUOTE(Radioman);
    };
    class GVAR(Occupants_SpecialForces_Medic) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Medic;
        attendant = 1;
        icon = "iconManMedic";
        picture = "pictureHeal";
        role = "CombatLifeSaver";
        GVAR(unitType) = QUOTE(Medic);
    };
    class GVAR(Occupants_SpecialForces_Engineer) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Engineer;
        canDeactivateMines = 1;
        engineer = 1;
        icon = "iconManEngineer";
        picture = "pictureRepair";
        role = "Sapper";
        GVAR(unitType) = QUOTE(Engineer);
    };
    class GVAR(Occupants_SpecialForces_ExplosivesExpert) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Occupants_SpecialForces_Grenadier) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Grenadier;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Grenadier);
    };
    class GVAR(Occupants_SpecialForces_LAT) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_LAT;
        icon = "iconManAT";
        role = "MissileSpecialist";
        GVAR(unitType) = QUOTE(LAT);
    };
    class GVAR(Occupants_SpecialForces_AT) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        GVAR(unitType) = QUOTE(AT);
    };
    class GVAR(Occupants_SpecialForces_AA) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(AA);
    };
    class GVAR(Occupants_SpecialForces_MachineGunner) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_MachineGunner;
        icon = "iconManMG";
        role = "MachineGunner";
        GVAR(unitType) = QUOTE(MachineGunner);
    };
    class GVAR(Occupants_SpecialForces_Marksman) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        GVAR(unitType) = QUOTE(Marksman);
    };
    class GVAR(Occupants_SpecialForces_Sniper) : GVAR(Occupants_SpecialForces_Rifleman) {
        displayName = $STR_A3U_Zeus_UnitType_Sniper;
        role = "Sniper";
        GVAR(unitType) = QUOTE(Sniper);
    };
    class GVAR(Occupants_Police_Standard) : GVAR(Occupants_Militia_Rifleman) {
        editorSubcategory = QGVAR(Police);
        GVAR(unitPrefix) = QUOTE(police);
        GVAR(unitType) = QUOTE(Standard);
    };
    class GVAR(Occupants_Police_SquadLeader) : GVAR(Occupants_Police_Standard) {
        displayName = $STR_A3U_Zeus_UnitType_SquadLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(SquadLeader);
    };
    class GVAR(Occupants_Other_Crew) : GVAR(Occupants_Militia_Rifleman) {
        editorSubcategory = QGVAR(Other);
        displayName = $STR_A3U_Zeus_UnitType_Crew;
        role = "Crew";
        GVAR(unitPrefix) = QUOTE(other);
        GVAR(unitType) = QUOTE(Crew);
    };
    class GVAR(Occupants_Other_Pilot) : GVAR(Occupants_Other_Crew) {
        displayName = $STR_A3U_Zeus_UnitType_Pilot;
        role = "Pilot";
        nameSound = "veh_infantry_pilot_s";
        textSingular = "pilot";
        textPlural = "pilots";
        GVAR(unitType) = QUOTE(Pilot);
    };
    class GVAR(Occupants_Other_Official) : GVAR(Occupants_Other_Crew) {
        displayName = $STR_A3U_Zeus_UnitType_Official;
        icon = "iconManOfficer";
        role = "Officer";
        nameSound = "veh_infantry_officer_s";
        textSingular = "officer";
        textPlural = "officers";
        GVAR(unitType) = QUOTE(Official);
    };
    class GVAR(Occupants_Other_Traitor) : GVAR(Occupants_Other_Crew) {
        displayName = $STR_A3U_Zeus_UnitType_Traitor;
        role = "Rifleman";
        GVAR(unitType) = QUOTE(Traitor);
    };
    class GVAR(Occupants_Other_Unarmed) : GVAR(Occupants_Other_Crew) {
        displayName = $STR_A3U_Zeus_UnitType_Unarmed;
        role = "Unarmed";
        GVAR(unitType) = QUOTE(Unarmed);
    };

    // ------------ Occupant Vehicles ------------ //
    class GVAR(Occupants_Vehicle_Basic) : GVAR(Vehicle_Car_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_Basic;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(vehiclesBasic);
    };
    class GVAR(Occupants_Vehicle_LightUnarmed) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_LightUnarmed;
        GVAR(vehType) = QUOTE(vehiclesLightUnarmed);
    };
    class GVAR(Occupants_Vehicle_MilitiaCar) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaCar;
        GVAR(vehType) = QUOTE(vehiclesMilitiaCars);
    };
    class GVAR(Occupants_Vehicle_Police) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_Police;
        GVAR(vehType) = QUOTE(vehiclesPolice);
    };
    class GVAR(Occupants_Vehicle_LightArmed) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_LightArmed;
        GVAR(vehType) = QUOTE(vehiclesLightArmed);
    };
    class GVAR(Occupants_Vehicle_MilitiaLightArmed) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaLightArmed;
        GVAR(vehType) = QUOTE(vehiclesMilitiaLightArmed);
    };
    class GVAR(Occupants_Vehicle_Truck) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_Truck;
        GVAR(vehType) = QUOTE(vehiclesTrucks);
    };
    class GVAR(Occupants_Vehicle_CargoTruck) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_CargoTruck;
        GVAR(vehType) = QUOTE(vehiclesCargoTrucks);
    };
    class GVAR(Occupants_Vehicle_AmmoTruck) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_AmmoTruck;
        GVAR(vehType) = QUOTE(vehiclesAmmoTrucks);
    };
    class GVAR(Occupants_Vehicle_RepairTruck) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_RepairTruck;
        GVAR(vehType) = QUOTE(vehiclesRepairTrucks);
    };
    class GVAR(Occupants_Vehicle_FuelTruck) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_FuelTruck;
        GVAR(vehType) = QUOTE(vehiclesFuelTrucks);
    };
    class GVAR(Occupants_Vehicle_MilitiaTruck) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaTruck;
        GVAR(vehType) = QUOTE(vehiclesMilitiaTrucks);
    };
    class GVAR(Occupants_Vehicle_Medical) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_Medical;
        GVAR(vehType) = QUOTE(vehiclesMedical);
    };
    class GVAR(Occupants_Vehicle_AA) : GVAR(Occupants_Vehicle_Basic) {
        displayName = $STR_A3U_Zeus_VehicleType_AA;
		editorSubcategory = "EdSubcat_AAs";
        GVAR(vehType) = QUOTE(vehiclesAA);
    };
    class GVAR(Occupants_Vehicle_APC) : GVAR(Vehicle_APC_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_APC;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(vehiclesAPCs);
    }; 
    class GVAR(Occupants_Vehicle_LightAPC) : GVAR(Occupants_Vehicle_APC) {
        displayName = $STR_A3U_Zeus_VehicleType_LightAPC;
        GVAR(vehType) = QUOTE(vehiclesLightAPCs);
    };
    class GVAR(Occupants_Vehicle_MilitiaAPC) : GVAR(Occupants_Vehicle_APC) {
        displayName = $STR_A3U_Zeus_VehicleType_MilitiaAPC;
        GVAR(vehType) = QUOTE(vehiclesMilitiaAPCs);
    };
    class GVAR(Occupants_Vehicle_IFV) : GVAR(Occupants_Vehicle_APC) {
        displayName = $STR_A3U_Zeus_VehicleType_IFV;
        GVAR(vehType) = QUOTE(vehiclesIFVs);
    };
    class GVAR(Occupants_Vehicle_Tank) : GVAR(Vehicle_Tank_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_Tank;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(vehiclesTanks);
    };
    class GVAR(Occupants_Vehicle_LightTank) : GVAR(Occupants_Vehicle_Tank) {
        displayName = $STR_A3U_Zeus_VehicleType_LightTank;
        GVAR(vehType) = QUOTE(vehiclesLightTanks);
    };
    class GVAR(Occupants_Vehicle_TransportBoat) : GVAR(Vehicle_Ship_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_TransportBoat;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(vehiclesTransportBoats);
    }; 
    class GVAR(Occupants_Vehicle_GunBoat) : GVAR(Occupants_Vehicle_TransportBoat) {
        displayName = $STR_A3U_Zeus_VehicleType_GunBoat;
        GVAR(vehType) = QUOTE(vehiclesGunBoats);
    };
    class GVAR(Occupants_Vehicle_LightHeli) : GVAR(Vehicle_Heli_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_LightHeli;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(vehiclesHelisLight);
    };
    class GVAR(Occupants_Vehicle_LightAttackHeli) : GVAR(Occupants_Vehicle_LightHeli) {
        displayName = $STR_A3U_Zeus_VehicleType_LightAttackHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisLightAttack);
    };
    class GVAR(Occupants_Vehicle_AttackHeli) : GVAR(Occupants_Vehicle_LightHeli) {
        displayName = $STR_A3U_Zeus_VehicleType_AttackHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisAttack);
    };
    class GVAR(Occupants_Vehicle_TransportHeli) : GVAR(Occupants_Vehicle_LightHeli) {
        displayName = $STR_A3U_Zeus_VehicleType_TransportHeli;
        GVAR(vehType) = QUOTE(vehiclesHelisTransport);
    };
	class GVAR(Occupants_Vehicle_CASPlane) : GVAR(Vehicle_Plane_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_CASPlane;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(vehiclesPlanesCAS);
    };
    class GVAR(Occupants_Vehicle_AAPlane) : GVAR(Occupants_Vehicle_CASPlane) {
        displayName = $STR_A3U_Zeus_VehicleType_AAPlane;
        GVAR(vehType) = QUOTE(vehiclesPlanesAA);
    };
    class GVAR(Occupants_Vehicle_TransportPlane) : GVAR(Occupants_Vehicle_CASPlane) {
        displayName = $STR_A3U_Zeus_VehicleType_TransportPlane;
        GVAR(vehType) = QUOTE(vehiclesPlanesTransport);
    };
    class GVAR(Occupants_Vehicle_StaticMG) : GVAR(Vehicle_StaticMG_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_StaticMG;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(staticMGs);
    };
    class GVAR(Occupants_Vehicle_StaticAT) : GVAR(Vehicle_StaticAT_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_StaticAT;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(staticAT);
    };
    class GVAR(Occupants_Vehicle_StaticAA) : GVAR(Vehicle_StaticAA_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_StaticAA;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(staticAA);
    };
	class GVAR(Occupants_Vehicle_Mortar) : GVAR(Vehicle_StaticMortar_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Occupants);
        side = 1;
        displayName = $STR_A3U_Zeus_VehicleType_Mortar;
        GVAR(vehFaction) = QUOTE(occ);
        GVAR(vehType) = QUOTE(staticMortars);
    };
