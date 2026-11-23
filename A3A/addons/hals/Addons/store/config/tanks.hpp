class launchersTanks
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Tanks", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(launch_MRAWS_olive_F, 1400, LAUNCHER_STOCK)
			ITEM(launch_MRAWS_olive_rail_F, 1300, LAUNCHER_STOCK)
			ITEM(launch_MRAWS_green_F, 1400, LAUNCHER_STOCK)
			ITEM(launch_MRAWS_green_rail_F, 1300, LAUNCHER_STOCK)
			ITEM(launch_MRAWS_sand_F, 1400, LAUNCHER_STOCK)
			ITEM(launch_MRAWS_sand_rail_F, 1300, LAUNCHER_STOCK)

			ITEM(launch_O_Vorona_brown_F, 2500, 10)
			ITEM(launch_O_Vorona_green_F, 2500, 10)
		};

		class launcherMagazinesTanks 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Tanks", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
		
			class Vorona_HE {
				price = 75;
				stock = 50;
			};
			class Vorona_HEAT {
				price = 100;
				stock = 50;
			};
			class MRAWS_HEAT55_F {
				price = 250;
				stock = 50;
			};
			class MRAWS_HE_F {
				price = 150;
				stock = 50;
			};
			class MRAWS_HEAT_F {
				price = 300;
				stock = 50;
			};
		};

		class miscTanks 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Tanks", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(U_Tank_green_F, 500, MISC_STOCK)
			ITEM(H_Tank_black_F, 500, MISC_STOCK)

		};
