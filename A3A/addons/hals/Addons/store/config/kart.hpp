class handgunsKart 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Kart", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(hgun_Pistol_Signal_F, 450, PISTOL_STOCK)
		};

class magazinesKart
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_Kart", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			class 6Rnd_GreenSignal_F {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			class 6Rnd_RedSignal_F {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

		};
