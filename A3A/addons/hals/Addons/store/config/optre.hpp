		//OPTRE
		class handgunshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(OPTRE_M6B, 110, PISTOL_STOCK) //AMMO: OPTRE_8Rnd_127x40_Mag
			ITEM(OPTRE_M6C, 150, PISTOL_STOCK) //AMMO: OPTRE_12Rnd_127x40_Mag
			ITEM(OPTRE_M6G, 110, PISTOL_STOCK) //AMMO: OPTRE_8Rnd_127x40_Mag
			ITEM(OPTRE_M7_Folded, 250, PISTOL_STOCK) //AMMO: OPTRE_48Rnd_5x23mm_Mag
			ITEM(optre_hgun_sas10_F, 130, PISTOL_STOCK) //AMMO: 16Rnd_10mm_Ball
		};

		class smghalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(OPTRE_M45, 225, RIFLE_STOCK) // Ammo: OPTRE_6Rnd_8Gauge_Pellets
			ITEM(OPTRE_M45A, 425, RIFLE_STOCK) // Ammo: OPTRE_6Rnd_8Gauge_Pellets
			ITEM(OPTRE_M45E, 250, RIFLE_STOCK) // Ammo: OPTRE_6Rnd_8Gauge_Pellets
			ITEM(OPTRE_M7, 250, RIFLE_STOCK) // Ammo: OPTRE_60Rnd_5x23mm_Mag
			ITEM(OPTRE_MA37K, 400, RIFLE_STOCK) // Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA5K, 400, RIFLE_STOCK) // Ammo: OPTRE_32Rnd_762x51_Mag
		};
		
		class mghalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(OPTRE_HMG38, 600, RIFLE_STOCK) //Ammo: OPTRE_40Rnd_30x06_Mag
			ITEM(OPTRE_M247, 650, RIFLE_STOCK) //Ammo: OPTRE_100Rnd_762x51_Box
			ITEM(OPTRE_M73, 650, RIFLE_STOCK) //Ammo: OPTRE_100Rnd_95x40_Box
		};

		class rifleshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(OPTRE_BR37, 325, RIFLE_STOCK) //Ammo: OPTRE_10RND_338_SP
			ITEM(OPTRE_BR45, 345, RIFLE_STOCK) //Ammo: OPTRE_36Rnd_95x40_Mag
			ITEM(OPTRE_BR55, 365, RIFLE_STOCK) //Ammo: OPTRE_36Rnd_95x40_Mag
			ITEM(OPTRE_BR55HB, 370, RIFLE_STOCK) //Ammo: OPTRE_36Rnd_95x40_Mag
			ITEM(OPTRE_M58S, 330, RIFLE_STOCK) //Ammo: OPTRE_42Rnd_95x40_Mag
			ITEM(OPTRE_MA32, 300, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA5A, 300, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA37B, 300, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA32B, 300, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA5B, 310, RIFLE_STOCK) //Ammo: OPTRE_60Rnd_762x51_Mag
			ITEM(OPTRE_MA5C, 300, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA32GL, 320, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA5AGL, 320, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA37BGL, 320, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA32BGL, 320, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA5BGL, 330, RIFLE_STOCK) //Ammo: OPTRE_60Rnd_762x51_Mag
			ITEM(OPTRE_MA5CGL, 320, RIFLE_STOCK) //Ammo: OPTRE_32Rnd_762x51_Mag
			// Covenant
			ITEM(OPTRE_FC_T25_Rifle, 600, RIFLE_STOCK)
			ITEM(OPTRE_FC_T25J_Rifle, 700, RIFLE_STOCK)
			ITEM(OPTRE_FC_T51_Repeater, 1000, RIFLE_STOCK)
			ITEM(OPTRE_FC_T51J_Repeater, 1100, RIFLE_STOCK)
			ITEM(OPTRE_FC_T51_Carbine, 1100, RIFLE_STOCK)
			ITEM(OPTRE_FC_T51B_Carbine, 1200, RIFLE_STOCK)
			ITEM(OPTRE_FC_T60_PulseCarbine, 1100, RIFLE_STOCK)
			ITEM(OPTRE_FC_T50_SRS, 2000, RIFLE_STOCK)
		};

		class sniperrifleshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(OPTRE_Commando_Black, 400, RIFLE_STOCK) // Ammo: Commando_20Rnd_65_Mag
			ITEM(OPTRE_M295_BMR, 430, RIFLE_STOCK) // Ammo: OPTRE_15Rnd_762x51_Mag
			ITEM(OPTRE_M392_DMR, 450, RIFLE_STOCK) // Ammo: OPTRE_15Rnd_762x51_Mag
			ITEM(OPTRE_M393_DMR, 470, RIFLE_STOCK) // Ammo: OPTRE_15Rnd_762x51_Mag
			ITEM(OPTRE_M393S_DMR, 480, RIFLE_STOCK) // Ammo: OPTRE_15Rnd_762x51_Mag
			ITEM(OPTRE_SRM77_S1, 580, RIFLE_STOCK) // Ammo: OPTRE_5Rnd_127x99
			ITEM(OPTRE_SRM77_S2, 580, RIFLE_STOCK) // Ammo: OPTRE_5Rnd_127x99
			ITEM(OPTRE_SRS99C, 1000, RIFLE_STOCK) // Ammo: OPTRE_4Rnd_145x114_APFSDS_Mag
			ITEM(OPTRE_SRS99D, 1000, RIFLE_STOCK) // Ammo: OPTRE_4Rnd_145x114_APFSDS_Mag
			ITEM(OPTRE_M99A2S3, 2000, RIFLE_STOCK) // Ammo: OPTRE_7Rnd_20mm_APFSDS_Mag
		};

		class launchershalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			ITEM(OPTRE_M41_SSR, 500, 25) 
		}; 

		class launchermagazineshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			ITEM(OPTRE_M41_Twin_HE, 100, 15)
			ITEM(OPTRE_M41_Twin_HEAP, 150, 15)
			ITEM(OPTRE_M41_Twin_HEAT_Thermal, 300, 15)
			ITEM(OPTRE_M41_Twin_HEAT_SACLOS, 250, 15)
			ITEM(OPTRE_M41_Twin_HEAT_SALH, 250, 15)
			ITEM(OPTRE_M41_Twin_HEAT_G, 200, 15)
			ITEM(OPTRE_M41_Twin_HEAT, 150, 15)
		};

		class riflegrenadeshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_glGrenades"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			ITEM(1Rnd_HE_Grenade_shell, 70, 25)
			ITEM(1Rnd_Smoke_Grenade_shell, 50, 25)
			ITEM(UGL_FlareWhite_F, 50, 25)
		};

		class muzzleshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";
			ITEM(optre_ma5suppressor, 80, MZ_STOCK)
			ITEM(optre_m12_suppressor, 80, MZ_STOCK)
			ITEM(optre_m393_suppressor, 80, MZ_STOCK)
			ITEM(optre_ma37ksuppressor, 80, MZ_STOCK)
			ITEM(optre_srs99d_suppressor, 100, MZ_STOCK)
			ITEM(optre_m7_silencer, 80, MZ_STOCK)
		};

		class magazineshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(OPTRE_8Rnd_127x40_Mag, 17, MZ_STOCK)
            ITEM(OPTRE_12Rnd_127x40_Mag, 20, MZ_STOCK)
            ITEM(OPTRE_48Rnd_5x23mm_Mag, 30, MZ_STOCK)
            ITEM(16Rnd_10mm_Ball, 25, MZ_STOCK)
            ITEM(OPTRE_6Rnd_8Gauge_Pellets, 25, MZ_STOCK)
            ITEM(OPTRE_60Rnd_5x23mm_Mag, 65, MZ_STOCK)
            ITEM(OPTRE_32Rnd_762x51_Mag, 30, MZ_STOCK)
            ITEM(OPTRE_40Rnd_30x06_Mag, 35, MZ_STOCK)
            ITEM(OPTRE_100Rnd_762x51_Box, 62, MZ_STOCK)
            ITEM(OPTRE_100Rnd_95x40_Box, 65, MZ_STOCK)
            ITEM(OPTRE_10RND_338_SP, 45, MZ_STOCK)
            ITEM(OPTRE_36Rnd_95x40_Mag, 30, MZ_STOCK)
            ITEM(OPTRE_60Rnd_762x51_Mag, 50, MZ_STOCK)
            ITEM(OPTRE_42Rnd_95x40_Mag, 35, MZ_STOCK) 
			ITEM(Commando_20Rnd_65_Mag, 65, MZ_STOCK)
            ITEM(OPTRE_15Rnd_762x51_Mag, 55, MZ_STOCK)
            ITEM(OPTRE_5Rnd_127x99, 80, MZ_STOCK)
            ITEM(OPTRE_4Rnd_145x114_APFSDS_Mag, 100, MZ_STOCK)
            ITEM(OPTRE_7Rnd_20mm_APFSDS_Mag, 150, MZ_STOCK) 

		};

		class mischalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			// Spartan gear
			ITEM(OPTRE_MJOLNIR_MkVBArmor, 1500, MISC_STOCK)
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV4, 1500, MISC_STOCK)
			ITEM(OPTRE_ANPRC_515_Spartan, 800, MISC_STOCK)
			ITEM(OPTRE_MJOLNIR_MkVBHelmet, 800, MISC_STOCK)
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_UA_HUL, 800, MISC_STOCK)
			ITEM(OPTRE_MJOLNIR_EOD, 1000, MISC_STOCK)
			ITEM(OPTRE_MJOLNIR_CQC, 1000, MISC_STOCK)
			ITEM(OPTRE_MJOLNIR_Commando, 1000, MISC_STOCK)
			ITEM(OPTRE_MJOLNIR_Commando_HUL3, 1100, MISC_STOCK)
			ITEM(OPTRE_ANPRC_521_Green_Spartan, 700, MISC_STOCK)
			ITEM(OPTRE_ANPRC_521_Black_Spartan, 700, MISC_STOCK)
			// Covenant gear
			ITEM(OPTRE_FC_Elite_Armor_FieldMarshal, 3000, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Armor_HonorGuard_Ultra, 4000, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Armor_HonorGuard, 3500, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Armor_Major, 2500, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Armor_Minor, 2000, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Armor_Officer, 2300, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Armor_SpecOps, 2500, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Armor_Ultra, 3000, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Armor_Zealot, 3500, MISC_STOCK)

			ITEM(OPTRE_FC_Elite_Helmet_FieldMarshal, 1500, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Helmet_HonorGuard_Ultra, 2000, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Helmet_HonorGuard, 1750, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Helmet_Major, 1250, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Helmet_Minor, 1000, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Helmet_Officer, 1100, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Helmet_SpecOps, 750, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Helmet_Ultra, 1500, MISC_STOCK)
			ITEM(OPTRE_FC_Elite_Helmet_Zealot, 1750, MISC_STOCK)

			ITEM(C7_Remote_Mag, 400, MISC_STOCK)
			ITEM(C12_Remote_Mag, 400, MISC_STOCK)
		};

		class pointershalo{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_optre", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(optre_bmr_laser, 70, PN_STOCK)
			ITEM(optre_dmr_light, 70, PN_STOCK)
			ITEM(optre_m45_flashlight, 70, PN_STOCK)
			ITEM(optre_m45_flashlight_red, 70, PN_STOCK)
			ITEM(optre_m12_laser, 70, PN_STOCK)
			ITEM(optre_m7_flashlight, 70, PN_STOCK)
			ITEM(optre_m7_laser, 70, PN_STOCK)
		};

		class specialweaponshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(OPTRE_M319, 300, RIFLE_STOCK)
			ITEM(OPTRE_M319n, 400, RIFLE_STOCK)
			ITEM(OPTRE_M319m, 250, RIFLE_STOCK)
			ITEM(OPTRE_M319s, 250, RIFLE_STOCK)
		};

		class opticshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			ITEM(optre_br45_scope, 150, MAGAZINE_STOCK)
			ITEM(optre_br55hb_scope, 150, MAGAZINE_STOCK)
			ITEM(optre_m392_scope, 150, MAGAZINE_STOCK)
			ITEM(optre_m393_scope, 150, MAGAZINE_STOCK)
			ITEM(optre_m393_acog, 150, MAGAZINE_STOCK)
			ITEM(optre_bmr_scope, 150, MAGAZINE_STOCK)
			ITEM(optre_m7_sight, 150, MAGAZINE_STOCK)
			ITEM(optre_ma5c_smartlink, 150, MAGAZINE_STOCK)
			ITEM(optre_ma5_smartlink, 150, MAGAZINE_STOCK)
			ITEM(optre_ma5_buis, 150, MAGAZINE_STOCK)
			ITEM(optre_ma37_smartlink_scope, 150, MAGAZINE_STOCK)
			ITEM(optre_m393_eotech, 150, MAGAZINE_STOCK)
			ITEM(optre_srm_sight, 250, MAGAZINE_STOCK)
			ITEM(optre_srs99c_scope, 350, MAGAZINE_STOCK)
			ITEM(optre_srs99_scope, 350, MAGAZINE_STOCK)
		};

		class underbarrelhalo{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_grips"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(optre_br45grip, 50, 20)
		};
