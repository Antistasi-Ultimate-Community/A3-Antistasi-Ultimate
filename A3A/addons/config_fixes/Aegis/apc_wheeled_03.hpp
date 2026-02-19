class APC_Wheeled_03_base_F;
class I_APC_Wheeled_03_cannon_F : APC_Wheeled_03_base_F { class EventHandlers; };
class I_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_cannon_F
{
	scope = 2;
    faction = "IND_F";
    side = 2;
	displayName = "AFV-4 Gorgon (Unarmed)";
	threat[] = {0.8,0.6,0.6};
	class EventHandlers
	{
		fired = "[_this select 0,_this select 6,'missile_move','MissileBase'] call BIS_fnc_missileLaunchPositionFix; _this call (uinamespace getvariable 'BIS_fnc_effectFired');";
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 17500; (_this select 0) setCenterOfMass [0.426363, -0.84053,-1.68204] };";
		killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\I_APC_Wheeled_03_unarmed_F.jpg)
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Wheeled_03_unarmed_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Wheeled_03_unarmed_CA.paa";
	class Turrets{};
	class AnimationSources
	{
		class BreakWater
		{
			animPeriod = 2;
			initPhase = 0;
			source = "user";
		};
		class HitLBWheel 
		{
			hitpoint = "HitLF2Wheel";
			raw = 1;
			source = "Hit";
		};
		class HitLF2Wheel
		{
			hitpoint = "HitLBWheel";
			raw = 1;
			source = "Hit";
		};
		class HitLFWheel
		{
			hitpoint = "HitLFWheel";
			raw = 1;
			source = "Hit";
		};
		class HitLMWheel
		{
			hitpoint = "HitLMWheel";
			raw = 1;
			source = "Hit";
		};
		class HitRBWheel
		{
			hitpoint = "HitRF2Wheel";
			raw = 1;
			source = "Hit";
		};
		class HitRF2Wheel
		{
			hitpoint = "HitRBWheel";
			raw = 1;
			source = "Hit";
		};
		class HitRFWheel
		{
			hitpoint = "HitRFWheel";
			raw = 1;
			source = "Hit";
		};
		class HitRMWheel
		{
			hitpoint = "HitRMWheel";
			raw = 1;
			source = "Hit";
		};
		class HitSLAT_back_src
		{
			hitpoint = "HitSLAT_back";
			raw = 1;
			source = "Hit";
		};
		class HitSLAT_front_src
		{
			hitpoint = "HitSLAT_front";
			raw = 1;
			source = "Hit";
		};
		class HitSLAT_Left_1_src
		{
			hitpoint = "HitSLAT_Left_1";
			raw = 1;
			source = "Hit";
		};
		class HitSLAT_Left_2_src
		{
			hitpoint = "HitSLAT_Left_2";
			raw = 1;
			source = "Hit";
		};
		class HitSLAT_Left_3_src
		{
			hitpoint = "HitSLAT_Left_3";
			raw = 1;
			source = "Hit";
		};
		class HitSLAT_Right_1_src
		{
			hitpoint = "HitSLAT_Right_1";
			raw = 1;
			source = "Hit";
		};
		class HitSLAT_Right_2_src
		{
			hitpoint = "HitSLAT_Right_2";
			raw = 1;
			source = "Hit";
		};
		class HitSLAT_Right_3_src
		{
			hitpoint = "HitSLAT_Right_3";
			raw = 1;
			source = "Hit";
		};
	    class HideTurret
	    {
	        source = user;
	        initPhase = true;
	        animPeriod = 0.001;
	    };
	    class HitEngine_src
	    {
	        source = Hit;
	        hitpoint = HitEngine;
	        raw = true;
	    };
	    class HitFuel_src
	    {
	        source = Hit;
	        hitpoint = HitFuel;
	        raw = true;
	    };
	    class HitHull_src
	    {
	        source = Hit;
	        hitpoint = HitHull;
	        raw = true;
	    };
	    class HitMainGun_src
	    {
	        source = Hit;
	        hitpoint = HitGun;
	        raw = true;
	    };
	    class HitTurret_src
	    {
	        source = Hit;
	        hitpoint = HitTurret;
	        raw = true;
	    };
	    class HitComTurret_src
	    {
	        source = Hit;
	        hitpoint = HitComTurret;
	        raw = true;
	    };
		class showBags
		{
			animPeriod = 0.001;
			author = "Bohemia Interactive";
			displayName = "Show Bags (Hull)";
			initPhase = 0;
			mass = -50;
			source = "user";
		};
		class showBags2
		{
			animPeriod = 0.001;
			author = "Bohemia Interactive";
			displayName = "Show Bags (Turret)";
			initPhase = 0;
			mass = -50;
			source = "user";
		};
		class showCamonetHull
		{
			animPeriod = 0.001;
			author = "Bohemia Interactive";
			displayName = "Show Camo Net (Hull)";
			initPhase = 0;
			mass = -50;
			source = "user";
		};
		class showSLATHull
		{
			animPeriod = 0.001;
			author = "Bohemia Interactive";
			displayName = "Show Slat Cage (Hull)";
			initPhase = 0;
			mass = -50;
			source = "user";
		};
		class showTools
		{
			animPeriod = 0.001;
			author = "Bohemia Interactive";
			displayName = "Show Tools";
			initPhase = 0;
			mass = -50;
			source = "user";
		};
	};
	animationList[] = {};
    class TransportMagazines{};
	class TransportWeapons{};
	hiddenSelections[] = {"camo1","camo2","camo3","camo4","CamoNet","CamoSlat"};
	hiddenSelectionsTextures[] = {"A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_INDP_CO.paa","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext2_INDP_CO.paa","","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa","A3\armor_f\data\cage_aaf_co.paa"};
	class TextureSources
    {
        class Desert_01
        {
			author = "wsxcgy";
			displayName = "Bundeswehr (Arid)";
			factions[] = {};
            textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_desert_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_desert_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_desert_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
        };
		class Guerilla_01 
		{
			author = "Bohemia Interactive";
			displayName = "Guerrilla 01";
			faction[] = {"BLU_F_F","OPF_G_F","IND_G_F"};
			factions[] = {};
			textures[] = {"A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_IG_01_CO.paa","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext2_IG_01_CO.paa","","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_alpha_IG_01_CO.paa","A3\Armor_F\Data\camonet_AAF_FIA_green_CO.paa","A3\armor_f\data\cage_G1_co.paa"};
		};
		class Guerilla_02 
		{
			author = "Bohemia Interactive";
			displayName = "Guerrilla 02";
			faction[] = {"BLU_F_F","OPF_G_F","IND_G_F"};
			factions[] = {};
			textures[] = {"A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_IG_02_CO.paa","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext2_IG_02_CO.paa","","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_alpha_IG_02_CO.paa","A3\Armor_F\Data\camonet_AAF_FIA_desert_CO.paa","A3\armor_f\data\cage_sand_co.paa"};
		};
		class Guerilla_03 
		{
			author = "Bohemia Interactive";
			displayName = "Guerrilla 03";
			faction[] = {"BLU_F_F","OPF_G_F","IND_G_F"};
			factions[] = {};
			textures[] = {"\A3\Data_F_Tacops\Data\APC_Wheeled_03_Ext_IG_03_CO.paa","\A3\Data_F_Tacops\Data\APC_Wheeled_03_Ext2_IG_03_CO.paa","","\A3\Data_F_Tacops\Data\APC_Wheeled_03_Ext_alpha_IG_03_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\camonet_AAF_FIA_green_CO.paa","\A3\Armor_F\Data\cage_G3_CO.paa"};
		};
		class Indep 
		{
			author = "Bohemia Interactive";
			displayName = "AAF";
			factions[] = {"IND_F"};
			textures[] = {"A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_INDP_CO.paa","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext2_INDP_CO.paa","","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","A3\Armor_F\Data\camonet_AAF_Digi_Green_CO.paa","A3\armor_f\data\cage_aaf_co.paa"};
		};
		class Indep_02 
		{
			author = "Bohemia Interactive";
			displayName = "AAF (Jungle Camo Net)";
			factions[] = {};
			textures[] = {"\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_INDP_CO.paa","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_INDP_CO.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","\A3\Armor_F\Data\camonet_AAF_Digi_Jungle_CO.paa","\A3\Armor_F\Data\cage_AAF_CO.paa"};
		};
		class Indep_03 
		{
			author = "Bohemia Interactive";
			displayName = "AAF (Desert Camo Net)";
			factions[] = {};
			textures[] = {"\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_INDP_CO.paa","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_INDP_CO.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","\A3\Armor_F\Data\camonet_AAF_Digi_Desert_CO.paa","\A3\Armor_F\Data\cage_AAF_CO.paa"};
		};
		class Karzeg_01 
		{
			author = "Bran Flakes";
			displayName = "Karzeghistan";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_kzg_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_kzg_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_kzg_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
		};
		class Olive_01 
		{
			author = "Avery Kaiserin";
			displayName = "Olive";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_olive_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_olive_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_olive_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F\Data\cage_olive_CO.paa"};
		};
		class Sand_01 
		{
			author = "Avery Kaiserin";
			DisplayName = "Sand";
			factions[] = {};
			textures[] = {"\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_CO.paa","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_CO.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
		};
		class Woodland_01
		{
			author = "wsxcgy";
			displayName = "Bundeswehr";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_wdl_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_wdl_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_wdl_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F\Data\cage_olive_CO.paa"};
		};
    };
};
class B_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_unarmed_F
{
	scope = 2;
    faction = "BLU_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_CO.paa","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_CO.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
};
class B_T_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_unarmed_F
{
	scope = 2;
    faction = "BLU_T_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_olive_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_olive_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_olive_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F\Data\cage_olive_CO.paa"};
};
class B_G_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_unarmed_F
{
	scope = 2;
    faction = "BLU_G_F";
    side = 1;
	hiddenSelectionsTextures[] = {"A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_IG_01_CO.paa","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext2_IG_01_CO.paa","","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_alpha_IG_01_CO.paa","A3\Armor_F\Data\camonet_AAF_FIA_green_CO.paa","A3\armor_f\data\cage_G1_co.paa"};
};
class Atlas_BLU_G_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_unarmed_F
{
	scope = 2;
    faction = "Atlas_BLU_G_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_wdl_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_wdl_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_wdl_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F\Data\cage_olive_CO.paa"};
};
class Atlas_BLU_G_ard_APC_Wheeled_03_unarmed_F : I_APC_Wheeled_03_unarmed_F
{
	scope = 2;
    faction = "Atlas_BLU_G_ard_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_desert_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_desert_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_desert_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
};

