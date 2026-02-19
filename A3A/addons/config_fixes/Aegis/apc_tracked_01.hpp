class APC_Tracked_01_base_F;
class B_APC_Tracked_01_base_F : APC_Tracked_01_base_F
{
  class Turrets;
};
class B_APC_Tracked_01_rcws_F : B_APC_Tracked_01_base_F 
{ 
	class EventHandlers;
	class Turrets: Turrets
    {
        class MainTurret;
        class CommanderOptics;
    };
};
class B_APC_Tracked_01_CRV_F : B_APC_Tracked_01_base_F 
{ 
	class EventHandlers; 
	class Turrets: Turrets
    {
        class MainTurret;
        class CommanderOptics;
    };
};
class B_APC_Tracked_01_unarmed_F : B_APC_Tracked_01_rcws_F
{
    faction = "BLU_F";
    side = 1;
	hiddenSelections[] = {"camo1","camo2","camo3","CamoNet"};
	hiddenSelectionsTextures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_body_CO.paa","\A3\Armor_F_Beta\APC_Tracked_01\Data\MBT_01_body_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa"};
	displayName = "IFV-6c Panther (Unarmed)";
	threat[] = {0.8,0.6,0.6};
	class EventHandlers
	{
		fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 61885; (_this select 0) setCenterOfMass [-0.00370346,-0.908337,-1.49201] };"; 
		killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
	class Turrets: Turrets
    {
        delete MainTurret;
        class CommanderOptics : CommanderOptics {};
    };
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_APC_Tracked_01_unarmed_F.jpg)
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Tracked_01_unarmed_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Tracked_01_unarmed_ca.paa";
	class AnimationSources
    {
        delete muzzle_rot;
        delete muzzle_hide;
        delete revolving_hmg;
        delete revolving_gmg;
        delete HitMainGun_src;
        delete HitTurret_src;

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
            forceAnimate[] = { "showCamonetPlates1",1,"showCamonetPlates2",1 };
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
            source = "Hit";
            hitpoint = "HitEngine";
            raw = 1;
        };
        class HitFuel_src
        {
            source = "Hit";
            hitpoint = "HitFuel";
            raw = 1;
        };
        class HitHull_src
        {
            source = "Hit";
            hitpoint = "HitHull";
            raw = 1;
        };
        class HitComTurret_src
        {
            source = "Hit";
            hitpoint = "HitComTurret";
            raw = 1;
        };
        class HideTurret
        {
            source = "user";
            initPhase = 1;
            animPeriod = 0.001;
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
		class Brown
        {
			author = "Avery Kaiserin";
			displayName = "Brown";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Tracked_01\Data\APC_Tracked_01_body_brown_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Tracked_01\Data\MBT_01_body_brown_CO.paa","","\A3\Armor_F\Data\camonet_greenbeige_CO.paa"};
        };
		class Opfor
        {
			author = "Bohemia Interactive";
			displayName = "Opfor";
			factions[] = {};
            textures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_AA_body_OPFOR_CO.paa","\A3\Armor_F_Beta\APC_Tracked_01\Data\MBT_01_body_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa"};
        };
		class Indep
        {
			author = "Bohemia Interactive";
			displayName = "Indep";
			factions[] = {};
            textures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_body_INDP_CO.paa","A3\Armor_F_exp\APC_Tracked_01\Data\mbt_01_body_olive_co.paa","","a3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
        };
    };
};
class B_T_APC_Tracked_01_unarmed_F : B_APC_Tracked_01_unarmed_F
{
	scope = 2;
    faction = "BLU_T_F";
    side = 1;
	hiddenSelectionsTextures[] = {"A3\Armor_F_exp\APC_Tracked_01\Data\APC_Tracked_01_body_olive_CO.paa","A3\Armor_F_exp\APC_Tracked_01\Data\mbt_01_body_olive_co.paa","","a3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
};
class B_W_APC_Tracked_01_unarmed_F : B_APC_Tracked_01_unarmed_F
{
	scope = 2;
    faction = "BLU_W_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Tracked_01\Data\APC_Tracked_01_body_wdl_CO.paa","\A3_Aegis\Armor_F_Aegis\MBT_01\Data\MBT_01_body_wdl_CO.paa","","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
};
class B_APC_Tracked_01_med_F : B_APC_Tracked_01_unarmed_F
{
    displayName = "IFV-6c Panther (Medical)";
    attendant = true;
    threat[] = {0,0,0};
    hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_sand.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_sand.paa","",""};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_APC_Tracked_01_med_F.jpg);
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Tracked_01_medevac_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Tracked_01_medical_ca.paa";
    class TextureSources : TextureSources
    {
        class Green
        {
            author = "Bohemia Interactive and wersal";
            displayName = "Olive";
            textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_olive.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_olive.paa","",""};
        };
        class Sand
        {
            author = "Bohemia Interactive and wersal";
            displayName = "Sand";
            textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_sand.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_sand.paa","",""};
        };
        class Woodland
        {
            author = "Bohemia Interactive and wersal";
            displayName = "Woodland";
            textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_wdl.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_wdl.paa","",""};
        };
        class Brown
        {
            author = "Avery Kaiserin and wersal";
            displayName = "Brown";
            textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_brown.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_brown.paa","",""};
        };
        class Opfor
        {
            author = "Bohemia Interactive and wersal";
            displayName = "Opfor";
            textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_opfor.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_sand.paa","",""};
        };
        class Indep
        {
            author = "Bohemia Interactive and wersal";
            displayName = "Indep";
            textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_indp.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_olive.paa","",""};
        };
    };
};
class B_T_APC_Tracked_01_med_F : B_APC_Tracked_01_med_F
{
	scope = 2;
    faction = "BLU_T_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_olive.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_olive.paa","",""};
};
class B_W_APC_Tracked_01_med_F : B_APC_Tracked_01_med_F
{
	scope = 2;
    faction = "BLU_W_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_med_wdl.paa","\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_01\apc_tracked_01_bottom_med_wdl.paa","",""};
};

