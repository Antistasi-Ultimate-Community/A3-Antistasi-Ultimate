		class handgunsProjInfAD 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_PROJINF", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(bnae_l35_virtual, 150, PISTOL_STOCK);
			ITEM(bnae_l35_c_virtual, 150, PISTOL_STOCK);
			ITEM(bnae_r1_virtual, 200, PISTOL_STOCK);
			ITEM(bnae_r1_c_virtual, 200, PISTOL_STOCK);
			ITEM(bnae_r1_e_virtual, 200, PISTOL_STOCK);
			ITEM(bnae_r1_m_virtual, 200, PISTOL_STOCK);
			ITEM(bnae_r1_t_virtual, 200, PISTOL_STOCK);
			ITEM(bnae_saa_c_virtual, 200, PISTOL_STOCK);
			ITEM(bnae_saa_virtual, 200, PISTOL_STOCK);
		};

		class riflesProjInfAD 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_PROJINF", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(bnae_rk95_virtual, 800, RIFLE_STOCK);
			ITEM(bnae_rk95_camo1_virtual, 800, RIFLE_STOCK);
			ITEM(bnae_rk95r_virtual, 1000, RIFLE_STOCK);
			ITEM(bnae_rk95r_camo1_virtual, 1000, RIFLE_STOCK);

			ITEM(bnae_spr220_virtual, 600, RIFLE_STOCK);
			ITEM(bnae_spr220_camo1_virtual, 600, RIFLE_STOCK);
			ITEM(bnae_spr220_so_virtual, 500, RIFLE_STOCK);
			ITEM(bnae_spr220_so_camo1_virtual, 500, RIFLE_STOCK);

			ITEM(bnae_mk1_short_virtual, 600, RIFLE_STOCK);
			ITEM(bnae_m97_virtual, 600, RIFLE_STOCK);
			ITEM(bnae_m97_camo1_virtual, 600, RIFLE_STOCK);
			ITEM(bnae_m97_s_virtual, 500, RIFLE_STOCK);
		};

		class sniperRiflesProjInfAD 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_PROJINF", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(bnae_mk1_virtual, 600, RIFLE_STOCK);
			ITEM(bnae_mk1_t_virtual, 650, RIFLE_STOCK);
			ITEM(bnae_mk1_t_camo1_virtual, 650, RIFLE_STOCK);
			
			ITEM(bnae_falkor_blk_virtual, 1600, RIFLE_STOCK);
			ITEM(bnae_falkor_camo1_virtual, 1600, RIFLE_STOCK);
			ITEM(bnae_falkor_snd_virtual, 1600, RIFLE_STOCK);
			ITEM(bnae_falkor_camo2_virtual, 1600, RIFLE_STOCK);
			
			ITEM(bnae_trg42_virtual, 1750, RIFLE_STOCK);
			ITEM(bnae_trg42_camo2_virtual, 1750, RIFLE_STOCK);
			ITEM(bnae_trg42_camo1_virtual, 1750, RIFLE_STOCK);
			ITEM(bnae_trg42_mmrs_virtual, 1750, RIFLE_STOCK);
			ITEM(bnae_trg42_mmrs_camo1_virtual, 1750, RIFLE_STOCK);
			ITEM(bnae_trg42_f_virtual, 1750, RIFLE_STOCK);
			ITEM(bnae_trg42_f_camo1_virtual, 1750, RIFLE_STOCK);
			ITEM(bnae_trg42_f_mmrs_virtual, 1750, RIFLE_STOCK);
			ITEM(bnae_trg42_f_mmrs_camo1_virtual, 1750, RIFLE_STOCK);
		};
		class muzzlesProjInfAD 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_PROJINF", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(bnae_suppressor_v2_virtual, 100, MZ_STOCK);
			ITEM(bnae_suppressor_covblk_virtual, 100, MZ_STOCK);
			ITEM(bnae_suppressor_covdrt_virtual, 100, MZ_STOCK);

			ITEM(bnae_muzzle_blk_virtual, 60, MZ_STOCK);
			ITEM(bnae_muzzle_snd_virtual, 60, MZ_STOCK);
			ITEM(bnae_silencer_virtual, 120, MZ_STOCK);

			ITEM(bnae_suppressor_v4_virtual, 60, MZ_STOCK);
			ITEM(bnae_suppressor_v3_virtual, 60, MZ_STOCK);
		};

		class opticsProjInfAD 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_PROJINF", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class bnae_scope_blk_virtual {
				price = 150;
				stock = 50;
			};
			class bnae_scope_mtp_virtual {
				price = 150;
				stock = 50;
			};
			class bnae_scope_snd_virtual {
				price = 150;
				stock = 50;
			};
			class bnae_scope_v2_virtual {
				price = 150;
				stock = 50;
			};
			class bnae_truglo_blk_virtual {
				price = 120;
				stock = 50;
			};
			class bnae_truglo_snd_virtual {
				price = 120;
				stock = 50;
			};
			class bnae_scope_v3_virtual {
				price = 100;
				stock = 50;
			};
		};

		class magazinesProjInfAD 
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_PROJINF", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			///////////////////////////////////////////////////////
			// Pistols, SMGs
			///////////////////////////////////////////////////////

			class 8Rnd_9x19_Magazine {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class 8Rnd_45ACP_Magazine {
				price = 40;
				stock = MAGAZINE_STOCK;
			};
			class 8Rnd_45GAP_Magazine {
				price = 40;
				stock = MAGAZINE_STOCK;
			};
			class 8Rnd_45Super_Magazine {
				price = 40;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_357M_Magazine {
				price = 50;
				stock = MAGAZINE_STOCK;
			};


			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////

			class 2Rnd_00_Buckshot_Magazine {
				price = 20;
				stock = MAGAZINE_STOCK;
			};
			class 2Rnd_Slug_Magazine {
				price = 20;
				stock = MAGAZINE_STOCK;
			};
			class 5Rnd_00_Buckshot_Magazine {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class 5Rnd_Slug_Magazine {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_00_Buckshot_Magazine {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 6Rnd_Slug_Magazine {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_762x39_Magazine {
				price = 70;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////
			class 10Rnd_303_Magazine {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 5Rnd_338LM_Magazine {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class 5Rnd_APDS_338LM_Magazine {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class 10Rnd_300WM_Magazine {
				price = 120;
				stock = MAGAZINE_STOCK;
			};
		};

		class underbarrelProjInfAD 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_PROJINF", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(bnae_holder_virtual, 30, 150);
			ITEM(bnae_bipod_blk_virtual, 50, 150);
			ITEM(bnae_bipod_snd_virtual, 50, 150);
		};