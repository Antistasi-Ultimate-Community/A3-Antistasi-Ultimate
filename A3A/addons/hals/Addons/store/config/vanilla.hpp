		class handgunsVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(hgun_Pistol_heavy_01_F, 450, PISTOL_STOCK);
			ITEM(hgun_ACPC2_F, 200, PISTOL_STOCK);
			ITEM(hgun_P07_F, 150, PISTOL_STOCK);
			ITEM(hgun_Rook40_F, 150, PISTOL_STOCK);
			ITEM(hgun_Pistol_heavy_02_F, 600, PISTOL_STOCK);

		};

		class riflesVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(arifle_Mk20C_plain_F, 550, RIFLE_STOCK);
			ITEM(arifle_Mk20_plain_F, 700, RIFLE_STOCK);
			ITEM(arifle_Mk20_GL_plain_F, 850, RIFLE_STOCK);

			ITEM(arifle_TRG20_F, 500, RIFLE_STOCK);
			ITEM(arifle_TRG21_F, 600, RIFLE_STOCK);
			ITEM(arifle_TRG21_GL_F, 750, RIFLE_STOCK);

			ITEM(arifle_Katiba_F, 1000, RIFLE_STOCK);
			ITEM(arifle_Katiba_C_F, 950, RIFLE_STOCK);
			ITEM(arifle_Katiba_GL_F, 1150, RIFLE_STOCK);

			ITEM(arifle_MX_F, 1250, RIFLE_STOCK);
			ITEM(arifle_MXC_F, 1200, RIFLE_STOCK);
			ITEM(arifle_MX_GL_F, 1400, RIFLE_STOCK);

			ITEM(arifle_MX_Black_F, 1250, RIFLE_STOCK);
			ITEM(arifle_MXC_Black_F, 1200, RIFLE_STOCK);
			ITEM(arifle_MX_GL_Black_F, 1400, RIFLE_STOCK);

			ITEM(arifle_SDAR_F, 350, RIFLE_STOCK);

		};

		class sniperRiflesVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(arifle_MXM_F, 1600, RIFLE_STOCK);
			ITEM(arifle_MXM_Black_F, 1600, RIFLE_STOCK);

			ITEM(srifle_DMR_01_F, 2200, RIFLE_STOCK);

			ITEM(srifle_EBR_F, 2550, RIFLE_STOCK);

			ITEM(srifle_LRR_F, 4000, 5);
			ITEM(srifle_LRR_camo_F, 4000, 5);

			ITEM(srifle_GM6_F, 4500, 5);
			ITEM(srifle_GM6_camo_F, 4500, 5);

		};

		class mgVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(arifle_MX_SW_F, 1600, RIFLE_STOCK);
			ITEM(arifle_MX_SW_Black_F, 1600, RIFLE_STOCK);

			ITEM(LMG_03_F, 1250, RIFLE_STOCK);
			
			ITEM(LMG_Mk200_F, 1850, RIFLE_STOCK);

			ITEM(LMG_Zafir_F, 2900, RIFLE_STOCK);

		};

		class smgVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(SMG_03C_TR_black, 350, RIFLE_STOCK);
			ITEM(SMG_03C_TR_camo, 350, RIFLE_STOCK);
			ITEM(SMG_03C_TR_hex, 350, RIFLE_STOCK);
			ITEM(SMG_03C_TR_khaki, 350, RIFLE_STOCK);

			ITEM(SMG_03C_black, 450, RIFLE_STOCK);
			ITEM(SMG_03C_camo, 450, RIFLE_STOCK);
			ITEM(SMG_03C_hex, 450, RIFLE_STOCK);
			ITEM(SMG_03C_khaki, 450, RIFLE_STOCK);

			ITEM(SMG_03_TR_black, 325, RIFLE_STOCK);
			ITEM(SMG_03_TR_camo, 325, RIFLE_STOCK);
			ITEM(SMG_03_TR_hex, 325, RIFLE_STOCK);
			ITEM(SMG_03_TR_khaki, 325, RIFLE_STOCK);
			
			ITEM(SMG_03_black, 425, RIFLE_STOCK);
			ITEM(SMG_03_camo, 425, RIFLE_STOCK);
			ITEM(SMG_03_hex, 425, RIFLE_STOCK);
			ITEM(SMG_03_khaki, 425, RIFLE_STOCK);

			ITEM(SMG_05_F, 200, RIFLE_STOCK);
			ITEM(SMG_01_F, 200, RIFLE_STOCK);
			ITEM(hgun_PDW2000_F, 100, RIFLE_STOCK);

		};

		class launchersVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(launch_NLAW_F, 2000, LAUNCHER_STOCK);

			ITEM(launch_RPG32_F, 1250, LAUNCHER_STOCK);

			ITEM(launch_B_Titan_F, 3500, 3);
			ITEM(launch_I_Titan_F, 3500, 3);
			ITEM(launch_O_Titan_F, 3500, 3);

			ITEM(launch_B_Titan_short_F, 3250, 3);
			ITEM(launch_I_Titan_short_F, 3250, 3);
			ITEM(launch_O_Titan_short_F, 3250, 3);

		};

		class launcherMagazinesVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			class NLAW_F {
				price = 300;
				stock = 50;
			};

			class RPG32_F {
				price = 300;
				stock = 50;
			};
			class RPG32_HE_F {
				price = 200;
				stock = 50;
			};

			class Titan_AA {
				price = 400;
				stock = 10;
			};

			class Titan_AT {
				price = 300;
				stock = 10;
			};
			class Titan_AP {
				price = 200;
				stock = 10;
			};

		};

		class navigationVanilla
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_Vanilla", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(ItemGPS, 300, NN_STOCK);
			ITEM(ItemRadio, 45, NN_STOCK);
			ITEM(Rangefinder, 400, NN_STOCK);
			ITEM(Laserdesignator, 1200, NN_STOCK);

			ITEM(NVGoggles, 500, NN_STOCK);
			ITEM(NVGoggles_INDEP, 1000, NN_STOCK);
			ITEM(NVGoggles_OPFOR, 1000, NN_STOCK);

		};

		class pointersVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_Vanilla", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(acc_flashlight, 75, PN_STOCK);
			ITEM(acc_flashlight_smg_01, 75, PN_STOCK);
			ITEM(acc_pointer_IR, 100, PN_STOCK);
			ITEM(acc_flashlight_pistol, 75, PN_STOCK);

		};

		class muzzlesVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(muzzle_snds_acp, 150, MZ_STOCK);

			ITEM(muzzle_snds_570, 150, MZ_STOCK);

			ITEM(muzzle_snds_B, 200, MZ_STOCK);

			ITEM(muzzle_snds_H, 200, MZ_STOCK);

			ITEM(muzzle_snds_H_MG, 200, MZ_STOCK);

			ITEM(muzzle_snds_L, 200, MZ_STOCK);

			ITEM(muzzle_snds_M, 200, MZ_STOCK);

		};

		class opticsVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class optic_tws {
				price = 2000;
				stock = 5;
			};

			class optic_tws_mg {
				price = 2000;
				stock = 5;
			};

			class optic_Nightstalker {
				price = 4000;
				stock = 5;
			};

			class optic_Aco {
				price = 200; 
				stock = 100;
			};
			class optic_ACO_grn {
				price = 200; 
				stock = 100;
			};
			class optic_ACO_grn_smg {
				price = 200; 
				stock = 100;
			};
			class optic_Aco_smg {
				price = 200; 
				stock = 100;
			};

			class optic_Arco {
				price = 650;
				stock = 100;
			};

			class optic_DMS {
				price = 800;
				stock = 100;
			};

			class optic_Hamr {
				price = 700;
				stock = 100;
			};

			class optic_Holosight {
				price = 250;
				stock = 100;
			};
			class optic_Holosight_smg {
				price = 250;
				stock = 100;
			};

			class optic_LRPS {
				price = 1000;
				stock = 100;
			};

			class optic_MRCO {
				price = 500;
				stock = 100;
			};

			class optic_MRD {
				price = 100;
				stock = 100;
			};

			class optic_NVS {
				price = 1500;
				stock = 100;
			};

			class optic_SOS {
				price = 800;
				stock = 100;
			};

			class optic_Yorris {
				price = 100;
				stock = 100;
			};

		};

		class magazinesVanilla 
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			class Laserbatteries {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// Underbarrel
			///////////////////////////////////////////////////////
			class 1Rnd_HE_Grenade_shell {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class UGL_FlareWhite_F {
				price = 25;
				stock = MAGAZINE_STOCK;
			};
			class UGL_FlareGreen_F {
				price = 25;
				stock = MAGAZINE_STOCK;
			};
			class UGL_FlareRed_F {
				price = 25;
				stock = MAGAZINE_STOCK;
			};
			class UGL_FlareYellow_F {
				price = 25;
				stock = MAGAZINE_STOCK;
			};
			class UGL_FlareCIR_F {
				price = 25;
				stock = MAGAZINE_STOCK;
			};
			class 1Rnd_Smoke_Grenade_shell {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 1Rnd_SmokeRed_Grenade_shell {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 1Rnd_SmokeGreen_Grenade_shell {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 1Rnd_SmokeYellow_Grenade_shell {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 1Rnd_SmokePurple_Grenade_shell {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 1Rnd_SmokeBlue_Grenade_shell {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 1Rnd_SmokeOrange_Grenade_shell {
				price = 50;
				stock = MAGAZINE_STOCK;
			};

			class 3Rnd_HE_Grenade_shell {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_UGL_FlareWhite_F {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_UGL_FlareGreen_F {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_UGL_FlareRed_F {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_UGL_FlareYellow_F {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_UGL_FlareCIR_F {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_Smoke_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_SmokeRed_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_SmokeGreen_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_SmokeYellow_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_SmokePurple_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_SmokeBlue_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 3Rnd_SmokeOrange_Grenade_shell {
				price = 200;
				stock = MAGAZINE_STOCK;
			};


			///////////////////////////////////////////////////////
			// Pistols, SMGs
			///////////////////////////////////////////////////////

			class 9Rnd_45ACP_Mag {
				price = 15;
				stock = MAGAZINE_STOCK;
			};

			class 6Rnd_45ACP_Cylinder {
				price = 25;
				stock = MAGAZINE_STOCK;
			};

			class 11Rnd_45ACP_Mag {
				price = 45;
				stock = MAGAZINE_STOCK;
			};

			class 16Rnd_9x21_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 16Rnd_9x21_red_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 16Rnd_9x21_green_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 16Rnd_9x21_yellow_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Mag {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Red_Mag {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Yellow_Mag {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Green_Mag {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 10Rnd_9x21_Mag {
				price = 25;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////

			class 30Rnd_65x39_caseless_green {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_65x39_caseless_green_mag_Tracer {
				price = 110;
				stock = MAGAZINE_STOCK;
			};

			class 30Rnd_556x45_Stanag {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_Tracer_Red {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_Tracer_Green {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_Tracer_Yellow {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_red {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_green {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_Sand_red {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_Sand_Tracer_Red {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_Sand_Tracer_Green {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_Stanag_Sand_Tracer_Yellow {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class 30Rnd_65x39_caseless_mag {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_65x39_caseless_black_mag {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_65x39_caseless_mag_Tracer {
				price = 110;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_65x39_caseless_black_mag_Tracer {
				price = 110;
				stock = MAGAZINE_STOCK;
			};
			class 100Rnd_65x39_caseless_mag {
				price = 400;
				stock = MAGAZINE_STOCK;
			};
			class 100Rnd_65x39_caseless_black_mag {
				price = 400;
				stock = MAGAZINE_STOCK;
			};
			class 100Rnd_65x39_caseless_mag_Tracer {
				price = 425;
				stock = MAGAZINE_STOCK;
			};
			class 100Rnd_65x39_caseless_black_mag_tracer {
				price = 425;
				stock = MAGAZINE_STOCK;
			};

			class 30Rnd_545x39_Mag_F {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Green_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Tracer_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_545x39_Mag_Tracer_Green_F {
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			class 20Rnd_556x45_UW_mag {
				price = 65;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////
			class 5Rnd_127x108_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class 5Rnd_127x108_APDS_Mag {
				price = 300;
				stock = MAGAZINE_STOCK;
			};

			class 7Rnd_408_Mag {
				price = 175;
				stock = MAGAZINE_STOCK;
			};

			class 20Rnd_762x51_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class 10Rnd_762x54_Mag {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
	
			///////////////////////////////////////////////////////
			// MGs
			///////////////////////////////////////////////////////

			class 200Rnd_556x45_Box_F {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 200Rnd_556x45_Box_Red_F {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
			class 200Rnd_556x45_Box_Tracer_F {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
			class 200Rnd_556x45_Box_Tracer_Red_F {
				price = 225;
				stock = MAGAZINE_STOCK;
			};

			class 200Rnd_65x39_cased_Box {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class 200Rnd_65x39_cased_Box_Tracer {
				price = 375;
				stock = MAGAZINE_STOCK;
			};
			class 200Rnd_65x39_cased_Box_Red {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class 200Rnd_65x39_cased_Box_Tracer_Red {
				price = 375;
				stock = MAGAZINE_STOCK;
			};

			class 150Rnd_762x54_Box {
				price = 450;
				stock = MAGAZINE_STOCK;
			};
			class 150Rnd_762x54_Box_Tracer {
				price = 460;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// SMGs
			///////////////////////////////////////////////////////
			class 50Rnd_570x28_SMG_03 {
				price = 80;
				stock = MAGAZINE_STOCK;
			};

			class 30Rnd_9x21_Mag_SMG_02 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Mag_SMG_02_Tracer_Red {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Mag_SMG_02_Tracer_Yellow {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Mag_SMG_02_Tracer_Green {
				price = 65;
				stock = MAGAZINE_STOCK;
			};

			class 30Rnd_45ACP_Mag_SMG_01 {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green {
				price = 85;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red {
				price = 85;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow {
				price = 85;
				stock = MAGAZINE_STOCK;
			};
		};

		class miscVanilla 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Vanilla", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(U_I_HeliPilotCoveralls, 500, MISC_STOCK);

			ITEM(H_CrewHelmetHeli_I, 750, MISC_STOCK);

			ITEM(H_PilotHelmetHeli_I, 500, MISC_STOCK);

			ITEM(H_PilotHelmetFighter_I, 1000, MISC_STOCK);

			ITEM(U_I_pilotCoveralls, 1000, MISC_STOCK);
			ITEM(U_O_PilotCoveralls, 3000, MISC_STOCK);

			ITEM(H_HelmetCrew_I, 750, MISC_STOCK);
			ITEM(H_HelmetCrew_B, 1000, MISC_STOCK);

			ITEM(U_I_FullGhillie_ard, 1000, MISC_STOCK);
			ITEM(U_B_FullGhillie_ard, 1000, MISC_STOCK);
			ITEM(U_O_FullGhillie_ard, 3000, MISC_STOCK);

			ITEM(U_I_FullGhillie_lsh, 1000, MISC_STOCK);
			ITEM(U_B_FullGhillie_lsh, 1000, MISC_STOCK);
			ITEM(U_O_FullGhillie_lsh, 3000, MISC_STOCK);

			ITEM(U_I_FullGhillie_sard, 1000, MISC_STOCK);
			ITEM(U_B_FullGhillie_sard, 1000, MISC_STOCK);
			ITEM(U_O_FullGhillie_sard, 3000, MISC_STOCK);

			ITEM(U_I_GhillieSuit, 750, MISC_STOCK);
			ITEM(U_O_GhillieSuit, 1500, MISC_STOCK);

			ITEM(B_Carryall_cbr, 400, MISC_STOCK);
			ITEM(B_Carryall_ocamo, 400, MISC_STOCK);
			ITEM(B_Carryall_khk, 400, MISC_STOCK);
			ITEM(B_Carryall_mcamo, 400, MISC_STOCK);
			ITEM(B_Carryall_oli, 400, MISC_STOCK);
			ITEM(B_Carryall_oucamo, 400, MISC_STOCK);

			ITEM(V_TacVestIR_blk, 500, MISC_STOCK);

			ITEM(V_Press_F, 800, MISC_STOCK);

			ITEM(V_PlateCarrierIA1_dgtl, 1000, MISC_STOCK);
			ITEM(V_PlateCarrierIA2_dgtl, 1000, MISC_STOCK);
			ITEM(V_PlateCarrier2_rgr_noflag_F, 1400, MISC_STOCK);
			ITEM(V_PlateCarrier1_blk, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_blk, 1250, MISC_STOCK);
			ITEM(V_PlateCarrierIAGL_oli, 1300, MISC_STOCK);

			ITEM(G_Diving, 150, MISC_STOCK);
			ITEM(G_I_Diving, 150, MISC_STOCK);
			ITEM(V_RebreatherIA, 750, MISC_STOCK);
			ITEM(U_B_survival_uniform, 750, MISC_STOCK);
			ITEM(U_I_Wetsuit, 750, MISC_STOCK);

			ITEM(MineDetector, 500, MISC_STOCK);

			ITEM(I_IR_Grenade, 250, MISC_STOCK);
			ITEM(O_IR_Grenade, 250, MISC_STOCK);
			ITEM(B_IR_Grenade, 250, MISC_STOCK);

			ITEM(Chemlight_blue, 30, MISC_STOCK);
			ITEM(Chemlight_green, 30, MISC_STOCK);
			ITEM(Chemlight_red, 30, MISC_STOCK);
			ITEM(Chemlight_yellow, 30, MISC_STOCK);

			ITEM(MiniGrenade, 100, MISC_STOCK);
			ITEM(HandGrenade, 200, MISC_STOCK);

			ITEM(SmokeShellBlue, 50, MISC_STOCK);
			ITEM(SmokeShellGreen, MISC_STOCK);
			ITEM(SmokeShellOrange, 50, MISC_STOCK);
			ITEM(SmokeShellPurple, 50, MISC_STOCK);
			ITEM(SmokeShellRed, 50, MISC_STOCK);
			ITEM(SmokeShell, 50, MISC_STOCK);
			ITEM(SmokeShellYellow, 50, MISC_STOCK);

			ITEM(IEDUrbanSmall_Remote_Mag, 500, MISC_STOCK);
			ITEM(IEDLandSmall_Remote_Mag, 500, MISC_STOCK);
			ITEM(IEDLandBig_Remote_Mag, 750, MISC_STOCK);
			ITEM(IEDUrbanBig_Remote_Mag, 750, MISC_STOCK);

			ITEM(ClaymoreDirectionalMine_Remote_Mag, 300, MISC_STOCK);
			ITEM(DemoCharge_Remote_Mag, 250, MISC_STOCK);
			ITEM(SatchelCharge_Remote_Mag, 500, MISC_STOCK);
			ITEM(SLAMDirectionalMine_Wire_Mag, 400, MISC_STOCK);
			ITEM(ATMine_Range_Mag, 200, MISC_STOCK);
			ITEM(APERSMine_Range_Mag, 200, MISC_STOCK);
			ITEM(APERSBoundingMine_Range_Mag, 150, MISC_STOCK);
			ITEM(APERSTripMine_Wire_Mag, 100, MISC_STOCK);
			
			ITEM(I_UavTerminal, 800, MISC_STOCK);
			ITEM(O_UavTerminal, 800, MISC_STOCK);
			ITEM(B_UavTerminal, 800, MISC_STOCK);

			ITEM(U_C_Driver_1_black, 1000, MISC_STOCK);
			ITEM(U_C_Driver_1_blue, 1000, MISC_STOCK);
			ITEM(U_C_Driver_1_green, 1000, MISC_STOCK);
			ITEM(U_C_Driver_1_orange, 1000, MISC_STOCK);
			ITEM(U_C_Driver_1_red, 1000, MISC_STOCK);
			ITEM(U_C_Driver_1_white, 1000, MISC_STOCK);
			ITEM(U_C_Driver_1_yellow, 1000, MISC_STOCK);
			ITEM(U_C_Driver_1, 1000, MISC_STOCK);
			ITEM(U_C_Driver_2, 1000, MISC_STOCK);
			ITEM(U_C_Driver_3, 1000, MISC_STOCK);
			ITEM(U_C_Driver_4, 1000, MISC_STOCK);

			ITEM(H_RacingHelmet_1_black_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_1_blue_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_1_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_1_green_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_1_orange_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_1_red_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_1_white_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_1_yellow_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_2_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_3_F, 300, MISC_STOCK);
			ITEM(H_RacingHelmet_4_F, 300, MISC_STOCK);

			ITEM(U_I_Protagonist_VR, 50000, MISC_STOCK);
			ITEM(U_C_Protagonist_VR, 50000, MISC_STOCK);
			ITEM(U_O_Protagonist_VR, 50000, MISC_STOCK);
			ITEM(U_B_Protagonist_VR, 50000, MISC_STOCK);

		};