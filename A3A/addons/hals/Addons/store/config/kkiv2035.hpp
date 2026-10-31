		class sniperRifleskkiv2035 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_kkiv2035", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(kio_KKiv_2035, 6000, RIFLE_STOCK)

		};

		class magazineskkiv2035
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_kkiv2035", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////

			class KKiv_Mag_HEDP {
				price = 300;
				stock = MAGAZINE_STOCK;
			};

			class KKiv_Mag_APFSDS {
				price = 400;
				stock = MAGAZINE_STOCK;
			};

		};
