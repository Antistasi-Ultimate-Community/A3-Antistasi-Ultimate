		///////////////////////////////////////////////////////
		// CWR
		///////////////////////////////////////////////////////
		class handgunsCWR 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(cwr3_hgun_aps, 150, PISTOL_STOCK); // cwr3_20rnd_9x18_aps_m

		};

		class smgCWR 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(cwr3_smg_sterling, 350, PISTOL_STOCK); // cwr3_30rnd_sterling_m
			ITEM(cwr3_smg_sterling_sd, 700, RIFLE_STOCK);
			ITEM(cwr3_smg_uzi, 300, RIFLE_STOCK); // CUP_32Rnd_9x19_UZI_M
			ITEM(cwr3_smg_uzi_sd, 350, RIFLE_STOCK); // CUP_72Rnd_9x19_UZI_M

		};

		class launchersCWR 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(cwr3_launch_at4, 350, 50); // cwr3_at4_heat_m
			ITEM(cwr3_launch_carlgustaf, 450, 50); // cwr3_carlgustaf_heat_m cwr3_carlgustaf_hedp_m

			ITEM(cwr3_launch_redeye, 550, 50);

			ITEM(cwr3_launch_m67_rcl, 600, 50); // cwr3_m67_rcl_heat_m
			ITEM(cwr3_launch_m72a3, 300, 50);
			ITEM(cwr3_launch_rpg75, 300, 50);

		};

		class launcherMagazinesCWR 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			class cwr3_at4_heat_m {
				price = 200;
				stock = 50;
			};
			class cwr3_carlgustaf_hedp_m {
				price = 300;
				stock = 50;
			};
			class cwr3_carlgustaf_heat_m {
				price = 250;
				stock = 50;
			};
			class cwr3_m67_rcl_heat_m {
				price = 500;
				stock = 50;
			};

		};

		class specialWeaponsCWR 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(cwr3_glaunch_mm1, 800, RIFLE_STOCK); // cwr3_12rnd_mm1_m

		};

		class sniperRiflesCWR 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(cwr3_arifle_fnfal_hlag, 550, RIFLE_STOCK); // CUP_20Rnd_762x51_FNFAL_M
			ITEM(cwr3_arifle_l1a1, 450, RIFLE_STOCK); 
			ITEM(cwr3_arifle_l1a1_wood, 500, RIFLE_STOCK);
			ITEM(cwr3_srifle_l42a1, 400, RIFLE_STOCK); // CUP_5Rnd_762x51_M24

		};

		class mgCWR 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(cwr3_arifle_fnfalo, 700, RIFLE_STOCK); // CUP_30Rnd_762x51_FNFAL_M
			ITEM(cwr3_lmg_bren, 800, RIFLE_STOCK); // cwr3_30rnd_762x51_bren_m
			ITEM(cwr3_arifle_l86a1, 1200, RIFLE_STOCK); // CUP_60Rnd_556x45_SureFire
			ITEM(cwr3_arifle_m16a1_lsw, 600, RIFLE_STOCK);
			ITEM(cwr3_arifle_m16a1e1_lsw, 2050, RIFLE_STOCK);
			ITEM(cwr3_lmg_m60e3, 2000, RIFLE_STOCK); // CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M

		};

		class riflesCWR 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(cwr3_arifle_akm, 400, RIFLE_STOCK); // CUP_30Rnd_762x39_AK47_M
			ITEM(cwr3_arifle_l85a1, 500, RIFLE_STOCK); // CUP_30Rnd_556x45_Stanag_L85
			ITEM(cwr3_arifle_xm177e2, 700, RIFLE_STOCK);
			ITEM(cwr3_arifle_xm177e2_m203, 950, RIFLE_STOCK);
			ITEM(cwr3_arifle_xms, 650, RIFLE_STOCK);
			ITEM(cwr3_arifle_xms_m203, 900, RIFLE_STOCK);
			ITEM(cwr3_arifle_xr47, 1050, RIFLE_STOCK);
			ITEM(cwr3_arifle_xr74, 1050, RIFLE_STOCK);

		};

		class magazinesCWR
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_cwr", localize "STR_A3AU_magazines", localize "STR_A3AU_and", localize "STR_A3AU_glGrenades"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			class cwr3_20rnd_9x18_aps_m {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class cwr3_30rnd_sterling_m {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class CUP_32Rnd_9x19_UZI_M {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class CUP_72Rnd_9x19_UZI_M {
				price = 80;
				stock = MAGAZINE_STOCK;
			};

			class cwr3_12rnd_mm1_m {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			
			class CUP_30Rnd_762x51_FNFAL_M {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			
			class cwr3_30rnd_762x51_bren_m {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			
			class CUP_60Rnd_556x45_SureFire {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			class CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M {
				price = 220;
				stock = MAGAZINE_STOCK;
			};
			
			class CUP_30Rnd_762x39_AK47_M {
				price = 100;
				stock = MAGAZINE_STOCK;
			};

			class CUP_30Rnd_556x45_Stanag_L85 {
				price = 110;
				stock = MAGAZINE_STOCK;
			};

		};

		class opticsCWR
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cwr", localize "STR_A3AU_sights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemOptic_ca.paa";

			class cwr3_optic_krr {
				price = 300;
				stock = 100;
			};

			class cwr3_optic_suit {
				price = 300;
				stock = 100;
			};
	
			class cwr3_optic_iws {
				price = 700;
				stock = 100;
			};
			
			class cwr3_optic_xms_cross {
				price = 300;
				stock = 100;
			};
			
			class cwr3_optic_xms_dot {
				price = 300;
				stock = 100;
			};
			

		};
