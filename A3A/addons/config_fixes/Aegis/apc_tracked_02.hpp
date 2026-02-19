class Tank_F;
class APC_Tracked_02_base_F : Tank_F
{
	class EventHandlers;
	class TextureSources;
};
class APC_Tracked_02_medical_base_F : APC_Tracked_02_base_F 
{
	class EventHandlers : EventHandlers
	{
		fired = "[_this select 0,_this select 6,'missile_move','MissileBase'] call BIS_fnc_missileLaunchPositionFix; _this call (uinamespace getvariable 'BIS_fnc_effectFired');";
	   	init = "if (local (_this select 0)) then { (_this select 0) setMass 25900; (_this select 0) setCenterOfMass [0.0305562,-1.6773,-1.52879] };";
	   	killed = "_this call (uinamespace getvariable 'BIS_fnc_effectKilled');";
	   	postinit = "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
	};
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Tracked_02_medical_ca.paa";
	class TextureSources : TextureSources
    {
		class Green
		{
			author = "Avery Kaiserin";
			displayName = "Green";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Tracked_02\Data\APC_Tracked_02_ext_01_medevac_RUkhk_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Tracked_02\Data\APC_Tracked_02_ext_02_RUkhk_CO.paa","","",""};
		};
		class WoodlandHex
		{
			author = "Lowaltitude";
			displayName = "Woodland Hex";
			factions[] = {};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Tracked_02\Data\APC_Tracked_02_ext_01_medical_whex_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Tracked_02\Data\APC_Tracked_02_ext_02_whex_CO.paa","","",""};
		};
		class Hex
		{
			author = "Bohemia Interactive";
			displayName = "Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_02\apc_tracked_02_ext_01_medical_hex.paa","A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_02_hexarid_co.paa","","",""};
		};
		class GreenHex
		{
			author = "Bohemia Interactive";
			displayName = "Green Hex";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_02\apc_tracked_02_ext_01_medical_ghex.paa","A3\Armor_F_Exp\APC_Tracked_02\Data\APC_Tracked_02_ext_02_ghex_CO.paa","","",""};
		};
		class ardistan
		{
			author = "Bran Flakes";
			displayName = "Ardistan";
			factions[] = {};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_02\apc_tracked_02_ext_01_medical_ard.paa","\A3_Atlas\Armor_F_Atlas\APC_Tracked_02\Data\APC_Tracked_02_ext_02_ard_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Tracked_02\Data\apc_tracked_02_ext_03_RUkhk_co.paa","","",""};
		};
		class Takistan
		{
			author = "Bran Flakes";
			displayName = "Semi-Arid Hex";
			factions[] = {"Atlas_OPF_T_F"};
			textures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_02\apc_tracked_02_ext_01_medical_tk.paa","\A3_Atlas\Armor_F_Atlas\APC_Tracked_02\Data\APC_Tracked_02_ext_02_tk_CO.paa","","",""};
		};
	};  //maybe I should add texture versions from WS variant aswell
};

class O_APC_Tracked_02_medical_F : APC_Tracked_02_medical_base_F
{
	scope = 2;
	faction = "OPF_F";
	side = 0;
	displayName = "BTR-K Medical";
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_02\apc_tracked_02_ext_01_medical_hex.paa","A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_02_hexarid_co.paa","","",""};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\O_APC_Tracked_02_medical_F.jpg)
};
class O_T_APC_Tracked_02_medical_F : APC_Tracked_02_medical_base_F
{
	scope = 2;
    faction = "OPF_T_F";
    side = 0;
	displayName = "BTR-K Medical";
	hiddenSelectionsTextures[] = {"\x\A3A\addons\config_fixes\Textures\vehicles\APC_tracked_02\apc_tracked_02_ext_01_medical_ghex.paa","A3\Armor_F_Exp\APC_Tracked_02\Data\APC_Tracked_02_ext_02_ghex_CO.paa","","",""};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\O_T_APC_Tracked_02_medical_F.jpg)
};

