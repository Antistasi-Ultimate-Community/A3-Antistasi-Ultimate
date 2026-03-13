		///////////////////////////////////////////////////////
		// RHS
		///////////////////////////////////////////////////////
		class handgunsRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(rhs_weap_makarov_pm, 75, PISTOL_STOCK);

			ITEM(rhs_weap_6p53, 150, PISTOL_STOCK);
			ITEM(rhs_weap_pya, 200, PISTOL_STOCK);
			ITEM(rhs_weap_pb_6p9, 250, PISTOL_STOCK);

			ITEM(rhsusf_weap_m9, 250, PISTOL_STOCK);
			ITEM(rhsusf_weap_m1911a1, 250, PISTOL_STOCK);

			ITEM(rhs_weap_savz61_folded, 300, PISTOL_STOCK);

			ITEM(rhs_weap_cz99, 350, PISTOL_STOCK);
			ITEM(rhsusf_weap_glock17g4, 300, PISTOL_STOCK);

			ITEM(rhs_weap_M320, 400, PISTOL_STOCK);
		};

		class launchersRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";

			ITEM(rhs_weap_rpg26, 200, 50);
			ITEM(rhs_weap_rshg2, 200, 50);
			ITEM(rhs_weap_rpg75, 175, 50);

			ITEM(rhs_weap_m80, 250, 50);

			ITEM(rhs_weap_m72a7, 300, 50);

			ITEM(rhs_weap_M136, 400, 50);
			ITEM(rhs_weap_M136_hedp, 500, 50);
			ITEM(rhs_weap_M136_hp, 500, 50);

			ITEM(rhs_weap_rpg7, 750, 15);

			ITEM(rhs_weap_maaws, 1300, 15);

			ITEM(rhs_weap_igla, 1300, 50);
			ITEM(rhs_weap_fim92, 1600, 50);

			ITEM(rhs_weap_smaw, 1500, 15);
			ITEM(rhs_weap_smaw_green, 1500, 15);

			ITEM(rhs_weap_fgm148, 6000, 10);
		};

		class launcherMagazinesRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
		
			class rhs_rpg7_PG7V_mag {
				price = 75;
				stock = 50;
			};
			class rhs_rpg7_PG7VM_mag {
				price = 100;
				stock = 50;
			};
			class rhs_rpg7_PG7VS_mag {
				price = 150;
				stock = 50;
			};
			class rhs_rpg7_PG7VL_mag {
				price = 250;
				stock = 50;
			};
			class rhs_rpg7_PG7VR_mag {
				price = 300;
				stock = 50;
			};
			class rhs_rpg7_TBG7V_mag {
				price = 300;
				stock = 50;
			};
			class rhs_rpg7_OG7V_mag {
				price = 150;
				stock = 50;
			};

			class rhs_mag_maaws_HEAT {
				price = 250;
				stock = 50;
			};
			class rhs_mag_maaws_HEDP {
				price = 350;
				stock = 50;
			};
			class rhs_mag_maaws_HE {
				price = 200;
				stock = 50;
			};

			class rhs_mag_smaw_SR {
				price = 100;
				stock = 500;
			};
			class rhs_mag_smaw_HEAA {
				price = 250;
				stock = 50;
			};
			class rhs_mag_smaw_HEDP {
				price = 350;
				stock = 50;
			};
			class rhs_mag_9k38_rocket {
				price = 800;
				stock = 50;
			};			
			class rhs_fim92_mag {
				price = 1000;
				stock = 50;
			};
			class rhs_fgm148_magazine_AT {
				price = 1000;
				stock = 50;
			};
		};

		class riflesRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(rhs_weap_aks74u, 200, RIFLE_STOCK);

			ITEM(rhs_weap_m70ab2, 700, RIFLE_STOCK);
			ITEM(rhs_weap_m70b1, 700, RIFLE_STOCK);
			ITEM(rhs_weap_m92, 200, RIFLE_STOCK);

			ITEM(rhs_weap_m70b1n, 800, RIFLE_STOCK);
			ITEM(rhs_weap_m70b3n, 800, RIFLE_STOCK);
			ITEM(rhs_weap_m70b3n_pbg40, 1050, RIFLE_STOCK);

			ITEM(rhs_weap_MP44, 500, RIFLE_STOCK);

			ITEM(rhs_weap_pm63, 750, RIFLE_STOCK);

			ITEM(rhs_weap_savz58p, 950, RIFLE_STOCK);
			ITEM(rhs_weap_savz58p_black, 950, RIFLE_STOCK);
			ITEM(rhs_weap_savz58v, 950, RIFLE_STOCK);
			ITEM(rhs_weap_savz58v_black, 950, RIFLE_STOCK);

			ITEM(rhs_weap_akm, 800, RIFLE_STOCK);
			ITEM(rhs_weap_akms, 800, RIFLE_STOCK);
			ITEM(rhs_weap_akm_gp25, 1050, RIFLE_STOCK);
			ITEM(rhs_weap_akms_gp25, 1050, RIFLE_STOCK);
			ITEM(rhs_weap_akmn, 900, RIFLE_STOCK);
			ITEM(rhs_weap_akmn_gp25, 1150, RIFLE_STOCK);
			ITEM(rhs_weap_akmn_npz, 950, RIFLE_STOCK);
			ITEM(rhs_weap_akmn_gp25_npz, 1200, RIFLE_STOCK);
			ITEM(rhs_weap_akm_zenitco01_b33, 1050, RIFLE_STOCK);
			
			ITEM(rhs_weap_vhsd2, 900, RIFLE_STOCK);
			ITEM(rhs_weap_vhsk2, 1000, RIFLE_STOCK);
			ITEM(rhs_weap_vhsd2_ct15x, 1100, RIFLE_STOCK);
			ITEM(rhs_weap_vhsd2_bg, 1150, RIFLE_STOCK);
			ITEM(rhs_weap_vhsd2_bg_ct15x, 1250, RIFLE_STOCK);

			ITEM(rhs_weap_ak103_1, 600, RIFLE_STOCK);
			ITEM(rhs_weap_ak103_1_npz, 650, RIFLE_STOCK);
			ITEM(rhs_weap_ak103_2, 700, RIFLE_STOCK);
			ITEM(rhs_weap_ak103_2_npz, 650, RIFLE_STOCK);
			ITEM(rhs_weap_ak103, 650, RIFLE_STOCK);
			ITEM(rhs_weap_ak103_npz, 725, RIFLE_STOCK);
			ITEM(rhs_weap_ak103_zenitco01_b33, 750, RIFLE_STOCK);
			ITEM(rhs_weap_ak103_gp25, 800, RIFLE_STOCK);
			ITEM(rhs_weap_ak103_gp25_npz, 850, RIFLE_STOCK);

			ITEM(rhs_weap_ak104, 700, RIFLE_STOCK);
			ITEM(rhs_weap_ak104_npz, 750, RIFLE_STOCK);
			ITEM(rhs_weap_ak104_zenitco01_b33, 775, RIFLE_STOCK);

			ITEM(rhs_weap_aks74, 500, RIFLE_STOCK);
			ITEM(rhs_weap_aks74_2, 525, RIFLE_STOCK);
			ITEM(rhs_weap_ak74, 500, RIFLE_STOCK);
			ITEM(rhs_weap_ak74_2, 525, RIFLE_STOCK);
			ITEM(rhs_weap_ak74_3, 550, RIFLE_STOCK);
			ITEM(rhs_weap_ak74_gp25, 650, RIFLE_STOCK);
			
			ITEM(rhs_weap_ak74m, 550, RIFLE_STOCK);
			ITEM(rhs_weap_ak74mr, 700, RIFLE_STOCK);
			ITEM(rhs_weap_ak74m_camo, 550, RIFLE_STOCK);
			ITEM(rhs_weap_ak74m_gp25, 800, RIFLE_STOCK);
			ITEM(rhs_weap_ak74mr_gp25, 850, RIFLE_STOCK);
			ITEM(rhs_weap_ak74m_fullplum_gp25_npz, 850, RIFLE_STOCK);
			ITEM(rhs_weap_ak74m_zenitco01_b33, 650, RIFLE_STOCK);
			ITEM(rhs_weap_ak74m_camo_npz, 650, RIFLE_STOCK);
			ITEM(rhs_weap_ak74m_npz, 650, RIFLE_STOCK);


			ITEM(rhs_weap_ak105, 700, RIFLE_STOCK);
			ITEM(rhs_weap_ak105_zenitco01, 750, RIFLE_STOCK);
			ITEM(rhs_weap_ak105_zenitco01_b33, 775, RIFLE_STOCK);

			ITEM(rhs_weap_m21a, 600, RIFLE_STOCK);
			ITEM(rhs_weap_m21a_pr, 750, RIFLE_STOCK);
			ITEM(rhs_weap_m21s, 550, RIFLE_STOCK);
			ITEM(rhs_weap_m21s_pr, 700, RIFLE_STOCK);
			ITEM(rhs_weap_m21a_pbg40, 800, RIFLE_STOCK);
			ITEM(rhs_weap_m21a_pr_pbg40, 850, RIFLE_STOCK);
	
			ITEM(rhs_weap_g36c, 800, RIFLE_STOCK);
			ITEM(rhs_weap_g36kv, 900, RIFLE_STOCK);
			ITEM(rhs_weap_g36kv_ag36, 1050, RIFLE_STOCK);

			ITEM(rhs_weap_mk18, 1100, RIFLE_STOCK);
			ITEM(rhs_weap_mk18_bk, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_mk18_KAC_bk, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_mk18_d, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_mk18_KAC_d, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_mk18_m320, 1550, RIFLE_STOCK);
			ITEM(rhs_weap_mk18_KAC, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_mk18_wd, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_mk18_KAC_wd, 1300, RIFLE_STOCK);

			ITEM(rhs_weap_hk416d10, 1500, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d10_LMT, 1500, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d10_LMT_d, 1500, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d10_LMT_wd, 1500, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d10_m320, 1500, RIFLE_STOCK);

			ITEM(rhs_weap_hk416d145, 1500, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d145_d, 1650, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d145_d_2, 1650, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d145_wd, 1650, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d145_wd_2, 1650, RIFLE_STOCK);
			ITEM(rhs_weap_hk416d145_m320, 1800, RIFLE_STOCK);
		};

		class sniperRiflesRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(rhs_weap_m38_rail, 400, RIFLE_STOCK);

			ITEM(rhs_weap_m1garand_sa43, 600, RIFLE_STOCK);

			ITEM(rhs_weap_vss, 1500, RIFLE_STOCK);
			ITEM(rhs_weap_vss_grip, 1550, RIFLE_STOCK);
			ITEM(rhs_weap_vss_grip_npz, 1600, RIFLE_STOCK);
			ITEM(rhs_weap_vss_npz, 1650, RIFLE_STOCK);

			ITEM(rhs_weap_m76, 1100, RIFLE_STOCK);

			ITEM(rhs_weap_l1a1, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_l1a1_wood, 1300, RIFLE_STOCK);

			ITEM(rhs_weap_t5000, 1550, RIFLE_STOCK);

			ITEM(rhs_weap_svdp_wd, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_svdp_wd_npz, 1500, RIFLE_STOCK);

			ITEM(rhs_weap_svds, 1250, RIFLE_STOCK);
			ITEM(rhs_weap_svds_npz, 1450, RIFLE_STOCK);
			
			ITEM(rhs_weap_m14, 1400, RIFLE_STOCK);
			ITEM(rhs_weap_m14_d, 1450, RIFLE_STOCK);
			ITEM(rhs_weap_m14_fiberglass, 1500, RIFLE_STOCK);

			ITEM(rhs_weap_m14_rail, 1500, RIFLE_STOCK);
			ITEM(rhs_weap_m14_rail_d, 2450, RIFLE_STOCK);
			ITEM(rhs_weap_m14_rail_fiberglass, 2450, RIFLE_STOCK);
			ITEM(rhs_weap_m14_rail_wd, 2450, RIFLE_STOCK);

			ITEM(rhs_weap_m14_ris_d, 2550, RIFLE_STOCK);
			ITEM(rhs_weap_m14_ris_fiberglass, 2550, RIFLE_STOCK);
			ITEM(rhs_weap_m14_ris_wd, 2550, RIFLE_STOCK);

			ITEM(rhs_weap_m14ebrri, 2200, RIFLE_STOCK);

			ITEM(rhs_weap_m24sws, 1000, RIFLE_STOCK);
			ITEM(rhs_weap_m24sws_d, 1000, RIFLE_STOCK);
			ITEM(rhs_weap_m24sws_wd, 1000, RIFLE_STOCK);

			ITEM(rhs_weap_m40a5, 1400, RIFLE_STOCK);
			ITEM(rhs_weap_m40a5_d, 1400, RIFLE_STOCK);
			ITEM(rhs_weap_m40a5_Wd, 1400, RIFLE_STOCK);

			ITEM(rhs_weap_XM2010, 2000, RIFLE_STOCK);
			ITEM(rhs_weap_XM2010_wd, 2000, RIFLE_STOCK);
			ITEM(rhs_weap_XM2010_d, 2000, RIFLE_STOCK);
			ITEM(rhs_weap_XM2010_sa, 2000, RIFLE_STOCK);

			ITEM(rhs_weap_M107, 3500, 5);
			ITEM(rhs_weap_M107_d, 3500, 5);
			ITEM(rhs_weap_M107_w, 3500, 5);
			ITEM(rhs_weap_m82a1, 3500, 5);

			ITEM(rhs_weap_mk17_CQC, 2500, RIFLE_STOCK);
			ITEM(rhs_weap_mk17_STD, 2600, RIFLE_STOCK);
			ITEM(rhs_weap_mk17_LB, 2700, RIFLE_STOCK);

			ITEM(rhs_weap_SCARH_CQC, 2500, RIFLE_STOCK);
			ITEM(rhs_weap_SCARH_FDE_CQC, 2500, RIFLE_STOCK);

			ITEM(rhs_weap_SCARH_STD, 2600, RIFLE_STOCK);
			ITEM(rhs_weap_SCARH_FDE_STD, 2600, RIFLE_STOCK);

			ITEM(rhs_weap_SCARH_LB, 2700, RIFLE_STOCK);
			ITEM(rhs_weap_SCARH_FDE_LB, 2700, RIFLE_STOCK);
		};

		class mgRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(rhs_weap_m27iar, 1800, RIFLE_STOCK);

			ITEM(rhs_weap_m249, 1100, RIFLE_STOCK);

			ITEM(rhs_weap_m249_pip, 1350, RIFLE_STOCK);

			ITEM(rhs_weap_m84, 1500, RIFLE_STOCK);

			ITEM(rhs_weap_mg42, 1700, RIFLE_STOCK);

			ITEM(rhs_weap_pkp, 1900, RIFLE_STOCK);
			
			ITEM(rhs_weap_m240G, 2000, RIFLE_STOCK);

			ITEM(rhs_weap_rpk74m, 800, RIFLE_STOCK);
			
			ITEM(rhs_weap_rpk74m_npz, 900, RIFLE_STOCK);
		};

		class smgRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(rhs_weap_pp2000, 600, RIFLE_STOCK);

			ITEM(rhs_weap_asval, 1200, RIFLE_STOCK);
			ITEM(rhs_weap_asval_grip, 1250, RIFLE_STOCK);
			ITEM(rhs_weap_asval_grip_npz, 1300, RIFLE_STOCK);
			ITEM(rhs_weap_asval_npz, 1250, RIFLE_STOCK);

			ITEM(rhsusf_weap_MP7A2, 800, RIFLE_STOCK);
			ITEM(rhsusf_weap_MP7A2_aor1, 800, RIFLE_STOCK);
			ITEM(rhsusf_weap_MP7A2_desert, 800, RIFLE_STOCK);
			ITEM(rhsusf_weap_MP7A2_winter, 800, RIFLE_STOCK);
		};

		class specialWeaponsRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(rhs_weap_m79, 350, RIFLE_STOCK);

			ITEM(rhs_weap_m32, 850, RIFLE_STOCK);

			ITEM(rhs_weap_M590_8RD, 200, RIFLE_STOCK);
		};

		class navigationRhs 
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_rhs", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(ItemGPS, 200, NN_STOCK);
			ITEM(ItemRadio, 50, NN_STOCK);

			ITEM(rhs_tr8_periscope_pip, 50, NN_STOCK);

			ITEM(rhsusf_bino_lrf_Vector21, 100, NN_STOCK);
			ITEM(rhsusf_bino_leopold_mk4, 100, NN_STOCK);
			ITEM(rhsusf_bino_m24, 100, NN_STOCK);
			ITEM(rhsusf_bino_m24_ARD, 200, NN_STOCK);
			ITEM(rhssaf_zrak_rd7j, 100, NN_STOCK);

			ITEM(rhsusf_bino_lerca_1200_tan, 350, NN_STOCK);
			ITEM(rhsusf_bino_lerca_1200_black, 350, NN_STOCK);

			ITEM(rhs_pdu4, 500, NN_STOCK);

			ITEM(Laserdesignator, 1500, NN_STOCK);
			ITEM(Laserdesignator_02, 1500, NN_STOCK);
			ITEM(Laserdesignator_03, 1500, NN_STOCK);
			ITEM(rhs_1PN138, 500, NN_STOCK);
			ITEM(rhsusf_ANPVS_14, 500, NN_STOCK);
			ITEM(rhsusf_ANPVS_15, 1000, NN_STOCK);
		};

		class underbarrelRhs 
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_rhs", localize "STR_A3AU_bipods", localize "STR_A3AU_and", localize "STR_A3AU_grips"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(rhs_acc_harris_swivel, 100, 50);
			ITEM(rhsusf_acc_harris_bipod, 100, 50);

			ITEM(rhsusf_acc_saw_bipod, 100, 50);

			ITEM(rhsusf_acc_grip2, 200, 50);
			ITEM(rhsusf_acc_grip2_tan, 200, 50);
			ITEM(rhsusf_acc_grip2_wd, 200, 50);
			ITEM(rhs_acc_grip_ffg2, 200, 50);
			ITEM(rhsusf_acc_grip1, 200, 50);
			ITEM(rhsusf_acc_kac_grip, 200, 50);
			ITEM(rhs_acc_grip_rk2, 200, 50);
			ITEM(rhs_acc_grip_rk6, 200, 50);
			ITEM(rhsusf_acc_rvg_blk, 200, 50);
			ITEM(rhsusf_acc_rvg_de, 200, 50);
			ITEM(rhsusf_acc_tacsac_blk, 200, 50);
			ITEM(rhsusf_acc_tacsac_blue, 200, 50);
			ITEM(rhsusf_acc_tacsac_tan, 200, 50);
			ITEM(rhsusf_acc_tdstubby_blk, 200, 50);
			ITEM(rhsusf_acc_tdstubby_tan, 200, 50);
			ITEM(rhsusf_acc_grip3, 200, 50);
			ITEM(rhsusf_acc_grip3_tan, 200, 50);
			
			ITEM(rhsusf_acc_m14_bipod, 200, 50);
		};

		class pointersRhs 
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_rhs", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(acc_flashlight, 75, PN_STOCK);
			ITEM(acc_flashlight_smg_01, 75, PN_STOCK);
			ITEM(rhsusf_acc_anpeq15A, 100, PN_STOCK);
			ITEM(acc_flashlight_pistol, 75, PN_STOCK);

			ITEM(rhs_acc_2dpZenit, 50, MZ_STOCK);
			ITEM(rhs_acc_perst1ik, 75, MZ_STOCK);

			ITEM(rhs_acc_2dpZenit_ris, 50, MZ_STOCK);
			ITEM(rhs_acc_perst1ik_ris, 75, MZ_STOCK);
			ITEM(rhs_acc_perst3, 100, MZ_STOCK);

			ITEM(rhsusf_acc_anpeq15side, 100, PN_STOCK);
			ITEM(rhsusf_acc_anpeq15_top, 100, PN_STOCK);
			ITEM(rhsusf_acc_anpeq15_wmx, 150, PN_STOCK);
			ITEM(rhsusf_acc_anpeq15_wmx_light, 150, PN_STOCK);
			ITEM(rhsusf_acc_anpeq15side_bk, 100, PN_STOCK);
			ITEM(rhsusf_acc_anpeq15_bk_top, 100, PN_STOCK);
			ITEM(rhsusf_acc_anpeq15, 150, PN_STOCK);
			ITEM(rhsusf_acc_anpeq15_bk, 150, PN_STOCK);
			ITEM(rhsusf_acc_anpeq16a, 100, PN_STOCK);
			ITEM(rhsusf_acc_anpeq16a_top, 100, PN_STOCK);

			ITEM(rhsusf_acc_M952V, 75, PN_STOCK);
			ITEM(rhsusf_acc_wmx, 75, PN_STOCK);
			ITEM(rhsusf_acc_wmx_bk, 75, PN_STOCK);
		};

		class muzzlesRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(rhs_acc_6p9_suppressor, 200, MZ_STOCK);

			ITEM(rhsusf_acc_rotex_mp7_aor1, 200, MZ_STOCK);
			ITEM(rhsusf_acc_rotex_mp7, 200, MZ_STOCK);
			ITEM(rhsusf_acc_rotex_mp7_desert, 200, MZ_STOCK);
			ITEM(rhsusf_acc_rotex_mp7_winter, 200, MZ_STOCK);

			ITEM(rhsusf_acc_omega9k, 200, MZ_STOCK);
			ITEM(rhsusf_acc_nt4_black, 200, MZ_STOCK);
			ITEM(rhsusf_acc_nt4_tan, 200, MZ_STOCK);
			ITEM(rhsusf_acc_rotex5_grey, 200, MZ_STOCK);
			ITEM(rhsusf_acc_rotex5_tan, 200, MZ_STOCK);

			ITEM(rhsusf_acc_aac_762sd_silencer, 300, MZ_STOCK);
			ITEM(rhsusf_acc_aac_762sdn6_silencer, 300, MZ_STOCK);
			ITEM(rhsgref_sdn6_suppressor, 300, MZ_STOCK);
			ITEM(rhsusf_acc_aac_scarh_silencer, 300, MZ_STOCK);
			ITEM(rhsusf_acc_aac_m14dcqd_silencer, 300, MZ_STOCK);
			ITEM(rhsusf_acc_aac_m14dcqd_silencer_d, 300, MZ_STOCK);
			ITEM(rhsusf_acc_aac_m14dcqd_silencer_wd, 300, MZ_STOCK);

			ITEM(rhsgref_acc_falMuzzle_l1a1, 150, MZ_STOCK);

			ITEM(rhsusf_acc_m14_flashsuppresor, 200, MZ_STOCK);

			ITEM(rhsusf_acc_SF3P556, 50, MZ_STOCK);
			ITEM(rhsusf_acc_SFMB556, 65, MZ_STOCK);

			ITEM(rhs_acc_tgpv, 200, MZ_STOCK);
			ITEM(rhs_acc_tgpv2, 200, MZ_STOCK);

			ITEM(rhs_acc_dtkakm, 25, MZ_STOCK);
			ITEM(rhs_acc_ak5, 50, MZ_STOCK);
			ITEM(rhs_acc_dtk, 15, MZ_STOCK);
			ITEM(rhs_acc_dtk1, 25, MZ_STOCK);
			ITEM(rhs_acc_dtk2, 35, MZ_STOCK);
			ITEM(rhs_acc_dtk3, 50, MZ_STOCK);
			ITEM(rhs_acc_dtk4long, 200, MZ_STOCK);
			ITEM(rhs_acc_dtk4screws, 200, MZ_STOCK);
			ITEM(rhs_acc_pbs1, 200, MZ_STOCK);

			ITEM(rhsusf_acc_M2010S, 350, MZ_STOCK);
			ITEM(rhsusf_acc_M2010S_d, 350, MZ_STOCK);
			ITEM(rhsusf_acc_M2010S_wd, 350, MZ_STOCK);
			ITEM(rhsusf_acc_M2010S_sa, 350, MZ_STOCK);

			ITEM(rhsusf_acc_m24_silencer_d, 300, MZ_STOCK);
			ITEM(rhsusf_acc_m24_silencer_wd, 300, MZ_STOCK);
			ITEM(rhsusf_acc_m24_silencer_black, 300, MZ_STOCK);

			ITEM(rhsusf_acc_m24_muzzlehider_black, 200, MZ_STOCK);
			ITEM(rhsusf_acc_m24_muzzlehider_d, 200, MZ_STOCK);
			ITEM(rhsusf_acc_m24_muzzlehider_wd, 200, MZ_STOCK);
		};

		class opticsRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class rhsgref_acc_l1a1_l2a2 {
				price = 450;
				stock = 100;
			};

			class rhsgref_acc_l1a1_anpvs2 {
				price = 1100;
				stock = 100;
			};

			class rhs_acc_1pn93_1 {
				price = 1000;
				stock = 100;
			};
			class rhs_acc_1pn93_2 {
				price = 1000;
				stock = 100;
			};
			class rhs_acc_pgo7v {
				price = 500;
				stock = 100;
			};
			class rhs_acc_pgo7v2 {
				price = 525;
				stock = 100;
			};
			class rhs_acc_pgo7v3 {
				price = 550;
				stock = 100;
			};

			class rhs_optic_maaws {
				price = 500;
				stock = 100;
			};

			class rhs_acc_1p29 {
				price = 400;
				stock = 100;
			};
			class rhs_acc_1p63 {
				price = 250;
				stock = 100;
			};
			class rhs_acc_1p78 {
				price = 500;
				stock = 100;
			};
			class rhs_acc_1pn34 {
				price = 850;
				stock = 100;
			};
			class rhs_acc_ekp1 {
				price = 200;
				stock = 100;
			};
			class rhs_acc_ekp8_02 {
				price = 200;
				stock = 100;
			};
			class rhs_acc_nita {
				price = 350;
				stock = 100;
			};
			class rhs_acc_okp7_dovetail {
				price = 250;
				stock = 100;
			};
			class rhs_acc_pkas {
				price = 300;
				stock = 100;
			};
			class rhs_acc_pso1m2 {
				price = 750;
				stock = 100;
			};
			class rhs_acc_pso1m21 {
				price = 750;
				stock = 100;
			};

			class rhs_acc_rakursPM {
				price = 200;
				stock = 100;
			};
			class rhs_acc_1p87 {
				price = 200;
				stock = 100;
			};
			class rhs_acc_ekp8_18 {
				price = 200;
				stock = 100;
			};
			class rhs_acc_okp7_picatinny {
				price = 200;
				stock = 100;
			};
			class rhs_acc_dh520x56 {
				price = 1500;
				stock = 100;
			};

			class rhsusf_acc_EOTECH {
				price = 250;
				stock = 100;
			};
			class rhsusf_acc_eotech_552 {
				price = 250;
				stock = 100;
			};
			class rhsusf_acc_eotech_552_d {
				price = 250;
				stock = 100;
			};
			class rhsusf_acc_eotech_552_wd {
				price = 250;
				stock = 100;
			};
			class rhsusf_acc_compm4 {
				price = 300;
				stock = 100;
			};

			class rhsusf_acc_M8541 {
				price = 1000;
				stock = 100;
			};
			class rhsusf_acc_M8541_low {
				price = 1000;
				stock = 100;
			};
			class rhsusf_acc_M8541_low_d {
				price = 1000;
				stock = 100;
			};
			class rhsusf_acc_M8541_low_wd {
				price = 1000;
				stock = 100;
			};
			class rhsusf_acc_premier_low {
				price = 1000;
				stock = 100;
			};
			class rhsusf_acc_premier_anpvs27 {
				price = 1600;
				stock = 100;
			};
			class rhsusf_acc_premier {
				price = 1000;
				stock = 100;
			};

			class rhsusf_acc_LEUPOLDMK4 {
				price = 900;
				stock = 100;
			};
			class rhsusf_acc_LEUPOLDMK4_2 {
				price = 1250;
				stock = 100;
			};
			class rhsusf_acc_LEUPOLDMK4_d {
				price = 1500;
				stock = 100;
			};
			class rhsusf_acc_LEUPOLDMK4_wd {
				price = 1500;
				stock = 100;
			};
			class rhsusf_acc_LEUPOLDMK4_2_d {
				price = 1500;
				stock = 100;
			};
			class rhsusf_acc_LEUPOLDMK4_2_mrds {
				price = 1750;
				stock = 100;
			};


			class rhsusf_acc_mrds {
				price = 200;
				stock = 100;
			};
			class rhsusf_acc_mrds_fwd {
				price = 200;
				stock = 100;
			};
			class rhsusf_acc_mrds_c {
				price = 200;
				stock = 100;
			};
			class rhsusf_acc_mrds_fwd_c {
				price = 200;
				stock = 100;
			};
			class rhsusf_acc_RM05 {
				price = 200;
				stock = 100;
			};
			class rhsusf_acc_RM05_fwd {
				price = 200;
				stock = 100;
			};


			class rhsusf_acc_RX01_NoFilter {
				price = 250;
				stock = 100;
			};
			class rhsusf_acc_RX01 {
				price = 300;
				stock = 100;
			};
			class rhsusf_acc_RX01_NoFilter_tan {
				price = 250;
				stock = 100;
			};
			class rhsusf_acc_RX01_tan {
				price = 300;
				stock = 100;
			};
			class rhsgref_acc_RX01_NoFilter_camo {
				price = 250;
				stock = 100;
			};
			class rhsgref_acc_RX01_camo {
				price = 300;
				stock = 100;
			};

			class rhsusf_acc_T1_high {
				price = 250;
				stock = 100;
			};
			class rhsusf_acc_T1_low {
				price = 300;
				stock = 100;
			};
			class rhsusf_acc_T1_low_fwd {
				price = 250;
				stock = 100;
			};


			class rhsusf_acc_su230 {
				price = 800;
				stock = 100;
			};
			class rhsusf_acc_su230_c {
				price = 800;
				stock = 100;
			};
			class rhsusf_acc_su230_mrds {
				price = 1050;
				stock = 100;
			};
			class rhsusf_acc_su230_mrds_c {
				price = 1050;
				stock = 100;
			};


			class rhsusf_acc_su230a {
				price = 850;
				stock = 100;
			};
			class rhsusf_acc_su230a_c {
				price = 850;
				stock = 100;
			};
			class rhsusf_acc_su230a_mrds {
				price = 1100;
				stock = 100;
			};
			class rhsusf_acc_su230a_mrds_c {
				price = 1100;
				stock = 100;
			};

			class rhsusf_acc_ACOG_MDO {
				price = 1500;
				stock = 100;
			};


			class rhsusf_acc_premier_mrds {
				price = 1250;
				stock = 100;
			};
			class rhsusf_acc_M8541_mrds {
				price = 1250;
				stock = 100;
			};

			class rhsusf_acc_g33_T1 {
				price = 550;
				stock = 100;
			};
			class rhsusf_acc_g33_xps3 {
				price = 500;
				stock = 100;
			};
			class rhsusf_acc_g33_xps3_tan {
				price = 500;
				stock = 100;
			};

			class rhsusf_acc_anpas13gv1 {
				price = 2500;
				stock = 5;
			};

			class rhsusf_acc_anpvs27 {
				price = 600;
				stock = 100;
			};

			class rhsusf_acc_ACOG {
				price = 850;
				stock = 100;
			};
			class rhsusf_acc_ACOG2_USMC {
				price = 900;
				stock = 100;
			};
			class rhsusf_acc_ACOG3_USMC {
				price = 950;
				stock = 100;
			};
			class rhsusf_acc_ACOG_USMC {
				price = 850;
				stock = 100;
			};

			class rhsusf_acc_ACOG_RMR {
				price = 1100;
				stock = 100;
			};
			class rhsusf_acc_ACOG_d {
				price = 850;
				stock = 100;
			};
			class rhsusf_acc_ACOG_wd {
				price = 850;
				stock = 100;
			};

			class rhsusf_acc_ELCAN {
				price = 700;
				stock = 100;
			};
			class rhsusf_acc_ELCAN_ard {
				price = 750;
				stock = 100;
			};
			
			class rhsusf_acc_ACOG_anpvs27 {
				price = 1450;
				stock = 100;
			};
		};

		class magazinesRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			class Laserbatteries {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// Underbarrel
			///////////////////////////////////////////////////////
			ITEM(rhs_mag_M441_HE, 50, MZ_STOCK);
			ITEM(rhs_mag_M433_HEDP, 100, MZ_STOCK);
			ITEM(rhs_mag_M397_HET, 150, MZ_STOCK);
			ITEM(rhs_mag_m4009, 75, MZ_STOCK);
			ITEM(rhs_mag_m576, 35, MZ_STOCK);
			ITEM(rhs_mag_M585_white, 20, MZ_STOCK);
			ITEM(rhs_mag_m661_green, 20, MZ_STOCK);
			ITEM(rhs_mag_m662_red, 20, MZ_STOCK);
			ITEM(rhs_mag_m713_Red, 30, MZ_STOCK);
			ITEM(rhs_mag_m714_White, 30, MZ_STOCK);
			ITEM(rhs_mag_m716_yellow, 30, MZ_STOCK);

			ITEM(rhs_VOG25, 35, MZ_STOCK);
			ITEM(rhs_VG40TB, 125, MZ_STOCK);
			ITEM(rhs_VOG25P, 65, MZ_STOCK);
			ITEM(rhs_VG40SZ, 125, MZ_STOCK);
			ITEM(rhs_GDM40, 50, MZ_STOCK);
			ITEM(rhs_VG40OP_white, 15, MZ_STOCK);
			ITEM(rhs_VG40OP_green, 15, MZ_STOCK);
			ITEM(rhs_VG40OP_red, 15, MZ_STOCK);
			ITEM(rhs_GRD40_White, 35, MZ_STOCK);
			ITEM(rhs_GRD40_Green, 35, MZ_STOCK);
			ITEM(rhs_GRD40_Red, 35, MZ_STOCK);
			ITEM(rhs_VG40MD, 100, MZ_STOCK);


			class rhsusf_mag_6Rnd_M576_Buckshot {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_M441_HE {
				price = 175;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_M397_HET {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_M433_HEDP {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_mag_6Rnd_m4009 {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_mag_6Rnd_M585_white {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_m661_green {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_m662_red {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_M713_red {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_M714_white {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_M715_green {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_6Rnd_M716_yellow {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// Pistols, SMGs
			///////////////////////////////////////////////////////
			ITEM(rhs_mag_9x18_8_57N181S, 10, MAGAZINE_STOCK);

			ITEM(rhsgref_20rnd_765x17_vz61, 50, MAGAZINE_STOCK);
			ITEM(rhsgref_10rnd_765x17_vz61, 25, MAGAZINE_STOCK);

			ITEM(rhs_18rnd_9x21mm_7N28, 25, MAGAZINE_STOCK);
			ITEM(rhs_18rnd_9x21mm_7N29, 50, MAGAZINE_STOCK);
			ITEM(rhs_18rnd_9x21mm_7BT3, 35, MAGAZINE_STOCK);

			ITEM(rhsusf_mag_40Rnd_46x30_FMJ, 50, MAGAZINE_STOCK);
			ITEM(rhsusf_mag_40Rnd_46x30_JHP, 75, MAGAZINE_STOCK);
			ITEM(rhsusf_mag_40Rnd_46x30_AP, 100, MAGAZINE_STOCK);

			ITEM(rhsusf_mag_7x45acp_MHP, 50, MAGAZINE_STOCK);

			ITEM(rhs_mag_9x19_17, 35, MAGAZINE_STOCK);
			ITEM(rhs_mag_9x19_7n31_17, 50, MAGAZINE_STOCK);

			ITEM(rhs_mag_9x19mm_7n21_20, 50, MAGAZINE_STOCK);
			ITEM(rhs_mag_9x19mm_7n31_20, 65, MAGAZINE_STOCK);
			ITEM(rhs_mag_9x19mm_7n21_44, 125, MAGAZINE_STOCK);
			ITEM(rhs_mag_9x19mm_7n31_44, 135, MAGAZINE_STOCK);

			ITEM(rhsusf_mag_17Rnd_9x19_JHP, 50, MAGAZINE_STOCK);
			ITEM(rhsusf_mag_17Rnd_9x19_FMJ, 65, MAGAZINE_STOCK);

			ITEM(rhsusf_mag_15Rnd_9x19_JHP, 45, MAGAZINE_STOCK);
			ITEM(rhsusf_mag_15Rnd_9x19_FMJ, 60, MAGAZINE_STOCK);

			ITEM(rhssaf_mag_15Rnd_9x19_JHP, 45, MAGAZINE_STOCK);
			ITEM(rhssaf_mag_15Rnd_9x19_FMJ, 60, MAGAZINE_STOCK);

			ITEM(rhs_20rnd_9x39mm_SP5, 100, MAGAZINE_STOCK);
			ITEM(rhs_20rnd_9x39mm_SP6, 125, MAGAZINE_STOCK);
			ITEM(rhs_10rnd_9x39mm_SP5, 65, MAGAZINE_STOCK);
			ITEM(rhs_10rnd_9x39mm_SP6, 75, MAGAZINE_STOCK);


			///////////////////////////////////////////////////////
			// SPECIAL
			///////////////////////////////////////////////////////
			ITEM(rhsusf_8Rnd_Slug, 100, MAGAZINE_STOCK);
			ITEM(rhsusf_8Rnd_00Buck, 125, MAGAZINE_STOCK);
			ITEM(rhsusf_8Rnd_HE, 500, MAGAZINE_STOCK);
			ITEM(rhsusf_8Rnd_FRAG, 550, MAGAZINE_STOCK);


			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////
			class rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_8Rnd_762x63_M2B_M1rifle {
				price = 65;
				stock = MAGAZINE_STOCK;
			};

			class rhssaf_30Rnd_762x39mm_M67 {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_30Rnd_762x39mm_M78_tracer {
				price = 135;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_30Rnd_762x39_M82_api {
				price = 155;
				stock = MAGAZINE_STOCK;
			};

			class rhs_30Rnd_762x39mm {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_tracer {
				price = 135;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_89 {
				price = 145;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_U {
				price = 165;
				stock = MAGAZINE_STOCK;
			};

			class rhs_30Rnd_762x39mm_Savz58 {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_Savz58_tracer {
				price = 135;
				stock = MAGAZINE_STOCK;
			};

			class rhsgref_25Rnd_792x33_SmE_StG {
				price = 50;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_20Rnd_SCAR_762x51_m80_ball {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_m80a1_epr {
				price = 175;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_m118_special {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_mk316_special {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_m62_tracer {
				price = 165;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_m61_ap {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_20Rnd_SCAR_762x51_m80_ball_bk {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_m80a1_epr_bk {
				price = 175;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_m118_special_bk {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_mk316_special_bk {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_m62_tracer_bk {
				price = 165;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_SCAR_762x51_m61_ap_bk {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			
			

			class rhs_mag_20Rnd_556x45_M193_Stanag {
				price = 25;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_556x45_M193_2MAG_Stanag {
				price = 25;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_556x45_M196_2MAG_Stanag_Tracer_Red {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_556x45_M196_Stanag_Tracer_Red {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_556x45_M855_Stanag {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_556x45_M855A1_Stanag {
				price = 45;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_556x45_Mk262_Stanag {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M193_Stanag {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M196_Stanag_Tracer_Red {
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_30Rnd_556x45_M855_Stanag {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M855_Stanag_Ranger {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M855_PMAG {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M855_PMAG_Tracer_Red {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red {
				price = 75;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_30Rnd_556x45_M855A1_Stanag {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red {
				price = 80;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M855A1_PMAG {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_Red {
				price = 80;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_30Rnd_556x45_Mk262_Stanag {
				price = 100;
				stock = MAGAZINE_STOCK;
			};		
			class rhs_mag_30Rnd_556x45_Mk262_Stanag_Pull {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_Mk262_Stanag_Ranger {
				price = 100;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_30Rnd_556x45_Mk318_Stanag {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_Mk318_Stanag_Pull {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_Mk318_Stanag_Ranger {
				price = 125;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_30Rnd_556x45_Mk318_SCAR {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_Mk318_SCAR_Pull {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_30Rnd_556x45_Mk318_SCAR_Ranger {
				price = 125;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_100Rnd_556x45_M855A1_cmag {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_100Rnd_556x45_M855A1_cmag_mixed {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_100Rnd_556x45_M855_cmag {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_100Rnd_556x45_M855_cmag_mixed {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_100Rnd_556x45_Mk318_cmag {
				price = 400;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_100Rnd_556x45_Mk262_cmag {
				price = 350;
				stock = MAGAZINE_STOCK;
			};


			class rhs_30Rnd_762x39mm_polymer {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_polymer_tracer {
				price = 140;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_polymer_89 {
				price = 145;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_polymer_U {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_bakelite {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_bakelite_tracer {
				price = 140;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_bakelite_89 {
				price = 145;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_762x39mm_bakelite_U {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhs_75Rnd_762x39mm {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class rhs_75Rnd_762x39mm_tracer {
				price = 325;
				stock = MAGAZINE_STOCK;
			};
			class rhs_75Rnd_762x39mm_89 {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N6M_AK {
				price = 40;
				stock = MAGAZINE_STOCK;	
			};
			class rhs_30Rnd_545x39_7N6M_plum_AK {
				price = 40;
				stock = MAGAZINE_STOCK;	
			};
			class rhs_45Rnd_545X39_7N6M_AK {
				price = 70;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N10_AK {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N10_plum_AK {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N10_desert_AK {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N10_camo_AK {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N6_AK {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N6_green_AK {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_AK_green {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_AK_plum_green {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7U1_AK {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class rhs_45Rnd_545X39_7N10_AK {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhs_45Rnd_545X39_AK_Green {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhs_45Rnd_545X39_7N22_AK {
				price = 165;
				stock = MAGAZINE_STOCK;
			};
			class rhs_45Rnd_545X39_7U1_AK {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N22_AK {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N22_plum_AK {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N22_camo_AK {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N10_2mag_AK {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N10_2mag_plum_AK {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N10_2mag_desert_AK {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhs_30Rnd_545x39_7N22_desert_AK {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class rhsgref_30rnd_556x45_m21 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_30rnd_556x45_m21_t {
				price = 65;
				stock = MAGAZINE_STOCK;
			};

			class rhsgref_30rnd_556x45_vhs2 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_30rnd_556x45_vhs2_t {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_30rnd_556x45_EPR_G36 {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_30rnd_556x45_SOST_G36 {
				price = 85;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_30rnd_556x45_SPR_G36 {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_30rnd_556x45_Tracers_G36 {
				price = 110;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_30rnd_556x45_MDIM_G36 {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_30rnd_556x45_TDIM_G36 {
				price = 125;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_100rnd_556x45_EPR_G36 {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			

			///////////////////////////////////////////////////////
			// DMRs, Sniper Rifles
			///////////////////////////////////////////////////////
			class rhsgref_5Rnd_762x54_m38 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};

			class rhsgref_10Rnd_792x57_m76 {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhssaf_10Rnd_792x57_m76_tracer {
				price = 115;
				stock = MAGAZINE_STOCK;
			};

			class rhs_10Rnd_762x54mmR_7N1 {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class rhs_10Rnd_762x54mmR_7N14 {
				price = 115;
				stock = MAGAZINE_STOCK;
			};

			class rhs_5Rnd_338lapua_t5000 {
				price = 100;
				stock = MAGAZINE_STOCK;
			};
			class 5Rnd_127x108_APDS_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_5Rnd_300winmag_xm2010 {
				price = 175;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_5Rnd_762x51_m62_Mag {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_5Rnd_762x51_m993_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_5Rnd_762x51_m118_special_Mag {
				price = 85;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_5Rnd_762x51_AICS_m62_Mag {
				price = 65;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_5Rnd_762x51_AICS_m993_Mag {
				price = 75;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_5Rnd_762x51_AICS_m118_special_Mag {
				price = 85;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_10Rnd_762x51_m62_Mag {
				price = 130;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_10Rnd_762x51_m993_Mag {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_10Rnd_762x51_m118_special_Mag {
				price = 170;
				stock = MAGAZINE_STOCK;
			};

			class rhs_mag_20Rnd_762x51_m80_fnfal {
				price = 175;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_762x51_m62_fnfal {
				price = 185;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_762x51_m80a1_fnfal {
				price = 190;
				stock = MAGAZINE_STOCK;
			};
			class rhs_mag_20Rnd_762x51_m61_fnfal {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_20Rnd_762x51_m80_Mag {
				price = 175;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_20Rnd_762x51_m62_Mag {
				price = 185;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_20Rnd_762x51_m118_special_Mag {
				price = 225;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_20Rnd_762x51_m993_Mag {
				price = 250;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_mag_10Rnd_STD_50BMG_M33 {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_mag_10Rnd_STD_50BMG_mk211 {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			
			///////////////////////////////////////////////////////
			// MGs
			///////////////////////////////////////////////////////
			class rhsusf_200Rnd_556x45_box {
				price = 250;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_200rnd_556x45_mixed_box {
				price = 255;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_200rnd_556x45_M855_box {
				price = 275;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_200rnd_556x45_M855_mixed_box {
				price = 280;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_100Rnd_556x45_soft_pouch {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_100Rnd_556x45_mixed_soft_pouch {
				price = 155;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_100Rnd_556x45_M855_soft_pouch {
				price = 180;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_100Rnd_556x45_M855_mixed_soft_pouch {
				price = 185;
				stock = MAGAZINE_STOCK;
			};

			class rhsgref_50Rnd_792x57_SmE_drum {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_50Rnd_792x57_SmE_notracers_drum {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_50Rnd_792x57_SmK_drum {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_50Rnd_792x57_SmK_alltracers_drum {
				price = 200;
				stock = MAGAZINE_STOCK;
			};

			class rhsgref_296Rnd_792x57_SmE_belt {
				price = 600;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_296Rnd_792x57_SmE_notracers_belt {
				price = 600;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_296Rnd_792x57_SmK_belt {
				price = 600;
				stock = MAGAZINE_STOCK;
			};
			class rhsgref_296Rnd_792x57_SmK_alltracers_belt {
				price = 600;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_100Rnd_762x51 {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_100Rnd_762x51_m80a1epr {
				price = 400;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_100Rnd_762x51_m62_tracer {
				price = 375;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_100Rnd_762x51_m61_ap {
				price = 550;
				stock = MAGAZINE_STOCK;
			};

			class rhsusf_50Rnd_762x51 {
				price = 175;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_50Rnd_762x51_m80a1epr {
				price = 200;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_50Rnd_762x51_m62_tracer {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class rhsusf_50Rnd_762x51_m61_ap {
				price = 300;
				stock = MAGAZINE_STOCK;
			};

			class rhs_100Rnd_762x54mmR {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class rhs_100Rnd_762x54mmR_green {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class rhs_100Rnd_762x54mmR_7N13 {
				price = 400;
				stock = MAGAZINE_STOCK;
			};
			class rhs_100Rnd_762x54mmR_7N26 {
				price = 550;
				stock = MAGAZINE_STOCK;
			};
			class rhs_100Rnd_762x54mmR_7BZ3 {
				price = 600;
				stock = MAGAZINE_STOCK;
			};

			///////////////////////////////////////////////////////
			// SMGs
			///////////////////////////////////////////////////////
			class 50Rnd_570x28_SMG_03 {
				price = 65;
				stock = MAGAZINE_STOCK;
			};

			class 30Rnd_9x21_Mag_SMG_02 {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Mag_SMG_02_Tracer_Red {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Mag_SMG_02_Tracer_Yellow {
				price = 35;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_9x21_Mag_SMG_02_Tracer_Green {
				price = 35;
				stock = MAGAZINE_STOCK;
			};

			class 30Rnd_45ACP_Mag_SMG_01 {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
		};

		class miscRhs 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_rhs", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			ITEM(B_Bergen_mcamo_F, 900, MISC_STOCK);
			ITEM(B_Bergen_tna_F, 900, MISC_STOCK);
			ITEM(rhsgref_hidf_alicepack, 750, MISC_STOCK);
			ITEM(rhsgref_ttsko_alicepack, 750, MISC_STOCK);
			ITEM(rhsgref_wdl_alicepack, 750, MISC_STOCK);
			ITEM(rhssaf_alice_md2camo, 750, MISC_STOCK);
			ITEM(rhssaf_alice_smb, 750, MISC_STOCK);
			ITEM(U_I_FullGhillie_lsh, 1000, MISC_STOCK);
			ITEM(U_I_FullGhillie_ard, 1000, MISC_STOCK);
			ITEM(U_I_FullGhillie_sard, 1000, MISC_STOCK);
		
			ITEM(IEDUrbanSmall_Remote_Mag, 500, MISC_STOCK);
			ITEM(IEDLandSmall_Remote_Mag, 500, MISC_STOCK);
			ITEM(IEDLandBig_Remote_Mag, 750, MISC_STOCK);
			ITEM(IEDUrbanBig_Remote_Mag, 750, MISC_STOCK);

			ITEM(rhsusf_m112_mag, 350, MISC_STOCK);
			ITEM(rhsusf_m112x4_mag, 1400, MISC_STOCK);
			ITEM(rhsusf_mine_m14_mag, 400, MISC_STOCK);
			ITEM(rhs_mine_M19_mag, 300, MISC_STOCK);
			ITEM(rhs_mine_M7A2_mag, 200, MISC_STOCK);
			ITEM(rhssaf_mine_pma3_mag, 300, MISC_STOCK);
			ITEM(rhs_mag_mine_pfm1, 250, MISC_STOCK);
			ITEM(rhs_mine_tm62m_mag, 350, MISC_STOCK);		

			ITEM(G_RegulatorMask_F, 200, MISC_STOCK);
			ITEM(G_AirPurifyingRespirator_01_F, 200, MISC_STOCK);
			ITEM(G_AirPurifyingRespirator_02_sand_F, 200, MISC_STOCK);
			ITEM(G_AirPurifyingRespirator_02_olive_F, 200, MISC_STOCK);
			ITEM(G_AirPurifyingRespirator_02_black_F, 200, MISC_STOCK);

			ITEM(I_UavTerminal, 800, MISC_STOCK);
			ITEM(O_UavTerminal, 800, MISC_STOCK);
			ITEM(B_UavTerminal, 800, MISC_STOCK);
		};
