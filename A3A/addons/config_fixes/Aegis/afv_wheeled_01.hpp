class AFV_Wheeled_01_base_F;
class B_AFV_Wheeled_01_cannon_F : AFV_Wheeled_01_base_F { class EventHandlers; };
class B_AFV_Wheeled_01_unarmed_F : B_AFV_Wheeled_01_cannon_F
{
	faction = "BLU_F";
    side = 1;
	hiddenSelections[] = {"camo1","camo2","camo3","CamoNet","CamoSlat"};
	hiddenSelectionsTextures[] = {"a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_EXT1_CO.paa","","a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_wheel_CO.paa","a3\Armor_F\Data\camonet_NATO_Desert_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
	displayName = "Rhino MGS (Unarmed)";
	threat[] = {0.8,0.6,0.6};
	class EventHandlers
	{
		fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
	   	init = "if (local (_this select 0)) then { (_this select 0) setMass 14500; (_this select 0) setCenterOfMass [0.00235461,-1.282136,-1.254078] };";
		killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
		postinit = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
	};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_AFV_Wheeled_01_unarmed_F.jpg)
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\AFV_Wheeled_01_unarmed.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_AFV_Wheeled_01_unarmed_CA.paa";
	class Turrets{};
	class AnimationSources
	{
		class HideTurret
		{
			source = user;
	        initPhase = true;
	        animPeriod = 0.001;
		};
		class cannon_120mm_revolving
		{
			source = "revolving";
			weapon = "cannon_120mm";
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
		class muzzle_hide_cannon
		{
			source = "reload";
			weapon = "cannon_120mm";
		};
		class muzzle_rot_cannon
		{
			source = "ammorandom";
			weapon = "cannon_120mm";
		};
		class muzzle_rot_HMG
		{
			source = "ammorandom";
			weapon = "MMG_02_coax";
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
	animationList[] = {};
    class TransportMagazines{};
	class TransportWeapons{};
	class TextureSources
    {
		class France
		{
			author = "Bran Flakes";
			displayName = "France";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\AFV_Wheeled_01\Data\afv_wheeled_01_EXT1_fr_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_wheel_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
		};
		class Green
		{
			author = "Bohemia Interactive";
			displayName = "Olive";
			factions[] = {};
			textures[] = {"a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_EXT1_green_CO.paa","","a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_wheel_green_CO.paa","a3\Armor_F\Data\camonet_NATO_Green_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_CO.paa"};
		};
		class Sand
		{
			author = "Bohemia Interactive";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_EXT1_CO.paa","","a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_wheel_CO.paa","a3\Armor_F\Data\camonet_NATO_Desert_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
		};
		class SFIA
		{
			author = "Unknown";
			displayName = "SFIA";
			factions[] = {};
			textures[] = {"\lxws\vehicles_f_lxws\data\AFV_Wheeled_01\Rhino_Africa1_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_wheel_CO.paa","A3\Armor_F\Data\camonet_CSAT_HEX_Desert_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
		};
		class WDL_01
		{
			author = "Unknown";
			displayName = "Woodland";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT1_wdl_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_wheel_green_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT3_CO.paa"};
		};
	};
};
class B_T_AFV_Wheeled_01_unarmed_F : B_AFV_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_T_F";
    side = 1;
	textureList[] = {"Green",1};
	hiddenSelectionsTextures[] = {"a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_EXT1_green_CO.paa","","a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_wheel_green_CO.paa","a3\Armor_F\Data\camonet_NATO_Green_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_CO.paa"};
};
class B_W_AFV_Wheeled_01_unarmed_F : B_AFV_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "BLU_W_F";
    side = 1;
	textureList[] = {"WDL_01",1};
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT1_wdl_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_wheel_green_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT3_CO.paa"};
};
class O_SFIA_AFV_Wheeled_01_unarmed_F : B_AFV_Wheeled_01_unarmed_F
{
	scope = 2;
    faction = "OPF_SFIA_lxWS";
    side = 0;
	textureList[] = {"SFIA",1};
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT1_wdl_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_wheel_green_CO.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT3_CO.paa"};
};
class AFV_Wheeled_01_up_base_F;
class B_AFV_Wheeled_01_up_cannon_F : AFV_Wheeled_01_up_base_F { class EventHandlers; };
class B_AFV_Wheeled_01_up_unarmed_F : B_AFV_Wheeled_01_up_cannon_F
{
	faction = "BLU_F";
    side = 1;
	hiddenSelections[] = {"camo1","camo2","camo3","camo4","camo5","CamoNet","CamoSlat"};
	hiddenSelectionsTextures[] = {"a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_EXT1_CO.paa","","a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_wheel_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa","","a3\Armor_F\Data\camonet_NATO_Desert_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
	displayName = "Rhino MGS UP (Unarmed)";
	threat[] = {0.8,0.6,0.6};
	class EventHandlers
	{
		fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
	   	init = "if (local (_this select 0)) then { (_this select 0) setMass 15082; (_this select 0) setCenterOfMass [0.00235461,-1.02214,-1.254078] };";
	   	killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
		postinit = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
	};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_AFV_Wheeled_01_up_unarmed_F.jpg)
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\AFV_Wheeled_01_up_unarmed.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_AFV_Wheeled_01_unarmed_CA.paa";
	class Turrets{};
	class AnimationSources
	{
		class cannon_120mm_revolving
		{
			source = "revolving";
			weapon = "cannon_120mm";
		};
		class com_gun_reload
		{
			source = "reload";
			weapon = "HMG_127_AFV";
		};
		class damage_era_back
		{
			hitpoint = "HitERA_Back";
			raw = 1;
			source = "Hit";
		};
		class damage_era_front
		{
			hitpoint = "HitERA_Front";
			raw = 1;
			source = "Hit";
		};
		class damage_era_left
		{
			hitpoint = "HitERA_Left";
			raw = 1;
			source = "Hit";
		};
		class damage_era_right
		{
			hitpoint = "HitERA_Right";
			raw = 1;
			source = "Hit";
		};
		class damage_era_top
		{
			hitpoint = "HitERA_Top";
			raw = 1;
			source = "Hit";
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
		class HideTurret
		{
			source = user;
	        initPhase = true;
	        animPeriod = 0.001;
		};
		class HitTurret_src
		{
			hitpoint = "HitTurret";
			raw = 1;
			source = "Hit";
		};
		class muzzle_hide_cannon
		{
			source = "reload";
			weapon = "cannon_120mm";
		};
		class muzzle_rot_cannon
		{
			source = "ammorandom";
			weapon = "cannon_120mm";
		};
		class muzzle_rot_HMG
		{
			source = "ammorandom";
			weapon = "MMG_02_coax";
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
	animationList[] = {};
    class TransportMagazines{};
	class TransportWeapons{};
	class TextureSources
    {
		class France
		{
			author = "Bran Flakes";
			displayName = "France";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\AFV_Wheeled_01\Data\afv_wheeled_01_EXT1_fr_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_wheel_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
		};
		class Green
		{
			author = "Bohemia Interactive";
			displayName = "Olive";
			factions[] = {};
			textures[] = {"a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_EXT1_green_CO.paa","","a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_wheel_green_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_CO.paa","","a3\Armor_F\Data\camonet_NATO_Green_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_CO.paa"};
		};
		class Sand
		{
			author = "Bohemia Interactive";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_EXT1_CO.paa","","a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_wheel_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa","","a3\Armor_F\Data\camonet_NATO_Desert_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
		};
		class SFIA
		{
			author = "Unknown";
			displayName = "SFIA";
			factions[] = {};
			textures[] = {"\lxws\vehicles_f_lxws\data\AFV_Wheeled_01\Rhino_Africa1_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_wheel_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa","","A3\Armor_F\Data\camonet_CSAT_HEX_Desert_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
		};
		class WDL_01
		{
			author = "Unknown";
			displayName = "Woodland";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT1_wdl_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_wheel_green_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT3_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT3_CO.paa"};
		};
	};
};
class B_T_AFV_Wheeled_01_up_unarmed_F : B_AFV_Wheeled_01_up_unarmed_F
{
	scope = 2;
    faction = "BLU_T_F";
    side = 1;
	textureList[] = {"Green",1};
	hiddenSelectionsTextures[] = {"a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_EXT1_green_CO.paa","","a3\Armor_F_Tank\AFV_Wheeled_01\data\afv_wheeled_01_wheel_green_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_CO.paa","","a3\Armor_F\Data\camonet_NATO_Green_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_CO.paa"};
};
class B_W_AFV_Wheeled_01_up_unarmed_F : B_AFV_Wheeled_01_up_unarmed_F
{
	scope = 2;
    faction = "BLU_W_F";
    side = 1;
	textureList[] = {"WDL_01",1};
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT1_wdl_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_wheel_green_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT3_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_EXT3_CO.paa"};
};
class O_SFIA_AFV_Wheeled_01_up_unarmed_F : B_AFV_Wheeled_01_up_unarmed_F
{
	scope = 2;
    faction = "OPF_SFIA_lxWS";
    side = 0;
	textureList[] = {"SFIA",1};
	hiddenSelectionsTextures[] = {"\lxws\vehicles_f_lxws\data\AFV_Wheeled_01\Rhino_Africa1_CO.paa","","\A3\Armor_F_Tank\AFV_Wheeled_01\Data\AFV_Wheeled_01_wheel_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa","","A3\Armor_F\Data\camonet_CSAT_HEX_Desert_CO.paa","A3\Armor_F_Tank\AFV_Wheeled_01\Data\afv_wheeled_01_EXT3_sand_CO.paa"};
};