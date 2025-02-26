//SPE - CfgVehicles.hpp

class CfgVehicles
{
	class SPE_FFI_SdKfz250_1;
	class SPE_FFI_OpelBlitz;
	class SPE_FFI_OpelBlitz_Ambulance;
	class SPE_FFI_OpelBlitz_Ammo;
	class SPE_FFI_OpelBlitz_Fuel;
	class SPE_FFI_OpelBlitz_Open;
	class SPE_FFI_OpelBlitz_Repair;
	class SPE_OpelBlitz_Flak38;

	class SPE_PzKpfwIII_J;
	class SPE_PzKpfwIII_L;
	class SPE_PzKpfwIII_M;
	class SPE_PzKpfwIII_N;
	class SPE_PzKpfwIV_G;
	class SPE_Nashorn;

	class SPE_PzKpfwIII_J_DLV;
	class SPE_PzKpfwIII_L_DLV;
	class SPE_PzKpfwIII_M_DLV;
	class SPE_PzKpfwIII_N_DLV;
	class SPE_PzKpfwIV_G_DLV;
	class SPE_Nashorn_DLV;

	class SPE_FR_M16_Halftrack;
	class SPE_FR_M3_Halftrack_Ambulance;
	class SPE_FR_M3_Halftrack_Ammo;
	class SPE_FR_M3_Halftrack_Fuel;
	class SPE_FR_M3_Halftrack_Repair;
	class SPE_FR_M3_Halftrack_Unarmed;
	class SPE_FR_M3_Halftrack_Unarmed_Open;
	class SPE_FR_M3_Halftrack;

	class SPE_FR_M10;
	class SPE_FR_M4A0_75_Early;
	class SPE_FR_M4A0_75_mid;
	class SPE_FR_M4A1_76;
	class SPE_FR_M4A1_75;

	class SPE_M18_Hellcat;
	class SPE_M4A1_T34_Calliope_Direct;
	class SPE_M4A1_T34_Calliope;

	class SPE_FR_M10_DLV;
	class SPE_FR_M4A0_75_Early_DLV;
	class SPE_FR_M4A0_75_mid_DLV;
	class SPE_FR_M4A1_76_DLV;
	class SPE_FR_M4A1_75_DLV;

	class SPE_M18_Hellcat_DLV;
	class SPE_M4A1_T34_Calliope_Direct_DLV;
	class SPE_M4A1_T34_Calliope_DLV;

	class SPE_FW190F8;
	class SPE_P47;

	///1.1 update
	class SPE_Milice_R200_Unarmed;
	class SPE_Milice_R200_Hood;
	class SPE_Milice_R200_MG34;

	class SPE_ST_StuG_III_G_Early;
	class SPE_ST_StuG_III_G_Late;
	class SPE_ST_StuG_III_G_SKB;
	class SPE_ST_StuH_42;
	class SPE_ST_Jagdpanther_G1;

	class SPE_ST_StuG_III_G_Early_DLV;
	class SPE_ST_StuG_III_G_Late_DLV;
	class SPE_ST_StuG_III_G_SKB_DLV;
	class SPE_ST_StuH_42_DLV;
	class SPE_ST_Jagdpanther_G1_DLV;

	class SPE_FR_M20_AUC;
	class SPE_FR_M8_LAC;
	class SPE_FR_M8_LAC_ringMount;

	class SPE_US_G503_MB;
	class SPE_US_G503_MB_Armoured;
	class SPE_US_G503_MB_M1919_Armoured;
	class SPE_US_G503_MB_M1919;
	class SPE_US_G503_MB_M2_Armoured;
	class SPE_US_G503_MB_M2;
	class SPE_US_G503_MB_Ambulance;
	class SPE_US_G503_MB_Open;
	class SPE_US_G503_MB_M2_PATROL;
	class SPE_US_G503_MB_M1919_PATROL;

	class SPE_CCKW_353;
	class SPE_CCKW_353_Ambulance;
	class SPE_CCKW_353_Ammo;
	class SPE_CCKW_353_Fuel;
	class SPE_CCKW_353_M2;
	class SPE_CCKW_353_Open;
	class SPE_CCKW_353_Repair;

	class SPE_FR_M4A0_105;
	class SPE_FR_M4A3_75;
	class SPE_FR_M4A3_76;

