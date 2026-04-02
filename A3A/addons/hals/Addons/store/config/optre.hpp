		//OPTRE
		class handgunshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(OPTRE_M6B, 110, PISTOL_STOCK); //AMMO: OPTRE_8Rnd_127x40_Mag
			ITEM(OPTRE_M6C, 150, PISTOL_STOCK); //AMMO: OPTRE_12Rnd_127x40_Mag
			ITEM(OPTRE_M6G, 110, PISTOL_STOCK); //AMMO: OPTRE_8Rnd_127x40_Mag
			ITEM(OPTRE_M7_Folded, 250, PISTOL_STOCK); //AMMO: OPTRE_48Rnd_5x23mm_Mag
			ITEM(optre_hgun_sas10_F, 130, PISTOL_STOCK); //AMMO: 16Rnd_10mm_Ball
			ITEM(optre_hgun_sas10_desert_F, 130, PISTOL_STOCK);
			ITEM(optre_hgun_sas10_jungle_F, 130, PISTOL_STOCK);
			ITEM(optre_hgun_sas10_snow_F, 130, PISTOL_STOCK);
			ITEM(OPTRE_M6D, 110, PISTOL_STOCK);
			ITEM(OPTRE_M6D_Black, 110, PISTOL_STOCK);
			ITEM(OPTRE_M6D_Desert, 110, PISTOL_STOCK);
			ITEM(OPTRE_M6D_Jungle, 110, PISTOL_STOCK);
			ITEM(optre_hgun_comet_F, 70, PISTOL_STOCK);
			ITEM(optre_hgun_comet_gold_F, 700, PISTOL_STOCK);
		};

		class smghalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(OPTRE_M45, 225, RIFLE_STOCK); // Ammo: OPTRE_6Rnd_8Gauge_Pellets
			ITEM(OPTRE_M45A, 425, RIFLE_STOCK); // Ammo: OPTRE_6Rnd_8Gauge_Pellets
			ITEM(OPTRE_M45E, 250, RIFLE_STOCK); // Ammo: OPTRE_6Rnd_8Gauge_Pellets
			ITEM(OPTRE_M7, 250, RIFLE_STOCK); // Ammo: OPTRE_60Rnd_5x23mm_Mag
			ITEM(OPTRE_MA37K, 400, RIFLE_STOCK); // Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA5K, 400, RIFLE_STOCK); // Ammo: OPTRE_32Rnd_762x51_Mag 
			ITEM(OPTRE_M6D_Carbine_F, 300, RIFLE_STOCK); //fuck it, carbines are smgs
			ITEM(OPTRE_M6D_Carbine_Black_F, 300, RIFLE_STOCK); /// Ammo: OPTRE_12Rnd_127x40_Mag
			ITEM(OPTRE_M6D_Carbine_Desert_F, 300, RIFLE_STOCK);
			ITEM(OPTRE_M6D_Carbine_Jungle_F, 300, RIFLE_STOCK);
			ITEM(OPTRE_M6DS_Carbine_Foregrip_F, 300, RIFLE_STOCK);
			ITEM(OPTRE_M6DS_Carbine_Foregrip_Black_F, 300, RIFLE_STOCK);
			ITEM(OPTRE_M6DS_Carbine_Foregrip_Desert_F, 300, RIFLE_STOCK);
			ITEM(OPTRE_M6DS_Carbine_Foregrip_Jungle_F, 300, RIFLE_STOCK);
		};
		
		class mghalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(OPTRE_HMG38, 600, RIFLE_STOCK); //Ammo: OPTRE_40Rnd_30x06_Mag
			ITEM(OPTRE_M247, 650, RIFLE_STOCK); //Ammo: OPTRE_100Rnd_762x51_Box //this one is better then below
			ITEM(OPTRE_M247A1, 650, RIFLE_STOCK); //
			ITEM(OPTRE_M247A1_Stripped, 650, RIFLE_STOCK); //
			ITEM(OPTRE_M73, 750, RIFLE_STOCK); //Ammo: OPTRE_100Rnd_95x40_Box
			ITEM(OPTRE_AIE_486H_Minigun_MMG_Weapon, 1000, RIFLE_STOCK); //Ammo: OPTRE_AIE_1000Rnd_762x51_M118_Belt_Tracer_Red
			ITEM(OPTRE_M247H_Etilka, 800, RIFLE_STOCK); //Ammo: OPTRE_200Rnd_127x99_M247H_Etilka_Ball
			ITEM(OPTRE_M247H_Shield_Etilka, 800, RIFLE_STOCK); //
			ITEM(OPTRE_M250, 700, RIFLE_STOCK); //Ammo: OPTRE_50Rnd_127x99_M250_Box
			ITEM(OPTRE_M250_Gold, 1700, RIFLE_STOCK); //
			ITEM(OPTRE_M26_LMG_F, 400, RIFLE_STOCK); //Ammo: OPTRE_80Rnd_762x51_Mag
			ITEM(OPTRE_M739_SAW_F, 950, RIFLE_STOCK); //Ammo: OPTRE_M739_SAW_128rnd_Drum
			ITEM(OPTRE_M739_SAW_Black_F, 950, RIFLE_STOCK); //
			ITEM(OPTRE_M739_SAW_Foregrip_F, 1000, RIFLE_STOCK); //
			ITEM(OPTRE_M739_SAW_Foregrip_Black_F, 1000, RIFLE_STOCK); //
		};

		class rifleshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(OPTRE_BR37, 425, RIFLE_STOCK); //Ammo: OPTRE_10RND_338_SP
			ITEM(OPTRE_BR45, 345, RIFLE_STOCK); //Ammo: OPTRE_36Rnd_95x40_Mag
			ITEM(OPTRE_BR45_Black, 345, RIFLE_STOCK); //
			ITEM(OPTRE_BR45GL, 445, RIFLE_STOCK); //
			ITEM(OPTRE_BR45GL_black, 445, RIFLE_STOCK); //
			ITEM(OPTRE_BR55, 365, RIFLE_STOCK); //Ammo: OPTRE_36Rnd_95x40_Mag
			ITEM(OPTRE_BR55_Grey, 365, RIFLE_STOCK); //
			ITEM(OPTRE_BR55HB, 370, RIFLE_STOCK); //Ammo: OPTRE_36Rnd_95x40_Mag
			ITEM(OPTRE_BR55HB_Grey, 370, RIFLE_STOCK);
			ITEM(OPTRE_M58S, 330, RIFLE_STOCK); //Ammo: OPTRE_42Rnd_95x40_Mag
			ITEM(OPTRE_MA32, 300, RIFLE_STOCK); //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA32GL, 320, RIFLE_STOCK); //
			ITEM(OPTRE_MA5A, 300, RIFLE_STOCK); //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA5AGL, 320, RIFLE_STOCK); //
			ITEM(OPTRE_MA37B, 270, RIFLE_STOCK); //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA37BGL, 370, RIFLE_STOCK); //
			ITEM(OPTRE_MA32B, 300, RIFLE_STOCK); //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA32BGL, 320, RIFLE_STOCK); //
			ITEM(OPTRE_MA5B, 350, RIFLE_STOCK); //Ammo: OPTRE_60Rnd_762x51_Mag
			ITEM(OPTRE_MA5BGL, 650, RIFLE_STOCK); //
			ITEM(OPTRE_MA5C, 325, RIFLE_STOCK); //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA5CGL, 425, RIFLE_STOCK); //
			ITEM(OPTRE_MA37, 270, RIFLE_STOCK); //Ammo: OPTRE_32Rnd_762x51_Mag
			ITEM(OPTRE_MA37GL, 370, RIFLE_STOCK); //
			
			ITEM(OPTRE_HMG38, 400, RIFLE_STOCK); //gl
			ITEM(OPTRE_HMG38_Rifle, 300, RIFLE_STOCK);
			
			ITEM(OPTRE_M26_F, 450, RIFLE_STOCK); //Ammo: OPTRE_60Rnd_762x51_Mag
			ITEM(OPTRE_M26_GL_F, 650, RIFLE_STOCK); //
			ITEM(OPTRE_M26_Shotgun_F, 500, RIFLE_STOCK);

			ITEM(OPTRE_Commando, 250, RIFLE_STOCK); // Ammo: Commando_20Rnd_65_Mag
			ITEM(OPTRE_Commando_Black, 250, RIFLE_STOCK);
			ITEM(OPTRE_Commando_Police, 250, RIFLE_STOCK);
			ITEM(OPTRE_Commando_Red, 250, RIFLE_STOCK);
			ITEM(OPTRE_Commando_Snow, 250, RIFLE_STOCK);
			ITEM(OPTRE_Commando_Tan, 250, RIFLE_STOCK);
		};

		class sniperrifleshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(OPTRE_M295_BMR, 430, RIFLE_STOCK); // Ammo: OPTRE_15Rnd_762x51_Mag
			ITEM(OPTRE_M295_BMR_Desert, 430, RIFLE_STOCK); //
			ITEM(OPTRE_M295_BMR_Snow, 430, RIFLE_STOCK); //
			ITEM(OPTRE_M295_BMR_Woodland, 430, RIFLE_STOCK); //
			ITEM(OPTRE_M392_DMR, 450, RIFLE_STOCK); // Ammo: OPTRE_15Rnd_762x51_Mag
			ITEM(OPTRE_M393_DMR, 470, RIFLE_STOCK); // Ammo: OPTRE_15Rnd_762x51_Mag
			ITEM(OPTRE_M393S_DMR, 480, RIFLE_STOCK); // Ammo: OPTRE_15Rnd_762x51_Mag
			ITEM(OPTRE_SRM77_S1, 580, RIFLE_STOCK); // Ammo: OPTRE_5Rnd_127x99
			ITEM(OPTRE_SRM77_S1_Green, 580, RIFLE_STOCK); //
			ITEM(OPTRE_SRM77_S1_Blue, 580, RIFLE_STOCK); //
			ITEM(OPTRE_SRM77_S1_Red, 580, RIFLE_STOCK); //
			ITEM(OPTRE_SRM77_S2, 680, RIFLE_STOCK); // Ammo: OPTRE_5Rnd_127x99
			ITEM(OPTRE_SRM77_S2_Green, 580, RIFLE_STOCK); //
			ITEM(OPTRE_SRM77_S2_Blue, 580, RIFLE_STOCK); //
			ITEM(OPTRE_SRM77_S2_Red, 580, RIFLE_STOCK); //
			ITEM(OPTRE_SRS99C, 1100, RIFLE_STOCK); // Ammo: OPTRE_4Rnd_145x114_APFSDS_Mag
			ITEM(OPTRE_SRS99D, 1000, RIFLE_STOCK); // Ammo: OPTRE_4Rnd_145x114_APFSDS_Mag
			ITEM(OPTRE_M99A2S3, 2000, RIFLE_STOCK); // Ammo: OPTRE_7Rnd_20mm_APFSDS_Mag
		};

		class specialweaponshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(OPTRE_M319, 300, RIFLE_STOCK);
			ITEM(OPTRE_M319N, 400, RIFLE_STOCK);
			ITEM(OPTRE_M319M, 250, RIFLE_STOCK);
			ITEM(OPTRE_M319s, 250, RIFLE_STOCK);

			ITEM(OPTRE_CQS48_Bulldog_Automatic, 450, RIFLE_STOCK);
			ITEM(OPTRE_CQS48_Bulldog_Automatic_Green, 450, RIFLE_STOCK);
			ITEM(OPTRE_CQS48_Bulldog_Automatic_Innie, 450, RIFLE_STOCK);
			ITEM(OPTRE_CQS48_Bulldog_Automatic_Snow, 450, RIFLE_STOCK);
			ITEM(OPTRE_CQS48S_Chihuahua_Automatic, 450, RIFLE_STOCK);
			ITEM(OPTRE_CQS48S_Chihuahua_Automatic_Desert, 450, RIFLE_STOCK);
			ITEM(OPTRE_CQS48S_Chihuahua_Automatic_Green, 450, RIFLE_STOCK);
			ITEM(OPTRE_CQS48S_Chihuahua_Automatic_Innie, 450, RIFLE_STOCK);
			ITEM(OPTRE_CQS48S_Chihuahua_Automatic_Snow, 450, RIFLE_STOCK);

			ITEM(OPTRE_M12_SOC, 500, RIFLE_STOCK);

			ITEM(OPTRE_M45TAC, 300, RIFLE_STOCK); //shotgun
			ITEM(OPTRE_M45, 300, RIFLE_STOCK); //shotgun
			ITEM(OPTRE_M45A, 450, RIFLE_STOCK); //shotgun //auto
			ITEM(OPTRE_M45ATAC, 450, RIFLE_STOCK); //shotgun //auto
			ITEM(OPTRE_M45E, 450, RIFLE_STOCK); //shotgun
			ITEM(OPTRE_M90A, 450, RIFLE_STOCK); //shotgun

			ITEM(OPTRE_M99A2S3, 1500, RIFLE_STOCK);//kinda like a railgun

			ITEM(OPTRE_Bulldog_Riot_Shield, 2000, RIFLE_STOCK); //dunno 2k or smth
			ITEM(OPTRE_Bulldog_Riot_Shield_Desert, 2000, RIFLE_STOCK);
			ITEM(OPTRE_Bulldog_Riot_Shield_Snow, 2000, RIFLE_STOCK);
			ITEM(OPTRE_Bulldog_Riot_Shield_Urban, 2000, RIFLE_STOCK);
			ITEM(OPTRE_Comet_Riot_Shield, 1000, RIFLE_STOCK); //shitty pistol + shield, kinda 1000 ?
			ITEM(OPTRE_Comet_Riot_Shield_Desert, 1000, RIFLE_STOCK);
			ITEM(OPTRE_Comet_Riot_Shield_Snow, 1000, RIFLE_STOCK);
			ITEM(OPTRE_Comet_Riot_Shield_Urban, 1000, RIFLE_STOCK);
			ITEM(OPTRE_M6B_Riot_Shield, 1500, RIFLE_STOCK); // 1500 ?
			ITEM(OPTRE_M6B_Riot_Shield_Desert, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6B_Riot_Shield_Snow, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6B_Riot_Shield_Urban, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6C_Riot_Shield, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6C_Riot_Shield_Desert, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6C_Riot_Shield_Snow, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6C_Riot_Shield_Urban, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6G_Riot_Shield, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6G_Riot_Shield_Desert, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6G_Riot_Shield_Snow, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M6G_Riot_Shield_Urban, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M7_Riot_Shield, 1750, RIFLE_STOCK); //1750 ?
			ITEM(OPTRE_M7_Riot_Shield_Desert, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M7_Riot_Shield_Snow, 1500, RIFLE_STOCK);
			ITEM(OPTRE_M7_Riot_Shield_Urban, 1500, RIFLE_STOCK);
			ITEM(OPTRE_SAS10_Riot_Shield, 1800, RIFLE_STOCK); //1800 ?
		};

		class launchershalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			//OPTRE_CSW_AU44_Carry_Baseplate
			//OPTRE_CSW_AU44_Mortar_Carry
			//OPTRE_CSW_M247H_Carry_Tripod
			//OPTRE_CSW_M247T_Carry_Tripod
			//OPTRE_CSW_M247H_Weapon
			//OPTRE_CSW_M247H_Shield_Weapon
			//OPTRE_CSW_M247T_Weapon; 
			
			ITEM(OPTRE_M41_SSR, 2000, 25); 
			ITEM(OPTRE_M44_Lykoi_Semi_Disposable_AT, 1700, 25); 
			ITEM(OPTRE_M44_Lykoi_Semi_Disposable_AT_Des, 1700, 25); 
			ITEM(OPTRE_M44_Lykoi_Semi_Disposable_AT_Grey, 1700, 25); 
		}; 

		class launchermagazineshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			ITEM(OPTRE_M6GGNR, 5000, 10);
			ITEM(OPTRE_M41_Twin_HE, 100, 15);
			ITEM(OPTRE_M41_Twin_HEAP, 150, 15);
			ITEM(OPTRE_M41_Twin_HEAT_G_AA, 300, 15);
			ITEM(OPTRE_M41_Twin_HEAT_SACLOS, 250, 15);
			ITEM(OPTRE_M41_Twin_HEAT_SALH, 250, 15);
			ITEM(OPTRE_M41_Twin_HEAT_G, 200, 15);
			ITEM(OPTRE_M41_Twin_HEAT, 150, 15);
			ITEM(OPTRE_M41_Twin_Smoke_B, 50, 25);
			ITEM(OPTRE_M41_Twin_Smoke_G, 50, 25);
			ITEM(OPTRE_M41_Twin_Smoke_O, 50, 25);
			ITEM(OPTRE_M41_Twin_Smoke_P, 50, 25);
			ITEM(OPTRE_M41_Twin_Smoke_R, 50, 25);
			ITEM(OPTRE_M41_Twin_Smoke_W, 50, 25);
			ITEM(OPTRE_M41_Twin_Smoke_Y, 50, 25);
			ITEM(OPTRE_M44_Lykoi_HE_mag, 100, 15);
			ITEM(OPTRE_M44_Lykoi_HEAT_mag, 150, 15);
			ITEM(OPTRE_M44_Lykoi_AA_mag, 300, 15);
		};

		class riflegrenadeshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_glGrenades"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			ITEM(1Rnd_HE_Grenade_shell, 70, 25);
			ITEM(1Rnd_Smoke_Grenade_shell, 50, 25);
			ITEM(UGL_FlareWhite_F, 50, 25);

			ITEM(OPTRE_3Rnd_SmokeBlue_Grenade_shell, 150, 25);
			ITEM(OPTRE_3Rnd_SmokeGreen_Grenade_shell, 150, 25);
			ITEM(OPTRE_3Rnd_SmokeOrange_Grenade_shell, 150, 25);
			ITEM(OPTRE_3Rnd_SmokePurple_Grenade_shell, 150, 25);
			ITEM(OPTRE_3Rnd_SmokeRed_Grenade_shell, 150, 25);
			ITEM(OPTRE_3Rnd_Smoke_Grenade_shell, 150, 25);
			ITEM(OPTRE_3Rnd_SmokeYellow_Grenade_shell, 150, 25);
			ITEM(OPTRE_signalSmokeB, 50, 25);
			ITEM(OPTRE_signalSmokeG, 50, 25);
			ITEM(OPTRE_signalSmokeO, 50, 25);
			ITEM(OPTRE_signalSmokeP, 50, 25);
			ITEM(OPTRE_signalSmokeR, 50, 25);
			ITEM(OPTRE_signalSmokeY, 50, 25);
			ITEM(OPTRE_1Rnd_SmokeBlue_Grenade_shell, 50, 25);
			ITEM(OPTRE_1Rnd_SmokeGreen_Grenade_shell, 50, 25);
			ITEM(OPTRE_1Rnd_SmokeOrange_Grenade_shell, 50, 25);
			ITEM(OPTRE_1Rnd_SmokePurple_Grenade_shell, 50, 25);
			ITEM(OPTRE_1Rnd_SmokeRed_Grenade_shell, 50, 25);
			ITEM(OPTRE_1Rnd_Smoke_Grenade_shell, 50, 25);
			ITEM(OPTRE_1Rnd_SmokeYellow_Grenade_shell, 50, 25);
			ITEM(M319_HE_Grenade_Shell, 70, 25);
			ITEM(M319_HEAT_Grenade_Shell, 80, 25);
			ITEM(M319_HEDP_Grenade_Shell, 85, 25);
			ITEM(M319_HEDPC_Grenade_Shell, 90, 25);
			ITEM(M319_Smoke, 50, 25);
			ITEM(M319_Smoke_Green, 50, 25);
			ITEM(M319_Smoke_Orange, 50, 25);
			ITEM(M319_Smoke_Red, 50, 25);
			ITEM(M319_Buckshot, 20, 25);
			ITEM(OPTRE_1Rnd_MasterKey_Pellets, 20, 25);
			ITEM(OPTRE_1Rnd_MasterKey_Slugs, 20, 25);
		};

		class muzzleshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";
			ITEM(OPTRE_M12_Suppressor, 80, MZ_STOCK);
			ITEM(OPTRE_M247a1_Flashhider, 60, MZ_STOCK);
			ITEM(OPTRE_M26_LMG_Comp, 80, MZ_STOCK);
			ITEM(OPTRE_M26_LMG_Suppressor, 80, MZ_STOCK);
			ITEM(OPTRE_M393_Suppressor, 80, MZ_STOCK);
			ITEM(OPTRE_M6_silencer, 80, MZ_STOCK);
			ITEM(OPTRE_M6C_compensator, 80, MZ_STOCK);
			ITEM(OPTRE_M7_silencer, 80, MZ_STOCK);
			ITEM(OPTRE_MA37KSuppressor, 80, MZ_STOCK);
			ITEM(OPTRE_SRS99D_Suppressor, 100, MZ_STOCK);
			ITEM(OPTRE_MA5Suppressor, 80, MZ_STOCK);
			ITEM(OPTRE_M6D_Carbine_Brake, 60, MZ_STOCK);
			ITEM(OPTRE_M6D_Carbine_Suppressor, 80, MZ_STOCK);
		};

		class magazineshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			//mg Ammo
			ITEM(OPTRE_AIE_1000Rnd_762x51_M118_Belt_Tracer_Red, 300, MZ_STOCK);
			ITEM(OPTRE_AIE_1000Rnd_762x51_M80_Belt_Tracer_Red, 300, MZ_STOCK);
			ITEM(OPTRE_AIE_1000Rnd_762x51_Mismatch1, 300, MZ_STOCK);
			ITEM(OPTRE_AIE_1000Rnd_762x51_Mismatch2, 300, MZ_STOCK);

			ITEM(OPTRE_100Rnd_762x51_Box, 62, MZ_STOCK);
			ITEM(OPTRE_100Rnd_762x51_Box_Tracer_Yellow, 67, MZ_STOCK);
			ITEM(OPTRE_100Rnd_762x51_Box_Tracer, 67, MZ_STOCK);
			ITEM(OPTRE_400Rnd_762x51_Box_Tracer, 268, MZ_STOCK);

			ITEM(OPTRE_200Rnd_762x51_M118_M247A1_Box, 124, MZ_STOCK);
			ITEM(OPTRE_400Rnd_762x51_M118_M247A1_Box, 248, MZ_STOCK);
			ITEM(OPTRE_200Rnd_762x51_M80_M247A1_Box, 110, MZ_STOCK);
			ITEM(OPTRE_400Rnd_762x51_M80_M247A1_Box, 220, MZ_STOCK);

			ITEM(OPTRE_200Rnd_127x99_M247H_Etilka_Ball, 300, MZ_STOCK);
			ITEM(OPTRE_200Rnd_127x99_M247H_Etilka, 1500, MZ_STOCK); //dunno

			ITEM(OPTRE_50Rnd_127x99_M250_Box, 80, MZ_STOCK);

			ITEM(OPTRE_100Rnd_95x40_Box, 65, MZ_STOCK);
			ITEM(OPTRE_100Rnd_95x40_Box_Tracer_Yellow, 70, MZ_STOCK);
			ITEM(OPTRE_100Rnd_95x40_Box_Tracer, 75, MZ_STOCK);
			ITEM(OPTRE_200Rnd_95x40_Box, 130, MZ_STOCK);
			ITEM(OPTRE_200Rnd_95x40_Box_Tracer_Yellow, 140, MZ_STOCK);
			ITEM(OPTRE_200Rnd_95x40_Box_Tracer, 150, MZ_STOCK);

			ITEM(OPTRE_M739_SAW_HE_72rnd_Drum, 290, MZ_STOCK);
			ITEM(OPTRE_M739_SAW_128rnd_Drum, 165, MZ_STOCK);
			ITEM(OPTRE_M739_SAW_192rnd_Box, 190, MZ_STOCK);
			ITEM(OPTRE_M739_SAW_SLAP_72rnd_Drum, 175, MZ_STOCK);
			ITEM(OPTRE_M739_SAW_Shredder_72rnd_Drum, 170, MZ_STOCK);
			// rifle ammo
			ITEM(OPTRE_10RND_338_SP, 45, MZ_STOCK);
			ITEM(OPTRE_10RND_338_AP, 55, MZ_STOCK);
			ITEM(OPTRE_10RND_338_VLD, 50, MZ_STOCK); // I dunno wtf is this

			ITEM(OPTRE_36Rnd_95x40_Mag, 30, MZ_STOCK);
			ITEM(OPTRE_36Rnd_95x40_Mag_Tracer_Yellow, 35, MZ_STOCK);
			ITEM(OPTRE_36Rnd_95x40_Mag_Tracer, 40, MZ_STOCK);

			ITEM(OPTRE_40Rnd_30x06_Mag, 35, MZ_STOCK);
			ITEM(OPTRE_40Rnd_30x06_Mag_Tracer, 45, MZ_STOCK);
			ITEM(OPTRE_100Rnd_30x06_Mag, 95, MZ_STOCK);
			ITEM(OPTRE_100Rnd_30x06_Mag_Tracer, 125, MZ_STOCK);

			ITEM(OPTRE_64Rnd_57x31_Mag, 55, MZ_STOCK);
			ITEM(OPTRE_64Rnd_57x31_Mag_Tracer_Yellow, 65, MZ_STOCK);
			ITEM(OPTRE_64Rnd_57x31_Mag_Tracer, 70, MZ_STOCK);

			ITEM(OPTRE_32Rnd_762x51_Mag, 30, MZ_STOCK);
			ITEM(OPTRE_32Rnd_762x51_Mag_Tracer_Yellow, 35, MZ_STOCK);
			ITEM(OPTRE_32Rnd_762x51_Mag_Tracer, 40, MZ_STOCK);

			ITEM(OPTRE_60Rnd_762x51_Mag, 50, MZ_STOCK);
			ITEM(OPTRE_60Rnd_762x51_Mag_Tracer_Yellow, 60, MZ_STOCK);
			ITEM(OPTRE_60Rnd_762x51_Mag_Tracer, 65, MZ_STOCK);

			ITEM(OPTRE_80Rnd_762x51_Mag, 75, MZ_STOCK);
			ITEM(OPTRE_80Rnd_762x51_Mag_Tracer_Yellow, 85, MZ_STOCK);
			ITEM(OPTRE_80Rnd_762x51_Mag_Tracer, 90, MZ_STOCK);
			ITEM(OPTRE_32Rnd_762x51_Mag_UW, 35, MZ_STOCK);

			ITEM(OPTRE_25Rnd_762x51_Mag, 50, MZ_STOCK);
			ITEM(OPTRE_25Rnd_762x51_Mag_Tracer_Yellow, 55, MZ_STOCK);
			ITEM(OPTRE_25Rnd_762x51_Mag_Tracer, 60, MZ_STOCK);
			ITEM(OPTRE_25Rnd_762x51_AP_Mag, 70, MZ_STOCK);
			ITEM(OPTRE_25Rnd_762x51_AP_Mag_Tracer, 75, MZ_STOCK);

			ITEM(OPTRE_15Rnd_762x51_Mag, 55, MZ_STOCK);
			ITEM(OPTRE_15Rnd_762x51_Mag_Tracer_Yellow, 60, MZ_STOCK);
			ITEM(OPTRE_15Rnd_762x51_Mag_Tracer, 65, MZ_STOCK);
			ITEM(OPTRE_15Rnd_762x51_AP_Mag, 75, MZ_STOCK);
			ITEM(OPTRE_15Rnd_762x51_AP_Mag_Tracer, 80, MZ_STOCK);

			ITEM(OPTRE_42Rnd_95x40_Mag, 45, MZ_STOCK);
			ITEM(OPTRE_42Rnd_95x40_Mag_Tracer, 50, MZ_STOCK);
			ITEM(OPTRE_42Rnd_95x40_Mag_Tracer_Yellow, 55, MZ_STOCK);

			ITEM(Commando_20Rnd_65_Mag, 65, MZ_STOCK);
			ITEM(Commando_20Rnd_65_ReloadR_Mag, 70, MZ_STOCK);
			ITEM(Commando_20Rnd_65_ReloadY_Mag, 70, MZ_STOCK);
			ITEM(Command_20Rnd_65_TracerR_Mag, 70, MZ_STOCK);
			ITEM(Commando_20Rnd_65_TracerR_Mag, 75, MZ_STOCK);
			ITEM(Commando_20Rnd_65_TracerY_Mag, 75, MZ_STOCK);
			// shotgun
			ITEM(OPTRE_12Rnd_12Gauge_HE, 200, MZ_STOCK);
			ITEM(OPTRE_12Rnd_12Gauge_HE_Tracer, 250, MZ_STOCK);
			ITEM(OPTRE_12Rnd_12Gauge_Pellets, 50, MZ_STOCK);
			ITEM(OPTRE_12Rnd_12Gauge_Pellets_Tracer, 60, MZ_STOCK);
			ITEM(OPTRE_12Rnd_12Gauge_Smoke, 10, MZ_STOCK);
			ITEM(OPTRE_12Rnd_12Gauge_Smoke_Tracer, 15, MZ_STOCK);

			ITEM(OPTRE_12Rnd_8Gauge_HEDP, 200, MZ_STOCK);
			ITEM(OPTRE_12Rnd_8Gauge_Pellets, 50, MZ_STOCK);
			ITEM(OPTRE_12Rnd_8Gauge_Slugs, 35, MZ_STOCK);
			ITEM(OPTRE_6Rnd_8Gauge_HEDP, 100, MZ_STOCK);
			ITEM(OPTRE_6Rnd_8Gauge_Pellets, 25, MZ_STOCK);
			ITEM(OPTRE_6Rnd_8Gauge_Slugs, 20, MZ_STOCK);

			// pistol / carbine
			ITEM(OPTRE_8Rnd_127x40_Mag, 17, MZ_STOCK);
			ITEM(OPTRE_8Rnd_127x40_Mag_Tracer, 22, MZ_STOCK);
			ITEM(OPTRE_8Rnd_127x40_AP_Mag, 27, MZ_STOCK);
			ITEM(OPTRE_8Rnd_127x40_Mag_HE, 117, MZ_STOCK);
			ITEM(OPTRE_8Rnd_127x40_Tracer_HE, 122, MZ_STOCK);

			ITEM(OPTRE_12Rnd_127x40_Mag, 20, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Black_Mag, 20, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Desert_Mag, 20, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Jungle_Mag, 20, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Mag_Tracer, 25, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Mag_Black_Tracer, 25, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Mag_Desert_Tracer, 25, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Mag_Jungle_Tracer, 25, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Black_Mag_HE, 120, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Desert_Mag_HE, 120, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Jungle_Mag_HE, 120, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Mag_Black_Tracer_HE, 125, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Mag_Desert_Tracer_HE, 125, MZ_STOCK);
			ITEM(OPTRE_12Rnd_127x40_Mag_Jungle_Tracer_HE, 125, MZ_STOCK);

			ITEM(OPTRE_16Rnd_127x40_Mag, 23, MZ_STOCK);
			ITEM(OPTRE_16Rnd_127x40_Black_Mag, 23, MZ_STOCK);
			ITEM(OPTRE_16Rnd_127x40_Desert_Mag, 23, MZ_STOCK);
			ITEM(OPTRE_16Rnd_127x40_Jungle_Mag, 23, MZ_STOCK);
			ITEM(OPTRE_16Rnd_127x40_Mag_Tracer, 28, MZ_STOCK);
			ITEM(OPTRE_16Rnd_127x40_Mag_Black_Tracer, 28, MZ_STOCK);
			ITEM(OPTRE_16Rnd_127x40_Mag_Desert_Tracer, 28, MZ_STOCK);
			ITEM(OPTRE_16Rnd_127x40_Mag_Jungle_Tracer, 28, MZ_STOCK);

			ITEM(OPTRE_26Rnd_127x40_Mag_Tracer, 35, MZ_STOCK);
			ITEM(OPTRE_26Rnd_127x40_Mag_Black_Tracer, 35, MZ_STOCK);
			ITEM(OPTRE_26Rnd_127x40_Mag_Desert_Tracer, 35, MZ_STOCK);
			ITEM(OPTRE_26Rnd_127x40_Mag_Jungle_Tracer, 35, MZ_STOCK);

			ITEM(OPTRE_40Rnd_127x40_Drum_Black_Tracer, 50, MZ_STOCK);
			ITEM(OPTRE_40Rnd_127x40_Drum_Desert_Tracer, 50, MZ_STOCK);
			ITEM(OPTRE_40Rnd_127x40_Drum_Jungle_Tracer, 50, MZ_STOCK);

			ITEM(16Rnd_10mm_AP, 25, MZ_STOCK);
			ITEM(16Rnd_10mm_Ball, 20, MZ_STOCK);
			ITEM(32Rnd_10mm_Ball, 40, MZ_STOCK);
			ITEM(8Rnd_10mm_EXP, 100, MZ_STOCK);

			//smg
			ITEM(OPTRE_48Rnd_5x23mm_Mag, 30, MZ_STOCK);
			ITEM(OPTRE_48Rnd_5x23mm_Mag_tracer_yellow, 35, MZ_STOCK);
			ITEM(OPTRE_48Rnd_5x23mm_Mag_tracer, 40, MZ_STOCK);
			ITEM(OPTRE_48Rnd_5x23mm_FMJ_Mag, 40, MZ_STOCK);
			ITEM(OPTRE_48Rnd_5x23mm_JHP_Mag, 45, MZ_STOCK);

			ITEM(OPTRE_60Rnd_5x23mm_Mag, 65, MZ_STOCK);
			ITEM(OPTRE_60Rnd_5x23mm_Mag_tracer_yellow, 70, MZ_STOCK);
			ITEM(OPTRE_60Rnd_5x23mm_Mag_tracer, 75, MZ_STOCK);

			///sniper
			ITEM(OPTRE_5Rnd_127x99_noTracer, 75, MZ_STOCK);
			ITEM(OPTRE_5Rnd_127x99, 80, MZ_STOCK);
			ITEM(OPTRE_5Rnd_127x99_Subsonic_noTracer, 55, MZ_STOCK);
			ITEM(OPTRE_5Rnd_127x99_Subsonic, 60, MZ_STOCK);
			ITEM(OPTRE_10Rnd_127x99_noTracer, 150, MZ_STOCK);
			ITEM(OPTRE_10Rnd_127x99, 160, MZ_STOCK);
			ITEM(OPTRE_10Rnd_127x99_Subsonic_noTracer, 110, MZ_STOCK);
			ITEM(OPTRE_10Rnd_127x99_Subsonic, 120, MZ_STOCK);

			ITEM(OPTRE_4Rnd_145x114_APFSDS_Mag, 100, MZ_STOCK);
			ITEM(OPTRE_4Rnd_145x114_APFSDS_Mag_D, 100, MZ_STOCK);
			ITEM(OPTRE_4Rnd_145x114_HEDP_Mag, 200, MZ_STOCK);
			ITEM(OPTRE_4Rnd_145x114_HEDP_Mag_D, 200, MZ_STOCK);
			ITEM(OPTRE_4Rnd_145x114_HVAP_Mag, 90, MZ_STOCK);
			ITEM(OPTRE_4Rnd_145x114_HVAP_Mag_D, 90, MZ_STOCK);

			///special
			ITEM(OPTRE_7Rnd_20mm_APFSDS_Mag, 1000, MZ_STOCK); //yes, it's more powerfull, I can't belive it either
			ITEM(OPTRE_7Rnd_20mm_HEDP_Mag, 500, MZ_STOCK);
			
		};

		class pointershalo{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_optre", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(OPTRE_M12_Laser, 70, PN_STOCK);
			ITEM(OPTRE_M45_Flashlight, 70, PN_STOCK);
			ITEM(OPTRE_M6C_Flashlight, 70, PN_STOCK);
			ITEM(OPTRE_M6C_Vis_Red_Laser, 70, PN_STOCK);
			ITEM(OPTRE_M6C_Laser, 70, PN_STOCK);
			ITEM(OPTRE_M6G_Flashlight, 70, PN_STOCK);
			ITEM(OPTRE_M6G_Laser, 70, PN_STOCK);
			ITEM(OPTRE_M6G_Vis_Red_Laser, 70, PN_STOCK);
			ITEM(OPTRE_M7_Flashlight, 70, PN_STOCK);
			ITEM(OPTRE_M7_Laser, 70, PN_STOCK);
			ITEM(OPTRE_BMR_Laser, 70, PN_STOCK);
			ITEM(OPTRE_BMR_Flashlight, 70, PN_STOCK);
			ITEM(OPTRE_DMR_Light, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Flashlight, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Flashlight_Black, 70, PN_STOCK);
			ITEM(OPTRE_M6D_IR_Laser, 70, PN_STOCK);
			ITEM(OPTRE_M6D_IR_Black, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Vis_Red_Laser, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Vis_Red_Black, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Flashlight_Desert, 70, PN_STOCK);
			ITEM(OPTRE_M6D_IR_Desert, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Vis_Red_Desert, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Flashlight_Jungle, 70, PN_STOCK);
			ITEM(OPTRE_M6D_IR_Jungle, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Vis_Red_Jungle, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Carbine_Flashlight, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Carbine_IR, 70, PN_STOCK);
			ITEM(OPTRE_M6D_Carbine_Vis_Red, 70, PN_STOCK);
			ITEM(OPTRE_M44_Lykoi_Laser, 70, PN_STOCK);
		};

		class opticshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			ITEM(OPTRE_BR45_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR55HB_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR55HB_Scope_Grey, 150, MAGAZINE_STOCK);

			ITEM(OPTRE_BR_Classic_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_Raised, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_Tan_Raised, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_UNSC_Raised, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_Tan, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_UNSC, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_SLS, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_SLS_Tan, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_SLS_UNSC, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_SLS_Raised, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_SLS_Tan_Raised, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BR_Classic_Scope_SLS_UNSC_Raised, 150, MAGAZINE_STOCK);

			ITEM(OPTRE_M392_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M393_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M393_ACOG, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_BMR_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M7_Sight, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_MA5C_SmartLink, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_MA5_SmartLink, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_MA5_BUIS, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_MA37_Smartlink_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M393_EOTECH, 150, MAGAZINE_STOCK);

			ITEM(OPTRE_HMG38_CarryHandle, 150, MAGAZINE_STOCK);

			ITEM(OPTRE_M12_Optic, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M12_Optic_Green, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M12_Optic_Red, 150, MAGAZINE_STOCK);

			ITEM(OPTRE_M6C_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M6D_Scope, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M6D_Scope_Black, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M6D_Scope_Desert, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M6D_Scope_Jungle, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M6G_Scope, 150, MAGAZINE_STOCK);

			ITEM(OPTRE_SRM_Sight, 250, MAGAZINE_STOCK);

			ITEM(OPTRE_SRS99C_Scope, 350, MAGAZINE_STOCK);
			ITEM(OPTRE_SRS99_Scope, 350, MAGAZINE_STOCK);
			
			ITEM(Optre_Evo_Sight_Riser, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight_Riser_Innie, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight_Riser_Covie, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight_Riser_Spartan, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight_Riser_Yellow, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight_Innie, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight_Covie, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight_Spartan, 150, MAGAZINE_STOCK);
			ITEM(Optre_Evo_Sight_Yellow, 150, MAGAZINE_STOCK);
			
			ITEM(OPTRE_M73_SmartLink, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_M739_SAW_Smartlink, 150, MAGAZINE_STOCK);
			
			ITEM(Optre_Recon_Sight, 150, MAGAZINE_STOCK);
			ITEM(Optre_Recon_Sight_Desert, 150, MAGAZINE_STOCK);
			ITEM(Optre_Recon_Sight_Green, 150, MAGAZINE_STOCK);
			ITEM(Optre_Recon_Sight_Red, 150, MAGAZINE_STOCK);
			ITEM(Optre_Recon_Sight_Snow, 150, MAGAZINE_STOCK);
			ITEM(Optre_Recon_Sight_UNSC, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_SLS_M_3B, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_SLS_M_3B_Tan, 150, MAGAZINE_STOCK);
			ITEM(OPTRE_SLS_M_3B_UNSC, 150, MAGAZINE_STOCK);
		};

		class underbarrelhalo{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_grips"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(OPTRE_BR45Grip, 50, 20);
			ITEM(OPTRE_M247A1_Bipod, 50, 20);
			ITEM(OPTRE_M250_Bipod, 50, 20);
			ITEM(OPTRE_M26_AFG_Bipod, 50, 20);
			ITEM(OPTRE_M26_Grippod_Bipod, 50, 20);

			ITEM(OPTRE_Riot_Shield_Icon_A2S, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_CMA, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_Fist, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_Innie, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_Jolly, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_MEU, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_ODST, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_ODSTBlue, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_Police, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_UNSC, 5, 100);
			ITEM(OPTRE_Riot_Shield_Icon_Virgil, 5, 100);
		};

		class mischalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(C7_Remote_Mag, 400, MISC_STOCK);
			ITEM(C12_Remote_Mag, 400, MISC_STOCK);
			ITEM(M168_Remote_Mag, 500, MISC_STOCK);
			ITEM(M41_IED_C_Remote_Mag, 400, MISC_STOCK);
			ITEM(M41_IED_Remote_Mag, 400, MISC_STOCK);
			ITEM(M41_IED_B_Remote_Mag, 400, MISC_STOCK);
			///mines
			ITEM(UNSCMine_Range_Mag, 400, MISC_STOCK); 
			//grenades
			ITEM(OPTRE_AU44_122mm_Throwable, 100, MISC_STOCK);
			ITEM(OPTRE_ELB47_Strobe, 50, MISC_STOCK);
			ITEM(OPTRE_M2_Smoke_Blue, 20, MISC_STOCK);
			ITEM(OPTRE_M2_Smoke_Green, 20, MISC_STOCK);
			ITEM(OPTRE_M2_Smoke_Orange, 20, MISC_STOCK);
			ITEM(OPTRE_M2_Smoke_Purple, 20, MISC_STOCK);
			ITEM(OPTRE_M2_Smoke_Red, 20, MISC_STOCK);
			ITEM(OPTRE_M2_Smoke, 20, MISC_STOCK);
			ITEM(OPTRE_M2_Smoke_Yellow, 20, MISC_STOCK);
			ITEM(OPTRE_M8_Flare_Blue, 40, MISC_STOCK);
			ITEM(OPTRE_M8_Flare_Green, 40, MISC_STOCK);
			ITEM(OPTRE_M8_Flare, 40, MISC_STOCK);
			ITEM(OPTRE_M8_Flare_White, 40, MISC_STOCK);
			ITEM(OPTRE_M8_Flare_Yellow, 40, MISC_STOCK);
			ITEM(OPTRE_M9_Frag, 50, MISC_STOCK);
			ITEM(OPTRE_c7_remote_throwable_sticky_mag, 200, MISC_STOCK);

			//
			ITEM(OPTRE_Glasses_Cigar, 10, MISC_STOCK);
			ITEM(OPTRE_Glasses_Cigarette, 10, MISC_STOCK);
			ITEM(OPTRE_EyePiece, 10, MISC_STOCK);
			ITEM(OPTRE_HUD_blk_Glasses, 10, MISC_STOCK);
			ITEM(OPTRE_HUD_b_Glasses, 10, MISC_STOCK);
			ITEM(OPTRE_HUD_g_Glasses, 10, MISC_STOCK);
			ITEM(OPTRE_HUD_In_Glasses, 10, MISC_STOCK);
			ITEM(OPTRE_HUD_Glasses, 10, MISC_STOCK);
			ITEM(OPTRE_HUD_p_Glasses, 10, MISC_STOCK);
			ITEM(OPTRE_HUD_r_Glasses, 10, MISC_STOCK);
			ITEM(OPTRE_HUD_w_Glasses, 10, MISC_STOCK);
			ITEM(OPTRE_FW_None, 10, MISC_STOCK);
			ITEM(OPTRE_CBRN, 10, MISC_STOCK);
			ITEM(OPTRE_CBRN_S, 100, MISC_STOCK);
			ITEM(OPTRE_CBRN_S2, 100, MISC_STOCK);
			ITEM(OPTRE_Glasses_Visor, 10, MISC_STOCK);
			ITEM(OPTRE_Glasses_Visor_Blue, 10, MISC_STOCK);
		};

		class navigationhalo
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_optre", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(OPTRE_Smartfinder, 300, MISC_STOCK);
			ITEM(OPTRE_Binoculars, 200, MISC_STOCK);

			ITEM(OPTRE_NVGT_C, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_CNM_MVI_HURS, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_CNM_UAB_HURS, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_CNM, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_HUL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_HUL3, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_HUL3_Gray, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_HURS, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_HUL_MVI_HURS, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_HUL_UAB_HURS, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_HURS_CNM, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_HURS_HUL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_MVI, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_MVI_CNM, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_MVI_HUL, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_MVI_HURS, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_MVI_UL, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_MVI_UL_CNM, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_MVI_UL_HUL, 4000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA_CNM, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA_HUL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA_HURS, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA_HURS_CNM, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA_HURS_HUL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA_UL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA_UL_CNM, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UAB_CNM, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UAB_HUL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UAB_HURS, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UAB_UL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UAB_UL_CNM, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UAB_UL_HUL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UL_CNM, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UL_HUL, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UA_Spartan, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UAB, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_UAB_Spartan, 1000, MISC_STOCK);
			ITEM(OPTRE_NVG_Visor, 1000, MISC_STOCK);
		};

		class backpackshalo
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_backpacks"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(OPTRE_Armored_Matrix, 1000, MISC_STOCK);
			ITEM(OPTRE_Armored_Matrix_Spartan, 1000, MISC_STOCK);

			ITEM(OPTRE_ANPRC_515, 700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_515_Spartan, 1700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_Black, 700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_Black_Spartan, 1700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_Green, 700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_Green_Spartan, 1700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_Snow, 700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_Snow_Spartan, 1700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_Tan, 700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_Tan_Spartan, 1700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_URF, 700, MISC_STOCK);
			ITEM(OPTRE_ANPRC_521_URF_Spartan, 1700, MISC_STOCK);

			ITEM(OPTRE_ONI_Researcher_Suitcase, 200, MISC_STOCK);

			ITEM(OPTRE_Fury_Backpack_Nuke, 50000, MISC_STOCK);
			ITEM(OPTRE_Fury_Backpack_Nuke_Spartan, 50000, MISC_STOCK);

			ITEM(OPTRE_ILCS_Rucksack_Medical, 600, MISC_STOCK);
			ITEM(OPTRE_ILCS_Rucksack_Medical_Spartan, 1600, MISC_STOCK);
			ITEM(OPTRE_ILCS_Rucksack_Black, 600, MISC_STOCK);
			ITEM(OPTRE_ILCS_Rucksack_Black_Spartan, 1600, MISC_STOCK);
			ITEM(OPTRE_ILCS_Rucksack_Heavy, 700, MISC_STOCK);
			ITEM(OPTRE_ILCS_Rucksack_Heavy_Spartan, 1700, MISC_STOCK);

			ITEM(OPTRE_S12_SOLA_Jetpack, 1200, MISC_STOCK);
			ITEM(OPTRE_S12_SOLA_Jetpack_Heavy, 1300, MISC_STOCK);
			ITEM(OPTRE_S12_SOLA_Jetpack_Medical, 1300, MISC_STOCK);
			ITEM(OPTRE_S12_SOLA_Jetpack_Spartan, 2200, MISC_STOCK);

			ITEM(OPTRE_Tripod_Bag_Black, 500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Des, 500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Des_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_DME, 500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_DME_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Green, 500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Green_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Snow, 500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Snow_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Spartan_Black, 1500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Wdl1, 500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Wdl1_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Wdl2, 500, MISC_STOCK);
			ITEM(OPTRE_Tripod_Bag_Innie_Wdl2_Spartan, 1500, MISC_STOCK);

			ITEM(OPTRE_Turret_Bag_Black, 500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Des, 500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Des_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_DME, 500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_DME_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Green, 500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Green_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Snow, 500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Snow_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Spartan_Black, 1500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Woodland1, 500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Woodland1_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Woodland2, 500, MISC_STOCK);
			ITEM(OPTRE_Turret_Bag_Woodland2_Spartan, 1500, MISC_STOCK);

			ITEM(OPTRE_UNSC_Backpack, 600, MISC_STOCK);

			ITEM(OPTRE_UNSC_Rucksack, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_Rucksack_Spartan, 1600, MISC_STOCK);
			ITEM(OPTRE_UNSC_Rucksack_Heavy, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_Rucksack_Heavy_Spartan, 1700, MISC_STOCK);
			ITEM(OPTRE_UNSC_Rucksack_Medic, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_Rucksack_Medic_Spartan, 1600, MISC_STOCK);
		};

		class vestshalo
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_vests"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(OPTRE_Ins_BJ_Armor, 700, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Armor_Spartan, 1700, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Armor_Des, 700, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Armor_Snw, 700, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Armor_Wdl, 700, MISC_STOCK);

			ITEM(OPTRE_Vest_CMA_Heavy, 500, MISC_STOCK);
			ITEM(OPTRE_Vest_CMA_Light, 400, MISC_STOCK);
			ITEM(OPTRE_Vest_CPD_Heavy, 500, MISC_STOCK);
			ITEM(OPTRE_Vest_CPD_Light, 400, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_MG_DES, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_MG_MAR, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_MG_OLI, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_MG_SNO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_MG_TRO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_MG_URB, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_MG_WDL, 600, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_Breacher_DES, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Breacher_MAR, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Breacher_OLI, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Breacher_SNO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Breacher_TRO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Breacher_URB, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Breacher_WDL, 600, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_Corpsman_MAR, 600, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_Grenadier_DES, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Grenadier_MAR, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Grenadier_OLI, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Grenadier_SNO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Grenadier_TRO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Grenadier_URB, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Grenadier_WDL, 500, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor1_DES, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor1_MAR, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor1_OLI, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor1_SNO, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor1_TRO, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor1_URB, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor1_WDL, 450, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor3_DES, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor3_MAR, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor3_OLI, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor3_SNO, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor3_TRO, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor3_URB, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor3_WDL, 450, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_Marksman_DES, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Marksman_MAR, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Marksman_OLI, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Marksman_SNO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Marksman_TRO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Marksman_URB, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Marksman_WDL, 500, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_Medic_DES, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Medic_OLI, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Medic_SNO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Medic_TRO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Medic_URB, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Medic_WDL, 600, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor2_DES, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor2_MAR, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor2_OLI, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor2_SNO, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor2_TRO, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor2_URB, 450, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor2_WDL, 450, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_Pilot_AF, 450, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_Rifleman_DES, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Rifleman_MAR, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Rifleman_OLI, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Rifleman_SNO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Rifleman_TRO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Rifleman_URB, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Rifleman_WDL, 500, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_Sniper_DES, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Sniper_MAR, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Sniper_OLI, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Sniper_SNO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Sniper_TRO, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Sniper_URB, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Sniper_WDL, 700, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_SoftD, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_SoftDK, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Soft, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_Spartan, 1400, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor_TL_DES, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_TL_MAR, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_TL_OLI, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_TL_SNO, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_TL_TRO, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_TL_URB, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor_TL_WDL, 550, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52A_Armor4_DES, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor4_MAR, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor4_OLI, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor4_SNO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor4_TRO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor4_URB, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52A_Armor4_WDL, 500, MISC_STOCK);

			ITEM(OPTRE_UNSC_M52D_Armor, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Convader, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Deltagamer, 1700, MISC_STOCK); //british much?
			ITEM(OPTRE_UNSC_M52D_Armor_Demolitions, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Dog, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Evolved, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Evolved_Green, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Evolved_White, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Forky, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Jedi, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Leigh, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Light, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Lum, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Marksman, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Medic, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Namenai, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Nighto, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Rifleman, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Scorch, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Scout, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Scouter407, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Sniper, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Spartan, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Storey, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Stripes, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Thomas, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Venom, 700, MISC_STOCK);
			ITEM(OPTRE_UNSC_M52D_Armor_Wilk, 700, MISC_STOCK);

			ITEM(OPTRE_MJOLNIR_MkVBArmor_Human, 3000, MISC_STOCK);

			ITEM(OPTRE_Ins_URF_Armor1, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Desert_Armor1, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Desert_Armor1_Flat, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Armor1_Flat, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Jungle_Armor1, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Jungle_Armor1_Flat, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Snow_Armor1, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Snow_Armor1_Flat, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Tundra_Armor1, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Woodland_Armor1, 550, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Woodland_Armor1_Flat, 550, MISC_STOCK);
		};

		class uniformshalo
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_uniforms"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			
			ITEM(OPTRE_ONI_Researcher_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_ONI_Researcher_Uniform_Light, 200, MISC_STOCK);

			ITEM(OPTRE_Ins_BJ_Undersuit, 350, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Undersuit_Spartan, 1350, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Undersuit_Des, 350, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Undersuit_Snw, 350, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Undersuit_Wdl, 350, MISC_STOCK);

			ITEM(OPTRE_Ins_ER_jacket_brown_surplus, 100, MISC_STOCK);
			ITEM(OPTRE_CMA_Uniform, 100, MISC_STOCK);
			ITEM(OPTRE_CMA_Uniform_Rolled, 100, MISC_STOCK);
			ITEM(OPTRE_CPD_Uniform, 100, MISC_STOCK);
			ITEM(OPTRE_CPD_Uniform_Rolled, 100, MISC_STOCK);

			ITEM(OPTRE_UNSC_Army_Uniform_R_BLKURB_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_BLK_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_DESWDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_DES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_AFMAR_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Airforce_Uniform_R_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_R_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_OLITRO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_OLIWDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_OLI_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_SNO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_TRO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_URB_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_WDLDES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_WDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_BLKURB, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_BLK, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_DESWDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_DES, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_AFMAR, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Airforce_Uniform_R, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_R, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_OLITRO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_OLIWDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_OLI, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_SNO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_TRO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_URB, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_WDLDES, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_R_WDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_BLKURB_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_BLK_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_DESWDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_DES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_AFMAR_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Airforce_Uniform_S_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_S_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_OLITRO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_OLIWDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_OLI_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_SNO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_TRO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_URB_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_WDLDES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_WDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_BLKURB, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_BLK, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_DESWDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_DES, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_AFMAR, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Airforce_Uniform_S, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_S, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_OLITRO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_OLIWDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_OLI, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_SNO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_TRO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_URB, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_WDLDES, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_WDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_Gloves_WDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_S_Gloves_Slim_WDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_BLKURB_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_BLK_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_DESWDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_DES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_AFMAR_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Airforce_Uniform_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_OLITRO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_OLIWDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_OLI_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_SNO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_TRO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_URB_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_WDLDES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_WDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_Spartan, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T3_DES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_T3_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_OLI_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_TRO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_URB_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T3_WDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_BLK_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_BLK_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_OLI_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_DES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_TRO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_WDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T3_BLK_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_DES_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_T2_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_T_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_WDL_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_SNO_SlimLeg, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T3_DES, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_T3, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_OLI, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_TRO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_URB, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T3_WDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_BLK, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_BLK, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_DES, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_TRO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_WDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T3_BLK, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_DES, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_T2, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform_T, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T2_WDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_T_SNO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_BLKURB, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_BLK, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_DESWDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_DES, 300, MISC_STOCK);
			ITEM(OPTRE_DME_Temperate_Uniform, 300, MISC_STOCK);
			ITEM(OPTRE_DME_Uniform, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_AFMAR, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Airforce_Uniform, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Marine_Uniform, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_ODST_Uniform, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_OLITRO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_OLIWDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_SNO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_TRO, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_URB, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_WDLDES, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_WDL, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Army_Uniform_Spartan_Tee, 1300, MISC_STOCK);

			ITEM(OPTRE_Ins_ER_uniform_GAgreen, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_uniform_GAtan, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_uniform_GGgrey, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_uniform_GGod, 200, MISC_STOCK);

			ITEM(OPTRE_UNSC_Dress_Uniform_gray, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_green, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_Green_Colonel, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_Green_General, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_Green_Major, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_medical, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_odst, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_ODST_Major, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_ONI_Captain, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_ONI_Colonel, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_ONI_Major, 100, MISC_STOCK);
			ITEM(OPTRE_MJOLNIR_Dress_Uniform, 1100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_NBlue, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_NBlue_Colonel, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_NBlue_General, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_NBlue_Major, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_white, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_White_Captain, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_White_Fleet, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Uniform_White_Rear, 100, MISC_STOCK);

			ITEM(OPTRE_MJOLNIR_Undersuit, 1300, MISC_STOCK);

			ITEM(OPTRE_UNSC_MJOLNIR_Undersuit_Human, 2000, MISC_STOCK);

			ITEM(OPTRE_UNSC_Navy_Uniform_Blue, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Navy_Uniform_Gray, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Navy_Uniform_Olive, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Navy_Uniform_ONI, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Navy_Uniform_Orange, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Navy_Uniform_Red, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Navy_Uniform_White, 300, MISC_STOCK);
			ITEM(OPTRE_UNSC_Navy_Uniform_Yellow, 300, MISC_STOCK);

			ITEM(OPTRE_Ins_ER_jacket_od_surplus, 100, MISC_STOCK);
			
			ITEM(OPTRE_UNSC_PT_ODST_Uniform, 100, MISC_STOCK);
			ITEM(OPTRE_UNSC_PT_Uniform, 100, MISC_STOCK);

			ITEM(OPTRE_Ins_ER_rolled_jean_orca, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_rolled_OD_blknblu, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_rolled_OD_blknred, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_rolled_OD_crimson, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_rolled_surplus_black, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_rolled_surplus_crimson, 100, MISC_STOCK);

			ITEM(OPTRE_UNSC_Army_Uniform_T2_OLI, 300, MISC_STOCK);

			ITEM(OPTRE_Ins_ER_jacket_surgeon1, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_jacket_surgeon2, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_jacket_surplus_brown, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_jacket_surplus_OD, 100, MISC_STOCK);
			ITEM(OPTRE_Ins_ER_jacket_surplus_redshirt, 100, MISC_STOCK);

			ITEM(OPTRE_Ins_URF_Combat_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Desert_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Desert_Flat_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Flat_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Jungle_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Jungle_Flat_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Snow_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Snow_Flat_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Tundra_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Woodland_Uniform, 200, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Combat_Woodland_Flat_Uniform, 200, MISC_STOCK);
		};

		class helmetshalo
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_helmets"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			///////helmets
			
			ITEM(OPTRE_ONI_Researcher_Headgear, 200, MISC_STOCK);
			ITEM(OPTRE_ONI_Researcher_Headgear_p, 250, MISC_STOCK);

			ITEM(OPTRE_Ins_BJ_Helmet, 700, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Helmet_Des, 700, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Helmet_Snw, 700, MISC_STOCK);
			ITEM(OPTRE_Ins_BJ_Helmet_Wdl, 700, MISC_STOCK);

			ITEM(OPTRE_h_Booniehat_Grey, 200, MISC_STOCK);
			ITEM(OPTRE_Cap_FinalDawn, 20, MISC_STOCK);
			ITEM(OPTRE_UNSC_Cap_ODST, 20, MISC_STOCK);

			ITEM(OPTRE_CPD_CH251_Brown, 350, MISC_STOCK);
			ITEM(OPTRE_CPD_CH251_DME, 350, MISC_STOCK);
			ITEM(OPTRE_CPD_CH251_URF, 350, MISC_STOCK);
			ITEM(OPTRE_CPD_CH251_White, 350, MISC_STOCK);
			ITEM(OPTRE_CPD_CH251P, 350, MISC_STOCK);

			ITEM(OPTRE_UNSC_CH252_Helmet2_DES_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_DES, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_MAR_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_MAR, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_OLI_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_OLI, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_SNO_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_SNO, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_TRO_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_TRO, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_URB_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_URB, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_WDL_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_WDL, 400, MISC_STOCK);

			ITEM(OPTRE_UNSC_CH252_Helmet3_DES, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet3_OLI, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet3_TRO, 500, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet3_WDL, 500, MISC_STOCK);

			ITEM(OPTRE_UNSC_CH252_Helmet_DES_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_DES, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_MAR_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_MAR, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_OLI_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_OLI, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_SNO_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_SNO, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_TRO_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_TRO, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_URB_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_URB, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_WDL_MED, 400, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_WDL, 400, MISC_STOCK);

			ITEM(OPTRE_UNSC_CH252A_Black_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252A_Brown_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252A_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252A_Marine_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252A_Tan_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252A_Tropic_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252A_White_Helmet, 550, MISC_STOCK);

			ITEM(OPTRE_UNSC_CH252D_Helmet, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Deltagamer, 1000, MISC_STOCK); //brits!
			ITEM(OPTRE_UNSC_CH252D_Helmet_Dog, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Evolved_Green, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Evolved_White, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Evolved, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Convader, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Forky, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Jedi, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Leigh, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Lum, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Namenai, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Nighto, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Scorch, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Scouter407, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Storey, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Stripes, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Thomas, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Venom, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252D_Helmet_Wilk, 600, MISC_STOCK);

			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Black, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Brown, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Marine, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Snow, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Tan, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Tropic, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Black, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Brown, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Marine, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Snow, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Tan, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Tropic, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_3_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_4_Helmet, 550, MISC_STOCK);

			ITEM(OPTRE_CH255_Security_Basic_Type_1_Helmet, 500, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Basic_Type_1_Light_Helmet, 1450, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Basic_Type_2_Helmet, 500, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Basic_Type_3_Helmet, 500, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Basic_Type_3_Helmet_Black, 500, MISC_STOCK);

			ITEM(OPTRE_CH255_Security_Type_1_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Type_2_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Type_3_Helmet, 550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Type_4_Helmet, 550, MISC_STOCK);

			ITEM(OPTRE_CMA_Helmet, 400, MISC_STOCK);
			ITEM(OPTRE_CMA_Helmet_chops, 500, MISC_STOCK);
			ITEM(OPTRE_CMA_Helmet_ear, 500, MISC_STOCK);
			ITEM(OPTRE_CMA_Helmet_headset, 500, MISC_STOCK);

			ITEM(OPTRE_CPD_Beret, 30, MISC_STOCK);
			ITEM(OPTRE_CPD_Cap, 150, MISC_STOCK);

			ITEM(OPTRE_UNSC_Dress_Hat, 50, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Hat_Army, 50, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Hat_Navy, 50, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Hat_ODST, 50, MISC_STOCK);
			ITEM(OPTRE_UNSC_Dress_Hat_ONI, 50, MISC_STOCK);
			ITEM(OPTRE_MJOLNIR_Dress_Hat, 1050, MISC_STOCK);

			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_DES_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_DES, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_MAR, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_OLI_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_OLI, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_SNO_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_SNO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_TRO_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_TRO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_URB_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_URB, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_WDL_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet2_Vacuum_WDL, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_DES_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_DES, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_MAR_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_MAR, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_OLI_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_OLI, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_SNO_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_SNO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_TRO_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_TRO, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_URB_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_URB, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_WDL_MED, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_CH252_Helmet_Vacuum_WDL, 600, MISC_STOCK);

			ITEM(OPTRE_Helmet_NavyDeckCrew, 500, MISC_STOCK);

			ITEM(OPTRE_UNSC_CQB_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_CQC_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_EOD_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_JFO_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Commando_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Commando_Helmet_Black, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Commando_Helmet_Blue, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Commando_Helmet_Red, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Security_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Operator_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_HRPilot_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_HRPilot_Helmet_Haunted, 3000, MISC_STOCK);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Human, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Scout_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Scout_Black_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Scout_Blue_Helmet, 3000, MISC_STOCK);
			ITEM(OPTRE_UNSC_Scout_Red_Helmet, 3000, MISC_STOCK);

			ITEM(OPTRE_h_PatrolCap_Brown, 150, MISC_STOCK);
			ITEM(OPTRE_h_PatrolCap_Green, 150, MISC_STOCK);

			ITEM(OPTRE_UNSC_PatrolCap_Army, 50, MISC_STOCK);
			ITEM(OPTRE_UNSC_PatrolCap_Marines, 50, MISC_STOCK);

			ITEM(OPTRE_PatrolCap_Navy, 150, MISC_STOCK);

			ITEM(OPTRE_UNSC_Recon_Helmet, 700, MISC_STOCK);

			ITEM(OPTRE_UNSC_Watchcap, 50, MISC_STOCK);

			ITEM(OPTRE_Ins_URF_Helmet1, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet4, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet4_Brown, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet4_White, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet3, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet3_Brown, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet3_White, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet2, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet2_Brown, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet2_White, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet1_Brown, 400, MISC_STOCK);
			ITEM(OPTRE_Ins_URF_Helmet1_White, 400, MISC_STOCK);

			ITEM(OPTRE_UNSC_VX16_Helmet, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_blk_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_blk, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_des_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_des, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_oli_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_oli, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_wht_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskV_wht, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_blk_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_blk, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_des_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_des, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_oli_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_oli, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_wht_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_wht, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_blk_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_blk, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_des_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_des, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_oli_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_oli, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_wht_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetNV_wht, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_blk_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_blk, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_des_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_des, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_oli_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_oli, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_wht_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskSV_wht, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_blk_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_blk, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_des_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_des, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_oli_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_oli, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_wht_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_MaskS_wht, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_blk_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_blk, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_des_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_des, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_oli_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_oli, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_wht_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_HelmetV_wht, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_blk_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_blk, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_des_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_des, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_oli_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_oli, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_Mask_uwu, 10000, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_wht_med, 600, MISC_STOCK);
			ITEM(OPTRE_UNSC_VX16_Helmet_wht, 600, MISC_STOCK);
		};

		class spartanhelmetshalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_spartanhelmets"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(OPTRE_Ins_BJ_Helmet_Spartan, 1700, MISC_STOCK);

			ITEM(OPTRE_UNSC_CH252_Helmet_Spartan, 1400, MISC_STOCK);

			ITEM(OPTRE_UNSC_CH252D_Helmet_Spartan, 1600, MISC_STOCK);

			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Spartan, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Spartan_Black, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Spartan_Brown, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Spartan_Marine, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Spartan_Snow, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Spartan_Tan, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_1_Helmet_Spartan_Tropic, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Spartan, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Spartan_Black, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Spartan_Brown, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Spartan_Marine, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Spartan_Snow, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Spartan_Tan, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_2_Helmet_Spartan_Tropic, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_3_Helmet_Spartan, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Advanced_Type_4_Helmet_Spartan, 1550, MISC_STOCK);
			
			ITEM(OPTRE_CH255_Security_Basic_Type_1_Light_Helmet_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Basic_Type_1_Helmet_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Basic_Type_2_Helmet_Spartan, 1500, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Basic_Type_3_Helmet_Spartan_Black, 1500, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Basic_Type_3_Helmet_Spartan, 1500, MISC_STOCK);

			ITEM(OPTRE_CH255_Security_Type_1_Helmet_Spartan, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Type_2_Helmet_Spartan, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Type_3_Helmet_Spartan, 1550, MISC_STOCK);
			ITEM(OPTRE_CH255_Security_Type_4_Helmet_Spartan, 1550, MISC_STOCK);

			ITEM(OPTRE_MJOLNIR_CAP, 1000, MISC_STOCK);

			// Spartan gear
			ITEM(OPTRE_MJOLNIR_Air_Assault, 5000, 10);
			ITEM(OPTRE_MJOLNIR_EVAHelmet, 5000, 10);
			ITEM(OPTRE_MJOLNIR_EVAHelmet_Emily, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Mk4Helmet, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Mk4Helmet_Blue, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Mk4Helmet_Red, 5000, 10);
			ITEM(OPTRE_MJOLNIR_CQB, 5000, 10);
			ITEM(OPTRE_MJOLNIR_CQC, 5000, 10);
			ITEM(OPTRE_MJOLNIR_EOD, 5000, 10);
			ITEM(OPTRE_MJOLNIR_JFO, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_HUL3_UA, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Security, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Operator, 5000, 10);
			ITEM(OPTRE_MJOLNIR_ODST, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Pilot, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Pilot_Haunted, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Pilot_UA, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Pilot_UA_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_UA, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_UA_HUL, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_BLKV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_BLUV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_DefaultV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_SLVV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Black, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Black_BlackV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Black_BlueV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Black_DefaultV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Black_SLVV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Blue, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Blue_BlackV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Blue_BlueV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Blue_SilverV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Blue_DefaultV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Red, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Red_BlackV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Red_BlueV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Red_SilverV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBHelmet_Red_DefaultV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_BlackV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_BlackV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_BlackV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_BlackV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_BlueV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_BlueV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_DefaultV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_DefaultV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_SilverV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Black_SilverV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_BlueV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_BlueV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_BlackV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_BlackV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_BlueV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_BlueV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_DefaultV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_DefaultV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_SilverV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Blue_SilverV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_DefaultV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_DefaultV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_BlackV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_BlackV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_BlueV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_BlueV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_DefaultV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_DefaultV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_SilverV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_Red_SilverV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_SilverV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Commando_SilverV_HUL3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVI_HR, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Scout, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MPHelmet, 5000, 10);
			ITEM(OPTRE_MJOLNIR_ReconHelmet, 5000, 10);
		};

		class spartanarmorhalo{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_optre", localize "STR_A3AU_spartanarmor"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			// Spartan gear
			ITEM(OPTRE_MJOLNIR_Mk4Armor, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor2_Collar, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor2_Knees_CollarBase, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando_Collar, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando_Knees_CollarBase, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoCQC_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoCQC_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoCQC_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCCommando_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCCommando_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCCommando_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoPara_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoPara_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoPara_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCommando_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCommando_FJPARA_Knees2,, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCommando_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoGrenadier_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoGrenadier_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoGrenadier_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCommando_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCommando_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCommando_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoMarkV_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoMarkV_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoMarkV_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCommando_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCommando_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCommando_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoSecurity_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoSecurity_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoSecurity_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCommando_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCommando_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCommando_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando7, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Collar_Gren_UA3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA_Knees3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC9, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default8, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA8, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV7, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor7, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC_Collar, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC_Knees_CollarBase, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoCQC_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoCQC_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoCQC_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCCommando_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCCommando_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCCommando_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCPara_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCPara_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCPara_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCQC_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCQC_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCQC_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCGrenadier_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCGrenadier_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCGrenadier_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCQC_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCQC_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCQC_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCMarkV_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCMarkV_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCMarkV_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCQC_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCQC_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCQC_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCSecurity_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCSecurity_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCSecurity_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCQC_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCQC_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCQC_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC12, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Collar_Gren_UA6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA_Knees6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC14, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default_Black, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC13, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default11, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoPara_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoPara_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoPara_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCommando_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCommando_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCommando_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCPara_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCPara_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCPara_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCQC_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCQC_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaCQC_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierPara_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierPara_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierPara_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaGrenadier_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaGrenadier_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaGrenadier_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVPara_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVPara_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVPara_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaMarkV_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaMarkV_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaMarkV_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaSecurity_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaSecurity_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaSecurity_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityPara_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityPara_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityPara_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA_Collar, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA_Knees_CollarBase, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC8, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default7, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA7, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Collar_Gren_UA2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier_Collar, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier_Knees_CollarBase, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoGrenadier_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoGrenadier_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoGrenadier_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCommando_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCommando_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCommando_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCGrenadier_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCGrenadier_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCGrenadier_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCQC_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCQC_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierCQC_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierPara_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierPara_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierPara_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaGrenadier_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaGrenadier_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaGrenadier_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierMarkV_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierMarkV_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierMarkV_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVGrenadier_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVGrenadier_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVGrenadier_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierSecurity_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierSecurity_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierSecurity_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityGrenadier_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityGrenadier_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityGrenadier_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier8, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC11, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default10, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier7, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Collar_Gren_UA5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA_Knees5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier9, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV_Collar, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV_Knees_CollarBase, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando8, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC10, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default9, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA9, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV8, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Collar_Gren_UA4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA_Knees4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor8, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCommando_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCommando_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCommando_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoMarkV_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoMarkV_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoMarkV_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCMarkV_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCMarkV_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCMarkV_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCQC_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCQC_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVCQC_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVPara_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVPara_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVPara_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaMarkV_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaMarkV_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaMarkV_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierMarkV_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierMarkV_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierMarkV_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVGrenadier_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVGrenadier_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVGrenadier_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVSecurity_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVSecurity_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVSecurity_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityMarkV_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityMarkV_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityMarkV_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoSecurity_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoSecurity_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CommandoSecurity_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCommando_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCommando_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCommando_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCSecurity_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCSecurity_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQCSecurity_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCQC_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCQC_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityCQC_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaSecurity_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaSecurity_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_ParaSecurity_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityPara_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityPara_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityPara_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierSecurity_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierSecurity_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_GrenadierSecurity_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityGrenadier_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityGrenadier_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityGrenadier_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVSecurity_FJPARA_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVSecurity_FJPARA_Knees2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MarkVSecurity_FJPARA_Knees_Collar2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityMarkV_FJPARA_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityMarkV_FJPARA_Knees1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_SecurityMarkV_FJPARA_Knees_Collar1, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor4, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Commando5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_CQC7, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Default6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor3, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA6, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Grenadier2, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_MkV5, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Collar_Gren_UA, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_FJPARA_Knees, 5000, 10);
			ITEM(OPTRE_MJOLNIR_MkVBArmor_Black, 5000, 10);
			ITEM(OPTRE_MJOLNIR_Mk4Armor_Blue, 5000, 10);
    		ITEM(OPTRE_MJOLNIR_Mk4Armor_Red, 5000, 10);
    		ITEM(OPTRE_MJOLNIR_MkVBArmor_Default_Blue, 5000, 10);
    		ITEM(OPTRE_MJOLNIR_MkVBArmor_Default_Red, 5000, 10);
    		ITEM(OPTRE_MJOLNIR_MkVBArmor_Blue, 5000, 10);
    		ITEM(OPTRE_MJOLNIR_MkVBArmor_Red, 5000, 10);
		};
