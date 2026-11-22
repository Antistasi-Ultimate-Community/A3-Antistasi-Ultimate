//Galactic Civil War

		class handgunsemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(JMSLLTE_dl18pistol, 100, PISTOL_STOCK) //AMMO: JMSLLTE_DL18_20rnd_Mag
			ITEM(JMSLLTE_ec17pistol, 100, PISTOL_STOCK) //AMMO: JMSLLTE_EC17_15rnd_Mag
			ITEM(JMSLLTE_rk3pistol, 100, PISTOL_STOCK) //AMMO: JMSLLTE_RK3_20rnd_Mag
			ITEM(JMSLLTE_se14pistol, 100, PISTOL_STOCK) //AMMO: JMSLLTE_SE14_30rnd_Mag
		};

		class smgemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(JMSLLTE_dh17rifle, 170, RIFLE_STOCK) // JMSLLTE_DH17_60Rnd_Mag
			ITEM(JMSLLTE_a300c, 210, RIFLE_STOCK) // JMSLLTE_A300C_30rnd_Mag
			ITEM(JMSLLTE_e11carb, 200, RIFLE_STOCK) // JMSLLTE_E11C_60Rnd_Mag
		};
		
		class mgemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(JMSLLTE_rt97cBlasterRifle, 550, RIFLE_STOCK) // JMSLLTE_RT97C_150Rnd_Mag
			ITEM(JMSLLTE_DLT19BlasterRifle, 550, RIFLE_STOCK) // JMSLLTE_DLT19_75Rnd_Mag

		};

		class riflesemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(JMSLLTE_a280, 230, RIFLE_STOCK) // JMSLLTE_A280_30rnd_Mag
			ITEM(JMSLLTE_a280stock, 230, RIFLE_STOCK) // JMSLLTE_A280_30rnd_Mag
			ITEM(JMSLLTE_a280c, 230, RIFLE_STOCK) // JMSLLTE_A280C_20rnd_Mag
			ITEM(JMSLLTE_e10, 200, RIFLE_STOCK) // JMSLLTE_E11_60Rnd_Mag
			ITEM(JMSLLTE_e11, 210, RIFLE_STOCK) // JMSLLTE_E11_60Rnd_Mag
			ITEM(JMSLLTE_e11d, 230, RIFLE_STOCK) // JMSLLTE_E11D_40Rnd_Mag
			ITEM(JMSLLTE_E22, 220, RIFLE_STOCK) // JMSLLTE_E22_60Rnd_Mag
			ITEM(JMSLLTE_f78, 225, RIFLE_STOCK) // JMSLLTE_E22_60Rnd_Mag
			ITEM(JMSLLTE_T21BlasterRifle, 225, RIFLE_STOCK) // JMSLLTE_T21_15rnd_Mag
		};

		class sniperriflesemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(JMSLLTE_E17DRifle, 700, RIFLE_STOCK) // JMSLLTE_E17d_5Rnd_Mag
			ITEM(JMSLLTE_dlt20a, 650, RIFLE_STOCK) // JMSLLTE_DLT20a_10Rnd_Mag
			ITEM(JMSLLTE_DLT19dRifle, 700, RIFLE_STOCK) // JMSLLTE_DLT19d_10Rnd_Mag
			ITEM(JMSLLTE_DLT19xRifle, 700, RIFLE_STOCK) // JMSLLTE_DLT19x_10Rnd_Mag
			ITEM(JMSLLTE_a300, 250, RIFLE_STOCK) // JMSLLTE_A300_15rnd_Mag
			ITEM(JMSLLTE_a310, 250, RIFLE_STOCK) // JMSLLTE_A310_15rnd_Mag

		};

		class launchersemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(JMSLLTE_RPS10_launcher, 300, 25)

		}; 

		class launchermagazinesemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			ITEM(JMSLLTE_RPS10_Mag, 200, 15)
			ITEM(JMSLLTE_RPS10_HE_Mag, 170, 15)

		};

		class magazinesemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(JMSLLTE_DL18_20rnd_Mag, 20, MZ_STOCK)
            ITEM(JMSLLTE_EC17_15rnd_Mag, 15, MZ_STOCK)
            ITEM(JMSLLTE_RK3_20rnd_Mag, 20, MZ_STOCK)
            ITEM(JMSLLTE_SE14_30rnd_Mag, 25, MZ_STOCK)
            ITEM(JMSLLTE_DH17_60Rnd_Mag, 35, MZ_STOCK)
            ITEM(JMSLLTE_A300C_30rnd_Mag, 50, MZ_STOCK)
            ITEM(JMSLLTE_E11C_60Rnd_Mag, 45, MZ_STOCK)
            ITEM(JMSLLTE_RT97C_150Rnd_Mag, 180, MZ_STOCK)
            ITEM(JMSLLTE_DLT19_75Rnd_Mag, 140, MZ_STOCK)
            ITEM(JMSLLTE_A280_30rnd_Mag, 120, MZ_STOCK)
			ITEM(JMSLLTE_A280C_20rnd_Mag, 100, MZ_STOCK)
            ITEM(JMSLLTE_E11_60Rnd_Mag, 110, MZ_STOCK)
            ITEM(JMSLLTE_E11D_40Rnd_Mag, 130, MZ_STOCK)
            ITEM(JMSLLTE_E22_60Rnd_Mag, 180, MZ_STOCK)
            ITEM(JMSLLTE_T21_15rnd_Mag, 110, MZ_STOCK)
            ITEM(JMSLLTE_E17d_5Rnd_Mag, 75, MZ_STOCK)
            ITEM(JMSLLTE_DLT20a_10Rnd_Mag, 90, MZ_STOCK)
			ITEM(JMSLLTE_DLT19d_10Rnd_Mag, 90, MZ_STOCK)
			ITEM(JMSLLTE_DLT19x_10Rnd_Mag, 90, MZ_STOCK)
			ITEM(JMSLLTE_A300_15rnd_Mag, 120, MZ_STOCK)
			ITEM(JMSLLTE_A310_15rnd_Mag, 125, MZ_STOCK)
		};

		class opticsemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			ITEM(jmsllte_dh17_bl_scope, 60, MAGAZINE_STOCK)
			ITEM(jmsllte_a280_bl_scope, 80, MAGAZINE_STOCK)
			ITEM(jmsllte_a280c_bl_scope, 80, MAGAZINE_STOCK)
			ITEM(jmsllte_a300_bl_scope, 80, MAGAZINE_STOCK)
			ITEM(jmsllte_e11_bl_scope, 70, MAGAZINE_STOCK)
			ITEM(jmsllte_rt97c_bl_scope, 100, MAGAZINE_STOCK)
		};
