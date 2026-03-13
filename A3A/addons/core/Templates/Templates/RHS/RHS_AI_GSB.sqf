//these variables determine whether specified dlcs are loaded
private _hasWs = "ws" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasTanks = "tank" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;

#include "..\..\script_component.hpp" // TAKE NOTE OF THIS. WITHOUT THIS, YOU CAN'T USE MACROS LIKE QPATHTOFOLDER.

//////////////////////////
//   Side Information   //
//////////////////////////

["name", "GSB"] call _fnc_saveToTemplate; 						//this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", format [localize "STR_supportcorridor", "GSB"]] call _fnc_saveToTemplate; 			//this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION. Format and localize function can be used for translation

["flag", "flag_NATO_F"] call _fnc_saveToTemplate; 						//this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "\x\A3A\addons\core\Pictures\Markers\Marker_GSB2022.paa"] call _fnc_saveToTemplate; 				//this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "flag_marker_gsb_rhs_22_var1"] call _fnc_saveToTemplate; 			//this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["ammobox", "B_supplyCrate_F"] call _fnc_saveToTemplate; 	//Don't touch or you die a sad and lonely death!
["surrenderCrate", "Box_NATO_Wps_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type
["equipmentBox", "Box_NATO_Equip_F"] call _fnc_saveToTemplate; //Changeing this from default will require you to define logistics attachement offset for the box type

["vehiclesBasic", ["B_Quadbike_01_F"]] call _fnc_saveToTemplate; 			//this line determines basic vehicles, the lightest kind available. -- Example: ["vehiclesBasic", ["B_Quadbike_01_F"]] -- Array, can contain multiple assets
["vehiclesLightUnarmed", ["gsb_rhs_22_m1151_olive", "gsb_rhs_22_m1152_olive", "gsb_rhs_22_m1152_TCV_olive"]] call _fnc_saveToTemplate; 		//this line determines light and unarmed vehicles. -- Example: ["vehiclesLightUnarmed", ["B_MRAP_01_F"]] -- Array, can contain multiple assets
["vehiclesLightArmed",["gsb_rhs_22_m1151_m2_v1_olive", "gsb_rhs_22_m1151_olive_pkm", "gsb_rhs_22_m1151_mk19_v1_olive"]] call _fnc_saveToTemplate; 		//this line determines light and armed vehicles -- Example: ["vehiclesLightArmed",["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"]] -- Array, can contain multiple assets
["vehiclesTrucks", ["gsb_rhs_22_ural_open", "gsb_rhs_22_ural", "rhsgref_cdf_b_gaz66", "rhsgref_cdf_b_gaz66o", "rhsgref_cdf_b_zil131", "rhsgref_cdf_b_zil131_open"]] call _fnc_saveToTemplate; 			//this line determines the trucks -- Example: ["vehiclesTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesCargoTrucks", ["gsb_rhs_22_ural_open", "gsb_rhs_22_ural", "rhsgref_cdf_b_gaz66", "rhsgref_cdf_b_gaz66o", "rhsgref_cdf_b_zil131", "rhsgref_cdf_b_zil131_open"]] call _fnc_saveToTemplate; 		//this line determines cargo trucks -- Example: ["vehiclesCargoTrucks", ["B_Truck_01_transport_F", "B_Truck_01_covered_F"]] -- Array, can contain multiple assets
["vehiclesRepairTrucks", ["gsb_rhs_22_ural_repair", "rhsgref_cdf_b_gaz66_repair"]] call _fnc_saveToTemplate; 		//this line determines repair trucks -- Example: ["vehiclesRepairTrucks", ["B_Truck_01_Repair_F"]] -- Array, can contain multiple assets
["vehiclesFuelTrucks", ["gsb_rhs_22_ural_fuel"]] call _fnc_saveToTemplate;		//this line determines fuel trucks -- Array, can contain multiple assets
["vehiclesIFVs", ["gsb_rhs_22_bmp2", "gsb_rhs_22_bmp2d", "KAP_gsb_22_M2A3", "KAP_gsb_22_M2A3_BUSKI", "KAP_gsb_22_M2A3_BUSKIII", "KAP_gsb_22_APC_Wheeled_01", "rhsgref_cdf_b_bmd1", "rhsgref_cdf_b_bmd1k", "rhsgref_cdf_b_bmd1p", "rhsgref_cdf_b_bmd1pk", "rhsgref_cdf_b_bmd2", "rhsgref_cdf_b_bmd2k", "rhsgref_cdf_b_bmp1", "rhsgref_cdf_b_bmp1d", "rhsgref_cdf_b_bmp1k", "rhsgref_cdf_b_bmp1p"]] call _fnc_saveToTemplate;				//this line determines IFVs
["vehiclesAirborne", ["gsb_rhs_22_m1151_m2_v1_olive", "gsb_rhs_22_m1151_olive_pkm", "gsb_rhs_22_BRDM2UM"]] call _fnc_saveToTemplate;


private _vehiclesAA = ["gsb_rhs_22_zsu234", "gsb_rhs_22_ural_Zu23", "rhsgref_cdf_b_gaz66_zu23"];
private _vehiclesLightAPCs = ["gsb_rhs_22_BRDM2UM", "gsb_rhs_22_BRDM2_HQ", "gsb_rhs_22_BRDM2"];
private _vehiclesAmmoTrucks = ["gsb_rhs_22_m1152_rsv_olive", "rhsgref_cdf_b_gaz66_ammo"];
private _vehiclesMedical = ["rhs_gaz66_ap2_msv"];
private _vehiclesAPCs = ["KAP_gsb_22_btr80", "rhsgref_cdf_b_btr70", "rhsgref_cdf_b_btr60"];
private _uavsAttack = ["B_UAV_02_dynamicLoadout_F"];
private _vehiclesTanks = ["gsb_rhs_22_t72ba_tv", "gsb_rhs_22_t72bb_tv", "KAP_gsb_22_t80ue1", "gsb_rhs_22_m1a1fep_od", "rhsgref_cdf_b_t80b_tv", "rhsgref_cdf_b_t80bv_tv", "rhsgref_cdf_b_t80u_tv", "rhsgref_cdf_b_t80uk_tv"];

if (isClass (configFile >> "CfgPatches" >> "ACM_CDF_GSFL")) then {
    _vehiclesAA append ["ACM_B_CDF_Vehicle_Nyx_AA"];
    _vehiclesLightAPCs append ["ACM_B_CDF_Vehicle_m113_unarmed", "ACM_B_CDF_Vehicle_m113_m2_90", "ACM_B_CDF_Vehicle_Nyx_AT", "ACM_B_CDF_Vehicle_Nyx_cannon"];
    _vehiclesAmmoTrucks append ["ACM_B_CDF_Vehicle_m113_supply"];
    _vehiclesMedical append ["ACM_B_CDF_Vehicle_m113_medical"];
    _vehiclesAPCs append ["ACM_B_CDF_Vehicle_BTR80a"];
    _uavsAttack append ["ACM_B_CDF_Vehicle_Air_UAV_CH3B"];
    _vehiclesTanks append ["ACM_B_CDF_Vehicle_t90a"];
};

["vehiclesAA", _vehiclesAA] call _fnc_saveToTemplate;
["vehiclesLightAPCs", _vehiclesLightAPCs] call _fnc_saveToTemplate;
["vehiclesAmmoTrucks", _vehiclesAmmoTrucks] call _fnc_saveToTemplate;
["vehiclesMedical", _vehiclesMedical] call _fnc_saveToTemplate;
["vehiclesAPCs", _vehiclesAPCs] call _fnc_saveToTemplate;
["uavsAttack", _uavsAttack] call _fnc_saveToTemplate;
["vehiclesTanks", _vehiclesTanks] call _fnc_saveToTemplate;


["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate; 	//this line determines transport boats -- Example: ["vehiclesTransportBoats", ["B_Boat_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesGunBoats", ["I_Boat_Armed_01_minigun_F"]] call _fnc_saveToTemplate; 			//this line determines gun boats -- Example: ["vehiclesGunBoats", ["B_Boat_Armed_01_minigun_F"]] -- Array, can contain multiple assets
["vehiclesAmphibious", ["KAP_gsb_22_APC_Wheeled_01"]] call _fnc_saveToTemplate; 		//this line determines amphibious vehicles  -- Example: ["vehiclesAmphibious", ["B_APC_Wheeled_01_cannon_F"]] -- Array, can contain multiple assets

["vehiclesPlanesCAS", ["KAP_GSB_22_Plane_Fighter_04", "rhsgref_cdf_b_su25", "rhs_l159_cdf_b_CDF"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA", ["KAP_GSB_22_Plane_Fighter_04", "rhsgref_cdf_b_mig29s", "rhs_l159_cdf_b_CDF"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport", ["RHS_C130J"]] call _fnc_saveToTemplate; 	//this line determines transport planes -- Example: ["vehiclesPlanesTransport", ["B_T_VTOL_01_infantry_F"]] -- Array, can contain multiple assets

["vehiclesHelisLight", ["KAP_GSB_22_UH1Y_UNARMED", "KAP_GSB_22_UH60M2_d"]] call _fnc_saveToTemplate; 		//this line determines light helis -- Example: ["vehiclesHelisLight", ["B_Heli_Light_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisTransport", ["KAP_GSB_22_UH60M2_d", "KAP_GSB_22_UH60M", "rhsgref_cdf_b_reg_Mi8amt"]] call _fnc_saveToTemplate; 	//this line determines transport helis -- Example: ["vehiclesHelisTransport", ["B_Heli_Transport_01_F"]] -- Array, can contain multiple assets
["vehiclesHelisLightAttack", ["KAP_GSB_22_UH1Y_FFAR", "KAP_GSB_22_UH1Y", "KAP_GSB_22_UH60M", "rhsgref_cdf_b_reg_Mi17Sh"]] call _fnc_saveToTemplate;		// this line determines light attack helicopters
["vehiclesHelisAttack", ["gsb_rhs_22_mi24g_CAS", "rhsgref_cdf_b_Mi24D", "rhsgref_cdf_b_Mi35"]] call _fnc_saveToTemplate; 		//this line determines attack helis -- Example: ["vehiclesHelisAttack", ["B_Heli_Attack_01_F"]] -- Array, can contain multiple assets

if (isClass (configFile >> "cfgPatches" >> "ACM_CDF_GSFL")) then {
    ["vehiclesArtillery", ["gsb_rhs_22_BM21", "rhsgref_cdf_b_2s1", "ACM_B_CDF_Vehicle_M109", "ACM_B_CDF_Vehicle_9K79", "ACM_B_CDF_Vehicle_9K79_K", "ACM_B_CDF_Vehicle_2S3"]] call _fnc_saveToTemplate;
    ["magazines", createHashMapFromArray [
    ["gsb_rhs_22_BM21", ["rhs_mag_m21of_1"]],
    ["rhsgref_cdf_b_2s1", ["rhs_mag_3of56_35"]],
    ["ACM_B_CDF_Vehicle_M109", ["rhs_mag_155mm_m795_28"]],
    ["ACM_B_CDF_Vehicle_9K79", ["1_Rnd_RHS_9M79_1_F"]],
    ["ACM_B_CDF_Vehicle_9K79_K", ["1_Rnd_RHS_9M79_1_K"]],
    ["ACM_B_CDF_Vehicle_2S3", ["rhs_mag_HE_2a33"]]
    ]] call _fnc_saveToTemplate;
    }
else
{
	["vehiclesArtillery", ["gsb_rhs_22_BM21", "rhsgref_cdf_b_2s1"]] call _fnc_saveToTemplate;
    ["magazines", createHashMapFromArray [
    ["gsb_rhs_22_BM21", ["rhs_mag_m21of_1"]],
    ["rhsgref_cdf_b_2s1", ["rhs_mag_3of56_35"]]
    ]] call _fnc_saveToTemplate;
};

["uavsPortable", ["B_UAV_01_F"]] call _fnc_saveToTemplate; 				//this line determines portable UAVs -- Example: ["uavsPortable", ["B_UAV_01_F"]] -- Array, can contain multiple assets

//Config special vehicles - militia vehicles are mostly used in the early game, police cars are being used by troops around cities -- Example:
["vehiclesMilitiaLightArmed", ["gsb_rhs_22_m1151_m2_v1_olive", "gsb_rhs_22_m1151_olive_pkm", "rhsgref_cdf_b_reg_uaz_dshkm", "rhsgref_cdf_b_reg_uaz_ags", "rhsgref_cdf_b_reg_uaz_spg9"]] call _fnc_saveToTemplate; //this line determines lightly armed militia vehicles -- Example: ["vehiclesMilitiaLightArmed", ["B_G_Offroad_01_armed_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaTrucks", ["gsb_rhs_22_ural_open", "gsb_rhs_22_ural", "rhsgref_cdf_b_gaz66", "rhsgref_cdf_b_gaz66o", "rhsgref_cdf_b_zil131", "rhsgref_cdf_b_zil131_open"]] call _fnc_saveToTemplate; 	//this line determines militia trucks (unarmed) -- Example: ["vehiclesMilitiaTrucks", ["B_G_Van_01_transport_F"]] -- Array, can contain multiple assets
["vehiclesMilitiaCars", ["gsb_rhs_22_m1151_olive", "gsb_rhs_22_m1152_olive", "gsb_rhs_22_m1152_TCV_olive"]] call _fnc_saveToTemplate; 		//this line determines militia cars (unarmed) -- Example: ["vehiclesMilitiaCars", ["B_G_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesMilitiaAPCs", ["gsb_rhs_22_m1151_m2_v1_olive", "gsb_rhs_22_m1151_olive_pkm", "rhsgref_cdf_b_reg_uaz_open", "rhsgref_cdf_b_reg_uaz"]] call _fnc_saveToTemplate;						//this line determines militia APCs

["vehiclesPolice", ["gsb_rhs_22_m1151_olive", "gsb_rhs_22_m1152_olive", "gsb_rhs_22_m1152_TCV_olive"]] call _fnc_saveToTemplate; 			//this line determines police cars -- Example: ["vehiclesPolice", ["B_GEN_Offroad_01_gen_F"]] -- Array, can contain multiple assets

["staticMGs", ["rhsgref_cdf_b_DSHKM"]] call _fnc_saveToTemplate; 					//this line determines static MGs -- Example: ["staticMG", ["B_HMG_01_high_F"]] -- Array, can contain multiple assets
["staticAT", ["rhsgref_cdf_b_SPG9M"]] call _fnc_saveToTemplate; 					//this line determinesstatic ATs -- Example: ["staticAT", ["B_static_AT_F"]] -- Array, can contain multiple assets
["staticAA", ["rhsgref_cdf_b_Igla_AA_pod", "rhsgref_cdf_b_ZU23"]] call _fnc_saveToTemplate; 					//this line determines static AAs -- Example: ["staticAA", ["B_static_AA_F"]] -- Array, can contain multiple assets
["staticMortars", ["rhsgref_cdf_b_reg_M252"]] call _fnc_saveToTemplate; 				//this line determines static mortars -- Example: ["staticMortars", ["B_Mortar_01_F"]] -- Array, can contain multiple assets
["staticHowitzers", ["rhsgref_cdf_b_reg_d30"]] call _fnc_saveToTemplate;							//this line determines static howitzers. Basically it's just a stronger mortar, use same syntax as above.

["mortarMagazineHE", "rhs_12Rnd_m821_HE"] call _fnc_saveToTemplate; 			//this line determines available HE-shells for the static mortars - !needs to be compatible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate; 		//this line determines smoke-shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] - ENTER ONLY ONE OPTION
["mortarMagazineFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;		//this line determines flare shells for the static mortar - !needs to be compatible with the mortar! -- Example: ["mortarMagazineSmoke", "8Rnd_82mm_Mo_Flare_white"] - ENTER ONLY ONE OPTION

["howitzerMagazineHE", "rhs_mag_3of56_10"] call _fnc_saveToTemplate;			//this line determines available HE-shells for the static howitzers - !needs to be compatible with the howitzer! -- same syntax as above - ENTER ONLY ONE OPTION

//Minefield definition
["minefieldAT", ["rhs_mine_tm62m"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["rhs_mine_m3_pressure"]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", [
    "WhiteHead_01",
    "WhiteHead_02",
    "WhiteHead_03",
    "WhiteHead_04",
    "WhiteHead_05",
    "WhiteHead_06",
    "WhiteHead_07",
    "WhiteHead_08",
    "WhiteHead_09",
    "WhiteHead_10",
    "WhiteHead_11",
    "WhiteHead_12",
    "WhiteHead_13",
    "WhiteHead_14",
    "WhiteHead_15",
    "WhiteHead_16",
    "WhiteHead_17",
    "WhiteHead_18",
    "WhiteHead_19",
    "WhiteHead_20",
    "WhiteHead_21"
]] call _fnc_saveToTemplate;
["voices", ["RHS_Male01RUS","RHS_Male02RUS","RHS_Male03RUS","RHS_Male04RUS","RHS_Male05RUS"]] call _fnc_saveToTemplate;

["insignia", ["insignia_gsb_1", "insignia_gsb_4", "insignia_gsb_2"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["slRifles", []];
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["designatedGrenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", []];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", []];
_loadoutData set ["AALaunchers", []];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["rhs_mine_pmn2_mag"]]; 					//this line determines the AT mines which can be carried by units -- Example: ["ATMine_Range_Mag"] -- Array, can contain multiple assets
_loadoutData set ["APMines", ["rhs_mine_m3_pressure_mag"]]; 					//this line determines the APERS mines which can be carried by units -- Example: ["APERSMine_Range_Mag"] -- Array, can contain multiple assets
_loadoutData set ["lightExplosives", ["rhs_ec75_mag", "rhs_ec200_sand_mag", "rhs_ec200_mag", "rhs_ec75_sand_mag"]]; 			//this line determines light explosives -- Example: ["DemoCharge_Remote_Mag"] -- Array, can contain multiple assets
_loadoutData set ["heavyExplosives", ["rhs_ec400_sand_mag", "rhs_ec400_mag"]]; 			//this line determines heavy explosives -- Example: ["SatchelCharge_Remote_Mag"] -- Array, can contain multiple assets

_loadoutData set ["antiInfantryGrenades", ["rhs_mag_rgd5", "rhs_mag_rgn", "rhs_mag_rgo"]]; 		//this line determines anti infantry grenades (frag and such) -- Example: ["HandGrenade", "MiniGrenade"] -- Array, can contain multiple assets
_loadoutData set ["antiTankGrenades", ["rhs_charge_tnt_x2_mag"]]; 			//this line determines anti tank grenades. Leave empty when not available. -- Array, can contain multiple assets
_loadoutData set ["smokeGrenades", ["rhssaf_mag_brd_m83_white"]];
_loadoutData set ["signalsmokeGrenades", ["rhssaf_mag_brd_m83_blue", "rhssaf_mag_brd_m83_green", "rhssaf_mag_brd_m83_orange", "rhssaf_mag_brd_m83_red", "rhssaf_mag_brd_m83_yellow"]];

//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];				//this line determines map
_loadoutData set ["watches", ["ItemWatch"]];		//this line determines watch
_loadoutData set ["compasses", ["ItemCompass"]];	//this line determines compass
_loadoutData set ["radios", ["ItemRadio"]];			//this line determines radio
_loadoutData set ["gpses", ["ItemGPS"]];			//this line determines GPS
_loadoutData set ["NVGs", ["rhs_1PN138", "rhsusf_ANPVS_14", "rhsusf_ANPVS_15"]];						//this line determines NVGs -- Array, can contain multiple assets
_loadoutData set ["binoculars", ["rhssaf_zrak_rd7j"]];		//this line determines the binoculars
_loadoutData set ["rangefinders", ["Rangefinder", "rhs_pdu4", "rhsusf_bino_lerca_1200_black", "rhsusf_bino_lerca_1200_tan"]];

_loadoutData set ["traitorUniforms", ["gsb_rhs_22_aaf_uni", "gsb_rhs_22_aaf_uni_ju", "gsb_rhs_22_aaf_uni_ss", "gsb_rhs_22_aaf_uni_sh2"]];		//this line determines traitor uniforms for traitor mission
_loadoutData set ["traitorVests", ["gsb_rhs_22_6b45", "gsb_rhs_22_6b45_light"]];			//this line determines traitor vesets for traitor mission
_loadoutData set ["traitorHats", ["gsb_rhs_22_m22_fieldcap","gsb_rhs_22_m22_fieldcap_tilted"]];			//this line determines traitor headgear for traitor missions

_loadoutData set ["officerUniforms", ["U_gsb_rhs_22_afg_winter", "U_gsb_rhs_22_afg_winter_boots"]];		//this line determines officer uniforms for assassination mission
_loadoutData set ["officerVests", ["rhs_gear_OFF"]];			//this line determines officer vesets for assassination mission
_loadoutData set ["officerHats", ["gsb_rhs_22_m22_fieldcap", "gsb_rhs_22_m22_fieldcap_tilted"]];	//this line determines officer headgear for assassination missions

_loadoutData set ["uniforms", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slUniforms", ["gsb_rhs_22_aaf_uni", "gsb_rhs_22_aaf_uni_ju", "gsb_rhs_22_aaf_uni_ss"]];
_loadoutData set ["vests", []];						//don't fill this line - this is only to set the variable
_loadoutData set ["Hvests", []];
_loadoutData set ["sniVests", ["rhsgref_chestrig", "rhsgref_chicom", "rhs_vydra_3m"]];
_loadoutData set ["backpacks", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["longRangeRadios", ["gsb_rhs_22_bp_RadioBag_01"]];
_loadoutData set ["atBackpacks", ["gsb_rhs_22_bp_carryall"]];
_loadoutData set ["helmets", []];					//don't fill this line - this is only to set the variable
_loadoutData set ["slHat", ["H_Beret_blk"]];
_loadoutData set ["sniHats", []];

_loadoutData set ["glasses", ["None"]];	//cosmetics
_loadoutData set ["goggles", ["None"]];		//cosmetics

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

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_sfLoadoutData set ["uniforms", ["gsb_rhs_22_aaf_uni", "gsb_rhs_22_aaf_uni_ju", "gsb_rhs_22_aaf_uni_ss"]];
_sfLoadoutData set ["vests", ["gsb_rhs_22_spcs_rifle", "gsb_rhs_22_spcs_TL", "gsb_rhs_22_spcs_SL", "gsb_rhs_22_spcs_sniper"]];
_sfLoadoutData set ["Hvests", ["gsb_rhs_22_spcs_saw", "gsb_rhs_22_spcs_mg"]];
_sfLoadoutData set ["backpacks", ["gsb_rhs_22_bp_compact", "gsb_rhs_22_bp_kitbag", "gsb_rhs_22_bp_carryall"]];
_sfLoadoutData set ["helmets", ["gsb_rhs_22_opscore_cover", "gsb_rhs_22_opscore_cover_pelt"]];
_sfLoadoutData set ["binoculars", ["rhsusf_bino_lerca_1200_black", "rhsusf_bino_lerca_1200_tan"]];

_sfLoadoutData set ["lightATLaunchers", [
["rhs_weap_smaw", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], [], ""],
["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_PG7VS_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_sfLoadoutData set ["missileATLaunchers", [
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""]
]];
_sfLoadoutData set ["AALaunchers", [
["rhs_weap_fim92", "", "", "", ["rhs_fim92_mag"], [], ""]
]];

_sfLoadoutData set ["slRifles", [
["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_m714_White"], ""]
]];
_sfLoadoutData set ["rifles", [
["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_mk17_STD", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk17_STD", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk17_STD", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"]
]];
_sfLoadoutData set ["carbines", [
["rhs_weap_mk18_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_mk18_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_mk18_KAC_bk", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_mk17_CQC", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk17_CQC", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk17_CQC", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"]
]];
_sfLoadoutData set ["grenadeLaunchers", [
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],

["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],

["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_nt4_black", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""]
]];

_sfLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_eotech_552", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_eotech_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""]
]];

_sfLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip_ris", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhsusf_100Rnd_556x45_M995_soft_pouch_coyote"], [], "rhsusf_acc_grip4_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhsusf_100Rnd_556x45_M995_soft_pouch_coyote"], [], "rhsusf_acc_grip4_bipod"],

["rhs_weap_m249_pip_ris", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch_coyote"], [], "rhsusf_acc_grip4_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch_coyote"], [], "rhsusf_acc_grip4_bipod"]
]];

