class APC_Wheeled_02_unarmed_base_lxws;
class O_APC_Wheeled_02_unarmed_lxWS : APC_Wheeled_02_unarmed_base_lxws { class EventHandlers; };
class O_APC_Wheeled_02_med_lxWS : O_APC_Wheeled_02_unarmed_lxWS
{
	faction = "OPF_F";
	side = 0;
	hiddenSelections[] = {"camo1","camo2","CamoNet","CamoSlat","camo6"};
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_opfor.paa","a3\armor_f_beta\apc_wheeled_02\data\apc_wheeled_02_ext_02_opfor_co.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_hex_CO.paa"};
	displayName = "MSE-3 Marid (Medical)";
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Wheeled_02_medevac_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Wheeled_02_medical_CA.paa";
	attendant = true;
	threat[] = {0,0,0};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\O_APC_Wheeled_02_med_lxWS.jpg)
	class AnimationSources
	{
		class HideTurret
		{
			animPeriod = 0.001;
			initPhase = 1;
			source = "user";
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
		class HitTurret_src
		{
			hitpoint = "HitTurret";
			raw = 1;
			source = "Hit";
		};
		class muzzle_hide
		{
			source = "reload";
			weapon = "GMG_40mm";
		};
		class muzzle_hide1
		{
			source = "reload";
			weapon = "HMG_127_APC";
		};
		class muzzle_rot
		{
			source = "ammorandom";
			weapon = "GMG_40mm";
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
		class showCanisters
		{
			animPeriod = 0.001;
			author = "Bohemia Interactive";
			displayName = "Show Canisters";
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
        class Black
        {
			author = "Rotators Collective and wersal";
			displayName = "Black";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_black.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_black_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_black_CO.paa"};
		};
		class Gendarmerie
		{
			author = "Rotators Collective and wersal";
			displayName = "Gendarmerie";
			factions[] = {"BLU_GEN_F","OPF_GEN_F"};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_gen.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\marid_ext02_gen_co.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\marid_adds02_gen_co.paa"};
		};
		class GreenHex
		{
			author = "Rotators Collective and wersal";
			displayName = "Green Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_ghex.paa","a3\Armor_F_Exp\APC_Wheeled_02\Data\APC_Wheeled_02_ext_02_ghex_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_ghex_CO.paa"};
		};
		class Hex
		{
			author = "Rotators Collective and wersal";
			displayName = "Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_opfor.paa","a3\armor_f_beta\apc_wheeled_02\data\apc_wheeled_02_ext_02_opfor_co.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_hex_CO.paa"};
		};
		class HIFM
		{
			author = "Bran Flakes and wersal";
			displayName = "Jungle";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_HIMF.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_02\Data\apc_wheeled_02_ext_02_HIMF_CO.paa","","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_02\data\apc_wheeled_02_adds_02_HIMF_CO.paa"};
		};
		class MarineHex
		{
			author = "Bran Flakes and wersal";
			displayName = "Marine Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_OHEX.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_02\Data\APC_Wheeled_02_ext_02_OHEX_CO.paa","","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_02\data\apc_wheeled_02_adds_02_OHEX_CO.paa"};
		};
		class Sand
		{
			author = "Bohemia Interactive and wersal";
			displayName = "Sand";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_nato.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_nato_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_nato_CO.paa"};
		};
		class Sand_Desert
		{
			author = "Rotators Collective and wersal";
			displayName = "Sand (Desert Camo Net)";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_nato.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_nato_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_nato_CO.paa"};
		};
		class SFIA
		{
			author = "Rotators Collective and wersal";
			displayName = "SFIA";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_sfia.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_sfia_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_sfia_CO.paa"};
		};
		class Takistan
		{
			author = "Bran Flakes and wersal";
			displayName = "Semi-Arid Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_tk.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_02\Data\APC_Wheeled_02_ext_02_tk_CO.paa","","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_02\Data\APC_Wheeled_02_adds_02_tk_CO.paa"};
		};
		class UN_WHITE
		{
			author = "Rotators Collective and wersal";
			displayName = "UNA";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_UNA.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_UNA_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_UNA_CO.paa"};
		};
		class WoodlandHex
		{
			author = "Bran Flakes and wersal";
			displayName = "Woodland Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_WHEX.paa","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_02\Data\APC_Wheeled_02_ext_02_WHEX_CO.paa","","","\A3_Atlas\Armor_F_Atlas\APC_Wheeled_02\data\apc_wheeled_02_adds_02_WHEX_CO.paa"};
		};
    };
};
class O_T_APC_Wheeled_02_med_lxWS : O_APC_Wheeled_02_med_lxWS
{
	scope = 2;
    faction = "OPF_T_F";
    side = 0;
	textureList[] = {"GreenHex",1};
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_ghex.paa","a3\Armor_F_Exp\APC_Wheeled_02\Data\APC_Wheeled_02_ext_02_ghex_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_ghex_CO.paa"};
};
class a3a_ION_APC_Wheeled_02_med_lxWS : O_APC_Wheeled_02_med_lxWS
{
	scope = 2;
    faction = "BLU_ION_lxWS";
    side = 1;
	textureList[] = {"Black",1};
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_black.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_black_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_black_CO.paa"};
};
class a3a_GEN_APC_Wheeled_02_med_lxWS : O_APC_Wheeled_02_med_lxWS
{
	scope = 2;
    faction = "BLU_GEN_F";
    side = 1;
	textureList[] = {"Gendarnerie",1};
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_gen.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\marid_ext02_gen_co.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\marid_adds02_gen_co.paa"};
};
class B_APC_Wheeled_02_med_lxWS : O_APC_Wheeled_02_med_lxWS
{
	scope = 2;
    faction = "BLU_F";
    side = 1;
	textureList[] = {"Sand",1};
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_nato.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_nato_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_nato_CO.paa"};
};
class O_SFIA_APC_Wheeled_02_med_lxWS : O_APC_Wheeled_02_med_lxWS
{
	scope = 2;
    faction = "OPF_SFIA_lxWS";
    side = 0;
	textureList[] = {"SFIA",1};
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_sfia.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_sfia_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_sfia_CO.paa"};
};
class B_UN_APC_Wheeled_02_med_lxWS : O_APC_Wheeled_02_med_lxWS
{
	scope = 2;
    faction = "BLU_UN_lxWS";
    side = 1;
	textureList[] = {"UN_WHITE",1};
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_wheeled_02\apc_wheeled_02_med_ext_UNA.paa","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_ext_02_UNA_CO.paa","","","lxWS\vehicles_1_f_lxws\APC_Wheeled_02\data\APC_Wheeled_02_adds_02_UNA_CO.paa"};
};