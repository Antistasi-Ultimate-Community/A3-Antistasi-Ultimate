		class handgunsYLA 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(yl_92a_issued_base, 150, PISTOL_STOCK);
			ITEM(yl_92a_LAB, 150, PISTOL_STOCK);
			ITEM(yl_92a_RW_PA_bctriwpn, 350, PISTOL_STOCK); //Conversion Kit Version of QSZ-92A. It Allows more Optics and Pointers.
			ITEM(yl_92a_SW_PA_bctriwpn, 350, PISTOL_STOCK); //Above^
			ITEM(yl_92B_issued, 150, PISTOL_STOCK); //Shorter Barrel than the QSZ-92A. Has same Stats though. No price difference.
			ITEM(yl_92B_LAB, 150, PISTOL_STOCK);

		};

		class riflesYLA 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			
			ITEM(YL_QBU191, 1200, RIFLE_STOCK);
			ITEM(YL_QBU191_PRS, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ191_C1, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ191_GL, 1800, RIFLE_STOCK);

			ITEM(YL_QBZ03, 1000, RIFLE_STOCK); //Railing Optics Thing
			ITEM(YL_QBZ03_SEK, 1100, RIFLE_STOCK);

			ITEM(YL_QBZ95_1, 1150, RIFLE_STOCK); //Doesnt have Railing for Optics. Slightly Cheaper.
			ITEM(YL_QBZ95_1_DDHA1, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ95_1_DDHA2, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ95_1_DDHB1, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ95_1_DDHB2, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ95_1_MY2_GL, 1800, RIFLE_STOCK);

			ITEM(YL_QBZ95_1_MY2, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ95_1_MY3, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ95_1_GL, 1750, RIFLE_STOCK); //Same thing with Railing and Optics.

			ITEM(YL_QBZ95_1B, 1150, RIFLE_STOCK); //Above Comments
			ITEM(YL_QBZ95_1B_MY, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ95_1B_MY_GL, 1800, RIFLE_STOCK);
			ITEM(YL_QBZ95_1B_GL, 1750, RIFLE_STOCK);

			ITEM(YL_QBZ97_1, 1150, RIFLE_STOCK);
			ITEM(YL_QBZ97_1_DDHA1, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ97_1_DDHA2, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ97_1_DDHB1, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ97_1_DDHB2, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ97_1_MY2_GL, 1800, RIFLE_STOCK);

			ITEM(YL_QBZ97_1_MY2, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ97_1_MY3, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ97_1_GL, 1750, RIFLE_STOCK);

			ITEM(YL_QBZ97_1B, 1150, RIFLE_STOCK);
			ITEM(YL_QBZ97_1B_MY, 1200, RIFLE_STOCK);
			ITEM(YL_QBZ97_1B_MY_GL, 1800, RIFLE_STOCK);
			ITEM(YL_QBZ97_1B_GL, 1750, RIFLE_STOCK);

			ITEM(YL_TYPE03, 900, RIFLE_STOCK); //Railing Optic Thing
			ITEM(YL_TYPE03_SEK, 1000, RIFLE_STOCK);

			ITEM(YL_Type63, 700, RIFLE_STOCK); //Has only Iron Sights

			ITEM(YL_Type63_TL, 1100, RIFLE_STOCK);
			ITEM(YL_Type63_TL_blue, 1100, RIFLE_STOCK);
			ITEM(YL_Type63_TL_pink, 1100, RIFLE_STOCK);
			ITEM(YL_Type63_TL_sand, 1100, RIFLE_STOCK);

			ITEM(YL_Type63_TS, 1000, RIFLE_STOCK);
			ITEM(YL_Type63_TS_blue, 1000, RIFLE_STOCK);
			ITEM(YL_Type63_TS_pink, 1000, RIFLE_STOCK);
			ITEM(YL_Type63_TS_sand, 1000, RIFLE_STOCK);

			ITEM(YL_Type81, 800, RIFLE_STOCK); //Only Iron Sights
			ITEM(YL_Type81_1, 800, RIFLE_STOCK);
			ITEM(YL_Type81_2, 800, RIFLE_STOCK);

			ITEM(YL_Type81_1C, 700, RIFLE_STOCK);
			ITEM(YL_Type81_1CM, 900, RIFLE_STOCK); //Has Rails

			ITEM(YL_Type81_QS1, 1100, RIFLE_STOCK);
			ITEM(YL_Type81_QS1G, 1100, RIFLE_STOCK);
			ITEM(YL_Type81_QS2L, 1100, RIFLE_STOCK);
			ITEM(YL_Type81_QS2S, 1100, RIFLE_STOCK);

			ITEM(YL_Type81_QS2SC, 1000, RIFLE_STOCK);

		};

		class sniperRiflesYLA 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(YL_QBU191_BOLT, 2200, RIFLE_STOCK);

			ITEM(YL_QBU88, 1600, RIFLE_STOCK);
			ITEM(YL_QBU88_T, 1800, RIFLE_STOCK); //Has Railings

		};

		class mgYLA 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(YL_QBZ191_BELT, 1600, RIFLE_STOCK);
			ITEM(YL_QBZ191_BELT_MAG, 1550, RIFLE_STOCK); //Slower FR

			ITEM(YL_QJB201, 1400, RIFLE_STOCK);

			ITEM(YL_QJS201, 1350, RIFLE_STOCK);
			ITEM(YL_QJS201_Retrofit, 1350, RIFLE_STOCK);

			ITEM(YL_QJY201, 1250, RIFLE_STOCK);

		};

		class smgYLA 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(YL_QCQ171_CM_ACR, 500, RIFLE_STOCK);
			ITEM(YL_QCQ171_CM_MPX, 500, RIFLE_STOCK);
			ITEM(YL_QCQ171_CM, 500, RIFLE_STOCK);
			ITEM(YL_QCQ171_DM, 500, RIFLE_STOCK);
			ITEM(YL_QCQ171, 500, RIFLE_STOCK);

			ITEM(YL_Type64, 400, RIFLE_STOCK); //Iron Sights Only
			ITEM(YL_Type64_TL, 500, RIFLE_STOCK);
			ITEM(YL_Type64_TS, 500, RIFLE_STOCK);

			ITEM(YL_Type79, 400, RIFLE_STOCK); //Iron Sights Only
			ITEM(YL_Type79_HY1, 500, RIFLE_STOCK);
			ITEM(YL_Type79_HY2, 500, RIFLE_STOCK);

			ITEM(YL_Type79_HY4, 500, RIFLE_STOCK);
			ITEM(YL_Type79_HY4_GOLD, 500, RIFLE_STOCK);
		};

		class pointersYLA 
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_ylarms", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(YL_ACC_SIDE_IR, 75, PN_STOCK);
			ITEM(YL_qsz92_lssd_flashlight, 75, PN_STOCK);

		};

		class muzzlesYLA 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(Byonet_95_F, 75, MZ_STOCK);
			ITEM(yl_81_Bayonet, 75, MZ_STOCK);

			ITEM(YL_QBS09_compsetor, 150, MZ_STOCK);
			ITEM(YL_qbs09_Silencer, 150, MZ_STOCK);

			ITEM(yl_muzzle_snds_58, 200, MZ_STOCK);
			ITEM(yl_muzzle_snds_95_my, 200, MZ_STOCK);
			ITEM(yl_muzzle_snds_191, 200, MZ_STOCK);

			ITEM(yl_muzzle_snds_9mm, 150, MZ_STOCK);

			ITEM(YL_92a_Silencer_SW, 150, MZ_STOCK);
			ITEM(YL_QSZ92A_compestor_SW, 150, MZ_STOCK);

			ITEM(yl_muzzle_snds_762, 200, MZ_STOCK);

			ITEM(yl_muzzle_snds_T64, 200, MZ_STOCK);

			ITEM(yl_muzzle_snds_T79, 200, MZ_STOCK);

		};

		class opticsYLA 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class HOLOSUN_510C_B {
				price = 250;
				stock = 50;
			};

			class HOLOSUN_510C_G {
				price = 250;
				stock = 50;
			};

			class HOLOSUN_510C_B_3XDOWN {
				price = 275;
				stock = 50;
			};

			class HOLOSUN_510C_B_3XUP_2D {
				price = 275;
				stock = 50;
			};

			class HOLOSUN_510C_B_3XUP {
				price = 275;
				stock = 50;
			};

			class HOLOSUN_510C_G_3XUP_2D {
				price = 275;
				stock = 50;
			};

			class HOLOSUN_510C_G_3XDOWN {
				price = 275;
				stock = 50;
			};

			class HOLOSUN_510C_G_3XUP {
				price = 275;
				stock = 50;
			};

			class YL_HOLOSUN_EPS_CARRY {
				price = 250;
				stock = 50;
			};

			class YL_mgl95 {
				price = 450;
				stock = 10;
			}; //NVG Scope

			class YL_S88 {
				price = 300;
				stock = 25;
			};

			class YL_qmk152 {
				price = 250;
				stock = 50;
			};

			class YL_qmk171 {
				price = 250;
				stock = 50;
			};

			class YL_qmk191 {
				price = 400;
				stock = 20;
			};

			class yl_qmk201_2d {
				price = 300;
				stock = 50;
			};

			class YL_xma95 {
				price = 300;
				stock = 50;
			};

			class YL_lpvo_8x {
				price = 400;
				stock = 20;
			};

			class YL_lpvo_8x_02 {
				price = 400;
				stock = 20;
			};

		};

		class magazinesYLA 
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";


			///////////////////////////////////////////////////////
			// Pistols, SMGs
			///////////////////////////////////////////////////////

			class YL_30Rnd_9x19_DAP92_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			
			class YL_30Rnd_9x19_DAP92_T_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};

			class YL_30Rnd_9x19_DAP92_N_Mag {
				price = 30;
				stock = MAGAZINE_STOCK;
			};

			class YL_92A_15Rnd_issued {
				price = 15;
				stock = MAGAZINE_STOCK;
			};

			class YL_92A_15Rnd_issued_Subsonic {
				price = 15;
				stock = MAGAZINE_STOCK;
			};

			class YL_92B_15Rnd_issued {
				price = 15;
				stock = MAGAZINE_STOCK;
			};

			class YL_92B_15Rnd_issued_Subsonic {
				price = 15;
				stock = MAGAZINE_STOCK;
			};

			class YL_92A_30Rnd_issued {
				price = 30;
				stock = MAGAZINE_STOCK;
			};

			class YL_92A_30Rnd_issued_Subsonic {
				price = 30;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////

			class YL_10rnd_58x42_DBP191_Mag {
				price = 50;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP10A_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP10A_T_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP10A_N_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP191_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP191_T_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP191_N_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP95_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP95_Mag_T {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP95_Mag_N {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBS191_Mag {
				price = 80;
				stock = MAGAZINE_STOCK;
			}; //Neat. Underwater Magazine

			class YL_30rnd_58x42_DBP10A_Mag_MY {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP10A_N_Mag_MY {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_30rnd_58x42_DBP10A_T_Mag_MY {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class YL_75rnd_58x42_DBP10A_N_cmag {
				price = 120;
				stock = MAGAZINE_STOCK;
			};

			class YL_75rnd_58x42_DBP10A_cmag {
				price = 120;
				stock = MAGAZINE_STOCK;
			};

			class YL_75rnd_58x42_DBP10A_T_cmag {
				price = 120;
				stock = MAGAZINE_STOCK;
			};

			class YL_100rnd_58x42_DBP191_cmag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class YL_100rnd_58x42_DBP191_T_cmag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class YL_100rnd_58x42_DBP191_N_cmag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class Type63_20Rnd_762x39_b {
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			class Type63_20Rnd_762x39_t {
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			class Type63_30Rnd_762x39_b {
				price = 90;
				stock = MAGAZINE_STOCK;
			};

			class Type63_30Rnd_762x39_t {
				price = 90;
				stock = MAGAZINE_STOCK;
			};

			class Type81_30Rnd_pmag_ap {
				price = 100;
				stock = MAGAZINE_STOCK;
			};

			class Type81_30Rnd_mag {
				price = 90;
				stock = MAGAZINE_STOCK;
			};

			class Type81_30Rnd_mag_t {
				price = 90;
				stock = MAGAZINE_STOCK;
			};

			class YL_Type64_30Rnd_762x25 {
				price = 65;
				stock = MAGAZINE_STOCK;
			};

			class YL_Type79_20Rnd_762x25_T {
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			class YL_Type79_20Rnd_762x25_N {
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			class YL_Type79_20Rnd_762x25 {
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			class YL_Type79_30Rnd_762x25_T {
				price = 70;
				stock = MAGAZINE_STOCK;
			};

			class YL_Type79_30Rnd_762x25_N {
				price = 70;
				stock = MAGAZINE_STOCK;
			};

			class YL_Type79_30Rnd_762x25 {
				price = 70;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////
			class YL_10rnd_58x42_DVC12_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class YL_10rnd_58x42_DVP88_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class YL_20rnd_58x42_DVC12_Mag {
				price = 175;
				stock = MAGAZINE_STOCK;
			};

			class YL_20rnd_58x42_DVP88_Mag {
				price = 175;
				stock = MAGAZINE_STOCK;
			};
	
			///////////////////////////////////////////////////////
			// MGs
			///////////////////////////////////////////////////////

			class YL_150rnd_58x42_DBP191_Mag {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class YL_150rnd_58x42_DBP191T_Mag {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class YL_150rnd_58x42_DBP191N_Mag {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class YL_100rnd_762x51_DJP201_Mag {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			class YL_100rnd_762x51_DJP201_Mag_T {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			class YL_100rnd_762x51_DJP201_Mag_N {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

		};

		class underbarrelYLA{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(yl_191_bipod, 50, 20);
			ITEM(191_grip, 50, 20);
			ITEM(yl_hdstp, 50, 20);
			ITEM(YLWB_01, 50, 20);
		};

		class specialWeaponsYLA
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ylarms", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(Rep_QBS09YL_mod_cqb_sa, 250, PISTOL_STOCK); //Both are Shotgun secondaries.
			ITEM(Rep_QBS09YL_base_cqb_sa, 250, PISTOL_STOCK); //
			ITEM(YL_QCQ171_PDW, 250, PISTOL_STOCK); //Secondary SMG

			ITEM(Rep_QBS09YL_modA, 300, RIFLE_STOCK);
			ITEM(Rep_QBS09YL_mod_cqb, 300, RIFLE_STOCK);
			ITEM(Rep_QBS09YL_modB, 300, RIFLE_STOCK);
			ITEM(Rep_QBS09YL_base_cqb, 300, RIFLE_STOCK);
			ITEM(Rep_QBS09YL_base, 300, RIFLE_STOCK);
			ITEM(6Rnd_M1014_buck, 60, MAGAZINE_STOCK);
			ITEM(6Rnd_QBS09_HE, 150, MAGAZINE_STOCK);
			ITEM(6Rnd_M1014_PPA, 60, MAGAZINE_STOCK);
			ITEM(6Rnd_M1014_slug, 75, MAGAZINE_STOCK);

			ITEM(YL_QBZ191_EL, 3000, 5); //Fucking AWESOME. Has a ridiculous amount of Impact. Might need to be tested more.
			ITEM(YL_30rnd_58x42_EL_Mag, 450, MAGAZINE_STOCK); //2000 m/s rounds lmao. Basically playing Starsim. For Electormagnetic Gun Above.
		};