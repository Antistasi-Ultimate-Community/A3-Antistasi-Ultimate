		class handgunsHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(HAFM_Colt1911, 200, PISTOL_STOCK);// HAFM_1911_Mag
            ITEM(HAFM_G17C, 150, PISTOL_STOCK);// HAFM_G17C_Mag
            ITEM(HAFM_sig226, 170, PISTOL_STOCK);// HAFM_sig226
		};

		class smgHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(HAFM_MP5A4, 200, RIFLE_STOCK);// HAFM_MP5A4_Mag
            ITEM(HAFM_MP5A4_EOD, 500, RIFLE_STOCK);// UGL | HAFM_MP5A4_Mag
		};
		
		class mgHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(HAFM_M60E4, 1250, RIFLE_STOCK);// HAFM_M60_762
            ITEM(HAFM_M249, 1250, RIFLE_STOCK);// HAFM_M249_556
            ITEM(HAFM_HK21, 1400, RIFLE_STOCK);// HAFM_HK21_762
		};

		class riflesHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
            ITEM(HAFM_m4dd_short, 800, RIFLE_STOCK);// hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
            ITEM(HAFM_m4ddGL_short, 1200, RIFLE_STOCK);// UGL | hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
            ITEM(HAFM_m4ddGL320_short, 1250, RIFLE_STOCK);// Better UGL? | hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
            ITEM(HAFM_m4ddv5_long, 900, RIFLE_STOCK);// M4DD But Heavier and Longer Shaft | hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
            ITEM(HAFM_G36C, 800, RIFLE_STOCK);// HAFM_G36C_mag
            ITEM(HAFM_G36C_M320, 1200, RIFLE_STOCK);// UGL | HAFM_G36C_mag
            ITEM(HAFM_G3A3, 800, RIFLE_STOCK);// HAFM_20rnd_G3A3_762
            ITEM(HAFM_G3A3_GL, 1200, RIFLE_STOCK);// UGL | HAFM_20rnd_G3A3_762
            ITEM(HAFM_G3A3RIS, 900, RIFLE_STOCK);// HAFM_20rnd_G3A3_762
            ITEM(HAFM_G3A4, 800, RIFLE_STOCK);// HAFM_20rnd_G3A3_762
            ITEM(HAFM_G3A3_SG, 800, RIFLE_STOCK);// HAFM_20rnd_G3A3_762
            ITEM(HAFM_HK416, 800, RIFLE_STOCK);// M4DD But Cooler Looking | hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
            ITEM(HAFM_HK416GL, 1250, RIFLE_STOCK);// M4DD But Cooler Looking and UGL | hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
            ITEM(HAFM_M4A1, 800, RIFLE_STOCK);// M4DD But Older | hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
            ITEM(HAFM_M4A1_EMPTY, 800, RIFLE_STOCK);// M4DD But Older | hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
            ITEM(HAFM_M4A1_M203, 1200, RIFLE_STOCK);// M4DD But Older and UGL | hafm_mag_30Rnd_556x45_M855_Stanag/hafm_mag_30Rnd_556x45_M855A1_Stanag/hafm_mag_30Rnd_556x45_Mk318_Stanag
        };

		class sniperriflesHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(HAFM_M14_EMPTY, 2550, RIFLE_STOCK);// HAFM_20rnd_M14_762
            ITEM(HAFM_M110_EMPTY, 3250, RIFLE_STOCK);// HAFM_20rnd_M110_762
            ITEM(HAFM_M107_EMPTY, 4500, RIFLE_STOCK);// HAFM_10rnd_M107
		};

		class launchersHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			ITEM(hafm_gustav, 1250, 20);
            ITEM(HAFM_fgm148, 3250, 3);// hafm_fgm148_magazine_AT
            ITEM(HAFM_M136_Loaded, 750, LAUNCHER_STOCK);// Disposable
            ITEM(HAFM_M136_hedp_Loaded, 750, LAUNCHER_STOCK);// Disposable
            ITEM(HAFM_M136_hp_Loaded, 750, LAUNCHER_STOCK);// Disposable
            ITEM(HAFM_M72_Loaded, 750, LAUNCHER_STOCK);// Disposable
		}; 

		class launchermagazinesHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			ITEM(hafm_fgm148_magazine_AT, 300, 10);
		};

		class muzzlesHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";
			
			ITEM(HAFM_M4_muzzle_snds_556, 50, MZ_STOCK);
            ITEM(HAFM_M249_muzzle, 50, MZ_STOCK);
            ITEM(HAFM_Mad_556_muzzle, 50, MZ_STOCK);
            ITEM(HAFM_G3_762_muzzle, 60, MZ_STOCK);
            ITEM(HAFM_Gem_762_muzzle, 60, MZ_STOCK);
            ITEM(HAFM_MP5_muzzle_snds_9mm, 25, MZ_STOCK);
		};

		class magazinesHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(hafm_mag_30Rnd_556x45_M855_Stanag, 100, MZ_STOCK);
            ITEM(hafm_mag_30Rnd_556x45_M855A1_Stanag, 100, MZ_STOCK);
            ITEM(hafm_mag_30Rnd_556x45_Mk318_Stanag, 100, MZ_STOCK);
            ITEM(hafm_mag_arrow, 80, MZ_STOCK);
            ITEM(HAFM_20rnd_G3A3_762, 150, MZ_STOCK);
            ITEM(HAFM_HK21_762, 150, MZ_STOCK);
            ITEM(HAFM_20rnd_M14_762, 150, MZ_STOCK);
            ITEM(HAFM_20rnd_M110_762, 150, MZ_STOCK);
            ITEM(HAFM_M249_556, 150, MZ_STOCK);
            ITEM(HAFM_M60_762, 150, MZ_STOCK);
            ITEM(HAFM_MP5A4_Mag, 80, MZ_STOCK);
            ITEM(HAFM_10rnd_M107, 400, MZ_STOCK);
		};

		class pointersHAFM{
			displayName = __EVAL(formatText ["%1 %2 %3 %4 %5", localize "STR_A3AU_hafm", localize "STR_A3AU_pointers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(HAFM_acc_PEQ15_side, 100, PN_STOCK);
            ITEM(HAFM_flashlight_trl, 70, PN_STOCK);
            ITEM(HAFM_acc_flashlight_mp5, 40, PN_STOCK);
		};

		class specialweaponsHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(hafm_crossbow, 300, RIFLE_STOCK);// Really Cool | hafm_mag_arrow/hafm_mag_arrow_exp
		};

		class opticsHAFM{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			ITEM(HAFM_acog_rmr, 200, 100);
            ITEM(HAFM_acog_ard_rmr, 230, 100);
            ITEM(HAFM_Mark_Scope, 300, 100);
            ITEM(HAFM_Comp_m3, 150, 100);
            ITEM(HAFM_Comp_m3_low, 150, 100);
            ITEM(HAFM_Comp_m4, 150, 100);
            ITEM(HAFM_optic_ELCAN, 200, 100);
            ITEM(HAFM_Elcan_Spectre, 200, 100);
            ITEM(HAFM_Elcan_Spectre_ARD, 200, 100);
            ITEM(HAFM_Elcan_Spectre_ARD_RMR, 230, 100);
            ITEM(HAFM_Eotech_553, 150, 100);
            ITEM(HAFM_Eotech_553_tan, 150, 100);
            ITEM(HAFM_scope_optic_m107, 300, 100);
            ITEM(HAFM_M68, 150, 100);
            ITEM(HAFM_M110v2_scope, 300, 100);
            ITEM(HAFM_Mk4_LRT, 500, 100);
		};

		class underbarrelHAFM{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_hafm", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(HAFM_Harris_Bipod, 100, 50);
		};
