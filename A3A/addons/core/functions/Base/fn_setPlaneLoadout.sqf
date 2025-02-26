params ["_plane", "_type"];

/*  Equips a plane with the needed loadout
    Params:
        _plane: OBJECT : The actual plane object
        _type: STRING : The type of attack plane, either "CAS", "CASDIVE" or "AA"
    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _validInput = false;
private _loadout = [];

private _mainGun = "";
private _rocketLauncher = [];
private _missileLauncher = [];
private _bombRacks = [];
private _diveParams = [];

private _cfgPath = (configfile >> "A3U" >> "planeLoadouts");
private _cfgAA = (_cfgPath >> "AA");
private _cfgCASDIVE = (_cfgPath >> "CASDIVE");
private _cfgCAS = (_cfgPath >> "CAS");
private _cfgAAClasses = _cfgAA call BIS_fnc_getCfgSubClasses;
private _cfgCASDIVEClasses = _cfgCASDIVE call BIS_fnc_getCfgSubClasses;
private _cfgCASClasses = _cfgCAS call BIS_fnc_getCfgSubClasses;


private _cfg = _cfgAAClasses + _cfgCASDIVEClasses + _cfgCASClasses ; // may be worth caching this on init, we'll see

if ((typeOf _plane) in _cfg) exitWith 
{
    switch (_type) do
    {	
	    case "CASDIVE":
        {
            _loadout = getArray (_cfgCASDIVE >> (typeOf _plane) >> "loadout");

            _mainGun            = [(_cfgCASDIVE >> (typeOf _plane)), "mainGun", ""] call BIS_fnc_returnConfigEntry;   //should be _cfgCASDIVE ?
            _rocketLauncher     = [(_cfgCASDIVE >> (typeOf _plane)), "rocketLauncher", []] call BIS_fnc_returnConfigEntry;
            _missileLauncher    = [(_cfgCASDIVE >> (typeOf _plane)), "missileLauncher", []] call BIS_fnc_returnConfigEntry;
            _bombRacks          = [(_cfgCASDIVE >> (typeOf _plane)), "bombRacks", []] call BIS_fnc_returnConfigEntry;
            _diveParams         = [(_cfgCASDIVE >> (typeOf _plane)), "diveParams", []] call BIS_fnc_returnConfigEntry;
        };
        case "CAS":
        {
            _loadout = getArray (_cfgCAS >> (typeOf _plane) >> "loadout");

            _mainGun            = [(_cfgCAS >> (typeOf _plane)), "mainGun", ""] call BIS_fnc_returnConfigEntry;
            _rocketLauncher     = [(_cfgCAS >> (typeOf _plane)), "rocketLauncher", []] call BIS_fnc_returnConfigEntry;
            _missileLauncher    = [(_cfgCAS >> (typeOf _plane)), "missileLauncher", []] call BIS_fnc_returnConfigEntry;
            _bombRacks          = [(_cfgCAS >> (typeOf _plane)), "bombRacks", []] call BIS_fnc_returnConfigEntry;
            _diveParams         = [(_cfgCAS >> (typeOf _plane)), "diveParams", []] call BIS_fnc_returnConfigEntry;
        };
        case "AA":
        {
            _loadout = getArray (_cfgAA >> (typeOf _plane) >> "loadout");

            _mainGun            = [(_cfgAA >> (typeOf _plane)), "mainGun", ""] call BIS_fnc_returnConfigEntry;
            _rocketLauncher     = [(_cfgAA >> (typeOf _plane)), "rocketLauncher", []] call BIS_fnc_returnConfigEntry;
            _missileLauncher    = [(_cfgAA >> (typeOf _plane)), "missileLauncher", []] call BIS_fnc_returnConfigEntry;
            _bombRacks          = [(_cfgAA >> (typeOf _plane)), "bombRacks", []] call BIS_fnc_returnConfigEntry;
            _diveParams         = [(_cfgAA >> (typeOf _plane)), "diveParams", []] call BIS_fnc_returnConfigEntry;
        };
    };
    if !(_mainGun isEqualTo "") then {
        _plane setVariable ["mainGun", _mainGun];
    };
    if !(_rocketLauncher isEqualTo []) then {
        _plane setVariable ["rocketLauncher", _rocketLauncher];
    };
    if !(_missileLauncher isEqualTo []) then {
        _plane setVariable ["missileLauncher", _missileLauncher];
    };
    if !(_bombRacks isEqualTo []) then {
        _plane setVariable ["bombRacks", _bombRacks];
    };
    if !(_diveParams isEqualTo []) then {
        _plane setVariable ["diveParams", _diveParams];
    } else {
        _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]]
    };

    if !(_loadout isEqualTo []) then
    {
        Debug("Selected new loadout for plane, now equiping plane with it");
        {
            _plane setPylonLoadout [_forEachIndex + 1, _x, true];
            _plane setVariable ["loadout", _loadout];
        } forEach _loadout;
    } else {
        _loadout = getPylonMagazines _plane; // hacky fix, but better than the alternative
        Debug(format["Selected default loadout for %1, now equiping plane with it. Consider giving it an actual loadout in ultimate\config\plane\cfgPlaneLoadouts.hpp", typeOf _plane]);
        {
            _plane setPylonLoadout [_forEachIndex + 1, _x, true];
            _plane setVariable ["loadout", _loadout];
        } forEach _loadout;
    };

    [format["Given plane class %1 a loadout of %2, from config", typeOf _plane, _loadout], _fnc_scriptName] call A3U_fnc_log;
};

if (_type == "CASDIVE") then
{
    _validInput = true;
    switch (typeOf _plane) do
    {
        //Vanilla NATO CAS (A-10)
        case "B_D_Plane_CAS_01_dynamicLoadout_lxWS";
        case "B_W_Plane_CAS_01_dynamicLoadout_F"; 
        case "B_T_Plane_CAS_01_dynamicLoadout_F";
        case "B_Plane_CAS_01_dynamicLoadout_F":
        {
            _loadout = ["","","","","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_BombCluster_03_F","","","",""];
            _plane setVariable ["mainGun", "Gatling_30mm_Plane_CAS_01_F"];
            _plane setVariable ["bombRacks", ["Bomb_04_Plane_CAS_01_F", "BombCluster_03_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla CSAT CAS
        case "Atlas_O_W_Plane_CAS_02_dynamicLoadout_ghex_F";
        case "O_T_Plane_CAS_02_dynamicLoadout_ghex_F";
        case "O_R_Plane_CAS_02_dynamicLoadout_F";
        case "O_R_Plane_CAS_02_dynamicLoadout_ard_F";
        case "O_Plane_CAS_02_dynamicLoadout_F":
        {
            _loadout = ["","","","","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_Bomb_03_F","","","",""];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["bombRacks", ["Bomb_03_Plane_CAS_02_F", "BombCluster_02_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };

        //Vanilla IND CAS
        case "O_A_Plane_Fighter_03_dynamicLoadout_F";
        case "Atlas_O_T_Plane_Fighter_03_dynamicLoadout_F";
        case "I_Plane_Fighter_03_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_12Rnd_missiles","PylonRack_3Rnd_LG_scalpel","PylonMissile_1Rnd_Mk82_F","PylonWeapon_300Rnd_20mm_shells","PylonMissile_1Rnd_Mk82_F","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_missiles"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
            _plane setVariable ["rocketLauncher", ["Rocket_04_AP_Plane_CAS_01_F"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_02_Plane_CAS_01_F", "missiles_SCALPEL"]];
            _plane setVariable ["bombRacks", ["Mk82BombLauncher"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla NATO JETS CAS
        case "Atlas_B_G_Plane_Fighter_01_F";
        case "Atlas_B_G_Plane_Fighter_01_ard_F";
        case "B_T_Plane_Fighter_01_F";
        case "B_USMC_Plane_Fighter_01_F";
        case "B_D_Plane_Fighter_01_F";
        case "B_Plane_Fighter_01_F":
        {
            _loadout = ["PylonRack_Bomb_SDB_x4","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_Bomb_GBU12_x1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["bombRacks", ["weapon_GBU12Launcher","weapon_SDBLauncher", "BombCluster_01_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla CSAT JETS CAS
        case "O_T_Plane_Fighter_02_ghex_F";
        case "O_R_Plane_Fighter_02_F";
        case "O_R_Plane_Fighter_02_ard_F";
        case "O_Plane_Fighter_02_F":
        {
            _loadout = ["PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_1Rnd_BombCluster_02_cap_F"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["bombRacks", ["weapon_KAB250Launcher","BombCluster_02_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla IND JETS CAS
        case "CUP_I_JAS_39_RACS";
        case "CUP_I_JAS_39_HIL";
        case "UK3CB_AAF_B_Gripen";
        case "Aegis_B_E_Plane_Fighter_04_F"; 
        case "Atlas_B_M_Plane_Fighter_04_F";
        case "I_Plane_Fighter_04_F":
        {
            _loadout = ["PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_Bomb_GBU12_x1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["bombRacks", ["BombCluster_01_F","weapon_GBU12Launcher"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla CSAT VTOL
        case "O_T_VTOL_02_vehicle_dynamicLoadout_F";
        case "O_T_VTOL_02_infantry_dynamicLoadout_F";
        case "O_VTOL_02_vehicle_dynamicLoadout_F";
        case "O_VTOL_02_infantry_dynamicLoadout_F":
        {
            _loadout = ["PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_BombCluster_02_cap_F"];
            _plane setVariable ["mainGun", "gatling_30mm_VTOL_02"];
            _plane setVariable ["bombRacks", ["Bomb_03_Plane_CAS_02_F","BombCluster_02_F"]];
            _plane setVariable ["diveParams", [800, 500, 180, 55, 20, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla JETS UAV
        case "B_UAV_05_F":
        {
            _loadout = ["PylonMissile_Bomb_GBU12_x1","PylonMissile_1Rnd_BombCluster_01_F"];
            _plane setVariable ["bombRacks", ["weapon_GBU12Launcher","BombCluster_01_F"]];
            _plane setVariable ["diveParams", [1000, 700, 180, 55, 25, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla UAV
        case "I_UAV_02_dynamicLoadout_F";
        case "O_UAV_02_dynamicLoadout_F";
        case "B_UAV_02_dynamicLoadout_F":
        {
            _loadout = ["PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_BombCluster_03_F"];
            _plane setVariable ["bombRacks", ["Mk82BombLauncher","BombCluster_03_F"]];
            _plane setVariable ["diveParams", [600, 400, 180, 55, 25, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Aegis F-35
        case "Atlas_B_A_Plane_Fighter_05_ard_F";
        case "Atlas_B_A_Plane_Fighter_05_trp_F";
        case "B_A_Plane_Fighter_05_F";
        case "B_A_Plane_Fighter_05_tna_F";
        case "B_A_Plane_Fighter_05_wdl_F";
        case "B_Plane_Fighter_05_F";
        case "B_T_Plane_Fighter_05_F";
        case "B_W_Plane_Fighter_05_F";
        case "Atlas_I_I_Plane_Fighter_05_F";
        case "Atlas_B_A_Plane_Fighter_05_F": 
        {
            _loadout = ["PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_Bomb_GBU12_x1","PylonRack_Bomb_SDB_x4","PylonMissile_Bomb_AGM_154_x1"/* ,"PylonWeapon_220Rnd_25mm_shells" */];
            _plane setVariable ["mainGun", "gatling_25mm"];
            _plane setVariable ["bombRacks", ["weapon_GBU12Launcher","BombCluster_01_F","weapon_AGM_154Launcher","weapon_SDBLauncher"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //RHS US CAS (A-10)
        case "RHS_A10";
        case "UK3CB_CW_US_B_EARLY_A10":
        {
            _loadout = ["rhs_mag_ANALQ131","","","","rhs_mag_gbu12","","rhs_mag_cbu87","","","","rhs_mag_aim9m_2","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x16"];
            _plane setVariable ["mainGun", "RHS_weap_gau8"];
            _plane setVariable ["bombRacks", ["rhs_weap_gbu12", "rhs_weap_cbu87"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //RHS CDF L-159
        case "rhs_l159_cdf_b_CDF":
        {
            _loadout = ["rhs_mag_Sidewinder","","rhs_mag_mk82","rhs_mag_zpl20_hei","rhs_mag_mk82","","rhs_mag_Sidewinder","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "RHS_weap_zpl20"];
            _plane setVariable ["bombRacks", ["rhs_weap_mk82"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "UK3CB_AAF_O_Su25SM";
        case "RHS_Su25SM_vvsc";
        case "RHS_Su25SM_CAS_vvs";
        case "rhsgref_cdf_b_su25";
        case "UK3CB_TKA_B_Su25SM_CAS";
        case "UK3CB_LDF_B_Su25SM_CAS";
        case "UK3CB_ADA_I_Su25SM_CAS";
        case "UK3CB_KDF_B_Su25SM_CAS";
        case "UK3CB_ARD_O_Su25SM_CAS";
        case "UK3CB_CW_SOV_O_LATE_Su25SM_CAS":
        {
            _loadout = ["rhs_mag_ofab250","rhs_mag_fab250","","","","","","","rhs_mag_R60M","rhs_mag_R60M","rhs_ASO2_CMFlare_Chaff_Magazine_x4"];
            _plane setVariable ["mainGun", "rhs_weap_gsh302"];
            _plane setVariable ["bombRacks", ["rhs_weap_fab250", "rhs_weap_ofab250"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "rhssaf_airforce_l_18":
        {
            _loadout = ["rhs_mag_bd3_usk_a_o25l_s25o","rhs_mag_bd3_usk_a_o25l_s25of","","","rhs_mag_R60M_APU60","rhs_mag_R60M_APU60","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "rhs_weap_gsh301"];
            _plane setVariable ["bombRacks", ["rhs_weap_s25", "rhs_weap_s25of"]];
            _plane setVariable ["diveParams", [1000, 600, 200, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        ///S.O.G. nickel steel
        case "vnx_b_air_ac119_04_01_noinsignia";
        case "vnx_b_air_ac119_04_01":
        {
            _loadout = ["vn_bomb_15000_blu82_dc_parachute_mag_x1"]; //"vn_v_launcher_mk24"
            _plane setVariable ["bombRacks", ["vn_bomb_blu82_dc_parachute_launcher"]];
            _plane setVariable ["diveParams", [1200, 800, 170, 55, 20, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        ///S.O.G.
        case "vn_b_air_f4c_at_noinsignia";
        case "vn_b_air_f4c_at":
        {
            _loadout = ["","","vn_bomb_500_mk82_he_mag_x1","vn_bomb_750_blu1b_fb_mag_x1","","","","","","",""];
            _plane setVariable ["bombRacks", ["vn_bomb_mk82_he_launcher","vn_bomb_blu1b_750_fb_launcher"]];
            _plane setVariable ["diveParams", [1000, 600, 170, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "vn_b_air_f100d_at_noinsignia";
        case "vn_b_air_f100d_at":
        {
            _loadout = ["","","vn_fuel_f100_335_mag","vn_fuel_f100_335_mag","vn_bomb_500_blu1b_fb_mag_x1","vn_bomb_500_mk82_he_mag_x1"];
            _plane setVariable ["mainGun", "vn_m39a1_v_quad"];
            _plane setVariable ["bombRacks", ["vn_bomb_blu1b_500_fb_launcher", "vn_bomb_mk82_he_launcher"]];
            _plane setVariable ["diveParams", [1000, 600, 170, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "vn_o_air_mig19_at_noinsignia";
        case "vn_o_air_mig19_at":
        {
            _loadout = ["","","vn_bomb_500_fab250_he_mag_x1","vn_bomb_500_fab250_he_mag_x1"];
            _plane setVariable ["mainGun", "vn_nr30_v_01"];
            _plane setVariable ["bombRacks", ["vn_bomb_500_fab250_he_mag_x1"]];
            _plane setVariable ["diveParams", [1000, 600, 170, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "vn_o_air_mig21_cas_noinsignia";
        case "vn_o_air_mig21_cas":
        {
            _loadout = ["vn_bomb_500_fab250_he_mag_x1","vn_bomb_500_fab250_he_mag_x1","vn_gunpod_gsh23l_v_200_mag"];
            _plane setVariable ["mainGun", "vn_gunpod_gsh23l"];
            _plane setVariable ["bombRacks", ["vn_bomb_fab250_he_launcher"]];
            _plane setVariable ["diveParams", [1000, 600, 170, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "RHSGREF_A29B_HIDF":
        {
            _loadout = ["","rhs_mag_mk82","","rhs_mag_mk82","","rhsusf_ANALE40_CMFlare_Magazine_x2"];
            _plane setVariable ["mainGun", "rhs_weap_M3W_A29"];
            _plane setVariable ["bombRacks", ["rhs_weap_planeAI"]];
            _plane setVariable ["diveParams", [1000, 600, 170, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "UK3CB_B_Mystere_HIDF_CAS1";
        case "UK3CB_MDF_B_Mystere_CAS1":
        {
            _loadout = ["","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Mk82_F",""];
            _plane setVariable ["mainGun", "uk3cb_mystere_cannon_30mm"];
            _plane setVariable ["bombRacks", ["Mk82BombLauncher"]];
            _plane setVariable ["diveParams", [1000, 600, 185, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "UK3CB_TKA_B_L39_PYLON";
        case "UK3CB_AAF_B_L39_PYLON";
        case "UK3CB_KRG_B_L39_PYLON";
        case "UK3CB_LDF_B_L39_PYLON":
        {
            _loadout = ["PylonRack_1Rnd_AAA_missiles","","PylonMissile_1Rnd_Mk82_F","PylonWeapon_300Rnd_20mm_shells","PylonMissile_1Rnd_BombCluster_01_F","","PylonRack_1Rnd_AAA_missiles"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
            _plane setVariable ["bombRacks", ["Mk82BombLauncher", "BombCluster_01_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "UK3CB_CW_SOV_O_LATE_MIG21_AT";
        case "UK3CB_TKA_B_MIG21_AT":
        {
            _loadout = ["rhs_mag_ofab250_bd3_umk2a","","","rhs_mag_fab250_bd3_umk2a"];
            _plane setVariable ["mainGun", "uk3cb_mig21_GSh23L_23mm"];
            _plane setVariable ["bombRacks", ["rhs_weap_ofab250","rhs_weap_fab250"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        // CWR aircraft
		case "cwr3_o_mig27":
        {
            _loadout = ["PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1"];
            _plane setVariable ["mainGun", "cwr3_vacannon_gsh306"];
            _plane setVariable ["bombRacks", ["weapon_KAB250Launcher"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)

        };
		case "cwr3_o_su17m4":
        {
            _loadout = ["PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_BombCluster_02_cap_F"];
            _plane setVariable ["mainGun", "cwr3_vacannon_nr30_veh"];
            _plane setVariable ["bombRacks", ["BombCluster_02_F","weapon_KAB250Launcher"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
		case "cwr3_b_frs1":
        {
            _loadout = ["CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M","CUP_PylonPod_1Rnd_GBU12_M"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GAU12_veh"];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_GBU12_veh"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
		// cup aircraft
        case "CUP_I_L39_AAF";
        case "CUP_O_L39_TK";
        case "CUP_B_L39_CZ":
        {
            _loadout = ["","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_FAB250_plane_M",""];
            _plane setVariable ["mainGun", "CUP_Vacannon_GSh23L_L39"];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_KAB250_veh","CUP_Vblauncher_Fab250_veh"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)

        };
        case "cwr3_o_su25";
		case "cwr3_tdf_su25";
		case "CUP_B_Su25_Dyn_CDF";
        case "CUP_O_Su25_Dyn_RU";
        case "CUP_O_Su25_Dyn_SLA";
        case "CUP_O_Su25_Dyn_TKA":
        {
            _loadout = ["","","","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_FAB250_plane_M","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_Bomb_03_F","","",""];
            _plane setVariable ["mainGun", "CUP_Vacannon_GSh302K_veh"];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_Fab250_veh","CUP_Vblauncher_KAB250_veh","BombCluster_02_F","Bomb_03_Plane_CAS_02_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "CUP_I_SU34_AAF";
        case "CUP_B_SU34_CDF";
        case "CUP_O_SU34_RU";
        case "CUP_O_SU34_SLA":
        {
            _loadout = ["","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_R73_Vympel"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GSh301_veh"];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_Fab250_veh","CUP_Vblauncher_KAB250_veh","CUP_Vblauncher_Fab250_veh","CUP_Vblauncher_KAB250_veh","CUP_Vblauncher_Fab250_veh","CUP_Vblauncher_KAB250_veh","CUP_Vblauncher_Fab250_veh","CUP_Vblauncher_KAB250_veh","CUP_Vblauncher_Fab250_veh","CUP_Vblauncher_KAB250_veh"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
		case "cwr3_b_a10";
        case "CUP_B_A10_DYN_USA":
        {
            _loadout = ["","","","","CUP_PylonPod_3Rnd_Mk82_M","CUP_PylonPod_3Rnd_GBU12_M","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_BombCluster_01_F","","",""];
            _plane setVariable ["mainGun", "CUP_Vacannon_GAU8_veh"];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_Mk82_veh","CUP_Vblauncher_GBU12_veh","BombCluster_03_F","BombCluster_01_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "CUP_B_GR9_DYN_GB":
        {
            _loadout = ["","","PylonWeapon_300Rnd_20mm_shells","CUP_PylonPod_3Rnd_GBU12_M","PylonMissile_1Rnd_BombCluster_01_F","CUP_PylonPod_3Rnd_Mk82_M","","",""];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm_gunpod"];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_GBU12_veh","BombCluster_01_F","CUP_Vblauncher_Mk82_veh"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "CUP_I_AV8B_DYN_AAF";
        case "CUP_B_AV8B_DYN_USMC":
        {
            _loadout = ["","","120Rnd_CMFlare_Chaff_Magazine","CUP_PylonPod_3Rnd_GBU12_M","CUP_PylonPod_3Rnd_Mk82_M","PylonMissile_1Rnd_BombCluster_01_F",""];
            _plane setVariable ["mainGun", "CUP_Vacannon_GAU12_veh"];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_GBU12_veh","CUP_Vblauncher_Mk82_veh","BombCluster_01_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Unsung
        case "uns_Mig21_CAS":
        {
            _loadout = ["","uns_pylonRack_1Rnd_Bomb_RBK250","uns_pylonRack_1Rnd_Bomb_RBK500","uns_pylonRack_1Rnd_Napalm_ZB360","uns_pylonRack_1Rnd_Bomb_kab500","uns_pylonRack_1Rnd_Napalm_ODAB500",""];
            _plane setVariable ["mainGun", "uns_NR30"];
            _plane setVariable ["bombRacks", ["uns_napalm_z360_launcher_dl","uns_rbk250launcher_dl","uns_rbk500launcher_dl","uns_kab500launcher_dl","uns_napalm_odab500_launcher_dl"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "uns_A1J_CAS":
        {
            _loadout = ["Uns_720Rnd_Skyraider_4x20mm_HEI","uns_pylonRack_1Rnd_Bomb_CBU24","uns_pylonRack_6Rnd_Bomb_CBU14A","uns_pylonRack_1Rnd_Bomb_CBU75","uns_pylonRack_6Rnd_Bomb_CBU22","uns_pylonRack_1Rnd_Bomb_CBUM1A","uns_pylonRack_6Rnd_Bomb_CBU25","uns_pylonRack_1Rnd_Bomb_CBU32A","uns_pylonRack_1Rnd_Bomb_Napalm_Blu1","uns_pylonRack_1Rnd_Bomb_CBU32B","uns_pylonRack_1Rnd_Bomb_CBUM1A","uns_pylonRack_1Rnd_Bomb_MK83","uns_pylonRack_1Rnd_Bomb_MK81snake","uns_pylonRack_1Rnd_Bomb_MK82snake","uns_pylonRack_1Rnd_Bomb_MK82","uns_pylonRack_1Rnd_Bomb_M47"];
            _plane setVariable ["mainGun", "uns_Uns_M2_4x20mm"];
            _plane setVariable ["bombRacks", ["Uns_CBU14ALauncher_dl","Uns_CBUM1ALauncher_dl","Uns_CBU24Launcher_dl","Uns_CBU75Launcher_dl","Uns_CBU22Launcher_dl","Uns_CBU25Launcher_dl","Uns_CBU32ALauncher_dl","Uns_Napalm_blu1_Launcher_dl","Uns_CBU32BLauncher_dl","Uns_Mk83Launcher_dl","uns_MK81SnakeLauncher_dl","uns_MK82SnakeLauncher_dl","Uns_Mk82Launcher_dl","Uns_M47WPLauncher_dl"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "uns_A7_CAS":
        {
            _loadout = ["uns_1030Rnd_M61_HEI","120Rnd_CMFlare_Chaff_Magazine","Laserbatteries","uns_pylonRack_a7_6Rnd_Bomb_Napalm_500","uns_pylonRack_a7_6Rnd_Bomb_CBU100","uns_pylonRack_1Rnd_Bomb_MK84","uns_pylonRack_1Rnd_Bomb_CBU24","uns_pylonRack_1Rnd_Bomb_M47","uns_pylonRack_1Rnd_Bomb_Napalm_750","",""];
            _plane setVariable ["mainGun", "uns_M61A1"];
            _plane setVariable ["bombRacks", ["Uns_NapalmLauncher_500_dl","Uns_CBU100Launcher_dl","Uns_Mk84Launcher_dl","Uns_CBU24Launcher_dl","Uns_M47WPLauncher_dl","Uns_NapalmLauncher_750_dl"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "uns_A6_Intruder_CAS":
        {
            _loadout = ["uns_pylonRack_1Rnd_Bomb_GBU8","uns_pylonRack_1Rnd_Bomb_MK84","uns_pylonRack_a7_3Rnd_Bomb_MK83"];
            _plane setVariable ["bombRacks", ["Uns_GBU8Launcher_dl","Uns_Mk84Launcher_dl","Uns_Mk83Launcher_dl"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "uns_F4J_CAS":
        {
            _loadout = ["uns_pylonRack_1Rnd_Bomb_GBU8","uns_pylonRack_f4_3Rnd_Bomb_Napalm_750","uns_pylonRack_1Rnd_Bomb_MK84"];
            _plane setVariable ["bombRacks", ["Uns_NapalmLauncher_750_dl","Uns_GBU8Launcher_dl","Uns_Mk84Launcher_dl"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "Tornado_AWS_camo_ger": //where is this from?
        {
            _loadout = ["Tornado_AWS_ECMpod_1rnd_M","FIR_IRIS_T_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_Litening_std_P_1rnd_M","FIR_Brimstone_DM_type1_P_3rnd_M","FIR_Brimstone_DM_type1_P_3rnd_M","FIR_GBU12_P_1rnd_M","FIR_Brimstone_DM_type2_P_3rnd_M","FIR_Brimstone_DM_type2_P_3rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_IRIS_T_P_1rnd_M","Tornado_AWS_AIRCMpod_1rnd_M","FIR_BK27_R_M","FIR_BK27_L_M"];
            _plane setVariable ["mainGun", "Tornado_AWS_CANNON_W"];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_KAB250_veh","CUP_Vblauncher_Fab250_veh"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        // IFA planes
        case "LIB_Ju87_w";
        case "LIB_DAK_Ju87";		
        case "LIB_Ju87": {
            _loadout = ["LIB_1Rnd_SC50","LIB_1Rnd_SC50","LIB_1Rnd_SC500","LIB_1Rnd_SC50","LIB_1Rnd_SC50"];
            _plane setVariable ["mainGun", "LIB_2xMG151_JU87"];
            _plane setVariable ["bombRacks", ["LIB_SC500_Bomb_Mount","LIB_SC50_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [15, -2]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "LIB_Pe2_w";
        case "LIB_Pe2": {
            _loadout = ["LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250"];
            _plane setVariable ["mainGun", "LIB_UBK_PE2"];
            _plane setVariable ["bombRacks", ["LIB_FAB250_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [12, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };		
        case "LIB_P47": {
            _loadout = ["LIB_4000Rnd_M2_P47","LIB_4000Rnd_M2_P47","LIB_4000Rnd_M2_P47","LIB_4000Rnd_M2_P47","LIB_6Rnd_M8_P47","LIB_6Rnd_M8_P47","LIB_1Rnd_US_500lb","LIB_1Rnd_US_500lb","LIB_1Rnd_US_500lb"];
            _plane setVariable ["mainGun", "LIB_8xM2_P47"];
            _plane setVariable ["rocketLauncher", ["LIB_M8_Launcher_P47"]];
            _plane setVariable ["bombRacks", ["LIB_US_500lb_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        // SPE planes
        case "SPE_FW190F8_noinsignia";
        case "SPE_FW190F8": {
            _loadout = ["SPE_250Rnd_MG151","SPE_250Rnd_MG151","SPE_400Rnd_MG131","SPE_400Rnd_MG131","SPE_1Rnd_SC50","SPE_1Rnd_SC50","SPE_1Rnd_SC500","SPE_1Rnd_SC50","SPE_1Rnd_SC50"];
            _plane setVariable ["mainGun", "SPE_2xMG151"];
            _plane setVariable ["bombRacks", ["SPE_SC500_Bomb_Mount","SPE_SC50_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "SPE_P47_noinsignia";
        case "SPE_P47": {
            _loadout = ["SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_3Rnd_M8_P47","SPE_3Rnd_M8_P47","SPE_1Rnd_US_500lb","SPE_1Rnd_US_500lb","SPE_1Rnd_US_500lb"];
            _plane setVariable ["mainGun", "SPE_8xM2_P47"];
            _plane setVariable ["rocketLauncher", ["SPE_M8_Launcher_P47"]];
            _plane setVariable ["bombRacks", ["SPE_US_500lb_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
		// Clone Wars Planes (3AS)
        case "3AS_ARC_170_Red";
		case "3AS_ARC_170_Yellow";
        case "3AS_ARC_170_Orange";
        case "3AS_ARC_170_Green";
        case "3AS_ARC_170_Blue":
        {
            _loadout = ["","","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_BombCluster_01_F","",""];
            _plane setVariable ["mainGun", "3as_ARC_Light_Canon"];
            _plane setVariable ["bombRacks", ["Bomb_04_Plane_CAS_01_F","BombCluster_01_F"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "3AS_BTLB_Bomber";
        case "3AS_BTLB_Bomber_Shadow";
        case "3AS_BTLB_Bomber_RedLeader";
        case "3AS_BTLB_Bomber_Shadow":
        {
            _loadout = ["3as_PylonRack_ARC_1Rnd_EMP","3as_PylonRack_ARC_1Rnd_EMP","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_BombCluster_01_F","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_BombCluster_03_F"];
            _plane setVariable ["mainGun", "3AS_BTLB_SW4_Ion_Cannon"];
            _plane setVariable ["bombRacks", ["3AS_ARC_EMP","Bomb_04_Plane_CAS_01_F","BombCluster_01_F","Mk82BombLauncher","BombCluster_03_F"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
		//FFAA Planes
        case "ffaa_ar_harrier":
        {
            _loadout = ["","PylonMissile_Bomb_GBU12_x1","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_Mk82_F",""];
            _plane setVariable ["mainGun", "ffaa_cannon_gau12"];
            _plane setVariable ["bombRacks", ["Mk82BombLauncher","weapon_GBU12Launcher","BombCluster_01_F","BombCluster_03_F"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "ffaa_ea_ef18m":
        {
            _loadout = ["","PylonRack_Bomb_GBU12_x2","PylonRack_2Rnd_BombCluster_01_F","PylonMissile_Missile_AMRAAM_C_x1","ffaa_ef18m_Fueltank_1rnd_M","PylonMissile_Missile_AMRAAM_C_x1","PylonRack_2Rnd_BombCluster_03_F",""];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["bombRacks", ["weapon_GBU12Launcher","BombCluster_01_F","BombCluster_03_F"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
		//JMs Empire (rip)
        case "JMSLLTE_TIEbomber_veh_F":
        {
            _loadout = ["PylonRack_JMSLLTE_20Rnd_VL6179_proton_bomb","PylonRack_JMSLLTE_20Rnd_VL6179_proton_bomb"];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
		//Pedagne
        case "ASZ_AV8B":
        {
            _loadout = ["PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_Bomb_04_F","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_Bomb_04_F"];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["bombRacks", ["Bomb_04_Plane_CAS_01_F","BombCluster_03_F","Mk82BombLauncher","BombCluster_01_F"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "ASZ_EFA":
        {
            _loadout = ["PylonMissile_Bomb_GBU12_x1","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_Bomb_GBU12_x1","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_1Rnd_Mk82_F","PylonMissile_1Rnd_BombCluster_03_F","PylonMissile_Bomb_GBU12_x1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["bombRacks", ["weapon_GBU12Launcher","BombCluster_03_F","Mk82BombLauncher","BombCluster_01_F"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
		//PLA
        case "PLAAF_Fighter_J10":
        {
            _loadout = ["","PylonMissile_LK_LS6_500KG_X1","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_LK_LS6_500KG_X1","","PylonMissile_LK_LS6_100KG_X6"];
            _plane setVariable ["mainGun", "Fighter_Gun_23mm_lk"];
            _plane setVariable ["bombRacks", ["LK_weapon_LS6_500KG","BombCluster_02_F","LK_weapon_LS6_100KG"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PLAAF_Fighter_J20":
        {
            _loadout = ["","","PylonMissile_LK_LS6_500KG_X1","PylonMissile_LK_LS6_500KG_X1","PylonMissile_LK_LS6_500KG_X1","","PylonMissile_LK_LS6_500KG_X1","PylonMissile_LK_LS6_500KG_X1"];
            _plane setVariable ["bombRacks", ["LK_weapon_LS6_500KG"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PLAAF_Fighter_J11":
        {
            _loadout = ["","PylonMissile_LK_LS6_100KG_X6_wing","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_Bomb_KAB250_x1","PylonMissile_LK_LS6_100KG_X6_wing","","PylonMissile_LK_LS6_500KG_X1","PylonMissile_LK_LS6_500KG_X1","PylonMissile_LK_LS6_100KG_X3","PylonMissile_LK_LS6_100KG_X3","",""];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["bombRacks", ["LK_weapon_LS6_500KG","LK_weapon_LS6_100KG","BombCluster_02_F","weapon_KAB250Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PLAAF_Fighter_J15":
        {
            _loadout = ["","PylonMissile_LK_LS6_100KG_X6_wing","PylonMissile_LK_LS6_250KG_X1","PylonMissile_LK_LS6_250KG_X1","PylonMissile_LK_LS6_100KG_X6_wing","","PylonMissile_LK_LS6_250KG_X1","PylonMissile_LK_LS6_250KG_X1","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_Bomb_KAB250_x1","",""];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["bombRacks", ["LK_weapon_LS6_100KG","LK_weapon_LS6_250KG","BombCluster_02_F","weapon_KAB250Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PLAAF_Fighter_J16":
        {
            _loadout = ["","PylonMissile_LK_LS6_100KG_X6_wing","PylonMissile_LK_LS6_100KG_X6_wing","PylonMissile_LK_LS6_100KG_X6_wing","PylonMissile_LK_LS6_100KG_X6_wing","","PylonMissile_LK_LS6_100KG_X6","PylonMissile_LK_LS6_100KG_X6","PylonMissile_LK_LS6_500KG_X1","PylonMissile_LK_LS6_500KG_X1","",""];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["bombRacks", ["LK_weapon_LS6_500KG","LK_weapon_LS6_100KG"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "O_mas_chi_Plane_CAS_02_F":
        {
            _loadout = ["","","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_Bomb_03_F","PylonMissile_1Rnd_BombCluster_02_cap_F","PylonMissile_1Rnd_Bomb_03_F","",""];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["bombRacks", ["Bomb_03_Plane_CAS_02_F","BombCluster_02_F"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "O_mas_chi_Plane_Fighter_02_F":
        {
            _loadout = ["","","PylonMissile_LK_LS6_500KG_X1","PylonMissile_LK_LS6_500KG_X1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","","","","","","","PylonMissile_1Rnd_BombCluster_02_cap_F"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["bombRacks", ["weapon_KAB250Launcher","LK_weapon_LS6_500KG","BombCluster_02_F"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Project RACS
        case "PRACS_F16CJ":
        {
            _loadout = ["","","","","PRACS_BLU1B_X3","PRACS_M117_X1","PRACS_Mk81_MERX6","PRACS_Mk81_snake_X2","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["bombRacks", ["PRACS_DummyLauncher","PRACS_BLU1B_Launcher","PRACS_M117_Launcher","PRACS_Mk81_Launcher","PRACS_Mk81_Snake_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_F16CJR":
        {
            _loadout = ["","","","","PRACS_GBU8_X1","PRACS_Mk82_X6","PRACS_CBU_100_X6","PRACS_Mk84_X1","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["bombRacks", ["PRACS_DummyLauncher","PRACS_GBU8_launcher","PRACS_CBU_100_Launcher","PRACS_Mk84_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_F16":
        {
            _loadout = ["","","","","PRACS_Mk82_X6","PRACS_Mk81_MERX6","PRACS_CBU_100_X2","PRACS_Mk82_snake_X6","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["bombRacks", ["PRACS_DummyLauncher","PRACS_Mk82_Launcher","PRACS_Mk81_Launcher","PRACS_CBU_100_Launcher","PRACS_Mk82_Snake_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_Mohawk_Navy";
        case "PRACS_Mohawk":
        {
            _loadout = ["PRACS_Mk81_MERX3","PRACS_Mk81_MERX3","PRACS_70mm_AP_X19","PRACS_70mm_FFAR_X19","PRACS_Mk81_MERX6"];
            _plane setVariable ["mainGun", "PRACS_MR39B_20mm"];
            _plane setVariable ["bombRacks", ["PRACS_Mk83_X1","PRACS_CBU_100_X1","PRACS_gp1000_X1","PRACS_M117_X1","PRACS_BLU1B_X1","PRACS_BLU1B_X1"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_MirageIII":
        {
            _loadout = ["PRACS_Mk81_MERX3","PRACS_Mk81_MERX3","PRACS_70mm_AP_X19","PRACS_70mm_FFAR_X19","PRACS_Mk81_MERX6"];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["bombRacks", ["PRACS_Mk81_Launcher","PRACS_CBU_100_Launcher","PRACS_Mk83_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_MirageV":
        {
            _loadout = ["PRACS_M117_X1","PRACS_Mk81_snake_X1","PRACS_GBU10_X1","PRACS_GBU8_X1","PRACS_Mk82_snake_X6","PRACS_Mk81_MERX6","PRACS_CBU_100_X1","PRACS_CBU_100_X1","PRACS_Mk82_X6"];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["bombRacks", ["PRACS_Mk82_Launcher","PRACS_M117_Launcher","PRACS_Mk81_Snake_Launcher","PRACS_GBU10_Launcher","PRACS_GBU8_launcher","PRACS_Mk82_Snake_Launcher","PRACS_Mk81_Launcher","PRACS_CBU_100_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_A4M_Navy";
        case "PRACS_A4M_Marine";
        case "PRACS_A4M":
        {
            _loadout = ["PRACS_CBU_100_X2","PRACS_CBU_100_X2","PRACS_CBU_100_X2","PRACS_CBU_100_X1","PRACS_Mk81_MERX6"];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["bombRacks", ["PRACS_CBU_100_Launcher","PRACS_Mk81_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_P3C":
        {
            _loadout = ["PRACS_Mk84_X1","PRACS_Mk84_X1","PRACS_M117_X1","PRACS_M117_X1","PRACS_Mk84_X1","PRACS_Mk84_X1","PRACS_Mk84_X1","PRACS_Mk84_X1"];
            _plane setVariable ["bombRacks", ["PRACS_Mk84_Launcher","PRACS_M117_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        ///RACS (SLA)
        case "PRACS_SLA_MiG21":
        {
            _loadout = ["","","PRACS_FAB_500_M62_X1","PRACS_ZB500_X1"];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_23"];
            _plane setVariable ["bombRacks", ["PRACS_FAB_500_M62_Launcher","PRACS_ZB500_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_SLA_MiG23":
        {
            _loadout = ["","","PRACS_FAB_1500_M54_X1","PRACS_FAB_1500_M54_X1"];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_23"];
            _plane setVariable ["bombRacks", ["PRACS_FAB_1500_M54_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_SLA_MiG27":
        {
            _loadout = ["PRACS_KAB1500kr_X1","PRACS_FAB_500_M62_X1","PRACS_RBK_500_SPBE_X1","PRACS_RBK_250_PTAB_X1","PRACS_FAB_250_M62_X1","PRACS_RBK_500_375_X1"];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_30"];
            _plane setVariable ["bombRacks", ["PRACS_FAB_250_M62_Launcher","PRACS_KAB1500kr_Launcher","PRACS_FAB_500_M62_Launcher","PRACS_RBK_500_SPBE_Launcher","PRACS_RBK_250_PTAB_Launcher","PRACS_RBK_500_375_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_SLA_MIG28":
        {
            _loadout = ["","","PRACS_RBK_500_375_X1","PRACS_FAB_500_M54_X1","PRACS_RBK_500_375_X1","PRACS_RBK_500_ZAB_X1"];
            _plane setVariable ["mainGun", "PRACS_NR23_23mm"];
            _plane setVariable ["bombRacks", ["PRACS_RBK_500_375_Launcher","PRACS_FAB_500_M54_Launcher","PRACS_RBK_500_ZAB_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_SLA_SU22":
        {
            _loadout = ["","","PRACS_KAB1500kr_X1","PRACS_KAB1500kr_X1","PRACS_FAB_100_X6","PRACS_FAB_100_X6","PRACS_FAB_250_M54_X1","PRACS_FAB_250_M54_X1","PRACS_FAB_250_M54_X1","PRACS_FAB_250_M54_X1","PRACS_FAB_500_M54_X1","PRACS_FAB_500_M54_X1","PRACS_FAB_500_M54_X1","PRACS_FAB_500_M54_X1"];
            _plane setVariable ["mainGun", "PRACS_NR30_30mm"];
            _plane setVariable ["bombRacks", ["PRACS_KAB1500kr_Launcher","PRACS_FAB_100_Launcher","PRACS_FAB_250_M54_Launcher","PRACS_FAB_500_M54_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_SLA_Su25":
        {
            _loadout = ["","","PRACS_ZB500_X1","PRACS_RBK_500_SPBE_X1","PRACS_RBK_500_375_X1","PRACS_RBK_250_PTAB_X1","PRACS_FAB_500_M62_X1","PRACS_FAB_500_M62_X1","PRACS_FAB_500_M62_X1","PRACS_FAB_500_M62_X1"];
            _plane setVariable ["mainGun", "PRACS_GSH_30_2_30mm"];
            _plane setVariable ["bombRacks", ["PRACS_ZB500_Launcher","PRACS_RBK_500_SPBE_Launcher","PRACS_RBK_500_375_Launcher","PRACS_RBK_250_PTAB_Launcher","PRACS_FAB_500_M62_Launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        default
        {
            Error_1("Plane type %1 currently not supported for CASDIVE, please add the case!", typeOf _plane);
        };
    };
};

if (_type == "CAS") then
{
    _validInput = true;
    switch (typeOf _plane) do
    {
        //Vanilla NATO CAS (A-10)
        case "B_D_Plane_CAS_01_dynamicLoadout_lxWS";
        case "B_W_Plane_CAS_01_dynamicLoadout_F"; 
        case "B_T_Plane_CAS_01_dynamicLoadout_F";
        case "B_Plane_CAS_01_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_12Rnd_missiles","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles","PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_12Rnd_missiles","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F"];
            _plane setVariable ["mainGun", "Gatling_30mm_Plane_CAS_01_F"];
            _plane setVariable ["rocketLauncher", ["missiles_DAR","Rocket_04_AP_Plane_CAS_01_F","Rocket_04_HE_Plane_CAS_01_F"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL","missiles_DAGR","Missile_AGM_02_Plane_CAS_01_F"]];
        };
        //Vanilla CSAT CAS 
        case "O_Plane_CAS_02_dynamicLoadout_F":
        {
            _loadout = ["PylonMissile_1Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_50mm","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_4Rnd_LG_scalpel","PylonRack_6Rnd_Vikhr_missiles","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_80mm","PylonMissile_1Rnd_LG_scalpel"];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["rocketLauncher", ["rockets_Skyfire","Rocket_03_AP_Plane_CAS_02_F","Rocket_03_HE_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_01_Plane_CAS_02_F","missiles_SCALPEL"]];
        };
        //Vanilla-Aegis CSAT CAS //different case due to additional weapons not present in vanilla //in templates should use one of these classnames with proper variant skin
        case "Atlas_O_W_Plane_CAS_02_dynamicLoadout_ghex_F";
        case "O_T_Plane_CAS_02_dynamicLoadout_ghex_F";
        case "O_R_Plane_CAS_02_dynamicLoadout_F";
        case "O_R_Plane_CAS_02_dynamicLoadout_ard_F":
        {
            _loadout = ["PylonMissile_1Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_50mm","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_4Rnd_LG_scalpel","PylonRack_6Rnd_Vikhr_missiles","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_80mm","PylonMissile_1Rnd_LG_scalpel"];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["rocketLauncher", ["rockets_50mm","rockets_Skyfire","Rocket_03_AP_Plane_CAS_02_F","Rocket_03_HE_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_01_Plane_CAS_02_F","missiles_Vikhr","missiles_SCALPEL"]];
        };
        //Vanilla IND CAS
        case "I_Plane_Fighter_03_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_12Rnd_missiles","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_3Rnd_LG_scalpel","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_12Rnd_missiles"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm_gunpod"];
            _plane setVariable ["rocketLauncher", ["Rocket_04_AP_Plane_CAS_01_F","Rocket_04_HE_Plane_CAS_01_F","missiles_DAR"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_02_Plane_CAS_01_F", "missiles_SCALPEL"]];
        };
        //Vanilla-Aegis IND CAS //different case due to additional weapons not present in vanilla //in templates should use one of these classnames with proper variant skin
        case "O_A_Plane_Fighter_03_dynamicLoadout_F";
        case "Atlas_O_T_Plane_Fighter_03_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_19Rnd_Rocket_Skyfire","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_7Rnd_Rocket_50mm","PylonWeapon_300Rnd_20mm_shells","PylonRack_6Rnd_Vikhr_missiles"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm_gunpod"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_HE_Plane_CAS_02_F","rockets_Skyfire","rockets_50mm"]];
            _plane setVariable ["missileLauncher", ["missiles_Vikhr"]];
        };
        //Vanilla NATO JETS CAS
        case "B_Plane_Fighter_01_F":
        {
            _loadout = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"];//"PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2"
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["rocketLauncher", []];
            _plane setVariable ["bombRacks", ["weapon_GBU12Launcher"]];
            _plane setVariable ["missileLauncher", ["weapon_AGM_65Launcher"]];
            _plane setVariable ["diveParams", [1200, 500, 150, 55, 15, [3, 0]]]; 
        };
        //Vanilla-Aegis NATO JETS CAS  //different case due to additional weapons not present in vanilla //in templates should use one of these classnames with proper variant skin
        case "Atlas_B_G_Plane_Fighter_01_F";
        case "Atlas_B_G_Plane_Fighter_01_ard_F";
        case "B_T_Plane_Fighter_01_F";
        case "B_D_Plane_Fighter_01_F";
        case "B_USMC_Plane_Fighter_01_F":
        {
            _loadout = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_HARM_x1","PylonRack_Missile_HARM_x1","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_GBU12_x1"];//"PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_HARM_x1","PylonRack_Missile_HARM_x1"
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["rocketLauncher", []];
            _plane setVariable ["bombRacks", ["weapon_GBU12Launcher"]];
            _plane setVariable ["missileLauncher", ["weapon_HARMLauncher","weapon_AGM_65Launcher"]];
            _plane setVariable ["diveParams", [1200, 500, 150, 55, 15, [3, 0]]]; 
        };
        //Vanilla CSAT JETS CAS
        case "O_T_Plane_Fighter_02_ghex_F";
        case "O_R_Plane_Fighter_02_F";
        case "O_R_Plane_Fighter_02_ard_F";
        case "O_Plane_Fighter_02_F":
        {
            _loadout = ["PylonMissile_Bomb_KAB250_x1","PylonMissile_Bomb_KAB250_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_KH58_x1","PylonMissile_Missile_KH58_x1","PylonMissile_Missile_KH58_INT_x1"];//"PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_KH58_x1","PylonMissile_Missile_KH58_x1","PylonMissile_Missile_KH58_INT_x1"
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["bombRacks", ["weapon_KAB250Launcher"]];
            _plane setVariable ["missileLauncher", ["weapon_AGM_KH25Launcher","weapon_KH58Launcher"]];
            _plane setVariable ["diveParams", [1200, 500, 150, 55, 15, [3, 0]]]; 
        };
        //Vanilla IND JETS CAS
        case "CUP_I_JAS_39_RACS";
        case "CUP_I_JAS_39_HIL";
        case "UK3CB_AAF_B_Gripen";
        case "Aegis_B_E_Plane_Fighter_04_F"; 
        case "Atlas_B_M_Plane_Fighter_04_F";
        case "I_Plane_Fighter_04_F":
        {
            _loadout = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["rocketLauncher", []];
            _plane setVariable ["missileLauncher", ["weapon_AGM_65Launcher"]];
        };
        //Vanilla CSAT VTOL
        case "O_T_VTOL_02_vehicle_dynamicLoadout_F";
        case "O_T_VTOL_02_infantry_dynamicLoadout_F";
        case "O_VTOL_02_vehicle_dynamicLoadout_F";
        case "O_VTOL_02_infantry_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_4Rnd_LG_scalpel","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_20Rnd_Rocket_03_AP_F"];
            _plane setVariable ["mainGun", "gatling_30mm_VTOL_02"];
            _plane setVariable ["rocketLauncher", ["rockets_Skyfire","Rocket_03_HE_Plane_CAS_02_F","Rocket_03_AP_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla JETS UAV
        case "B_UAV_05_F":
        {
            _loadout = ["PylonMissile_Missile_HARM_INT_x1","PylonMissile_Missile_AGM_02_x2"];
            _plane setVariable ["missileLauncher", ["weapon_HARMLauncher","weapon_AGM_65Launcher"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 20, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla UAV
        case "I_UAV_02_dynamicLoadout_F";
        case "O_UAV_02_dynamicLoadout_F";
        case "B_UAV_02_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_12Rnd_missiles","PylonRack_3Rnd_LG_scalpel"];
            _plane setVariable ["rocketLauncher", ["missiles_DAR"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL"]];
            _plane setVariable ["diveParams", [600, 400, 180, 55, 25, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla APEX UAV
        case "O_T_UAV_04_CAS_F":
        {
            _loadout = ["4Rnd_LG_Jian"];
            _plane setVariable ["missileLauncher", ["missiles_Jian"]];
            _plane setVariable ["diveParams", [600, 400, 180, 55, 25, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Aegis experimental CAS plane without rocket launchers, let's see how this will play out
        case "Atlas_B_A_Plane_Fighter_05_ard_F";
        case "Atlas_B_A_Plane_Fighter_05_trp_F";
        case "B_A_Plane_Fighter_05_F";
        case "B_A_Plane_Fighter_05_tna_F";
        case "B_A_Plane_Fighter_05_wdl_F";
        case "B_Plane_Fighter_05_F";
        case "B_T_Plane_Fighter_05_F";
        case "B_W_Plane_Fighter_05_F";
        case "Atlas_I_I_Plane_Fighter_05_F";
        case "Atlas_B_A_Plane_Fighter_05_F": {
            _loadout = ["PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonMissile_Bomb_AGM_154_x1","PylonRack_Missile_HARM_x1","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_AGM_154_x1","PylonMissile_Bomb_AGM_154_x1","PylonWeapon_220Rnd_25mm_shells"];//"PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonMissile_Bomb_AGM_154_x1","PylonRack_Missile_HARM_x1","PylonMissile_1Rnd_BombCluster_01_F","PylonMissile_Bomb_GBU12_x1","PylonMissile_Bomb_AGM_154_x1","PylonMissile_Bomb_AGM_154_x1","PylonWeapon_220Rnd_25mm_shells"
            _plane setVariable ["mainGun", "gatling_25mm"];
            _plane setVariable ["rocketLauncher", []];
            _plane setVariable ["bombRacks", ["weapon_GBU12Launcher", "BombCluster_01_F"]];
            _plane setVariable ["missileLauncher", ["weapon_AGM_154Launcher","weapon_BIM9xLauncher","weapon_AGM_65Launcher","weapon_HARMLauncher"]];
            _plane setVariable ["diveParams", [1200, 500, 150, 55, 15, [3, 0]]]; 
        };
        //RHS US CAS (A-10)
        case "RHS_A10";
        case "UK3CB_CW_US_B_EARLY_A10":
        {
            _loadout = ["rhs_mag_ANALQ131","rhs_mag_M151_7_USAF_LAU131","rhs_mag_agm65d_3","rhs_mag_M151_21_USAF_LAU131_3","rhs_mag_M151_7_USAF_LAU131","","rhs_mag_M151_7_USAF_LAU131","rhs_mag_M151_21_USAF_LAU131_3","rhs_mag_agm65d_3","rhs_mag_M151_7_USAF_LAU131","","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x16"];
            _plane setVariable ["mainGun", "RHS_weap_gau8"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_FFARLauncher"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_agm65d"]];
        };
        //RHS CDF L-39
        case "rhs_l39_cdf_b_cdf":
        {
            _loadout = ["rhs_mag_ub16_s5ko","rhs_mag_ub16_s5m1"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s5m1", "rhs_weap_s5ko"]];
        };
        //RHS CDF L-159
        case "rhs_l159_cdf_b_CDF":
        {
            _loadout = ["rhs_mag_M151_7_USAF_LAU131","rhs_mag_agm65d","rhs_mag_agm65d","rhs_mag_zpl20_apit","rhs_mag_agm65d","rhs_mag_agm65d","rhs_mag_M151_7_USAF_LAU131","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "RHS_weap_zpl20"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_FFARLauncher"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_agm65d"]];
        };
        case "UK3CB_AAF_O_Su25SM";
        case "RHS_Su25SM_vvsc";
        case "RHS_Su25SM_CAS_vvs";
        case "rhsgref_cdf_b_su25";
        case "UK3CB_TKA_B_Su25SM_CAS";
        case "UK3CB_LDF_B_Su25SM_CAS";
        case "UK3CB_ADA_I_Su25SM_CAS";
        case "UK3CB_KDF_B_Su25SM_CAS";
        case "UK3CB_ARD_O_Su25SM_CAS";
        case "UK3CB_CW_SOV_O_LATE_Su25SM_CAS":
        {
            _loadout = ["rhs_mag_kh29D","rhs_mag_kh29D","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_b8m1_s8kom","rhs_mag_b8m1_s8kom","rhs_mag_R60M","rhs_mag_R60M","rhs_ASO2_CMFlare_Chaff_Magazine_x4"];
            _plane setVariable ["mainGun", "rhs_weap_gsh302"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s8"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_kh29d_Launcher", "rhs_weap_kh25mtp_Launcher"]];
        };
        case "rhssaf_airforce_l_18":
        {
            _loadout = ["rhs_mag_b8m1_bd3_umk2a_s8kom","rhs_mag_b8m1_bd3_umk2a_s8kom","rhs_mag_kh25MTP_apu68_mig29","rhs_mag_kh25MTP_apu68_mig29","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "rhs_weap_gsh301"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s8", "rhs_weap_s8df"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_kh25mtp_Launcher"]];
        };
        ///S.O.G.
        case "vn_b_air_f4c_at":
        {
            _loadout = ["vn_missile_f4_out_agm45_mag_x1","vn_missile_f4_out_agm45_mag_x1","vn_rocket_ffar_f4_lau3_m229_he_x57","vn_rocket_ffar_f4_lau3_m229_he_x57","vn_bomb_f4_out_750_blu1b_fb_mag_x3","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1"];
            _plane setVariable ["rocketLauncher", ["vn_rocket_ffar_275in_launcher_m229"]];
            _plane setVariable ["missileLauncher", ["vn_missile_agm45_launcher"]];
        };
        case "vn_b_air_f100d_at":
        {
            _loadout = ["vn_rocket_ffar_f4_lau59_m229_he_x21","vn_rocket_ffar_f4_lau59_m229_he_x21","vn_fuel_f100_335_camo_01_mag","vn_fuel_f100_335_camo_01_mag","vn_missile_agm45_03_mag_x1","vn_missile_agm45_03_mag_x1"];
            _plane setVariable ["mainGun", "vn_m39a1_v_quad"];
            _plane setVariable ["rocketLauncher", ["vn_rocket_ffar_275in_launcher_m229"]];
            _plane setVariable ["missileLauncher", ["vn_missile_agm45_launcher"]];
        };
        case "vn_o_air_mig19_at":
        {
            _loadout = ["vn_rocket_s5_heat_x16","vn_rocket_s5_heat_x16","vn_missile_kh66_mag_01_x1","vn_missile_kh66_mag_01_x1"];
            _plane setVariable ["mainGun", "vn_nr30_v_01"];
            _plane setVariable ["rocketLauncher", ["vn_rocket_s5_heat_launcher"]];
            _plane setVariable ["missileLauncher", ["vn_missile_kh66_launcher"]];
        };
        case "vn_o_air_mig21_cas":
        {
            _loadout = ["vn_missile_mig21_kh66_mag_x1","vn_missile_mig21_kh66_mag_x1","vn_gunpod_gsh23l_v_200_mag"];
            _plane setVariable ["mainGun", "vn_gunpod_gsh23l"];
            _plane setVariable ["missileLauncher", ["vn_missile_kh66_launcher"]];
        };
        case "RHSGREF_A29B_HIDF":
        {
            _loadout = ["rhs_mag_AGM114K_2_plane","rhs_mag_FFAR_7_USAF","rhs_mag_mk82","rhs_mag_FFAR_7_USAF","rhs_mag_AGM114N_2_plane","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "rhs_weap_M3W_A29"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_FFARLauncher"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_AGM114K_Launcher", "RHS_weap_AGM114N_Launcher"]];
        };
        case "UK3CB_B_Mystere_HIDF_CAS1";
        case "UK3CB_MDF_B_Mystere_CAS1":
        {
            _loadout = ["PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonRack_3Rnd_Missile_AGM_02_F"];
            _plane setVariable ["mainGun", "uk3cb_mystere_cannon_30mm"];
            _plane setVariable ["rocketLauncher", ["missiles_DAR"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_02_Plane_CAS_01_F"]];
        };
        case "UK3CB_TKA_B_L39_PYLON";
        case "UK3CB_AAF_B_L39_PYLON";
        case "UK3CB_KRG_B_L39_PYLON";
        case "UK3CB_LDF_B_L39_PYLON":
        {
            _loadout = ["PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_12Rnd_missiles","PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_AP_F"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
            _plane setVariable ["rocketLauncher", ["Rocket_04_AP_Plane_CAS_01_F", "missiles_DAR"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL"]];
        };
        case "UK3CB_CW_SOV_O_LATE_MIG21_AT";
        case "UK3CB_TKA_B_MIG21_AT":
        {
            _loadout = ["uk3cb_mag_kh25MA","rhs_mag_b8m1_bd3_umk2a_s8t","rhs_mag_b8m1_bd3_umk2a_s8t","uk3cb_mag_kh25MA"];
            _plane setVariable ["mainGun", "uk3cb_mig21_GSh23L_23mm"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s8t"]];
            _plane setVariable ["missileLauncher", ["uk3cb_weap_kh25ma_Launcher"]];
        };
        // CWR aircraft
		case "cwr3_o_mig27":
        {
            _loadout = ["PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_1Rnd_Missile_AGM_01_F"];
            _plane setVariable ["mainGun", "cwr3_vacannon_gsh306"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_HE_Plane_CAS_02_F","Rocket_03_AP_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_01_Plane_CAS_02_F"]];
        };
		case "cwr3_o_su17m4":
        {
            _loadout = ["PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F"];
            _plane setVariable ["mainGun", "cwr3_vacannon_nr30_veh"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_AP_Plane_CAS_02_F","Rocket_03_HE_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_01_Plane_CAS_02_F"]];
        };
		case "cwr3_b_usmc_av8b";
		case "cwr3_b_frs1":
        {
            _loadout = ["CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_Plane_M","CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_Plane_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GAU12_veh"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_CRV7_veh"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_AGM114K_veh"]];
        };
        // cup aircraft
        case "CUP_I_L39_AAF";
        case "CUP_O_L39_TK";
        case "CUP_B_L39_CZ":
        {
            _loadout = ["CUP_PylonPod_20Rnd_S8_plane_M","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F","CUP_PylonPod_20Rnd_S8_plane_M"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GSh23L_L39"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_S8_veh"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_01_Plane_CAS_02_F"]];
        };
        case "cwr3_o_su25";
		case "cwr3_tdf_su25";
		case "CUP_B_Su25_Dyn_CDF";
        case "CUP_O_Su25_Dyn_RU";
        case "CUP_O_Su25_Dyn_SLA";
        case "CUP_O_Su25_Dyn_TKA":
        {
            _loadout = ["CUP_PylonPod_1Rnd_R73_Vympel","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_03_HE_F","CUP_PylonPod_1Rnd_R73_Vympel"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GSh302K_veh"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_HE_Plane_CAS_02_F", "Rocket_03_AP_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_Kh29L_veh"]];
        };
        case "CUP_I_SU34_AAF";
        case "CUP_B_SU34_CDF";
        case "CUP_O_SU34_RU";
        case "CUP_O_SU34_SLA":
        {
            _loadout = ["","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M","CUP_PylonPod_1Rnd_FAB250_plane_M","CUP_PylonPod_1Rnd_KAB250_M","CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_R73_Vympel"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GSh301_veh"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_HE_Plane_CAS_02_F", "Rocket_03_AP_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_Kh29L_veh"]];
            _plane setVariable ["bombRacks", ["CUP_Vblauncher_Fab250_veh","CUP_Vblauncher_KAB250_veh"]];
            _plane setVariable ["diveParams", [1200, 500, 150, 55, 15, [3, 0]]]; 
        };
		case "cwr3_b_a10";
        case "CUP_B_A10_DYN_USA":
        {
            _loadout = ["CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_ALQ_131","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GAU8_veh"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_FFAR_veh", "CUP_Vmlauncher_CRV7_veh"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_AGM65pod_veh"]];
        };
        case "CUP_B_GR9_DYN_GB":
        {
            _loadout = ["CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","PylonWeapon_300Rnd_20mm_shells","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_CRV7_veh"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_AGM65pod_veh"]];
        };
        case "CUP_I_AV8B_DYN_AAF";
        case "CUP_B_AV8B_DYN_USMC":
        {
            _loadout = ["CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GAU12_veh"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_CRV7_veh"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_AGM65pod_veh"]];
        };
        //Unsung
        case "uns_Mig21_CAS":
        {
            _loadout = ["","","uns_pylonRack_32Rnd_Rocket_57_HE","uns_pylonRack_32Rnd_Rocket_57_HE","uns_pylonRack_1Rnd_Bomb_kab500","uns_pylonRack_1Rnd_Bomb_kab500","uns_pylonRack_96Rnd_Rocket_57_HE"];
            _plane setVariable ["mainGun", "uns_NR30"];
            _plane setVariable ["rocketLauncher", ["uns_57mmLauncher_dl"]];
        };
        case "uns_A1J_CAS":
        {
            _loadout = ["uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_fuel_A1"];
            _plane setVariable ["mainGun", "uns_Uns_M2_4x20mm"];
            _plane setVariable ["rocketLauncher", ["Uns_FFAR_HEAT_Launcher_dl", "Uns_HVARLauncher_dl"]];
        };
        case "uns_A7_CAS":
        {
            _loadout = ["uns_pylonRack_19Rnd_Rocket_FFAR_WP","uns_pylonRack_19Rnd_Rocket_FFAR_WP","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E"];
            _plane setVariable ["mainGun", "uns_M61A1"];
            _plane setVariable ["rocketLauncher", ["Uns_FFAR_WP_Launcher_dl", "Uns_FFAR_HEAT_Launcher_dl"]];
            _plane setVariable ["missileLauncher", ["uns_AGM12_Launcher_dl"]];
        };
        case "uns_A6_Intruder_CAS":
        {
            _loadout = ["uns_pylonRack_12Rnd_Rocket_Zuni_AT","uns_pylonRack_12Rnd_Rocket_Zuni_AT","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12"];
            _plane setVariable ["rocketLauncher", ["Uns_ZuniLauncher_dl", "Uns_HVARLauncher_dl"]];
            _plane setVariable ["missileLauncher", ["uns_AGM12_Launcher_dl"]];
        };
        case "uns_F4J_CAS":
        {
            _loadout = ["uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_f4_38Rnd_Rocket_FFAR_HEAT","uns_pylonRack_f4_38Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AGM12"];
            _plane setVariable ["rocketLauncher", ["Uns_FFAR_HEAT_Launcher_dl"]];
            _plane setVariable ["missileLauncher", ["uns_AGM12_Launcher_dl"]];
        };     
        case "Tornado_AWS_camo_ger":
        {
            _loadout = ["Tornado_AWS_ECMpod_1rnd_M","FIR_IRIS_T_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_Litening_std_P_1rnd_M","FIR_Brimstone_DM_type1_P_3rnd_M","FIR_Brimstone_DM_type1_P_3rnd_M","FIR_GBU12_P_1rnd_M","FIR_Brimstone_DM_type2_P_3rnd_M","FIR_Brimstone_DM_type2_P_3rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_IRIS_T_P_1rnd_M","Tornado_AWS_AIRCMpod_1rnd_M","FIR_BK27_R_M","FIR_BK27_L_M"];
            _plane setVariable ["mainGun", "Tornado_AWS_CANNON_W"];
            _plane setVariable ["missileLauncher", ["FIR_Brimstone"]];
        };
        // IFA planes
        case "LIB_Ju87_w";
        case "LIB_DAK_Ju87";		
        case "LIB_Ju87": {
            _loadout = ["LIB_1Rnd_SC50","LIB_1Rnd_SC50","LIB_1Rnd_SC500","LIB_1Rnd_SC50","LIB_1Rnd_SC50"];
            _plane setVariable ["mainGun", "LIB_2xMG151_JU87"];
            _plane setVariable ["bombRacks", ["LIB_SC500_Bomb_Mount","LIB_SC50_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [15, -2]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "LIB_Pe2_w";
        case "LIB_Pe2": {
            _loadout = ["LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250"];
            _plane setVariable ["mainGun", "LIB_UBK_PE2"];
            _plane setVariable ["bombRacks", ["LIB_FAB250_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [12, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };		
        case "LIB_P47": {
            _loadout = ["LIB_4000Rnd_M2_P47","LIB_4000Rnd_M2_P47","LIB_4000Rnd_M2_P47","LIB_4000Rnd_M2_P47","LIB_6Rnd_M8_P47","LIB_6Rnd_M8_P47","LIB_1Rnd_US_500lb","LIB_1Rnd_US_500lb","LIB_1Rnd_US_500lb"];
            _plane setVariable ["mainGun", "LIB_8xM2_P47"];
            _plane setVariable ["rocketLauncher", ["LIB_M8_Launcher_P47"]];
            _plane setVariable ["bombRacks", ["LIB_US_500lb_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        // SPE planes
        case "SPE_FW190F8_noinsignia";
        case "SPE_FW190F8": {
            _loadout = ["SPE_250Rnd_MG151","SPE_250Rnd_MG151","SPE_400Rnd_MG131","SPE_400Rnd_MG131","SPE_1Rnd_SC50","SPE_1Rnd_SC50","SPE_1Rnd_SC500","SPE_1Rnd_SC50","SPE_1Rnd_SC50"];
            _plane setVariable ["mainGun", "SPE_2xMG151"];
            _plane setVariable ["bombRacks", ["SPE_SC500_Bomb_Mount","SPE_SC50_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "SPE_P47_noinsignia";
        case "SPE_P47": {
            _loadout = ["SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_3Rnd_M8_P47","SPE_3Rnd_M8_P47","SPE_1Rnd_US_500lb","SPE_1Rnd_US_500lb","SPE_1Rnd_US_500lb"];
            _plane setVariable ["mainGun", "SPE_8xM2_P47"];
            _plane setVariable ["rocketLauncher", ["SPE_M8_Launcher_P47"]];
            _plane setVariable ["bombRacks", ["SPE_US_500lb_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
	    // Clone Wars Planes (3AS)
        case "3AS_ARC_170_Red";
		case "3AS_ARC_170_Yellow";
        case "3AS_ARC_170_Orange";
        case "3AS_ARC_170_Green";
        case "3AS_ARC_170_Blue":
        {
            _loadout = ["3AS_LAAT_8Rnd_Missile_AGM","PylonRack_Missile_AGM_02_x2","3as_PylonRack_ARC_6Rnd_Missile_AGM","PylonRack_Missile_HARM_x1"];
            _plane setVariable ["mainGun", "3as_ARC_Light_Canon"];
            _plane setVariable ["missileLauncher", ["weapon_AGM_65Launcher","3as_ARC_Missile_AGM","weapon_HARMLauncher"]];
        };
        case "3AS_BTLB_Bomber";
        case "3AS_BTLB_Bomber_Shadow";
        case "3AS_BTLB_Bomber_RedLeader";
        case "3AS_BTLB_Bomber_Shadow":
        {
            _loadout = ["PylonMissile_1Rnd_BombCluster_01_F","3as_PylonRack_ARC_1Rnd_EMP","PylonRack_Bomb_SDB_x4","PylonRack_Bomb_SDB_x4","3as_PylonRack_ARC_6Rnd_Missile_AGM","3AS_LAAT_8Rnd_Missile_AGM","PylonRack_Bomb_SDB_x4","PylonRack_Bomb_SDB_x4"];
            _plane setVariable ["mainGun", "3AS_BTLB_SW4_Ion_Cannon"];
            _plane setVariable ["bombRacks", ["BombCluster_01_F","3AS_ARC_EMP","weapon_SDBLauncher"]];
            _plane setVariable ["missileLauncher", ["3as_ARC_Missile_AGM"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "3as_Tri_Fighter_dynamicLoadout":
        {
            _loadout = ["3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP"];
            _plane setVariable ["mainGun", "3AS_Vulture_Cannon"];
            _plane setVariable ["missileLauncher", ["3AS_Vulture_Rocket_HEAP_F"]];
        };
        case "3AS_CIS_Vulture_F";
        case "3AS_CIS_Vulture_CAS_F":
        {
            _loadout = ["3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP","3AS_PylonRack_Vulture_12Rnd_Rocket_HEAP"];
            _plane setVariable ["mainGun", "3AS_Vulture_Cannon"];
            _plane setVariable ["missileLauncher", ["3AS_Vulture_Rocket_HEAP_F"]];
        };
        case "3AS_SandSpeeder";
        case "3AS_SnowSpeeder";
        case "3AS_Snowspeeder_Blue";
        case "3AS_Snowspeeder_Rogue":
        {
            _loadout = ["3AS_700Rnd_T47_20mm_AA"];
            _plane setVariable ["mainGun", "3AS_T47_20mm_AA_Cannon"];
        };
        case "3AS_VWing_Imperial";
        case "3as_Vwing_base":
        {
            _loadout = ["","","","","","","","","3as_Vwing_700Rnd_Medium_shells","3as_Vwing_700Rnd_Medium_shells","3as_Vwing_700Rnd_Medium_shells"];
            _plane setVariable ["mainGun", "3as_Vwing_Medium_Cannon"];
        };
        case "3as_V19_base":
        {
            _loadout = ["","","","","","","","","3as_V19_800Rnd_Medium_shells","3as_V19_800Rnd_Medium_shells","3as_V19_800Rnd_Medium_shells"];
            _plane setVariable ["mainGun", "3as_V19_Medium_Cannon"];
        };
        case "3AS_Z95_Republic";
        case "3AS_Z95_Blue";
        case "3AS_Z95_Green";
        case "3AS_Z95_Orange";
        case "3AS_Z95_Yellow":
        {
            _loadout = ["3as_Z95_750Rnd_Light_shells","3as_Z95_750Rnd_Light_shells","","","","","","","","","3as_PylonRack_ARC_6Rnd_Missile_AGM","3as_PylonRack_ARC_6Rnd_Missile_AGM","3AS_LAAT_8Rnd_Missile_AGM","3as_PylonRack_ARC_6Rnd_Missile_AGM","3as_PylonWeapon_Z95_240Rnd_Heavy_Shells"];
            _plane setVariable ["mainGun", "3as_Z95_Heavy_Cannon"];
            _plane setVariable ["missileLauncher", ["3as_ARC_Missile_AGM"]];
        };
        case "3AS_Delta7_F";
        case "3AS_Delta7_TANO";
        case "3AS_Delta7_ANI";
        case "3AS_Delta7_Blue";
        case "3AS_Delta7_Orange";
        case "3AS_Delta7_PLO";
        case "3AS_Delta7_Purple";
        case "3AS_Delta7_Green":
        {
            _loadout = ["3AS_500Rnd_Delta7_20mm_AA","3AS_500Rnd_Delta7_20mm_AA"];
            _plane setVariable ["mainGun", "3AS_Delta7_20mm_AA_Cannon"];
        };
		//FFAA Planes
        case "ffaa_ar_harrier":
        {
            _loadout = ["","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_missiles","PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_ffaa_22Rnd_tigre_sneb_68mm",""];
            _plane setVariable ["mainGun", "ffaa_cannon_gau12"];
            _plane setVariable ["rocketLauncher", ["missiles_SCALPEL","Missile_AGM_02_Plane_CAS_01_F"]];
            _plane setVariable ["missileLauncher", ["missiles_DAR","ffaa_tigre_sneb"]];
        };
        case "ffaa_ea_ef18m":
        {
            _loadout = ["","PylonRack_Missile_HARM_x1","PylonRack_Missile_AGM_02_x2","PylonMissile_Missile_AMRAAM_C_x1","ffaa_ef18m_Fueltank_1rnd_M","PylonMissile_Missile_AMRAAM_C_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_HARM_x1",""];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["missileLauncher", ["weapon_HARMLauncher","weapon_AGM_65Launcher"]];
        };
		//JMs Empire(rip)
        case "JMSLLTE_TIEbomber_veh_F":
        {
            _loadout = ["PylonRack_JMSLLTE_20Rnd_VL6179_proton_bomb","PylonRack_JMSLLTE_20Rnd_VL6179_proton_bomb"];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Pedagne
        case "ASZ_AV8B":
        {
            _loadout = ["PylonMissile_1Rnd_LG_scalpel","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles","PylonRack_20Rnd_Rocket_03_HE_F","PylonMissile_1Rnd_LG_scalpel"];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_AP_Plane_CAS_02_F","Rocket_03_HE_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL","missiles_DAGR"]];
        };
        case "ASZ_EFA":
        {
            _loadout = ["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_7Rnd_Rocket_04_HE_F","","","","","PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["rocketLauncher", ["weapon_AGM_65Launcher","Rocket_04_HE_Plane_CAS_01_F"]];
            _plane setVariable ["missileLauncher", ["Rocket_04_AP_Plane_CAS_01_F"]];
        };
		//PLA
        case "PLAAF_Fighter_J10":
        {
            _loadout = ["LK_130mmRocketX4_HE","LK_90mmRocketX14_HE_2","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ9E_AGM_X2","LK_57mmRocketX20_HE","PylonMissile_LK_YJ91_AGM_X1"];
            _plane setVariable ["mainGun", "Fighter_Gun_23mm_lk"];
            _plane setVariable ["rocketLauncher", ["Rocket_130mm_HE_LK","Rocket_90mm_HE_LK","Rocket_57mm_HE_LK"]];
            _plane setVariable ["missileLauncher", ["LK_weapon_YJ91Launcher","LK_weapon_YJ9ELauncher"]];
        };
        case "PLAAF_Fighter_J20":
        {
            _loadout = ["PylonMissile_LK_YJ9E_AGM_X2","PylonMissile_LK_YJ9E_AGM_X2","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ9E_AGM_X1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ91_AGM_X1"];
            _plane setVariable ["missileLauncher", ["LK_weapon_YJ9ELauncher","LK_weapon_YJ91Launcher"]];
        };
        case "PLAAF_Fighter_J11":
        {
            _loadout = ["LK_57mmRocketX20_HE","LK_130mmRocketX8_HE","LK_57mmRocketX40_HE","LK_57mmRocketX40_HE","LK_130mmRocketX8_HE","LK_57mmRocketX20_HE","PylonMissile_LK_YJ9E_AGM_X2","PylonMissile_LK_YJ9E_AGM_X2","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ9E_AGM_X1","PylonMissile_LK_YJ9E_AGM_X1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["rocketLauncher", ["Rocket_57mm_HE_LK","Rocket_130mm_HE_LK"]];
            _plane setVariable ["missileLauncher", ["LK_weapon_YJ91Launcher","LK_weapon_YJ9ELauncher"]];
        };
        case "PLAAF_Fighter_J15":
        {
            _loadout = ["LK_57mmRocketX20_HE","LK_90mmRocketX14_HE_2","PylonMissile_LK_YJ9E_AGM_X2","PylonMissile_LK_YJ9E_AGM_X2","LK_90mmRocketX14_HE_2","LK_57mmRocketX20_HE","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ9E_AGM_X1","PylonMissile_LK_YJ9E_AGM_X1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["rocketLauncher", ["Rocket_57mm_HE_LK","Rocket_90mm_HE_LK"]];
            _plane setVariable ["missileLauncher", ["LK_weapon_YJ91Launcher","LK_weapon_YJ9ELauncher","weapon_AGM_KH25Launcher"]];
        };
        case "PLAAF_Fighter_J16":
        {
            _loadout = ["LK_130mmRocketX4_HE","LK_130mmRocketX8_HE","LK_130mmRocketX8_HE","LK_130mmRocketX8_HE","LK_130mmRocketX8_HE","LK_130mmRocketX4_HE","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ91_AGM_X1","PylonMissile_LK_YJ9E_AGM_X1","PylonMissile_LK_YJ9E_AGM_X1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["rocketLauncher", ["Rocket_130mm_HE_LK"]];
            _plane setVariable ["missileLauncher", ["LK_weapon_YJ91Launcher","weapon_AGM_KH25Launcher","LK_weapon_YJ9ELauncher"]];
        };
        case "O_mas_chi_Plane_CAS_02_F":
        {
            _loadout = ["PylonMissile_1Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_4Rnd_LG_scalpel","PylonMissile_1Rnd_LG_scalpel"];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_HE_Plane_CAS_02_F","Rocket_03_AP_Plane_CAS_02_F","rockets_Skyfire"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_01_Plane_CAS_02_F","missiles_SCALPEL"]];
        };
        case "O_mas_chi_Plane_Fighter_02_F":
        {
            _loadout = ["PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_KH58_x1","PylonMissile_Missile_KH58_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_KH58_INT_x1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["missileLauncher", ["weapon_AGM_KH25Launcher","weapon_KH58Launcher"]];
        };
		//Project RACS
        case "PRACS_F16CJ":
        {
            _loadout = ["","","","","PRACS_AGM154_ARM_Unitary_X2","PRACS_AGM154_ARM_CBU_X2","PRACS_Zuni_5_X12","PRACS_70mm_FFAR_CBU_X57","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["rocketLauncher", ["PRACS_Zuni_Launcher","PRACS_FFARLauncher_CBU"]];
            _plane setVariable ["missileLauncher", ["PRACS_JSOW_ARM_Unitary_launcher","PRACS_JSOW_ARM_CBU_launcher"]];
        };
        case "PRACS_F16CJR":
        {
            _loadout = ["","","","","PRACS_AGM88_X1","PRACS_AGM88_X1","PRACS_Exocet_X1","PRACS_AGM142_X1","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AGM88_launcher","PRACS_Exocet_launcher","PRACS_AGM142_launcher"]];
        };
        case "PRACS_F16":
        {
            _loadout = ["","","","","PRACS_Harpoon_X1","PRACS_70mm_FFAR_X57","PRACS_70mm_FFAR_WP_X57","PRACS_70mm_FFAR_CBU_X57","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["rocketLauncher", ["PRACS_FFARLauncher","PRACS_FFARLauncher_WP","PRACS_FFARLauncher_CBU"]];
            _plane setVariable ["missileLauncher", ["PRACS_Harpoon_launcher"]];
        };
        case "PRACS_Mohawk_Navy";
        case "PRACS_Mohawk":
        {
            _loadout = ["PRACS_70mm_FFAR_Left_X38","PRACS_Hellfire_LSR_X2","PRACS_70mm_AP_X19","PRACS_SeaEagle_X1","PRACS_70mm_WP_X19","PRACS_70mm_FFAR_X7"];
            _plane setVariable ["mainGun", "PRACS_MR39B_20mm"];
            _plane setVariable ["rocketLauncher", ["PRACS_FFARLauncher_AP","PRACS_FFARLauncher_WP"]];
            _plane setVariable ["missileLauncher", ["PRACS_AGM114K_Launcher","PRACS_SeaEagle_launcher"]];
        };
        case "PRACS_MirageIII":
        {
            _loadout = ["PRACS_70mm_WP_X19","PRACS_Zuni_5_X4","PRACS_70mm_FFAR_X19","PRACS_70mm_CBU_X19","PRACS_Zuni_5_X12"];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["rocketLauncher", ["PRACS_FFARLauncher_WP","PRACS_Zuni_Launcher","PRACS_FFARLauncher","PRACS_FFARLauncher_CBU"]];
        };
        case "PRACS_MirageV":
        {
            _loadout = ["PRACS_70mm_WP_X19","PRACS_70mm_FFAR_X19","PRACS_Delilah_X1","PRACS_AGM88_X1","PRACS_AGM142_X1","PRACS_AGM142_X1","PRACS_CBU_100_X1","PRACS_CBU_100_X1","PRACS_Exocet_X1"];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["bombRacks", ["PRACS_CBU_100_Launcher"]];
            _plane setVariable ["rocketLauncher", ["PRACS_FFARLauncher","PRACS_FFARLauncher_WP"]];
            _plane setVariable ["missileLauncher", ["PRACS_Delilah_launcher","PRACS_AGM88_launcher","PRACS_AGM142_launcher","PRACS_Exocet_launcher"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "PRACS_A4M_Navy";
        case "PRACS_A4M_Marine";
        case "PRACS_A4M":
        {
            _loadout = ["PRACS_SeaSkua_X1","PRACS_70mm_AP_X19","PRACS_70mm_CBU_X19","PRACS_70mm_WP_X19","PRACS_70mm_FFAR_X19"];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["rocketLauncher", ["PRACS_FFARLauncher_AP","PRACS_FFARLauncher_CBU","PRACS_FFARLauncher_WP"]];
            _plane setVariable ["missileLauncher", ["PRACS_SeaSkua_launcher"]];
        };
        case "PRACS_P3C":
        {
            _loadout = ["PRACS_Harpoon_X1","PRACS_AGM65_B_X1","PRACS_Exocet_X1","PRACS_Exocet_X1","PRACS_Exocet_X1","PRACS_SeaSkua_X1","PRACS_Delilah_X1","PRACS_AGM65_TL_X1"];
            _plane setVariable ["missileLauncher", ["PRACS_Harpoon_launcher","PRACS_AGM65B_launcher","PRACS_Exocet_launcher","PRACS_SeaSkua_launcher","PRACS_Delilah_launcher","PRACS_AGM65_launcher"]];
        };
        ///RACS (SLA)
        case "PRACS_SLA_MiG21":
        {
            _loadout = ["","","rhs_mag_b13l_s13of","rhs_mag_ub16_s5ko"];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_23"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s13of","rhs_weap_s5ko"]];
        };
        case "PRACS_SLA_MiG23":
        {
            _loadout = ["","","rhs_mag_ub32_s5k1","rhs_mag_ub32_s5ko"];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_23"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s5k1","rhs_weap_s5ko"]];
        };
        case "PRACS_SLA_MiG27":
        {
            _loadout = ["rhs_mag_ub32_s5k1","rhs_mag_ub32_s5m1","rhs_mag_ub32_s5ko","rhs_mag_ub32_s5","",""];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_30"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s5k1","rhs_weap_s5m1","rhs_weap_s5ko","rhs_weap_s5"]];
        };
        case "PRACS_SLA_MIG28":
        {
            _loadout = ["","","rhs_mag_ub16_s5ko","rhs_mag_b13l_s13df","PRACS_Kh35_X1","rhs_mag_ub16_s5ko"];
            _plane setVariable ["mainGun", "PRACS_NR23_23mm"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s5ko","rhs_weap_s13df"]];
            _plane setVariable ["missileLauncher", ["PRACS_KH35_launcher"]];
        };
        case "PRACS_SLA_SU22":
        {
            _loadout = ["","","rhs_mag_ub32_s5m1","rhs_mag_ub32_s5ko","rhs_mag_ub32_s5","PRACS_KH29D_X1","PRACS_Kh25_mp_X1","PRACS_Kh25_ml_X1","","","","","",""];
            _plane setVariable ["mainGun", "PRACS_NR30_30mm"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s5ko","rhs_weap_s5m1","rhs_weap_s5"]];
            _plane setVariable ["missileLauncher", ["PRACS_KH29_D_launcher","PRACS_Kh25_mp_launcher","PRACS_Kh25_ml_launcher"]];
        };
        case "PRACS_SLA_Su25":
        {
            _loadout = ["","","PRACS_Kh25_mtp_X1","PRACS_Kh25_X1","rhs_mag_b13l_s13df","rhs_mag_ub32_s5ko","rhs_mag_b13l_s13of","rhs_mag_b13l_s13t","rhs_mag_b13l_s13b","PRACS_KH29MP_X1"];
            _plane setVariable ["mainGun", "PRACS_GSH_30_2_30mm"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s13","PRACS_Kh25_launcher","rhs_weap_s13df","rhs_weap_s5ko","rhs_weap_s13of","rhs_weap_s13t"]];
            _plane setVariable ["missileLauncher", ["PRACS_Kh25_mtp_launcher","PRACS_KH29_MP_launcher"]];
        };
        default
        {
            Error_1("Plane type %1 currently not supported for CAS, please add the case!", typeOf _plane);
        };
    };
};
if (_type == "AA") then
{
    switch (typeOf _plane) do
    {
        //Vanilla NATO CAS (A-10)
        case "B_D_Plane_CAS_01_dynamicLoadout_lxWS";
        case "B_W_Plane_CAS_01_dynamicLoadout_F"; 
        case "B_T_Plane_CAS_01_dynamicLoadout_F";
        case "B_Plane_CAS_01_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_04_F","","PylonRack_1Rnd_AAA_missiles","","","","","PylonRack_1Rnd_AAA_missiles","","PylonRack_1Rnd_Missile_AA_04_F"];
            _plane setVariable ["mainGun", "Gatling_30mm_Plane_CAS_01_F"];
        };
        //Vanilla CSAT CAS
        case "Atlas_O_W_Plane_CAS_02_dynamicLoadout_ghex_F";
        case "O_T_Plane_CAS_02_dynamicLoadout_ghex_F";
        case "O_R_Plane_CAS_02_dynamicLoadout_F";
        case "O_R_Plane_CAS_02_dynamicLoadout_ard_F";
        case "O_Plane_CAS_02_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","","","","","","","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F"];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
        };

        //Vanilla IND CAS
        case "O_A_Plane_Fighter_03_dynamicLoadout_F";
        case "Atlas_O_T_Plane_Fighter_03_dynamicLoadout_F";
        case "I_Plane_Fighter_03_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
        };
        //Vanilla NATO Air superiority fighter
        case "Atlas_B_G_Plane_Fighter_01_Stealth_F";
        case "Atlas_B_G_Plane_Fighter_01_Stealth_ard_F";
        case "B_D_Plane_Fighter_01_Stealth_F";
        case "B_T_Plane_Fighter_01_Stealth_F";
        case "B_W_Plane_Fighter_01_Stealth_F";
        case "B_Plane_Fighter_01_Stealth_F":
        {
            _loadout = ["PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["missileLauncher", ["weapon_BIM9xLauncher","weapon_AMRAAMLauncher"]];
        };
        //Vanilla CSAT Air superiority fighter
        case "O_T_Plane_Fighter_02_Stealth_ghex_F";
        case "O_R_Plane_Fighter_02_Stealth_F";
        case "O_R_Plane_Fighter_02_Stealth_ard_F";
        case "O_Plane_Fighter_02_Stealth_F":
        {
            _loadout = ["magazine_Fighter02_Gun30mm_AA_x180","Laserbatteries","240Rnd_CMFlare_Chaff_Magazine","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["missileLauncher", ["weapon_R73Launcher","weapon_R77Launcher"]];
        };
        //Vanilla IND Air superiority fighter
        case "CUP_I_JAS_39_RACS";
        case "CUP_I_JAS_39_HIL";
        case "UK3CB_AAF_B_Gripen";
        case "Aegis_B_E_Plane_Fighter_04_F"; 
        case "Atlas_B_M_Plane_Fighter_04_F";
        case "I_Plane_Fighter_04_F":
        {
            _loadout = ["magazine_Fighter04_Gun20mm_AA_x250","Laserbatteries","240Rnd_CMFlare_Chaff_Magazine","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x2","PylonRack_Missile_AMRAAM_C_x2"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["missileLauncher", ["weapon_BIM9xLauncher","weapon_AMRAAMLauncher"]];
        };
        //Vanilla CSAT VTOL
        case "O_T_VTOL_02_vehicle_dynamicLoadout_F";
        case "O_T_VTOL_02_infantry_dynamicLoadout_F";
        case "O_VTOL_02_vehicle_dynamicLoadout_F";
        case "O_VTOL_02_infantry_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F"];
            _plane setVariable ["mainGun", "gatling_30mm_VTOL_02"];
            _plane setVariable ["missileLauncher", ["Missile_AA_03_Plane_CAS_02_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla JETS UAV
        case "B_UAV_05_F":
        {
            _loadout = ["PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
            _plane setVariable ["missileLauncher", ["missiles_ASRAAM","Missile_AA_04_Plane_CAS_01_F"]];
            _plane setVariable ["diveParams", [1000, 600, 180, 55, 20, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        //Vanilla UAV
        case "I_UAV_02_dynamicLoadout_F";
        case "O_UAV_02_dynamicLoadout_F";
        case "B_UAV_02_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
            _plane setVariable ["missileLauncher", ["missiles_ASRAAM","Missile_AA_04_Plane_CAS_01_F"]];
            _plane setVariable ["diveParams", [600, 400, 180, 55, 25, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
	    ///Aegis/Atlas
        case "Atlas_B_A_Plane_Fighter_05_Stealth_F";
        case "Atlas_B_A_Plane_Fighter_05_Stealth_ard_F";
        case "Atlas_B_A_Plane_Fighter_05_Stealth_trp_F";
        case "B_A_Plane_Fighter_05_Stealth_F";
        case "B_A_Plane_Fighter_05_Stealth_tna_F";
        case "B_A_Plane_Fighter_05_Stealth_wdl_F";
        case "B_Plane_Fighter_05_Stealth_F";
        case "B_D_Plane_Fighter_05_Stealth_F";
        case "B_T_Plane_Fighter_05_Stealth_F";
        case "B_W_Plane_Fighter_05_Stealth_F";
        case "Atlas_I_I_Plane_Fighter_05_Stealth_F":
        {
            _loadout = [/* "Laserbatteries","240Rnd_CMFlare_Chaff_Magazine", */"PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1"/* ,"PylonWeapon_220Rnd_25mm_shells" */];
            _plane setVariable ["mainGun", "gatling_25mm"];
            _plane setVariable ["missileLauncher", ["weapon_AMRAAMLauncher"]];
        };
        //Vanilla-Aegis IND CAS //different case due to additional weapons not present in vanilla //in templates should use one of these classnames with proper variant skin
        case "O_A_Plane_Fighter_03_dynamicLoadout_F";
        case "Atlas_O_T_Plane_Fighter_03_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_19Rnd_Rocket_Skyfire","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_7Rnd_Rocket_50mm","PylonWeapon_300Rnd_20mm_shells","PylonRack_6Rnd_Vikhr_missiles"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm_gunpod"];
        };
        //RHS US Air superiority fighter
        case "rhsusf_f22":
        {
            _loadout = ["rhs_mag_Sidewinder_int","rhs_mag_aim120d_int","rhs_mag_aim120d_2_F22_l","rhs_mag_aim120d_2_F22_r","rhs_mag_aim120d_int","rhs_mag_Sidewinder_int","rhsusf_ANALE52_CMFlare_Chaff_Magazine_x4"];
        };
        case "rhs_l159_cdf_b_CDF_CAP":
        {
            _loadout = ["rhs_mag_aim9m","rhs_mag_aim120","rhs_mag_aim120","rhs_mag_zpl20_mixed","rhs_mag_aim120","rhs_mag_aim120","rhs_mag_aim9m","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"];
        };
        //RHS Russian Air superiority
        case "rhs_mig29sm_vvs";
        case "rhs_mig29s_vvs";
        case "rhs_mig29sm_vvs";
        case "UK3CB_ARD_O_MIG29S";
        case "UK3CB_ARD_O_MIG29SM";
        case "rhsgref_cdf_b_mig29s";
        case "UK3CB_TKA_O_MIG29SM";
        case "UK3CB_CW_SOV_O_LATE_MIG29S";
        case "UK3CB_CW_SOV_O_LATE_MIG29SM";
        case "UK3CB_LDF_B_MIG29S";
        case "UK3CB_LDF_B_MIG29SM";
        case "UK3CB_KDF_B_MIG29SM";
        case "UK3CB_AAF_O_MIG29S":
        {
            _loadout = ["rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R77_AKU170_MIG29","rhs_mag_R77_AKU170_MIG29","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"];
        };
        case "RHS_T50_vvs_generic_ext":
        {
            _loadout = ["rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R74M2_int","rhs_mag_R74M2_int","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170"];
        };
        case "rhssaf_airforce_o_l_18_101":
        {
            _loadout = ["rhs_mag_R27ER_APU470","rhs_mag_R27ER_APU470","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"];
        };
        case "UK3CB_ANA_B_L39_PYLON";
        case "UK3CB_KDF_B_L39_PYLON";
        case "UK3CB_ADA_I_L39_PYLON";
        case "UK3CB_TKA_B_L39_PYLON";
        case "UK3CB_KRG_B_L39_PYLON";
        case "UK3CB_LDF_B_L39_PYLON":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
        };
        case "UK3CB_CW_SOV_O_LATE_MIG21_AA";
        case "UK3CB_LDF_B_MIG21_AA";
        case "UK3CB_TKA_B_MIG21_AA":
        {
            _loadout = ["rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73"];
        };
        case "vn_b_air_f4c_cap":
        {
            _loadout = ["vn_fuel_f4_370_mag","vn_fuel_f4_370_mag","","","vn_fuel_f4_600_mag","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1"];
        };
        case "vn_b_air_f100d_cap":
        {
            _loadout = ["vn_rocket_ffar_f4_lau59_m229_he_x21","vn_rocket_ffar_f4_lau59_m229_he_x21","vn_fuel_f100_335_mag","vn_fuel_f100_335_mag","vn_missile_aim9e_mag_x1","vn_missile_aim9e_mag_x1"];
        };
        case "vn_o_air_mig19_cap":
        {
            _loadout = ["vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1"];
        };
        case "vn_o_air_mig21_cap":
        {
            _loadout = ["vn_missile_mig21_aa2_mag_x1","vn_missile_mig21_aa2_mag_x1","vn_gunpod_gsh23l_v_200_mag"];
        };
        case "UK3CB_B_Mystere_HIDF_AA1";
        case "UK3CB_MDF_B_Mystere_AA1":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
        };
        // cup aircraft
        case "CUP_I_L39_AAF";
        case "CUP_O_L39_TK";
        case "CUP_B_L39_CZ":
        {
            _loadout = ["PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1"];
        };
        case "CUP_I_SU34_AAF";
        case "CUP_B_SU34_CDF";
        case "CUP_O_SU34_RU";
        case "CUP_O_SU34_SLA":
        {
            _loadout = ["CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel"];
        };
        case "CUP_B_F35B_USMC":
        {
            _loadout = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonWeapon_220Rnd_TE1_Red_Tracer_GAU22_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"];
        };
        case "CUP_B_GR9_DYN_GB":
        {
            _loadout = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_ALQ_131","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"];
        };
        case "CUP_I_AV8B_DYN_AAF";
        case "CUP_B_AV8B_DYN_USMC":
        {
            _loadout = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"];
        };
        case "CUP_I_JAS39_RACS":
        {
            _loadout = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M"];
        };
		case "cwr3_o_mig23":
        {
            _loadout = ["PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1"];
        };
        //Unsung
        case "uns_f100b_CAP":
        {
            _loadout = ["uns_pylonRack_1Rnd_AIM9D","uns_pylonRack_1Rnd_AIM9D","uns_pylonRack_1Rnd_fuel_f100","uns_pylonRack_1Rnd_fuel_f100","uns_pylonRack_1Rnd_AIM9D","uns_pylonRack_1Rnd_AIM9D","uns_pylonRack_1Rnd_fuel_f100"];
        };
        case "uns_F4E_CAP":
        {
            _loadout = ["uns_pylonRack_1Rnd_fuel_f4","uns_pylonRack_1Rnd_fuel_f4","","","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_fuel_f4"];
        };
        case "uns_Mig21_CAP":
        {
            _loadout = ["uns_pylonRack_1Rnd_K13","uns_pylonRack_1Rnd_K13","uns_pylonRack_1Rnd_K13","uns_pylonRack_1Rnd_K13","uns_pylonRack_1rnd_fuel_mig21","uns_pylonRack_1rnd_fuel_mig21","uns_pylonRack_1rnd_fuel_mig21"];

        };
        //SEAD but no other Ground Weapons so AA
        case "Tornado_AWS_ecr_ger":
        {
            _loadout = ["Tornado_AWS_AIRCMpod_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","","FIR_AGM88_P_1rnd_M","FIR_AGM88_P_1rnd_M","","","","Tornado_AWS_fuelsmall_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_ECMpod_1rnd_M","",""];
        };
        case "Tornado_AWS_GER":
        {
            _loadout = ["Tornado_AWS_AIRCMpod_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_Litening_std_P_1rnd_M","FIR_Brimstone_type1_P_3rnd_M","FIR_Brimstone_type1_P_3rnd_M","FIR_GBU12_P_1rnd_M","FIR_Brimstone_type2_P_3rnd_M","FIR_Brimstone_type2_P_3rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_ECMpod_1rnd_M","FIR_BK27_R_M","FIR_BK27_L_M"];
        };
        case "LIB_FW190F8";
	    case "LIB_DAK_FW190F8";
        case "LIB_FW190F8_w": 
        {
            _loadout = ["LIB_1Rnd_SC50", "LIB_1Rnd_SC50", "LIB_1Rnd_SC50", "LIB_1Rnd_SC50", "LIB_1Rnd_SC50"];
        };
        case "LIB_P39";
        case "LIB_RAF_P39";
        case "LIB_US_P39";
        case "LIB_US_NAC_P39";
        case "LIB_P39_w": 
        {
            _loadout = ["LIB_1Rnd_SC250"];
        };
	    // Clone Wars Planes (3AS)
        case "3AS_ARC_170_Red";
		case "3AS_ARC_170_Yellow";
        case "3AS_ARC_170_Orange";
        case "3AS_ARC_170_Green";
        case "3AS_ARC_170_Blue":
        {
            _loadout = ["PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_D_x2","PylonRack_Missile_AMRAAM_D_x2","PylonRack_Missile_AMRAAM_D_x1","PylonRack_Missile_AMRAAM_D_x1"];
            _plane setVariable ["mainGun", "3as_ARC_Light_Canon"];
            _plane setVariable ["missileLauncher", ["weapon_BIM9xLauncher","weapon_AMRAAMLauncher"]];
        };
        case "3as_Tri_Fighter_dynamicLoadout":
        {
            _loadout = ["3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA"];
            _plane setVariable ["mainGun", "3AS_Vulture_Cannon"];
            _plane setVariable ["missileLauncher", ["3AS_Vulture_Missile_AA_F"]];
        };
        case "3AS_CIS_Vulture_F";
        case "3AS_CIS_Vulture_CAS_F":
        {
            _loadout = ["3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA","3AS_PylonRack_Vulture_1Rnd_Missile_AA"];
            _plane setVariable ["mainGun", "3AS_Vulture_Cannon"];
            _plane setVariable ["missileLauncher", ["3AS_Vulture_Missile_AA_F"]];
        };
        case "3AS_SandSpeeder";
        case "3AS_SnowSpeeder";
        case "3AS_Snowspeeder_Blue";
        case "3AS_Snowspeeder_Rogue":
        {
            _loadout = ["3AS_700Rnd_T47_20mm_AA"];
            _plane setVariable ["mainGun", "3AS_T47_20mm_AA_Cannon"];
        };
        case "3AS_VWing_Imperial";
        case "3as_Vwing_base":
        {
            _loadout = ["3as_PylonMissile_ARC_2Rnd_Missile_AA","3as_PylonMissile_ARC_2Rnd_Missile_AA","3as_PylonMissile_ARC_2Rnd_Missile_AA","3as_PylonMissile_ARC_2Rnd_Missile_AA","PylonRack_Missile_AMRAAM_C_x2","PylonRack_Missile_AMRAAM_C_x2"];
            _plane setVariable ["mainGun", "3as_Vwing_Medium_Cannon"];            
            _plane setVariable ["missileLauncher", ["3AS_ARC_Missile_AA","weapon_AMRAAMLauncher"]];
        };
        case "3as_V19_base":
        {
            _loadout = ["3as_PylonMissile_ARC_2Rnd_Missile_AA","3as_PylonMissile_ARC_2Rnd_Missile_AA","3as_PylonMissile_ARC_2Rnd_Missile_AA","3as_PylonMissile_ARC_2Rnd_Missile_AA","PylonRack_Missile_AMRAAM_C_x2","PylonRack_Missile_AMRAAM_C_x2"];
            _plane setVariable ["mainGun", "3as_V19_Medium_Cannon"];
            _plane setVariable ["missileLauncher", ["3AS_ARC_Missile_AA","weapon_AMRAAMLauncher"]];
        };
        case "3AS_Z95_Republic";
        case "3AS_Z95_Blue";
        case "3AS_Z95_Green";
        case "3AS_Z95_Orange";
        case "3AS_Z95_Yellow":
        {
            _loadout = ["PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x1","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_D_x2","PylonRack_Missile_AMRAAM_D_x2","3as_PylonWeapon_Z95_240Rnd_Heavy_Shells"];
            _plane setVariable ["mainGun", "3as_Z95_Heavy_Cannon"];
            _plane setVariable ["missileLauncher", ["weapon_BIM9xLauncher","weapon_AMRAAMLauncher"]];
        };
        case "3AS_Delta7_F";
        case "3AS_Delta7_TANO";
        case "3AS_Delta7_ANI";
        case "3AS_Delta7_Blue";
        case "3AS_Delta7_Orange";
        case "3AS_Delta7_PLO";
        case "3AS_Delta7_Purple";
        case "3AS_Delta7_Green":
        {
            _loadout = ["3AS_500Rnd_Delta7_20mm_AA","3AS_500Rnd_Delta7_20mm_AA"];
            _plane setVariable ["mainGun", "3AS_Delta7_20mm_AA_Cannon"];
        };
	//FFAA
        case "ffaa_ar_harrier":
        {
            _loadout = ["PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_BIM9X_x2"];
            _plane setVariable ["mainGun", "ffaa_cannon_gau12"];
            _plane setVariable ["missileLauncher", ["weapon_BIM9xLauncher","weapon_AMRAAMLauncher"]];
        };
        case "ffaa_ea_ef18m":
        {
            _loadout = ["PylonMissile_1Rnd_Missile_AA_04_F","PylonRack_Missile_AMRAAM_C_x2","PylonRack_Missile_BIM9X_x2","PylonMissile_Missile_AMRAAM_C_x1","ffaa_ef18m_Fueltank_1rnd_M","PylonMissile_Missile_AMRAAM_C_x1","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_D_x2","PylonMissile_1Rnd_Missile_AA_04_F"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["missileLauncher", ["Missile_AA_04_Plane_CAS_01_F","weapon_AMRAAMLauncher","weapon_BIM9xLauncher"]];
        };
	//Pedagne
        case "ASZ_AV8B":
        {
            _loadout = ["PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonRack_1Rnd_Missile_AA_03_F","PylonMissile_1Rnd_Missile_AA_04_F"];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["missileLauncher", ["Missile_AA_04_Plane_CAS_01_F","missiles_Zephyr","Missile_AA_03_Plane_CAS_02_F"]];
        };
        case "ASZ_EFA":
        {
            _loadout = ["PylonRack_Missile_BIM9X_x2","PylonRack_Missile_AMRAAM_D_x2","PylonRack_1Rnd_Missile_AA_04_F","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_1Rnd_Missile_AA_04_F","PylonRack_Missile_AMRAAM_D_x2","PylonRack_Missile_BIM9X_x2"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["missileLauncher", ["weapon_BIM9xLauncher","weapon_AMRAAMLauncher","Missile_AA_04_Plane_CAS_01_F"]];
        };
	//PLA
        case "PLAAF_Fighter_J10":
        {
            _loadout = ["PylonMissile_Missile_AA_R73_x1","PylonMissile_LK_PL10_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL10_AAM_X2","PylonMissile_Missile_AA_R77_x1","PylonMissile_LK_PL15_AAM_X2"];
            _plane setVariable ["mainGun", "Fighter_Gun_23mm_lk"];
            _plane setVariable ["missileLauncher", ["LK_weapon_PL10Launcher","LK_weapon_PL15Launcher","weapon_R73Launcher","weapon_R77Launcher"]];
        };
        case "PLAAF_Fighter_J20":
        {
            _loadout = ["PylonMissile_LK_PL10_AAM_X2","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X1","PylonMissile_LK_PL15_AAM_X2","PylonMissile_Missile_AA_R77_x1"];
            _plane setVariable ["missileLauncher", ["LK_weapon_PL10Launcher","LK_weapon_PL15Launcher","weapon_R73Launcher","weapon_R77Launcher"]];
        };
        case "PLAAF_Fighter_J11":
        {
            _loadout = ["PylonMissile_LK_PL10_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL10_AAM_X2","PylonMissile_LK_PL10_AAM_X2","PylonMissile_LK_PL10_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL10_AAM_X1","PylonMissile_LK_PL10_AAM_X1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["missileLauncher", ["LK_weapon_PL10Launcher","LK_weapon_PL15Launcher"]];
        };
        case "PLAAF_Fighter_J15":
        {
            _loadout = ["PylonMissile_LK_PL10_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL10_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL10_AAM_X1","PylonMissile_LK_PL10_AAM_X1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["missileLauncher", ["LK_weapon_PL10Launcher","LK_weapon_PL15Launcher"]];
        };
        case "PLAAF_Fighter_J16":
        {
            _loadout = ["PylonMissile_LK_PL10_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL10_AAM_X2","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL15_AAM_X2","PylonMissile_LK_PL10_AAM_X1","PylonMissile_LK_PL10_AAM_X1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["missileLauncher", ["LK_weapon_PL10Launcher","LK_weapon_PL15Launcher","weapon_R73Launcher","weapon_R77Launcher"]];
        };
        case "O_mas_chi_Plane_Fighter_02_F":
        {
            _loadout = ["PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun_30mm"];
            _plane setVariable ["missileLauncher", ["weapon_R73Launcher","weapon_R77Launcher"]];
        };
	//Jms Empire
        case "JMSLLTE_TIEinterceptor_veh_F": 
        {
            _loadout = [];
        };
	//Project RACS
        case "PRACS_F16CJ":
        {
            _loadout = ["PRACS_AIM9M_WT_X1","PRACS_AIM120_WT_X1","PRACS_Python_5_WT_X1","PRACS_R550_WT_X1","PRACS_Python_5_X1","PRACS_Python_5_X1","PRACS_F16_Wingtanks_X1","PRACS_F16_Wingtanks_X1","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AIM120_Launcher","PRACS_AIM9M_Launcher","PRACS_Python_5_Launcher","PRACS_R550_Launcher"]];
        };
        case "PRACS_F16CJR":
        {
            _loadout = ["PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_Mk81_MERX3","PRACS_Zuni_5_X4","PRACS_F16_Wingtanks_X1","PRACS_F16_Wingtanks_X1","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AIM9M_Launcher","PRACS_Mk81_Launcher","PRACS_Zuni_Launcher"]];
        };
        case "PRACS_F16":
        {
            _loadout = ["PRACS_R550_WT_X1","PRACS_R550_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM9M_WT_X1","PRACS_AIM7_X1","PRACS_AIM7_X1","PRACS_AIM120_X2","PRACS_AIM120_X2","PRACS_F16_Bellytank_X1","PRACS_F16_CFT_X1"];
            _plane setVariable ["mainGun", "PRACS_M61A2_20mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AIM9M_Launcher","PRACS_AIM120_Launcher","PRACS_AIM7_Launcher","PRACS_R550_Launcher"]];
        };
        case "PRACS_Mohawk_Navy";
        case "PRACS_Mohawk":
        {
            _loadout = ["PRACS_AIM9M_X1","PRACS_AIM9M_X1","PRACS_70mm_AP_X19","PRACS_70mm_FFAR_X19","PRACS_70mm_FFAR_X19","PRACS_70mm_FFAR_X19"];
            _plane setVariable ["mainGun", "PRACS_MR39B_20mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AIM9M_Launcher"]];
        };
        case "PRACS_MirageIII":
        {
            _loadout = ["PRACS_Python_5_X1","PRACS_Python_5_X1","PRACS_AIM120_X2","PRACS_AIM120_X2","PRACS_R530D_X1"];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AIM120_Launcher","PRACS_Python_5_Launcher","PRACS_R530D_Launcher"]];
        };
        case "PRACS_MirageV":
        {
            _loadout = ["PRACS_AIM9M_X1","PRACS_AIM9M_X1","PRACS_AIM7_X1","PRACS_AIM7_X1","PRACS_Python_5_X1","PRACS_Python_5_X1","","","PRACS_R530_IR_X1"];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AIM9M_Launcher","PRACS_AIM7_Launcher","PRACS_Python_5_Launcher","PRACS_R530_IR_Launcher"]];
        };
        case "PRACS_A4M_Navy";
        case "PRACS_A4M_Marine";
        case "PRACS_A4M":
        {
            _loadout = ["PRACS_AGM65_F_X2","PRACS_AGM65_F_X2","PRACS_R550_X1","PRACS_R550_X1",""];
            _plane setVariable ["mainGun", "PRACS_DEFA_552_30mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AGM65F_launcher","PRACS_R550_Launcher"]];
        };
        ///RACS (SLA)
        case "PRACS_SLA_MiG21":
        {
            _loadout = ["PRACS_AA2_X1","PRACS_AA8_X2_R","PRACS_AA10R_X1","PRACS_AA11_X1"];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_23"];
            _plane setVariable ["missileLauncher", ["PRACS_R60_Launcher","PRACS_AA2_Launcher","PRACS_AA10R_Launcher","PRACS_R73_Launcher"]];
        };
        case "PRACS_SLA_MiG23":
        {
            _loadout = ["PRACS_AA2_X1","PRACS_AA11_X1","PRACS_R24T_X1","PRACS_AA8_X2_R"];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_23"];
            _plane setVariable ["missileLauncher", ["PRACS_R60_Launcher","PRACS_AA2_Launcher","PRACS_R73_Launcher","PRACS_R24_IR_Launcher"]];
        };
        case "PRACS_SLA_MiG27":
        {
            _loadout = ["PRACS_AA11_X1","PRACS_AA11_X1","PRACS_FAB_100_M62_X1","PRACS_FAB_100_M62_X1","PRACS_FAB_100_M62_X1","PRACS_FAB_100_M62_X1"];
            _plane setVariable ["mainGun", "PRACS_Gsh_6_30"];
            _plane setVariable ["missileLauncher", ["PRACS_R73_Launcher","PRACS_FAB_100_M62_Launcher"]];
        };
        case "PRACS_SLA_MIG28":
        {
            _loadout = ["PRACS_AA2_X1_WT","PRACS_AA2_X1_WT","PRACS_AA2_X1","PRACS_AA11_X1","PRACS_R77_X1","PRACS_AA8_X1"];
            _plane setVariable ["mainGun", "PRACS_NR23_23mm"];
            _plane setVariable ["missileLauncher", ["PRACS_AA2_Launcher","PRACS_R60_Launcher","PRACS_R77_Launcher","PRACS_R73_Launcher"]];
        };
        case "PRACS_SLA_SU22":
        {
            _loadout = ["PRACS_AA11_X1","PRACS_AA8_X1","rhs_mag_upk23_mixed","rhs_mag_upk23_mixed","rhs_mag_upk23_mixed","rhs_mag_upk23_mixed","rhs_mag_ub32_s5","rhs_mag_ub32_s5","PRACS_FAB_100_X1","PRACS_FAB_100_X1","PRACS_FAB_100_X1","PRACS_FAB_100_X1","PRACS_FAB_100_X1","PRACS_FAB_100_X1"];
            _plane setVariable ["mainGun", "PRACS_NR30_30mm"];
            _plane setVariable ["missileLauncher", ["PRACS_R60_Launcher","PRACS_R73_Launcher"]];
        };
        case "PRACS_SLA_Su25":
        {
            _loadout = ["PRACS_AA11_X1","PRACS_AA8_X1","rhs_mag_ub32_s5","rhs_mag_ub32_s5","rhs_mag_upk23_ofzt","rhs_mag_upk23_ofz","rhs_mag_upk23_btz","rhs_mag_upk23_mixed","rhs_mag_upk23_mixed","rhs_mag_upk23_mixed"];
            _plane setVariable ["mainGun", "PRACS_GSH_30_2_30mm"];
            _plane setVariable ["missileLauncher", ["PRACS_R60_Launcher","PRACS_R73_Launcher"]];
        };
        default
        {
            Error_1("Plane type %1 currently not supported for AA, please add the case!", typeOf _plane);
        };
    };
};

if !(_loadout isEqualTo []) then
{
    Debug("Selected new loadout for plane, now equiping plane with it");
    {
        _plane setPylonLoadout [_forEachIndex + 1, _x, true];
        _plane setVariable ["loadout", _loadout];
    } forEach _loadout;
} else {
    _loadout = getPylonMagazines _plane; // hacky fix, but better than the alternative
    Debug(format["Selected default loadout for %1, now equiping plane with it. Consider giving it an actual loadout in ultimate\config\plane\cfgPlaneLoadouts.hpp", typeOf _plane]);
    {
        _plane setPylonLoadout [_forEachIndex + 1, _x, true];
        _plane setVariable ["loadout", _loadout];
    } forEach _loadout;
};

[format["Given plane class %1 a loadout of %2", typeOf _plane, _loadout], _fnc_scriptName] call A3U_fnc_log;
