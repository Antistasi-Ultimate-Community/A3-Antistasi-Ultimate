	// ------------ Rivals ------------ //
    class A3U_Rivals_Base : A3U_Invaders_Base {
        displayName = "Rivals Base";
        faction = "A3U_Rivals";
        GVAR(unitFaction) = QUOTE(riv);
        class EventHandlers {
            class ADDON {
                PostInit = QUOTE([ARR_4(_this#0,getText(configOf(_this#0) >> QQGVAR(unitFaction)),getText(configOf(_this#0) >> QQGVAR(unitPrefix)),getText(configOf(_this#0) >> QQGVAR(unitType)))] call A3U_fnc_zeus_unitInit);
            };
        };
    };
    class A3U_Rivals_Partisan: A3U_Rivals_Base {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_A3AU_Zeus_UnitType_Partisan;
        editorSubcategory = "A3U_Militia";
        role = "Rifleman";
        nameSound = "veh_infantry_s";
        textSingular = "infantry";
        textPlural = "infantry";
        GVAR(unitPrefix) = QUOTE(militia);
        GVAR(unitType) = QUOTE(Partisan);
    };
    class A3U_Rivals_Mercenary : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Mercenary;
        GVAR(unitType) = QUOTE(Mercenary);
    };
    class A3U_Rivals_Minuteman : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Minuteman;
        GVAR(unitType) = QUOTE(Minuteman);
    };
    class A3U_Rivals_Enforcer : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Enforcer;
        GVAR(unitType) = QUOTE(Enforcer);
    };
    class A3U_Rivals_CellLeader : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_CellLeader;
        icon = "iconManLeader";
        role = "SquadLeader";
        GVAR(unitType) = QUOTE(CellLeader);
    };
    class A3U_Rivals_Commander : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Commander;
        icon = "iconManOfficer";
        role = "SquadLeader";
        nameSound = "veh_infantry_officer_s";
        textSingular = "officer";
        textPlural = "officers";
        GVAR(unitType) = QUOTE(Commander);
    };
    class A3U_Rivals_Medic : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Medic;
        attendant = 1;
        icon = "iconManMedic";
        picture = "pictureHeal";
        role = "CombatLifeSaver";
        nameSound = "veh_infantry_medic_s";
        textSingular = "medic";
        textPlural = "medics";
        GVAR(unitType) = QUOTE(Medic);
    };
    class A3U_Rivals_ExplosivesExpert : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_EExpert;
        canDeactivateMines = 1;
        icon = "iconManExplosive";
        picture = "pictureExplosive";
        role = "ExplosiveSpecialist";
        GVAR(unitType) = QUOTE(ExplosivesExpert);
    };
    class A3U_Rivals_Saboteur : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Saboteur;
        role = "Grenadier";
        GVAR(unitType) = QUOTE(Saboteur);
    };
    class A3U_Rivals_SpecialistAT : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_ATSpecialist;
        icon = "iconManAT";
        role = "ATSpecialist";
        nameSound = "veh_infantry_AT_s";
        textSingular = "AT soldier";
        textPlural = "AT soldiers";
        GVAR(unitType) = QUOTE(SpecialistAT);
    };
    class A3U_Rivals_SpecialistAA : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_AASpecialist;
        role = "AASpecialist";
        GVAR(unitType) = QUOTE(SpecialistAA);
    };
    class A3U_Rivals_Oppressor : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Oppressor;
        icon = "iconManMG";
        role = "MachineGunner";
        nameSound = "veh_infantry_MG_s";
        textSingular = "machinegunner";
        textPlural = "machinegunners";
        GVAR(unitType) = QUOTE(Oppressor);
    };
    class A3U_Rivals_Sharpshooter : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Marksman;
        role = "Marksman";
        nameSound = "veh_infantry_sniper_s";
        textSingular = "sniper";
        textPlural = "snipers";
        GVAR(unitType) = QUOTE(Sharpshooter);
    };
    class A3U_Rivals_Crew : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Crew;
        role = "Crew";
        GVAR(unitType) = QUOTE(Crew);
    };
    class A3U_Rivals_Pilot : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Pilot;
        role = "Pilot";
        nameSound = "veh_infantry_pilot_s";
        textSingular = "pilot";
        textPlural = "pilots";
        GVAR(unitType) = QUOTE(Pilot);
    };
    class A3U_Rivals_Unarmed : A3U_Rivals_Partisan {
        displayName = $STR_A3AU_Zeus_UnitType_Unarmed;
        role = "Unarmed";
        GVAR(unitType) = QUOTE(Unarmed);
    };
