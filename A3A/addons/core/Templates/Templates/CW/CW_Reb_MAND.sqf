///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "Mandalorian"] call _fnc_saveToTemplate;

["flag", "ls_flag_mandalorian"] call _fnc_saveToTemplate;
["flagTexture", "ls\core\addons\data\flags\flag_mandalorian_ca.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "mando_marker_red"] call _fnc_saveToTemplate;

["vehiclesBasic", ["CW_Quadbike"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed", ["ls_vehicle_105kLancer_civ"]] call _fnc_saveToTemplate;
["vehiclesLightArmed", ["CW_Offroad_Mando_HMG"]] call _fnc_saveToTemplate;
["vehiclesTruck", ["CW_Mando_argon_transport"]] call _fnc_saveToTemplate;
["vehiclesAT", ["CW_Offroad_Mando_AT"]] call _fnc_saveToTemplate;
["vehiclesAA", ["CW_Ifrit_Mando_HMG"]] call _fnc_saveToTemplate;

["vehiclesBoat", ["I_C_Boat_Transport_02_F"]] call _fnc_saveToTemplate;

["vehiclesPlane", ["ls_vehicle_z98"]] call _fnc_saveToTemplate;

["vehiclesCivCar", ["C_Offroad_01_F"]] call _fnc_saveToTemplate;
["vehiclesCivTruck", ["C_Van_01_transport_F"]] call _fnc_saveToTemplate;
["vehiclesCivHeli", []] call _fnc_saveToTemplate;
["vehiclesCivBoat", ["C_Rubberboat"]] call _fnc_saveToTemplate;

["staticMGs", ["3AS_HeavyRepeater_Unarmoured"]] call _fnc_saveToTemplate;
["staticAT", ["3as_ParticleCannon"]] call _fnc_saveToTemplate;
["staticAA", ["AA_Turret"]] call _fnc_saveToTemplate;
["staticMortars", ["ls_vehicle_mortar_mercenary"]] call _fnc_saveToTemplate;
["staticMortarMagHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;
["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["mineAT", "ATMine_Range_Mag"] call _fnc_saveToTemplate;
["mineAPERS", "APERSBoundingMine_Range_Mag"] call _fnc_saveToTemplate;

["breachingExplosivesAPC", [["ls_explosive_demoCharge_magazine", 1], ["ls_explosive_breachCharge_magazine", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["ls_explosive_demoCharge_magazine", 1], ["ls_explosive_breachCharge_magazine", 2]]] call _fnc_saveToTemplate;

#include "CW_Reb_Vehicle_Attributes.sqf"

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "JLTS_DP23", "JLTS_DP23_mag",
    "ls_weapon_westar35sa","ls_magazine_westar35sa",
    ["ls_weapon_rps6_loaded", 5],
    ["ls_explosive_breachCharge_magazine", 10], ["ls_explosive_demoCharge_magazine", 3],
    "3AS_ThermalDetonator","SmokeShell",
    "ls_vest_poncho","ls_vest_poncho_partnerBlack", "ls_vest_poncho_partnerWhite", "ls_vest_poncho_peaceBlue", "ls_vest_poncho_peaceGreen", "ls_vest_poncho_peaceRed", "ls_vest_poncho_sidestripeBlue", "ls_vest_poncho_sidestripeBrown", "ls_vest_poncho_sidestripeRed", "ls_vest_poncho_sidestripeWhite",
    "ls_mandalorianHelmet_eldarGrunt","ls_mandalorianHelmet_eldarSergeant","ls_mandalorianHelmet_ordoGrunt","ls_mandalorianHelmet_ordoSergeant", "ls_mandalorianHelmet_traditional",
    "ls_mandalorianBackpack", "ls_mandalorianBackpack_light", "ls_mandalorianBackpack_demo","ls_mandalorianBackpack_heavy","ls_mandalorianBackpack_medic",
    "JLTS_CloneBinocular_black"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","ls_radios_hush98","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["ls_mandalorianBackpack_radio"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","ls_radios_hush98","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["ls_mandalorianBackpack_radio"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "ls_mandalorianUniform"
];

private _dlcUniforms = [];

["uniforms", _rebUniforms + _dlcUniforms] call _fnc_saveToTemplate;

["headgear", []] call _fnc_saveToTemplate;

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
_loadoutData set ["binoculars", ["JLTS_CloneBinocular_black"]];

_loadoutData set ["uniforms", _rebUniforms];

_loadoutData set ["glasses", []];
_loadoutData set ["goggles", ["ls_clone_phase1_hud", "ls_clone_phase2_hud"]];
_loadoutData set ["facemask", []];

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
