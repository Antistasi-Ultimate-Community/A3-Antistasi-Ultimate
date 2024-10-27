		//FFP Finland
		class handgunsffp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ffp", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(ffp_pist2008, 110, PISTOL_STOCK); //AMMO: ffp_17rnd_9x9_mag
		};

		class mgffp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ffp", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(ffp_KVKK, 600, RIFLE_STOCK); //Ammo: ffp_100Rnd_KVKK_mag/ffp_100Rnd_KVKK_mag_Tracer
			ITEM(ffp_kk_pkm, 650, RIFLE_STOCK); //Ammo: ffp_100Rnd_762x54_pkm/ffp_100Rnd_762x54_pkm_Tracer
			
		};

		class riflesffp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ffp", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			
			ITEM(ffp_rk62, 325, RIFLE_STOCK); //Ammo: ffp_30Rnd_762x39/ffp_30Rnd_762x39_tracer
			ITEM(ffp_rk95, 445, RIFLE_STOCK); //Ammo: ffp_30Rnd_762x39/ffp_30Rnd_762x39_tracer

		};

		class sniperriflesffp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ffp", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(ffp_TKiv2000, 800, RIFLE_STOCK); // Ammo: ffp_5Rnd_TKiv2000_mag
			
		};

		class launchersffp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ffp", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			
			ITEM(ffp_nlaw, 750, 25); // ffp_nlaw_mag
			ITEM(ffp_Apilas, 500, 25);
			ITEM(ffp_66kes12, 400, 25);
			ITEM(ffp_66kes12_rak, 400, 25);
			ITEM(ffp_kes88, 400, 25);
			ITEM(ffp_ito15, 750, 25); // ffp_ito15_mag
			
		}; 

		class launchermagazinesffp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ffp", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(ffp_nlaw_mag, 150, 15);
			ITEM(ffp_ito15_mag, 200, 15);
			
		};

		class magazinesffp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ffp", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(ffp_5Rnd_TKiv2000_mag, 200, MZ_STOCK);
			ITEM(ffp_100Rnd_KVKK_mag, 120, MZ_STOCK);
			ITEM(ffp_100Rnd_KVKK_mag_Tracer, 120, MZ_STOCK);
			ITEM(ffp_100Rnd_762x54_pkm, 120, MZ_STOCK);
			ITEM(ffp_100Rnd_762x54_pkm_Tracer, 120, MZ_STOCK);
			ITEM(ffp_30Rnd_762x39, 100, MZ_STOCK);
			ITEM(ffp_30Rnd_762x39_tracer, 100, MZ_STOCK);
			ITEM(ffp_17rnd_9x9_mag, 40, MZ_STOCK);

		};

		class opticsffp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ffp", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			
			ITEM(ffp_ta11_2d, 250, MAGAZINE_STOCK);
			ITEM(ffp_ta11_3d, 250, MAGAZINE_STOCK);
			ITEM(ffp_pp04, 150, MAGAZINE_STOCK);
			ITEM(ffp_pp09, 150, MAGAZINE_STOCK);
			ITEM(ffp_optic_TKiv2000, 450, MAGAZINE_STOCK);
			
		};
