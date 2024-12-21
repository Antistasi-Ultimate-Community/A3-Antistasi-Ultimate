		class riflesRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(arifle_ash12_LR_blk_RF, 3500, RIFLE_STOCK);
			ITEM(arifle_ash12_LR_desert_RF, 3500, RIFLE_STOCK);
			ITEM(arifle_ash12_LR_urban_RF, 3500, RIFLE_STOCK);
			ITEM(arifle_ash12_LR_wood_RF, 3500, RIFLE_STOCK);

			ITEM(arifle_ash12_blk_RF, 4000, RIFLE_STOCK);
			ITEM(arifle_ash12_desert_RF, 4000, RIFLE_STOCK);
			ITEM(arifle_ash12_urban_RF, 4000, RIFLE_STOCK);
			ITEM(arifle_ash12_wood_RF, 4000, RIFLE_STOCK);

			ITEM(arifle_ash12_GL_blk_RF, 6000, RIFLE_STOCK);
			ITEM(arifle_ash12_GL_desert_RF, 6000, RIFLE_STOCK);
			ITEM(arifle_ash12_GL_urban_RF, 6000, RIFLE_STOCK);
			ITEM(arifle_ash12_GL_wood_RF, 6000, RIFLE_STOCK);
		};

		class sniperRiflesRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(srifle_h6_blk_rf, 2000, RIFLE_STOCK);
			ITEM(srifle_h6_digi_rf, 2000, RIFLE_STOCK);
			ITEM(srifle_h6_gold_rf, 10000, RIFLE_STOCK);
			ITEM(srifle_h6_oli_rf, 2000, RIFLE_STOCK);
			ITEM(srifle_h6_tan_rf, 2000, RIFLE_STOCK);

			ITEM(srifle_DMR_01_black_RF, 5000, RIFLE_STOCK);
			ITEM(srifle_DMR_01_tan_RF, 5000, RIFLE_STOCK);
		};

		class smgRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(SMG_01_black_RF, 500, RIFLE_STOCK);
		};

		class handgunsRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(hgun_Glock19_RF, 200, PISTOL_STOCK);
			ITEM(hgun_Glock19_khk_RF, 200, PISTOL_STOCK);
			ITEM(hgun_Glock19_Tan_RF, 200, PISTOL_STOCK);

			ITEM(hgun_Glock19_auto_RF, 400, PISTOL_STOCK);
			ITEM(hgun_Glock19_auto_khk_RF, 400, PISTOL_STOCK);
			ITEM(hgun_Glock19_auto_Tan_RF, 400, PISTOL_STOCK);
			
			ITEM(hgun_DEagle_RF, 600, PISTOL_STOCK);
			ITEM(hgun_DEagle_bronze_RF, 600, PISTOL_STOCK);
			ITEM(hgun_DEagle_classic_RF, 600, PISTOL_STOCK);
			ITEM(hgun_DEagle_copper_RF, 600, PISTOL_STOCK);
			ITEM(hgun_DEagle_gold_RF, 600, PISTOL_STOCK);
			ITEM(hgun_DEagle_camo_RF, 600, PISTOL_STOCK);
		};

		class launchersRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(launch_PSRL1_geo_RF, 1100, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_olive_RF, 1100, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_sand_RF, 1100, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_digi_RF, 1100, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_black_RF, 1100, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_PWS_geo_RF, 1250, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_PWS_olive_RF, 1250, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_PWS_sand_RF, 1250, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_PWS_digi_RF, 1250, LAUNCHER_STOCK);
			ITEM(launch_PSRL1_PWS_black_RF, 1250, LAUNCHER_STOCK);
		};

		class launcherMagazinesRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			class PSRL1_AT_RF {
				price = 300;
				stock = 20;
			};

			class PSRL1_HE_RF {
				price = 300;
				stock = 20;
			};
			class PSRL1_HEAT_RF {
				price = 300;
				stock = 20;
			};

			class PSRL1_FRAG_RF {
				price = 200;
				stock = 20;
			};

		};

		class navigationRF
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_RF", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(TiGoggles_RF, 5000, NN_STOCK);
			ITEM(TiGoggles_grn_RF, 5000, NN_STOCK);
			ITEM(TiGoggles_tan_RF, 5000, NN_STOCK);
		};

		class pointersRF
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_RF", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(acc_flashlight_IR_pistol_RF, 75, PN_STOCK);
			ITEM(acc_pointer_IR_pistol_RF, 75, PN_STOCK);
		};

		class muzzlesRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(suppressor_127x55_big_RF, 1000, MZ_STOCK);
			ITEM(suppressor_127x55_big_desert_RF, 1000, MZ_STOCK);
			ITEM(suppressor_127x55_big_wood_RF, 1000, MZ_STOCK);
			ITEM(suppressor_127x55_small_RF, 600, MZ_STOCK);
			ITEM(suppressor_127x55_small_desert_RF, 600, MZ_STOCK);
			ITEM(suppressor_127x55_small_wood_RF, 600, MZ_STOCK);
		};

		class opticsRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class optic_VRCO_RF 
			{
				price = 500;
				stock = 75;
			};
			class optic_VRCO_khk_RF : optic_VRCO_RF {};
			class optic_VRCO_tan_RF : optic_VRCO_RF {};

			class optic_rds_RF 
			{
				price = 150;
				stock = 100;
			};
			class optic_VRCO_pistol_RF 
			{
				price = 300;
				stock = 100;
			};

			class optic_ACO_grn_desert_RF 
			{
				price = 150;
				stock = 100;
			};
			class optic_ACO_grn_wood_RF : optic_ACO_grn_desert_RF {};
			class optic_ACO_desert_RF : optic_ACO_grn_desert_RF {};
			class optic_ACO_wood_RF : optic_ACO_grn_desert_RF {};
			class optic_MRD_khk_RF : optic_ACO_grn_desert_RF {};
			class optic_MRD_tan_RF : optic_ACO_grn_desert_RF {};
		};

		// Not sure if we want to implement this, so leaving it here incase
		class magazinesSpecialRF
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			///////////////////////////////////////////////////////
			// Underbarrel
			///////////////////////////////////////////////////////

			class 1Rnd_RC40_HE_shell_RF 
			{
				price = 10000;
				stock = 5;
			};
		};

		class magazinesRF
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			///////////////////////////////////////////////////////
			// Underbarrel
			///////////////////////////////////////////////////////
			class 1Rnd_RC40_shell_RF 
			{
				price = 5000;
				stock = 10;
			};
			class 1Rnd_RC40_SmokeBlue_shell_RF : 1Rnd_RC40_shell_RF {};
			class 1Rnd_RC40_SmokeGreen_shell_RF : 1Rnd_RC40_shell_RF {};
			class 1Rnd_RC40_SmokeOrange_shell_RF : 1Rnd_RC40_shell_RF {};
			class 1Rnd_RC40_SmokeRed_shell_RF : 1Rnd_RC40_shell_RF {};
			class 1Rnd_RC40_SmokeWhite_shell_RF : 1Rnd_RC40_shell_RF {};

			///////////////////////////////////////////////////////
			// Pistols, SMGs
			///////////////////////////////////////////////////////
			class 7Rnd_50AE_Mag_RF 
			{
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 65Rnd_9x19_Mag_RF 
			{
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 33Rnd_9x19_Mag_RF 
			{
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 33Rnd_9x19_Mag_khk_RF : 33Rnd_9x19_Mag_RF {};
			class 33Rnd_9x19_Green_Mag_RF : 33Rnd_9x19_Mag_RF {};

			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////
			class 10Rnd_556x45_AP_Stanag_RF 
			{
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 10Rnd_556x45_AP_Stanag_khk_RF : 10Rnd_556x45_AP_Stanag_RF {};
			class 10Rnd_556x45_AP_Stanag_Tan_RF : 10Rnd_556x45_AP_Stanag_RF {};

			class 20Rnd_556x45_AP_Stanag_green_RF : 10Rnd_556x45_AP_Stanag_RF 
			{
				price = 400;
			};
			class 20Rnd_556x45_AP_Stanag_green_khk_RF : 10Rnd_556x45_AP_Stanag_RF {};
			class 20Rnd_556x45_AP_Stanag_green_Tan_RF : 10Rnd_556x45_AP_Stanag_RF {};

			class 30Rnd_556x45_AP_Stanag_green_RF : 10Rnd_556x45_AP_Stanag_RF 
			{
				price = 600;
			};
			class 30Rnd_556x45_AP_Stanag_green_khk_RF : 10Rnd_556x45_AP_Stanag_RF {};
			class 30Rnd_556x45_AP_Stanag_green_Tan_RF : 10Rnd_556x45_AP_Stanag_RF {};

			class 20Rnd_127x55_Mag_RF 
			{
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class 20Rnd_127x55_Mag_desert_RF : 20Rnd_127x55_Mag_RF {};
			class 20Rnd_127x55_Mag_wood_RF : 20Rnd_127x55_Mag_RF {};
		};

		class miscRF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_RF", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(B_DuffleBag_Black_NoLogo_RF, 600, MISC_STOCK);
			ITEM(B_DuffleBag_Sand_NoLogo_RF, 600, MISC_STOCK);
			ITEM(B_DuffleBag_MTP_RF, 600, MISC_STOCK);
			ITEM(B_DuffleBag_Olive_NoLogo_RF, 600, MISC_STOCK);

			// This ENTIRE block is just the altyn helmet + variants...
			ITEM(H_HelmetHeavy_Black_RF, 2000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Simple_Black_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_VisorUp_Black_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_GHex_RF, 2000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Simple_GHex_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_VisorUp_GHex_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Hex_RF, 2000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Simple_Hex_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_VisorUp_Hex_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Olive_RF, 2000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Simple_Olive_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_VisorUp_Olive_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Sand_RF, 2000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Simple_Sand_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_VisorUp_Sand_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_White_RF, 2000, MISC_STOCK);
			ITEM(H_HelmetHeavy_Simple_White_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetHeavy_VisorUp_White_RF, 1000, MISC_STOCK);

			ITEM(H_PilotHelmetHeli_Black_RF, 1000, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_Blue_RF, 1000, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_Green_RF, 1000, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_MilGreen_RF, 1000, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_Orange_RF, 1000, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_Red_RF, 1000, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_White_RF, 1000, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_Yellow_RF, 1000, MISC_STOCK);

			ITEM(H_HelmetIA_sb_arid_RF, 1000, MISC_STOCK);
			ITEM(H_HelmetIA_sb_digital_RF, 1000, MISC_STOCK);

			ITEM(H_HelmetB_plain_sb_geo_RF, 1500, MISC_STOCK);
			ITEM(H_HelmetB_plain_sb_hex_RF, 1500, MISC_STOCK);
			ITEM(H_HelmetB_plain_sb_khaki_RF, 1500, MISC_STOCK);
			ITEM(H_HelmetB_plain_sb_mtp_RF, 1500, MISC_STOCK);
			ITEM(H_HelmetB_plain_sb_tna_RF, 1500, MISC_STOCK);
			ITEM(H_HelmetB_plain_sb_wdl_RF, 1500, MISC_STOCK);

			ITEM(H_HelmetAggressor_sb_taiga_RF, 2000, MISC_STOCK);

			ITEM(H_HelmetO_ocamo_sb_hex_RF, 2000, MISC_STOCK);
			ITEM(H_HelmetO_ocamo_sb_urban_RF, 2000, MISC_STOCK);

			ITEM(V_PlateCarrierLite_black_noFlag_RF, 1300, MISC_STOCK);
			ITEM(V_TacVest_rig_blk_RF, 700, MISC_STOCK);
			ITEM(V_TacVest_rig_khk_RF, 700, MISC_STOCK);
			ITEM(V_TacVest_rig_oli_RF, 700, MISC_STOCK);
			ITEM(V_TacVest_gen_holster_RF, 700, MISC_STOCK);

			ITEM(U_C_PilotJacket_black_RF, 1000, MISC_STOCK);
			ITEM(U_C_PilotJacket_open_black_RF, 1000, MISC_STOCK);
			ITEM(U_C_PilotJacket_brown_RF, 1000, MISC_STOCK);
			ITEM(U_C_PilotJacket_open_brown_RF, 1000, MISC_STOCK);
			ITEM(U_C_PilotJacket_lbrown_RF, 1000, MISC_STOCK);
			ITEM(U_C_PilotJacket_open_lbrown_RF, 1000, MISC_STOCK);
		};
