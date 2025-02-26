
class Templates
{
    class Base
    {
        description = "";
    };

    // ************************************** Western Sahara *******************************************************

    class WS_Base : Base
    {
        requiredAddons[] = {"Weapons_1_F_lxWS"};
        logo = "\lxWS\data_f_lxWS\Logos\arma3_lxws_logo_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\WS); //the path to the template folder
        priority = 1;
        equipFlags[] = {"vanilla"};
    };

    class WS_CSATandSFIA : WS_Base
    {
        side = "Inv";
        name = "WS CSAT&SFIA";
        flagTexture = QPATHTOFOLDER(Templates\Templates\WS\flags\CSAT_SFIA.paa);
        file = "WS_AI_CSAT&SFIA";
        maps[] = {"SefrouRamal", "takistan"};
        forceDLC[] = {"ws"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_csatandsfia;
    };

    class WS_NATOandUNA : WS_Base
    {
        side = "Occ";
        name = "WS NATO&UNA";
        flagTexture = QPATHTOFOLDER(Templates\Templates\WS\flags\NATO_UNA.paa);
        file = "WS_AI_NATO&UNA";
        maps[] = {"SefrouRamal", "takistan"};
        forceDLC[] = {"ws"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_natoanduna;
    };

    class WS_Civ : WS_Base
    {
        side = "Civ";
        flagTexture = "\lxws\data_f_lxws\img\flags\flag_Argana_CO.paa";
        name = "Western Sahara";
        file = "WS_Civ";
    };

    class WS_Tura : WS_Base
    {
        side = "Reb";
        flagTexture = "\lxws\data_f_lxws\img\Flags\flag_Argana_CO.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\WS);
        name = "Tura";
        file = "WS_Reb_Tura";
        maps[] = {"SefrouRamal", "takistan"};
        forceDLC[] = {"ws"};
        description = $STR_A3AP_setupFactionsTab_ws_tura;
    };

    class WS_Exegermenos : WS_Base
    {
        side = "Riv";
        flagTexture = "\A3\Data_F\Flags\Flag_red_CO.paa";
        name = "WS Exegerménos";
        file = "WS_Riv_Exegermenos";
        description = $STR_A3AP_setupFactionsTab_exegermenos;
    };

    class WS_Riv_ION : WS_Base
    {
        side = "Riv";
        flagTexture = "\lxws\data_f_lxws\img\flags\flag_ion_co.paa";
        name = "WS ION";
        file = "WS_Riv_ION";
        forceDLC[] = {"ws"};
        description = $STR_A3AP_setupFactionsTab_ion;
    };

    // ************************************** Vanilla *******************************************************

    class Vanilla_Base : Base
    {
        requiredAddons[] = {};
        logo = "a3\ui_f\data\logos\arma3_white_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\Vanilla); //the path to the template folder
        priority = 10;
        equipFlags[] = {"vanilla"};
        description = $STR_A3AP_setupFactionsTab_vanilla_generic;
    };

    class Vanilla_CSAT_Arid : Vanilla_Base
    {
        side = "Inv";
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
        name = "A3 CSAT Arid";
        file = "Vanilla_AI_CSAT_Arid";
        climate[] = {"arid", "arctic"};
        description = $STR_A3AP_setupFactionsTab_csat;
    };

    class Vanilla_CSATandAAF : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT&AAF";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Vanilla\flags\CSAT_AAF.paa);
        file = "Vanilla_AI_CSAT&AAF";
        priority = 5;
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_csatandaaf;
    };

    class Vanilla_CSAT_Temperate : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Temperate";
        file = "Vanilla_AI_CSAT_Temperate";
        climate[] = {"temperate","tropical"};
    };

