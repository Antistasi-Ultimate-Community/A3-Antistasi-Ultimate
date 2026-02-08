		class handgunsnickelsteel
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(vnx_gjet, 150, PISTOL_STOCK);
			ITEM(vnx_hd_02, 125, PISTOL_STOCK);

			ITEM(vnx_m_ladle, 20, PISTOL_STOCK);
			ITEM(vnx_m_spoon_02, 20, PISTOL_STOCK);
			ITEM(vnx_m_spoon_01, 50, PISTOL_STOCK);

			ITEM(vnx_m_axe_01, 70, PISTOL_STOCK);
			ITEM(vnx_m_hammer_01, 70, PISTOL_STOCK);
			ITEM(vnx_m_pickaxe_01, 75, PISTOL_STOCK);
			ITEM(vnx_m_shovel_01, 75, PISTOL_STOCK);

			ITEM(vnx_c96, 125, PISTOL_STOCK)

			ITEM(vnx_p08, 125, PISTOL_STOCK)
		};

		class smgnickelsteel
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(vnx_m12_smg, 200, RIFLE_STOCK);
			ITEM(vnx_m12_smg_fold, 200, RIFLE_STOCK);
			ITEM(vnx_m50_smg, 200, RIFLE_STOCK);
			ITEM(vnx_m50_smg_fold, 200, RIFLE_STOCK);
			ITEM(vnx_m45_sf, 200, RIFLE_STOCK);

			ITEM(vnx_m38_smg, 200, RIFLE_STOCK);
		};

		class mgnickelsteel
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(vnx_fm2429, 400, RIFLE_STOCK);
			ITEM(vnx_tul1, 500, RIFLE_STOCK);
		};
		
		class riflesnickelsteel
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(vnx_type56_xm148, 400, RIFLE_STOCK);

			ITEM(vnx_l1a1_05, 400, RIFLE_STOCK);
			ITEM(vnx_l1a1_05_camo, 400, RIFLE_STOCK);
			ITEM(vnx_l1a1_04, 400, RIFLE_STOCK);
			ITEM(vnx_l1a1_04_camo, 400, RIFLE_STOCK);

			ITEM(vnx_m77e, 200, RIFLE_STOCK);
			ITEM(vnx_m77e_shorty, 200, RIFLE_STOCK);

			ITEM(vnx_stg44, 300, RIFLE_STOCK);

			ITEM(vnx_no4, 250, RIFLE_STOCK);
		};

		class sniperriflesnickelsteel
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(vnx_no4_sniper, 500, RIFLE_STOCK);
			
		};

		class specialWeaponsnickelsteel
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(vnx_m201z, 700, RIFLE_STOCK);
		};

		class opticsnickelsteel
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class vnx_o_aa_fm2429 {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
		};

		class pointersnickelsteel 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(vnx_b_no4, 50, PN_STOCK);
		};

		class miscnickelsteel 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(vnx_mk3a2_grenade_mag, 50, MISC_STOCK);
		};

		class magazinesnickelsteel 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			ITEM(vnx_m12_smg_20_mag, 25, MZ_STOCK);
			ITEM(vnx_m12_smg_20_t_mag, 30, MZ_STOCK);

			ITEM(vnx_m12_smg_32_mag, 50, MZ_STOCK);
			ITEM(vnx_m12_smg_32_t_mag, 55, MZ_STOCK);

			ITEM(vnx_m50_smg_mag, 50, MZ_STOCK);
			ITEM(vnx_m50_smg_t_mag, 55, MZ_STOCK);

			ITEM(vn_m45_mag, 50, MZ_STOCK);
			ITEM(vn_m45_t_mag, 55, MZ_STOCK);

			///////////////////////////////////////////////////////
			// Pistols, SMGs
			///////////////////////////////////////////////////////
			ITEM(vnx_hd_02_mag, 10, MZ_STOCK);
			ITEM(vnx_gjet_mag, 10, MZ_STOCK);

			ITEM(vnx_c96_mag, 10, MZ_STOCK);
			ITEM(vnx_c96_t_mag, 12, MZ_STOCK);

			ITEM(vnx_m38_smg_32_mag, 30, MZ_STOCK);
			ITEM(vnx_m38_smg_32_t_mag, 35, MZ_STOCK);

			ITEM(vnx_p08_mag, 10, MZ_STOCK);

			///////////////////////////////////////////////////////
			// MGs
			///////////////////////////////////////////////////////

			ITEM(vnx_fm2429_mag, 125, MZ_STOCK);
			ITEM(vnx_fm2429_t_mag, 130, MZ_STOCK);

			ITEM(vnx_rpk_40_mag, 150, MZ_STOCK);
			ITEM(vnx_rpk_40_t_mag, 155, MZ_STOCK);
			ITEM(vnx_rpk_75_t_mag, 300, MZ_STOCK);
			ITEM(vnx_rpk_75_mag, 310, MZ_STOCK);

			///////////////////////////////////////////////////////
			// Rifles
			///////////////////////////////////////////////////////
			ITEM(vnx_m77e_buck_mag, 30, MZ_STOCK);
			ITEM(vnx_m77e_fl_mag, 40, MZ_STOCK);

			ITEM(vnx_stg44_mag, 50, MZ_STOCK);
			ITEM(vnx_stg44_t_mag, 55, MZ_STOCK);

			ITEM(vnx_no4_mag, 50, MZ_STOCK);
			ITEM(vnx_no4_t_mag, 55, MZ_STOCK);
			
			///////////////////////////////////////////////////////
			// Special
			///////////////////////////////////////////////////////
			ITEM(vnx_37mm_cs_mag, 100, MZ_STOCK);
			ITEM(vnx_37mm_cs_spray_mag, 100, MZ_STOCK);
			ITEM(vnx_37mm_cs_skat_mag, 40, MZ_STOCK);
			ITEM(vnx_37mm_cs_fin_mag, 100, MZ_STOCK);

			ITEM(vnx_37mm_flare_mag, 40, MZ_STOCK);

			ITEM(vnx_37mm_baton_mag, 50, MZ_STOCK);
			

		};

		class helmetsnickelsteel 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_helmets"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			/////helmets
			ITEM(vnx_b_helmet_hgu7_01_01, 100, MISC_STOCK);
			ITEM(vnx_b_helmet_hgu7_01_03, 100, MISC_STOCK);

			ITEM(vnx_b_helmet_hgu7_02_01, 125, MISC_STOCK);
			ITEM(vnx_b_helmet_hgu7_02_03, 125, MISC_STOCK);
			ITEM(vnx_b_helmet_hgu7_02_02, 125, MISC_STOCK);

			ITEM(vnx_b_helmet_hgu7_01_02, 100, MISC_STOCK);
			ITEM(vnx_b_helmet_hgu7_01_04, 100, MISC_STOCK);
		};

		class vestsnickelsteel
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_vests"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			///vests
			ITEM(vnx_b_vest_usaf_01, 50, MISC_STOCK);
			ITEM(vnx_b_vest_usaf_03, 500, MISC_STOCK);
			ITEM(vnx_b_vest_usaf_04, 70, MISC_STOCK);
			ITEM(vnx_b_vest_usaf_05, 550, MISC_STOCK);
			ITEM(vnx_b_vest_usaf_06, 50, MISC_STOCK);
			ITEM(vnx_b_vest_usaf_07, 500, MISC_STOCK);
			///vests
		};

		class uniformsnickelsteel 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_nickelsteel", localize "STR_A3AU_uniforms"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			////uniforms
			ITEM(vnx_b_uniform_cwu_02, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_cwu_01, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_cwu_04, 100, MISC_STOCK);

			ITEM(vnx_b_uniform_macv_01_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_macv_02_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_macv_03_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_macv_04_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_macv_05_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_macv_06_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_sog_01_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_sog_02_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_heli_01_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_k2b_02_19, 100, MISC_STOCK);
			ITEM(vnx_b_uniform_k2b_01_19, 100, MISC_STOCK);
		};