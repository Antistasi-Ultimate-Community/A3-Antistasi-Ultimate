class APC_Wheeled_01_base_F;
class B_APC_Wheeled_01_base_F : APC_Wheeled_01_base_F
{
	class EventHandlers;
	class TextureSources;
};
class B_APC_Wheeled_01_medical_F : B_APC_Wheeled_01_base_F
{
	class EventHandlers
	{
		fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
	   	init = "if (local (_this select 0)) then { (_this select 0) setMass 19499; (_this select 0) setCenterOfMass [-0.00104308,-0.755606,-1.55873] };";
	   	killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Wheeled_01_medevac_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_amv_medevac_CA.paa";
	class TextureSources
    {
		class EAF_01
		{
			author = "Grave";
			displayName = "LDF";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_base_medevac_EAF_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_adds_EAF_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_EAF_CO.paa","",""};
		};
		class EAF_Arid
		{
			author = "Grave";
			displayName = "LDF (Arid)";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_base_medevac_EAF_Arid_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_adds_EAF_arid_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_EAF_arid_CO.paa","",""};
		};
		class Olive
		{
			author = "Bohemia Interactive";
			displayName = "Olive";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_base_medevac_olive_CO.paa","\A3\Armor_F_Exp\APC_Wheeled_01\Data\APC_Wheeled_01_adds_olive_CO.paa","\A3\Armor_F_Exp\APC_Wheeled_01\Data\APC_Wheeled_01_tows_olive_CO.paa","",""};
		};
		class Sand
		{
			author = "Bohemia Interactive";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_base_medevac_CO.paa","\A3\Armor_F_Beta\APC_Wheeled_01\Data\APC_Wheeled_01_adds_CO.paa","\A3\Armor_F_Beta\APC_Wheeled_01\Data\APC_Wheeled_01_tows_CO.paa","",""};
		};
		class EAF_Arid_sign
		{
			author = "Grave";
			displayName = "LDF (Arid and sign)";
			factions[] = {};
			textures[] = {"x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_01\apc_wheeled_01_base_medevac_EAF_arid_sign.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_adds_EAF_arid_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_EAF_arid_CO.paa","",""};
		};
		class ADF
		{
			author = "Bran Flakes";
			displayName = "ADF";
			factions[] = {};
			textures[] = {"x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_01\apc_wheeled_01_base_medevac_ADF.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_adds_ADF_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_tows_ADF_CO.paa","",""};
		};
		class Marar
		{
			author = "Bran Flakes";
			displayName = "Marar";
			factions[] = {};
			textures[] = {"x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_01\apc_wheeled_01_base_medevac_Marar.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_adds_Marar_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_tows_Marar_CO.paa","",""};
		};
		class WDL_01
		{
			author = "Bran Flakes";
			displayName = "Woodland";
			factions[] = {};
			textures[] = {"x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_01\apc_wheeled_01_base_medevac_wdl.paa","\A3\Armor_F_Exp\APC_Wheeled_01\Data\APC_Wheeled_01_adds_olive_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_wdl_CO.paa","",""};
		};
	};
};
class B_APC_Wheeled_01_unarmed_F : B_APC_Wheeled_01_medical_F
{
	animationList[] = {"showCamonetHull",0,"showSLATHull",0};
	hiddenSelections[] = {"camo1","camo2","camo3","CamoNet","CamoSlat"};
	attendant = false;
	threat[] = {0.8,0.6,0.6};
	displayName = "AVM-7 Marshall (Unarmed)";
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_APC_Wheeled_01_unarmed_F.jpg)
	hiddenSelectionsTextures[] = {"\A3\Armor_F_Beta\APC_Wheeled_01\Data\APC_Wheeled_01_base_CO.paa","\A3\Armor_F_Beta\APC_Wheeled_01\Data\APC_Wheeled_01_adds_CO.paa","\A3\Armor_F_Beta\APC_Wheeled_01\Data\APC_Wheeled_01_tows_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
	class AnimationSources
	{
		class HideTurret
		{
			source = user;
	        initPhase = true;
	        animPeriod = 0.001;
		};
		class HitComTurret_src
		{
			hitpoint = "HitComTurret";
			raw = 1;
			source = "Hit";
		};
		class HitEngine_src
		{
			hitpoint = "HitEngine";
			raw = 1;
			source = "Hit";
		};
		class HitFuel_src
		{
			hitpoint = "HitFuel";
			raw = 1;
			source = "Hit";
		};
		class HitHull_src
		{
			hitpoint = "HitHull";
			raw = 1;
			source = "Hit";
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
		class HitMainGun_src
		{
			hitpoint = "HitGun";
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
		class HitTurret_src
		{
			hitpoint = "HitTurret";
			raw = 1;
			source = "Hit";
		};
		class muzzle_hide
		{
			source = "reload";
			weapon = "autocannon_40mm_CTWS";
		};
		class muzzle_rot
		{
			source = "ammorandom";
			weapon = "autocannon_40mm_CTWS";
		};
		class revolving_cannon
		{
			source = "revolving";
			weapon = "autocannon_40mm_CTWS";
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
	};
	class TextureSources
	{
		class ADF
		{
			author = "Bran Flakes";
			displayName = "ADF";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_base_ADF_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_adds_ADF_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_tows_ADF_CO.paa","\A3\Armor_f\Data\camonet_CSAT_Stripe_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
		};
		class EAF_01
		{
			author = "Grave";
			displayName = "LDF";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_base_EAF_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_adds_EAF_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_EAF_CO.paa","A3\Armor_F_Enoch\apc_tracked_03\Data\camonet_EAF_green_CO.paa","A3\Armor_F_Enoch\apc_tracked_03\data\cage_EAF_CO.paa"};
		};
		class EAF_Arid
		{
			author = "Grave";
			displayName = "LDF (Arid)";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_base_EAF_arid_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_adds_EAF_arid_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_EAF_arid_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
		};
		class Marar
		{
			author = "Bran Flakes";
			displayName = "Marar";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_base_Marar_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_adds_Marar_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_tows_Marar_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
		};
		class Olive
		{
			author = "Bohemia Interactive";
			displayName = "Olive";
			factions[] = {};
			textures[] = {"A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_base_olive_CO.paa","A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_adds_olive_co.paa","A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_tows_olive_co.paa","a3\Armor_F\Data\camonet_NATO_Green_CO.paa","a3\Armor_F\Data\cage_olive_CO.paa"};
		};
		class Sand
		{
			author = "Bohemia Interactive";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_base_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_adds_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_tows_co.paa","a3\Armor_F\Data\camonet_NATO_Desert_CO.paa","a3\Armor_F\Data\cage_sand_CO.paa"};
		};
		class WDL_01
		{
			author = "Bran Flakes";
			displayName = "Woodland";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_body_wdl_CO.paa","\A3\Armor_F_Exp\APC_Wheeled_01\Data\APC_Wheeled_01_adds_olive_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_wdl_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F\Data\cage_olive_CO.paa"};
		};
		class BLACK
		{
			author = "Rotators Collective";
			displayName = "Black";
			factions[] = {"BLU_ION_lxWS"};
			textures[] = {"lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_black_base_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_ion_adds_co.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_ion_tows_co.paa","a3\armor_f\Data\camonet_AAF_stripe_desert_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\cage_black_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_black_lxws_CO.paa"};
		};
		class ION_BLACK
		{
			author = "Rotators Collective";
			displayName = "ION Services";
			factions[] = {"BLU_ION_lxWS"};
			textures[] = {"lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_ion_base_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_ion_adds_co.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_ion_tows_co.paa","a3\armor_f\Data\camonet_AAF_stripe_desert_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\cage_black_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_ion_lxws_CO.paa"};
		}; ///this one needs either fixing or deleting
		class Sand_Desert
		{
			author = "Rotators Collective";
			displayName = "Sand (Desert Camo Net)";
			factions[] = {"BLU_NATO_lxWS"};
			textures[] = {"a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_base_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_adds_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_tows_co.paa","lxws\vehicles_f_lxws\data\camonet_NATO_flat_desert_CO.paa","a3\Armor_F\Data\cage_sand_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_01_lxws_CO.paa"};
		};
		class UN_WHITE
		{
			author = "Rotators Collective";
			displayName = "UNA";
			factions[] = {"BLU_UN_lxWS"};
			textures[] = {"lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_white_base_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_white_adds_co.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_white_tows_co.paa","a3\armor_f\Data\camonet_NATO_Desert_CO.paa","lxws\vehicles_f_lxws\data\cage_white_co.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_white_lxws_CO.paa"};
		}; ///this one needs either fixing or deleting
	};
};
class B_T_APC_Wheeled_01_unarmed_F : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_T_F";
    side = 1;
	displayName = "AVM-7 Marshall (Unarmed)";
	hiddenSelectionsTextures[] = {"A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_base_olive_CO.paa","A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_adds_olive_co.paa","A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_tows_olive_co.paa","a3\Armor_F\Data\camonet_NATO_Green_CO.paa","a3\Armor_F\Data\cage_olive_CO.paa"};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_T_APC_Wheeled_01_unarmed_F.jpg)
};
class Aegis_B_E_APC_Wheeled_01_unarmed_v2_F : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_EAF_F";
    side = 1;
	displayName = "KTO Borsuk (Unarmed)";
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_base_EAF_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_adds_EAF_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_EAF_CO.paa","A3\Armor_F_Enoch\apc_tracked_03\Data\camonet_EAF_green_CO.paa","A3\Armor_F_Enoch\apc_tracked_03\data\cage_EAF_CO.paa"};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_W_APC_Wheeled_01_unarmed_v2_F.jpg)
};
class Aegis_B_E_APC_Wheeled_01_unarmed_v2_ard_F : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_EAF_ard_F";
    side = 1;
	displayName = "KTO Borsuk (Unarmed)";
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_base_EAF_arid_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_adds_EAF_arid_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_EAF_arid_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
};
class Atlas_B_A_APC_Wheeled_01_unarmed_v2_F : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "Atlas_BLU_A_F";
    side = 1;
	displayName = "AVM-7 Marshall (Unarmed)";
	hiddenSelectionsTextures[] = {"\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_base_ADF_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_adds_ADF_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_tows_ADF_CO.paa","\A3\Armor_f\Data\camonet_CSAT_Stripe_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
};
class a3a_ION_APC_Wheeled_01_unarmed_lxWS : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_ION_lxWS";
    side = 1;
	displayName = "AVM-7 Marshall (Unarmed)";
	model = "lxws\vehicles_f_lxws\APC_Wheeled_01\APC_Wheeled_01_cannon_lxWS.p3d";
	hiddenSelections[] = {"camo1","camo2","camo3","CamoNet","CamoSlat","camo4"};
	hiddenSelectionsTextures[] = {"lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_ion_base_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_ion_adds_co.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_ion_tows_co.paa","a3\armor_f\Data\camonet_AAF_stripe_desert_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\cage_black_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_ion_lxws_CO.paa"};
};
class Atlas_B_M_APC_Wheeled_01_unarmed_v2_F : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "Atlas_BLU_M_F";
    side = 1;
	displayName = "AVM-7 Marshall (Unarmed)";
	hiddenSelectionsTextures[] = {"\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_base_Marar_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_adds_Marar_CO.paa","\A3_Atlas\Armor_f_Atlas\APC_Wheeled_01\Data\APC_Wheeled_01_tows_Marar_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F\Data\cage_sand_CO.paa"};
};
class B_UN_APC_Wheeled_01_unarmed_lxWS : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_UN_lxWS";
    side = 1;
	displayName = "AVM-7 Marshall (Unarmed)";
	model = "lxws\vehicles_f_lxws\APC_Wheeled_01\APC_Wheeled_01_cannon_lxWS.p3d"; 
	hiddenSelections[] = {"camo1","camo2","camo3","CamoNet","CamoSlat","camo4"};
	hiddenSelectionsTextures[] = {"lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_white_base_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_white_adds_co.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\apc_wheeled_white_tows_co.paa","a3\armor_f\Data\camonet_NATO_Desert_CO.paa","a3\Armor_F\Data\cage_sand_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_white_lxws_CO.paa"};
};
class B_D_APC_Wheeled_01_unarmed_lxWS_v2 : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_NATO_lxWS";
    side = 1;
	displayName = "AVM-7 Marshall (Unarmed)";
	hiddenSelectionsTextures[] = {"a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_base_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_adds_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_tows_co.paa","lxws\vehicles_f_lxws\data\camonet_NATO_flat_desert_CO.paa","a3\Armor_F\Data\cage_sand_CO.paa","lxws\vehicles_f_lxws\data\APC_Wheeled_01\APC_Wheeled_01_lxws_CO.paa"};
};
class B_W_APC_Wheeled_01_unarmed_v2_F : B_APC_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_W_F";
    side = 1;
	displayName = "AVM-7 Marshall (Unarmed)";
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_body_wdl_CO.paa","\A3\Armor_F_Exp\APC_Wheeled_01\Data\APC_Wheeled_01_adds_olive_CO.paa","\A3_Aegis\Armor_f_Aegis\APC_Wheeled_01\Data\APC_Wheeled_01_tows_wdl_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F\Data\cage_olive_CO.paa"};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_W_APC_Wheeled_01_unarmed_v2_F.jpg)
};