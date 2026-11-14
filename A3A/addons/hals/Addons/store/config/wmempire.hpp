//Galactic Civil War

		class handgunswmemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(WM_EC17, 100, PISTOL_STOCK) //AMMO: WM_EC17_Mag
			ITEM(WM_RK3, 100, PISTOL_STOCK) //AMMO: WM_RK3_Mag
			ITEM(WM_SE14C, 100, PISTOL_STOCK) //AMMO: WM_SE14C_Mag
		};		

		class rifleswmemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(WM_A280, 330, RIFLE_STOCK) // WM_A280_Mag
			ITEM(WM_DH17, 230, RIFLE_STOCK) // WM_DH17_Mag
			ITEM(WM_DLT19, 630, RIFLE_STOCK) // WM_DLT19_mag
			ITEM(WM_DLT19D, 600, RIFLE_STOCK) // WM_DLT19D_Magazine
			ITEM(WM_DLT19X, 610, RIFLE_STOCK) // WM_DLT19X_Magazine
			ITEM(WM_E11, 330, RIFLE_STOCK) // WM_E11_Mag
			ITEM(WM_E11D, 360, RIFLE_STOCK) // WM_E11D_Mag
			ITEM(WM_T21, 625, RIFLE_STOCK) // WM_T21_mag
		};

		class launcherswmemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(WM_Launch_HH15, 300, 25)
			ITEM(WM_Launch_PTL, 300, 25)

		}; 

		class magazineswmemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(WM_EC17_Mag, 20, MZ_STOCK)
            ITEM(WM_RK3_Mag, 15, MZ_STOCK)
            ITEM(WM_SE14C_Mag, 20, MZ_STOCK)
            ITEM(WM_A280_Mag, 45, MZ_STOCK)
            ITEM(WM_DH17_Mag, 35, MZ_STOCK)
            ITEM(WM_DLT19_mag, 140, MZ_STOCK)
            ITEM(WM_DLT19D_Magazine, 90, MZ_STOCK)
            ITEM(WM_DLT19X_Magazine, 100, MZ_STOCK)
            ITEM(WM_E11_Mag, 50, MZ_STOCK)
            ITEM(WM_E11D_Mag, 60, MZ_STOCK)
			ITEM(WM_T21_mag, 150, MZ_STOCK)
            ITEM(WM_ProtonTorpedo, 400, 15)
		};

		class opticswmemp{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_empire", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			ITEM(WM_E11_Optic, 90, MAGAZINE_STOCK)
			ITEM(WM_E11_Pack, 30, MAGAZINE_STOCK)
			ITEM(WM_DLT_Bipod, 50, MAGAZINE_STOCK)
			ITEM(WM_SE14C_Scope, 80, MAGAZINE_STOCK)
		};