_sfLoadoutData set ["marksmanRifles", [
["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_3515x50f1_md", ["rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_mk316_special_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_3515x50_md", ["rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_mk316_special_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25_ec", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_3515x50f1_h58", ["rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_mk316_special_Mag"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_5522x56_md", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_5522x56_md_sun", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],

["rhs_weap_XM2010_wd", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_5522x56_md", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_wd", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_5522x56_md_sun", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"]
]];
_sfLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "rhsusf_acc_omega9k", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_JHP", "rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Elite Loadout Data       //
/////////////////////////////////

private _eliteLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_eliteLoadoutData set ["uniforms", ["gsb_rhs_22_aaf_uni", "gsb_rhs_22_aaf_uni_ju", "gsb_rhs_22_aaf_uni_ss"]];
_eliteLoadoutData set ["vests", ["gsb_rhs_22_spcs_rifle", "gsb_rhs_22_spcs_TL", "gsb_rhs_22_spcs_SL", "gsb_rhs_22_spcs_sniper"]];
_eliteLoadoutData set ["Hvests", ["gsb_rhs_22_spcs_saw", "gsb_rhs_22_spcs_mg"]];
_eliteLoadoutData set ["backpacks", ["gsb_rhs_22_bp_carryall", "gsb_rhs_22_bp_compact", "gsb_rhs_22_bp_kitbag"]];
_eliteLoadoutData set ["helmets", ["gsb_rhs_22_opscore_cover", "gsb_rhs_22_opscore_cover_pelt"]];
_eliteLoadoutData set ["binoculars", ["rhsusf_bino_lerca_1200_black", "rhsusf_bino_lerca_1200_tan"]];

_eliteLoadoutData set ["lightATLaunchers", [
["rhs_weap_smaw", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], [], ""],
["rhs_weap_smaw_green", "", "", "rhs_weap_optic_smaw", ["rhs_mag_smaw_HEAA", "rhs_mag_smaw_HEDP"], [], ""],
["rhs_weap_rpg7", "", "", "rhs_acc_pgo7v3", ["rhs_rpg7_PG7VS_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_eliteLoadoutData set ["missileATLaunchers", [
["rhs_weap_fgm148", "", "", "", ["rhs_fgm148_magazine_AT"], [], ""]
]];
_eliteLoadoutData set ["AALaunchers", [
["rhs_weap_fim92", "", "", "", ["rhs_fim92_mag"], [], ""]
]];

_eliteLoadoutData set ["slRifles", [
["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_hk416d145_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_m714_White"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_m714_White"], ""]
]];
_eliteLoadoutData set ["rifles", [
["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_m4a1_blockII_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_m4a1_blockII_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"]
]];
_eliteLoadoutData set ["carbines", [
["rhs_weap_mk18_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_mk18_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_eotech_552", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_mk18_KAC_bk", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk18_KAC_wd", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], [], "rhsusf_acc_rvg_blk"],

["rhs_weap_mk17_CQC", "", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk17_CQC", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"],
["rhs_weap_mk17_CQC", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_20Rnd_SCAR_762x51_mk316_special", "rhs_mag_20Rnd_SCAR_762x51_m61_ap"], [], "rhsusf_acc_rvg_blk"]
]];
_eliteLoadoutData set ["grenadeLaunchers", [
["rhs_weap_hk416d145_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_hk416d145_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],

["rhs_weap_mk18_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_mk18_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],

["rhs_weap_hk416d10_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_compm4", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG3", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""],
["rhs_weap_hk416d10_m320", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhs_acc_rakursPM", ["rhs_mag_30Rnd_556x45_Mk262_PMAG", "rhs_mag_30Rnd_556x45_Mk318_PMAG"], ["rhs_mag_M433_HEDP"], ""]
]];
_eliteLoadoutData set ["SMGs", [
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_eotech_552", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_mrds", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""],
["rhsusf_weap_MP7A2", "rhsusf_acc_rotex_mp7", "", "rhsusf_acc_eotech_xps3", ["rhsusf_mag_40Rnd_46x30_AP"], [], ""]
]];

_eliteLoadoutData set ["machineGuns", [
["rhs_weap_m249_pip_ris", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhsusf_100Rnd_556x45_M995_soft_pouch_coyote"], [], "rhsusf_acc_grip4_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_ACOG", ["rhsusf_100Rnd_556x45_M995_soft_pouch_coyote"], [], "rhsusf_acc_grip4_bipod"],

["rhs_weap_m249_pip_ris", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch_coyote"], [], "rhsusf_acc_grip4_bipod"],
["rhs_weap_m249_light_S", "rhsusf_acc_SFMB556", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_su230a_mrds", ["rhsusf_100Rnd_556x45_M995_soft_pouch_coyote"], [], "rhsusf_acc_grip4_bipod"]
]];
_eliteLoadoutData set ["marksmanRifles", [
["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_3515x50f1_md", ["rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_mk316_special_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_3515x50_md", ["rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_mk316_special_Mag"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_sr25_ec", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_3515x50f1_h58", ["rhsusf_20Rnd_762x51_SR25_m993_Mag", "rhsusf_20Rnd_762x51_SR25_mk316_special_Mag"], [], "rhsusf_acc_harris_bipod"]
]];

_eliteLoadoutData set ["sniperRifles", [
["rhs_weap_XM2010", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_5522x56_md", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_5522x56_md_sun", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],

["rhs_weap_XM2010_wd", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_5522x56_md", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"],
["rhs_weap_XM2010_wd", "", "rhsusf_acc_anpeq15side_bk", "rhsusf_acc_nxs_5522x56_md_sun", ["rhsusf_5Rnd_300winmag_xm2010"], [], "rhsusf_acc_harris_bipod"]
]];
_eliteLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "acc_flashlight_pistol", "", ["rhsusf_mag_17Rnd_9x19_JHP", "rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militaryLoadoutData set ["uniforms", ["gsb_rhs_22_aaf_uni", "gsb_rhs_22_aaf_uni_ju", "gsb_rhs_22_aaf_uni_ss", "gsb_rhs_22_aaf_uni_sh2", "U_gsb_rhs_22_afg", "U_gsb_rhs_22_afg_boots", "U_gsb_rhs_22_6sh122", "U_gsb_rhs_22_6sh122_gloves"]];
_militaryLoadoutData set ["vests", ["gsb_rhs_22_6b45", "gsb_rhs_22_6b45_holster", "gsb_rhs_22_6b45_light", "gsb_rhs_22_6b45_off", "gsb_rhs_22_6b45_rifleman", "gsb_rhs_22_6b45_rifleman_2"]];
_militaryLoadoutData set ["Hvests", ["gsb_rhs_22_6b45_grn", "gsb_rhs_22_6b45_mg"]];
_militaryLoadoutData set ["backpacks", ["gsb_rhs_22_bp_kitbag", "gsb_rhs_22_bp_compact"]];
_militaryLoadoutData set ["helmets", ["gsb_rhs_22_6b7_1m", "gsb_rhs_22_6b7_1m_bala2", "gsb_rhs_22_6b7_1m_ess", "gsb_rhs_22_6b7_1m_flag", "gsb_rhs_22_6b7_1m_medic", "gsb_rhs_22_6b7_1m_cov", "gsb_rhs_22_6b7_1m_cov_bala2", "gsb_rhs_22_6b7_1m_cov_ess", "gsb_rhs_22_6b7_1m_cov_ess_bala", "gsb_rhs_22_6b47", "gsb_rhs_22_6b47_bala", "gsb_rhs_22_6b47_hs", "gsb_rhs_22_6b47_ess", "gsb_rhs_22_6b47_hsm"]];
_militaryLoadoutData set ["binoculars", ["rhssaf_zrak_rd7j", "rhsusf_bino_lrf_Vector21"]];

_militaryLoadoutData set ["lightATLaunchers", [
["rhs_weap_rpg7", "", "", "", ["rhs_rpg7_PG7VM_mag", "rhs_rpg7_OG7V_mag"], [], ""]
]];
_militaryLoadoutData set ["ATLaunchers", ["rhs_weap_rpg18", "rhs_weap_rpg26"]];
_militaryLoadoutData set ["AALaunchers", [
["rhs_weap_igla", "", "", "", ["rhs_mag_9k38_rocket"], [], ""]
]];

_militaryLoadoutData set ["slRifles", [
["rhs_weap_ak103", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""],

["rhs_weap_ak103", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""],

["rhs_weap_ak103", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VG40OP_white"], ""]
]];
_militaryLoadoutData set ["rifles", [
["rhs_weap_ak103", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],

["rhs_weap_ak103", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],

["rhs_weap_ak103", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_1_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak103_2_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak74m", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74m_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak74mr", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""]
]];
_militaryLoadoutData set ["carbines", [
["rhs_weap_ak104", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],
["rhs_weap_ak104_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], [], ""],

["rhs_weap_ak105", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_zenitco01", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""],
["rhs_weap_ak105_zenitco01_b33", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], [], ""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74mr_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_1p87", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""],

["rhs_weap_ak74mr_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhsusf_acc_T1_low", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""],

["rhs_weap_ak74mr_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak103_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak103_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_polymer_tracer"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak74m_gp25", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""],
["rhs_weap_ak74m_gp25_npz", "rhs_acc_dtk3", "rhs_acc_2dpZenit", "rhs_acc_okp7_picatinny", ["rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N22_AK"], ["rhs_VOG25", "rhs_VOG25P"], ""]
]];
_militaryLoadoutData set ["SMGs", [
["rhs_weap_aks74u", "rhs_acc_dtk3", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_dtk3", "", "rhs_acc_ekp8_02", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_dtk3", "", "rhs_acc_ekp1", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74u", "rhs_acc_dtk3", "", "rhs_acc_1p63", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];

_militaryLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_pkp", "", "", "rhs_acc_pkas", ["rhs_100Rnd_762x54mmR_7N26", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_rpk74m", "", "", "rhs_acc_1p63", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "", "", "rhs_acc_ekp1", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m", "", "", "rhs_acc_ekp8_02", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m_npz", "", "", "rhs_acc_rakursPM", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m_npz", "", "", "rhsusf_acc_su230a", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""],
["rhs_weap_rpk74m_npz", "", "", "optic_Hamr", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]];

_militaryLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svdp_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],

["rhs_weap_svds", "", "", "rhs_acc_pso1m21", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds_npz", "", "", "rhs_acc_dh520x56", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];

_militaryLoadoutData set ["sniperRifles", [
["rhs_weap_m24sws", "", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_M8541_low", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_M8541_mrds", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_premier_low", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_premier_mrds", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],

["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_M8541", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_M8541_low", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_M8541_mrds", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_premier_low", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_premier", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_premier_mrds", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_LEUPOLDMK4", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_LEUPOLDMK4_2", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"],
["rhs_weap_m24sws_wd", "", "", "rhsusf_acc_LEUPOLDMK4_2_mrds", ["rhsusf_5Rnd_762x51_m118_special_Mag", "rhsusf_5Rnd_762x51_m62_Mag"], [], "rhsusf_acc_harris_swivel"]
]];
_militaryLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "", "", ["rhsusf_mag_17Rnd_9x19_JHP", "rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_policeLoadoutData set ["uniforms", ["U_gsb_rhs_22_afg", "U_gsb_rhs_22_afg_boots"]];
_policeLoadoutData set ["vests", ["V_TacVest_oli", "rhs_lifchik_NCO", "rhs_gear_OFF"]];
_policeLoadoutData set ["helmets", ["gsb_rhs_22_m22_fieldcap", "gsb_rhs_22_m22_fieldcap_tilted", "H_Beret_blk"]];

_policeLoadoutData set ["SMGs", [
["rhs_weap_scorpion", "", "", "", ["rhsgref_20rnd_765x17_vz61"], [], ""],
["rhs_weap_aks74u", "rhs_acc_pgs64_74un", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_policeLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "", "", ["rhsusf_mag_17Rnd_9x19_JHP", "rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData; 
_militiaLoadoutData set ["uniforms", ["U_gsb_rhs_22_afg", "U_gsb_rhs_22_afg_boots"]];
_militiaLoadoutData set ["vests", ["V_TacVest_oli", "rhs_6sh46", "rhs_belt_AK", "rhs_belt_AK_back", "rhs_chicom", "rhs_chicom_khk", "rhs_lifchik_vog", "rhs_lifchik", "rhs_lifchik_light"]];
_militiaLoadoutData set ["Hvests", ["V_TacVest_oli"]];
_militiaLoadoutData set ["backpacks", ["gsb_rhs_22_bp_compact", "gsb_rhs_22_bp_kitbag"]];
_militiaLoadoutData set ["helmets", ["gsb_rhs_22_kaska_k93", "gsb_rhs_22_kaska_k93_medic", "gsb_rhs_22_kaska_k93M"]];

_militiaLoadoutData set ["ATLaunchers", ["rhs_weap_rpg18","rhs_weap_rpg26"]];

_militiaLoadoutData set ["slRifles", [
["rhs_weap_ak74n", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""],

["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VG40OP_white"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], ["rhs_VG40OP_white"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], ["rhs_VG40OP_white"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], ["rhs_VG40OP_white"], ""]
]];
_militiaLoadoutData set ["rifles", [
["rhs_weap_ak74n", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_akm", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""],
["rhs_weap_akmn", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""],
["rhs_weap_akms", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], [], ""]
]];
_militiaLoadoutData set ["carbines", [
["rhs_weap_aks74u", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData set ["grenadeLaunchers", [
["rhs_weap_ak74n_gp25", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], ["rhs_VOG25P"], ""],
["rhs_weap_akm_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], ["rhs_VOG25P"], ""],
["rhs_weap_akmn_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], ["rhs_VOG25P"], ""],
["rhs_weap_akms_gp25", "rhs_acc_dtkakm", "", "", ["rhs_30Rnd_762x39mm_bakelite", "rhs_30Rnd_762x39mm_bakelite_tracer"], ["rhs_VOG25P"], ""]
]];
_militiaLoadoutData set ["SMGs", [
["rhs_weap_aks74u", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""],
["rhs_weap_aks74un", "rhs_acc_dtk1983", "", "", ["rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_AK_green"], [], ""]
]];
_militiaLoadoutData set ["machineGuns", [
["rhs_weap_pkm", "", "", "", ["rhs_100Rnd_762x54mmR", "rhs_100Rnd_762x54mmR_green"], [], ""],
["rhs_weap_rpk74m", "rhs_acc_dtk1983", "", "", ["rhs_45Rnd_545X39_7N6M_AK", "rhs_45Rnd_545X39_AK_Green"], [], ""]
]];

_militiaLoadoutData set ["marksmanRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_militiaLoadoutData set ["sniperRifles", [
["rhs_weap_svdp", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""],
["rhs_weap_svds", "", "", "rhs_acc_pso1m2", ["rhs_10Rnd_762x54mmR_7N1", "rhs_10Rnd_762x54mmR_7N14"], [], ""]
]];
_militiaLoadoutData set ["sidearms", [
["rhsusf_weap_glock17g4", "", "", "", ["rhsusf_mag_17Rnd_9x19_JHP", "rhsusf_mag_17Rnd_9x19_FMJ"], [], ""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////


private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData; 
_crewLoadoutData set ["uniforms", ["U_gsb_rhs_22_6sh122_gloves", "U_gsb_rhs_22_6sh122"]];
_crewLoadoutData set ["vests", ["gsb_rhs_22_spcs_crew"]];
_crewLoadoutData set ["helmets", ["rhs_tsh4", "rhs_tsh4_bala", "rhs_tsh4_ess", "rhs_tsh4_ess_bala"]];


private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["U_gsb_rhs_22_6sh122_gloves"]];
_pilotLoadoutData set ["vests", ["gsb_rhs_22_6b45"]];
_pilotLoadoutData set ["helmets", ["rhs_zsh7a_mike", "rhs_zsh7a_mike_alt", "rhs_zsh7a_mike_green", "rhs_zsh7a_mike_green_alt"]];





/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////


private _squadLeaderTemplate = {
    [selectRandomWeighted ["helmets", 2, "slHat", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    [["slUniforms", "uniforms"] call _fnc_fallback] call _fnc_setUniform;

    [["slRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
    ["primary", 6] call _fnc_addMagazines;
    ["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_squadLeader_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 2] call _fnc_addItem;
    ["signalsmokeGrenades", 2] call _fnc_addItem;
    ["smokeGrenades", 2] call _fnc_addItem;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;
    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1.25]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    if (random 1 < 0.3) then {
        [["designatedGrenadeLaunchers", "grenadeLaunchers"] call _fnc_fallback] call _fnc_setPrimary;
        ["backpacks"] call _fnc_setBackpack;
    } else {
        ["grenadeLaunchers"] call _fnc_setPrimary;
    };
    
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["Hvests", "vests"] call _fnc_fallback] call _fnc_setVest;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    ["backpacks"] call _fnc_setBackpack;

    [selectRandom ["carbines", "rifles"]] call _fnc_setPrimary;
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
    [selectRandomWeighted [[], 1.5, "glasses", 0.75, "goggles", 1]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    [selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;
    [["atBackpacks", "backpacks"] call _fnc_fallback] call _fnc_setBackpack;

    [selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
    ["primary", 5] call _fnc_addMagazines;

    ["AALaunchers"] call _fnc_setLauncher;
    //TODO - Add a check if it's disposable.
    ["launcher", 3] call _fnc_addMagazines;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_aa_extras"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;
    ["antiInfantryGrenades", 1] call _fnc_addItem;
    ["smokeGrenades", 1] call _fnc_addItem;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["radios"] call _fnc_addRadio;
    ["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
    ["helmets"] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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

private _marksmanTemplate = {
    [selectRandomWeighted ["helmets", 2, "sniHats", 1]] call _fnc_setHelmet;
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
    [["sniVests","vests"] call _fnc_fallback] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;


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
    [selectRandomWeighted [[], 2, "glasses", 0.75, "goggles", 0.5]] call _fnc_setFacewear;
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
	["Sniper", _sniperTemplate, [], [_prefix]]
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
	["Sniper", _sniperTemplate, [], [_prefix]]
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
	["Sniper", _sniperTemplate, [], [_prefix]]
];

[_prefix, _unitTypes, _eliteLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate, [], ["other"]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
["other", [["Pilot", _crewTemplate, [], ["other"]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _officerTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate, [], ["other"]]], _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate, [], ["other"]]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;