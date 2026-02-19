class CfgVehicles //////////should split this up into atlas
{
	class O_R_APC_Wheeled_04_cannon_v2_F;
	class O_R_APC_Wheeled_04_cannon_F;
	class B_MRAP_01_F;
	class B_MRAP_01_gmg_F;
	class B_MRAP_01_hmg_F;
	class Aegis_I_EAF_Heli_Attack_04_F;
	class Aegis_B_Heli_Attack_03_F;
	class Atlas_I_AR_Heli_Light_02_unarmed_F;
	class Atlas_I_AR_Heli_Light_02_dynamicLoadout_F;

	class APC_Wheeled_04_export_base_F;
	class Aegis_I_Raven_APC_Wheeled_04_export_F : APC_Wheeled_04_export_base_F { class EventHandlers; };

	///AAF
	class Aegis_I_APC_Wheeled_04_export_F : APC_Wheeled_04_export_base_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Indep",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\btr100a_turret_AAF_co.paa"};
	};
	class Aegis_O_T_APC_Wheeled_04_export_F : APC_Wheeled_04_export_base_F
	{
    	scope = 2;
        faction = "OPF_T_F";
        side = 0;
    	textureList[] = {"GreenHex",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_ghex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ghex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\btr100a_turret_ghex_co.paa"};
	};
	class Aegis_I_UNO_APC_Wheeled_04_export_F : APC_Wheeled_04_export_base_F
	{
    	scope = 2;
        faction = "Atlas_IND_UNO_F";
        side = 2;
    	textureList[] = {"UNO",1};
		hiddenSelectionsTextures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_UNO_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_UNO_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\btr100a_turret_uno_co.paa"};
	};
	class O_R_APC_Wheeled_04_export_F : APC_Wheeled_04_export_base_F
	{
    	scope = 2;
        faction = "OPF_R_F";
        side = 0;
    	textureList[] = {"Green",1};
	};
	class Aegis_I_APC_Wheeled_04_cannon_v2_F : O_R_APC_Wheeled_04_cannon_v2_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Indep",1};
	};
	class Aegis_O_APC_Wheeled_04_cannon_v2_F : O_R_APC_Wheeled_04_cannon_v2_F
	{
    	scope = 2;
        faction = "OPF_F";
        side = 0;
    	textureList[] = {"Hex",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_Hex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Hex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\apc_wheeled_04_sprut_turret_hex_co.paa","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_Green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
	};
	class Aegis_O_T_APC_Wheeled_04_cannon_v2_F : O_R_APC_Wheeled_04_cannon_v2_F
	{
    	scope = 2;
        faction = "OPF_T_F";
        side = 0;
    	textureList[] = {"GreenHex",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_Ghex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Ghex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\apc_wheeled_04_sprut_turret_ghex_co.paa","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_Green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
	};
	class Aegis_I_APC_Wheeled_04_cannon_F : O_R_APC_Wheeled_04_cannon_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Green",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_tow_RUkhk_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_Green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
	};
	class Aegis_O_APC_Wheeled_04_cannon_F : O_R_APC_Wheeled_04_cannon_F
	{
    	scope = 2;
        faction = "OPF_F";
        side = 0;
    	textureList[] = {"Hex",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_Hex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Hex_CO.paa","lxws\vehicles_1_f_lxws\apc_tracked_02\Data\apc_tracked_02_30mm_hex_co.paa","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_Green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
	};
	class Aegis_O_T_APC_Wheeled_04_cannon_F : O_R_APC_Wheeled_04_cannon_F
	{
    	scope = 2;
        faction = "OPF_T_F";
        side = 0;
    	textureList[] = {"GreenHex",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_Ghex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Ghex_CO.paa","lxws\vehicles_1_f_lxws\apc_tracked_02\Data\apc_tracked_02_30mm_ghex_co.paa","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_Green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
	};
	class Aegis_O_SFIA_APC_Wheeled_04_cannon_F : O_R_APC_Wheeled_04_cannon_F
	{
    	scope = 2;
        faction = "OPF_SFIA_lxWS";
        side = 0;
    	textureList[] = {"Sand",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_SFIA_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_SFIA_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_tow_sand_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_Green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
	};

	class Aegis_I_MRAP_01_F : B_MRAP_01_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Indep",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Soft_F_Aegis\MRAP_01\Data\MRAP_01_base_INDP_CO.paa","\A3_Aegis\Soft_F_Aegis\MRAP_01\Data\MRAP_01_adds_INDP_CO.paa","\A3\Data_F\Vehicles\Turret_INDP_CO.paa"};
	};
	class Aegis_I_MRAP_01_gmg_F : B_MRAP_01_gmg_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Indep",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Soft_F_Aegis\MRAP_01\Data\MRAP_01_base_INDP_CO.paa","\A3_Aegis\Soft_F_Aegis\MRAP_01\Data\MRAP_01_adds_INDP_CO.paa","\A3\Data_F\Vehicles\Turret_INDP_CO.paa"};
	};
	class Aegis_I_MRAP_01_hmg_F : B_MRAP_01_hmg_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Indep",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Soft_F_Aegis\MRAP_01\Data\MRAP_01_base_INDP_CO.paa","\A3_Aegis\Soft_F_Aegis\MRAP_01\Data\MRAP_01_adds_INDP_CO.paa","\A3\Data_F\Vehicles\Turret_INDP_CO.paa"};
	};

	class Aegis_I_Heli_Attack_04_F : Aegis_I_EAF_Heli_Attack_04_F
	{
		displayName = "Mi-35 sókol";
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Green",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\air_f_Aegis\Heli_Attack_04\Data\Skins\Heli_Attack_04_ext_01_grn_CO.paa","\A3_Aegis\air_f_Aegis\Heli_Attack_04\Data\Skins\Heli_Attack_04_ext_02_grn_CO.paa","\A3_Aegis\air_f_Aegis\Heli_Attack_04\Data\Skins\Heli_Attack_04_ext_03_grn_CO.paa"};
	};
	class Aegis_I_Heli_Attack_03_F : Aegis_B_Heli_Attack_03_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Indep",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Air_F_Aegis\Heli_Attack_03\Data\Heli_Attack_03_body_INDP_CO.paa","\A3_Aegis\Air_F_Aegis\Heli_Attack_03\Data\Heli_Attack_03_details_INDP_CO.paa","\A3_Aegis\Air_F_Aegis\Heli_Attack_03\Data\Heli_Attack_03_adds_INDP_CO.paa"};
	};
	class Aegis_I_Heli_Light_02_unarmed_F : Atlas_I_AR_Heli_Light_02_unarmed_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Indep",1};
		hiddenSelectionsTextures[] = {"\A3_Aegis\Air_F_Aegis\Heli_Light_02\Data\Heli_Light_02_ext_INDP_CO.paa"};
	};
	class Aegis_I_Heli_Light_02_dynamicLoadout_F : Atlas_I_AR_Heli_Light_02_dynamicLoadout_F
	{
    	scope = 2;
        faction = "IND_F";
        side = 2;
    	textureList[] = {"Indep",1};
		hiddenSelectionsTextures[] =  {"\A3_Aegis\Air_F_Aegis\Heli_Light_02\Data\Heli_Light_02_ext_INDP_CO.paa"};
	};

	///add add proper logistics for new vehicles
	///make a post on aegis's resourses
	#include "apc_wheeled_01.hpp"
	#include "apc_wheeled_02.hpp"
	#include "apc_wheeled_03.hpp"
	#include "apc_wheeled_04.hpp"
	#include "apc_tracked_01.hpp"
	#include "apc_tracked_02.hpp"
	#include "afv_wheeled_01.hpp"
};