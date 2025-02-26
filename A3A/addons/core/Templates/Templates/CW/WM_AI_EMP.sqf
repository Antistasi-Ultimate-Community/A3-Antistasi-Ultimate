//////////////////////////
//   Side Information   //
//////////////////////////

#include "..\..\..\script_component.hpp"

["name", "Empire"] call _fnc_saveToTemplate;
["spawnMarkerName", "Imperial support corridor"] call _fnc_saveToTemplate;

["flag", "ls_flag_imp"] call _fnc_saveToTemplate;
["flagTexture", QPATHTOFOLDER(Templates\Templates\CW\flag_Empire.paa)] call _fnc_saveToTemplate; 	
["flagMarkerType", "imperial_marker_white"] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesDropPod", ["3AS_Rho_Crate_IMP_Transport"]] call _fnc_saveToTemplate; 

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate;     //Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_IND_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["WM_74Z_Imperial_Brown"]] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["3AS_ISP_Transport"]] call _fnc_saveToTemplate; 		
["vehiclesLightArmed",["WM_74Z_Imperial_Brown", "3AS_ISP", "3AS_ISP"]] call _fnc_saveToTemplate; 		
["vehiclesTrucks", ["442_argon_transport", "442_argon_covered"]] call _fnc_saveToTemplate; 		
["vehiclesCargoTrucks", ["442_argon_transport", "442_argon_covered"]] call _fnc_saveToTemplate; 		
["vehiclesAmmoTrucks", ["442_argon_ammo"]] call _fnc_saveToTemplate; 	
["vehiclesRepairTrucks", ["442_argon_repair"]] call _fnc_saveToTemplate; 	
["vehiclesFuelTrucks", ["442_argon_fuel"]] call _fnc_saveToTemplate;	
["vehiclesMedical", ["WM_ITT_Medical","3AS_ITT_Medical"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs", ["WM_ITT_Imperial", "3AS_ITT", "3AS_PX10_IMP_F"]] call _fnc_saveToTemplate;
["vehiclesAPCs", ["WM_ITT_Imperial", "3AS_ITT", "3AS_Saber_M1_Imperial", "3AS_Saber_M1Recon_Imperial", "3AS_PX10_IMP_UP"]] call _fnc_saveToTemplate;
["vehiclesAirborne", ["3AS_PX10_IMP_F", "3AS_ISP", "3AS_Saber_M1_Imperial", "WM_ITT_Imperial", "3AS_ITT"]] call _fnc_saveToTemplate;
["vehiclesIFVs", ["3AS_Saber_Super_Imperial", "3AS_Saber_M1G_Imperial"]] call _fnc_saveToTemplate;
["vehiclesLightTanks",  ["3AS_Saber_Super_Imperial", "3AS_Saber_M1G_Imperial"]] call _fnc_saveToTemplate;
["vehiclesTanks", ["3AS_ATTE_Imperial","WM_ATST"]] call _fnc_saveToTemplate;
["vehiclesAA", ["3AS_RX200_Base"]] call _fnc_saveToTemplate;

["vehiclesTransportBoats", ["I_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 
["vehiclesGunBoats", ["442_boat_armed"]] call _fnc_saveToTemplate; 
["vehiclesAmphibious", []] call _fnc_saveToTemplate;

["vehiclesPlanesCAS", ["WM_TieBomber_Cluster"]] call _fnc_saveToTemplate;
["vehiclesPlanesLargeCAS", ["WM_TieDefender"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["WM_TieInterceptor","WM_TieInterceptor","3AS_VWing_Imperial","3AS_VWing_Imperial","WM_TieAdvanced"]] call _fnc_saveToTemplate;
["vehiclesPlanesLargeAA", ["WM_Tiefighter","WM_Tiefighter","WM_Tiefighter","WM_Tiefighter","WM_Tiefighter"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["3AS_Imperial_Transport_01","3AS_Gozanti_F"]] call _fnc_saveToTemplate;

["vehiclesPlanesGunship", ["3AS_LAAT_Mk1_Imperial"]] call _fnc_saveToTemplate;

["vehiclesHelisLight", ["3AS_Patrol_LAAT_Imperial"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport", ["3AS_LAAT_Mk2_Imperial", "3AS_LAAT_Mk2_Imperial", "3AS_LAAT_Mk2_Imperial", "WM_Lambda", "3AS_Nu_IMP_F", "3AS_Rho_IMP_F"]] call _fnc_saveToTemplate;
["vehiclesHelisLightAttack", ["3AS_LAAT_Mk1_Imperial"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack", ["3AS_LAAT_Mk1_Imperial"]] call _fnc_saveToTemplate;


["vehiclesArtillery", ["442_rx200_arty"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [
["442_rx200_arty", ["32Rnd_155mm_Mo_shells"]]
]] call _fnc_saveToTemplate;

["uavsAttack", ["B_UAV_02_dynamicLoadout_F", "B_T_UAV_03_dynamicLoadout_F"]] call _fnc_saveToTemplate;
["uavsPortable", ["3as_uas2"]] call _fnc_saveToTemplate;

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["3AS_ISP","WM_74Z_Imperial_Brown"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks", ["442_argon_transport", "442_argon_covered"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars", ["3AS_ISP_Transport"]] call _fnc_saveToTemplate;
["vehiclesMilitiaAPCs", ["WM_ITT_Imperial"]] call _fnc_saveToTemplate;

["vehiclesPolice", ["3AS_ISP_Transport"]] call _fnc_saveToTemplate;

["staticMGs", ["3AS_HeavyRepeater_Unarmoured"]] call _fnc_saveToTemplate;
["staticAT", ["3as_ParticleCannon"]] call _fnc_saveToTemplate;
["staticAA", ["AA_Turret"]] call _fnc_saveToTemplate;
["staticMortars", ["3AS_Republic_Mortar"]] call _fnc_saveToTemplate;
["staticHowitzers", []] call _fnc_saveToTemplate;

["vehicleRadar", "lsd_cis_radarDish"] call _fnc_saveToTemplate;
["vehicleSam", "3AS_Keeradak_Imperial"] call _fnc_saveToTemplate;

["howitzerMagazineHE", ""] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

//Minefield definition
["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine_Range_Mag"]] call _fnc_saveToTemplate;


#include "CW_Vehicle_Attributes.sqf"

/////////////////////
///  Identities   ///
/////////////////////

["voices", ["JLTS_voice_clone"]] call _fnc_saveToTemplate;
["faces", ["lsd_gar_cloneA_head","lsd_gar_cloneB_head","lsd_gar_cloneC_head","lsd_gar_cloneD_head","lsd_gar_cloneE_head","lsd_gar_cloneF_head","lsd_gar_cloneG_head", "lsd_gar_cloneH_head"]] call _fnc_saveToTemplate;


//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];
_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", [
["ls_weapon_rps6", "", "", "", ["ls_mag_rpg_1rnd"], [], ""]
]];
_loadoutData set ["missileATLaunchers", [
["WM_Launch_PTL", "", "", "", ["WM_ProtonTorpedo"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["3AS_PLX1_F", "", "", "", ["3AS_JLTS_MK39_AA"], [], ""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["SWLW_clones_spec_breach_mag"]]; 			
_loadoutData set ["heavyExplosives", ["SWLW_clones_spec_demo_mag"]]; 			

_loadoutData set ["antiInfantryGrenades", ["3AS_ThermalDetonator", "442_impact_mag"]]; 		//this line determines anti infantry grenades (frag and such) -- Example: ["HandGrenade", "MiniGrenade"] -- Array, can contain multiple assets
_loadoutData set ["antiTankGrenades", ["3AS_ThrowableCharge"]]; 			//this line determines anti tank grenades. Leave empty when not available. -- Array, can contain multiple assets
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["SWLB_comlink"]];			//this line determines radio
_loadoutData set ["gpses", ["ItemGPS"]];			//this line determines GPS
_loadoutData set ["NVGs", ["lsd_gar_standardSPC_nvg"]];						//this line determines NVGs -- Array, can contain multiple assets
_loadoutData set ["binoculars", ["SWLB_clone_binocular"]];		//this line determines the binoculars
_loadoutData set ["Rangefinder", ["SWLB_clone_commander_binocular"]];

_loadoutData set ["traitorUniforms", ["WM_OfficerUniform"]];
_loadoutData set ["traitorVests", ["WM_Officer_armor"]];
_loadoutData set ["traitorHats", ["WM_OfficerHelmet"]];

_loadoutData set ["officerUniforms", ["WM_OfficerUniform"]];
_loadoutData set ["officerVests", ["WM_Officer_armor"]];
_loadoutData set ["officerHats", ["WM_OfficerCap"]];

_loadoutData set ["cloakUniforms", []];
_loadoutData set ["cloakVests", []];

_loadoutData set ["uniforms", []];
_loadoutData set ["slUniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["Hvests", []];
_loadoutData set ["glVests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["ViperBP", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];
_loadoutData set ["slHat", []];
_loadoutData set ["sniHats", []];

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadLeader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_sfLoadoutData set ["uniforms", ["WM_DarkTrooperArmor"]];
_sfLoadoutData set ["vests", ["WM_Basic_armor"]];
_sfLoadoutData set ["backpacks", ["WM_Darktrooper_Jetpack"]];
_sfLoadoutData set ["helmets", ["WM_DarktrooperHelmet"]];
_sfLoadoutData set ["sniHats", ["WM_DarktrooperHelmet"]];
_sfLoadoutData set ["slHat", ["WM_DarktrooperHelmet"]];
_sfLoadoutData set ["binoculars", ["SWLB_clone_commander_binocular"]];

//SF Weapons
_sfLoadoutData set ["rifles", [
["SWLW_DC17M", "swlw_attachment_dc17m_blaster", "", "", ["SWLW_DC17M_Blaster_Mag"], [], ""]
]];
_sfLoadoutData set ["carbines", [
["SWLW_DC17M", "swlw_attachment_dc17m_blaster", "", "", ["SWLW_DC17M_Blaster_Mag"], [], ""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["SWLW_DC17M", "swlw_attachment_dc17m_at", "", "", ["SWLW_DC17M_Blaster_Mag"], ["SWLW_DC17M_AT_Mag"], ""]
]];
_sfLoadoutData set ["SMGs", [
["SWLW_DC17M", "swlw_attachment_dc17m_blaster", "", "", ["SWLW_DC17M_Blaster_Mag"], [], ""]
]];
_sfLoadoutData set ["machineGuns", [
["SWLW_Z6", "", "", "", ["SWLW_Z6_mag"], [], ""]
]];
_sfLoadoutData set ["marksmanRifles", [
["SWLW_DC17M", "swlw_attachment_dc17m_sniper", "", "swlw_attachment_scope_dc17m_sniper", ["SWLW_DC17M_Sniper_Mag"], [], ""]
]];
_sfLoadoutData set ["sniperRifles", [
["SWLW_DC17M", "swlw_attachment_dc17m_sniper", "", "swlw_attachment_scope_dc17m_sniper", ["SWLW_DC17M_Sniper_Mag"], [], ""]
]];
_sfLoadoutData set ["sidearms", [
["SWLW_DC15SA", "", "", "", ["SWLW_DC15SA_Mag"], [], ""]
]];


/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_eliteLoadoutData set ["uniforms", ["WM_NovaArmor"]];
_eliteLoadoutData set ["vests", ["WM_Basic_armor", "WM_Basic_armor", "WM_Basic_armor", "WM_Basic_armor", "WM_Pauldron_Nova", "WM_Pauldron_Nova", "WM_Pauldron_Nova"]];
_eliteLoadoutData set ["glVests", ["WM_Basic_armor"]];
_eliteLoadoutData set ["backpacks", ["WM_Stormtrooper_Backpack", "WM_Stormtrooper_Backpack_RTO"]];
_eliteLoadoutData set ["atBackpacks", ["WM_Stormtrooper_Backpack"]];
_eliteLoadoutData set ["helmets", ["WM_NovaHelmet"]];
_eliteLoadoutData set ["NVGs", ["lsd_gar_standardSPC_nvg"]];
_eliteLoadoutData set ["binoculars", ["SWLB_clone_commander_binocular"]];
_eliteLoadoutData set ["antiInfantryGrenades", ["3AS_ThermalDetonator", "442_impact_mag"]];
_eliteLoadoutData set ["lightATLaunchers", [
["WM_Launch_PTL", "", "", "", ["WM_ProtonTorpedo"], [], ""]
]];
_eliteLoadoutData set ["ATLaunchers", [
["3AS_Chaingun", "", "", "", ["3AS_Chaingun_Drum_Mag"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["WM_E11D", "", "", "", ["WM_E11_Mag"], [], ""],
["WM_E11", "", "", "WM_E11_Optic", ["WM_E11_Mag"], [], "WM_E11_Pack"]
]];
_eliteLoadoutData set ["rifles", [
["WM_E11D", "", "", "", ["WM_E11_Mag"], [], ""],
["WM_E11", "", "", "WM_E11_Optic", ["WM_E11_Mag"], [], "WM_E11_Pack"]
]];
_eliteLoadoutData set ["carbines", [
["WM_E11", "", "", "WM_E11_Optic", ["WM_E11_Mag"], [], "WM_E11_Pack"]
]];
_eliteLoadoutData set ["designatedGrenadeLaunchers", [
["3AS_DC15C_GL", "", "", "", ["3AS_40Rnd_EC40_Mag"], ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], ""]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["3AS_DC15C_GL", "", "", "", ["3AS_40Rnd_EC40_Mag"], ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], ""]
]];
_eliteLoadoutData set ["machineGuns", [
["WM_DLT19", "", "", "", ["WM_DTL19_mag"], [], ""],
["WM_T21", "", "", "", ["WM_T21_mag"], [], ""],
["SWLW_Z6", "", "", "", ["SWLW_Z6_mag"], [], ""]
]];
_eliteLoadoutData set ["marksmanRifles", [
["WM_DLT19D", "", "", "", ["WM_DLT19D_Magazine"], [], ""]
]];
_eliteLoadoutData set ["sniperRifles", [
["WM_DLT_19X", "", "", "", ["WM_DLT19X_Magazine"], [], "WM_DLT_Bipod"]
]];
_eliteLoadoutData set ["sidearms", [
["WM_RK3", "", "", "", ["WM_RK3_Mag"], [], ""]
]];


/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militaryLoadoutData set ["uniforms", ["WM_StormArmor"]];
_militaryLoadoutData set ["vests", ["WM_Basic_armor", "WM_Basic_armor", "WM_Basic_armor", "WM_Basic_armor"]];
_militaryLoadoutData set ["Hvests", ["WM_Basic_armor", "WM_Basic_armor", "WM_Pauldron", "WM_SGT_Pauldron", "WM_SL_Pauldron", "WM_UTL_Pauldron"]];
_militaryLoadoutData set ["glVests", ["WM_Basic_armor"]];
_militaryLoadoutData set ["backpacks", ["WM_Stormtrooper_Backpack", "WM_Stormtrooper_Backpack_RTO"]];
_militaryLoadoutData set ["helmets", ["WM_StormHelmet"]];
_militaryLoadoutData set ["sniHats", ["WM_StormHelmet"]];
_militaryLoadoutData set ["slHat", ["WM_StormHelmet"]];
_militaryLoadoutData set ["binoculars", ["SWLB_clone_binocular"]];

_militaryLoadoutData set ["rifles", [
["WM_E11", "", "", "WM_E11_Optic", ["WM_E11_Mag"], [], "WM_E11_Pack"]
]];
_militaryLoadoutData set ["carbines", [
["WM_E11", "", "", "WM_E11_Optic", ["WM_E11_Mag"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["3AS_DC15C_GL", "", "", "", ["3AS_40Rnd_EC40_Mag"], ["1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "UGL_FlareWhite_F"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["WM_E11", "", "", "", ["WM_E11_Mag"], [], ""]
]];
_militaryLoadoutData set ["machineGuns", [
["WM_DLT19", "", "", "", ["WM_DTL19_mag"], [], ""],
["WM_T21", "", "", "", ["WM_T21_mag"], [], ""]
]];
_militaryLoadoutData set ["marksmanRifles", [
["WM_DLT19D", "", "", "", ["WM_DLT19D_Magazine"], [], ""]
]];
_militaryLoadoutData set ["sniperRifles", [
["WM_DLT_19X", "", "", "", ["WM_DLT19X_Magazine"], [], "WM_DLT_Bipod"]
]];
_militaryLoadoutData set ["sidearms", [
["WM_SE14C", "", "", "WM_SE14C_Scope", ["WM_SE14C_Mag"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_policeLoadoutData set ["uniforms", ["WM_ScoutArmor"]];
_policeLoadoutData set ["vests", ["WM_Pauldron","WM_ScoutVest","WM_ScoutVest","WM_ScoutVest"]];
_policeLoadoutData set ["helmets", ["WM_ScoutHelmet"]];
_policeLoadoutData set ["smgs", [
["SWLW_DP20", "", "", "", ["SWLW_DP20_Mag"], [], ""],
["WM_E11", "", "", "", ["WM_E11_Mag"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["WM_EC17", "", "", "", ["WM_EC17_Mag"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_militiaLoadoutData set ["uniforms", ["WM_ArmyUniform"]];		//this line determines uniforms for militia loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_militiaLoadoutData set ["vests", ["WM_ArmyVest"]];			//this line determines vests for militia loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_militiaLoadoutData set ["backpacks", ["WM_Stormtrooper_Backpack", "WM_Stormtrooper_Backpack_RTO"]];		//this line determines backpacks for militia loadouts -- Example: ["B_AssaultPack_mcamo", "B_Kitbag_mcamo"] -- Array, can contain multiple assets
_militiaLoadoutData set ["helmets", ["WM_ArmyHelmet"]];		//this line determines helmets for police loadouts -- Example: ["H_HelmetB_camo", "H_HelmetB_desert"] -- Array, can contain multiple assets
_militiaLoadoutData set ["sniHats", ["WM_ArmyHelmet"]];
_militiaLoadoutData set ["slHat", ["WM_OfficerCap"]];

_militiaLoadoutData set ["rifles", [
["WM_E11", "", "", "", ["WM_E11_Mag"], [], ""],
["SWLW_DC15AC", "", "", "", ["SWLW_DC15AC_Mag"], [], ""],
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["SWLW_DC15A_wooden", "", "", "", ["SWLW_DC15A_Mag"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["WM_E11", "", "", "", ["WM_E11_Mag"], [], ""],
["SWLW_DC15s", "", "", "", ["SWLW_DC15s_Mag"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["SWLW_DC15A_ugl", "", "", "", ["SWLW_DC15A_Mag"], ["SWLW_DC15A_UGL_Mag", "SWLW_DC15A_UGL_smoke_white_Mag", "SWLW_DC15A_UGL_flare_white_Mag"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["WM_E11", "", "", "", ["WM_E11_Mag"], [], ""],
["SWLW_DP20", "", "", "", ["SWLW_DP20_Mag"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["SWLW_DC15SAW", "", "", "", ["SWLW_DC15SAW_Mag"], [], ""],
["SWLW_DC15SAW_wooden", "", "", "", ["SWLW_DC15SAW_Mag"], [], ""],
["WM_DLT19", "", "", "", ["WM_DTL19_mag"], [], ""],
["WM_T21", "", "", "", ["WM_T21_mag"], [], ""]
]];
_militiaLoadoutData set ["marksmanRifles", [
["SWLW_DC15A", "", "", "", ["SWLW_DC15A_Mag"], [], ""],
["WM_DLT19D", "", "", "", ["WM_DLT19D_Magazine"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["SWLW_DC15X_wooden", "", "", "", ["SWLW_DC15X_mag"], [], ""],
["WM_DLT_19X", "", "", "", ["WM_DLT19X_Magazine"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["WM_SE14C", "", "", "", ["WM_SE14C_Mag"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; // touch and shit breaks
_crewLoadoutData set ["uniforms", ["WM_ArmyUniform"]];			//this line determines uniforms for vehicle crew loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_crewLoadoutData set ["vests", ["WM_ArmyVest"]];				//this line determines vests for vehicle crew loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_crewLoadoutData set ["helmets", ["WM_DriverHelmet"]];
_crewLoadoutData set ["carbines", [
["WM_DH17", "", "", "", ["WM_DH17_Mag"], [], ""]
]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["WM_PilotArmor"]];			//this line determines uniforms for pilot loadouts -- Example: ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt"] -- Array, can contain multiple assets
_pilotLoadoutData set ["vests", ["WM_Basic_armor"]];			//this line determines vests for pilot loadouts -- Example: ["V_PlateCarrierSpec_mtp", "V_PlateCarrierGL_mtp"] -- Array, can contain multiple assets
_pilotLoadoutData set ["helmets", ["WM_PilotHelmet"]];	
_pilotLoadoutData set ["carbines", [
["WM_E11", "", "", "", ["WM_E11_Mag"], [], ""]
]];




/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////

private _squadLeaderTemplate = {
    ["slHat"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["backpacks"] call _fnc_setBackpack;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["binoculars"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _radiomanTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["longRangeRadios"] call _fnc_setBackpack;


    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_rifleman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
      [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_medic"] call _fnc_addItemSet;
    ["items_medic_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["grenadeLaunchers"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_grenadier_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 4] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [["glVests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;


    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_explosivesExpert_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["lightExplosives", 2] call _fnc_addItem;
    if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
    if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_engineer_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_lat_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_at_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    ["machineGuns"] call _fnc_setPrimary;
    ["primary", 4] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_machineGunner_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate= {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["marksmanRifles"] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_marksman_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["sniperRifles"] call _fnc_setPrimary;
    ["primary", 7] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


    ["SMGs"] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_police_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
    ["helmets"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_crew_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["gpses"] call _fnc_addGPS;
    ["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
    ["traitorHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["traitorVests"] call _fnc_setVest;
    ["traitorUniforms"] call _fnc_setUniform;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _officerTemplate = {
    ["officerHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 1.25, "glasses", 0.75]] call _fnc_setFacewear;
    ["officerVests"] call _fnc_setVest;
    ["officerUniforms"] call _fnc_setUniform;

    [["SMGs", "carbines"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 3] call _fnc_addMagazines;
    
    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_basic"] call _fnc_addItemSet;
    ["items_unarmed_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
};

private _patrolSniperTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["sniperRifles", "marksmanRifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _patrolSpotterTemplate = {
    ["sniHats"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["cloakVests","vests"] call _fnc_fallback] call _fnc_setVest;
    [["cloakUniforms","uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [selectRandom ["rifles", "carbines", "marksmanRifles"]] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_sniper_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["rangefinders"] call _fnc_addBinoculars;
    ["NVGs"] call _fnc_addNVGs;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]]
];


[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
    params ["_name", "_loadoutTemplate"];
    private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
    private _finalName = _prefix + _name;
    [_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _policeTemplate, [], [_prefix]],
	["Standard", _policeTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

///////////////////////
//  Elite Units   //
///////////////////////
private _prefix = "elite";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate, [], [_prefix]],
	["Rifleman", _riflemanTemplate, [], [_prefix]],
	["Radioman", _radiomanTemplate, [], [_prefix]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix]],
	["Engineer", _engineerTemplate, [["engineer", true]], [_prefix]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix]],
	["Grenadier", _grenadierTemplate, [], [_prefix]],
	["LAT", _latTemplate, [], [_prefix]],
	["AT", _atTemplate, [], [_prefix]],
	["AA", _aaTemplate, [], [_prefix]],
	["MachineGunner", _machineGunnerTemplate, [], [_prefix]],
	["Marksman", _marksmanTemplate, [], [_prefix]],
	["Sniper", _sniperTemplate, [], [_prefix]],
    	["PatrolSniper", _patrolSniperTemplate, [], [_prefix]],
    	["PatrolSpotter", _patrolSpotterTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _squadLeaderTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
