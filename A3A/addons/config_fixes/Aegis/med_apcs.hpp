class I_APC_Wheeled_03_turretless_F : I_APC_Wheeled_03_cannon_F
{
	displayName = "AFV-4 Gorgon (Unarmed)";
	threat[] = {0,0,0};
	class EventHandlers
	{
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 17500; (_this select 0) setCenterOfMass [0.426363, -0.84053,-1.68204] };";
	};
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
			displayName = "$STR_A3_A_CfgFactionClasses_BLU_K_F0";
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
class I_APC_Wheeled_03_med_F : I_APC_Wheeled_03_cannon_F
{
	displayName = "AFV-4 Gorgon (Medical)";
	attendant = true;
	threat[] = {0,0,0};
	class EventHandlers
	{
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 17500; (_this select 0) setCenterOfMass [0.426363, -0.84053,-1.68204] };";
	};
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
	hiddenSelectionsTextures[] = {"A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_INDP_CO.paa","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext2_INDP_CO.paa","","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","",""};
	class TextureSources
    {
        class Desert_01
        {
			author = "wsxcgy";
			displayName = "Bundeswehr (Arid)";
			factions[] = {};
            textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_desert_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_desert_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_desert_CO.paa","",""};
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
			author = "Bohemia Interactive";
			displayName = "AAF";
			factions[] = {"IND_F"};
			textures[] = {"A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_INDP_CO.paa","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext2_INDP_CO.paa","","A3\armor_f_gamma\APC_Wheeled_03\data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","",""};
		};
		class Indep_02 
		{
			author = "Bohemia Interactive";
			displayName = "AAF (Jungle Camo Net)";
			factions[] = {};
			textures[] = {"\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_INDP_CO.paa","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_INDP_CO.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","",""};
		};
		class Indep_03 
		{
			author = "Bohemia Interactive";
			displayName = "AAF (Desert Camo Net)";
			factions[] = {};
			textures[] = {"\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_INDP_CO.paa","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_INDP_CO.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_INDP_CO.paa","",""};
		};
		class Karzeg_01 
		{
			author = "Bran Flakes";
			displayName = "$STR_A3_A_CfgFactionClasses_BLU_K_F0";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_kzg_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_kzg_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_kzg_CO.paa","",""};
		};
		class Olive_01 
		{
			author = "Avery Kaiserin";
			displayName = "Olive";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_olive_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_olive_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_olive_CO.paa","",""};
		};
		class Sand_01 
		{
			author = "Avery Kaiserin";
			DisplayName = "Sand";
			factions[] = {};
			textures[] = {"\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_CO.paa","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_CO.paa","","\A3\Armor_F_Gamma\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_CO.paa","",""};
		};
		class Woodland_01
		{
			author = "wsxcgy";
			displayName = "Bundeswehr";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_wdl_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext2_wdl_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_03\Data\APC_Wheeled_03_Ext_alpha_wdl_CO.paa","",""};
		};
    };
};
class Aegis_I_APC_Wheeled_04_export_med_F : Aegis_I_APC_Wheeled_04_export_F
{
	scope = 2;
    faction = "IND_F";
    side = 2;
	textureList[] = {"Indep",1};
	hiddenSelections[] = {"Camo1","Camo2","Camo3"};
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\btr100a_turret_AAF_co.paa"};
	displayName = "BTR-100A (Medical)";
	attendant = true;
	threat[] = {0,0,0};
	class EventHandlers
	{
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 18000; (_this select 0) setCenterOfMass [0.0023371,-0.982133,-1.48482] };";
	};
	class Turrets{};
	class AnimationSources
	{
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
    	class HitComTurret_src
    	{
    	    source = Hit;
    	    hitpoint = HitComTurret;
    	    raw = true;
    	};
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
	    class HideTurret
	    {
	        source = user;
	        initPhase = true;
	        animPeriod = 0.001;
	    };
	    class HitTurret_src
	    {
	        source = Hit;
	        hitpoint = HitTurret;
	        raw = true;
	    };
	};
	animationList[] = {};
    class TransportMagazines{};
	class TransportWeapons{};
    class TextureSources
    {
		class ardistan
		{
			author = "Bran Flakes";
			displayName = "Ardistan";
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_ardi_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ardi_CO.paa",""};
		}
        class Green
        {
			author = "Avery Kaiserin";
			displayName = "Green";
			factions[] = {};
            textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_RUkhk_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_RUkhk_CO.paa",""};
        };
		class GreenHex
		{
			author = "Lukin";
			displayName = "Green Hex";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_ghex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ghex_CO.paa",""};
		};
		class Guerrilla_01
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 01";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_FIA_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_FIA_CO.paa",""};
		};
		class Guerrilla_02
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 02";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_FIA_2_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_FIA_2_CO.paa",""};
		};
		class Guerrilla_03
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 03";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_FIA_3_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_FIA_3_CO.paa",""};
		};
		class Guerrilla_04
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 04";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_Tura_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Tura_CO.paa",""};
		};
		class Guerrilla_05
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 05";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_Tura_2_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Tura_2_CO.paa",""};
		};
		class Hex
		{
			author = "Lukin";
			displayName = "Hex";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_hex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_hex_CO.paa",""};
		};
		class Indep
		{
			author = "Bran Flakes";
			displayName = "AAF";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa",""};
		};
		class Loyalist
		{
			author = "Bran Flakes";
			displayName = "Loyalist";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_loyalist_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa",""};
		};
		class Para_01
		{
			author = "Bran Flakes";
			displayName = "Paramilitary";
			textures[] = {"\A3_Opf\Armor_F_Opf\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_paramilitary_co.paa","\A3_Opf\Armor_F_Opf\APC_Wheeled_04\Data\APC_Wheeled_04_body2_paramilitary_co.paa",""};
		};
		class Sand
		{
			author = "Bran Flakes";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_sand_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_sand_CO.paa",""};
		};
		class Sep_01
		{
			author = "Lukin";
			displayName = "Separatist 01";
			textures[] = {"\A3_Opf\Armor_F_Opf\APC_Wheeled_04\Data\APC_Wheeled_04_export_body_Chdkz_CO.paa","\A3_Opf\Armor_F_Opf\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Chdkz_CO.paa",""};
		};
		class SFIA
		{
			author = "Bran Flakes";
			displayName = "SFIA";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_SFIA_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_SFIA_CO.paa",""};
		};
		class Takistan
		{
			author = "Bran Flakes";
			displayName = "Semi-Arid Hex";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_TK_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_TK_CO.paa",""};
		};
		class UNO
		{
			author = "Bran Flakes";
			displayName = "UNO";
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_UNO_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_UNO_CO.paa",""};
		};
		class WoodlandHex
		{
			author = "Bran Flakes";
			displayName = "Woodland Hex";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_WHEX_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_WHEX_CO.paa",""};
		};
    };
};
class Aegis_I_APC_Wheeled_04_export_turretless_F : Aegis_I_APC_Wheeled_04_export_F
{
	scope = 2;
    faction = "IND_F";
    side = 2;
	textureList[] = {"Indep",1};
	hiddenSelections[] = {"Camo1","Camo2","Camo3"};
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\btr100a_turret_AAF_co.paa"};
	displayName = "BTR-100A (Unarmed)";
	threat[] = {0,0,0};
	class EventHandlers
	{
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 18000; (_this select 0) setCenterOfMass [0.0023371,-0.982133,-1.48482] };";
	};
	class Turrets{};
	class AnimationSources
	{
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
    	class HitComTurret_src
    	{
    	    source = Hit;
    	    hitpoint = HitComTurret;
    	    raw = true;
    	};
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
	    class HideTurret
	    {
	        source = user;
	        initPhase = true;
	        animPeriod = 0.001;
	    };
	    class HitTurret_src
	    {
	        source = Hit;
	        hitpoint = HitTurret;
	        raw = true;
	    };
	};
	animationList[] = {};
    class TransportMagazines{};
	class TransportWeapons{};
    class TextureSources
    {
		class ardistan
		{
			author = "Bran Flakes";
			displayName = "Ardistan";
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_ardi_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ardi_CO.paa",""};
		}
        class Green
        {
			author = "Avery Kaiserin";
			displayName = "Green";
			factions[] = {};
            textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_RUkhk_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_RUkhk_CO.paa",""};
        };
		class GreenHex
		{
			author = "Lukin";
			displayName = "Green Hex";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_ghex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ghex_CO.paa",""};
		};
		class Guerrilla_01
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 01";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_FIA_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_FIA_CO.paa",""};
		};
		class Guerrilla_02
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 02";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_FIA_2_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_FIA_2_CO.paa",""};
		};
		class Guerrilla_03
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 03";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_FIA_3_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_FIA_3_CO.paa",""};
		};
		class Guerrilla_04
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 04";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_Tura_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Tura_CO.paa",""};
		};
		class Guerrilla_05
		{
			author = "Bran Flakes";
			displayName = "Guerrilla 05";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_Tura_2_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Tura_2_CO.paa",""};
		};
		class Hex
		{
			author = "Lukin";
			displayName = "Hex";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_hex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_hex_CO.paa",""};
		};
		class Indep
		{
			author = "Bran Flakes";
			displayName = "AAF";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa",""};
		};
		class Loyalist
		{
			author = "Bran Flakes";
			displayName = "Loyalist";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_loyalist_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa",""};
		};
		class Para_01
		{
			author = "Bran Flakes";
			displayName = "Paramilitary";
			textures[] = {"\A3_Opf\Armor_F_Opf\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_paramilitary_co.paa","\A3_Opf\Armor_F_Opf\APC_Wheeled_04\Data\APC_Wheeled_04_body2_paramilitary_co.paa",""};
		};
		class Sand
		{
			author = "Bran Flakes";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_sand_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_sand_CO.paa",""};
		};
		class Sep_01
		{
			author = "Lukin";
			displayName = "Separatist 01";
			textures[] = {"\A3_Opf\Armor_F_Opf\APC_Wheeled_04\Data\APC_Wheeled_04_export_body_Chdkz_CO.paa","\A3_Opf\Armor_F_Opf\APC_Wheeled_04\Data\APC_Wheeled_04_body2_Chdkz_CO.paa",""};
		};
		class SFIA
		{
			author = "Bran Flakes";
			displayName = "SFIA";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_SFIA_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_SFIA_CO.paa",""};
		};
		class Takistan
		{
			author = "Bran Flakes";
			displayName = "Semi-Arid Hex";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_TK_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_TK_CO.paa",""};
		};
		class UNO
		{
			author = "Bran Flakes";
			displayName = "UNO";
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_UNO_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_UNO_CO.paa",""};
		};
		class WoodlandHex
		{
			author = "Bran Flakes";
			displayName = "Woodland Hex";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_WHEX_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_WHEX_CO.paa",""};
		};
    };
};
class B_APC_Tracked_01_turretless_F : B_APC_Tracked_01_rcws_F
{
    faction = "BLU_F";
    side = 1;
	hiddenSelections[] = {"camo1","camo2","camo3","CamoNet"};
	hiddenSelectionsTextures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_body_CO.paa","\A3\Armor_F_Beta\APC_Tracked_01\Data\MBT_01_body_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa"};
	displayName = "IFV-6c Panther (Unarmed)";
	threat[] = {0,0,0};
	class EventHandlers
	{
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 61885; (_this select 0) setCenterOfMass [-0.00370346,-0.908337,-1.49201] };";
	};
	class Turrets{};
	class AnimationSources
	{
		
		class showBags 
		{
			animPeriod = 0.001;
			author = "Bohemia Interactive";
			displayName = "Show Bags (Hull)";
			initPhase = 0;
			mass = -50;
			source = "user";
		};
		class showCamonetHull
		{
			animPeriod = 0.001;
			author = "Bohemia Interactive";
			displayName = "Show Camo Net (Hull)";
			forceAnimate[] = {"showCamonetPlates1",1,"showCamonetPlates2",1};
			forceAnimatePhase = 1;
			initPhase = 0;
			mass = -50;
			source = "user";
		};
		class showCamonetPlates1
		{
			animPeriod = 0.001;
			initPhase = 0;
			source = "user";
		};
		class showCamonetPlates2
		{
			animPeriod = 0.001;
			initPhase = 0;
			source = "user";
		};
		class Smoke_source 
		{
			source = "revolving";
			weapon = "SmokeLauncher";
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
    	class HitComTurret_src
    	{
    	    source = Hit;
    	    hitpoint = HitComTurret;
    	    raw = true;
    	};
	    class HideTurret
	    {
	        source = user;
	        initPhase = true;
	        animPeriod = 0.001;
	    };
	    class HitTurret_src
	    {
	        source = Hit;
	        hitpoint = HitTurret;
	        raw = true;
	    };
	};
	animationList[] = {};
    class TransportMagazines{};
	class TransportWeapons{};
	class TextureSources
    {
        class Green
        {
			author = "Bohemia Interactive";
			displayName = "Olive";
			factions[] = {};
            textures[] = {"A3\Armor_F_exp\APC_Tracked_01\Data\APC_Tracked_01_body_olive_CO.paa","A3\Armor_F_exp\APC_Tracked_01\Data\mbt_01_body_olive_co.paa","","a3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
        };
		class Sand
        {
			author = "Bohemia Interactive";
			displayName = "Sand";
			factions[] = {};
            textures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_body_CO.paa","\A3\Armor_F_Beta\APC_Tracked_01\Data\MBT_01_body_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa"};
        };
		class Woodland
        {
			author = "Bohemia Interactive";
			displayName = "Woodland";
			factions[] = {};
            textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Tracked_01\Data\APC_Tracked_01_body_wdl_CO.paa","\A3_Aegis\Armor_F_Aegis\MBT_01\Data\MBT_01_body_wdl_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
        };
    };
};