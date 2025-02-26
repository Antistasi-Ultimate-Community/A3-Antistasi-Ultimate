		///////////////////////////////////////////////////////
		// Global Mobilisation
		///////////////////////////////////////////////////////
		class handgunsgm{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(gm_lp1_blk, 50, PISTOL_STOCK); //AMMO: gm_1Rnd_265mm_flare_single_wht_gc
			ITEM(gm_m49_blk, 100, PISTOL_STOCK); //AMMO: gm_8Rnd_9x19mm_B_DM11_p210_blk
			ITEM(gm_p1_blk, 100, PISTOL_STOCK); //AMMO: gm_8Rnd_9x19mm_B_DM11_p1_blk
			ITEM(gm_p1sd_blk, 100, PISTOL_STOCK); //AMMO: gm_8Rnd_9x19mm_BSD_DM81_p1_blk
			ITEM(gm_p210_blk, 110, PISTOL_STOCK); //AMMO: gm_8Rnd_9x19mm_B_DM51_p210_blk
			ITEM(gm_p2a1_blk, 50, PISTOL_STOCK); //AMMO: gm_1Rnd_265mm_smoke_single_blk_gc
			ITEM(gm_pim_blk, 100, PISTOL_STOCK); //AMMO: gm_8Rnd_9x18mm_B_pst_pm_blk
			ITEM(gm_pimb_blk, 100, PISTOL_STOCK); //AMMO: gm_8Rnd_9x18mm_B_pst_pm_blk
			ITEM(gm_pm63_handgun_blk, 200, PISTOL_STOCK); //AMMO: gm_15Rnd_9x18mm_B_pst_pm63_blk
			ITEM(gm_pn3_gry, 50, PISTOL_STOCK); //AMMO: 
			ITEM(gm_wz78_blk, 50, PISTOL_STOCK); //AMMO: gm_1Rnd_265mm_flare_multi_nbc_DM47
			
		};
		
		class riflesgm
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(gm_mpiak74n_brn, 350, RIFLE_STOCK); // gm_30Rnd_545x39mm_B_7N6_ak74_org
			ITEM(gm_mpiak74n_prp, 350, RIFLE_STOCK);
			ITEM(gm_mpiaks74n_brn, 350, RIFLE_STOCK);
			ITEM(gm_mpiaks74n_prp, 350, RIFLE_STOCK);
			ITEM(gm_mpiaks74nk_brn, 350, RIFLE_STOCK);
			ITEM(gm_mpiaks74nk_prp, 350, RIFLE_STOCK);

			ITEM(gm_hk69a1_blk, 400, RIFLE_STOCK); // 1Rnd_HE_Grenade_shell
			ITEM(gm_pallad_d_brn, 300, RIFLE_STOCK);

			ITEM(gm_m16a1_blk, 400, RIFLE_STOCK); // gm_20Rnd_556x45mm_B_M193_stanag_gry
			ITEM(gm_m16a2_blk, 450, RIFLE_STOCK);

			ITEM(gm_mpikm72_brn, 700, RIFLE_STOCK); // gm_30Rnd_762x39mm_B_57N231_ak47_blk
			ITEM(gm_mpikm72_prp, 700, RIFLE_STOCK);

			ITEM(gm_mpikms72_brn, 700, RIFLE_STOCK);
			ITEM(gm_mpikms72_prp, 700, RIFLE_STOCK);
	
			ITEM(gm_akm_wud, 700, RIFLE_STOCK);
			ITEM(gm_akm_pallad_wud, 950, RIFLE_STOCK);
			ITEM(gm_akmn_wud, 850, RIFLE_STOCK);

			ITEM(gm_c7a1_oli, 650, RIFLE_STOCK); // gm_30Rnd_556x45mm_B_M855_stanag_gry
			ITEM(gm_c7a1_blk, 650, RIFLE_STOCK);
			ITEM(gm_gvm95_blk, 650, RIFLE_STOCK);

			ITEM(gm_g36a1_blk, 1200, RIFLE_STOCK); // gm_30Rnd_556x45mm_B_DM11_g36_blk
			ITEM(gm_g36e_blk, 900, RIFLE_STOCK);

			ITEM(gm_hk33a3_blk, 700, RIFLE_STOCK); //gm_30Rnd_556x45mm_B_DM11_hk33_blk
			ITEM(gm_hk33ka2_blk, 700, RIFLE_STOCK);

			ITEM(gm_hk33ka3_blk, 720, RIFLE_STOCK);
			ITEM(gm_hk33sg1_blk, 720, RIFLE_STOCK);
			
			ITEM(gm_g3a3_blk, 700, RIFLE_STOCK); // gm_20Rnd_762x51mm_B_T_DM21_g3_blk
			ITEM(gm_g3a3_oli, 700, RIFLE_STOCK);
			ITEM(gm_g3a3a0_blk, 800, RIFLE_STOCK);
			ITEM(gm_g3a3a0_oli, 800, RIFLE_STOCK);
			ITEM(gm_g3a3a0_gold, 5000, RIFLE_STOCK);
			ITEM(gm_g3a3a1_ris_blk, 1000, RIFLE_STOCK);
			ITEM(gm_g3a3a1_ris_oli, 1000, RIFLE_STOCK);
			ITEM(gm_g3a4_blk, 600, RIFLE_STOCK);
			ITEM(gm_g3a4_oli, 600, RIFLE_STOCK);
			ITEM(gm_g3a4a0_blk, 600, RIFLE_STOCK);
			ITEM(gm_g3a4a0_oli, 600, RIFLE_STOCK);
			ITEM(gm_g3a4a1_ris_blk, 850, RIFLE_STOCK);
			ITEM(gm_g3a4a1_ris_oli, 850, RIFLE_STOCK);
			ITEM(gm_g3ka4_blk, 550, RIFLE_STOCK);
			ITEM(gm_g3ka4_oli, 550, RIFLE_STOCK);
			ITEM(gm_g3ka4a1_ris_blk, 750, RIFLE_STOCK);
			ITEM(gm_g3sg1_blk, 850, RIFLE_STOCK);
			ITEM(gm_g3sg1_oli, 850, RIFLE_STOCK);
			ITEM(gm_g8a1_blk, 1100, RIFLE_STOCK);
			ITEM(gm_g8a2_blk, 1200, RIFLE_STOCK);

		};
		
		class mggm 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(gm_lmgk500_brn, 800, RIFLE_STOCK); // gm_75Rnd_762x39mm_BSD_57N231U_ak47_blk
			ITEM(gm_lmgk500s_brn, 800, RIFLE_STOCK);
			ITEM(gm_lmgrpk74n_prp, 900, RIFLE_STOCK); // gm_45Rnd_545x39mm_B_7N6_ak74_org
			ITEM(gm_lmgrpk74n_brn, 900, RIFLE_STOCK);

			ITEM(gm_lmgrpk_brn, 900, RIFLE_STOCK); // gm_75Rnd_762x39mm_B_57N231_mpikm_blk
			ITEM(gm_lmgrpk_prp, 900, RIFLE_STOCK);

			ITEM(gm_mg3_blk, 2000, RIFLE_STOCK); // gm_120Rnd_762x51mm_B_T_DM21_mg3_grn
			ITEM(gm_mg3_des, 2000, RIFLE_STOCK);
			
			ITEM(gm_mg8a1_blk, 2000, RIFLE_STOCK); // gm_100Rnd_762x51mm_B_T_DM21_mg8_oli
			ITEM(gm_mg8a2_blk, 2000, RIFLE_STOCK); // gm_100Rnd_762x51mm_B_T_DM21A1_mg8_oli gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli

			ITEM(gm_hmgpkm_prp, 1750, RIFLE_STOCK); // gm_100Rnd_762x54mmR_B_T_7t2_pk_grn
			
		};

		class sniperRiflesgm
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(gm_svd_wud, 1500, RIFLE_STOCK); // gm_10Rnd_762x54mmR_AP_7N1_svd_blk
			ITEM(gm_psg1_blk, 1500, RIFLE_STOCK); // gm_20Rnd_762x51mm_B_T_DM21_g3_blk
			ITEM(gm_msg90_blk, 1500, RIFLE_STOCK); // gm_20Rnd_762x51mm_B_T_DM151_g3_blk
			ITEM(gm_msg90a1_blk, 1500, RIFLE_STOCK); // gm_20Rnd_762x51mm_B_T_DM41_g3_blk

		};

		class smggm 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(gm_mp2a1_blk, 200, RIFLE_STOCK); // gm_32Rnd_9x19mm_B_DM51_mp2_blk

			ITEM(gm_mp5a2_blk, 250, RIFLE_STOCK); // gm_30Rnd_9x19mm_B_DM11_mp5_blk
			ITEM(gm_mp5a3_blk, 250, RIFLE_STOCK); // gm_30Rnd_9x19mm_B_DM11_mp5a3_blk
			ITEM(gm_mp5a4_blk, 250, RIFLE_STOCK); // gm_60Rnd_9x19mm_B_DM11_mp5a3_blk
			ITEM(gm_mp5a5_blk, 250, RIFLE_STOCK);
			ITEM(gm_mp5n_blk, 250, RIFLE_STOCK);
			ITEM(gm_mp5n_surefire_blk, 250, RIFLE_STOCK);
			ITEM(gm_mp5nsd1_blk, 350, RIFLE_STOCK);
			ITEM(gm_mp5nsd2_blk, 350, RIFLE_STOCK);
			ITEM(gm_mp5sd2_blk, 350, RIFLE_STOCK);
			ITEM(gm_mp5sd3_blk, 350, RIFLE_STOCK);
			ITEM(gm_mp5sd5_blk, 350, RIFLE_STOCK);
			ITEM(gm_mp5sd6_blk, 350, RIFLE_STOCK);
			ITEM(gm_hk53a2_blk, 400, RIFLE_STOCK);
			ITEM(gm_hk53a3_blk, 400, RIFLE_STOCK);
		};

		class launchersgm
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(gm_m72a3_oli, 200, 50);
			ITEM(gm_rpg18_oli, 200, 50);
			ITEM(gm_pzf3_blk, 800, 50); 
			ITEM(gm_pzf44_2_oli, 500, 15);
			ITEM(gm_rpg7_wud, 700, 15);
			ITEM(gm_rpg7_prp, 700, 15);
			ITEM(gm_pzf84_oli, 1000, 15);
			ITEM(gm_fim43_oli, 750, 50);
			ITEM(gm_9k32m_oli, 750, 50);
			ITEM(gm_p2a1_launcher_blk, 20000, 10);

		};
	
		class launcherMagazinesgm 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			class gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf {
				price = 125;
				stock = 50;
			};
			class gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf {
				price = 145;
				stock = 50;
			};
			class gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf {
				price = 200;
				stock = 50;
			};
			class gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf {
				price = 250;
				stock = 50;
			};
			class gm_1Rnd_84x245mm_ILLUM_DM16_carlgustaf {
				price = 25;
				stock = 50;
			};

			class gm_1Rnd_66mm_heat_m72a3 {
				price = 50;
				stock = 50;
			};

			class gm_1Rnd_60mm_heat_dm12_pzf3 {
				price = 150;
				stock = 50;
			};
			class gm_1Rnd_60mm_heat_dm22_pzf3 {
				price = 200;
				stock = 50;
			};
			class gm_1Rnd_60mm_heat_dm32_pzf3 {
				price = 300;
				stock = 50;
			};

			class gm_1Rnd_44x537mm_heat_dm32_pzf44_2 {
				price = 90;
				stock = 50;
			};

			class gm_1Rnd_70mm_he_m585_fim43 {
				price = 750;
				stock = 50;
			};

			class gm_1Rnd_72mm_he_9m32m {
				price = 750;
				stock = 50;
			};

			class gm_1Rnd_40mm_heat_pg7v_rpg7 {
				price = 115;
				stock = 50;
			};
			class gm_1Rnd_40mm_heat_pg7vl_rpg7 {
				price = 200;
				stock = 50;
			};

			class gm_1Rnd_2650mm_potato_dm11 {
				price = 1000;
				stock = 10;
			};

		};

		class opticsgm
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class gm_pso1_gry {
				price = 500;
				stock = 50;
			};

			class gm_zvn64_rear_ak {
				price = 25;
				stock = 50;
			};

			class gm_c79a1_blk {
				price = 400;
				stock = 50;
			};

			class gm_c79a1_oli {
				price = 400;
				stock = 50;
			};

			class gm_feroz24_blk {
				price = 250;
				stock = 50;
			};

			class gm_feroz2x17_pzf44_2_blk {
				price = 250;
				stock = 50;
			};

			class gm_feroz2x17_pzf44_2_des {
				price = 250;
				stock = 50;
			};

			class gm_feroz2x17_pzf44_2_win {
				price = 250;
				stock = 50;
			};

			class gm_pgo7v_blk {
				price = 250;
				stock = 50;
			};

			class gm_zfk4x25_blk {
				price = 250;
				stock = 50;
			};

			class gm_zpp_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_streamlight_sl20_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_streamlight_sl20_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_streamlight_sl20_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_streamlight_sl20_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_streamlight_sl20_stanagClaw_brn {
				price = 250;
				stock = 50;
			};
			class gm_streamlight_sl20_stanaghk_brn {
				price = 250;
				stock = 50;
			};
			class gm_streamlight_sl20_ris_brn {
				price = 250;
				stock = 50;
			};
			class gm_streamlight_sl20_stanagSig_brn {
				price = 250;
				stock = 50;
			};
			class gm_blits_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_blits_stanagHK_blk {
				price = 250;
				stock = 50;
			};
			class gm_blits_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_blits_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_blits_stanagClaw_oli {
				price = 250;
				stock = 50;
			};
			class gm_diavari_da_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_diavari_da_stanagClaw_oli {
				price = 250;
				stock = 50;
			};
			class gm_zf10x42_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_zf10x42_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_zf10x42_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_zf10x42_stanagsig_blk {
				price = 250;
				stock = 50;
			};
			class gm_zf10x42_stanagClaw_oli {
				price = 250;
				stock = 50;
			};
			class gm_zf10x42_stanaghk_oli {
				price = 250;
				stock = 50;
			};
			class gm_zf10x42_ris_oli {
				price = 250;
				stock = 50;
			};
			class gm_zf10x42_stanagsig_oli {
				price = 250;
				stock = 50;
			};
			class gm_feroz2x17_pzf84_blk {
				price = 250;
				stock = 50;
			};
			class gm_zf6x42_psg1_stanag_blk {
				price = 250;
				stock = 50;
			};
			class gm_feroz24_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_feroz24_stanagHK_blk {
				price = 250;
				stock = 50;
			};
			class gm_feroz24_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_feroz24_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_feroz24_stanagClaw_oli {
				price = 250;
				stock = 50;
			};
			class gm_feroz51_stanagClaw_oli {
				price = 250;
				stock = 50;
			};
			class gm_feroz51_stanagHK_oli {
				price = 250;
				stock = 50;
			};
			class gm_feroz51_pzf44_2_oli {
				price = 250;
				stock = 50;
			};
			class gm_feroz51_pzf84_oli {
				price = 250;
				stock = 50;
			};
			class gm_feroz51_ris_oli {
				price = 250;
				stock = 50;
			};
			class gm_feroz51_stanagSig_oli {
				price = 250;
				stock = 50;
			};
			class gm_g11_lps_prism11mm_blk {
				price = 250;
				stock = 50;
			};
			class gm_g11_mps_prism11mm_blk {
				price = 250;
				stock = 50;
			};
			class gm_lsminiv_ir_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_lsminiv_ir_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_lsminiv_ir_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_lsminiv_ir_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_lsminiv_red_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_lsminiv_red_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_lsminiv_red_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_lsminiv_red_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls1500_ir_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls1500_ir_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls1500_ir_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls1500_ir_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls1500_red_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls1500_red_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls1500_red_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls1500_red_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_ir_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_ir_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_ir_uziclaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_ir_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_ir_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_red_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_red_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_red_uziclaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_red_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_ls45_red_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_maglite_3d_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_maglite_3d_stanaghk_blk {
				price = 250;
				stock = 50;
			};
			class gm_maglite_3d_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_maglite_3d_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_nspu_dovetail_blk {
				price = 250;
				stock = 50;
			};
			class gm_nspu_dovetail_gry {
				price = 250;
				stock = 50;
			};
			class gm_pka_dovetail_blk {
				price = 250;
				stock = 50;
			};
			class gm_pka_dovetail_gry {
				price = 250;
				stock = 50;
			};
			class gm_pso6x36_1_dovetail_blk {
				price = 250;
				stock = 50;
			};
			class gm_pso6x36_1_dovetail_gry {
				price = 250;
				stock = 50;
			};
			class gm_pso1_dovetail_blk {
				price = 250;
				stock = 50;
			};
			class gm_pso1_dovetail_gry {
				price = 250;
				stock = 50;
			};
			class gm_colt4x20_ar15_blk {
				price = 250;
				stock = 50;
			};
			class gm_colt4x20_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_rv_stanagClaw_blk {
				price = 250;
				stock = 50;
			};
			class gm_rv_stanagHK_blk {
				price = 250;
				stock = 50;
			};
			class gm_rv_ris_blk {
				price = 250;
				stock = 50;
			};
			class gm_rv_stanagSig_blk {
				price = 250;
				stock = 50;
			};
			class gm_rv_stanagClaw_oli {
				price = 250;
				stock = 50;
			};
			class gm_zln1k_grn_dovetail_blk {
				price = 250;
				stock = 50;
			};
			class gm_zln1k_grn_dovetail_gry {
				price = 250;
				stock = 50;
			};
			class gm_zln1k_ir_dovetail_blk {
				price = 250;
				stock = 50;
			};
			class gm_zln1k_ir_dovetail_gry {
				price = 250;
				stock = 50;
			};
			class gm_zvn64_ak {
				price = 250;
				stock = 50;
			};
			class gm_zvn64_akk {
				price = 250;
				stock = 50;
			};
			class gm_zvn64_lmgk500 {
				price = 250;
				stock = 50;
			};
			class gm_zvn64_rpk {
				price = 250;
				stock = 50;
			};

		};

		class pointersgm 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_pointers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(gm_zvn64_front, 25, PN_STOCK);
			
			ITEM(gm_surefire_l60_wht_bayonetg11_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l60_ir_bayonetg11_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l60_red_bayonetg11_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l72_grn_bayonetg11_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l72_red_bayonetg11_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l75_ir_bayonetg11_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l60_wht_surefire_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l60_wht_hoseclamp_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l60_ir_surefire_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l60_ir_hoseclamp_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l60_red_surefire_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l60_red_hoseclamp_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l72_grn_surefire_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l72_grn_hoseclamp_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l72_red_surefire_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l72_red_hoseclamp_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l75_ir_surefire_blk, 25, PN_STOCK);
			ITEM(gm_surefire_l75_ir_hoseclamp_blk, 25, PN_STOCK);
			ITEM(gm_maglite_2d_hkslim_blk, 25, PN_STOCK);
			ITEM(gm_flashlightp2_wht_ak74handguard_blu, 25, PN_STOCK);
			ITEM(gm_flashlightp2_wht_akhandguard_blu, 25, PN_STOCK);
			ITEM(gm_flashlightp2_wht_akkhandguard_blu, 25, PN_STOCK);
			ITEM(gm_flashlightp2_brk_ak74handguard_dino, 25, PN_STOCK);
			ITEM(gm_flashlightp2_brk_akhandguard_dino, 25, PN_STOCK);
			ITEM(gm_flashlightp2_brk_akkhandguard_dino, 25, PN_STOCK);
		};

		class muzzlesgm 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(gm_bayonet_6x3_wud, 10, PN_STOCK);
			ITEM(gm_bayonet_6x3_blk, 10, PN_STOCK);

			ITEM(gm_bayonet_g11_blk, 10, PN_STOCK);
			ITEM(gm_bayonet_g11_oli, 10, PN_STOCK);
			ITEM(gm_bayonet_g3_blk, 10, PN_STOCK);
			ITEM(gm_bayonet_g3_oli, 10, PN_STOCK);
			ITEM(gm_suppressor_atec150_556mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_atec150_556mm_long_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_atec150_762mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_atec150_762mm_long_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_hknavy_9mm_gry, 10, PN_STOCK);
			ITEM(gm_suppressor_m10_9mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_kacnavy_9mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_kacnavyk_9mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_kacnavysd_9mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_pbs1_762mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_pbs4_545mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_safloryt_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_tgpp_9mm_blk, 10, PN_STOCK);
			ITEM(gm_suppressor_tgpv_762mm_blk, 10, PN_STOCK);

		};

		class magazinesgm 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";


			///////////////////////////////////////////////////////
			// Underbarrel
			///////////////////////////////////////////////////////



			///////////////////////////////////////////////////////
			// Pistols, SMGs
			///////////////////////////////////////////////////////
			class gm_1Rnd_265mm_flare_single_wht_gc {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class gm_8Rnd_9x19mm_B_DM11_p210_blk {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class gm_8Rnd_9x19mm_B_DM11_p1_blk {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class gm_8Rnd_9x19mm_BSD_DM81_p1_blk {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class gm_8Rnd_9x19mm_B_DM51_p210_blk {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_smoke_single_blk_gc {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class gm_8Rnd_9x18mm_B_pst_pm_blk {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class gm_15Rnd_9x18mm_B_pst_pm63_blk {
				price = 30;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_multi_nbc_DM47 {
				price = 30;
				stock = MAGAZINE_STOCK;
			};

			class gm_30Rnd_9x19mm_B_DM51_mp5_blk {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_9x19mm_B_DM11_mp5_blk {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_9x19mm_AP_DM91_mp5_blk {
				price = 100;
				stock = MAGAZINE_STOCK;
			};

			class gm_32Rnd_9x19mm_B_DM51_mp2_blk {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class gm_32Rnd_9x19mm_B_DM11_mp2_blk {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class gm_32Rnd_9x19mm_AP_DM91_mp2_blk {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_9x19mm_B_DM11_mp5a3_blk {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class gm_60Rnd_9x19mm_B_DM11_mp5a3_blk {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			

			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////
			class gm_30Rnd_556x45mm_B_DM11_g36_blk {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_T_DM21_g36_blk {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class gm_30Rnd_556x45mm_B_DM11_g36_des {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_T_DM21_g36_des {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_DM11_hk33_blk {
				price = 80;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_T_DM21_g3_blk {
				price = 90;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_B_57N231_ak47_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_545x39mm_B_7N6_ak74_org {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_556x45mm_B_M193_stanag_gry {
				price = 85;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_M855_stanag_gry {
				price = 95;
				stock = MAGAZINE_STOCK;
			};

			class gm_7rnd_12ga_hk512_pellet {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_7rnd_12ga_hk512_slug {
				price = 95;
				stock = MAGAZINE_STOCK;
			};

			class gm_1Rnd_265mm_flare_single_grn_gc {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_multi_red_gc {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_single_red_gc {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_single_yel_DM10 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_single_grn_DM11 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_single_red_DM13 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};

			class gm_1Rnd_265mm_flare_single_wht_DM15 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_para_yel_DM16 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_multi_yel_DM20 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_multi_grn_DM21 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_multi_red_DM23 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_flare_multi_wht_DM25 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_smoke_single_blu_gc {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_smoke_single_yel_gc {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_smoke_single_yel_DM19 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_smoke_single_org_DM22 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_265mm_smoke_single_vlt_DM24 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_545x39mm_B_7N6_ak74_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_50Rnd_473x33mm_B_DM11_g11_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_50Rnd_473x33mm_B_T_DM21_g11_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_545x39mm_B_7N6_ak74_prp {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_545x39mm_B_T_7T3_ak74_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_545x39mm_B_T_7T3_ak74_org {
				price = 95;
				stock = MAGAZINE_STOCK;
			};


			class gm_30Rnd_545x39mm_B_T_7T3_ak74_prp {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_45Rnd_545x39mm_B_7N6_ak74_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_45Rnd_545x39mm_B_T_7T3_ak74_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_45Rnd_545x39mm_B_T_7T3_ak74_org {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_556x45mm_B_M855_stanag_gry {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_556x45mm_B_T_M196_stanag_gry {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_556x45mm_B_T_M856_stanag_gry {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_T_DM21_hk33_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};


			class gm_30Rnd_556x45mm_B_M193_stanag_gry {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_T_M196_stanag_gry {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_T_M856_stanag_gry {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_DM11_sg550_brn {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_556x45mm_B_T_DM21_sg550_brn {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_40Rnd_556x45mm_B_DM11_hk33_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_40Rnd_556x45mm_B_T_DM21_hk33_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_60Rnd_556x45mm_B_DM11_hk33_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};



			class gm_60Rnd_556x45mm_B_T_DM21_hk33_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_1Rnd_64mm_heat_pg18 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_100Rnd_762x51mm_B_T_DM21_mg8_oli {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_100Rnd_762x51mm_B_T_DM21A1_mg8_oli {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_10Rnd_762x51mm_AP_DM151_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_10Rnd_762x51mm_B_DM111_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_10Rnd_762x51mm_B_DM41_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_10Rnd_762x51mm_B_T_DM21_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_10Rnd_762x51mm_B_T_DM21A1_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_10Rnd_762x51mm_B_T_DM21A2_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_DM111_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_T_DM21_g3_gold {
				price = 1000;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_AP_DM151_sg542_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};


			class gm_20Rnd_762x51mm_B_DM111_sg542_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_DM41_sg542_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_T_DM21_sg542_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_T_DM21A1_sg542_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_20Rnd_762x51mm_B_T_DM21A2_sg542_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_AP_7N23_akm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_AP_7N23_ak47_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_AP_7N23_akm_org {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_B_57N231_akm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_B_57N231_akm_org {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_BSD_57N231U_akm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_BSD_57N231U_ak47_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_BSD_57N231U_akm_org {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_B_T_57N231P_akm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_B_T_57N231P_akm_org {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_AP_7N23_mpikm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_B_57N231_mpikm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_BSD_57N231U_mpikm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_762x39mm_B_T_57N231P_mpikm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_40Rnd_762x51mm_AP_DM151_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_40Rnd_762x51mm_B_DM111_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_40Rnd_762x51mm_B_DM41_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};



			class gm_40Rnd_762x51mm_B_T_DM21_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_40Rnd_762x51mm_B_T_DM21A1_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_40Rnd_762x51mm_B_T_DM21A2_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_5Rnd_762x51mm_AP_DM151_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_5Rnd_762x51mm_B_DM111_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_5Rnd_762x51mm_B_T_DM21_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_5Rnd_762x51mm_B_T_DM21A1_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_5Rnd_762x51mm_B_T_DM21A2_g3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_75Rnd_762x39mm_AP_7N23_ak47_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_75Rnd_762x39mm_B_57N231_ak47_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_75Rnd_762x39mm_B_T_57N231P_ak47_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_75Rnd_762x39mm_AP_7N23_mpikm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};


			class gm_75Rnd_762x39mm_BSD_57N231U_mpikm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_75Rnd_762x39mm_B_T_57N231P_mpikm_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_25Rnd_9x18mm_B_pst_pm63_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_9x19mm_BSD_DM81_mp5_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_9x19mm_AP_DM91_mp5a3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_9x19mm_B_DM51_mp5a3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_30Rnd_9x19mm_BSD_DM81_mp5a3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_60Rnd_9x19mm_B_DM51_mp5a3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_60Rnd_9x19mm_BSD_DM81_mp5a3_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_8Rnd_9x19mm_B_DM51_p1_blk {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			class gm_mine_ap_pfm1 {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class gm_mine_at_dm1233 {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class gm_mine_at_mn111 {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class gm_mine_at_ptm3 {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class gm_1rnd_67mm_heat_dm22a1_g3 {
				price = 95;
				stock = MAGAZINE_STOCK;
			};
			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////

			class gm_10Rnd_762x54mmR_AP_7N1_svd_blk {
				price = 225;
				stock = MAGAZINE_STOCK;
			};

			class gm_10Rnd_762x54mmR_API_7bz3_svd_blk {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class gm_10Rnd_762x54mmR_B_T_7t2_svd_blk {
				price = 235;
				stock = MAGAZINE_STOCK;
			};
			
			class gm_20Rnd_762x51mm_AP_DM151_g3_blk {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class gm_20Rnd_762x51mm_B_DM41_g3_blk {
				price = 235;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// MGs
			///////////////////////////////////////////////////////
			class gm_45Rnd_545x39mm_B_7N6_ak74_prp {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class gm_45Rnd_545x39mm_B_T_7T3_ak74_prp {
				price = 115;
				stock = MAGAZINE_STOCK;
			};

			class gm_100Rnd_762x54mmR_B_T_7t2_pk_grn {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class gm_100Rnd_762x54mmR_API_7bz3_pk_grn {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
			class gm_100Rnd_762x54mm_B_T_t46_pk_grn {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class gm_100Rnd_762x54mm_API_b32_pk_grn {
				price = 325;
				stock = MAGAZINE_STOCK;
			};

			class gm_120Rnd_762x51mm_B_T_DM21_mg3_grn {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
			class gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn {
				price = 325;
				stock = MAGAZINE_STOCK;
			};
			class gm_75Rnd_762x39mm_B_57N231_mpikm_blk {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class gm_45Rnd_545x39mm_B_7N6_ak74_org {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class gm_75Rnd_762x39mm_BSD_57N231U_ak47_blk {
				price = 275;
				stock = MAGAZINE_STOCK;
			};
			///////////////////////////////////////////////////////
			// SMGs
			///////////////////////////////////////////////////////

		};
		
		class underbarrelgm
		{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(gm_g3_bipod_blk, 50, 20);
			ITEM(gm_g8_bipod_blk, 50, 20);
			ITEM(gm_msg90_bipod_blk, 50, 20);
			
		};	
		
		class miscgm
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(gm_explosive_petn_charge, 450, MISC_STOCK);
			ITEM(gm_explosive_plnp_charge, 400, MISC_STOCK);

			ITEM(gm_mine_ap_dm31, 400, MISC_STOCK);
			ITEM(gm_mine_at_dm21, 400, MISC_STOCK);
			ITEM(gm_mine_at_tm46, 400, MISC_STOCK);

			ITEM(gm_handgrenade_conc_dm51, 100, MISC_STOCK);
			ITEM(gm_handgrenade_conc_dm51a1, 400, MISC_STOCK);
			ITEM(gm_handgrenade_frag_dm41a1, 100, MISC_STOCK);
			ITEM(gm_handgrenade_frag_dm51, 100, MISC_STOCK);
			ITEM(gm_handgrenade_frag_dm51a1, 100, MISC_STOCK);
			ITEM(gm_handgrenade_frag_m26, 100, MISC_STOCK);
			ITEM(gm_handgrenade_frag_m26a1, 100, MISC_STOCK);
			ITEM(gm_handgrenade_frag_rgd5, 100, MISC_STOCK);
			ITEM(gm_handgrenade_pracconc_dm58, 5, MISC_STOCK);
			ITEM(gm_handgrenade_pracfrag_dm58, 5, MISC_STOCK);
			ITEM(gm_smokeshell_blk_gc, 50, MISC_STOCK);
			ITEM(gm_smokeshell_blu_gc, 50, MISC_STOCK);
			ITEM(gm_smokeshell_grn_gc, 50, MISC_STOCK);
			ITEM(gm_smokeshell_org_gc, 50, MISC_STOCK);
			ITEM(gm_smokeshell_red_gc, 50, MISC_STOCK);
			ITEM(gm_smokeshell_wht_gc, 50, MISC_STOCK);
			ITEM(gm_smokeshell_yel_gc, 50, MISC_STOCK);
			ITEM(gm_smokeshell_grn_dm21, 50, MISC_STOCK);
			ITEM(gm_smokeshell_red_dm23, 50, MISC_STOCK);
			ITEM(gm_smokeshell_wht_dm25, 50, MISC_STOCK);
			ITEM(gm_smokeshell_yel_dm26, 50, MISC_STOCK);
			ITEM(gm_smokeshell_org_dm32, 50, MISC_STOCK);

			ITEM(gm_boltcutter, 50, MISC_STOCK);
			ITEM(gm_ge_army_burnBandage, 50, MISC_STOCK);
			ITEM(gm_gc_army_gauzeBandage, 50, MISC_STOCK);
			ITEM(gm_ge_army_gauzeBandage, 50, MISC_STOCK);
			ITEM(gm_ge_army_gauzeCompress, 50, MISC_STOCK);
			ITEM(gm_gc_army_medbox, 100, MISC_STOCK);
			ITEM(gm_ge_army_medkit_80, 50, MISC_STOCK);
			ITEM(gm_gc_army_medkit, 50, MISC_STOCK);
			ITEM(gm_repairkit_01, 200, MISC_STOCK);
			ITEM(gm_ge_firstaidkit_vehicle, 50, MISC_STOCK);
			ITEM(gm_gc_firstaidkit_vehicle, 50, MISC_STOCK);
			ITEM(gm_ge_army_firstaidkit_vehicle, 50, MISC_STOCK);

		};

		class navigationgm
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_gm", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(gm_lpr1_oli, 100, NN_STOCK);
			ITEM(gm_lp7_oli, 100, NN_STOCK);
			ITEM(gm_photocamera_01_blk, 100, NN_STOCK);
			ITEM(gm_ferod16_win, 100, NN_STOCK);
			ITEM(gm_ferod16_oli, 100, NN_STOCK);
			ITEM(gm_ferod16_des, 100, NN_STOCK);
			ITEM(gm_fero51_oli, 100, NN_STOCK);
			ITEM(gm_df7x40_blk, 100, NN_STOCK);

			ITEM(gm_gc_compass_f73, 10, NN_STOCK);
			ITEM(gm_ge_army_conat2, 10, NN_STOCK);
			ITEM(gm_watch_kosei_80, 10, NN_STOCK);

			ITEM(gm_nsg66_oli, 500, NN_STOCK);
			ITEM(gm_ferod51_oli, 500, NN_STOCK);

		};

		class helmetsgm 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_helmets"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			/////helmets

			ITEM(gm_gc_headgear_zsh3_orn, 100, MISC_STOCK);
			ITEM(gm_gc_headgear_zsh3_blu, 100, MISC_STOCK);
			ITEM(gm_gc_headgear_zsh3_wht, 100, MISC_STOCK);

			ITEM(gm_ge_headgear_hat_beanie_crew_blk, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_beanie_blk, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_winterhat_80_oli, 50, MISC_STOCK);

			ITEM(gm_gc_army_headgear_m56_cover_win, 100, MISC_STOCK);
			ITEM(gm_gc_army_headgear_m56_cover_str, 100, MISC_STOCK);
			ITEM(gm_gc_army_headgear_m56_net, 100, MISC_STOCK);
			ITEM(gm_gc_army_headgear_m56_cover_blu, 100, MISC_STOCK);
			ITEM(gm_gc_army_headgear_m56, 100, MISC_STOCK);

			ITEM(gm_ge_headgear_sidecap_80_m62_oli, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_sidecap_80_oli, 50, MISC_STOCK);
			ITEM(gm_gc_army_headgear_hat_80_grn, 50, MISC_STOCK);
			ITEM(gm_gc_bgs_headgear_hat_80_gry, 50, MISC_STOCK);
			ITEM(gm_ge_dbp_headgear_cap_80_blu, 50, MISC_STOCK);
			ITEM(gm_ge_pol_headgear_cap_80_wht, 50, MISC_STOCK);

			ITEM(gm_ge_pol_headgear_cap_80_grn, 50, MISC_STOCK);
			ITEM(gm_gc_pol_headgear_cap_80_blu, 50, MISC_STOCK);
			ITEM(gm_gc_army_headgear_cap_80_gry, 50, MISC_STOCK);

			ITEM(gm_pl_headgear_wz67_cover_win, 100, MISC_STOCK);
			ITEM(gm_pl_army_headgear_wz67_net_oli, 100, MISC_STOCK);
			ITEM(gm_pl_army_headgear_wz67_oli, 100, MISC_STOCK);
			ITEM(gm_pl_army_headgear_wz63_net_oli, 100, MISC_STOCK);
			ITEM(gm_pl_army_headgear_wz63_oli, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_sph4_oli, 50, MISC_STOCK);

			ITEM(gm_ge_bgs_headgear_psh77_cover_str, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_psh77_cover_down_str, 150, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_psh77_cover_down_smp, 150, MISC_STOCK);
			ITEM(gm_ge_headgear_psh77_down_oli, 150, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_psh77_cover_up_str, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_psh77_cover_up_smp, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_psh77_up_oli, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_psh77_cover_smp, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_psh77_oli, 100, MISC_STOCK);

			ITEM(gm_ge_headgear_m92_cover_win, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_cover_oli, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_cover_glasses_win, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_cover_glasses_oli, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_cover_glasses_blk, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_glasses_trp, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_glasses_flk, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_cover_blk, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_trp, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m92_flk, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m62_cover_wdl, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m62_win_pap_01, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m62_cover_win, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m62_net, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m62_cover_blu, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_m62, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_m38_72_goggles_bgr, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_m38_72_bgr, 100, MISC_STOCK);
			ITEM(gm_ge_ff_headgear_m35_53_tan, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_m35_53_net_blk, 100, MISC_STOCK);

			ITEM(gm_ge_bgs_headgear_m35_53_blk, 100, MISC_STOCK);
			ITEM(gm_dk_headgear_m52_net_win, 100, MISC_STOCK);
			ITEM(gm_dk_headgear_m52_net_oli, 100, MISC_STOCK);
			ITEM(gm_dk_headgear_m52_oli, 100, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_dino, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_wht, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_str, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_oli, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_moro, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_m84, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_grn, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_frog, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_crew_01_oli, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_crew_01_m84, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_crew_01_grn, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_crew_01_smp, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_crew_01_blk, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_crew_01_flk, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_crew_01_trp, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_smp, 50, MISC_STOCK);

			ITEM(gm_xx_headgear_headwrap_01_blu, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_blk, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_flk, 50, MISC_STOCK);
			ITEM(gm_xx_headgear_headwrap_01_trp, 50, MISC_STOCK);
			ITEM(gm_gc_headgear_fjh_model4_wht, 50, MISC_STOCK);
			ITEM(gm_gc_headgear_fjh_model4_oli, 50, MISC_STOCK);
			ITEM(gm_pl_army_headgear_cap_80_frog, 50, MISC_STOCK);
			ITEM(gm_pl_army_headgear_cap_80_moro, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_80_m62_oli, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_80_oli, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_80_gry, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_90_flk, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_90_trp, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_supply, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_signals, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_blk_recon, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_bdx_paratrooper, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_opcom, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_nbc, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_militarypolice, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_grn_mechinf, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_maintenance, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_grn_infantry, 50, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_beret_crew_grn_sf, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_engineer, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_beret_crew_grn, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_blk, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_artillery, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_blk_armorrecon, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_blk_armor, 100, MISC_STOCK);

			ITEM(gm_ge_headgear_beret_crew_blk_antitank, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_crew_red_antiair, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_headset_crew_oli, 100, MISC_STOCK);
			ITEM(gm_gc_army_headgear_crewhat_80_blk, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_crewhat_80_blk, 100, MISC_STOCK);
			ITEM(gm_dk_headgear_m96_cover_wdl, 100, MISC_STOCK);
			ITEM(gm_dk_headgear_m96_cover_wht, 100, MISC_STOCK);
			ITEM(gm_dk_headgear_m96_cover_m84, 100, MISC_STOCK);
			ITEM(gm_dk_headgear_m96_blu, 100, MISC_STOCK);
			ITEM(gm_dk_headgear_m96_oli, 100, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_boonie_wdl, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_boonie_oli, 50, MISC_STOCK);
			ITEM(gm_dk_headgear_hat_boonie_m84, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_hat_boonie_flk, 50, MISC_STOCK);

			ITEM(gm_ge_headgear_hat_boonie_trp, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_geoinfo, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_supply, 50, MISC_STOCK);
			ITEM(gm_gc_headgear_beret_str, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_bdx_specop, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_signals, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_blk_recon, 50, MISC_STOCK);
			ITEM(gm_pl_headgear_beret_bdx, 50, MISC_STOCK);
			ITEM(gm_pl_headgear_beret_blk_empty, 50, MISC_STOCK);
			ITEM(gm_pl_headgear_beret_blu, 50, MISC_STOCK);
			ITEM(gm_pl_headgear_beret_blk, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_bdx_paratrooper, 50, MISC_STOCK);
			ITEM(gm_gc_headgear_beret_orn, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_opcom, 50, MISC_STOCK);
			ITEM(gm_gc_headgear_beret_officer_str, 50, MISC_STOCK);
			ITEM(gm_gc_headgear_beret_officer_orn, 50, MISC_STOCK);
			ITEM(gm_gc_headgear_beret_officer_blk, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_nbc, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_grn_music, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_militarypolice, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_blu_medical, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_grn_mechinf, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_maintenance, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_bdx_lrrp, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_grn_infantry, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_grn_guardbtl, 50, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_beret_grn_sf, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_engineer, 50, MISC_STOCK);
			ITEM(gm_gc_headgear_beret_blk, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_mrb, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_un, 50, MISC_STOCK);
			ITEM(gm_ge_bgs_headgear_beret_grn, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_blk, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_artillery, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_bdx_armyaviation, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_blk_armorrecon, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_blk_armor, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_blk_antitank, 50, MISC_STOCK);
			ITEM(gm_ge_headgear_beret_red_antiair, 50, MISC_STOCK);
			/////helmets
		};

		class uniformsgm 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_uniforms"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			////uniforms

			ITEM(gm_gc_civ_uniform_man_04_80_gry, 100, MISC_STOCK);
			ITEM(gm_gc_civ_uniform_man_04_80_blu, 100, MISC_STOCK);
			ITEM(gm_ge_dbp_uniform_suit_80_blu, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_crew_80_oli, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_crew_90_flk, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_crew_90_trp, 100, MISC_STOCK);
			ITEM(gm_gc_civ_uniform_man_03_80_gry, 100, MISC_STOCK);
			ITEM(gm_gc_civ_uniform_man_03_80_grn, 100, MISC_STOCK);
			ITEM(gm_gc_civ_uniform_man_03_80_blu, 100, MISC_STOCK);
			ITEM(gm_ge_pol_uniform_suit_80_grn, 100, MISC_STOCK);
			ITEM(gm_ge_pol_uniform_blouse_80_blk, 100, MISC_STOCK);
			ITEM(gm_pl_airforce_uniform_pilot_80_gry, 100, MISC_STOCK);
			ITEM(gm_gc_airforce_uniform_pilot_80_blu, 100, MISC_STOCK);
			ITEM(gm_gc_civ_uniform_pilot_80_blk, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_uniform_special_rolled_80_blk, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_uniform_special_rolled_80_grn, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_uniform_special_80_blk, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_uniform_special_80_grn, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_04_wdl, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_01_oli, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_01_alp, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_01_m84, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_02_wdl, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_02_oli, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_03_blk, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_03_brn, 100, MISC_STOCK);
			ITEM(gm_xx_army_uniform_fighter_04_grn, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_pilot_rolled_sar, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_pilot_sar, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_pilot_rolled_oli, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_pilot_oli, 100, MISC_STOCK);
			ITEM(gm_ge_pol_uniform_pilot_rolled_grn, 100, MISC_STOCK);
			ITEM(gm_ge_pol_uniform_pilot_grn, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_pilot_commando_rolled_oli, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_pilot_commando_rolled_gry, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_pilot_commando_rolled_blk, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_pilot_commando_oli, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_pilot_commando_gry, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_pilot_commando_blk, 100, MISC_STOCK);
			ITEM(gm_ge_ff_uniform_man_80_orn, 100, MISC_STOCK);
			ITEM(gm_pl_army_uniform_soldier_80_win, 100, MISC_STOCK);
			ITEM(gm_pl_army_uniform_soldier_rolled_80_frog, 100, MISC_STOCK);
			ITEM(gm_pl_army_uniform_soldier_rolled_80_moro, 100, MISC_STOCK);
			ITEM(gm_pl_army_uniform_soldier_autumn_80_moro, 100, MISC_STOCK);
			ITEM(gm_pl_army_uniform_soldier_80_frog, 100, MISC_STOCK);
			ITEM(gm_pl_army_uniform_soldier_80_moro, 100, MISC_STOCK);
			ITEM(gm_gc_army_uniform_soldier_gloves_80_str, 100, MISC_STOCK);
			ITEM(gm_gc_army_uniform_soldier_80_win, 100, MISC_STOCK);
			ITEM(gm_gc_army_uniform_soldier_80_str, 100, MISC_STOCK);
			ITEM(gm_gc_army_uniform_soldier_80_blk, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_soldier_parka_80_win, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_soldier_parka_80_ols, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_soldier_parka_80_oli, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_soldier_80_ols, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_soldier_gloves_80_ols, 100, MISC_STOCK);
			ITEM(gm_ge_army_uniform_soldier_80_oli, 100, MISC_STOCK);
			ITEM(gm_gc_pol_uniform_dress_80_blu, 100, MISC_STOCK);
			ITEM(gm_gc_army_uniform_dress_80_gry, 100, MISC_STOCK);
			ITEM(gm_dk_army_uniform_soldier_84_win, 100, MISC_STOCK);
			ITEM(gm_dk_army_uniform_soldier_84_oli, 100, MISC_STOCK);
			ITEM(gm_dk_army_uniform_soldier_84_m84, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_soldier_tshirt_90_oli, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_soldier_tshirt_90_trp, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_soldier_tshirt_90_flk, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_soldier_rolled_90_trp, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_soldier_rolled_90_flk, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_soldier_90_trp, 100, MISC_STOCK);
			ITEM(gm_ge_uniform_soldier_90_flk, 100, MISC_STOCK);
			ITEM(gm_ge_civ_uniform_blouse_80_gry, 100, MISC_STOCK);
			ITEM(gm_gc_civ_uniform_man_02_80_brn, 100, MISC_STOCK);
			ITEM(gm_gc_civ_uniform_man_01_80_blu, 100, MISC_STOCK);
			ITEM(gm_gc_civ_uniform_man_01_80_blk, 100, MISC_STOCK);
			ITEM(gm_ge_bgs_uniform_soldier_80_smp, 100, MISC_STOCK);
			ITEM(gm_xx_uniform_soldier_bdu_nogloves_80_wdl, 100, MISC_STOCK);
			ITEM(gm_xx_uniform_soldier_bdu_rolled_80_wdl, 100, MISC_STOCK);
			ITEM(gm_xx_uniform_soldier_bdu_rolled_80_oli, 100, MISC_STOCK);
			ITEM(gm_xx_uniform_soldier_bdu_nogloves_80_oli, 100, MISC_STOCK);
			ITEM(gm_xx_uniform_soldier_bdu_80_wdl, 100, MISC_STOCK);
			ITEM(gm_xx_uniform_soldier_bdu_80_oli, 100, MISC_STOCK);
			////uniforms
		};

		class vestsgm
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_vests"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			///vests

			ITEM(gm_ge_bgs_vest_type3a1_gry, 200, MISC_STOCK);
			ITEM(gm_ge_bgs_vest_type3a1_oli, 200, MISC_STOCK);
			ITEM(gm_ge_bgs_vest_type3_gry, 200, MISC_STOCK);
			ITEM(gm_ge_bgs_vest_type3_blu, 200, MISC_STOCK);
			ITEM(gm_ge_bgs_vest_type3_oli, 200, MISC_STOCK);
			ITEM(gm_ge_bgs_vest_type18_grn, 200, MISC_STOCK);
			ITEM(gm_ge_bgs_vest_type18_blk, 200, MISC_STOCK);
			ITEM(gm_ge_army_vest_type18_dpm, 50, MISC_STOCK);
			ITEM(gm_pl_army_vest_80_rifleman_smg_gry, 50, MISC_STOCK);
			ITEM(gm_pl_army_vest_80_rifleman_gry, 50, MISC_STOCK);
			ITEM(gm_pl_army_vest_80_marksman_gry, 50, MISC_STOCK);
			ITEM(gm_pl_army_vest_80_mg_gry, 50, MISC_STOCK);
			ITEM(gm_pl_army_vest_80_leader_gry, 50, MISC_STOCK);
			ITEM(gm_pl_army_vest_80_crew_gry, 50, MISC_STOCK);
			ITEM(gm_pl_army_vest_80_at_gry, 50, MISC_STOCK);
			ITEM(gm_pl_army_vest_80_rig_gry, 50, MISC_STOCK);
			ITEM(gm_ge_vest_sov_80_wdl, 100, MISC_STOCK);
			ITEM(gm_ge_vest_sov_80_oli, 100, MISC_STOCK);
			ITEM(gm_ge_vest_sov_armor_80_wdl, 250, MISC_STOCK);
			ITEM(gm_ge_vest_sov_armor_80_oli, 250, MISC_STOCK);
			ITEM(gm_ge_vest_sov_armor_80_blk, 250, MISC_STOCK);
			ITEM(gm_ge_vest_sov_80_blk, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_rifleman_smg, 50, MISC_STOCK);
			ITEM(gm_dk_army_vest_54_rifleman, 50, MISC_STOCK);
			ITEM(gm_gc_army_vest_80_rifleman_str, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_rifleman, 50, MISC_STOCK);
			ITEM(gm_ge_pol_vest_80_wht, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_officer, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_mp_wht, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_medic, 50, MISC_STOCK);
			ITEM(gm_dk_army_vest_54_machinegunner, 50, MISC_STOCK);
			ITEM(gm_gc_army_vest_80_lmg_str, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_machinegunner, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_leader_smg, 50, MISC_STOCK);
			ITEM(gm_gc_army_vest_80_leader_str, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_leader, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_demolition, 50, MISC_STOCK);
			ITEM(gm_dk_army_vest_54_crew, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_crew, 50, MISC_STOCK);
			ITEM(gm_ge_bgs_vest_80_rifleman, 50, MISC_STOCK);
			ITEM(gm_gc_bgs_vest_80_border_str, 50, MISC_STOCK);
			ITEM(gm_gc_army_vest_80_at_str, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_bag, 20, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_wdl_rifleman, 200, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_win_rifleman, 200, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_m84_rifleman, 200, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_win_machinegunner, 200, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_m84_machinegunner, 200, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_wdl, 200, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_win, 200, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_blu, 200, MISC_STOCK);
			ITEM(gm_dk_army_vest_m00_m84, 200, MISC_STOCK);
			ITEM(gm_ge_vest_armor_90_rifleman_flk, 200, MISC_STOCK);
			ITEM(gm_ge_vest_armor_90_officer_flk, 200, MISC_STOCK);
			ITEM(gm_ge_vest_armor_90_medic_flk, 200, MISC_STOCK);
			ITEM(gm_ge_vest_armor_90_machinegunner_flk, 200, MISC_STOCK);
			ITEM(gm_ge_vest_armor_90_leader_flk, 200, MISC_STOCK);
			ITEM(gm_ge_vest_armor_90_demolition_flk, 200, MISC_STOCK);
			ITEM(gm_ge_vest_armor_90_crew_flk, 200, MISC_STOCK);
			ITEM(gm_ge_vest_armor_90_flk, 200, MISC_STOCK);
			ITEM(gm_gc_vest_combatvest3_str, 50, MISC_STOCK);
			ITEM(gm_gc_vest_combatvest3_pol, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_brassard_mp, 5, MISC_STOCK);
			ITEM(gm_ge_vest_90_rifleman_flk, 50, MISC_STOCK);
			ITEM(gm_ge_vest_90_officer_flk, 50, MISC_STOCK);
			ITEM(gm_ge_vest_90_medic_flk, 50, MISC_STOCK);
			ITEM(gm_ge_vest_90_machinegunner_flk, 50, MISC_STOCK);
			ITEM(gm_ge_vest_90_leader_flk, 50, MISC_STOCK);
			ITEM(gm_ge_vest_90_demolition_flk, 50, MISC_STOCK);
			ITEM(gm_ge_vest_90_crew_flk, 50, MISC_STOCK);
			ITEM(gm_ge_army_vest_80_belt, 5, MISC_STOCK);
			ITEM(gm_gc_army_vest_80_belt_str, 5, MISC_STOCK);
			ITEM(gm_ge_army_vest_pilot_pads_oli, 200, MISC_STOCK);
			ITEM(gm_ge_army_vest_pilot_oli, 200, MISC_STOCK);
			///vests
		};
		
		class backpacksgm
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_backpacks"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			///backpacks

			ITEM(gm_backpack_t10_parachute, 200, MISC_STOCK);
			ITEM(gm_ge_backpack_satchel_80_san, 200, MISC_STOCK);
			ITEM(gm_ge_backpack_satchel_80_blk, 200, MISC_STOCK);
			ITEM(gm_pl_army_backpack_at_80_gry, 250, MISC_STOCK);
			ITEM(gm_gc_army_backpack_80_at_str, 250, MISC_STOCK);
			ITEM(gm_ge_backpack_sem35_oli, 200, MISC_STOCK);
			ITEM(gm_gc_backpack_r105m_brn, 500, MISC_STOCK);
			ITEM(gm_gc_army_backpack_80_lmg_str, 250, MISC_STOCK);
			ITEM(gm_ge_army_backpack_medic_80_oli, 200, MISC_STOCK);
			ITEM(gm_pl_army_backpack_80_oli, 250, MISC_STOCK);
			ITEM(gm_ge_army_backpack_80_oli, 250, MISC_STOCK);
			ITEM(gm_ge_army_backpack_90_cover_win, 300, MISC_STOCK);
			ITEM(gm_ge_army_backpack_90_oli, 300, MISC_STOCK);
			ITEM(gm_ge_army_backpack_90_blk, 300, MISC_STOCK);
			ITEM(gm_ge_army_backpack_90_trp, 300, MISC_STOCK);
			ITEM(gm_ge_army_backpack_90_flk, 200, MISC_STOCK);
			ITEM(gm_gc_army_backpack_80_assaultpack_lmg_str, 250, MISC_STOCK);
			ITEM(gm_gc_army_backpack_80_assaultpack_empty_str, 250, MISC_STOCK);
			ITEM(gm_dk_army_backpack_73_oli, 250, MISC_STOCK);
			///backpacks
		};

		class faceweargm
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_gm", localize "STR_A3AU_facewear"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			///facewear

			ITEM(gm_ge_facewear_sunglasses, 50, MISC_STOCK);
			ITEM(gm_ge_facewear_stormhood_brd, 50, MISC_STOCK);
			ITEM(gm_ge_facewear_stormhood_dustglasses_blk, 50, MISC_STOCK);
			ITEM(gm_ge_facewear_stormhood_blk, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_wht, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_str, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_pt2, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_red, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_oli, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_moro, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_02_wht, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_02_oli, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_02_grn, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_02_blk, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_m84, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_gry, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_grn, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_frog, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_pt1, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_pt3, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_blu, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_blk, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_flk, 50, MISC_STOCK);
			ITEM(gm_xx_facewear_scarf_01_trp, 50, MISC_STOCK);
			ITEM(gm_headgear_foliage_summer_grass_04, 50, MISC_STOCK);
			ITEM(gm_headgear_foliage_summer_grass_03, 50, MISC_STOCK);
			ITEM(gm_headgear_foliage_summer_grass_02, 50, MISC_STOCK);
			ITEM(gm_headgear_foliage_summer_grass_01, 50, MISC_STOCK);
			ITEM(gm_ge_facewear_glacierglasses, 50, MISC_STOCK);
			ITEM(gm_gc_army_facewear_schm41m, 50, MISC_STOCK);
			ITEM(gm_ge_facewear_m65, 50, MISC_STOCK);
			ITEM(gm_headgear_foliage_summer_forest_04, 50, MISC_STOCK);
			ITEM(gm_headgear_foliage_summer_forest_03, 50, MISC_STOCK);
			ITEM(gm_headgear_foliage_summer_forest_02, 50, MISC_STOCK);
			ITEM(gm_headgear_foliage_summer_forest_01, 50, MISC_STOCK);
			ITEM(gm_gc_army_facewear_dustglasses, 50, MISC_STOCK);
			ITEM(gm_ge_facewear_dustglasses, 50, MISC_STOCK);
			ITEM(gm_ge_facewear_acidgoggles, 50, MISC_STOCK);
			///facewear
		};