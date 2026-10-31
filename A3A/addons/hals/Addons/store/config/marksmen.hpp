		class sniperRiflesMarksmen 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Marksmen", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(srifle_DMR_04_F, 1800, RIFLE_STOCK)
			ITEM(srifle_DMR_04_Tan_F, 1800, RIFLE_STOCK)

			ITEM(srifle_DMR_05_blk_F, 1600, RIFLE_STOCK)
			ITEM(srifle_DMR_05_hex_F, 1600, RIFLE_STOCK)
			ITEM(srifle_DMR_05_tan_f, 1600, RIFLE_STOCK)

			ITEM(srifle_DMR_02_F, 1750, RIFLE_STOCK)
			ITEM(srifle_DMR_02_camo_F, 1750, RIFLE_STOCK)
			ITEM(srifle_DMR_02_sniper_F, 1750, RIFLE_STOCK)

			ITEM(srifle_DMR_03_F, 1500, RIFLE_STOCK)
			ITEM(srifle_DMR_03_multicam_F, 1500, RIFLE_STOCK)
			ITEM(srifle_DMR_03_khaki_F, 1500, RIFLE_STOCK)
			ITEM(srifle_DMR_03_tan_F, 1500, RIFLE_STOCK)
			ITEM(srifle_DMR_03_woodland_F, 1500, RIFLE_STOCK)

			ITEM(srifle_DMR_06_camo_F, 1300, RIFLE_STOCK)
			ITEM(srifle_DMR_06_olive_F, 1300, RIFLE_STOCK)

		};

		class mgMarksmen 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Marksmen", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(MMG_01_hex_F, 1800, RIFLE_STOCK)
			ITEM(MMG_01_tan_F, 1800, RIFLE_STOCK)

			ITEM(MMG_02_black_F, 2000, RIFLE_STOCK)
			ITEM(MMG_02_camo_F, 2000, RIFLE_STOCK)
			ITEM(MMG_02_sand_F, 2000, RIFLE_STOCK)

		};

		class navigationMarksmen
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_Marksmen", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(Laserdesignator_02, 1200, NN_STOCK)
			ITEM(Laserdesignator_03, 1200, NN_STOCK)

		};

		class underbarrelMarksmen
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Marksmen", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(bipod_03_F_blk, 100, 50)
			ITEM(bipod_02_F_blk, 100, 50)
			ITEM(bipod_01_F_blk, 100, 50)
			ITEM(bipod_02_F_hex, 100, 50)
			ITEM(bipod_01_F_mtp, 100, 50)
			ITEM(bipod_03_F_oli, 100, 50)
			ITEM(bipod_01_F_snd, 100, 50)
			ITEM(bipod_02_F_tan, 100, 50)

		};

		class muzzlesMarksmen 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Marksmen", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(muzzle_snds_338_black, 500, MZ_STOCK) //5
			ITEM(muzzle_snds_338_green, 500, MZ_STOCK)
			ITEM(muzzle_snds_338_sand, 500, MZ_STOCK)

			ITEM(muzzle_snds_93mmg, 600, MZ_STOCK) //4
			ITEM(muzzle_snds_93mmg_tan, 600, MZ_STOCK)

		};

		class opticsMarksmen 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Marksmen", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class optic_AMS {
				price = 1000;
				stock = 20;
			};
			class optic_AMS_khk {
				price = 1000;
				stock = 20;
			};
			class optic_AMS_snd {
				price = 1000;
				stock = 20;
			};

			class optic_KHS_blk {
				price = 800;
				stock = 20;
			};
			class optic_KHS_hex  {
				price = 800;
				stock = 20;
			};
			class optic_KHS_tan {
				price = 800;
				stock = 20;
			};

			class optic_KHS_old  {
				price = 700;
				stock = 25;
			};

		};

		class magazinesMarksmen 
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_Marksmen", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
		
			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////

			class 10Rnd_127x54_Mag {
				price = 300;
				stock = MAGAZINE_STOCK;
			};

			class 10Rnd_93x64_DMR_05_Mag {
				price = 385;
				stock = MAGAZINE_STOCK;
			};

			class 10Rnd_338_Mag {
				price = 400;
				stock = MAGAZINE_STOCK;
			};

			class 20Rnd_762x51_Mag {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class 10Rnd_Mk14_762x51_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// MGs
			///////////////////////////////////////////////////////
			class 150Rnd_93x64_Mag {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 130Rnd_338_Mag {
				price = 225;
				stock = MAGAZINE_STOCK;
			};

		};