class I_APC_Wheeled_03_med_F : I_APC_Wheeled_03_unarmed_F
{
    displayName = "AFV-4 Gorgon (Medical)";
    attendant = true;
    threat[] = {0,0,0};
    hiddenSelectionsTextures[] = {
        "\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_indep.paa",
        "\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_indep.paa",
        "",
        "A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa",
        "",
        ""
    };
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\I_APC_Wheeled_03_med_F.jpg);
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Wheeled_03_medevac_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Wheeled_03_medical_CA.paa";
	hiddenSelections[] = {"camo1","camo2","camo3","camo4"};
    class TextureSources
    {
        class Desert_01
        {
			author = "wsxcgy and wersal";
			displayName = "Bundeswehr (Arid)";
			factions[] = {};
            textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_Desert.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_Desert.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_desert_CO.paa","",""};
        };
		class Guerilla_01 
		{
			author = "Bohemia Interactive";
			displayName = "Guerrilla 01";
			faction[] = {"BLU_F_F","OPF_G_F","IND_G_F"};
			factions[] = {};
			textures[] = {"A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_IG_01_CO.paa","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext2_IG_01_CO.paa","","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_alpha_IG_01_CO.paa","",""};
		};
		class Guerilla_02 
		{
			author = "Bohemia Interactive";
			displayName = "Guerrilla 02";
			faction[] = {"BLU_F_F","OPF_G_F","IND_G_F"};
			factions[] = {};
			textures[] = {"A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_IG_02_CO.paa","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext2_IG_02_CO.paa","","A3\Data_F_Tacops\data\APC_Wheeled_03_Ext_alpha_IG_02_CO.paa","",""};
		};
		class Guerilla_03 
		{
			author = "Bohemia Interactive";
			displayName = "Guerrilla 03";
			faction[] = {"BLU_F_F","OPF_G_F","IND_G_F"};
			factions[] = {};
			textures[] = {"\A3\Data_F_Tacops\Data\APC_Wheeled_03_Ext_IG_03_CO.paa","\A3\Data_F_Tacops\Data\APC_Wheeled_03_Ext2_IG_03_CO.paa","","\A3\Data_F_Tacops\Data\APC_Wheeled_03_Ext_alpha_IG_03_CO.paa","",""};
		};
		class Indep 
		{
			author = "Bohemia Interactive and wersal";
			displayName = "AAF";
			factions[] = {"IND_F"};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_indep.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_indep.paa","","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","",""};
		};
		class Indep_02 
		{
			author = "Bohemia Interactive and wersal";
			displayName = "AAF (Jungle Camo Net)";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_indep.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_indep.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","",""};
		};
		class Indep_03 
		{
			author = "Bohemia Interactive and wersal";
			displayName = "AAF (Desert Camo Net)";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_indep.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_indep.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","",""};
		};
		class Karzeg_01 
		{
			author = "Bran Flakes and wersal";
			displayName = "$STR_A3_A_CfgFactionClasses_BLU_K_F0";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_KZG.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_KZG.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_kzg_CO.paa","",""};
		};
		class Olive_01 
		{
			author = "Avery Kaiserin and wersal";
			displayName = "Olive";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_olive.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_olive.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_olive_CO.paa","",""};
		};
		class Sand_01 
		{
			author = "Avery Kaiserin and wersal";
			DisplayName = "Sand";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_Sand.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_Sand.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_CO.paa","",""};
		};
		class Woodland_01
		{
			author = "wsxcgy and wersal";
			displayName = "Bundeswehr";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_wdl.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_wdl.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_wdl_CO.paa","",""};
		};
    };
};
class B_APC_Wheeled_03_med_F : I_APC_Wheeled_03_med_F
{
	scope = 2;
    faction = "BLU_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_Sand.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_Sand.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_CO.paa","",""};
};
class B_T_APC_Wheeled_03_med_F : I_APC_Wheeled_03_med_F
{
	scope = 2;
    faction = "BLU_T_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_olive.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_olive.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_olive_CO.paa","",""};
};
class Atlas_BLU_G_APC_Wheeled_03_med_F : I_APC_Wheeled_03_med_F
{
	scope = 2;
    faction = "Atlas_BLU_G_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_wdl.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_wdl.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_wdl_CO.paa","",""};
};
class Atlas_BLU_G_ard_APC_Wheeled_03_med_F : I_APC_Wheeled_03_med_F
{
	scope = 2;
    faction = "Atlas_BLU_G_ard_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext_Desert.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_03\apc_wheeled_03_med_ext2_Desert.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_desert_CO.paa","",""};
};