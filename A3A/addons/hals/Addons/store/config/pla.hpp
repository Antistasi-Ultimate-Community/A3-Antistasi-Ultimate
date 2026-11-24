		//PLA
		
		class mgpla{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_pla", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(LMG_mas_chi_pkm_F, 600, RIFLE_STOCK) //Ammo: 150Rnd_762x54_Box
			ITEM(arifle_mas_qbz95_mg, 700, RIFLE_STOCK) //Ammo: 100Rnd_580x42_Mag_F
			ITEM(arifle_mas_qbz95_cmg, 710, RIFLE_STOCK) //Ammo: 100Rnd_580x42_Mag_F
			
		};

		class riflespla{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_pla", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			
			ITEM(arifle_mas_qbz95, 325, RIFLE_STOCK) //Ammo: 30Rnd_mas_chi_580x42UW_mag
			ITEM(arifle_mas_qbz95_UW, 345, RIFLE_STOCK) //Ammo: 30Rnd_mas_chi_580x42SD_mag
			ITEM(arifle_mas_qbz95_gl, 465, RIFLE_STOCK) //Ammo: 30Rnd_mas_chi_580x42UW_mag
			ITEM(arifle_mas_qbz95_cqb, 340, RIFLE_STOCK) //Ammo: 30Rnd_mas_chi_580x42UW_mag

		};

		class sniperriflespla{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_pla", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(arifle_mas_qbz95_snp, 580, RIFLE_STOCK) // Ammo: 20Rnd_mas_chi_650x39SD_mag
			ITEM(arifle_mas_qbz95_csnp, 600, RIFLE_STOCK) // Ammo: 20Rnd_mas_chi_650x39SD_mag
			ITEM(srifle_mas_chi_GM6_F, 900, RIFLE_STOCK) // Ammo: 5Rnd_mas_chi_127x108_Mag	5Rnd_mas_chi_127x108_APDS_Mag
			
		};

		class launcherspla{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_pla", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			
			ITEM(launch_mas_chi_RPG32_F, 500, 25) 
			ITEM(launch_mas_chi_Strela_F, 550, 25) // Strela_mas_chi
			
		}; 

		class launchermagazinespla{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_pla", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(Strela_mas_chi, 300, 15)
			
		};

		class magazinespla{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_pla", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(30Rnd_mas_chi_580x42UW_mag, 55, MZ_STOCK)
            ITEM(30Rnd_mas_chi_580x42SD_mag, 60, MZ_STOCK)
            ITEM(20Rnd_mas_chi_650x39SD_mag, 90, MZ_STOCK)
            ITEM(5Rnd_mas_chi_127x108_Mag, 150, MZ_STOCK)
            ITEM(5Rnd_mas_chi_127x108_APDS_Mag, 200, MZ_STOCK)

		};
