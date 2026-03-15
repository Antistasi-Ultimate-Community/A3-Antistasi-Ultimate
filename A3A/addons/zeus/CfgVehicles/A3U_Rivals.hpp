	// ------------ Rival Units ------------ //
    class GVAR(Rivals_Base) : GVAR(Invaders_Base) {
        displayName = "Rivals Base";
        faction = QGVAR(Rivals);
        GVAR(unitFaction) = QUOTE(riv);
        class EventHandlers {
            class ADDON {
                PostInit = UNIT_INIT_HANDLER;
            };
        };
    };
    class GVAR(Rivals_Partisan) : GVAR(Rivals_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_UnitType_Partisan;
        editorSubcategory = QGVAR(Militia);
        role = "Rifleman";
        nameSound = "veh_infantry_s";
        textSingular = "infantry";
        textPlural = "infantry";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Partisan);
    };
    class GVAR(Rivals_Mercenary) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Mercenary;
        GVAR(unitType) = QUOTE(Mercenary);
    };
    class GVAR(Rivals_Minuteman) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Minuteman;
        GVAR(unitType) = QUOTE(Minuteman);
    };
    class GVAR(Rivals_Enforcer) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Enforcer;
        GVAR(unitType) = QUOTE(Enforcer);
    };
    class GVAR(Rivals_CellLeader) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_CellLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(CellLeader);
    };
    class GVAR(Rivals_Commander) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Commander;
        icon = "iconManOfficer";
        role = "SquadLeader";
        nameSound = "veh_infantry_officer_s";
        textSingular = "officer";
        textPlural = "officers";
        GVAR(unitType) = QUOTE(Commander);
    };
    class GVAR(Rivals_Medic) : GVAR(Rivals_Partisan) {
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
    class GVAR(Rivals_ExplosivesExpert) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class GVAR(Rivals_Saboteur) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Saboteur;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Saboteur);
    };
    class GVAR(Rivals_SpecialistAT) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(SpecialistAT);
    };
    class GVAR(Rivals_SpecialistAA) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(SpecialistAA);
    };
    class GVAR(Rivals_Oppressor) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Oppressor;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(Oppressor);
    };
    class GVAR(Rivals_Sharpshooter) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Marksman;
        role = "Marksman";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sharpshooter);
    };
    class GVAR(Rivals_Crew) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Crew;
        role = "Crew";
        GVAR(unitType) = QUOTE(Crew);
    };
    class GVAR(Rivals_Pilot) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Pilot;
        role = "Pilot";
        nameSound = "veh_infantry_pilot_s";
        textSingular = "pilot";
        textPlural = "pilots";
        GVAR(unitType) = QUOTE(Pilot);
    };
    class GVAR(Rivals_Unarmed) : GVAR(Rivals_Partisan) {
        displayName = $STR_A3U_Zeus_UnitType_Unarmed;
        role = "Unarmed";
        GVAR(unitType) = QUOTE(Unarmed);
    };

    // ------------ Rival Vehicles ------------ //
    class GVAR(Rivals_Vehicle_LightUnarmed) : GVAR(Vehicle_Car_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Rivals);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_LightUnarmed;
        GVAR(vehFaction) = QUOTE(riv);
        GVAR(vehType) = QUOTE(vehiclesRivalsCars);
    };
    class GVAR(Rivals_Vehicle_LightArmed) : GVAR(Rivals_Vehicle_LightUnarmed) {
        displayName = $STR_A3U_Zeus_VehicleType_LightArmed;
        GVAR(vehType) = QUOTE(vehiclesRivalsLightArmed);
    };
    class GVAR(Rivals_Vehicle_Truck) : GVAR(Rivals_Vehicle_LightUnarmed) {
        displayName = $STR_A3U_Zeus_VehicleType_Truck;
        GVAR(vehType) = QUOTE(vehiclesRivalsTrucks);
    };
    class GVAR(Rivals_Vehicle_APC) : GVAR(Vehicle_APC_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Rivals);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_APC;
        GVAR(vehFaction) = QUOTE(riv);
        GVAR(vehType) = QUOTE(vehiclesRivalsAPCs);
    };
    class GVAR(Rivals_Vehicle_Tank) : GVAR(Vehicle_Tank_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Rivals);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_Tank;
        GVAR(vehFaction) = QUOTE(riv);
        GVAR(vehType) = QUOTE(vehiclesRivalsTanks);
    };
    class GVAR(Rivals_Vehicle_Heli) : GVAR(Vehicle_Heli_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Rivals);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_Heli;
        GVAR(vehFaction) = QUOTE(riv);
        GVAR(vehType) = QUOTE(vehiclesRivalsHelis);
    };
    class GVAR(Rivals_Vehicle_StaticWpn) : GVAR(Vehicle_StaticMG_Base) {
        scope = 2;
        scopeCurator = 2;
        faction = QGVAR(Rivals);
        side = 0;
        displayName = $STR_A3U_Zeus_VehicleType_StaticWpn;
        GVAR(vehFaction) = QUOTE(riv);
        GVAR(vehType) = QUOTE(staticLowWeapons);
    };
    class GVAR(Rivals_Vehicle_Mortar) : GVAR(Vehicle_StaticMortar_Base) {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3U_Zeus_VehicleType_Mortar;
        faction = QGVAR(Rivals);
        side = 0;
        GVAR(vehFaction) = QUOTE(riv);
        GVAR(vehType) = QUOTE(staticMortars);
    };
