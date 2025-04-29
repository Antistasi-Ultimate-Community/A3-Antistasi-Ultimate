		///////////////////////////////////////////////////////
		// Aegis
		///////////////////////////////////////////////////////
		class handgunsAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";
			ITEM(hgun_Pistol_heavy_01_black_F, 450, PISTOL_STOCK);
			
			ITEM(hgun_ACPC2_black_F, 200, PISTOL_STOCK);

			ITEM(hgun_G17_black_F, 150, PISTOL_STOCK);
			ITEM(hgun_G17_khaki_F, 150, PISTOL_STOCK);
			ITEM(hgun_G17_F, 150, PISTOL_STOCK);

			ITEM(Aegis_hgun_P320_black_F, 200, PISTOL_STOCK);
			ITEM(Aegis_hgun_P320_khaki_F, 200, PISTOL_STOCK);
			ITEM(Aegis_hgun_P320_sand_F, 200, PISTOL_STOCK);

			ITEM(Aegis_hgun_Pistol_R57_F, 250, PISTOL_STOCK);
			ITEM(Aegis_hgun_Pistol_R57_olive_F, 250, PISTOL_STOCK);
			ITEM(Aegis_hgun_Pistol_R57_sand_F, 250, PISTOL_STOCK);
			ITEM(Aegis_hgun_Pistol_R57_silver_F, 400, PISTOL_STOCK);

			ITEM(hgun_Mk26_F, 800, PISTOL_STOCK);
		};

		class launchersAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(Aegis_launch_RPG7M_F, 650, LAUNCHER_STOCK);

			ITEM(launch_RPG32_black_F, 1250, LAUNCHER_STOCK);
			
			ITEM(launch_MRAWS_black_F, 1400, LAUNCHER_STOCK);
			ITEM(launch_MRAWS_black_rail_F, 1300, LAUNCHER_STOCK);

			ITEM(launch_Titan_blk_F, 3500, 3);
			
			ITEM(launch_O_Titan_camo_F, 3500, 3); 

			ITEM(launch_Titan_short_blk_F, 3250, 3);
			ITEM(launch_O_Titan_short_camo_F, 3250, 3);
		};

		/* class launcherMagazinesAegis
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

		}; */

		class riflesAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(Aegis_arifle_AK103_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_AK103_plum_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_AK103_GL_F, 825, RIFLE_STOCK);
			ITEM(Aegis_arifle_AK103_GL_plum_F, 825, RIFLE_STOCK);

			ITEM(arifle_AK12_545_F, 950, RIFLE_STOCK);
			ITEM(arifle_AK12_545_arid_F, 950, RIFLE_STOCK);
			ITEM(arifle_AK12_545_lush_F, 950, RIFLE_STOCK);
			ITEM(arifle_AK12_545_tan_F, 950, RIFLE_STOCK);
			ITEM(arifle_AK12_GL_545_F, 1075, RIFLE_STOCK);
			ITEM(arifle_AK12_GL_545_arid_F, 750, RIFLE_STOCK);
			ITEM(arifle_AK12_GL_545_lush_F, 750, RIFLE_STOCK);
			ITEM(arifle_AK12_GL_545_tan_F, 750, RIFLE_STOCK);

			ITEM(Aegis_arifle_AK74_F, 650, RIFLE_STOCK);
			ITEM(Aegis_arifle_AK74_gold_F, 2000, RIFLE_STOCK);
			ITEM(Aegis_arifle_AK74_oak_F, 650, RIFLE_STOCK);
			ITEM(Aegis_arifle_AK74_GL_F, 875, RIFLE_STOCK);
			ITEM(Aegis_arifle_AK74_GL_oak_F, 875, RIFLE_STOCK);

			ITEM(Aegis_arifle_AKM74_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKM74_olive_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKM74_plum_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKM74_sand_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKM74_GL_F, 875, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKM74_olive_GL_F, 875, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKM74_GL_plum_F, 875, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKM74_sand_GL_F, 875, RIFLE_STOCK);

			ITEM(Aegis_arifle_AKS74_F, 700, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKS74_gold_F, 2000, RIFLE_STOCK);
			ITEM(Aegis_arifle_AKS74_oak_F, 700, RIFLE_STOCK);

			ITEM(arifle_AKSM_F, 600, RIFLE_STOCK);
			ITEM(arifle_AKSM_alt_F, 600, RIFLE_STOCK);
			ITEM(arifle_AKS_alt_F, 1100, RIFLE_STOCK);

			ITEM(arifle_AK12U_545_F, 800, RIFLE_STOCK);
			ITEM(arifle_AK12U_545_arid_F, 750, RIFLE_STOCK);
			ITEM(arifle_AK12U_545_lush_F, 750, RIFLE_STOCK);
			ITEM(arifle_AK12U_545_tan_F, 750, RIFLE_STOCK);
			
			ITEM(arifle_TRG20_black_F, 750, RIFLE_STOCK);
			ITEM(arifle_TRG21_GL_black_F, 875, RIFLE_STOCK);
			ITEM(arifle_Mk20_black_F, 750, RIFLE_STOCK);
			ITEM(arifle_Mk20_hex_F, 750, RIFLE_STOCK);
			ITEM(arifle_Mk20_GL_black_F, 875, RIFLE_STOCK);
			ITEM(arifle_Mk20_GL_hex_F, 875, RIFLE_STOCK);
			ITEM(arifle_Mk20C_hex_F, 750, RIFLE_STOCK);

			ITEM(Aegis_arifle_SPAR_02_inf_blk_F, 875, RIFLE_STOCK);
			ITEM(Aegis_arifle_SPAR_02_inf_snd_F, 750, RIFLE_STOCK);

			ITEM(arifle_SA80_C_blk_F, 800, RIFLE_STOCK);
			ITEM(arifle_SA80_C_khk_F, 800, RIFLE_STOCK);

			ITEM(arifle_SA80_blk_F, 900, RIFLE_STOCK);
			ITEM(arifle_SA80_khk_F, 900, RIFLE_STOCK);
			ITEM(arifle_SA80_snd_F, 900, RIFLE_STOCK);
			ITEM(arifle_SA80_GL_blk_F, 1025, RIFLE_STOCK);
			ITEM(arifle_SA80_GL_khk_F, 1025, RIFLE_STOCK);
			ITEM(arifle_SA80_GL_snd_F, 1025, RIFLE_STOCK);

			ITEM(Aegis_arifle_M16A4_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_M16A4_FG_F, 775, RIFLE_STOCK);
			ITEM(Aegis_arifle_M16A4_GL_F, 875, RIFLE_STOCK);

			ITEM(Aegis_arifle_M4A1_F, 800, RIFLE_STOCK);
			ITEM(Aegis_arifle_M4A1_khaki_F, 800, RIFLE_STOCK);
			ITEM(Aegis_arifle_M4A1_sand_F, 800, RIFLE_STOCK);

			ITEM(Aegis_arifle_M4A1_grip_F, 825, RIFLE_STOCK);
			ITEM(Aegis_arifle_M4A1_grip_khaki_F, 825, RIFLE_STOCK);
			ITEM(Aegis_arifle_M4A1_grip_sand_F, 825, RIFLE_STOCK);

			ITEM(Aegis_arifle_M4A1_GL_F, 950, RIFLE_STOCK);
			ITEM(Aegis_arifle_M4A1_GL_khaki_F, 950, RIFLE_STOCK);
			ITEM(Aegis_arifle_M4A1_GL_sand_F, 950, RIFLE_STOCK);

			ITEM(Aegis_arifle_M4A1_short_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_M4A1_short_khaki_F, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_M4A1_short_sand_F, 750, RIFLE_STOCK);

			ITEM(arifle_SCAR_L_F, 825, RIFLE_STOCK);
			ITEM(arifle_SCAR_L_black_F, 825, RIFLE_STOCK);
			ITEM(arifle_SCAR_L_khaki_F, 825, RIFLE_STOCK);

			ITEM(arifle_SCAR_L_grip_F, 875, RIFLE_STOCK);
			ITEM(arifle_SCAR_L_grip_black_F, 875, RIFLE_STOCK);
			ITEM(arifle_SCAR_L_grip_khaki_F, 875, RIFLE_STOCK);

			ITEM(arifle_SCAR_L_short_F, 775, RIFLE_STOCK);
			ITEM(arifle_SCAR_L_short_black_F, 775, RIFLE_STOCK);
			ITEM(arifle_SCAR_L_short_khaki_F, 775, RIFLE_STOCK);

			ITEM(arifle_SCAR_L_GL_F, 950, RIFLE_STOCK);
			ITEM(arifle_SCAR_L_GL_black_F, 950, RIFLE_STOCK);
			ITEM(arifle_SCAR_L_GL_khaki_F, 950, RIFLE_STOCK);

			ITEM(arifle_SCAR_F, 875, RIFLE_STOCK);
			ITEM(arifle_SCAR_black_F, 875, RIFLE_STOCK);
			ITEM(arifle_SCAR_khaki_F, 875, RIFLE_STOCK);

			ITEM(arifle_SCAR_grip_F, 900, RIFLE_STOCK);
			ITEM(arifle_SCAR_grip_black_F, 900, RIFLE_STOCK);
			ITEM(arifle_SCAR_grip_khaki_F, 900, RIFLE_STOCK);

			ITEM(arifle_SCAR_short_F, 825, RIFLE_STOCK);
			ITEM(arifle_SCAR_short_black_F, 825, RIFLE_STOCK);
			ITEM(arifle_SCAR_short_khaki_F, 825, RIFLE_STOCK);

			ITEM(arifle_SCAR_GL_F, 875, RIFLE_STOCK);
			ITEM(arifle_SCAR_GL_black_F, 875, RIFLE_STOCK);
			ITEM(arifle_SCAR_GL_khaki_F, 875, RIFLE_STOCK);

			ITEM(Aegis_arifle_CTAR_tan_f, 825, RIFLE_STOCK);
			ITEM(Aegis_arifle_CTAR_GL_tan_f, 950, RIFLE_STOCK);

			ITEM(arifle_TRG21_black_F, 775, RIFLE_STOCK);

			ITEM(Aegis_arifle_Velko_sand, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_Velko_oak, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_VelkoR5_sand, 750, RIFLE_STOCK);
			ITEM(Aegis_arifle_VelkoR5_oak, 750, RIFLE_STOCK);
		};

		class specialWeaponsAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(GL_XM25_F, 2500, RIFLE_STOCK);
			ITEM(GL_M32_F, 2000, RIFLE_STOCK);
			
			ITEM(sgun_M4_F, 900, RIFLE_STOCK);

			ITEM(sgun_Mp153_black_F, 700, RIFLE_STOCK);
			ITEM(sgun_Mp153_classic_F, 600, RIFLE_STOCK);
			
			ITEM(sgun_KSG_F, 750, RIFLE_STOCK);
			ITEM(Aegis_sgun_KSG_black_F, 750, RIFLE_STOCK);

			ITEM(Aegis_sgun_AA40_khk_lxWS, 1250, RIFLE_STOCK);

			ITEM(glaunch_GLX_olive_lxWS, 700, RIFLE_STOCK);
		};

		class mgAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(arifle_RPK_F, 900, RIFLE_STOCK);
			ITEM(Aegis_arifle_RPK74M_F, 950, RIFLE_STOCK);
			ITEM(Aegis_arifle_RPK12_545_F, 975, RIFLE_STOCK);
			ITEM(Aegis_arifle_RPK12_545_arid_F, 975, RIFLE_STOCK);
			ITEM(Aegis_arifle_RPK12_545_lush_F, 975, RIFLE_STOCK);
			ITEM(Aegis_arifle_RPK12_545_tan_F, 975, RIFLE_STOCK);

			ITEM(Aegis_arifle_CTARS_tan_f, 750, RIFLE_STOCK);
			
			ITEM(arifle_MX_SW_F, 800, RIFLE_STOCK);
			ITEM(arifle_MX_SW_Black_F, 800, RIFLE_STOCK);
			ITEM(arifle_MX_SW_khk_F, 800, RIFLE_STOCK);

			ITEM(arifle_SPAR_02_blk_F, 800, RIFLE_STOCK);
			ITEM(arifle_SPAR_02_khk_F, 800, RIFLE_STOCK);
			ITEM(arifle_SPAR_02_snd_F, 800, RIFLE_STOCK);

			ITEM(LMG_03_F, 1250, RIFLE_STOCK);
			ITEM(LMG_03_khk_F, 1250, RIFLE_STOCK);
			ITEM(LMG_03_snd_F, 1250, RIFLE_STOCK);

			ITEM(Aegis_MMG_FNMAG_F, 950, RIFLE_STOCK);
			ITEM(Aegis_MMG_FNMAG_old_F, 850, RIFLE_STOCK);
			ITEM(Aegis_MMG_FNMAG_240_F, 950, RIFLE_STOCK);

			ITEM(LMG_Mk200_khk_F, 950, RIFLE_STOCK);
			ITEM(LMG_Mk200_plain_F, 950, RIFLE_STOCK);

			ITEM(arifle_RPK12_F, 1250, RIFLE_STOCK);
			ITEM(arifle_RPK12_arid_F, 1250, RIFLE_STOCK);
			ITEM(arifle_RPK12_lush_F, 1250, RIFLE_STOCK);

			ITEM(LMG_Zafir_black_F, 1450, RIFLE_STOCK);
			ITEM(LMG_Zafir_ghex_F, 1450, RIFLE_STOCK);

			ITEM(MMG_01_black_F, 2250, 10);
			ITEM(MMG_01_ghex_F, 2250, 10);

			ITEM(MMG_02_khaki_F, 4350, 10);
		};

		class sniperRiflesAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(srifle_DMR_01_black_F, 2200, RIFLE_STOCK);

			ITEM(Aegis_srifle_SVD_f, 2200, RIFLE_STOCK);
			ITEM(Aegis_srifle_SVD_blk_f, 2200, RIFLE_STOCK);
			ITEM(Aegis_srifle_SVD_plum_f, 2200, RIFLE_STOCK);

			ITEM(srifle_DMR_06_black_F, 1075, RIFLE_STOCK);

			ITEM(srifle_EBR_blk_F, 2550, RIFLE_STOCK);
			ITEM(srifle_EBR_khk_F, 2550, RIFLE_STOCK);

			ITEM(Aegis_arifle_SR25_MR_blk_F, 2400, RIFLE_STOCK);
			ITEM(Aegis_arifle_SR25_MR_khk_F, 2400, RIFLE_STOCK);
			ITEM(Aegis_arifle_SR25_MR_snd_F, 2400, RIFLE_STOCK);

			ITEM(Aegis_arifle_SR25_blk_F, 2400, RIFLE_STOCK);
			ITEM(Aegis_arifle_SR25_khk_F, 2400, RIFLE_STOCK);
			ITEM(Aegis_arifle_SR25_snd_F, 2400, RIFLE_STOCK);

			ITEM(srifle_DMR_02_tna_F, 4250, 10);

			ITEM(srifle_DMR_05_ghex_F, 4250, 10);

			ITEM(srifle_DMR_04_F, 2500, 10);

			ITEM(Aegis_srifle_LRR_sand_F, 4000, 5);
			ITEM(Aegis_srifle_LRR_olive_F, 4000, 5);

			ITEM(Aegis_srifle_GM6B_F, 4500, 5);
			ITEM(Aegis_srifle_GM6B_khaki_F, 4500, 5);
			ITEM(Aegis_srifle_GM6B_sand_F, 4500, 5);
		};

		class smgAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(Aegis_SMG_Gepard_blk_F, 500, RIFLE_STOCK);

			ITEM(SMG_04_blk_F, 650, RIFLE_STOCK);
			ITEM(SMG_04_khk_F, 650, RIFLE_STOCK);
			ITEM(SMG_04_snd_F, 650, RIFLE_STOCK);

			ITEM(SMG_01_black_F, 200, RIFLE_STOCK);
			ITEM(SMG_01_khk_F, 200, RIFLE_STOCK);
		};

		class pointersAegis 
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_Aegis", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(acc_flashlight_ir, 100, PN_STOCK);
			ITEM(Aegis_acc_pointer_compact_green, 100, PN_STOCK);
			ITEM(Aegis_acc_pointer_compact_red, 100, PN_STOCK);

			ITEM(Aegis_acc_LightModule_Pistol_black, 150, PN_STOCK);
			ITEM(Aegis_acc_LightModule_Pistol_khaki, 150, PN_STOCK);
			ITEM(Aegis_acc_LightModule_Pistol_sand, 150, PN_STOCK);
			ITEM(Aegis_acc_pointer_compact_pistol_green, 150, PN_STOCK);
			ITEM(Aegis_acc_pointer_compact_pistol_red, 150, PN_STOCK);
			
			ITEM(Aegis_acc_pointer_DM, 250, PN_STOCK);
			ITEM(Aegis_acc_pointer_DM_Arid, 250, PN_STOCK);
			ITEM(Aegis_acc_pointer_DM_Khaki, 250, PN_STOCK);
			ITEM(Aegis_acc_pointer_DM_Lush, 250, PN_STOCK);
			ITEM(Aegis_acc_pointer_DM_Sand, 250, PN_STOCK);
		};

		class muzzlesAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(muzzle_snds_408_black, 600, MZ_STOCK);
			ITEM(muzzle_snds_408_green, 600, MZ_STOCK);
			ITEM(muzzle_snds_408_sand, 600, MZ_STOCK);

			ITEM(muzzle_mzls_M, 300, MZ_STOCK);
			ITEM(muzzle_mzls_B, 300, MZ_STOCK);
			ITEM(muzzle_mzls_H, 300, MZ_STOCK);
			ITEM(muzzle_mzls_L, 300, MZ_STOCK);
			ITEM(muzzle_mzls_58_F, 300, MZ_STOCK);
			ITEM(muzzle_mzls_acp, 300, MZ_STOCK);

			ITEM(muzzle_mzls_smg_01, 400, MZ_STOCK);

			ITEM(muzzle_mzls_545, 400, MZ_STOCK);
			ITEM(aegis_muzzle_snds_pbs_545_blk, 400, MZ_STOCK);
			ITEM(aegis_muzzle_snds_pbs_545_arid, 400, MZ_STOCK);
			ITEM(aegis_muzzle_snds_pbs_545_lush, 400, MZ_STOCK);
			ITEM(muzzle_snds_545, 400, MZ_STOCK);
			ITEM(muzzle_snds_545_arid_F, 400, MZ_STOCK);
			ITEM(muzzle_snds_545_wdm_F, 400, MZ_STOCK);
			ITEM(muzzle_snds_545_lush_F, 400, MZ_STOCK);

			ITEM(muzzle_snds_460, 400, MZ_STOCK);
			ITEM(Aegis_muzzle_snds_460_khaki, 400, MZ_STOCK);
			ITEM(Aegis_muzzle_snds_460_sand, 400, MZ_STOCK);

			ITEM(aegis_muzzle_snds_pbs_762_blk, 450, MZ_STOCK);
			ITEM(aegis_muzzle_snds_pbs_762_arid, 450, MZ_STOCK);
			ITEM(aegis_muzzle_snds_pbs_762_lush, 450, MZ_STOCK);
			ITEM(muzzle_snds_B_wdm_F, 450, MZ_STOCK);
			
			ITEM(aegis_muzzle_snds_sr25_blk, 450, MZ_STOCK);
			ITEM(aegis_muzzle_snds_sr25_khk, 450, MZ_STOCK);
			ITEM(aegis_muzzle_snds_sr25_snd, 450, MZ_STOCK);
		};

		class opticsAegis 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_sights"]);
			picture = "A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class optic_tws_sniper {
				price = 2000;
				stock = 5;
			};
			
			class Aegis_optic_ACOG {
				price = 425;
				stock = 100;
			};
			class Aegis_optic_ACOG_khaki {
				price = 425;
				stock = 100;
			};
			class Aegis_optic_ACOG_sand {
				price = 425;
				stock = 100;
			};
			class optic_dcl {
				price = 1000;
				stock = 100;
			};
			class Aegis_optic_ICO {
				price = 175;
				stock = 100;
			};
			class Aegis_optic_ICO_khaki {
				price = 175;
				stock = 100;
			};
			class Aegis_optic_ICO_sand {
				price = 175;
				stock = 100;
			};
			class Aegis_optic_ROS {
				price = 200;
				stock = 100;
			};
			class Aegis_optic_ROS_SMG {
				price = 200;
				stock = 100;
			};
			class optic_ACO_grn_AK_F {
				price = 200;
				stock = 100;
			};
			class Aegis_optic_1p87_snd {
				price = 250;
				stock = 100;
			};
			class Aegis_optic_1p87_lush {
				price = 250;
				stock = 100;
			};
			class Aegis_optic_1p87_arid {
				price = 250;
				stock = 100;
			};
			class Aegis_optic_1p87 {
				price = 250;
				stock = 100;
			};
			class Aegis_optic_PRO_black {
				price = 100;
				stock = 100;
			};
		};

		class magazinesAegis 
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_Aegis", localize "STR_A3AU_magazines", localize "STR_A3AU_and", localize "STR_A3AU_glGrenades"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			///////////////////////////////////////////////////////
			// Special
			///////////////////////////////////////////////////////

			class 8Rnd_12Gauge_Pellets {
				price = 25;
				stock = MAGAZINE_STOCK;
			};
			class 8Rnd_12Gauge_Slug {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_8Rnd_12Gauge_HE {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_8Rnd_12Gauge_Smoke {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_4Rnd_12Gauge_HE {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 4Rnd_12Gauge_Pellets {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class 4Rnd_12Gauge_Slug {
				price = 15;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_4Rnd_12Gauge_Smoke {
				price = 10;
				stock = MAGAZINE_STOCK;
			};

			class 6Rnd_Pellets_Grenade_shell {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_HE_Grenade_shell {
				price = 1000;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_HEDP_Grenade_shell {
				price = 1200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_APERSMine_Grenade_shell {
				price = 1200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_UGL_FlareGreen_F {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_UGL_FlareCIR_F {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_UGL_FlareRed_F {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_UGL_FlareWhite_F {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_UGL_FlareYellow_F {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_SmokeBlue_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_SmokeGreen_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_SmokeOrange_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_SmokePurple_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_SmokeRed_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_Smoke_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_SmokeYellow_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			class 5Rnd_25x40mm_airburst {
				price = 1000;
				stock = MAGAZINE_STOCK;
			};
			class 5Rnd_25x40mm_HE {
				price = 1000;
				stock = MAGAZINE_STOCK;
			};

			class Aegis_20Rnd_12Gauge_AA40_HE_khk_lxWS {
				price = 1000;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_12Gauge_AA40_Pellets_khk_lxWS {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_12Gauge_AA40_Slug_khk_lxWS {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_12Gauge_AA40_Smoke_khk_lxWS {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_8Rnd_12Gauge_AA40_HE_khk_lxWS {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_8Rnd_12Gauge_AA40_Pellets_khk_lxWS {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_8Rnd_12Gauge_AA40_Slug_khk_lxWS {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_8Rnd_12Gauge_AA40_Smoke_khk_lxWS {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			///////////////////////////////////////////////////////
			// Underbarrel
			///////////////////////////////////////////////////////
			class 3Rnd_Pellets_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_HEDP_Grenade_shell {
				price = 500;
				stock = MAGAZINE_STOCK;
			};
			class 1Rnd_HEDP_Grenade_shell {
				price = 100;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// Pistols
			///////////////////////////////////////////////////////

			class 16Rnd_9x21_green_Mag_v2 {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 16Rnd_9x21_red_Mag_v2 {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 16Rnd_9x21_yellow_Mag_v2 {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 16Rnd_9x21_Mag_v2 {
				price = 30;
				stock = MAGAZINE_STOCK;
			};

			class 17Rnd_9x21_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 7Rnd_127x33_Mag {
				price = 10;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_10Rnd_570x28_RP57_Mag {
				price = 15;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20rnd_570x28_RP57_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////
			
			class 30Rnd_545x39_AK12_Arid_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_AK12_Arid_Mag_Tracer_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_AK12_Lush_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_AK12_Lush_Mag_Tracer_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_AK12_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_AK12_Mag_Tracer_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Black_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Black_Mag_Yellow_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Black_Mag_Tracer_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Black_Mag_Tracer_Yellow_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Steel_Gold_Mag_F {
				price = 500;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Steel_Gold_Tracer_Mag_F {
				price = 550;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Olive_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Tracer_Olive_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Sand_Green_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Sand_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Tracer_Sand_Green_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Tracer_Sand_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Steel_Mag_Green_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30rnd_545x39_Steel_Mag_Red_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Steel_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Steel_Tracer_Mag_Green_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30rnd_545x39_Steel_Tracer_Mag_Red_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Steel_Tracer_Mag_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_45Rnd_545x39_Bakelite_Mag_Green_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_45Rnd_545x39_Bakelite_Mag_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_45Rnd_545x39_Bakelite_Mag_Tracer_Green_F {
				price = 70;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_45Rnd_545x39_Bakelite_Mag_Tracer_F {
				price = 70;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_45Rnd_545x39_Mag_Green_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_45Rnd_545x39_Mag_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_45Rnd_545x39_Mag_Tracer_Green_F {
				price = 70;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_45Rnd_545x39_Mag_Tracer_F {
				price = 70;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_60Rnd_545x39_Mag_Green_F {
				price = 80;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_60Rnd_545x39_Mag_F {
				price = 80;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_60Rnd_545x39_Mag_Tracer_Green_F {
				price = 90;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_60Rnd_545x39_Mag_Tracer_F {
				price = 90;
				stock = MAGAZINE_STOCK;
			};

			class 20Rnd_556x45_Stanag_green {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 20Rnd_556x45_Stanag_red {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 20Rnd_556x45_Stanag {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 20Rnd_556x45_Stanag_Tracer_Green {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 20Rnd_556x45_Stanag_Tracer_Red {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 20Rnd_556x45_Stanag_Tracer_Yellow {
				price = 60;
				stock = MAGAZINE_STOCK;
			};


			class 30Rnd_762x39_polymer_Plum_Mag_Green_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_762x39_polymer_Plum_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_762x39_polymer_Plum_Mag_Tracer_Green_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_762x39_polymer_Plum_Mag_Tracer_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_762x39_polymer_Black_Mag_Green_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_762x39_polymer_Black_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_762x39_polymer_Black_Mag_Tracer_Green_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_762x39_polymer_Black_Mag_Tracer_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////
			class Aegis_10Rnd_762x54_SVD_Green_Mag_F {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_10Rnd_762x54_SVD_Red_Mag_F {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_10Rnd_762x54_SVD_Yellow_Mag_F {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class Aegis_20Rnd_762x51_SMAG {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Green_SMAG {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Green_Sand_SMAG {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Red_SMAG {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Red_Sand_SMAG {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Yellow_SMAG {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Yellow_Sand_SMAG {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Sand_SMAG {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Tracer_Green_SMAG {
				price = 160;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Tracer_Green_Sand_SMAG {
				price = 160;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Tracer_Red_SMAG {
				price = 160;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Tracer_Red_Sand_SMAG {
				price = 160;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Tracer_Yellow_SMAG {
				price = 160;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_762x51_Tracer_Yellow_Sand_SMAG {
				price = 160;
				stock = MAGAZINE_STOCK;
			};
			class 20Rnd_Mk14_762x51_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class Aegis_5Rnd_127x99_AP_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_5Rnd_127x99_Mag {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			///////////////////////////////////////////////////////
			// MGs
			///////////////////////////////////////////////////////
			class Aegis_200Rnd_762x51_MAG_Green_F {
				price = 450;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_200Rnd_762x51_MAG_Red_F {
				price = 450;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_200Rnd_762x51_MAG_Yellow_F {
				price = 450;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_200Rnd_762x51_MAG_Green_Tracer_F {
				price = 550;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_200Rnd_762x51_MAG_Red_Tracer_F {
				price = 550;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_200Rnd_762x51_MAG_Yellow_Tracer_F {
				price = 550;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// SMGs
			///////////////////////////////////////////////////////
			class 30Rnd_9x21_Mag_v2 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Green_Mag_v2 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Red_Mag_v2 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Yellow_Mag_v2 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};

			class 20Rnd_460x30_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 40Rnd_460x30_Mag_F {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_20Rnd_9x21_Gepard_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_40Rnd_9x21_Gepard_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_40Rnd_9x21_Gepard_Green_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class Aegis_40Rnd_9x21_Gepard_Yellow_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
		};

		class navigationAegis
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_Aegis", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(ItemSmartPhone, 200, NN_STOCK);
			
			ITEM(Laserdesignator_04, 1200, NN_STOCK);

			ITEM(O_NVGoggles_blk_F, 1000, NN_STOCK);

			ITEM(Aegis_NVG_IVAS_01_blk_F, 4000, NN_STOCK);
			ITEM(Aegis_NVG_IVAS_01_grn_F, 4000, NN_STOCK);
			ITEM(Aegis_NVG_IVAS_01_tan_F, 4000, NN_STOCK);

			ITEM(Aegis_NV_G_Armband_Blu_Alt_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_IND_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_Medic_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_OPF_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_Blu_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_IND_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_Medic_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_OPF_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_CSAT_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_CSAT_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_FIA_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_FIA_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_IDAP_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_Armband_IDAP_alt_F, 50, MISC_STOCK);

			ITEM(Goggles, 50, MISC_STOCK);
			ITEM(Aegis_Goggles_Cover_grn_F, 50, MISC_STOCK);
			ITEM(Aegis_Goggles_Cover_F, 50, MISC_STOCK);
			ITEM(Goggles_grn_F, 50, MISC_STOCK);
			ITEM(Goggles_tna_F, 50, MISC_STOCK);

			ITEM(Aegis_NV_G_scrimNet_black_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_scrimNet_olive_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_scrimNet_sand_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_scrimNet_under_black_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_scrimNet_under_olive_F, 50, MISC_STOCK);
			ITEM(Aegis_NV_G_scrimNet_under_sand_F, 50, MISC_STOCK);
		};

		class miscAegis
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(Aegis_G_Armband_BLU_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_IND_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_Medic_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_OPF_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_BLU_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_IND_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_Medic_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_OPF_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_CSAT_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_CSAT_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_FIA_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_IDAP_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_IDAP_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_UNO_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_UNO_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_UNL_alt_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Armband_UNL_F, 50, MISC_STOCK);

			ITEM(G_Balaclava_Flecktarn, 50, MISC_STOCK);
			ITEM(G_Balaclava_Skull1, 50, MISC_STOCK);
			ITEM(G_Balaclava_Tropentarn, 50, MISC_STOCK);
			ITEM(G_Bandanna_BlueFlame1, 50, MISC_STOCK);
			ITEM(G_Bandanna_BlueFlame2, 50, MISC_STOCK);
			ITEM(G_Bandanna_CandySkull, 50, MISC_STOCK);
			ITEM(G_Bandanna_Germany, 50, MISC_STOCK);
			ITEM(G_Bandanna_RedFlame2, 50, MISC_STOCK);
			ITEM(G_Bandanna_RedFlame1, 50, MISC_STOCK);
			ITEM(G_Bandanna_shemag, 50, MISC_STOCK);
			ITEM(G_Bandanna_Skull1, 50, MISC_STOCK);
			ITEM(G_Bandanna_Syndikat1, 50, MISC_STOCK);
			ITEM(G_Bandanna_Skull2, 50, MISC_STOCK);
			ITEM(G_Bandanna_kawaii, 50, MISC_STOCK);
			ITEM(G_Bandanna_Syndikat2, 50, MISC_STOCK);

			ITEM(G_Cigarette, 50, MISC_STOCK);

			ITEM(G_Combat_Goggles_blk_F, 50, MISC_STOCK);

			ITEM(G_O_R_Diving, 100, MISC_STOCK);

			ITEM(Aegis_G_Headset_black_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Headset_Olive_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Headset_orange_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Headset_red_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Headset_Sand_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Headset_white_F, 50, MISC_STOCK);
			ITEM(Aegis_G_Headset_Yellow_F, 50, MISC_STOCK);

			ITEM(G_Balaclava_light_blk_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_G_blk_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_eaf_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_G_eaf_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_mtp_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_G_mtp_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_tropic_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_G_tropic_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_wdl_F, 50, MISC_STOCK);
			ITEM(G_Balaclava_light_G_wdl_F, 50, MISC_STOCK);
			ITEM(G_Headset_light, 50, MISC_STOCK);

			ITEM(Aegis_G_scrimNet_black_F, 50, MISC_STOCK);
			ITEM(Aegis_G_scrimNet_olive_F, 50, MISC_STOCK);
			ITEM(Aegis_G_scrimNet_sand_F, 50, MISC_STOCK);
			ITEM(Aegis_G_scrimNet_under_black_F, 50, MISC_STOCK);
			ITEM(Aegis_G_scrimNet_under_olive_F, 50, MISC_STOCK);
			ITEM(Aegis_G_scrimNet_under_sand_F, 50, MISC_STOCK);

			ITEM(G_Shades_Yellowred, 50, MISC_STOCK);
			ITEM(G_Shemag_khk, 50, MISC_STOCK);
			ITEM(G_Shemag_oli, 50, MISC_STOCK);
			ITEM(G_Shemag_red, 50, MISC_STOCK);
			ITEM(G_Shemag_shades, 50, MISC_STOCK);
			ITEM(G_Shemag_tactical, 50, MISC_STOCK);
			ITEM(G_Shemag_tan, 50, MISC_STOCK);
			ITEM(G_Shemag_white, 50, MISC_STOCK);

			ITEM(G_Balaclava_TI_alt_F, 500, MISC_STOCK);
			ITEM(G_Balaclava_TI_G_alt_F, 500, MISC_STOCK);

			ITEM(Aegis_G_Condor_EyePro_F, 50, MISC_STOCK);
			ITEM(G_Tactical_Yellow, 50, MISC_STOCK);
			ITEM(G_Headset_Tactical, 50, MISC_STOCK);
			ITEM(G_Headset_Tactical_grn, 50, MISC_STOCK);
			ITEM(G_Headset_Tactical_khk, 50, MISC_STOCK);
			ITEM(G_Tactical_Camo, 50, MISC_STOCK);

		};

		class backpacksAegis
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_backpacks"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(B_AssaultPack_Spess_F, 600, MISC_STOCK);
			ITEM(B_AssaultPack_Charms_F, 600, MISC_STOCK);
			ITEM(B_AssaultPack_GenKong_F, 600, MISC_STOCK);
			ITEM(B_AssaultPackSpec_blk, 600, MISC_STOCK);
			ITEM(B_AssaultPackSpec_cbr, 600, MISC_STOCK);
			ITEM(B_AssaultPack_oicamo, 600, MISC_STOCK);
			ITEM(B_AssaultPack_ghex_F, 600, MISC_STOCK);
			ITEM(B_AssaultPackSpec_rgr, 600, MISC_STOCK);
			ITEM(Aegis_B_AssaultPackSpec_des_lxWS, 600, MISC_STOCK);
			ITEM(B_AssaultPackSpec_mcamo, 600, MISC_STOCK);
			ITEM(B_AssaultPack_taiga_F, 600, MISC_STOCK);
			ITEM(B_AssaultPack_tan, 600, MISC_STOCK);
			ITEM(B_AssaultPack_Enh_tna_F, 600, MISC_STOCK);
			ITEM(B_AssaultPackSpec_wdl_F, 600, MISC_STOCK);

			ITEM(B_Bergen_eaf_F, 1000, MISC_STOCK);
			ITEM(B_Bergen_ghex_F, 1000, MISC_STOCK);
			ITEM(B_Bergen_taiga_F, 1000, MISC_STOCK);
			ITEM(B_Bergen_wdl_F, 1000, MISC_STOCK);

			ITEM(B_Carryall_oicamo, 700, MISC_STOCK);
			ITEM(B_Carryall_tna_F, 700, MISC_STOCK);

			ITEM(B_FieldPack_oicamo, 700, MISC_STOCK);

			ITEM(B_Kitbag_blk, 700, MISC_STOCK);
			ITEM(B_Kitbag_dgtl, 700, MISC_STOCK);
			ITEM(B_Kitbag_eaf_F, 700, MISC_STOCK);
			ITEM(B_Kitbag_khk, 700, MISC_STOCK);
			ITEM(B_Kitbag_tna_F, 700, MISC_STOCK);
			ITEM(B_Kitbag_wdl_F, 700, MISC_STOCK);

			ITEM(Aegis_B_patrolBackpack_RUarid_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_blk_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_cbr_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_dhex_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_eaf_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_ghex_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_grn_F, 800, MISC_STOCK);
			
			ITEM(Aegis_B_patrolBackpack_hex_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_khk_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_mcu_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_mcamo_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_tna_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_wdl_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_oli_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_RUtaiga_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_uhex_F, 800, MISC_STOCK);
			ITEM(Aegis_B_patrolBackpack_aaf_F, 800, MISC_STOCK);
			
			ITEM(B_RadioBag_01_coyote_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_green_F, 600, MISC_STOCK);
			ITEM(Aegis_B_RadioBag_01_des_lxWS, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_sage_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_oicamo_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_arid_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_taiga_F, 600, MISC_STOCK);

			ITEM(B_TacticalPack_oicamo, 600, MISC_STOCK);
			ITEM(B_TacticalPack_eaf_F, 600, MISC_STOCK);
			ITEM(B_TacticalPack_khk, 600, MISC_STOCK);
			ITEM(B_TacticalPack_sgg, 600, MISC_STOCK);
			ITEM(B_TacticalPack_tna_F, 600, MISC_STOCK);

			ITEM(B_ViperHarness_oicamo_F, 600, MISC_STOCK);
			ITEM(B_ViperLightHarness_oicamo_F, 600, MISC_STOCK);
		};

		class vestsAegis
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_vests"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(V_HarnessOSpec_blk, 500, MISC_STOCK);
			ITEM(V_HarnessOSpec_oicamo, 500, MISC_STOCK);
			ITEM(V_HarnessOSpec_ghex_F, 500, MISC_STOCK);

			ITEM(V_ChestrigF_blk, 200, MISC_STOCK);
			ITEM(V_ChestrigF_rgr, 200, MISC_STOCK);
			ITEM(V_ChestrigF_khk, 200, MISC_STOCK);
			ITEM(V_ChestrigF_oli, 200, MISC_STOCK);

			ITEM(Aegis_V_CarrierRigKBT_01_holster_black_F, 100, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_holster_cbr_F, 100, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_holster_khk_F, 100, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_holster_olive_F, 100, MISC_STOCK);

			ITEM(V_BandollierB_taiga_F, 200, MISC_STOCK);
			ITEM(V_BandollierB_tna_F, 200, MISC_STOCK);

			ITEM(V_TacVest_grn, 400, MISC_STOCK);
			ITEM(V_TacVest_gry, 400, MISC_STOCK);

			ITEM(Aegis_V_SmershVest_01_blk_F, 300, MISC_STOCK);
			ITEM(Aegis_V_SmershVest_01_radio_blk_F, 300, MISC_STOCK);
			ITEM(V_HarnessOGL_blk, 300, MISC_STOCK);
			ITEM(V_HarnessOGL_oicamo, 300, MISC_STOCK);
			ITEM(V_HarnessO_blk, 300, MISC_STOCK);
			ITEM(V_HarnessO_oicamo, 300, MISC_STOCK);

			ITEM(Aegis_V_ChestrigEast_RUarid_F, 300, MISC_STOCK);
			ITEM(Aegis_V_ChestrigEast_dst_F, 300, MISC_STOCK);
			ITEM(Aegis_V_ChestrigEast_ghex_F, 300, MISC_STOCK);
			ITEM(Aegis_V_ChestrigEast_grn_F, 300, MISC_STOCK);
			ITEM(Aegis_V_ChestrigEast_hex_F, 300, MISC_STOCK);
			ITEM(Aegis_V_ChestrigEast_khk_F, 300, MISC_STOCK);
			ITEM(Aegis_V_ChestrigEast_oli_F, 300, MISC_STOCK); 
			ITEM(Aegis_V_ChestrigEast_RUtaiga_F, 300, MISC_STOCK);
			ITEM(Aegis_V_ChestrigEast_tan_F, 300, MISC_STOCK);


			ITEM(V_CF_CarrierRig_Lite_F, 800, MISC_STOCK);
			ITEM(V_CF_CarrierRig_MG_F, 800, MISC_STOCK);
			ITEM(V_CF_CarrierRig_F, 800, MISC_STOCK);

			ITEM(V_PlateCarrierIA1_khk, 800, MISC_STOCK);
			ITEM(V_PlateCarrierIA1_oli, 800, MISC_STOCK);

			ITEM(V_PlateCarrierIA2_khk, 900, MISC_STOCK);
			ITEM(V_PlateCarrierIA2_oli, 900, MISC_STOCK);

			ITEM(Aegis_V_PlateCarrier2_alt_blk, 900, MISC_STOCK);
			ITEM(Aegis_V_PlateCarrier2_alt_cbr, 900, MISC_STOCK);
			ITEM(Aegis_V_PlateCarrier2_alt_rgr, 900, MISC_STOCK);
			ITEM(Aegis_V_PlateCarrier2_alt_khk, 900, MISC_STOCK);
			ITEM(Aegis_V_PlateCarrier2_alt_desert, 900, MISC_STOCK);
			ITEM(Aegis_V_PlateCarrier2_alt_mtp, 900, MISC_STOCK);
			ITEM(Aegis_V_PlateCarrier2_alt_tna, 900, MISC_STOCK);
			ITEM(Aegis_V_PlateCarrier2_alt_wdl, 900, MISC_STOCK);
			ITEM(Aegis_V_PlateCarrier2_alt_oli, 900, MISC_STOCK);
			ITEM(V_PlateCarrierL_CTRG_grn_F, 900, MISC_STOCK);
			ITEM(V_PlateCarrierH_CTRG_grn_F, 900, MISC_STOCK);

			ITEM(V_PlateCarrier1_cbr, 900, MISC_STOCK);
			ITEM(V_PlateCarrier1_khk, 900, MISC_STOCK);
			ITEM(V_PlateCarrier1_mtp, 900, MISC_STOCK);
			ITEM(V_PlateCarrier1_oli, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_cbr, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_khk, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_mtp, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_oli, 900, MISC_STOCK);

			ITEM(Aegis_V_OCarrierLuchnik_CQB_arid_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_CQB_blk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_CQB_grn_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_CQB_khk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_CQB_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_GL_arid_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_GL_blk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_GL_grn_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_GL_khk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_GL_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_Lite_arid_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_Lite_blk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_Lite_grn_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_Lite_khk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_Lite_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_arid_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_blk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_grn_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_khk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_OCarrierLuchnik_F, 1000, MISC_STOCK);

			ITEM(Aegis_V_CarrierRigKBT_01_cqb_black_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_cqb_cbr_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_cqb_EAF_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_cqb_khk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_cqb_mtp_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_cqb_olive_F, 1000, MISC_STOCK);

			ITEM(V_CarrierRigKBT_01_heavy_Black_F, 1300, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_heavy_Coyote_F, 1300, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_heavy_Khaki_F, 1300, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_heavy_MTP_F, 1300, MISC_STOCK);

			ITEM(V_CarrierRigKBT_01_light_Black_F, 1000, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_light_Coyote_F, 1000, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_light_Khaki_F, 1000, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_light_MTP_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_recon_black_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_recon_cbr_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_recon_EAF_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_recon_khk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_recon_mtp_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_recon_olive_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_recon_CTRG_ard_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_recon_CTRG_trp_F, 1000, MISC_STOCK);

			ITEM(Aegis_V_CarrierRigKBT_01_tac_black_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_tac_cbr_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_tac_khk_F, 1000, MISC_STOCK);
			ITEM(Aegis_V_CarrierRigKBT_01_tac_olive_F, 1000, MISC_STOCK);

			ITEM(V_CarrierRigKBT_01_Black_F, 900, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_Coyote_F, 900, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_Khaki_F, 900, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_MTP_F, 900, MISC_STOCK);

			ITEM(V_PlateCarrierSpec_cbr, 1300, MISC_STOCK);

			ITEM(V_PlateCarrierIAGL_khk, 1400, MISC_STOCK);

			ITEM(V_RebreatherRU, 900, MISC_STOCK);
		};

		class uniformsAegis
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_uniforms"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			///new aegis
			ITEM(U_C_PriestBody, 150, MISC_STOCK);
			ITEM(U_C_Commoner1_2, 150, MISC_STOCK);
			ITEM(U_C_Commoner1_1, 150, MISC_STOCK);
			ITEM(U_C_Commoner1_3, 150, MISC_STOCK);
			ITEM(U_C_Poor_2, 150, MISC_STOCK);

			ITEM(U_C_Man_casual_8_F, 150, MISC_STOCK);
			ITEM(U_C_Man_casual_7_F, 150, MISC_STOCK);
			ITEM(U_C_Man_casual_9_F, 150, MISC_STOCK);
			ITEM(U_C_Uniform_Formal_01_blue_F, 150, MISC_STOCK);
			ITEM(U_C_Uniform_Formal_01_striped_F, 150, MISC_STOCK);
			ITEM(U_C_Uniform_Formal_01_white_F, 150, MISC_STOCK);
			ITEM(U_Jayholder, 150, MISC_STOCK);
			
			ITEM(U_I_G_Story_Protagonist_F, 200, MISC_STOCK);

			ITEM(U_C_CBRN_Suit_01_Black_F, 200, MISC_STOCK);
			ITEM(U_C_CBRN_Suit_01_Yellow_F, 200, MISC_STOCK);
			ITEM(Aegis_U_I_Uniform_01_sweater_f, 200, MISC_STOCK);
			ITEM(U_I_Uniform_01_tanktop_F, 200, MISC_STOCK);

			ITEM(U_I_E_Uniform_01_arid_F, 200, MISC_STOCK);
			ITEM(U_I_E_Uniform_01_arid_officer_F, 200, MISC_STOCK);
			ITEM(U_I_E_Uniform_01_arid_shortsleeve_F, 200, MISC_STOCK);
			ITEM(U_I_E_Uniform_01_arid_tanktop_F, 200, MISC_STOCK);
			ITEM(Aegis_U_lxWS_ION_Casual_Hawaiian_F, 200, MISC_STOCK);
			ITEM(Aegis_U_lxWS_ION_Casualtna_F, 200, MISC_STOCK);
			ITEM(Aegis_U_lxWS_ION_Casual_Hawaiian_2_F, 200, MISC_STOCK);
			ITEM(Aegis_U_lxWS_ION_Flanneltna_F, 200, MISC_STOCK);

			ITEM(U_BG_Guerilla1_3, 200, MISC_STOCK);
			ITEM(U_B_ION_Uniform_01_poloshirt_blue_F, 200, MISC_STOCK);
			ITEM(U_B_ION_Uniform_01_poloshirt_wdl_F, 200, MISC_STOCK);
			ITEM(U_B_ION_Uniform_01_tshirt_black_F, 200, MISC_STOCK);

			ITEM(U_B_CombatUniform_sgg, 250, MISC_STOCK);
			ITEM(U_B_CombatUniform_sgg_vest, 250, MISC_STOCK);
			ITEM(U_B_CombatUniform_sgg_tshirt, 250, MISC_STOCK);

			ITEM(U_B_A_CBRN_Suit_01_MTP_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_dst_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_02_dst_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_ghex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_02_ghex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_02_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_khk_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_02_khk_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_oli_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_02_oli_F, 250, MISC_STOCK);

			ITEM(Aegis_U_O_CombatFatigues_ruarid_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_02_ruarid_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_rutaiga_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatFatigues_02_rutaiga_F, 250, MISC_STOCK);
			ITEM(U_B_UBACS_blk_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_vest_blk_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_tshirt_blk_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_mtp_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_vest_mtp_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_tshirt_mtp_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_tna_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_vest_tna_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_tshirt_tna_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_wdl_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_vest_wdl_f, 250, MISC_STOCK);
			ITEM(U_B_UBACS_tshirt_wdl_f, 250, MISC_STOCK);
			ITEM(Aegis_U_O_LightCombatFatigues_dst_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_LightCombatFatigues_ghex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_LightCombatFatigues_urb_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_LightCombatFatigues_ruarid_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_LightCombatFatigues_rutaiga_F, 250, MISC_STOCK);
			ITEM(U_O_R_officer_noInsignia_arid_F, 250, MISC_STOCK);
			ITEM(U_O_R_CombatUniform_tshirt_arid_F, 250, MISC_STOCK);
			ITEM(U_O_officer_noInsignia_oicamo_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatUniform_tshirt_dst_F, 250, MISC_STOCK);
			ITEM(U_O_T_officer_noInsignia_ghex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatUniform_tshirt_ghex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatUniform_tshirt_hex_F, 250, MISC_STOCK);
			ITEM(U_O_R_officer_noInsignia_taiga_F, 250, MISC_STOCK);
			ITEM(U_O_R_CombatUniform_tshirt_taiga_F, 250, MISC_STOCK);
			ITEM(U_O_officer_noInsignia_urb_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_CombatUniform_tshirt_urb_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_dst_F, 250, MISC_STOCK);

			ITEM(Aegis_U_O_Luchnik_RolledUp_dst_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_ghex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_RolledUp_ghex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_hex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_RolledUp_hex_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_arid_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_officer_arid_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_RolledUp_arid_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_taiga_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_officer_taiga_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_RolledUp_taiga_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_urban_F, 250, MISC_STOCK);
			ITEM(Aegis_U_O_Luchnik_RolledUp_urban_F, 250, MISC_STOCK);
			ITEM(U_O_OfficerUniform_oicamo, 250, MISC_STOCK);
			ITEM(U_O_R_OfficerUniform_arid_F, 250, MISC_STOCK);
			ITEM(U_O_R_OfficerUniform_taiga_F, 250, MISC_STOCK);

			ITEM(Aegis_U_B_SurvivalFatigues_des_F, 350, MISC_STOCK);
			ITEM(Aegis_U_B_SurvivalFatigues_tna_F, 350, MISC_STOCK);
			ITEM(Aegis_U_B_SurvivalFatigues_wdl_F, 350, MISC_STOCK);
			ITEM(Aegis_U_B_SurvivalFatigues_CTRG_F, 350, MISC_STOCK);
			ITEM(U_O_R_Wetsuit, 350, MISC_STOCK);

			ITEM(U_O_SpecopsUniform_blk, 500, MISC_STOCK);

			ITEM(U_B_CTRG_Soldier_Black_F, 500, MISC_STOCK);
			ITEM(U_B_CTRG_Soldier_3_Black_F, 500, MISC_STOCK);
			ITEM(U_B_CTRG_Soldier_2_Black_F, 500, MISC_STOCK);
			ITEM(U_O_CombatUniform_oicamo, 500, MISC_STOCK);
			ITEM(U_O_R_CombatUniform_arid_F, 500, MISC_STOCK);
			ITEM(U_O_R_CombatUniform_taiga_F, 500, MISC_STOCK);
			ITEM(Aegis_U_O_R_CombatUniform_urban_F, 500, MISC_STOCK);

			ITEM(U_O_T_Pilot_F, 500, MISC_STOCK);
			ITEM(U_I_E_Uniform_01_pilot_F, 500, MISC_STOCK);
			ITEM(U_O_R_PilotCoveralls, 500, MISC_STOCK);

			ITEM(U_I_E_FullGhillie_wdl_F, 1000, MISC_STOCK);
			ITEM(U_B_W_FullGhillie_wdl_F, 1000, MISC_STOCK);
			ITEM(U_O_R_FullGhillie_ard_F, 1000, MISC_STOCK);
			ITEM(U_O_R_FullGhillie_lsh_F, 1000, MISC_STOCK);
			ITEM(U_O_R_FullGhillie_sard_F, 1000, MISC_STOCK);
			ITEM(U_O_R_FullGhillie_wdl_F, 1000, MISC_STOCK);

			ITEM(U_O_C_D_Sniper_oicamo_F, 750, MISC_STOCK);
			ITEM(Aegis_U_B_Sniper_Fatigues_CTRG_F, 750, MISC_STOCK);
			ITEM(U_O_R_GhillieSuit_taiga_F, 750, MISC_STOCK);
			ITEM(U_B_GhillieSuit_wdl_f, 750, MISC_STOCK);

			ITEM(U_O_V_Soldier_Viper_oicamo_F, 25000, MISC_STOCK);
		};

		class helmetsAegis
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Aegis", localize "STR_A3AU_helmets"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			///////helmets
			ITEM(H_HelmetO_ViperSP_oicamo_F, 15000, MISC_STOCK);

			ITEM(H_Beret_grn_SF, 200, MISC_STOCK);
			ITEM(H_Bandanna_mcamo_hs, 200, MISC_STOCK);
			ITEM(H_Bandanna_tna_F, 200, MISC_STOCK);
			ITEM(H_Bandanna_tna_hs_F, 200, MISC_STOCK);
			ITEM(H_Bandanna_camo_hs, 200, MISC_STOCK);
			ITEM(H_Watchcap_cbr_hs, 200, MISC_STOCK);
			ITEM(H_Watchcap_camo_hs, 200, MISC_STOCK);
			ITEM(H_Watchcap_blk_hs, 200, MISC_STOCK);
			ITEM(H_Watchcap_khk_hs, 200, MISC_STOCK);
			ITEM(H_Watchcap_red, 200, MISC_STOCK);
			ITEM(H_Beret_brn, 200, MISC_STOCK);
			ITEM(H_Beret_gry, 200, MISC_STOCK);
			ITEM(H_Beret_AAF_01_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Beret_UNO, 200, MISC_STOCK);

			ITEM(H_Booniehat_blk, 200, MISC_STOCK);
			ITEM(H_Booniehat_oicamo, 200, MISC_STOCK);
			ITEM(H_Booniehat_oicamo_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_ghex_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_ghex_hs_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_mgrn_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_ocamo, 200, MISC_STOCK);
			ITEM(H_Booniehat_ocamo_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_mcamo_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_oli_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_taiga_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_tna_hs_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_wdl_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_dgtl_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_eaf_arid, 200, MISC_STOCK);
			ITEM(H_Booniehat_eaf_arid_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_eaf_hs, 200, MISC_STOCK);
			ITEM(Aegis_H_Booniehat_UNO_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Booniehat_UNO_hs_F, 200, MISC_STOCK);

			ITEM(H_Cap_oicamo, 200, MISC_STOCK);
			ITEM(H_Cap_oicamo_hs, 200, MISC_STOCK);
			ITEM(H_Cap_ghex_F, 200, MISC_STOCK);
			ITEM(H_Cap_ghex_hs_F, 200, MISC_STOCK);
			ITEM(H_Cap_brn_SPECOPS_hs, 200, MISC_STOCK);
			ITEM(H_Cap_blk_ION_hs, 200, MISC_STOCK);
			ITEM(H_Cap_Lyfe, 200, MISC_STOCK);
			ITEM(H_Cap_MaldenTours, 200, MISC_STOCK);
			ITEM(H_Cap_brn_SERO, 200, MISC_STOCK);
			ITEM(H_Cap_tna_F, 200, MISC_STOCK);
			ITEM(H_Cap_tna_hs_F, 200, MISC_STOCK);
			ITEM(H_Cap_khaki_specops_UK_hs, 200, MISC_STOCK);
			ITEM(H_Cap_usblack_hs, 200, MISC_STOCK);
			ITEM(H_Cap_tan_specops_US_hs, 200, MISC_STOCK);
			ITEM(H_Cap_blk_Raven_hs, 200, MISC_STOCK);
			ITEM(H_Cap_UK_mtp, 200, MISC_STOCK);
			ITEM(H_Cap_eaf_F, 200, MISC_STOCK);
			ITEM(H_Cap_eaf_arid_F, 200, MISC_STOCK);
			ITEM(H_Cap_eaf_arid_hs_F, 200, MISC_STOCK);
			ITEM(H_Cap_eaf_hs_F, 200, MISC_STOCK);

			ITEM(H_EarProtectors_olive_F, 200, MISC_STOCK);
			ITEM(H_EarProtectors_sand_F, 200, MISC_STOCK);
			ITEM(H_HeadSet_olive_F, 200, MISC_STOCK);
			ITEM(H_HeadSet_sand_F, 200, MISC_STOCK);

			ITEM(H_Headset_light, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_nohs_blk, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_blue_F, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_nohs_oicamo, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_nohs_desert_lxWS, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_gen_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_ghex_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_grn_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_gry_F, 200, MISC_STOCK);
			ITEM(H_MilCap_blk, 200, MISC_STOCK);
			ITEM(H_MilCap_oicamo, 200, MISC_STOCK);
			ITEM(H_MilCap_tan, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_ocamo_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_mcamo_F, 200, MISC_STOCK);

			ITEM(Aegis_H_MilCap_tachs_blk_F, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_tachs_blue_F, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_tachs_grn_F, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_tachs_taiga_F, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_tachs_tan_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_taiga_F, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_nohs_tan, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_tna_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_oucamo_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_wdl_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_dgtl_F, 200, MISC_STOCK);
			ITEM(Aegis_H_Milcap_nohs_eaf_F, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_nohs_eaf_arid, 200, MISC_STOCK);
			ITEM(H_MilCap_eaf_arid, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_nohs_UNO, 200, MISC_STOCK);
			ITEM(Aegis_H_MilCap_UNO, 200, MISC_STOCK);
			ITEM(H_Cap_headphones_blk, 200, MISC_STOCK);
			ITEM(H_Cap_headphones_gry, 200, MISC_STOCK);
			ITEM(H_Cap_headphones_blk_ION, 200, MISC_STOCK);
			ITEM(H_Cap_headphones_tan, 200, MISC_STOCK);
			ITEM(H_ShemagOpen_tan_hs, 200, MISC_STOCK);
			ITEM(H_ShemagOpen_khk_hs, 200, MISC_STOCK);
			ITEM(H_Headset_Tactical, 200, MISC_STOCK);
			ITEM(H_Headset_Tactical_grn, 200, MISC_STOCK);
			ITEM(H_Headset_Tactical_khk, 200, MISC_STOCK);

			ITEM(H_HelmetHBK_arid_F, 800, MISC_STOCK);
			ITEM(H_HelmetHBK_arid_chops_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_arid_ear_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_arid_headset_F, 850, MISC_STOCK);

			ITEM(H_HelmetHBK_olive_F, 800, MISC_STOCK);
			ITEM(H_HelmetHBK_olive_chops_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_olive_ear_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_olive_headset_F, 850, MISC_STOCK);

			ITEM(H_HelmetSpecO_blk, 1000, MISC_STOCK);
			ITEM(H_HelmetSpecO_oicamo, 1000, MISC_STOCK);
			ITEM(H_HelmetSpecO_oucamo, 1000, MISC_STOCK);

			ITEM(H_HelmetAggressor_black_F, 1000, MISC_STOCK);
			ITEM(Aegis_H_HelmetAggressor_cover_ruurban_F, 1000, MISC_STOCK);
			ITEM(H_HelmetLeaderO_blk, 1000, MISC_STOCK);
			ITEM(H_HelmetLeaderO_oicamo, 1000, MISC_STOCK);

			ITEM(H_HelmetO_blk, 800, MISC_STOCK);
			ITEM(H_HelmetO_oicamo, 800, MISC_STOCK);
		
			ITEM(H_PASGT_neckprot_black_F, 600, MISC_STOCK);
			ITEM(lxWS_H_PASGT_goggles_green_F, 500, MISC_STOCK);
			ITEM(H_PASGT_basic_green_F, 500, MISC_STOCK);
			ITEM(H_PASGT_basic_sand_F, 500, MISC_STOCK);
			ITEM(H_PASGT_goggles_sand_F, 500, MISC_STOCK);
			ITEM(H_PASGT_basic_UNO_F, 500, MISC_STOCK);
			ITEM(Aegis_H_PASGT_goggles_UNO_F, 500, MISC_STOCK);

			ITEM(H_HelmetB_camo_mcamo, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_mcamo, 500, MISC_STOCK);
			ITEM(H_HelmetB_Camo_tna_F, 500, MISC_STOCK);
			ITEM(H_HelmetB_camo_wdl, 500, MISC_STOCK);

			ITEM(Aegis_H_Helmet_Virtus_Cover_mtp_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_Cover_tna_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_Cover_wdl_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_rgr_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_Headset_rgr_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_Headset_snd_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_Scrim_mtp_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_Scrim_tna_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_Scrim_wdl_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_snd_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_Virtus_Cover_UN_F, 500, MISC_STOCK);

			ITEM(H_HelmetSpecB_light_black, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light_desert, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light_grass, 500, MISC_STOCK);

			ITEM(H_HelmetB_light_mcamo, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light_mcamo, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light_sand, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light_snakeskin, 500, MISC_STOCK);
			ITEM(H_HelmetB_Enh_Light_tna_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light_wdl, 500, MISC_STOCK);

			ITEM(H_HelmetLuchnik_brn_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_dst_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_ghex_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_grn_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_hex_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_khk_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_rutaiga_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_headset_brn_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_headset_khk_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_headset_grn_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_khk_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_olive_F, 500, MISC_STOCK);

			ITEM(H_I_Helmet_canvas_CBR_F, 500, MISC_STOCK);
			ITEM(H_O_Helmet_canvas_ghex_F, 500, MISC_STOCK);
			ITEM(H_I_Helmet_canvas_Green, 500, MISC_STOCK);
			ITEM(H_O_Helmet_canvas_ocamo, 500, MISC_STOCK);
			ITEM(H_O_Helmet_canvas_oucamo, 500, MISC_STOCK);
			ITEM(H_I_Helmet_canvas_UN_F, 500, MISC_STOCK);

			ITEM(Aegis_H_Helmet_FASTMT_blk_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_blk_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_rgr_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_tan_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_UN_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_cbr_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_rgr_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Headset_blk_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Headset_cbr_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Headset_rgr_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Headset_tan_F, 500, MISC_STOCK);

			ITEM(Aegis_H_Helmet_FASTMT_tan_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_dazzle_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_dazzle_tna_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_UK_mtp_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_UK_tna_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_UK_wdl_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_Desert_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_mtp_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_tna_F, 500, MISC_STOCK);
			ITEM(Aegis_H_Helmet_FASTMT_Cover_wdl_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_black_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_brown_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_arid_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_dst_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_ghex_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_hex_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_khaki_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_grn_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_taiga_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_UNO_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_uhex_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_whex_CO, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_headset_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_black_headset_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_brown_headset_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_paint_headset_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_paint_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_AAF_F, 500, MISC_STOCK);
			ITEM(H_MK7_AAF_F, 500, MISC_STOCK);
			ITEM(H_MK7_oli_F, 500, MISC_STOCK);
			ITEM(H_MK7_sand_F, 500, MISC_STOCK);
			ITEM(H_MK7_UN_F, 500, MISC_STOCK);

			ITEM(Aegis_H_turban_bmask_ghex_lxWS, 500, MISC_STOCK);
			ITEM(Aegis_H_turban_bmask_camo01_lxWS, 500, MISC_STOCK);
			ITEM(Aegis_lxWS_H_bmask_UwU, 2000, MISC_STOCK);
			ITEM(Aegis_H_turban_bmask_UwU_lxWS, 2000, MISC_STOCK);
			ITEM(Aegis_H_turban_bmask_white_lxWS, 500, MISC_STOCK);
			ITEM(Aegis_H_turban_bmask_camo02_lxWS, 500, MISC_STOCK);
			ITEM(Aegis_H_turban_bmask_yellow_lxWS, 500, MISC_STOCK);
			ITEM(Aegis_lxWS_H_bmask_AAF, 500, MISC_STOCK);

			ITEM(H_PilotHelmetHeli_B_visor_up, 600, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_I_E_visor_up, 600, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_O_visor_up, 600, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_I_visor_up, 600, MISC_STOCK);

			ITEM(H_HelmetCrew_B_oli_F, 600, MISC_STOCK);
			
			////////
		};
