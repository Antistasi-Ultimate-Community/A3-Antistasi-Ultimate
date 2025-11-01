		//Pedagne
		class handgunsitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(ASZ_M84, 110, PISTOL_STOCK); //AMMO: 15Rnd_9x19_M9_ASZ
			ITEM(ASZ_M92, 130, PISTOL_STOCK); //AMMO: 15Rnd_9x19_M9SD_ASZ
			ITEM(ASZ_glock17, 140, PISTOL_STOCK); //AMMO: 16Rnd_9x21_Mag

		};
		
		class mgitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(ASZ_M249_base, 600, RIFLE_STOCK); //Ammo: 200Rnd_M249mag
			ITEM(ASZ_M249mk1_base, 650, RIFLE_STOCK); //Ammo: 200Rnd_M249mag

		};

		class riflesitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			
			ITEM(ASZ_AR7090, 245, RIFLE_STOCK); //Ammo: 20Rnd_556x45_Stanag_ASZ
			ITEM(ASZ_AR7090_gl, 345, RIFLE_STOCK); //Ammo: 20Rnd_556x45_Stanag_SD_ASZ
			ITEM(ASZ_ARX160, 365, RIFLE_STOCK); //Ammo: 30Rnd_556x45_Stanag_SD_ASZ
			ITEM(ASZ_ARX160_GLS, 470, RIFLE_STOCK); //Ammo: 30Rnd_556x45_Stanag_SD_ASZ
			ITEM(APD_ARX200, 420, RIFLE_STOCK); //Ammo: ASZ_20Rnd_762x51_Mag
			ITEM(ASZ_SC90, 300, RIFLE_STOCK); //Ammo: 30Rnd_556x45_Stanag_SD_ASZ
			ITEM(ASZ_SC90_gl, 400, RIFLE_STOCK); //Ammo: 30Rnd_556x45_Stanag_SD_ASZ
			ITEM(ASZ_SCS90, 290, RIFLE_STOCK); //Ammo: 30Rnd_556x45_Stanag_SD_ASZ
			ITEM(ASZ_M4A1, 400, RIFLE_STOCK); //Ammo: 30Rnd_556x45_Stanag_SD_ASZ
			
		};

		class sniperriflesitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(ASZ_M40A3_Des, 450, RIFLE_STOCK); // Ammo: 5Rnd_762x51_Mag_ASZ
			ITEM(ASZ_M40A3_Des_ghillie, 470, RIFLE_STOCK); // Ammo: 5Rnd_762x51_Mag_ASZ
			ITEM(ASZ_M40A3_Green, 450, RIFLE_STOCK); // Ammo: 5Rnd_762x51_Mag_ASZ
			ITEM(ASZ_M40A3_Green_ghillie, 470, RIFLE_STOCK); // Ammo: 5Rnd_762x51_Mag_ASZ
			ITEM(ASZ_SakoTRG42, 500, RIFLE_STOCK); // Ammo: 10Rnd_762x51_Mag_ASZ	5Rnd_762x51_Mag_ASZ
			ITEM(ASZ_MCM_tac50_blk, 800, RIFLE_STOCK); // Ammo: ASZ_5x127_Mag
			ITEM(ASZ_MCM_tac50_des, 800, RIFLE_STOCK); // Ammo: ASZ_5x127_Mag
			ITEM(ASZ_MCM_tac50_green, 800, RIFLE_STOCK); // Ammo: ASZ_5x127_Mag
			ITEM(ASZ_M107_des, 1000, RIFLE_STOCK); // Ammo: 7Rnd_408_Mag
			ITEM(ASZ_M107_blk, 1000, RIFLE_STOCK); // Ammo: 7Rnd_408_Mag

		};

		class launchersitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			
			ITEM(ASZ_PzF3_Loaded, 500, 25);
			ITEM(ASZ_Launch_Stinger, 600, 25); // ASZ_Stinger_Mag
		}; 

		class launchermagazinesitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(ASZ_Stinger_Mag, 250, 15);

		};

		class muzzlesitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";
			
			ITEM(asz_silencer_m4a1, 80, MZ_STOCK);
			ITEM(asz_silencer_556_blk, 80, MZ_STOCK);
			ITEM(asz_silencer_556_des, 80, MZ_STOCK);
			ITEM(asz_silencer_762_blk, 80, MZ_STOCK);
			ITEM(asz_silencer_762_des, 80, MZ_STOCK);
			
		};

		class magazinesitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(15Rnd_9x19_M9_ASZ, 17, MZ_STOCK);
            ITEM(15Rnd_9x19_M9SD_ASZ, 20, MZ_STOCK);
            ITEM(20Rnd_556x45_Stanag_ASZ, 35, MZ_STOCK);
            ITEM(20Rnd_556x45_Stanag_SD_ASZ, 35, MZ_STOCK);
            ITEM(ASZ_20Rnd_762x51_Mag_AP, 75, MZ_STOCK);
            ITEM(ASZ_20Rnd_762x51_Mag, 55, MZ_STOCK);
            ITEM(30Rnd_556x45_Stanag_SD_ASZ, 45, MZ_STOCK);
            ITEM(ASZ_20Rnd_762x51_Mag_SD, 55, MZ_STOCK);
            ITEM(ASZ_20Rnd_762x51_Mag_Tracer, 55, MZ_STOCK);
            ITEM(200Rnd_M249mag, 95, MZ_STOCK);
            ITEM(5Rnd_762x51_Mag_ASZ, 45, MZ_STOCK);
            ITEM(10Rnd_762x51_Mag_ASZ, 65, MZ_STOCK);
            ITEM(ASZ_5x127_Mag, 100, MZ_STOCK);		
            ITEM(6Rnd_HE_Grenade_shell_ASZ, 350, MZ_STOCK); 

		};

		class pointersitaly{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_italy", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(asz_flashlight, 70, PN_STOCK);
			ITEM(asz_pointer_blk, 70, PN_STOCK);
			ITEM(asz_pointer, 70, PN_STOCK);
			ITEM(asz_pointer_m4, 70, PN_STOCK);

		};

		class specialweaponsitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			
			ITEM(ASZ_M32, 600, RIFLE_STOCK); // 6Rnd_HE_Grenade_shell_ASZ
			ITEM(ASZ_Mk13, 400, RIFLE_STOCK);

		};

		class opticsitaly{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			
			ITEM(asz_acog, 200, MAGAZINE_STOCK);
			ITEM(asz_aimpoint_compm4s, 150, MAGAZINE_STOCK);
			ITEM(asz_aimpoint_pro_blk, 150, MAGAZINE_STOCK);
			ITEM(asz_aimpoint_pro_des, 150, MAGAZINE_STOCK);
			ITEM(asz_ams, 250, MAGAZINE_STOCK);
			ITEM(asz_eotech_blk, 150, MAGAZINE_STOCK);
			ITEM(asz_eotech_des, 150, MAGAZINE_STOCK);
			ITEM(asz_leupold_mk4_cqt, 300, MAGAZINE_STOCK);
			ITEM(asz_leupold_mk4_lrt_blk, 350, MAGAZINE_STOCK);
			ITEM(asz_leupold_mk4_mrt_black, 350, MAGAZINE_STOCK);
			ITEM(asz_leupold_mk4_mrt_des, 350, MAGAZINE_STOCK);
			ITEM(asz_leupold_vxr_patrol, 250, MAGAZINE_STOCK);
			ITEM(asz_schmidt_bender_lp, 350, MAGAZINE_STOCK);
			ITEM(asz_tasco_pronghorn, 250, MAGAZINE_STOCK);

		};

		class underbarrelitaly{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_italy", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(asz_bipod_m107, 50, 20);
			ITEM(asz_bipod_ar7090, 50, 20);
			ITEM(asz_bipod_arx_blk, 50, 20);
			ITEM(asz_bipod_arx_des, 50, 20);
			ITEM(asz_bipod_m249, 50, 20);
			ITEM(asz_bipod_m40a3, 50, 20);
			ITEM(asz_bipod_tac50, 50, 20);
			ITEM(asz_bipod_sakotrg42, 50, 20);
			
		};
