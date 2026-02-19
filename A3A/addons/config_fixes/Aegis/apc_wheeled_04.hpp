class Aegis_I_APC_Wheeled_04_export_unarmed_F : Aegis_I_APC_Wheeled_04_export_F
{
	scope = 2;
    faction = "IND_F";
    side = 2;
	textureList[] = {"Indep",1};
	hiddenSelections[] = {"Camo1","Camo2","Camo3"};
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\btr100a_turret_AAF_co.paa"};
	displayName = "BTR-100A (Unarmed)";
	threat[] = {0.8,0.6,0.6};
	class EventHandlers
	{
		fired = "[_this select 0,_this select 6,'missile_move','MissileBase'] call BIS_fnc_missileLaunchPositionFix; _this call (uinamespace getvariable 'BIS_fnc_effectFired');";
	    init = "if (local (_this select 0)) then { (_this select 0) setMass 18000; (_this select 0) setCenterOfMass [0.0023371,-0.982133,-1.48482] };";
		killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\Aegis_I_APC_Wheeled_04_export_unarmed_F.jpg)
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Wheeled_04_unarmed_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Wheeled_04_unarmed_CA.paa";
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
class Aegis_O_T_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_unarmed_F
{
	scope = 2;
    faction = "OPF_T_F";
    side = 0;
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_ghex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ghex_CO.paa",""};
};
class Aegis_I_UNO_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_unarmed_F
{
	scope = 2;
    faction = "Atlas_IND_UNO_F";
    side = 2;
	hiddenSelectionsTextures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_UNO_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_UNO_CO.paa",""};
};
class Aegis_B_G_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_unarmed_F
{
	scope = 2;
    faction = "BLU_G_F";
    side = 1;
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_FIA_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_FIA_CO.paa",""};
};
class Aegis_O_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_unarmed_F
{
	scope = 2;
    faction = "OPF_F";
    side = 0;
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_hex_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_hex_CO.paa",""};
};
class Aegis_O_SFIA_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_unarmed_F
{
	scope = 2;
    faction = "OPF_SFIA_lxWS";
    side = 0;
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body_export_SFIA_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_SFIA_CO.paa",""};
};
class O_R_APC_Wheeled_04_unarmed_F : Aegis_I_APC_Wheeled_04_export_unarmed_F
{
	scope = 2;
    faction = "OPF_R_F";
    side = 0;
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\data\APC_Wheeled_04_export_body_RUkhk_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_RUkhk_CO.paa",""};
};

class Aegis_I_APC_Wheeled_04_export_med_F : Aegis_I_APC_Wheeled_04_export_unarmed_F
{
    displayName = "BTR-100A (Medical)";
    attendant = true;
    threat[] = {0,0,0};
    hiddenSelectionsTextures[] = {
        "\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_AAF.paa",
        "\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa",
        ""
    };
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\Aegis_I_APC_Wheeled_04_export_med_F.jpg);
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Wheeled_04_medevac_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Wheeled_04_medical_CA.paa";
    class TextureSources
    {
		class ardistan
		{
			author = "Bran Flakes and wersal";
			displayName = "Ardistan";
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_ardi.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ardi_CO.paa",""};
		}
        class Green
        {
			author = "Avery Kaiserin and wersal";
			displayName = "Green";
			factions[] = {};
            textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_RUkhk.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_RUkhk_CO.paa",""};
        };
		class GreenHex
		{
			author = "Lukin and wersal";
			displayName = "Green Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_Ghex.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ghex_CO.paa",""};
		};
		class Hex
		{
			author = "Lukin and wersal";
			displayName = "Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_Hex.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_hex_CO.paa",""};
		};
		class Indep
		{
			author = "Bran Flakes and wersal";
			displayName = "AAF";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_AAF.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_AAF_CO.paa",""};
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
			author = "Bran Flakes and wersal";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_Sand.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_sand_CO.paa",""};
		};
		class SFIA
		{
			author = "Bran Flakes and wersal";
			displayName = "SFIA";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_SFIA.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_SFIA_CO.paa",""};
		};
		class Takistan
		{
			author = "Bran Flakes and wersal";
			displayName = "Semi-Arid Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_tk.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_TK_CO.paa",""};
		};
		class UNO
		{
			author = "Bran Flakes and wersal";
			displayName = "UNO";
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_UNO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_UNO_CO.paa",""};
		};
		class WoodlandHex
		{
			author = "Bran Flakes and wersal";
			displayName = "Woodland Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_WHEX.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_WHEX_CO.paa",""};
		};
    };
};
class Aegis_O_T_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F
{
	scope = 2;
    faction = "OPF_T_F";
    side = 0;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_Ghex.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_ghex_CO.paa",""};
};
class Aegis_I_UNO_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F
{
	scope = 2;
    faction = "Atlas_IND_UNO_F";
    side = 2;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_UNO.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_04\Data\APC_Wheeled_04_body2_UNO_CO.paa",""};
};
class Aegis_O_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F
{
	scope = 2;
    faction = "OPF_F";
    side = 0;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_Hex.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_hex_CO.paa",""};
};
class Aegis_O_SFIA_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F
{
	scope = 2;
    faction = "OPF_SFIA_lxWS";
    side = 0;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_SFIA.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_SFIA_CO.paa",""};
};
class O_R_APC_Wheeled_04_med_F : Aegis_I_APC_Wheeled_04_export_med_F
{
	scope = 2;
    faction = "OPF_R_F";
    side = 0;
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_04\apc_wheeled_04_med_ext_export_RUkhk.paa","\A3_Aegis\Armor_F_Aegis\APC_Wheeled_04\Data\APC_Wheeled_04_body2_RUkhk_CO.paa",""};
};