    /*
        Each addon entry can use these values:
        addons[] = {};
        weapons = traderWeapons entry;
        vehicles = traderVehicles entry;

        Essentially, this is the core file. It links to other files.
        For example, if you load AMF it will add vehicles to the black market dealer.
        If you load Aegis, it will add both vehicles and weapons to their respective dealers.
        If you load AMF and Aegis, you'll get things from both.
    */
    
    class addons_kkiv2035 : addons_base
    {
        addons[] = {"Kio_Kkiv_2035"};
        weapons = "weapons_kkiv2035";
    };
    class addons_aegis : addons_base
    {
        addons[] = {"Weapons_1_F_lxWS","A3_Aegis_Armor_F_Aegis_APC_Tracked_02", "A3_Atlas_Armor_F_Atlas_APC_Tracked_02", "A3_Opf_Armor_F_Opf_APC_Tracked_02"};
        weapons = "weapons_aegis";
        vehicles = "vehicles_aegis";
    };
    class addons_amf : addons_base
    {
        addons[] = {"AMF_FAMAS", "r3f_armes"};
        vehicles = "vehicles_amf";
    };
    class addons_wmempire : addons_base
    {
        addons[] = {"WM_Rebels"};
        weapons = "weapons_wmempire";
        vehicles = "vehicles_wm";
    };
    class addons_empire : addons_base
    {
        addons[] = {"JMSLLTE_empire_mod"};
        weapons = "weapons_empire";
    };
    class addons_eaw : addons_base
    {
        addons[] = {"EAW_Air","WBK_MeleeMechanics"};
        weapons = "weapons_eaw";
        vehicles = "vehicles_eaw";
    };
    class addons_ww2fow : addons_base
    {
        addons[] = {"fow_tanks"};
        weapons = "weapons_ww2fow";
        vehicles = "vehicles_fow";
    };
    class addons_unsung : addons_base
    {
        addons[] = {"uns_weap_w"};
        weapons = "weapons_unsung";
        vehicles = "vehicles_unsung";
    };
    class addons_sogpf : addons_base
    {
        addons[] = {"vn_weapons"};
        weapons = "weapons_sogpf";
        vehicles = "vehicles_sog";
    };
    class addons_3cbf : addons_base
    {
        addons[] = {"UK3CB_Factions_Vehicles_SUV"};
        weapons = "weapons_3cbf";
        vehicles = "vehicles_3cbf";
    };
    class addons_ifa : addons_base
    {
        addons[] = {"IFA3_Core"};
        weapons = "weapons_ifa3";
        vehicles = "vehicles_ifa3";
    };
    class addons_spe : addons_base
    {
        addons[] = {"ww2_spe_assets_c_characters_germans_c"};
        weapons = "weapons_spe";
        vehicles = "vehicles_spe";
    };
    class addons_ffaa : addons_base
    {
        addons[] = {"ffaa_data"};
        weapons = "weapons_ffaa";
        vehicles = "vehicles_ffaa";
    };
    class addons_pedagne : addons_base
    {
        addons[] = {"ASZ_Weapons_A3"};
        weapons = "weapons_pedagne";
        vehicles = "vehicles_pedagne";
    };
    class addons_sfp : addons_base
    {
        addons[] = {"sfp_soldiers"};
        weapons = "weapons_sfp";
        vehicles = "vehicles_sfp";
    };
    class addons_pla : addons_base
    {
        addons[] = {"mas_chi_army"};
        weapons = "weapons_pla";
        vehicles = "vehicles_pla";
    };
    class addons_ws : addons_base
    {
        addons[] = {"Weapons_1_F_lxWS"};
        weapons = "weapons_ws";
        vehicles = "vehicles_ws"
    };
    class addons_rf : addons_base
    {
        addons[] = {"RF_Weapons"};
        weapons = "weapons_rf";
        // Needs vehicles doing, can use some of the technical variants I made in config fixes
    };
    class addons_racs : addons_base
    {
        addons[] = {"PRACS_Core", "PRACS_SLA_Core"};
        vehicles = "vehicles_racs";
    }; // might be smart to split these into PRACS and PRACS SLA, not a big priority though
    class addons_bwa3 : addons_base
    {
        addons[] = {"bwa3_common"};
        weapons = "weapons_bwa3";
        vehicles = "vehicles_bw";
    };
    class addons_cw : addons_base
    {
        addons[] = {"3AS_Characters", "442_equipment", "SWLB_clones", "JLTS_core", "CWDependencies"};
        weapons = "weapons_cw";
        vehicles = "vehicles_cw";
    };
    class addons_cup : addons_base
    {
        addons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        weapons = "weapons_cup";
        vehicles = "vehicles_cup";
    };
    class addons_csla : addons_base
    {
        addons[] = {"CSLA"};
        weapons = "weapons_csla";
    };
    class addons_3cbbaf : addons_base
    {
        addons[] = {"UK3CB_BAF_Weapons", "UK3CB_BAF_Vehicles", "UK3CB_BAF_Units_Common", "UK3CB_BAF_Equipment"};
        weapons = "weapons_3cbbaf";
        vehicles = "vehicles_3cbbaf";
    };
    class addons_rhs : addons_base
    {
        addons[] = {"rhsgref_main", "rhssaf_c_vehicles", "rhs_c_tanks", "RHS_US_A2Port_Armor"};
        weapons = "weapons_rhs";
        vehicles = "vehicles_rhs";
    }; // needs to be split into all 4 RHS mods, but only god knows the day that will happen
    class addons_optre : addons_base
    {
        addons[] = {"OPTRE_Core", "OPTRE_FC_Core"};
        weapons = "weapons_optre";
        vehicles = "vehicles_optre";
    }; // should probably be split up to optre and optre_fc
    class addons_gm : addons_base
    {
        addons[] = {"gm_core"};
        weapons = "weapons_gm";
        vehicles = "vehicles_gm";
    };
    class addons_niarms : addons_base
    {
        addons[] = {"hlcweapons_core"};
        weapons = "weapons_niarms";
    };
    class addons_fwa : addons_base
    {
        addons[] = {"sp_fwa_fal"};
        weapons = "weapons_fwa";
    };
    class addons_tow : addons_base
    {
        addons[] = {"Tier1_Weapons"};
        weapons = "weapons_tow";
    };
    class addons_tmt : addons_base
    {
        addons[] = {"TMT_Core"};
        vehicles = "vehicles_tmt";
    };
    class addons_tfc : addons_base
    {
        addons[] = {"TFC_Core_Data", "TFC_CA_Characters", "TFC_SF_Characters", "tfc_rcaf_cc130j"};
        vehicles = "vehicles_tfc";
    };
    class addons_sma : addons_base
    {
        addons[] = {"SMA_Weapons"};
        weapons = "weapons_sma";
    };
    class addons_csa38 : addons_base
    {
        addons[] = {"csa38ii_data"};
        weapons = "weapons_csa38";
        vehicles = "vehicles_csa38";
    };
    class addons_scion : addons_base
    {
        addons[] = {"sc_weapons"};
        weapons = "weapons_scion";
        vehicles = "vehicles_scion";
    };
    class addons_wrs : addons_base
    {
        addons[] = {"WBK_SciFiWeaponary"};
        weapons = "weapons_wrs";
    };
    class addons_braf : addons_base
    {
        addons[] = {"BRAF_Air"};
        weapons = "weapons_braf";
        vehicles = "vehicles_braf";
    };
    class addons_nfts : addons_base
    {
        addons[] = {"NORTH_Main"};
        weapons = "weapons_nfts";
        vehicles = "vehicles_nfts";
    };
    class addons_android : addons_base
    {
        addons[] = {"SSV_Android", "SSV_Vanguard", "OPTRE_Core"};
        vehicles = "vehicles_android";
    };
    class addons_cwr : addons_base
    {
        addons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "cwr3_weapons"};
        weapons = "weapons_cwriii";
        vehicles = "vehicles_cwriii";
    };
    class addons_cwrbaf : addons_base
    {
        addons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "cwr3_weapons", "cwr3_expansion_uk"};
        vehicles = "vehicles_cwriiibaf";
    };
    class addons_cwrusmc : addons_base
    {
        addons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "cwr3_weapons", "cwr3_expansion_usmc"};
        vehicles = "vehicles_cwriiiusmc";
    };
    class addons_flyleg : addons_base
    {
        addons[] = {"sab_flyinglegends"};
        vehicles = "vehicles_flyleg";
    };
    class addons_scrtwpns : addons_base
    {
        addons[] = {"sab_flyinglegends","sab_sw_i16"};
        vehicles = "vehicles_scrtwpns";
    };
    class addons_navleg : addons_base
    {
        addons[] = {"sab_navallegends"};
        vehicles = "vehicles_navleg";
    };
    class addons_ffp : addons_base
    {
        addons[] = {"Finnish_Forces_Pack"};
        weapons = "weapons_ffp";
        vehicles = "vehicles_ffp";
    };
    class addons_ffpxa185 : addons_base
    {
        addons[] = {"XA_185"};
        vehicles = "vehicles_ffpxa185";
    };
    class addons_hafm : addons_base
    {
        addons[] = {"HAFM_Acc"};
        weapons = "weapons_hafm";
        vehicles = "vehicles_hafm";
    };
    class addons_ylarms : addons_base
    {
        addons[] = {"YL_scripts"};
        weapons = "weapons_ylarms";
    };
    class addons_projinf : addons_base
    {
        addons[] = {"bnae_core"};
        weapons = "weapons_projinf";
    };
    class addons_jca : addons_base
    {
        addons[] = {"Weapons_F_JCA_IA","Weapons_F_JCA_IA_Accessories","Weapons_F_JCA_IA_LongRangeRifles_AWM","Weapons_F_JCA_IA_Pistols_P226","Weapons_F_JCA_IA_Pistols_P320","Weapons_F_JCA_IA_Rifles_M4A1","Weapons_F_JCA_IA_Rifles_M4A4","Weapons_F_JCA_IA_Rifles_SR10","Weapons_F_JCA_IA_Rifles_SR25","Weapons_F_JCA_IA_SMGs_MP5"};
        weapons = "weapons_jca";
    };
    class addons_FlexNorAF : addons_base
    {
        addons[] = {"Flex_CUP_NOR_Faction"};
        vehicles = "CUP_NorAF_Vehicles";
    };
    class addons_FlexNorAFF16 : addons_base
    {
        addons[] = {"F16_Norwegian_Reskin"};
        vehicles = "CUP_NorAF_F16";
    };