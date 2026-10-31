		class riflesSMA
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sma", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(SMA_AAC_MPW_9_Black, 400, RIFLE_STOCK) // SMA_30Rnd_762x35_BLK_EPR
			ITEM(SMA_AAC_MPW_12_Black, 500, RIFLE_STOCK)
			ITEM(SMA_AAC_MPW_16_Black, 600, RIFLE_STOCK)

			ITEM(SMA_ACRREMblk_N, 600, RIFLE_STOCK) // SMA_30Rnd_556x45_M855A1
			ITEM(SMA_ACRREMAFGCQBblk_N, 650, RIFLE_STOCK)
			ITEM(SMA_ACRREMMOECQBblk_N, 650, RIFLE_STOCK)
            
			ITEM(SMA_AUG_A3_F, 700, RIFLE_STOCK)
			ITEM(SMA_AUG_A3_KRYPT_F, 700, RIFLE_STOCK)
			ITEM(SMA_AUG_A3_MCAM_F, 700, RIFLE_STOCK)

			ITEM(SMA_HK416vfg, 750, RIFLE_STOCK)

			ITEM(SMA_HK417vfg, 1000, RIFLE_STOCK) // SMA_20Rnd_762x51mm_M80A1_EPR

			ITEM(SMA_L85RIS, 750, RIFLE_STOCK)
			ITEM(SMA_L85RISafg, 800, RIFLE_STOCK)

			ITEM(SMA_M4MOE, 800, RIFLE_STOCK)
			ITEM(SMA_M4MOE_OD, 800, RIFLE_STOCK)
			ITEM(SMA_M4MOE_Tan, 800, RIFLE_STOCK)

			ITEM(SMA_ACRMOE_Blk, 800, RIFLE_STOCK)
			ITEM(SMA_ACRMOE, 800, RIFLE_STOCK)

			ITEM(SMA_Mk17, 900, RIFLE_STOCK)
			ITEM(SMA_Mk17_black, 900, RIFLE_STOCK)
			ITEM(SMA_Mk17_Green, 900, RIFLE_STOCK)
			ITEM(SMA_Mk17_16, 950, RIFLE_STOCK)
			ITEM(SMA_Mk17_16_black, 950, RIFLE_STOCK)
			ITEM(SMA_Mk17_16_Green, 950, RIFLE_STOCK)

			ITEM(SMA_SKS_F, 1000, RIFLE_STOCK) // SMA_30Rnd_762x39_SKS_7n23_AP
			ITEM(SMA_SKS_TAN_F, 1000, RIFLE_STOCK)

			ITEM(SMA_TavorBLK_F, 900, RIFLE_STOCK)
			ITEM(SMA_Tavor_F, 900, RIFLE_STOCK)
			ITEM(SMA_CTARBLK_F, 900, RIFLE_STOCK)
			ITEM(SMA_CTAR_F, 900, RIFLE_STOCK)
		};

		class mgSMA
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sma", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(sma_minimi_mk3_762tlb, 1500, RIFLE_STOCK) // SMA_150Rnd_762_M80A1
			ITEM(sma_minimi_mk3_762tlb_des, 1500, RIFLE_STOCK)
		};

		class underbarrelSMA
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sma", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(sma_gripod_01, 100, 50)
		};

		class pointersSMA
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_sma", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(sma_anpeq15_top_blk_scar, 75, PN_STOCK)
			ITEM(sma_anpeq15_top_tan_scar, 75, PN_STOCK)
			ITEM(sma_anpeq15_tan, 75, PN_STOCK)
			ITEM(sma_anpeq15_blk, 75, PN_STOCK)
			ITEM(sma_sfpeq_scartop_blk, 75, PN_STOCK)
			ITEM(sma_sfpeq_scartop_tan, 75, PN_STOCK)
			ITEM(sma_sfpeq_m4top_blk, 75, PN_STOCK)
			ITEM(sma_sfpeq_m4top_tan, 75, PN_STOCK)
			ITEM(sma_sffl_blk, 75, PN_STOCK)
			ITEM(sma_sffl_tan, 75, PN_STOCK)
		};

		class muzzlesSMA
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sma", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(sma_aac_762_sdn6, 500, MZ_STOCK) //5
			ITEM(sma_aac_762_sdn6_d, 500, MZ_STOCK) //5
			ITEM(sma_supp1bb_556, 500, MZ_STOCK) //5
			ITEM(sma_supp1bt_556, 500, MZ_STOCK) //5
			ITEM(sma_supp1b_556, 500, MZ_STOCK) //5
			ITEM(sma_supp1tan_556, 500, MZ_STOCK) //5
		};

		class opticsSMA
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sma", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class sma_elcan_specter_ardrds {
				price = 1000;
				stock = 100;
			};

			class sma_eotech552 {
				price = 700;
				stock = 100;
			};
            class sma_eotech : sma_eotech552 {};
            class sma_micro_t2 : sma_eotech552 {};
            class sma_micro_t2_lm : sma_eotech552 {};
            class sma_barska : sma_eotech552 {};
		};

		class magazinesSMA
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_sma", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////
			class SMA_30Rnd_762x35_BLK_EPR {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class SMA_30Rnd_762x39_SKS_7n23_AP {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class SMA_30Rnd_556x45_M855A1 {
				price = 70;
				stock = MAGAZINE_STOCK;
			};
			///////////////////////////////////////////////////////
			// MGs
			///////////////////////////////////////////////////////
			class SMA_150Rnd_762_M80A1 {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////
			class SMA_20Rnd_762x51mm_M80A1_EPR {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
		};