	class SPE_M4A0_composite;
	class SPE_M4A1_75_erla;
	class SPE_M4A3_T34_Calliope_Direct;
	class SPE_M4A3_T34_Calliope;

	class SPE_FR_M4A0_105_DLV;
	class SPE_FR_M4A3_75_DLV;
	class SPE_FR_M4A3_76_DLV;

	class SPE_M4A0_composite_DLV;
	class SPE_M4A1_75_erla_DLV;
	class SPE_M4A3_105;
	class SPE_M4A3_T34_Calliope_Direct_DLV;
	class SPE_M4A3_T34_Calliope_DLV;
	//

	class SPE_FFI_SdKfz250_1_noinsignia : SPE_FFI_SdKfz250_1
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\SdKfz_250\250_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\SdKfz_250\250_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\SdKfz_250\250_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\SdKfz_250\250_Interior_Low_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FFI_OpelBlitz_noinsignia : SPE_FFI_OpelBlitz
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_exterior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_under_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_bed_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_cab_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_wheels_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_canvas_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FFI_OpelBlitz_Ambulance_noinsignia : SPE_FFI_OpelBlitz_Ambulance
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_exterior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_under_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_cab_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_wheels_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\Opel_Box_Ext_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\Opel_Box_Int_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_interior_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FFI_OpelBlitz_Ammo_noinsignia : SPE_FFI_OpelBlitz_Ammo
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_exterior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_under_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_bed_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_cab_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_wheels_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_canvas_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FFI_OpelBlitz_Fuel_noinsignia : SPE_FFI_OpelBlitz_Fuel
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_exterior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_under_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_bed_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_cab_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_wheels_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_canvas_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FFI_OpelBlitz_Open_noinsignia : SPE_FFI_OpelBlitz_Open
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_exterior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_under_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_bed_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_cab_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_wheels_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_canvas_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FFI_OpelBlitz_Repair_noinsignia : SPE_FFI_OpelBlitz_Repair
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_exterior_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_under_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_cab_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_wheels_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\Opel_Box_Ext_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\Opel_Box_Int_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_interior_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIII_J_noinsignia : SPE_PzKpfwIII_J
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Details_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Turret_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Wheels_Gelb_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIII_L_noinsignia : SPE_PzKpfwIII_L
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Details_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Turret_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Wheels_Gelb_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIII_M_noinsignia : SPE_PzKpfwIII_M
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Details_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Turret_L_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Wheels_N_Camo4_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIII_N_noinsignia : SPE_PzKpfwIII_N
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Details_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Turret_L_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Wheels_N_Camo4_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIV_G_noinsignia : SPE_PzKpfwIV_G
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIV\pz4_hull_camo6_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIV\pz4_turret_camo6_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIV\pz4_wheels_camo6_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_Nashorn_noinsignia : SPE_Nashorn
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\Nashorn\Nashorn_Lower_Hull_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\Nashorn\Nashorn_Upper_Hull_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\Nashorn\Nashorn_Gun_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\Nashorn\Nashorn_Wheels_co.paa","\a3\data_f\clear_empty.paa"};
	};
	
	class SPE_PzKpfwIII_J_DLV_noinsignia : SPE_PzKpfwIII_J_DLV
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Details_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Turret_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Wheels_Gelb_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIII_L_DLV_noinsignia : SPE_PzKpfwIII_L_DLV
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Details_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Turret_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Wheels_Gelb_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIII_M_DLV_noinsignia : SPE_PzKpfwIII_M_DLV
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Details_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Turret_L_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Wheels_N_Camo4_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIII_N_DLV_noinsignia : SPE_PzKpfwIII_N_DLV
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Hull_Details_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Turret_L_Camo4_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIII\Pz3_Wheels_N_Camo4_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_PzKpfwIV_G_DLV_noinsignia : SPE_PzKpfwIV_G_DLV
    {
		textureList[] = {};
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIV\pz4_hull_camo6_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIV\pz4_turret_camo6_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_t\PzKpfwIV\pz4_wheels_camo6_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_Nashorn_DLV_noinsignia : SPE_Nashorn_DLV
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Tanks_t\Nashorn\Nashorn_Lower_Hull_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\Nashorn\Nashorn_Upper_Hull_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\Nashorn\Nashorn_Gun_co.paa","WW2\SPE_Assets_t\Vehicles\Tanks_t\Nashorn\Nashorn_Wheels_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_OpelBlitz_Flak38_noinsignia : SPE_OpelBlitz_Flak38
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_exterior_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_under_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_bed_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_cab_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_wheels_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Staticweapons_t\Flak_38\flak_38_01_01_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Staticweapons_t\Flak_38\flak_38_02_01_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Staticweapons_t\Flak_38\flak_38_03_01_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Staticweapons_t\Flak_38\flak_38_05_01_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\Opel_Flak_Frame_gelb_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_t\OpelBlitz\opel_interior_gelb_co.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_FR_M16_Halftrack_noinsignia : SPE_FR_M16_Halftrack
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_2_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Winch_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Tracks_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_M16_co.paa","WW2\SPE_Assets_t\Vehicles\StaticWeapons_t\M45\Turret_star_co.paa","WW2\SPE_Assets_t\Vehicles\StaticWeapons_t\M45\Supports_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M3_Halftrack_Ambulance_noinsignia : SPE_FR_M3_Halftrack_Ambulance
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_2_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Winch_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Tracks_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M3_Halftrack_Ammo_noinsignia : SPE_FR_M3_Halftrack_Ammo
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_2_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Winch_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Tracks_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M3_Halftrack_Fuel_noinsignia : SPE_FR_M3_Halftrack_Fuel
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_2_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Winch_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Tracks_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M3_Halftrack_Repair_noinsignia : SPE_FR_M3_Halftrack_Repair
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_2_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Winch_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Tracks_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M3_Halftrack_Unarmed_noinsignia : SPE_FR_M3_Halftrack_Unarmed
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_2_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Winch_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Tracks_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M3_Halftrack_Unarmed_Open_noinsignia : SPE_FR_M3_Halftrack_Unarmed_Open
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_2_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Winch_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Tracks_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M3_Halftrack_noinsignia : SPE_FR_M3_Halftrack
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Exterior_2_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Interior_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Wheels_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Dash_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_Tracks_co.paa","WW2\SPE_Assets_t\Vehicles\WheeledAPC_t\M3A1\M3A1_M2Mount_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	
	class SPE_FR_M10_noinsignia : SPE_FR_M10
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M10\M10_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M10\M10_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M10\M10_Interior_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M10\M10_Interior_2_co.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A0_75_Early_noinsignia : SPE_FR_M4A0_75_Early
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A0\M4A0_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A0_75_mid_noinsignia : SPE_FR_M4A0_75_mid
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A0\M4A0_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A1_76_noinsignia : SPE_FR_M4A1_76
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_L_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_76Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A1_75_noinsignia : SPE_FR_M4A1_75
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};


	class SPE_M18_Hellcat_noinsignia : SPE_M18_Hellcat
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_suspension_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_stowage_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A1_T34_Calliope_Direct_noinsignia : SPE_M4A1_T34_Calliope_Direct
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\Calliope\Calliope_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A1_T34_Calliope_noinsignia : SPE_M4A1_T34_Calliope
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\Calliope\Calliope_co.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_FR_M10_DLV_noinsignia : SPE_FR_M10_DLV
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M10\M10_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M10\M10_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M10\M10_Interior_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M10\M10_Interior_2_co.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A0_75_Early_DLV_noinsignia : SPE_FR_M4A0_75_Early_DLV
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A0\M4A0_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A0_75_mid_DLV_noinsignia : SPE_FR_M4A0_75_mid_DLV
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A0\M4A0_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A1_76_DLV_noinsignia : SPE_FR_M4A1_76_DLV
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_L_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_76Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A1_75_DLV_noinsignia : SPE_FR_M4A1_75_DLV
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};

	class SPE_M18_Hellcat_DLV_noinsignia : SPE_M18_Hellcat_DLV
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_suspension_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\m18\m18_stowage_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A1_T34_Calliope_Direct_DLV_noinsignia : SPE_M4A1_T34_Calliope_Direct_DLV
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\Calliope\Calliope_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A1_T34_Calliope_DLV_noinsignia : SPE_M4A1_T34_Calliope_DLV
    {
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_75Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\Calliope\Calliope_co.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_FW190F8_noinsignia : SPE_FW190F8
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Planes_t\FW190F8\fw190f8_mn_JG27_co.paa","WW2\SPE_Assets_t\Vehicles\Planes_t\FW190F8\Fw190F8_Sd_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_P47_noinsignia : SPE_P47
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Planes_t\P47\P47_Fuselage_co.paa","WW2\SPE_Assets_t\Vehicles\Planes_t\P47\P47_Wings_co.paa","WW2\SPE_Assets_t\Vehicles\Planes_t\P47\P47_Cockpit_1_co.paa","WW2\SPE_Assets_t\Vehicles\Planes_t\P47\P47_Cockpit_2_co.paa","WW2\SPE_Assets_t\Vehicles\Planes_t\P47\P47_Misc_co.paa","\a3\data_f\clear_empty.paa",""};
	};
	///1.1 update
	class SPE_Milice_R200_Unarmed_noinsignia : SPE_Milice_R200_Unarmed
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\R200\R200_1_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\R200\R200_2_Gelb_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_Milice_R200_Hood_noinsignia : SPE_Milice_R200_Hood
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\R200\R200_1_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\R200\R200_2_Gelb_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_Milice_R200_MG34_noinsignia : SPE_Milice_R200_MG34
    {
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\R200\R200_1_Gelb_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\R200\R200_2_Gelb_co.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_ST_StuG_III_G_Early_noinsignia : SPE_ST_StuG_III_G_Early
    {
		hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_1_zim_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_2_zim_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_wheels_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_t\nashorn\nashorn_tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_ST_StuG_III_G_Late_noinsignia : SPE_ST_StuG_III_G_Late
	{
		hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_1_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_2_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_wheels_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_t\nashorn\nashorn_tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_ST_StuG_III_G_SKB_noinsignia : SPE_ST_StuG_III_G_SKB
	{
		hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_1_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_2_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_wheels_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_t\nashorn\nashorn_tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_ST_StuH_42_noinsignia : SPE_ST_StuH_42
	{
		hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_1_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_2_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_wheels_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_t\nashorn\nashorn_tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_ST_Jagdpanther_G1_noinsignia : SPE_ST_Jagdpanther_G1
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Hull_Zim_Camo5_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Hull_2_Camo5_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Wheels_Camo4_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Misc_Camo5_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_ST_StuG_III_G_Early_DLV_noinsignia : SPE_ST_StuG_III_G_Early_DLV
    {
		hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_1_zim_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_2_zim_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_wheels_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_t\nashorn\nashorn_tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_ST_StuG_III_G_Late_DLV_noinsignia : SPE_ST_StuG_III_G_Late_DLV
	{
		hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_1_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_2_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_wheels_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_t\nashorn\nashorn_tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_ST_StuG_III_G_SKB_DLV_noinsignia : SPE_ST_StuG_III_G_SKB_DLV
	{
		hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_1_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_2_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_wheels_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_t\nashorn\nashorn_tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_ST_StuH_42_DLV_noinsignia : SPE_ST_StuH_42_DLV
	{
		hiddenSelectionsTextures[] = {"ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_1_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_hull_2_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_u1_t\stug_3\stug_3_wheels_gelb_camo1_co.paa","ww2\spe_assets_t\vehicles\tanks_t\nashorn\nashorn_tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_ST_Jagdpanther_G1_DLV_noinsignia : SPE_ST_Jagdpanther_G1_DLV
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Hull_Zim_Camo5_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Hull_2_Camo5_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Wheels_Camo4_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Misc_Camo5_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\Jagdpanther\Jagdpanther_Tracks_co.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_FR_M20_AUC_noinsignia  : SPE_FR_M20_AUC
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_hull_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M20_AUC\m20_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M20_AUC\m20_turret_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_wheel_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M8_LAC_noinsignia : SPE_FR_M8_LAC
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_hull_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_turret_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_wheel_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M20_AUC\m20_interior_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_FR_M8_LAC_ringMount_noinsignia : SPE_FR_M8_LAC_ringMount
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_hull_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_turret_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_interior_co.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M8_LAC\m8_wheel_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\ArmoredCar_U1_t\M20_AUC\m20_interior_co.paa","\a3\data_f\clear_empty.paa"};
	};
	
	class SPE_US_G503_MB_noinsignia : SPE_US_G503_MB
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_Armoured_noinsignia : SPE_US_G503_MB_Armoured
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_M1919_Armoured_noinsignia : SPE_US_G503_MB_M1919_Armoured
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_M1919_noinsignia : SPE_US_G503_MB_M1919
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_M2_Armoured_noinsignia : SPE_US_G503_MB_M2_Armoured
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_M2_noinsignia : SPE_US_G503_MB_M2
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_Ambulance_noinsignia : SPE_US_G503_MB_Ambulance
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB_Decals\G503_MB_Ambulance_ca.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_Open_noinsignia : SPE_US_G503_MB_Open
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_M2_PATROL_noinsignia : SPE_US_G503_MB_M2_PATROL
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_US_G503_MB_M1919_PATROL_noinsignia : SPE_US_G503_MB_M1919_PATROL
	{
		hiddenSelectionsTextures[] = {"WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_1_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_2_co.paa","WW2\SPE_Assets_t\Vehicles\Wheeled_U1_t\G503_MB\G503_3_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_CCKW_353_noinsignia : SPE_CCKW_353
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_1_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_2_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_CCKW_353_Ambulance_noinsignia : SPE_CCKW_353_Ambulance
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_1_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_2_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW_Decals\CCKW_1stArmy9MedAmb_ca.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_CCKW_353_Ammo_noinsignia : SPE_CCKW_353_Ammo
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_1_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_2_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_CCKW_353_Fuel_noinsignia : SPE_CCKW_353_Fuel
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_1_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_2_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_Fuel_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_CCKW_353_M2_noinsignia  : SPE_CCKW_353_M2
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_1_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_2_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_CCKW_353_Open_noinsignia : SPE_CCKW_353_Open
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_1_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_2_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_CCKW_353_Repair_noinsignia : SPE_CCKW_353_Repair
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_1_co.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_2_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Trucks_U1_t\CCKW\CCKW_Repair_co.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_FR_M4A0_105_noinsignia : SPE_FR_M4A0_105
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_L_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A3_75_noinsignia  : SPE_FR_M4A3_75
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_L_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A3_76_noinsignia : SPE_FR_M4A3_76
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_L_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_76Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};

	class SPE_M4A0_composite_noinsignia : SPE_M4A0_composite
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_c_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A1_75_erla_noinsignia : SPE_M4A1_75_erla
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_E_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A3_105_noinsignia : SPE_M4A3_105
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_E_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A3_T34_Calliope_Direct_noinsignia : SPE_M4A3_T34_Calliope_Direct
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_e_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\Calliope\Calliope_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A3_T34_Calliope_noinsignia : SPE_M4A3_T34_Calliope
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_e_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\Calliope\Calliope_co.paa","\a3\data_f\clear_empty.paa"};
	};

	class SPE_FR_M4A0_105_DLVnoinsignia : SPE_FR_M4A0_105
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_L_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A3_75__DLVnoinsignia  : SPE_FR_M4A3_75
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_L_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};
	class SPE_FR_M4A3_76__DLVnoinsignia : SPE_FR_M4A3_76
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_L_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_76Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\a3\data_f\clear_empty.paa",""};
	};

	class SPE_M4A0_composite_DLV_noinsignia : SPE_M4A0_composite_DLV
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_c_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A3\M4A3_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A1_75_erla_DLV_noinsignia : SPE_M4A1_75_erla_DLV
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_E_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A3_105_DLV_noinsignia : SPE_M4A3_105
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_E_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A3_T34_Calliope_Direct_DLV_noinsignia : SPE_M4A3_T34_Calliope_Direct_DLV
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_e_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\Calliope\Calliope_co.paa","\a3\data_f\clear_empty.paa"};
	};
	class SPE_M4A3_T34_Calliope_DLV_noinsignia : SPE_M4A3_T34_Calliope_DLV
	{
		hiddenSelectionsTextures[] = {"\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_E_Hull_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_U1_t\M4A0\M4A0_e_Turret_co.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\M4A1\M4A1_Wheels_co.paa","\a3\data_f\clear_empty.paa","\WW2\SPE_Assets_t\Vehicles\Tanks_2_t\Calliope\Calliope_co.paa","\a3\data_f\clear_empty.paa"};
	};

};
	