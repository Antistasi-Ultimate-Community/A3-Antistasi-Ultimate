//SPE - CfgVehicles.hpp


class CfgVehicles
{
	class SPEX_C47_Skytrain;
	class SPEX_CW_Humber_MkII;
	class SPEX_CW_Humber_LRC;
	class SPEX_CW_Humber_MkIV;
	class SPEX_CW_Humber_MkIV_PLM;
	class SPEX_CW_Cromwell_Mk5;
	class SPEX_CW_Cromwell_Mk6;
	class SPEX_M4A1_75_DV;
	class SPEX_CW_Sherman_I;
	class SPEX_CW_Sherman_I_Early;
	class SPEX_CW_Sherman_I_Hybrid;
	class SPEX_CW_Sherman_Ic;
	class SPEX_CW_Sherman_Ic_Hybrid;
	class SPEX_CW_Sherman_II_late;
	class SPEX_CW_Sherman_II_Early;
	class SPEX_CW_Sherman_V;
	class SPEX_CW_Sherman_V_Early;
	class SPEX_CW_Sherman_Vc;
	class SPEX_CW_Bedford_MWD;
	class SPEX_CW_Bedford_MWD_Ammo;
	class SPEX_CW_Bedford_MWD_Fuel;
	class SPEX_CW_Bedford_MWD_Open;
	class SPEX_CW_Bedford_MWD_Repair;
	
	class SPEX_C47_CIV_Skytrain : SPEX_C47_Skytrain
	{
    	crew = "C_man_pilot_F";
    	faction = "CIV_F";
    	side = 3;
    	textureList[] = {"standard",0,"bare",1};
		hiddenSelectionsTextures[] = {"WW2\SPEX\addons\Assets_t_Vehicles_Planes_t\C47\DC3_Body_01_bare_co.paa","WW2\SPEX\addons\Assets_t_Vehicles_Planes_t\C47\DC3_Body_02_bare_co.paa","WW2\SPEX\addons\Assets_t_Vehicles_Planes_t\C47\DC3_Cargo_01_co.paa",""};
    };