class APC_Tracked_02_unarmed_base_F : APC_Tracked_02_medical_base_F
{
	animationList[] = {"showTracks",0.5,"showCamonetHull",0,"showBags",0.67,"showSLATHull",0};
	hiddenSelections[] = {"camo1","camo2","camo3","CamoNet","CamoSlat"};
	attendant = false;
	threat[] = {0.8,0.6,0.6};
	picture = "\x\A3A\addons\config_fixes\Pictures\icons\APC_Tracked_02_unarmed_CA.paa";
	Icon = "\x\A3A\addons\config_fixes\Pictures\icons\map_APC_Tracked_02_unarmed_ca.paa";
	displayName = "BTR-K Kamysh (Unarmed)";
	class TextureSources
    {
		class Green
		{
			author = "Avery Kaiserin";
			displayName = "Green";
			factions[] = {};
			textures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Tracked_02\Data\APC_Tracked_02_ext_01_RUkhk_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Tracked_02\Data\APC_Tracked_02_ext_02_RUkhk_CO.paa","","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
		};
		class GreenHex
		{
			author = "Bohemia Interactive";
			displayName = "Green Hex";
			factions[] = {};
			textures[] = {"A3\Armor_F_Exp\APC_Tracked_02\Data\APC_Tracked_02_ext_01_ghex_CO.paa","A3\Armor_F_Exp\APC_Tracked_02\Data\APC_Tracked_02_ext_02_ghex_CO.paa","","A3\Armor_F\Data\camonet_CSAT_HEX_Green_CO.paa","A3\armor_f\data\cage_csat_green_CO.paa"};
		};
		class Hex
		{
			author = "Bohemia Interactive";
			displayName = "Hex";
			factions[] = {};
			textures[] = {"A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_01_hexarid_co.paa","A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_02_hexarid_co.paa","","A3\Armor_F\Data\camonet_CSAT_HEX_Desert_CO.paa","A3\armor_f\data\cage_csat_co.paa"};
		};
		class Sand
		{
			displayName = "Sand";
			factions[] = {};
			textures[] = {"lxws\vehicles_f_lxws\data\APC_Tracked_02\kamysh_sand1_co.paa","lxws\vehicles_f_lxws\data\APC_Tracked_02\kamysh_sand2_co.paa","lxws\vehicles_f_lxws\data\APC_Tracked_02\kamysh_sand3_co.paa","A3\Armor_F\Data\camonet_CSAT_HEX_Desert_CO.paa","A3\armor_f\data\cage_csat_co.paa"};
		};
		class Sep_01
		{
			author = "Bran Flakes";
			displayName = "Separatist 01";
			factions[] = {};
			textures[] = {"\A3_Opf\Armor_F_Opf\APC_Tracked_02\Data\APC_Tracked_02_ext_01_Opf_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Tracked_02\Data\APC_Tracked_02_ext_02_RUkhk_CO.paa","","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
		};
		class SFIA
		{
			displayName = "SFIA";
			factions[] = {};
			textures[] = {"lxws\vehicles_f_lxws\data\APC_Tracked_02\kamysh_africa1_co.paa","lxws\vehicles_f_lxws\data\APC_Tracked_02\kamysh_africa2_co.paa","","A3\Armor_F\Data\camonet_CSAT_HEX_Desert_CO.paa","A3\armor_f\data\cage_csat_co.paa"};
		};
		class Takistan
		{
			author = "Bran Flakes";
			displayName = "Semi-Arid Hex";
			factions[] = {"Atlas_OPF_T_F"};
			textures[] = {"\A3_Atlas\Armor_F_Atlas\APC_Tracked_02\Data\APC_Tracked_02_ext_01_tk_CO.paa","\A3_Atlas\Armor_F_Atlas\APC_Tracked_02\Data\APC_Tracked_02_ext_02_tk_CO.paa","","\A3\Armor_F\Data\camonet_CSAT_Hex_Desert_CO.paa","\A3\Armor_F\Data\cage_CSAT_CO.paa"};
		};
		class Grey
		{
			author = "Rotators Collective";
			displayName = "Grey";
			factions[] = {};
			textures[] = {"lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_ext_01_black_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\APC_Tracked_02_ext_02_black_CO.paa","","","A3\Armor_F\Data\camonet_CSAT_Stripe_Desert_CO.paa","lxWS\vehicles_1_f_lxws\APC_Tracked_02\data\cage_black_CO.paa"};
		};
	};  //maybe I should add versions from WS variant aswell
};
class O_APC_Tracked_02_unarmed_F : APC_Tracked_02_unarmed_base_F
{
	scope = 2;
	faction = "OPF_F";
	side = 0;
	hiddenSelectionsTextures[] = {"A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_01_hexarid_co.paa","A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_02_hexarid_co.paa","","A3\Armor_F\Data\camonet_CSAT_HEX_Desert_CO.paa","A3\armor_f\data\cage_csat_co.paa"};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\O_APC_Tracked_02_unarmed_F.jpg)
};
class O_T_APC_Tracked_02_unarmed_F : APC_Tracked_02_unarmed_base_F
{
	scope = 2;
    faction = "OPF_T_F";
    side = 0;
	hiddenSelectionsTextures[] = {"A3\Armor_F_Exp\APC_Tracked_02\Data\APC_Tracked_02_ext_01_ghex_CO.paa","A3\Armor_F_Exp\APC_Tracked_02\Data\APC_Tracked_02_ext_02_ghex_CO.paa","","A3\Armor_F\Data\camonet_CSAT_HEX_Green_CO.paa","A3\armor_f\data\cage_csat_green_CO.paa"};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\O_T_APC_Tracked_02_unarmed_F.jpg)
};
class Aegis_O_R_APC_Tracked_02_unarmed_lxWS : APC_Tracked_02_unarmed_base_F
{
	scope = 2;
    faction = "OPF_R_F";
    side = 0;
	displayName = "BTR-K (Unarmed)";
	hiddenSelectionsTextures[] = {"\A3_Aegis\Armor_F_Aegis\APC_Tracked_02\Data\APC_Tracked_02_ext_01_RUkhk_CO.paa","\A3_Aegis\Armor_F_Aegis\APC_Tracked_02\Data\APC_Tracked_02_ext_02_RUkhk_CO.paa","","\A3_Aegis\Armor_F_Aegis\Data\camonet_RUS_green_CO.paa","\A3_Aegis\Armor_F_Aegis\Data\cage_RUkhk_CO.paa"};
	editorPreview = QPATHTOFOLDER(Pictures\vehicles\O_T_APC_Tracked_02_unarmed_F.jpg)
};