///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "FIA"] call _fnc_saveToTemplate;

["flag", "FIA_Flag"] call _fnc_saveToTemplate;
["flagTexture", "\csla_misc\signs\flags\fia_flag.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "flag_FIA"] call _fnc_saveToTemplate;

["vehiclesBasic", ["CSLA_CIV_JARA250"]] call _fnc_saveToTemplate;
//["vehiclesBasic", []] call _fnc_saveToTemplate;
private _vehiclesLightUnarmed = ["FIA_AZU_para","FIA_BTR40"];
private _vehiclesLightArmed = ["FIA_BTR40_DSKM","FIA_AZU_DSKM","FIA_AZU_T21"];
["vehiclesTruck", ["CSLA_V3S"]] call _fnc_saveToTemplate;
private _vehiclesAT = [];
private _vehicleAA = [];

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["I_C_Plane_Civil_01_F","CSLA_CIV_An2_1"]] call _fnc_saveToTemplate;

private _vehiclesCivCar = ["CSLA_CIV_AZU"];
["vehiclesCivTruck", ["CSLA_CIV_V3S"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Boat_Civil_01_F", "C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["CSLA_UK59L_Stat"]] call _fnc_saveToTemplate;
["staticAT", ["CSLA_9K113_Stat"]] call _fnc_saveToTemplate;
private _staticAA = [];
["staticMortars", ["CSLA_M52_Stat"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "CSLA_8rnd_82EOM52"] call _fnc_saveToTemplate;
//["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;
//["staticMortarMagFlare", "8Rnd_82mm_Mo_Flare_white"] call _fnc_saveToTemplate;

["mineAT", "CSLA_PtMiBa3_mag"] call _fnc_saveToTemplate;
["mineAPERS", "CSLA_PPMiNa_mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["CSLA_IVZ", 1], ["CSLA_TNT0100g", 2]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["CSLA_IVZ", 1]]] call _fnc_saveToTemplate;

["vehiclesCivCar", _vehiclesCivCar] call _fnc_saveToTemplate;

["vehiclesLightUnarmed", _vehiclesLightUnarmed] call _fnc_saveToTemplate;
["vehiclesLightArmed", _vehiclesLightArmed] call _fnc_saveToTemplate;
["vehiclesAT", _vehiclesAT] call _fnc_saveToTemplate;

["vehiclesAA", _vehicleAA] call _fnc_saveToTemplate;
["staticAA", _staticAA] call _fnc_saveToTemplate;

//#include "Vanilla_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////
private _initialRebelEquipment = [
"CSLA_Pi75sr","CSLA_Pi75lr","CSLA_Pi82","CSLA_Pi52","CSLA_Sa61",
"CSLA_rSa61","CSLA_Sa24","CSLA_Sa26",
"CSLA_Pi75_15Rnd_9Luger","CSLA_Pi82_12rnd_9Pi82","CSLA_Pi52_8rnd_7_62Pi52","CSLA_Sa61_10rnd_7_65Pi27",
"CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa24_32rnd_7_62Pi52",
"CSLA_RG4o","CSLA_RG4u",
["CSLA_IVZ", 10], ["CSLA_TNT0100g", 10], ["CSLA_PPMiNa_mag", 6], ["CSLA_PtMiBa3_mag", 3],
"FIA_bpAlice","FIA_bpPack",
"FIA_grY_MG","FIA_grY_MPV","FIA_gr60_Sa58","FIA_gr85_Sa58","FIA_gr85_Sa61",
"CSLA_bino"
];


if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["tf_anprc155","tf_anprc155_coyote"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["TFAR_anprc155","TFAR_anprc155_coyote"]};
_initialRebelEquipment append ["Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow"];
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
		"FIA_uniwld",
		"FIA_uniwld2",
		"FIA_uniwld3",
		"FIA_uniwld4",
		"FIA_uniwld5",
		"FIA_uniwld6",
		"FIA_uniwld7",
		"FIA_uniwld8",
		"FIA_uniwld9",
		"FIA_uniwld10",
		"FIA_uniwld11",
		"FIA_uniwld12"
];

["uniforms", _rebUniforms] call _fnc_saveToTemplate;

["headgear", [
	"FIA_cap",
	"FIA_capGn",
	"FIA_capBk",
	"FIA_capClds",
	"FIA_capMlok",
	"FIA_hat85Gn",
	"FIA_hat85Clds",
	"FIA_hat85Mlok",
	"FIA_hat85bGn",
	"FIA_hat85bClds",
	"FIA_hat85bMlok"
]] call _fnc_saveToTemplate;

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_17","WhiteHead_18","WhiteHead_20","WhiteHead_21","WhiteHead_30"]] call _fnc_saveToTemplate;
["voices", ["CSLA_Male01CZ","CSLA_Male02CZ","CSLA_Male03CZ","CSLA_Male04CZ"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["binoculars", ["Binocular"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", ["G_Shades_Black", "G_Shades_Blue", "G_Shades_Green", "G_Shades_Red", "G_Aviator", "G_Spectacles", "G_Spectacles_Tinted", "G_Sport_BlackWhite", "G_Sport_Blackyellow", "G_Sport_Greenblack", "G_Sport_Checkered", "G_Sport_Red", "G_Squares", "G_Squares_Tinted"]];
_loadoutData set ["goggles", ["G_Lowprofile"]];
_loadoutData set ["facemask", ["G_Bandanna_blk", "G_Bandanna_oli", "G_Bandanna_khk", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator"]];

_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

////////////////////////
//  Rebel Unit Types  //
///////////////////////.

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
