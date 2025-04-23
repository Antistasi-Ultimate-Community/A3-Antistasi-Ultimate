///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "Rex's Clone Uprising"] call _fnc_saveToTemplate;

["flag", "ls_flag_republic"] call _fnc_saveToTemplate;
["flagTexture", "\LS_statics_props\flags\data\flag_republic.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "JLTS_flag_Rep"] call _fnc_saveToTemplate;

["vehiclesBasic", ["3AS_Barc"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["3AS_ISP_Transport"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["3AS_ISP"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["442_argon_transport","442_argon_covered"]] call _fnc_saveToTemplate;
["vehiclesAT", ["3as_saber_m1"]] call _fnc_saveToTemplate;
["vehiclesAA", ["3as_saber_m1Recon"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["3AS_BTLB_Bomber", "3AS_Republic_Transport_01"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["C_Offroad_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["C_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["3AS_HeavyRepeater_Unarmoured"]] call _fnc_saveToTemplate;
["staticAT", ["3as_ParticleCannon"]] call _fnc_saveToTemplate;
["staticAA", ["AA_Turret"]] call _fnc_saveToTemplate;
["staticMortars", ["3AS_Republic_Mortar"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["mineAT", "ATMine_Range_Mag"] call _fnc_saveToTemplate;
["mineAPERS", "APERSBoundingMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["SWLW_clones_spec_demo_mag", 1], ["SWLW_clones_spec_breach_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SWLW_clones_spec_demo_mag", 1], ["SWLW_clones_spec_breach_mag", 2]]] call _fnc_saveToTemplate;

#include "WM_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "SWLW_DC15s", "SWLW_DC15s_Mag",
    "ls_weapon_dc17sidearm","ls_mag_dc17sidearm",
    ["ls_weapon_rps6_disposable", 5],
    ["SWLW_clones_spec_breach_mag", 10], ["SWLW_clones_spec_demo_mag", 3],
    "3AS_ThermalDetonator","SmokeShell",
    "SWLB_clone_basic_armor","SWLB_clone_recon_armor","SWLB_clone_recon_nco_armor","SWLB_clone_assault_armor",
    "SWLB_clone_P2_helmet","SWLB_clone_501stTrooper_helmet","SWLB_clone_5thTrooper_helmet","SWLB_clone_74thTrooper_helmet","SWLB_clone_104thTrooper_helmet","SWLB_clone_187thTrooper_helmet","SWLB_clone_212thTrooper_helmet","SWLB_clone_21stTrooper_helmet","SWLB_clone_327thTrooper_helmet","SWLB_clone_332ndTrooper_helmet","SWLB_clone_41stTrooper_helmet","SWLB_clone_442ndTrooper_helmet","SWLB_clone_91stTrooper_helmet",
    "SWLB_clone_bag", "SWLB_clone_bag_belt","SWLB_clone_bag_leg",
    "SWLB_clone_binocular"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","SWLB_comlink","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["SWLB_clone_RTO_mini_backpack"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","SWLB_comlink","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["SWLB_clone_RTO_mini_backpack"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "SWLB_clone_uniform",
	"SWLB_clone_501stTrooper_Uniform",
	"SWLB_clone_5thTrooper_Uniform",
	"SWLB_clone_74thTrooper_Uniform",
	"SWLB_clone_104thTrooper_Uniform",
	"SWLB_clone_187thTrooper_Uniform",
	"SWLB_clone_212thTrooper_Uniform",
	"SWLB_clone_21stTrooper_Uniform",
	"SWLB_clone_327thTrooper_Uniform",
	"SWLB_clone_332ndTrooper_Uniform",
	"SWLB_clone_41stTrooper_Uniform",
	"SWLB_clone_442ndTrooper_Uniform",
	"SWLB_clone_91stTrooper_Uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform",
	"SWLB_clone_uniform"
];

private _dlcUniforms = [];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", [
	"SWLB_clone_P2_helmet",
	"SWLB_clone_501stTrooper_helmet",
	"SWLB_clone_5thTrooper_helmet",
	"SWLB_clone_74thTrooper_helmet",
	"SWLB_clone_104thTrooper_helmet",
	"SWLB_clone_187thTrooper_helmet",
	"SWLB_clone_212thTrooper_helmet",
	"SWLB_clone_21stTrooper_helmet",
	"SWLB_clone_327thTrooper_helmet",
	"SWLB_clone_332ndTrooper_helmet",
	"SWLB_clone_41stTrooper_helmet",
	"SWLB_clone_442ndTrooper_helmet",
	"SWLB_clone_91stTrooper_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet",
	"SWLB_clone_P2_helmet"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21"]] call _fnc_saveToTemplate;
["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["SWLB_clone_binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["ls_jn_goggles_facewear"]];
_loadoutData set ["goggles", ["lsd_gar_p1Interior_hud", "lsd_gar_p2Interior_hud", "SWLB_clone_p1_HUD", "SWLB_clone_p2_HUD"]];
_loadoutData set ["facemask", ["ls_misc_poncho_facewear", "ls_misc_poncho_partnerBlack_facewear", "ls_misc_poncho_partnerWhite_facewear", "ls_misc_poncho_sideStripeBlue_facewear", "ls_misc_poncho_sideStripeRed_facewear", "ls_misc_poncho_sideStripeWhite_facewear", "ls_misc_poncho_sideStripeBrown_facewear"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////

private _squadLeaderTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;

    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
    ["binoculars"] call _fnc_addBinoculars;
};

private _riflemanTemplate = {
    ["uniforms"] call _fnc_setUniform;
    [selectRandomWeighted [[], 1.25, "glasses", 1, "goggles", 0.75, "facemask", 1]] call _fnc_setFacewear;
    
    ["items_medical_standard"] call _fnc_addItemSet;
    ["items_miscEssentials"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _prefix = "militia";
private _unitTypes = [
    ["Petros", _squadLeaderTemplate],
    ["SquadLeader", _squadLeaderTemplate],
    ["Rifleman", _riflemanTemplate],
    ["staticCrew", _riflemanTemplate],
    ["Medic", _riflemanTemplate, [["medic", true]]],
    ["Engineer", _riflemanTemplate, [["engineer", true]]],
    ["ExplosivesExpert", _riflemanTemplate, [["explosiveSpecialist", true]]],
    ["Grenadier", _riflemanTemplate],
    ["LAT", _riflemanTemplate],
    ["AT", _riflemanTemplate],
    ["AA", _riflemanTemplate],
    ["MachineGunner", _riflemanTemplate],
    ["Marksman", _riflemanTemplate],
    ["Sniper", _riflemanTemplate],
    ["Unarmed", _riflemanTemplate]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