class B_APC_Tracked_01_CRV_unarmed_F : B_APC_Tracked_01_CRV_F
{
	faction = "BLU_F";
    side = 1;
	hiddenSelections[] = {"camo1","camo2","camo3","camo4","CamoNet"};
	hiddenSelectionsTextures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_body_CRV_CO.paa","\A3\Armor_F_Beta\APC_Tracked_01\Data\MBT_01_body_CO.paa","","\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_CRV_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa"};
	displayName = "CRV-6e Bobcat (Unarmed)";
	threat[] = {0.8,0.6,0.6};
	class EventHandlers
	{
		fired = "_this call (uinamespace getvariable 'BIS_fnc_effectFired');";
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 64756; (_this select 0) setCenterOfMass [-0.00430519,-0.855802,-1.5248] };"; 
		killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
	class Turrets : Turrets
    {
        delete MainTurret;
        class CommanderOptics : CommanderOptics {};
    };
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\B_APC_Tracked_01_CRV_unarmed_F.jpg)
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Tracked_01_crv_unarmed_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Tracked_01_crv_unarmed_ca.paa";
	class AnimationSources
    {
        delete HitMainGun_src;
        delete HitTurret_src;
        delete muzzle_hide;
        delete muzzle_rot;
        delete revolving_mg;

        class HideTurret
        {
            source = "user";
            initPhase = 1;
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
        class MovePlow
        {
            animPeriod = 3;
            initPhase = 0;
            sound = "PlowSound";
            soundPosition = "plow_sound";
            source = "user";
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
        class showCamonetHull
        {
            animPeriod = 0.001;
            author = "Bohemia Interactive";
            displayName = "Show Camo Net (Hull)";
            forceAnimate[] = { "showCamonetPlates1",1,"showCamonetPlates2",1,"showWheels",1 };
            forceAnimate2[] = { "showCamonetPlates1",0,"showCamonetPlates2",0 };
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
        class showWheels
        {
            animPeriod = 0.001;
            author = "Bohemia Interactive";
            displayName = "Show Road Wheels";
            forceAnimate[] = { "showCamonetHull",0,"showCamonetPlates1",0,"showCamonetPlates2",0 };
            forceAnimatePhase = 0;
            initPhase = 0;
            mass = 50;
            source = "user";
        };
        class Smoke_source
        {
            source = "revolving";
            weapon = "SmokeLauncher";
        };
    };
	animationList[] = {};
    class TransportMagazines{};
	class TransportWeapons{};
	class TextureSources
    {
		class Olive
		{
			author = "Bohemia Interactive";
			displayName = "Olive";
			factions[] = {};
			textures[] = {"A3\Armor_F_exp\APC_Tracked_01\Data\apc_tracked_01_body_crv_olive_co.paa","A3\Armor_F_exp\APC_Tracked_01\Data\mbt_01_body_olive_co.paa","","A3\Armor_F_exp\APC_Tracked_01\Data\apc_tracked_01_crv_olive_co.paa","a3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
		};
		class Sand
		{
			author = "Bohemia Interactive";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_body_CRV_CO.paa","\A3\Armor_F_Beta\APC_Tracked_01\Data\MBT_01_body_CO.paa","","\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_CRV_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa"};
		};
		class Woodland
		{
			author = "Unknown"
			displayName = "Woodland";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Tracked_01\Data\APC_Tracked_01_body_wdl_CO.paa","\A3_Aegis\Armor_F_Aegis\MBT_01\Data\MBT_01_body_wdl_CO.paa","","\A3\Armor_F_Exp\APC_Tracked_01\Data\apc_tracked_01_crv_olive_co.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
		};
		class Brown
		{
			author = "Avery Kaiserin";
			displayName = "Brown";
			factions[] = {"Atlas_IND_I_F"};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Tracked_01\Data\APC_Tracked_01_body_CRV_brown_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Tracked_01\Data\MBT_01_body_brown_CO.paa","","\A3_Atlas\Armor_F_Atlas\APC_Tracked_01\Data\APC_Tracked_01_CRV_brown_CO.paa","\A3\Armor_F\Data\camonet_greenbeige_CO.paa"};
		};
		class Opfor
        {
			author = "Bohemia Interactive";
			displayName = "Opfor";
			factions[] = {};
            textures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_AA_body_OPFOR_CO.paa","\A3\Armor_F_Beta\APC_Tracked_01\Data\MBT_01_body_CO.paa","","\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_CRV_OPFOR_CO.paa","\A3\Armor_F\Data\camonet_NATO_Desert_CO.paa"};
        };
		class Indep
        {
			author = "Bohemia Interactive";
			displayName = "Indep";
			factions[] = {};
            textures[] = {"\A3\Armor_F_Beta\APC_Tracked_01\Data\APC_Tracked_01_body_INDP_CO.paa","A3\Armor_F_exp\APC_Tracked_01\Data\mbt_01_body_olive_co.paa","","A3\Armor_F_exp\APC_Tracked_01\Data\apc_tracked_01_crv_olive_co.paa","a3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
        };
	};
};
class B_T_APC_Tracked_01_CRV_unarmed_F : B_APC_Tracked_01_CRV_unarmed_F
{
	scope = 2;
    faction = "BLU_T_F";
    side = 1;
	hiddenSelectionsTextures[] = {"A3\Armor_F_exp\APC_Tracked_01\Data\apc_tracked_01_body_crv_olive_co.paa","A3\Armor_F_exp\APC_Tracked_01\Data\mbt_01_body_olive_co.paa","","A3\Armor_F_exp\APC_Tracked_01\Data\apc_tracked_01_crv_olive_co.paa","a3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
};
class B_W_APC_Tracked_01_CRV_unarmed_F : B_APC_Tracked_01_CRV_unarmed_F
{
	scope = 2;
    faction = "BLU_W_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Tracked_01\Data\APC_Tracked_01_body_wdl_CO.paa","\A3_Aegis\Armor_F_Aegis\MBT_01\Data\MBT_01_body_wdl_CO.paa","","\A3\Armor_F_Exp\APC_Tracked_01\Data\apc_tracked_01_crv_olive_co.paa","\A3\Armor_F\Data\camonet_NATO_Green_CO.paa"};
};