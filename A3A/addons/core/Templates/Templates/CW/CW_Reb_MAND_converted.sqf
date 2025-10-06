///////////////////////////
//   Rebel Information   //
///////////////////////////

["name", "Mandalorian"] call _fnc_saveToTemplate;

["flag", "ls_flag_mandalorian"] call _fnc_saveToTemplate;
["flagTexture", "\LS_statics_props\flags\data\flag_mandalorian.paa"] call _fnc_saveToTemplate;
["flagMarkerType", "mando_marker_red"] call _fnc_saveToTemplate;

private _vehiclesData = call _fnc_createLoadoutData;

_vehiclesData set ["vehiclesBasic", ["CW_Quadbike"]];
_vehiclesData set ["vehiclesLightUnarmed", ["lsd_civ_lancerBike"]];
_vehiclesData set ["vehiclesLightArmed", ["CW_Offroad_Mando_HMG"]];
_vehiclesData set ["vehiclesTruck", ["CW_Mando_argon_transport"]];
_vehiclesData set ["vehiclesAT", ["CW_Offroad_Mando_AT"]];
_vehiclesData set ["vehiclesAA", ["CW_Ifrit_Mando_HMG"]];

_vehiclesData set ["vehiclesBoat", ["I_C_Boat_Transport_02_F"]];

_vehiclesData set ["vehiclesPlane", ["442_a10_plane_cas"]];

_vehiclesData set ["vehiclesCivCar", ["C_Offroad_01_F"]];
_vehiclesData set ["vehiclesCivTruck", ["C_Van_01_transport_F"]];
_vehiclesData set ["vehiclesCivHeli", []];
_vehiclesData set ["vehiclesCivBoat", ["C_Rubberboat"]];

_vehiclesData set ["staticMGs", ["3AS_HeavyRepeater_Unarmoured"]];
_vehiclesData set ["staticAT", ["3as_ParticleCannon"]];
_vehiclesData set ["staticAA", ["AA_Turret"]];
_vehiclesData set ["staticMortars", ["ls_merc_mortar"]];
_vehiclesData set ["staticMortarMagHE", "8Rnd_82mm_Mo_shells"];
_vehiclesData set ["staticMortarMagSmoke", "8Rnd_82mm_Mo_Smoke_white"];

_vehiclesData set ["minesAT", "ATMine_Range_Mag"];
_vehiclesData set ["minesAPERS", "APERSBoundingMine_Range_Mag"];

["vehiclesData", [
    _vehiclesData
]] call _fnc_saveVehiclesToTemplate;


["breachingExplosivesAPC", [["SWLW_clones_spec_demo_mag", 1], ["SWLW_clones_spec_breach_mag", 1]]] call _fnc_saveToTemplate;
["breachingExplosivesTank", [["SWLW_clones_spec_demo_mag", 1], ["SWLW_clones_spec_breach_mag", 2]]] call _fnc_saveToTemplate;

#include "CW_Reb_Vehicle_Attributes.sqf"

//////////////////////////////////////
//       Antistasi Plus Stuff       //
//////////////////////////////////////

["blackMarketStock", [
    ["3AS_StationaryTurret", 3000, "STATICAT", {tierWar > 3}],
    ["3as_XX9", 50000, "STATICMG", {tierWar > 8}],


    ["3AS_Barc", 1750, "CAR", {true}],
    ["3AS_BarcSideCar", 2050, "CAR", {true}],
	["3AS_ISP", 3000, "CAR", {true}],
	["3AS_ISP_Transport", 2500, "CAR", {true}],

    ["3AS_RTT", 6000, "APC", {true}],

    ["3AS_AAT_Woodland", 20000, "TANK", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["3AS_AAT_Desert", 20000, "TANK", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["3AS_AAT_Tropical", 20000, "TANK", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    ["3AS_AAT_Winter", 20000, "TANK", {tierWar > 5 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}}],
    
    ["3AS_RX200_Base", 30000, "AA", {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count (milbases + airportsX) > 0}],

    ["3as_arc_170_red", 40000, "PLANE", {tierWar > 7 && {{sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],

    ["3as_LAAT_Mk2", 25000, "HELI", {tierWar > 4 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}],
    ["3as_LAAT_Mk1", 35000, "HELI", {tierWar > 6 &&{ {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer} count airportsX > 0}}]
]] call _fnc_saveToTemplate;

///////////////////////////
//  Rebel Starting Gear  //
///////////////////////////

private _initialRebelEquipment = [
    "JLTS_DP23", "JLTS_DP23_mag",
    "ls_weapon_westar35sa_secondary","SWLW_westar35sa_Mag",
    ["ls_weapon_rps6_disposable", 5],
    ["SWLW_clones_spec_breach_mag", 10], ["SWLW_clones_spec_demo_mag", 3],
    "3AS_ThermalDetonator","SmokeShell",
    "SWLB_CEE_Recon_Lieutenant","SWLB_CEE_Officer_Tactical", // we could give them proper vests, but they might be getting removed from legion, so we'll be safe
    "ls_mandalorian_vizslaGrunt_helmet","ls_mandalorian_vizslaSergeant_helmet","ls_mandalorian_vizslaCaptain_helmet","ls_mandalorian_ordoGrunt_helmet","ls_mandalorian_ordoSergeant_helmet",
    "ls_mandalorian_standard_backpack", "ls_mandalorian_light_backpack", "ls_mandalorian_demo_backpack","ls_mandalorian_heavy_backpack","ls_mandalorian_medic_backpack",
    "SWLB_clone_commander_binocular_night"
];

if (A3A_hasTFAR) then {_initialRebelEquipment append ["tf_microdagr","SWLB_comlink_hush98","tf_anprc154"]};
if (A3A_hasTFAR && startWithLongRangeRadio) then {_initialRebelEquipment append ["ls_mandalorian_tro_backpack"]};
if (A3A_hasTFARBeta) then {_initialRebelEquipment append ["TFAR_microdagr","JLTS_clone_comlink","TFAR_anprc154"]};
if (A3A_hasTFARBeta && startWithLongRangeRadio) then {_initialRebelEquipment append ["JLTS_Clone_ARC_backpack"]};
["initialRebelEquipment", _initialRebelEquipment] call _fnc_saveToTemplate;

private _rebUniforms = [
    "ls_mandalorian_undersuit_uniform"
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
