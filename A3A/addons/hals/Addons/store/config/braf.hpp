		///////////////////////////////////////////////////////
		// BRAF
		///////////////////////////////////////////////////////
		class handgunsBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(braf_imbel_m973, 150, PISTOL_STOCK) // braf_9Rnd_9mm
			ITEM(braf_PT92, 150, PISTOL_STOCK) // 16Rnd_9x21_Mag
			
		};

		class smgBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(Braf_MT12, 300, PISTOL_STOCK) // 30Rnd_9x21_Mag
			ITEM(Braf_m16a1_carbine_9mm, 350, PISTOL_STOCK) // braf_30Rnd_9x19
			ITEM(Braf_Mekanika_URU_v1, 300, PISTOL_STOCK) 

		};

		class launchersBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(braf_launch_alac, 250, 50)
			ITEM(braf_m20a1superbazooka, 450, 50)
			ITEM(braf_Gustav, 550, 50)
			ITEM(braf_Igla, 650, 50)

		};

		class launcherMagazinesBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			ITEM(braf_Igla_missile, 200, 25)

		};

		class specialWeaponsBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(braf_boito_14_oldstock, 300, RIFLE_STOCK) // BRAF_Boito_5Rnd_buck
			ITEM(braf_boito_14_nostock, 250, RIFLE_STOCK)  // BRAF_Boito_5Rnd_riot
			ITEM(braf_boito_14_newstock, 350, RIFLE_STOCK) // BRAF_Boito_5Rnd_slug
			
			ITEM(braf_boito_20_oldstock, 350, RIFLE_STOCK) // BRAF_Boito_8Rnd_buck
			ITEM(braf_boito_20_nostock, 300, RIFLE_STOCK) // BRAF_Boito_8Rnd_slug
			ITEM(braf_boito_20_newstock, 400, RIFLE_STOCK) // BRAF_Boito_7Rnd_riot
			
			ITEM(braf_boito_24_oldstock, 400, RIFLE_STOCK) 
			ITEM(braf_boito_24_nostock, 350, RIFLE_STOCK) 
			ITEM(braf_boito_24_newstock, 450, RIFLE_STOCK)

		};

		class sniperRiflesBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(braf_HK417, 850, RIFLE_STOCK) // 20Rnd_762x51_HK417_mag
			ITEM(Braf_aglc_preto, 600, RIFLE_STOCK) // braf_5Rnd_308
			ITEM(Braf_aglc_marro, 600, RIFLE_STOCK) 
			ITEM(Braf_aglc_camo, 600, RIFLE_STOCK) // braf_5Rnd_308_red
			ITEM(Braf_Fal, 500, RIFLE_STOCK) // braf_20Rnd_762x51
			ITEM(Braf_md1, 480, RIFLE_STOCK) // braf_20Rnd_762x51_green
			ITEM(Braf_md1_Grip, 520, RIFLE_STOCK) // braf_20Rnd_762x51_red
			ITEM(Braf_md1a1, 490, RIFLE_STOCK) // braf_20Rnd_762x51_yellow
			ITEM(Braf_md1a1_Grip, 530, RIFLE_STOCK) 
			ITEM(Braf_MD1_tactical, 580, RIFLE_STOCK) 
			ITEM(Braf_ParaFal, 470, RIFLE_STOCK) 
			ITEM(Braf_Mosquefal, 350, RIFLE_STOCK) // braf_Clip_5Rnd_762x51	braf_Clip_5Rnd_762x51_Red
			ITEM(AMF_Perseis_II_02_F, 1500, RIFLE_STOCK) // 7Rnd_Perseis_II_mag 7Rnd_Perseis_II_mag_green 7Rnd_Perseis_II_mag_red 7Rnd_Perseis_II_mag_yellow
			ITEM(braf_pgm_ultimaratio, 900, RIFLE_STOCK) // 10Rnd_762x51_Mag
			ITEM(Braf_msr_308, 750, RIFLE_STOCK) // braf_msr_10Rnd_308 braf_msr_10Rnd_308_red
			ITEM(braf_msr_338, 850, RIFLE_STOCK) // braf_msr_5Rnd_338 braf_msr_5Rnd_338_red
			
		};

		class mgBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(Braf_lmga4, 800, RIFLE_STOCK) // CUP_60Rnd_556x45_SureFire
			ITEM(Braf_mag, 1100, RIFLE_STOCK) // Braf_75Rnd_mag58_mag Braf_50Rnd_mag58_mag
			ITEM(braf_Minimi, 1000, RIFLE_STOCK) // 200Rnd_556x45_Box_F
			ITEM(Braf_FAP, 800, RIFLE_STOCK) // braf_40Rnd_762x51 braf_40Rnd_762x51_red

		};

		class riflesBraf
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(Braf_m16a1_carbine, 400, RIFLE_STOCK) // braf_20Rnd_556x45
			ITEM(Braf_m16a1, 450, RIFLE_STOCK) // braf_20Rnd_556x45_red
			ITEM(Braf_m16a1e1, 450, RIFLE_STOCK) // braf_30Rnd_556x45
			ITEM(Braf_m16a2, 420, RIFLE_STOCK) // braf_30Rnd_556x45_green
			ITEM(braf_m16a2_mod, 480, RIFLE_STOCK) // braf_30Rnd_556x45_red
			ITEM(braf_m16a4, 550, RIFLE_STOCK) // braf_30Rnd_556x45_yellow
			ITEM(braf_m16a4_mod, 600, RIFLE_STOCK)
			ITEM(Braf_m4a1, 380, RIFLE_STOCK) 
			ITEM(Braf_m4a1_ris, 440, RIFLE_STOCK) 
			ITEM(braf_hk33, 410, RIFLE_STOCK) // braf_30Rnd_556x45_HK 
			ITEM(braf_hk33A3, 430, RIFLE_STOCK) // braf_30Rnd_556x45_HK_Mix_green braf_30Rnd_556x45_HK_Mix_red
			ITEM(braf_HK416_short, 530, RIFLE_STOCK)
			ITEM(braf_HK416_long, 560, RIFLE_STOCK)
			ITEM(Braf_IA2, 550, RIFLE_STOCK)
			ITEM(Braf_IA2_Grip, 570, RIFLE_STOCK)
			ITEM(Braf_IA2_Carbine, 520, RIFLE_STOCK)
			ITEM(Braf_IA2_Carbine_Grip, 540, RIFLE_STOCK)
			ITEM(braf_MD97LC, 450, RIFLE_STOCK)
			ITEM(braf_MD97LC_GL, 550, RIFLE_STOCK)
			ITEM(Braf_Lapa, 2500, 1) // braf_Lapa30Rnd_556x45 braf_Lapa30Rnd_556x45_red
			ITEM(braf_sig_551, 550, RIFLE_STOCK) // braf_sig_556x45 braf_sig_556x45_Mix_green braf_sig_556x45_Mix_red

		};

		class magazinesBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			ITEM(braf_9Rnd_9mm, 15, MZ_STOCK)
			ITEM(16Rnd_9x21_Mag, 17, MZ_STOCK)
			ITEM(30Rnd_9x21_Mag, 25, MZ_STOCK)
			ITEM(braf_30Rnd_9x19, 25, MZ_STOCK)
			ITEM(BRAF_Boito_5Rnd_buck, 15, MZ_STOCK)
			ITEM(BRAF_Boito_5Rnd_riot, 17, MZ_STOCK)
			ITEM(BRAF_Boito_5Rnd_slug, 17, MZ_STOCK)
			ITEM(BRAF_Boito_8Rnd_buck, 19, MZ_STOCK)
			ITEM(BRAF_Boito_8Rnd_slug, 23, MZ_STOCK)
			ITEM(BRAF_Boito_7Rnd_riot, 21, MZ_STOCK)
			ITEM(20Rnd_762x51_HK417_mag, 57, MZ_STOCK)
			ITEM(braf_5Rnd_308, 47, MZ_STOCK)
			ITEM(braf_5Rnd_308_red, 48, MZ_STOCK)
			ITEM(braf_20Rnd_762x51, 55, MZ_STOCK)
			ITEM(braf_20Rnd_762x51_green, 57, MZ_STOCK)
			ITEM(braf_20Rnd_762x51_red, 57, MZ_STOCK)
			ITEM(braf_20Rnd_762x51_yellow, 57, MZ_STOCK)
			ITEM(braf_Clip_5Rnd_762x51, 15, MZ_STOCK)
			ITEM(braf_Clip_5Rnd_762x51_Red, 15, MZ_STOCK)
			ITEM(7Rnd_Perseis_II_mag, 127, MZ_STOCK)
			ITEM(7Rnd_Perseis_II_mag_green, 127, MZ_STOCK)
			ITEM(7Rnd_Perseis_II_mag_red, 127, MZ_STOCK)
			ITEM(7Rnd_Perseis_II_mag_yellow, 127, MZ_STOCK)
			ITEM(10Rnd_762x51_Mag, 90, MZ_STOCK)
			ITEM(braf_msr_10Rnd_308, 85, MZ_STOCK)
			ITEM(braf_msr_10Rnd_308_red, 85, MZ_STOCK)
			ITEM(braf_msr_5Rnd_338, 90, MZ_STOCK)
			ITEM(braf_msr_5Rnd_338_red, 95, MZ_STOCK)
			ITEM(Braf_75Rnd_mag58_mag, 135, MZ_STOCK)
			ITEM(Braf_50Rnd_mag58_mag, 95, MZ_STOCK)
			ITEM(200Rnd_556x45_Box_F, 250, MZ_STOCK)
			ITEM(braf_40Rnd_762x51, 65, MZ_STOCK)
			ITEM(braf_40Rnd_762x51_red, 65, MZ_STOCK)
			ITEM(braf_20Rnd_556x45, 40, MZ_STOCK)
			ITEM(braf_20Rnd_556x45_red, 42, MZ_STOCK)
			ITEM(braf_30Rnd_556x45, 55, MZ_STOCK)
			ITEM(braf_30Rnd_556x45_green, 55, MZ_STOCK)
			ITEM(braf_30Rnd_556x45_red, 55, MZ_STOCK)
			ITEM(braf_30Rnd_556x45_yellow, 55, MZ_STOCK)
			ITEM(braf_30Rnd_556x45_HK, 50, MZ_STOCK)
			ITEM(braf_30Rnd_556x45_HK_Mix_green, 50, MZ_STOCK)
			ITEM(braf_30Rnd_556x45_HK_Mix_red, 50, MZ_STOCK)
			ITEM(braf_Lapa30Rnd_556x45, 50, MZ_STOCK)
			ITEM(braf_Lapa30Rnd_556x45_red, 50, MZ_STOCK)
			ITEM(braf_sig_556x45, 50, MZ_STOCK)
			ITEM(braf_sig_556x45_Mix_green, 50, MZ_STOCK)
			ITEM(braf_sig_556x45_Mix_red, 50, MZ_STOCK)

		};

		class pointersBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_pointers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(braf_an_peq_15, 75, PN_STOCK)
			ITEM(braf_an_peq_15_green, 75, PN_STOCK)
			ITEM(braf_an_peq_15_painted, 75, PN_STOCK)
			ITEM(braf_an_peq_15_tan, 75, PN_STOCK)

		};

		class muzzlesBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(braf_msr_silencer, 500, MZ_STOCK)
			ITEM(braf_fal_bayonet, 50, MZ_STOCK)

		};

		class opticsBraf 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Braf", localize "STR_A3AU_sights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemOptic_ca.paa";

			ITEM(braf_c79_aaf, 250, MAGAZINE_STOCK)
			ITEM(braf_c79, 250, MAGAZINE_STOCK)
			ITEM(braf_c79_green, 250, MAGAZINE_STOCK)
			ITEM(braf_eotech_exps3, 150, MAGAZINE_STOCK)
			ITEM(braf_eotech_exp3_tan, 150, MAGAZINE_STOCK)
			ITEM(braf_eotech_exps3_magnifier_up, 250, MAGAZINE_STOCK)
			ITEM(braf_eotech_exps3_tan_magnifier_up, 250, MAGAZINE_STOCK)
			ITEM(braf_dot, 120, MAGAZINE_STOCK)
			ITEM(braf_dot_3x_up, 250, MAGAZINE_STOCK)
			ITEM(braf_guara, 150, MAGAZINE_STOCK)

		};

		class navigationBraf
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_Braf", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(braf_Steiner_750RC, 300, NN_STOCK)
			ITEM(braf_nvg_loris, 500, NN_STOCK)
			ITEM(braf_nvg_loris_ccb, 500, NN_STOCK)

		};
