#define A3A_UNIT_EMPTY(NAME,PARENT) \
    class NAME : PARENT { \
        scope = 1; \
        backpack = ""; \
        linkedItems[] = {"ItemMap","ItemCompass","ItemWatch"}; \
        magazines[] = {}; \
        weapons[] = {"Throw","Put"}; \
    }

    // Base side types
    class B_G_Soldier_F;
    class O_G_Soldier_F;
    class O_G_Soldier_lite_F;
    class C_Man_1;

    A3A_UNIT_EMPTY(GVAR(Occupants_Base),B_G_Soldier_F); // TODO fix
    A3A_UNIT_EMPTY(GVAR(Invaders_Base),O_G_Soldier_F); // TODO fix
    A3A_UNIT_EMPTY(GVAR(Rivals_Base),O_G_Soldier_lite_F); // TODO fix
    A3A_UNIT_EMPTY(GVAR(Civilians_Base),C_Man_1); // TODO fix

    // Rebels
    class I_G_Survivor_F;
    class I_G_Soldier_F;
    class I_G_medic_F;
    class I_G_Sharpshooter_F;
    class I_G_Soldier_M_F;
    class I_G_Soldier_LAT_F;
    class I_G_Soldier_AR_F;
    class I_G_Soldier_exp_F;
    class I_G_Soldier_GL_F;
    class I_G_Soldier_SL_F;
    class I_G_engineer_F;
    class I_Soldier_AT_F;
    class I_Soldier_AA_F;
    class I_G_officer_F;

    A3A_UNIT_EMPTY(GVAR(Rebels_Unarmed),I_G_Survivor_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_Base),I_G_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_Medic),I_G_medic_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_Sniper),I_G_Sharpshooter_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_Marksman),I_G_Soldier_M_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_LAT),I_G_Soldier_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_MachineGunner),I_G_Soldier_AR_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_ExplosivesExpert),I_G_Soldier_exp_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_Grenadier),I_G_Soldier_GL_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_SquadLeader),I_G_Soldier_SL_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_Engineer),I_G_engineer_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_AT),I_Soldier_AT_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_AA),I_Soldier_AA_F);
    A3A_UNIT_EMPTY(GVAR(Rebels_Petros),I_G_officer_F); // TODO fix

    // Occupants
    class B_Soldier_SL_F;
    class B_Soldier_F;
    class B_medic_F;
    class B_engineer_F;
    class B_soldier_exp_F;
    class B_Soldier_GL_F;
    class B_soldier_LAT_F;
    class B_soldier_AT_F;
    class B_soldier_AA_F;
    class B_soldier_AR_F;
    class B_soldier_M_F;
    class B_sniper_F;
    class B_recon_TL_F;
    class B_recon_F;
    class B_recon_medic_F;
    class B_recon_exp_F;
    class B_recon_JTAC_F;
    class B_recon_LAT_F;
    class B_recon_M_F;
    class B_crew_F;
    class B_Survivor_F;
    class B_officer_F;
    class B_Helipilot_F;

    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_SquadLeader),B_Soldier_SL_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_Rifleman),B_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_Radioman),B_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_Medic),B_medic_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_Engineer),B_engineer_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_ExplosivesExpert),B_soldier_exp_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_Grenadier),B_Soldier_GL_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_LAT),B_soldier_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_AT),B_soldier_AT_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_AA),B_soldier_AA_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_MachineGunner),B_soldier_AR_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_Marksman),B_soldier_M_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Militia_Sniper),B_sniper_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_SquadLeader),B_Soldier_SL_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_Rifleman),B_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_Radioman),B_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_Medic),B_medic_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_Engineer),B_engineer_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_ExplosivesExpert),B_soldier_exp_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_Grenadier),B_Soldier_GL_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_LAT),B_soldier_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_AT),B_soldier_AT_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_AA),B_soldier_AA_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_MachineGunner),B_soldier_AR_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_Marksman),B_soldier_M_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Military_Sniper),B_sniper_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_SquadLeader),B_Soldier_SL_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_Rifleman),B_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_Radioman),B_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_Medic),B_medic_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_Engineer),B_engineer_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_ExplosivesExpert),B_soldier_exp_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_Grenadier),B_Soldier_GL_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_LAT),B_soldier_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_AT),B_soldier_AT_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_AA),B_soldier_AA_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_MachineGunner),B_soldier_AR_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_Marksman),B_soldier_M_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Elite_Sniper),B_sniper_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_SquadLeader),B_recon_TL_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_Rifleman),B_recon_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_Radioman),B_recon_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_Medic),B_recon_medic_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_Engineer),B_recon_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_ExplosivesExpert),B_recon_exp_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_Grenadier),B_recon_JTAC_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_LAT),B_recon_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_AT),B_recon_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_AA),B_soldier_AA_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_MachineGunner),B_soldier_AR_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_Marksman),B_recon_M_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_SpecialForces_Sniper),B_sniper_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Other_Crew),B_crew_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Other_Unarmed),B_Survivor_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Other_Official),B_officer_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Other_Traitor),B_G_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Other_Pilot),B_Helipilot_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Police_SquadLeader),B_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Occupants_Police_Standard),B_Soldier_F);

    // Invaders
    class O_Soldier_SL_F;
    class O_Soldier_F;
    class O_medic_F;
    class O_engineer_F;
    class O_soldier_exp_F;
    class O_Soldier_GL_F;
    class O_Soldier_LAT_F;
    class O_Soldier_AT_F;
    class O_Soldier_AA_F;
    class O_Soldier_AR_F;
    class O_soldier_M_F;
    class O_sniper_F;
    class O_recon_TL_F;
    class O_recon_F;
    class O_recon_medic_F;
    class O_recon_exp_F;
    class O_recon_JTAC_F;
    class O_recon_LAT_F;
    class O_recon_M_F;
    class O_crew_F;
    class O_Survivor_F;
    class O_officer_F;
    class O_helipilot_F;
    class O_GEN_Commander_F;
    class O_GEN_Soldier_F;

    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_SquadLeader),O_Soldier_SL_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_Rifleman),O_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_Radioman),O_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_Medic),O_medic_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_Engineer),O_engineer_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_ExplosivesExpert),O_soldier_exp_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_Grenadier),O_Soldier_GL_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_LAT),O_Soldier_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_AT),O_Soldier_AT_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_AA),O_Soldier_AA_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_MachineGunner),O_Soldier_AR_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_Marksman),O_soldier_M_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Militia_Sniper),O_sniper_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_SquadLeader),O_Soldier_SL_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_Rifleman),O_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_Radioman),O_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_Medic),O_medic_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_Engineer),O_engineer_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_ExplosivesExpert),O_soldier_exp_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_Grenadier),O_Soldier_GL_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_LAT),O_Soldier_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_AT),O_Soldier_AT_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_AA),O_Soldier_AA_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_MachineGunner),O_Soldier_AR_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_Marksman),O_soldier_M_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Military_Sniper),O_sniper_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_SquadLeader),O_Soldier_SL_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_Rifleman),O_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_Radioman),O_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_Medic),O_medic_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_Engineer),O_engineer_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_ExplosivesExpert),O_soldier_exp_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_Grenadier),O_Soldier_GL_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_LAT),O_Soldier_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_AT),O_Soldier_AT_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_AA),O_Soldier_AA_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_MachineGunner),O_Soldier_AR_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_Marksman),O_soldier_M_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Elite_Sniper),O_sniper_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_SquadLeader),O_recon_TL_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_Rifleman),O_recon_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_Radioman),O_recon_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_Medic),O_recon_medic_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_Engineer),O_recon_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_ExplosivesExpert),O_recon_exp_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_Grenadier),O_recon_JTAC_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_LAT),O_recon_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_AT),O_recon_LAT_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_AA),O_recon_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_MachineGunner),O_recon_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_Marksman),O_recon_M_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_SpecialForces_Sniper),O_sniper_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Other_Crew),O_crew_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Other_Unarmed),O_Survivor_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Other_Official),O_officer_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Other_Traitor),O_G_Soldier_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Other_Pilot),O_helipilot_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Police_SquadLeader),O_GEN_Commander_F);
    A3A_UNIT_EMPTY(GVAR(Invaders_Police_Standard),O_GEN_Soldier_F);

    // Civilians
    class C_man_w_worker_F;
    class C_journalist_F;
    class C_man_polo_1_F;

    A3A_UNIT_EMPTY(GVAR(Civilians_Worker),C_man_w_worker_F);
    A3A_UNIT_EMPTY(GVAR(Civilians_Press),C_journalist_F);
    A3A_UNIT_EMPTY(GVAR(Civilians_Man),C_man_polo_1_F);
