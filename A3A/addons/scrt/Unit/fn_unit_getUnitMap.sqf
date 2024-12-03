/*
Maintainer: Socrates
    Returns base unit map (used only by fn_compatibilityLoadFaction).
	This needed to retain BI unit config traits that otherwise would be lost and basically makes some difference
	for example, between SF and other types of soldiers.


Return Value:
    <HASHMAP>

Scope: Client, Server
Environment: Any
Public: Yes

Example:
Invaders call SCRT_fnc_misc_getUnitMap;
*/

///might need to add opfor here for rivals

private _side = _this;

private _unitClassMap = switch (_side) do {
	case west: { 
		createHashMapFromArray [
			["militia_SquadLeader", "B_Soldier_SL_F"],
			["militia_Rifleman", "B_Soldier_F"],
			["militia_Radioman", "B_Soldier_F"],
			["militia_Medic", "B_medic_F"],
			["militia_Engineer", "B_engineer_F"],
			["militia_ExplosivesExpert", "B_soldier_exp_F"],
			["militia_Grenadier", "B_Soldier_GL_F"],
			["militia_LAT", "B_soldier_LAT_F"],
			["militia_AT", "B_soldier_AT_F"],
			["militia_AA", "B_soldier_AA_F"],
			["militia_MachineGunner", "B_soldier_AR_F"],
			["militia_Marksman", "B_soldier_M_F"],
			["militia_Sniper", "B_sniper_F"],

			["military_SquadLeader", "B_Soldier_SL_F"],
			["military_Rifleman", "B_Soldier_F"],
			["military_Radioman", "B_Soldier_F"],
			["military_Medic", "B_medic_F"],
			["military_Engineer", "B_engineer_F"],
			["military_ExplosivesExpert", "B_soldier_exp_F"],
			["military_Grenadier", "B_Soldier_GL_F"],
			["military_LAT", "B_soldier_LAT_F"],
			["military_AT", "B_soldier_AT_F"],
			["military_AA", "B_soldier_AA_F"],
			["military_MachineGunner", "B_soldier_AR_F"],
			["military_Marksman", "B_soldier_M_F"],
			["military_Sniper", "B_sniper_F"],

			["elite_SquadLeader", "B_Soldier_SL_F"],
			["elite_Rifleman", "B_Soldier_F"],
			["elite_Radioman", "B_Soldier_F"],
			["elite_Medic", "B_medic_F"],
			["elite_Engineer", "B_engineer_F"],
			["elite_ExplosivesExpert", "B_soldier_exp_F"],
			["elite_Grenadier", "B_Soldier_GL_F"],
			["elite_LAT", "B_soldier_LAT_F"],
			["elite_AT", "B_soldier_AT_F"],
			["elite_AA", "B_soldier_AA_F"],
			["elite_MachineGunner", "B_soldier_AR_F"],
			["elite_Marksman", "B_soldier_M_F"],
			["elite_Sniper", "B_sniper_F"],

			["sf_SquadLeader", "B_recon_TL_F"],
			["sf_Rifleman", "B_recon_F"],
			["sf_Radioman", "B_recon_F"],
			["sf_Medic", "B_recon_medic_F"],
			["sf_Engineer", "B_recon_F"],
			["sf_ExplosivesExpert", "B_recon_exp_F"],
			["sf_Grenadier", "B_recon_JTAC_F"],
			["sf_LAT", "B_recon_LAT_F"],
			["sf_AT", "B_recon_LAT_F"],
			["sf_AA", "B_soldier_AA_F"],
			["sf_MachineGunner", "B_soldier_AR_F"],
			["sf_Marksman", "B_recon_M_F"],
			["sf_Sniper", "B_sniper_F"],

			["other_Crew", "B_crew_F"],
			["other_Unarmed", "B_Survivor_F"],
			["other_Official", "B_officer_F"],
			["other_Traitor", "B_G_Soldier_F"],
			["other_Pilot", "B_Helipilot_F"],
			["police_SquadLeader", "B_Soldier_F"],
			["police_Standard", "B_Soldier_F"]
		];
	};
	case east: { 
		createHashMapFromArray [
			["militia_SquadLeader", "O_Soldier_SL_F"],
			["militia_Rifleman", "O_Soldier_F"],
			["militia_Radioman", "O_Soldier_F"],
			["militia_Medic", "O_medic_F"],
			["militia_Engineer", "O_engineer_F"],
			["militia_ExplosivesExpert", "O_soldier_exp_F"],
			["militia_Grenadier", "O_Soldier_GL_F"],
			["militia_LAT", "O_Soldier_LAT_F"],
			["militia_AT", "O_Soldier_AT_F"],
			["militia_AA", "O_Soldier_AA_F"],
			["militia_MachineGunner", "O_Soldier_AR_F"],
			["militia_Marksman", "O_soldier_M_F"],
			["militia_Sniper", "O_sniper_F"],

			["military_SquadLeader", "O_Soldier_SL_F"],
			["military_Rifleman", "O_Soldier_F"],
			["military_Radioman", "O_Soldier_F"],
			["military_Medic", "O_medic_F"],
			["military_Engineer", "O_engineer_F"],
			["military_ExplosivesExpert", "O_soldier_exp_F"],
			["military_Grenadier", "O_Soldier_GL_F"],
			["military_LAT", "O_Soldier_LAT_F"],
			["military_AT", "O_Soldier_AT_F"],
			["military_AA", "O_Soldier_AA_F"],
			["military_MachineGunner", "O_Soldier_AR_F"],
			["military_Marksman", "O_soldier_M_F"],
			["military_Sniper", "O_sniper_F"],

			["elite_SquadLeader", "O_Soldier_SL_F"],
			["elite_Rifleman", "O_Soldier_F"],
			["elite_Radioman", "O_Soldier_F"],
			["elite_Medic", "O_medic_F"],
			["elite_Engineer", "O_engineer_F"],
			["elite_ExplosivesExpert", "O_soldier_exp_F"],
			["elite_Grenadier", "O_Soldier_GL_F"],
			["elite_LAT", "O_Soldier_LAT_F"],
			["elite_AT", "O_Soldier_AT_F"],
			["elite_AA", "O_Soldier_AA_F"],
			["elite_MachineGunner", "O_Soldier_AR_F"],
			["elite_Marksman", "O_soldier_M_F"],
			["elite_Sniper", "O_sniper_F"],

			["sf_SquadLeader", "O_recon_TL_F"],
			["sf_Rifleman", "O_recon_F"],
			["sf_Radioman", "O_recon_F"],
			["sf_Medic", "O_recon_medic_F"],
			["sf_Engineer", "O_recon_F"],
			["sf_ExplosivesExpert", "O_recon_exp_F"],
			["sf_Grenadier", "O_recon_JTAC_F"],
			["sf_LAT", "O_recon_LAT_F"],
			["sf_AT", "O_recon_LAT_F"],
			["sf_AA", "O_recon_F"],
			["sf_MachineGunner", "O_recon_F"],
			["sf_Marksman", "O_recon_M_F"],
			["sf_Sniper", "O_sniper_F"],

			["other_Crew", "O_crew_F"],
			["other_Unarmed", "O_Survivor_F"],
			["other_Official", "O_officer_F"],
			["other_Traitor", "O_G_Soldier_F"],
			["other_Pilot", "O_helipilot_F"],
			["police_SquadLeader", "O_GEN_Commander_F"],
			["police_Standard", "O_GEN_Soldier_F"]
		];
	};
	case independent: {
		createHashMapFromArray [
			["militia_Unarmed", "a3a_unit_reb_unarmed"],
        	["militia_Rifleman", "a3a_unit_reb"],
        	["militia_staticCrew", "a3a_unit_reb"],
        	["militia_Medic", "a3a_unit_reb_medic"],
        	["militia_Sniper", "a3a_unit_reb_sniper"],
        	["militia_Marksman", "a3a_unit_reb_marksman"],
        	["militia_LAT", "a3a_unit_reb_lat"],
        	["militia_MachineGunner", "a3a_unit_reb_mg"],
        	["militia_ExplosivesExpert", "a3a_unit_reb_exp"],
        	["militia_Grenadier", "a3a_unit_reb_gl"],
        	["militia_SquadLeader", "a3a_unit_reb_sl"],
        	["militia_Engineer", "a3a_unit_reb_eng"],
        	["militia_AT", "a3a_unit_reb_at"],
        	["militia_AA", "a3a_unit_reb_aa"],
        	["militia_Petros", "a3a_unit_reb_petros"]
		];
	};
	case civilian: {
		createHashMapFromArray [
			["militia_Worker", "C_man_w_worker_F"],
			["militia_Press", "C_journalist_F"],
			["militia_Man", "C_man_polo_1_F"]
		];
	};
};

_unitClassMap