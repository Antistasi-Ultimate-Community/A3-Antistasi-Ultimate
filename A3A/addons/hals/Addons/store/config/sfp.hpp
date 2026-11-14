		//SFP Sweden
		class handgunsswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(sfp_p226, 110, PISTOL_STOCK) //AMMO: sfp_15Rnd_9x19_Mag
			ITEM(sfp_p88, 110, PISTOL_STOCK) //AMMO: sfp_17Rnd_9x19_Mag
			ITEM(sfp_revolver58, 100, PISTOL_STOCK) //AMMO: sfp_6nd_9x29_Mag
			ITEM(sfp_signpist50, 50, PISTOL_STOCK) //AMMO: sfp_1rnd_lyspatron7_mag

		};

		class smgswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(sfp_cbj_ms, 225, RIFLE_STOCK) // Ammo: sfp_30Rnd_650x25mag	sfp_30Rnd_650x25mag_subsonic
			ITEM(sfp_kpistm45, 235, RIFLE_STOCK) // Ammo: sfp_36Rnd_9mm_kpistm45	sfp_71Rnd_9mm_kpistm45
			ITEM(sfp_kpistm45b, 220, RIFLE_STOCK) // Ammo: sfp_36Rnd_9mm_kpistm45
			ITEM(sfp_mp5, 280, RIFLE_STOCK) // Ammo: sfp_30Rnd_9mm_mp5
			ITEM(sfp_mp5_rail, 320, RIFLE_STOCK) // Ammo: sfp_30Rnd_9mm_mp5_JHP

		};
		
		class mgswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(sfp_ksp58a, 600, RIFLE_STOCK) //Ammo: sfp_50Rnd_655x55_ksp58
			ITEM(sfp_ksp58, 650, RIFLE_STOCK) //Ammo: sfp_100Rnd_762x51_ksp58
			ITEM(sfp_ksp58B2, 680, RIFLE_STOCK) //Ammo: sfp_249Rnd_762x51_ksp58
			ITEM(sfp_ksp58f, 650, RIFLE_STOCK) //Ammo: sfp_50Rnd_762x51_ksp58_ap
			ITEM(sfp_ksp90b, 550, RIFLE_STOCK) //Ammo: sfp_200Rnd_556x45_ksp90
			ITEM(sfp_ksp90c, 580, RIFLE_STOCK) //Ammo: sfp_200Rnd_556x45_ksp90_irtracer
			
		};

		class riflesswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			
			ITEM(sfp_ak5, 325, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag
			ITEM(sfp_ak5_m203, 445, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag_plastic
			ITEM(sfp_ak5b, 365, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag_irtracer
			ITEM(sfp_ak5c, 380, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag_irtracer_plastic
			ITEM(sfp_ak5c_alt, 360, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag_tracer
			ITEM(sfp_ak5c_blk, 360, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag_tracer_plastic
			ITEM(sfp_ak5c_m203, 460, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag
			ITEM(sfp_ak5c_m203_blk, 460, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag
			ITEM(sfp_ak5d, 350, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag
			ITEM(sfp_ak5dmk2, 360, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag
			ITEM(sfp_cga5p, 360, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag
			ITEM(sfp_g36c, 320, RIFLE_STOCK) //Ammo: sfp_30Rnd_556x45_Stanag_g36

		};

		class sniperriflesswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(sfp_ak4, 400, RIFLE_STOCK) // Ammo: sfp_20Rnd_762x51_ak4
			ITEM(sfp_ak4_m203, 530, RIFLE_STOCK) // Ammo: sfp_20Rnd_762x51_ak4_ap
			ITEM(sfp_ak4b, 450, RIFLE_STOCK) // Ammo: sfp_20Rnd_762x51_ak4_tracer
			ITEM(sfp_ak4b_m203, 570, RIFLE_STOCK) // Ammo: sfp_20Rnd_762x51_ak4_irtracer
			ITEM(sfp_ak4c, 480, RIFLE_STOCK) // Ammo: sfp_20Rnd_762x51_ak4
			ITEM(sfp_ak4d, 500, RIFLE_STOCK) // Ammo: sfp_20Rnd_762x51_ak4
			ITEM(sfp_psg90_base, 580, RIFLE_STOCK) // Ammo: sfp_9Rnd_762x51_psg90	sfp_9Rnd_762x51_psg90_prick
			ITEM(sfp_psg90_camo, 580, RIFLE_STOCK) // Ammo: sfp_9Rnd_762x51_psg90_tracer
			ITEM(sfp_ag90_base, 1000, RIFLE_STOCK) // Ammo: sfp_10Rnd_127x99_ag90
			
		};

		class launchersswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			
			ITEM(sfp_pskott68, 500, 25) 
			ITEM(sfp_pskott86, 550, 25)
			ITEM(sfp_rb57, 800, 25)
			ITEM(sfp_grg48, 650, 25)
			ITEM(sfp_grg86, 750, 25)
			ITEM(sfp_rbs69, 500, 25)
			
		}; 

		class launchermagazinesswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(sfp_grg_smoke_mag, 100, 15)
			ITEM(sfp_grg_illum_mag, 100, 15)
			ITEM(sfp_grg_he_mag, 300, 15)
			ITEM(sfp_grg_heat_62_mag, 300, 15)
			ITEM(sfp_grg_heat_66_mag, 320, 15)
			ITEM(sfp_grg_heat_mag, 350, 15)
			ITEM(sfp_rbs69_mag, 200, 15)
			
		};

		class magazinesswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(sfp_15Rnd_9x19_Mag, 15, MZ_STOCK)
            ITEM(sfp_17Rnd_9x19_Mag, 16, MZ_STOCK)
            ITEM(sfp_6nd_9x29_Mag, 10, MZ_STOCK)
            ITEM(sfp_1rnd_lyspatron7_mag, 5, MZ_STOCK)
            ITEM(sfp_30Rnd_650x25mag, 25, MZ_STOCK)
            ITEM(sfp_30Rnd_650x25mag_subsonic, 25, MZ_STOCK)
            ITEM(sfp_36Rnd_9mm_kpistm45, 30, MZ_STOCK)
            ITEM(sfp_71Rnd_9mm_kpistm45, 60, MZ_STOCK)
            ITEM(sfp_30Rnd_9mm_mp5, 35, MZ_STOCK)
            ITEM(sfp_30Rnd_9mm_mp5_JHP, 40, MZ_STOCK)
            ITEM(sfp_50Rnd_655x55_ksp58, 100, MZ_STOCK)
            ITEM(sfp_100Rnd_762x51_ksp58, 150, MZ_STOCK)
            ITEM(sfp_249Rnd_762x51_ksp58, 200, MZ_STOCK)
            ITEM(sfp_50Rnd_762x51_ksp58_ap, 120, MZ_STOCK)
            ITEM(sfp_200Rnd_556x45_ksp90, 200, MZ_STOCK) 
			ITEM(sfp_200Rnd_556x45_ksp90_irtracer, 200, MZ_STOCK)
            ITEM(sfp_30Rnd_556x45_Stanag, 50, MZ_STOCK)
            ITEM(sfp_30Rnd_556x45_Stanag_plastic, 50, MZ_STOCK)
            ITEM(sfp_30Rnd_556x45_Stanag_irtracer, 50, MZ_STOCK)
            ITEM(sfp_30Rnd_556x45_Stanag_irtracer_plastic, 50, MZ_STOCK) 			
			ITEM(sfp_30Rnd_556x45_Stanag_tracer, 50, MZ_STOCK)
            ITEM(sfp_30Rnd_556x45_Stanag_tracer_plastic, 50, MZ_STOCK)
            ITEM(sfp_30Rnd_556x45_Stanag_g36, 50, MZ_STOCK)
            ITEM(sfp_20Rnd_762x51_ak4, 60, MZ_STOCK)
            ITEM(sfp_20Rnd_762x51_ak4_ap, 65, MZ_STOCK)
            ITEM(sfp_20Rnd_762x51_ak4_tracer, 60, MZ_STOCK)
            ITEM(sfp_20Rnd_762x51_ak4_irtracer, 60, MZ_STOCK)
            ITEM(sfp_9Rnd_762x51_psg90, 80, MZ_STOCK)
            ITEM(sfp_9Rnd_762x51_psg90_prick, 90, MZ_STOCK)
            ITEM(sfp_9Rnd_762x51_psg90_tracer, 80, MZ_STOCK)
            ITEM(sfp_10Rnd_127x99_ag90, 200, MZ_STOCK)

		};

		class pointersswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_pointers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(sfp_dbal2, 70, PN_STOCK)

		};

		class specialweaponsswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			
			ITEM(sfp_remington870, 300, RIFLE_STOCK) // sfp_12Gauge_8rd_Pellets
			ITEM(sfp_remington870_chrome, 400, RIFLE_STOCK) // sfp_12Gauge_8rd_Slug
			ITEM(sfp_remington870_wood_chrome, 400, RIFLE_STOCK)
			ITEM(sfp_remington870_wood_blue, 400, RIFLE_STOCK)
			
		};

		class opticsswe{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			
			ITEM(sfp_optic_aimpoint, 150, MAGAZINE_STOCK)
			ITEM(sfp_optic_3x_aimpoint, 250, MAGAZINE_STOCK)
			ITEM(sfp_optic_aimpoint_t1, 150, MAGAZINE_STOCK)
			ITEM(sfp_optic_kikarsikte09_4x, 350, MAGAZINE_STOCK)
			ITEM(sfp_optic_kikarsikte90b_10x, 450, MAGAZINE_STOCK)
			ITEM(sfp_optic_susat_4x, 250, MAGAZINE_STOCK)
			
		};

		class underbarrelswe{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sfp", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(sfp_ksp58_snow_support, 50, 20)
		};