	///apcs
	class SPEX_CW_Humber_MkII_noinsigna : SPEX_CW_Humber_MkII
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKII\HUMBER_MKII_hull_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKII\HUMBER_MKII_turret_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_wheel_co.paa","","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_interior_co.paa"};
	};

	class SPEX_CW_Humber_LRC_noinsigna : SPEX_CW_Humber_LRC
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\HUMBER_LRC\HUMBER_LRC_hull_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\HUMBER_LRC\HUMBER_LRC_turret_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\HUMBER_LRC\HUMBER_LRC_int_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\HUMBER_LRC\HUMBER_LRC_wheel_co.paa",""};
	};

	class SPEX_CW_Humber_MkIV_noinsignia : SPEX_CW_Humber_MkIV
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_hull_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_turret_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_wheel_co.paa","","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_interior_co.paa"};
	};

	class SPEX_CW_Humber_MkIV_PLM_noinsignia : SPEX_CW_Humber_MkIV_PLM
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_hull_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_turret_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_wheel_co.paa","","\WW2\SPEX\addons\Assets_t_Vehicles_ArmoredCar_t\Humber_MKIV\HUMBER_MKIV_interior_co.paa"};
	};

	///tanks
	class SPEX_CW_Cromwell_Mk5_noinsignia : SPEX_CW_Cromwell_Mk5
	{
		hiddenSelectionsTextures[] = {"ww2\spex\addons\assets_t_vehicles_tanks_t\cromwell\cromwellhull_scc15_co.paa","ww2\spex\addons\assets_t_vehicles_tanks_t\cromwell\cromwellturret_scc15_co.paa","ww2\spex\addons\assets_t_vehicles_tanks_t\cromwell\cromwellwheels_scc15_co.paa","ww2\spex\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_SCC15_co.paa",""};
	};
	class SPEX_CW_Cromwell_Mk6_noinsignia : SPEX_CW_Cromwell_Mk6
	{
		hiddenSelectionsTextures[] = {"ww2\spex\addons\assets_t_vehicles_tanks_t\cromwell\cromwellhull_scc15_co.paa","ww2\spex\addons\assets_t_vehicles_tanks_t\cromwell\cromwellturret_scc15_co.paa","ww2\spex\addons\assets_t_vehicles_tanks_t\cromwell\cromwellwheels_scc15_co.paa","ww2\spex\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_SCC15_co.paa",""};
	};
	class SPEX_M4A1_75_DV_noinsignia : SPEX_M4A1_75_DV
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_dv_hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_e_Turret_co.paa","\ww2\spex\addons\assets_t_vehicles_tanks_t\m4a0\m4a0_e_wheels_co.paa","","","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\Usa_ca.paa"};
	};
	class SPEX_CW_Sherman_I_noinsignia : SPEX_CW_Sherman_I
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_hull_scc15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_turret_scc15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_wheels_scc15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_scc15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_I_Early_noinsignia : SPEX_CW_Sherman_I_Early
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_e_Turret_co.paa","\ww2\spex\addons\assets_t_vehicles_tanks_t\m4a0\m4a0_e_wheels_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_SCC15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_I_Hybrid_noinsignia : SPEX_CW_Sherman_I_Hybrid
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a3\m4a0_c_hull_scc15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a3\m4a3_turret_scc15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_wheels_scc15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_scc15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_Ic_noinsignia : SPEX_CW_Sherman_Ic
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_hull_SCC15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_turret_SCC15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_wheels_SCC15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_Ic_Hybrid_noinsignia : SPEX_CW_Sherman_Ic_Hybrid
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a3\m4a0_c_hull_scc15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a3\m4a3_turret_scc15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_wheels_scc15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_scc15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_II_late_noinsignia : SPEX_CW_Sherman_II_late
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_hull_scc15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_turret_scc15_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_wheels_scc15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_scc15_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_II_Early_noinsignia : SPEX_CW_Sherman_II_Early
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_dv_hull_scc2_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_turret_scc2_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a0_e_wheels_scc2_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_scc2_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_V_noinsignia : SPEX_CW_Sherman_V
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a4\m4a4_hull_SCC2_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_turret_SCC2_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_wheels_SCC2_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_SCC2_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_V_Early_noinsignia : SPEX_CW_Sherman_V_Early
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a4\m4a4_hull_SCC2_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_turret_SCC2_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_wheels_SCC2_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_SCC2_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};
	class SPEX_CW_Sherman_Vc_noinsignia : SPEX_CW_Sherman_Vc
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a4\m4a4_hull_SCC2_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\m4a0_e_turret_SCC2_co.paa","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\m4a1\m4a1_wheels_SCC2_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\spex_firefly_parts_SCC2_co.paa","","\WW2\SPEX\addons\assets_t_vehicles_tanks_t\firefly\T_ca.paa"};
	};

	//trucks
	class SPEX_CW_Bedford_MWD_noinsignia : SPEX_CW_Bedford_MWD
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_ext_SCC15BB_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_int_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_wheel_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_roof_co.paa",""};
	};
	class SPEX_CW_Bedford_MWD_Ammo_noinsignia : SPEX_CW_Bedford_MWD_Ammo
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_ext_SCC15BB_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_int_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_wheel_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_roof_co.paa",""};
	};
	class SPEX_CW_Bedford_MWD_Fuel_noinsignia : SPEX_CW_Bedford_MWD_Fuel
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_ext_SCC15BB_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_int_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_wheel_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_roof_co.paa",""};
	};
	class SPEX_CW_Bedford_MWD_Open_noinsignia : SPEX_CW_Bedford_MWD_Open
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_ext_SCC15BB_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_int_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_wheel_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_roof_co.paa",""};
	};
	class SPEX_CW_Bedford_MWD_Repair_noinsignia : SPEX_CW_Bedford_MWD_Repair
	{
		hiddenSelectionsTextures[] = {"\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_ext_SCC15BB_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_int_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_wheel_co.paa","\WW2\SPEX\addons\Assets_t_Vehicles_Trucks_t\Bedford_MWD\Bedford_MWD_roof_co.paa",""};
	};
};