    class Vanilla_NATO_Arid : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "A3 NATO Arid";
        file = "Vanilla_AI_NATO_Arid";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_nato;
    };

    class Vanilla_NATO_Temperate : Vanilla_NATO_Arid
    {
        name = "A3 NATO Temperate";
        file = "Vanilla_AI_NATO_Temperate";
        climate[] = {"temperate", "arctic"};
    };

    class Vanilla_NATO_Tropical : Vanilla_NATO_Arid
    {
        name = "A3 NATO Tropical";
        file = "Vanilla_AI_NATO_Tropical";
        climate[] = {"tropical"};
    };

    class Vanilla_NATOandAAF : Vanilla_NATO_Arid
    {
        name = "A3 NATO&AAF";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Vanilla\flags\NATO_AAF.paa);
        file = "Vanilla_AI_NATO&AAF";
        priority = 5;
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_natoandaaf;
    };

    class Vanilla_NATOandLDF_Arid : Vanilla_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Vanilla\flags\NATO_LDF.paa);
        name = "A3 NATO&LDF Arid";
        file = "Vanilla_AI_NATO&LDF_Arid";
        priority = 5;
        climate[] = {"arid"};
        forceDLC[] = {"enoch"};
        description = $STR_A3AP_setupFactionsTab_natoandldf;
    };

    class Vanilla_NATOandLDF_Temperate : Vanilla_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Vanilla\flags\NATO_LDF.paa);
        name = "A3 NATO&LDF Temparate";
        file = "Vanilla_AI_NATO&LDF_Temperate";
        priority = 5;
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
        description = $STR_A3AP_setupFactionsTab_natoandldf;
    };

    class Vanilla_LDF : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "A3 LDF";
        file = "Vanilla_AI_LDF";
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
        description = $STR_A3AP_setupFactionsTab_ldf;
    };

    class Vanilla_AAF : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "A3 AAF";
        file = "Vanilla_AI_AAF";
        maps[] = {"altis", "malden"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_aaf;
    };

    class Vanilla_FIA : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "A3 FIA";
        file = "Vanilla_Reb_FIA";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_fia;
    };

    class Vanilla_SDK : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "\A3\Data_F_Exp\Flags\flag_SYND_CO.paa";
        name = "A3 SDK";
        file = "Vanilla_Reb_SDK";
        climate[] = {"tropical"};
        description = $STR_A3AP_setupFactionsTab_sdk;
    };

    class Vanilla_LL : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "\A3\Data_F\Flags\Flag_green_CO.paa";
        name = "A3 LL";
        file = "Vanilla_Reb_LL";
        climate[] = {"temperate", "arctic"};
        description = $STR_A3AP_setupFactionsTab_ll;
    };

    class Vanilla_Remnants : Vanilla_Base
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Vanilla\flags\flag_aaf_torn_co.paa);
        name = "A3 AAF Remnants";
        file = "Vanilla_Riv_Remnants";
        climate[] = {"arid", "temperate", "arctic"}; ///arctic?
        description = $STR_A3AP_setupFactionsTab_remnants;
    };

    class Vanilla_Exegermenos : Vanilla_Base
    {
        side = "Riv";
        flagTexture = "\A3\Data_F\Flags\Flag_red_CO.paa";
        name = "A3 Exegerménos";
        file = "Vanilla_Riv_Exegermenos";
        climate[] = {"arid", "temperate", "arctic"};
        description = $STR_A3AP_setupFactionsTab_exegermenos;
    };

    class Vanilla_LE : Vanilla_Base
    {
        side = "Riv";
        flagTexture = "\A3\Data_F_Exp\Flags\flag_SYND_CO.paa";
        name = "A3 L'Ensemble";
        file = "Vanilla_Riv_LE";
        climate[] = {"tropical"};
        description = $STR_A3AP_setupFactionsTab_le;
    };

    class Vanilla_Civ : Vanilla_Base
    {
        side = "Civ";
        flagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
        name = "Vanilla";
        file = "Vanilla_Civ";
        description = $STR_A3AP_setupFactionsTab_vanilla_civ;
    };

    // ************************************** Expeditionary Forces *******************************************************

    class EF_Base : Vanilla_Base
    {
        requiredAddons[] = {"EF_Data"};
        logo = "\ef\ef_data\logos\arma3_ef_logo_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\EF); //the path to the template folder
        priority = 5;
        forceDLC[] = {"ef"};
        equipFlags[] = {"vanilla"};
    };

    class EF_MJTF_Arid : EF_Base
    {
        side = "Occ";
        flagTexture = "\ef\ef_data\data\Flag_29thMEU_CO.paa";
        name = "EF MJTF Arid";
        file = "EF_AI_MJTF_Arid";
        shortName = "MJTF";    
        climate[] = {"arid", "arctic"};
        description = $STR_A3AP_setupFactionsTab_nato;
    };

    class EF_MJTF_Temperate : EF_MJTF_Arid
    {
        name = "EF MJTF Temperate";
        file = "EF_AI_MJTF_Temperate";  
        climate[] = {"temperate", "tropical"};
        description = $STR_A3AP_setupFactionsTab_nato; 
    };


    // ************************************** RHS Factions *******************************************************

    class RHS_Base : Base
    {
        requiredAddons[] = {"rhsgref_main", "rhssaf_c_vehicles", "rhs_c_tanks", "RHS_US_A2Port_Armor"};
        basepath = QPATHTOFOLDER(Templates\Templates\RHS);
        logo = "\rhsusf\addons\rhsusf_main\data\rhs_logo_ca.paa";
        priority = 30;
        equipFlags[] = {"specialRHS"};
    };

    class RHS_NAPA : RHS_Base
    {
        side = "Reb";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\Flags\flag_NAPA_co.paa";
        logo = "rhsgref\addons\rhsgref_main\data\rhs_logo_ca.paa";
        name = "RHS NAPA";
        file = "RHS_Reb_NAPA";
        description = $STR_A3AP_setupFactionsTab_napa_3cbf;
    };

    class RHS_CDF : RHS_Base
    {
        side = "Occ";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\Flags\flag_cdf_co.paa";
        name = "RHS CDF";
        file = "RHS_AI_CDF";
        maps[] = {"cup_chernarus_A3", "brf_sumava"};
        climate[] = {"temperate", "arctic"};
        description = $STR_A3AP_setupFactionsTab_cdf;
    };

    class RHS_AFRF : RHS_Base
    {
        side = "Inv";
        flagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
        logo = "rhsafrf\addons\rhs_main\data\rhs_logo_ca.paa";
        name = "RHS AFRF";
        file = "RHS_AI_AFRF";
        description = $STR_A3AP_setupFactionsTab_aegis_afrf;
    };

    class RHS_US_Army_Arid : RHS_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "RHS US Army Arid";
        file = "RHS_AI_US_Army_Arid";
        description = $STR_A3AP_setupFactionsTab_usaf;
        climate[] = {"arid"};
    };
    class RHS_US_Army_Temperate : RHS_US_Army_Arid
    {
        name = "RHS US Army Temperate";
        file = "RHS_AI_US_Army_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class RHS_USMC_Arid : RHS_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "RHS USMC Arid";
        file = "RHS_AI_USMC_Arid";
        description = $STR_A3AP_setupFactionsTab_usmc;
        climate[] = {"arid"};
    };
    class RHS_USMC_Temperate : RHS_USMC_Arid
    {
        name = "RHS USMC Temperate";
        file = "RHS_AI_USMC_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class RHS_CHDKZ : RHS_Base
    {
        side = "Riv";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\flag_chdkz_co.paa";
        logo = "rhsgref\addons\rhsgref_main\data\rhs_logo_ca.paa";
        name = "RHS CHDKZ";
        file = "RHS_Riv_CHDKZ";
        description = $STR_A3AP_setupFactionsTab_chdkz;
    };

    class RHS_Civ : RHS_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        logo = "rhsgref\addons\rhsgref_main\data\rhs_logo_ca.paa";
        name = "RHS";
        file = "RHS_Civ";
    };
	
    class RHS_SAF : RHS_Base
    {
	    side = "Inv";
	    flagTexture = "rhssaf\addons\rhssaf_main\data\flags\flag_serbia_co.paa";
        name = "RHS SAF";
        file = "RHS_AI_SAF";
    };

    //************* VN ********************************************************

    class VN_Base : Base
    {
        requiredAddons[] = {"vn_weapons"};
        logo = "\vn\data_f_vietnam\logos\vn_sml_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\VN);
        priority = 50;
        equipFlags[] = {"lowTech","replaceCompass","replaceWatch"};
        forceDLC[] = {"vn"};
    };

    class VN_MACV : VN_Base
    {
        priority = 51;
        side = "Occ";
        flagTexture = "\vn\objects_f_vietnam\flags\data\vn_flag_01_usa_co.paa";
        name = "VN MACV";
        file = "VN_AI_MACV";
        description = $STR_A3AP_setupFactionsTab_macv;
    };

    class VN_ARVN : VN_Base
    {
        side = "Inv";
        flagTexture = "\vn\objects_f_vietnam\flags\data\vn_flag_01_arvn_co.paa";
        name = "VN ARVN";
        file = "VN_AI_ARVN";
        description = $STR_A3AP_setupFactionsTab_arvn;
    };

    class VN_PAVN : VN_Base
    {
        side = "Inv";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_pavn_co.paa";
        name = "VN PAVN";
        file = "VN_AI_PAVN";
        description = $STR_A3AP_setupFactionsTab_pavn;
    };

    class VN_VM : VN_Base
    {
        priority = 51;
        side = "Reb";
        flagTexture = "\vn\objects_f_vietnam\flags\data\vn_flag_01_lao_dmg_ca.paa";
        name = "VN VM";
        file = "VN_Reb_VM";
        description = $STR_A3AP_setupFactionsTab_vm;
    };

    class VN_VC : VN_Base
    {
        side = "Reb";
        flagTexture = "\vn\objects_f_vietnam\flags\data\vn_flag_01_vc_co.paa";
        name = "VN VC";
        file = "VN_Reb_VC";
        description = $STR_A3AP_setupFactionsTab_vc;
    };

    class VN_Riv_PL : VN_Base
    {
        side = "Riv";
        flagTexture = "\vn\objects_f_vietnam\flags\data\vn_flag_01_pl_co.paa";
        name = "VN PL";
        file = "VN_Riv_PL";
        description = $STR_A3AP_setupFactionsTab_pl;
    };

    class VN_Civ : VN_Base
    {
        side = "Civ";
        flagTexture = "\vn\objects_f_vietnam\flags\vn_flag_01_lao_co.paa";
        name = "Vietnam";
        file = "VN_Civ";
        description = $STR_A3AP_setupFactionsTab_vietcivs;
    };

    //***************************** CSLA *****************************
    class CSLA_Base : Vanilla_Base
    {
        requiredAddons[] = {"CSLA"};
	    logo = "\csla_cfg\Images\Logos\csla_logo_text.paa"; // csla\csla_cfg\Images\Logos\csla_logo_text.paa
        basepath = QPATHTOFOLDER(Templates\Templates\CSLA);
        priority = 50;
        forceDLC[] = {"CSLA"};
        climate[] = {"temperate","tropical","arid"};
    };
    class CSLA_CIV : CSLA_Base
    {
        side = "Civ";
        flagTexture = "\csla_misc\signs\flags\cssr_flag.paa";
        name = "CSLA Civs";
        file = "CSLA_CIV";
	//maps[] = {"stozec"};
    };
    class CSLA_FIA : CSLA_Base
    {
        side = "Reb";
        flagTexture = "\csla_misc\signs\flags\fia_flag.paa";
        name = "FIA";
        file = "CSLA_FIA";
	//maps[] = {"stozec"};
    };
    class CSLA_US : CSLA_Base
    {
        side = "Occ";
        flagTexture = "\csla_misc\signs\flags\flag_us_co.paa";
        name = "US85";
        file = "CSLA_AI_US";
	//maps[] = {"stozec"};
    };

    class CSLA_SEPARATISTS : CSLA_Base
    {
        side = "Riv";
        flagTexture = "\A3\Data_F\Flags\Flag_red_CO.paa";
        name = "CSLA Separatists";
        file = "CSLA_Riv_Separatists";
        climate[] = {"arid", "temperate", "arctic"};
        description = $STR_A3AP_setupFactionsTab_separatistsCSLA;
    };

    class CSLA_CS : CSLA_Base
    {
        side = "Inv";
        flagTexture = "\csla_misc\signs\flags\cssr_flag.paa";
        name = "CSLA";
        file = "CSLA_AI_CSLA";
	//maps[] = {"stozec"};
    };

    class CSLA_AFMC : CSLA_Base
    {
        side = "Occ";
        flagTexture = "\csla_misc\signs\flags\flag_afmc_co.paa";
        name = "AFMC";
        file = "CSLA_AI_AFMC";
	//maps[] = {"stozec"};
    };
	
    // ***************************** CUP *****************************

    #include "Templates\CUP\templates.hpp"	
	
    // ***************************** CW *****************************

    #include "Templates\CW\templates.hpp"

    // ***************************** IFA *****************************

    #include "Templates\IFA\templates.hpp"
	
    // ***************************** CSA38 *****************************

    #include "Templates\CSA38\templates.hpp"

    // ***************************** FFAA *****************************

    #include "Templates\FFAA\templates.hpp"
	
    // ***************************** Pedagne *****************************

    #include "Templates\Pedagne\templates.hpp"

    // ***************************** PLA *****************************

    #include "Templates\PLA\templates.hpp"
	
    // ***************************** SWE *****************************

    #include "Templates\SWE\templates.hpp"
	
    // ***************************** 3CB BAF *****************************

    #include "Templates\3CBBAF\templates.hpp"
	
    // ***************************** Unsung *****************************

    #include "Templates\UNS\templates.hpp"
	
    // ***************************** SPE IFA *****************************

    #include "Templates\SPE_IFA\templates.hpp"
  
    // ***************************** OPTRE *****************************

    #include "Templates\OPTRE\templates.hpp"
  
    // ***************************** RACS *****************************

    #include "Templates\RACS\templates.hpp"
  
    // ***************************** BWA3 *****************************

    #include "Templates\BWA3\templates.hpp"
	
    // ***************************** GM *****************************

    #include "Templates\GM\templates.hpp"

    // ***************************** Scion *****************************

    #include "Templates\Scion\templates.hpp"

    // ***************************** BRAF *****************************

    #include "Templates\BRAF\templates.hpp"

    // ***************************** Aegis *****************************

    #include "Templates\Aegis\templates.hpp"

    // ***************************** Misc *****************************

    #include "Templates\Misc\templates.hpp"

    // ***************************** STALKER *****************************

    #include "Templates\STALKER\templates.hpp"

    // ***************************** AMF *****************************

    #include "Templates\AMF\templates.hpp"
	
    // ***************************** NFtS *****************************

    #include "Templates\NFtS\templates.hpp"

    // ***************************** Task Force Canada *****************************

    #include "Templates\TFC\templates.hpp"

    // ***************************** TMT - Turkish Forces *****************************

    #include "Templates\TMT\templates.hpp"
	
    // ***************************** Faces of War *****************************

    #include "Templates\FoW\templates.hpp"
	
    // ***************************** East Asia War *****************************

    #include "Templates\EAW\templates.hpp"

    // ***************************** 3CB Factions *****************************

    #include "Templates\3CBF\templates.hpp"

    // ***************************** Androids *****************************

    #include "Templates\Android\templates.hpp"
	
    // ***************************** Cold War ReArmed *****************************

    #include "Templates\CWR\templates.hpp"

};
