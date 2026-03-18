		///////////////////////////////////////////////////////
		// Atlas
		///////////////////////////////////////////////////////
		class launchersAtlas
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			////////atlas
			ITEM(launch_MRAWS_coyote_F, 1400, LAUNCHER_STOCK);
			ITEM(launch_MRAWS_coyote_rail_F, 1300, LAUNCHER_STOCK);
			ITEM(Atlas_Launch_Pzf3_F, 1400, LAUNCHER_STOCK);
			ITEM(launch_B_Titan_coyote_F, 3500, 3);
			////////
		};
		class launcherMagazinesAtlas
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			////////atlas
			class Atlas_DM12_HEAT_F {
				price = 250;
				stock = 50;
			};
			class Atlas_DM22_HEAT_F {
				price = 350;
				stock = 50;
			};
			class Atlas_DM32_HEAT_MP_F {
				price = 200;
				stock = 50;
			};

		};

		class opticsAtlas 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_sights"]);
			picture = "A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			///atlas
			class optic_LRCO_blk_F {
				price = 500;
				stock = 100;
			};
			class optic_LRCO_snd_F {
				price = 500;
				stock = 100;
			};
			///
		};

		class magazinesAtlas 
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_Atlas", localize "STR_A3AU_magazines", localize "STR_A3AU_and", localize "STR_A3AU_glGrenades"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			////atlas 
			class 75Rnd_762x39_Mag_Green_F {
				price = 140;
				stock = MAGAZINE_STOCK;
			};
			class 75Rnd_762x39_Mag_Tracer_Green_F {
				price = 150;
				stock = MAGAZINE_STOCK;
			};
			class 150Rnd_93x64_Mag_Red {
				price = 500;
				stock = MAGAZINE_STOCK;
			};

			class 30Rnd_556x45_AUG_Mag_Green_F {
				price = 70;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_AUG_Mag_F {
				price = 70;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_AUG_Mag_Tracer_Green_F {
				price = 80;
				stock = MAGAZINE_STOCK;
			};
			class 30Rnd_556x45_AUG_Mag_Tracer_F {
				price = 80;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_25Rnd_556x45_Famas {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_25Rnd_556x45_Famas_green {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_25Rnd_556x45_Famas_red {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_25Rnd_556x45_Famas_Yellow {
				price = 50;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_25Rnd_556x45_Famas_Tracer_Green {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_25Rnd_556x45_Famas_Tracer_Red {
				price = 60;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_25Rnd_556x45_Famas_Tracer_Yellow{
				price = 60;
				stock = MAGAZINE_STOCK;
			};

			class Atlas_150Rnd_762x51_Box_Red {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_150Rnd_762x51_Box_Yellow {
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_150Rnd_762x51_Box_Tracer_Red {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
			class Atlas_150Rnd_762x51_Box_Tracer_Yellow {
				price = 350;
				stock = MAGAZINE_STOCK;
			};
		};

		class sniperRiflesAtlas 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			///atlas
			ITEM(srifle_EBR_cbr_F, 1275, RIFLE_STOCK);
			///
		};
		class mgAtlas 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			////atlas
			ITEM(arifle_NCAR15_MG_F, 1025, RIFLE_STOCK);
			ITEM(Atlas_LMG_Negev_black_F, 1100, RIFLE_STOCK);
	
		};

		class riflesAtlas 
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			////////atlas
			ITEM(arifle_AUG_F, 775, RIFLE_STOCK);
			ITEM(arifle_AUG_black_F, 775, RIFLE_STOCK);

			ITEM(arifle_AUG_GL_F, 875, RIFLE_STOCK);
			ITEM(arifle_AUG_GL_black_F, 875, RIFLE_STOCK);

			ITEM(arifle_AUG_C_F, 725, RIFLE_STOCK);
			ITEM(arifle_AUG_C_black_F, 725, RIFLE_STOCK);

			ITEM(atlas_arifle_famasF1_F, 700, RIFLE_STOCK);
			ITEM(atlas_arifle_famasF1_Grip_F, 775, RIFLE_STOCK);
			ITEM(Atlas_arifle_famasF1_GL_F, 875, RIFLE_STOCK);
			ITEM(atlas_arifle_famasF1_RIS_F, 750, RIFLE_STOCK);

			ITEM(Atlas_Arifle_famasG2_F, 800, RIFLE_STOCK);
			ITEM(Atlas_Arifle_famasG2_Grip_F, 825, RIFLE_STOCK);
			ITEM(Atlas_Arifle_famasG2_GL_F, 950, RIFLE_STOCK);

			ITEM(atlas_arifle_famasG4_Grip_F, 850, RIFLE_STOCK);
			ITEM(Atlas_Arifle_famasG4_GL_F, 1025, RIFLE_STOCK);

			ITEM(arifle_FORT651_F, 800, RIFLE_STOCK);
			ITEM(arifle_FORT652_F, 850, RIFLE_STOCK);
			ITEM(arifle_FORT652_GL_F, 1025, RIFLE_STOCK);

			ITEM(arifle_G36C_F, 800, RIFLE_STOCK);
			ITEM(arifle_G36C_Sand_F, 800, RIFLE_STOCK);
			ITEM(arifle_G36_F, 850, RIFLE_STOCK);
			ITEM(arifle_G36_Sand_F, 850, RIFLE_STOCK);
			ITEM(arifle_G36_GL_F, 1025, RIFLE_STOCK);
			ITEM(arifle_G36_GL_Sand_F, 1025, RIFLE_STOCK);

			ITEM(arifle_NCAR15_F, 850, RIFLE_STOCK);
			ITEM(arifle_NCAR15_GL_F, 1025, RIFLE_STOCK);
			ITEM(arifle_NCAR15B_F, 800, RIFLE_STOCK);	
		};

		class miscAtlas
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(G_B_O_Diving, 50, MISC_STOCK);
			ITEM(G_I_I_Diving, 50, MISC_STOCK);

		};

		class backpacksAtlas
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_backpacks"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(B_AssaultPack_flecktarn, 600, MISC_STOCK);
			ITEM(B_AssaultPack_multitarn, 600, MISC_STOCK);
			ITEM(B_AssaultPack_aucamo_F, 600, MISC_STOCK);
			ITEM(B_AssaultPack_kzg_F, 600, MISC_STOCK);
			ITEM(B_AssaultPack_marar, 600, MISC_STOCK);

			ITEM(B_Carryall_flecktarn, 700, MISC_STOCK);
			ITEM(B_Carryall_jungle, 700, MISC_STOCK);
			ITEM(B_Carryall_multitarn, 700, MISC_STOCK);
			ITEM(B_Carryall_semiarid, 700, MISC_STOCK);
			ITEM(B_Carryall_owcamo, 700, MISC_STOCK);
			ITEM(B_Carryall_aucamo, 700, MISC_STOCK);
			ITEM(B_Carryall_ardi_F, 700, MISC_STOCK);
			ITEM(B_Carryall_kzg_F, 700, MISC_STOCK);

			ITEM(B_FieldPack_semiarid, 700, MISC_STOCK);
			ITEM(B_FieldPack_ardi, 700, MISC_STOCK);
			ITEM(B_FieldPack_owcamo, 700, MISC_STOCK);

			ITEM(B_Kitbag_flecktarn, 700, MISC_STOCK);
			ITEM(B_Kitbag_multitarn, 700, MISC_STOCK);
			ITEM(B_Kitbag_aucamo_F, 700, MISC_STOCK);

			ITEM(Atlas_B_patrolBackpack_flk_F, 800, MISC_STOCK);
			ITEM(Atlas_B_patrolBackpack_m81_F, 800, MISC_STOCK);
			ITEM(Atlas_B_patrolBackpack_multitarn_F, 800, MISC_STOCK);
			ITEM(Atlas_B_patrolBackpack_aucamo_F, 800, MISC_STOCK);

			ITEM(B_RadioBag_01_flecktarn_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_multitarn_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_semiarid_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_ardi_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_whex_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_aucamo_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_commando_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_jungle_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_kzg_F, 600, MISC_STOCK);
			ITEM(B_RadioBag_01_marar_F, 600, MISC_STOCK);

			ITEM(B_ViperHarness_whex_F, 600, MISC_STOCK);
			ITEM(B_ViperLightHarness_whex_F, 600, MISC_STOCK);
		};

		class vestsAtlas
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_vests"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(V_SmershVest_01_khaki_F, 300, MISC_STOCK);
			ITEM(V_SmershVest_01_radio_khaki_F, 300, MISC_STOCK);
			ITEM(V_SmershVest_01_olive_F, 300, MISC_STOCK);
			ITEM(V_SmershVest_01_radio_olive_F, 300, MISC_STOCK);

			ITEM(V_HarnessOGL_tan, 300, MISC_STOCK);
			ITEM(V_HarnessOGL_whex_F, 300, MISC_STOCK);
			ITEM(V_HarnessO_tan, 300, MISC_STOCK);
			ITEM(V_HarnessO_whex_F, 300, MISC_STOCK);
			ITEM(Atlas_V_ChestRigEast_semiarid_F, 300, MISC_STOCK);
			ITEM(Atlas_V_ChestRigEast_whex_F, 300, MISC_STOCK);

			ITEM(Atlas_V_ORigLBV_blk_F, 400, MISC_STOCK);
			ITEM(Atlas_V_ORigLBV_dst_F, 400, MISC_STOCK);
			ITEM(Atlas_V_ORigLBV_GHex_F, 400, MISC_STOCK);
			ITEM(Atlas_V_ORigLBV_Hex_F, 400, MISC_STOCK);
			ITEM(Atlas_V_ORigLBV_khk_F, 400, MISC_STOCK);
			ITEM(Atlas_V_ORigLBV_oli_F, 400, MISC_STOCK);
			ITEM(Atlas_V_ORigLBV_semiarid_F, 400, MISC_STOCK);
			ITEM(Atlas_V_ORigLBV_Whex_F, 400, MISC_STOCK);

			ITEM(V_TacVest_tan, 400, MISC_STOCK);
			ITEM(Atlas_Tacvest_Ard_F, 400, MISC_STOCK);

			ITEM(V_HarnessOSpec_tan, 500, MISC_STOCK);
			ITEM(V_HarnessOSpec_whex_F, 500, MISC_STOCK);

			ITEM(Atlas_V_PlateCarrier2_alt_aucamo_ard, 900, MISC_STOCK);
			ITEM(Atlas_V_PlateCarrier2_alt_aucamo_trp, 900, MISC_STOCK);
			ITEM(Atlas_V_PlateCarrier2_alt_aucamo, 900, MISC_STOCK);
			ITEM(Atlas_V_PlateCarrier2_alt_snd, 900, MISC_STOCK);
			ITEM(V_PlateCarrier1_aucamo_ard_F, 900, MISC_STOCK);
			ITEM(V_PlateCarrier1_aucamo_trp_F, 900, MISC_STOCK);
			ITEM(V_PlateCarrier1_aucamo_F, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_aucamo_ard_F, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_aucamo_trp_F, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_aucamo_F, 900, MISC_STOCK);
			ITEM(V_PlateCarrier2_snd, 900, MISC_STOCK);

			ITEM(V_PlateCarrierIAGL_grn, 1300, MISC_STOCK);
			ITEM(V_PlateCarrierIA1_grn, 1000, MISC_STOCK);
			ITEM(V_PlateCarrierIA2_grn, 1000, MISC_STOCK);

			ITEM(Atlas_V_CarrierRigKBT_01_CQB_france_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_CarrierRigKBT_01_CQB_CDF_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_CarrierRigKBT_01_CQB_RACS_F, 1000, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_light_france_F, 1000, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_light_CDF_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_CarrierRigKBT_01_light_RACS_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_CarrierRigKBT_01_recon_idfsf_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_CarrierRigKBT_01_tac_UNRACS_F, 1000, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_france_F, 1000, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_CDF_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_CarrierRigKBT_01_RACS_F, 1000, MISC_STOCK);

			ITEM(Atlas_V_OCarrierRig_CQB_alt_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_alt_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_alt_oli_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_Dst_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_GHex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_Hex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_oli_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_semiarid_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_CQB_WHex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_alt_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_alt_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_alt_Oli_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_dst_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_GHex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_Hex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_oli_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GL_semiarid_F, 1000, MISC_STOCK); 
			ITEM(Atlas_V_OCarrierRig_GL_whex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_alt_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_alt_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_Alt_Oli_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_dst_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_gHex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_Hex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_oli_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_semiarid_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Lite_whex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_dst_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_GHex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_Hex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_oli_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_semiarid_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierRig_whex_F, 1000, MISC_STOCK);

			ITEM(V_CarrierRigKBT_01_heavy_france_F, 1300, MISC_STOCK);
			ITEM(V_CarrierRigKBT_01_heavy_CDF_F, 1300, MISC_STOCK);
			ITEM(Atlas_V_CarrierRigKBT_01_heavy_UNRACS_F, 1300, MISC_STOCK);
			ITEM(Atlas_V_CarrierRigKBT_01_heavy_RACS_F, 1300, MISC_STOCK);

			ITEM(Atlas_V_OCarrierGora_CQB_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_CQB_grn_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_CQB_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_CQB_ardi_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_Lite_blk_F, 1000, MISC_STOCK); 
			ITEM(Atlas_V_OCarrierGora_Lite_grn_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_Lite_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_Lite_ardi_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_blk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_grn_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_khk_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierGora_ardi_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierLuchnik_GL_whex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierLuchnik_Lite_whex_F, 1000, MISC_STOCK);
			ITEM(Atlas_V_OCarrierLuchnik_whex_F, 1000, MISC_STOCK);

			ITEM(V_PlateCarrierGL_aucamo_ard_F, 1300, MISC_STOCK);
			ITEM(V_PlateCarrierGL_aucamo_trp_F, 1300, MISC_STOCK);
			ITEM(V_PlateCarrierGL_aucamo_F, 1300, MISC_STOCK);

			ITEM(V_RebreatherI_I, 900, MISC_STOCK);
		};

		class uniformsAtlas
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_uniforms"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			/// suits
			ITEM(Atlas_U_C_CommonerJacket_01_grey_F, 150, MISC_STOCK);
			ITEM(Atlas_U_C_CommonerJacket_01_marroon_F, 150, MISC_STOCK);
			ITEM(Atlas_U_C_Uniform_01_shirt_pattern_F, 150, MISC_STOCK);
			ITEM(Atlas_U_C_Uniform_01_shirt_striped_F, 150, MISC_STOCK);

			ITEM(Atlas_U_C_Uniform_01_shirt_white_F, 150, MISC_STOCK);
			
			ITEM(Atlas_U_B_M_Tank_Marar_F, 200, MISC_STOCK);

			ITEM(Atlas_U_B_A_CBRN_Suit_01_Aucamo_F, 200, MISC_STOCK);
			ITEM(Atlas_U_I_I_CBRN_Suit_01_Olive_F, 200, MISC_STOCK);
			ITEM(Atlas_U_B_K_CBRN_Suit_01_F, 200, MISC_STOCK);
			ITEM(Atlas_U_B_M_CBRN_Suit_01_Marar_F, 200, MISC_STOCK);

			ITEM(Atlas_U_UniformBDU_01_m81_F, 250, MISC_STOCK);
			ITEM(Atlas_U_UniformBDU_02_m81_F, 250, MISC_STOCK);
			ITEM(Atlas_U_UniformBDU_01_oli_F, 250, MISC_STOCK);

			ITEM(Atlas_U_UniformBDU_02_oli_F, 250, MISC_STOCK);
			ITEM(Atlas_U_UniformBDU_01_HI_F, 250, MISC_STOCK);
			ITEM(Atlas_U_UniformBDU_02_HI_F, 250, MISC_STOCK);
			ITEM(Atlas_U_UniformBDU_03_reservist_F, 250, MISC_STOCK);
			ITEM(Atlas_U_UniformBDU_04_reservist_F, 250, MISC_STOCK);
			ITEM(Atlas_U_B_CombatUniform_ffl, 250, MISC_STOCK);

			ITEM(Atlas_U_B_CombatUniform_ffl_vest, 250, MISC_STOCK);
			ITEM(Atlas_U_B_CombatUniform_ffl_tshirt, 250, MISC_STOCK);
			ITEM(Atlas_U_B_A_CombatUniform_aucamo, 250, MISC_STOCK);
			ITEM(Atlas_U_B_A_CombatUniform_aucamo_ard, 250, MISC_STOCK);
			ITEM(Atlas_U_B_A_CombatUniform_shortsleeve_aucamo_ard, 250, MISC_STOCK);

			ITEM(Atlas_U_B_A_CombatUniform_shortsleeve_aucamo, 200, MISC_STOCK);
			ITEM(Atlas_U_B_A_CombatUniform_aucamo_trp, 200, MISC_STOCK); 
			ITEM(Atlas_U_B_A_CombatUniform_shortsleeve_aucamo_trp, 200, MISC_STOCK);
			ITEM(Atlas_U_I_UW_CombatUniform_UNO, 200, MISC_STOCK);
			ITEM(Atlas_U_I_UW_CombatUniform_shortsleeve_UNO, 200, MISC_STOCK);

			ITEM(Atlas_U_O_CombatFatigues_mhex_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_CombatFatigues_mhex_02_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_CombatFatigues_semiarid_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_CombatFatigues_02_semiarid_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_CombatFatigues_whex_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_CombatFatigues_02_whex_F, 250, MISC_STOCK);

			ITEM(Atlas_U_B_H_Soldier_commando_F, 200, MISC_STOCK);
			ITEM(Atlas_U_B_H_Soldier_commando_shortsleeve_F, 200, MISC_STOCK);

			ITEM(Atlas_U_B_H_Soldier_F, 200, MISC_STOCK);
			ITEM(Atlas_U_B_H_Soldier_2_F, 200, MISC_STOCK);
			ITEM(Atlas_U_B_H_Soldier_3_F, 200, MISC_STOCK);
			ITEM(Atlas_U_I_I_CombatUniform_olive, 200, MISC_STOCK);
			ITEM(Atlas_U_I_I_CombatUniform_shortsleeve_olive, 200, MISC_STOCK);
			ITEM(Atlas_U_B_K_CombatUniform, 200, MISC_STOCK);
			ITEM(Atlas_U_B_K_CombatUniform_shortsleeve, 200, MISC_STOCK);

			ITEM(Atlas_U_B_M_CombatUniform_des, 250, MISC_STOCK);
			ITEM(Atlas_U_B_M_CombatUniform_shortsleeve_des, 250, MISC_STOCK);

			ITEM(Atlas_U_B_M_CombatUniform_tee_des, 200, MISC_STOCK);
			ITEM(Atlas_U_I_U_CombatUniform_UNO, 200, MISC_STOCK);

			ITEM(Atlas_U_I_U_CombatUniform_shortsleeve_UNO, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformNCU_01_mcam_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformNCU_02_mcam_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformNCU_01_mcam_wdl_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformNCU_02_mcam_wdl_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformNCU_01_multitarn_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformNCU_02_multitarn_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformNCU_01_flecktarn_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformNCU_02_flecktarn_F, 250, MISC_STOCK);

			ITEM(Atlas_U_E_SF_CombatUniformNCU_01_F, 250, MISC_STOCK);
			ITEM(Atlas_U_E_SF_CombatUniformNCU_01_ard_F, 250, MISC_STOCK);
			ITEM(Atlas_U_E_SF_CombatUniformNCU_02_ard_F, 250, MISC_STOCK);
			ITEM(Atlas_U_E_SF_CombatUniformNCU_02_F, 250, MISC_STOCK);

			ITEM(Atlas_U_CombatUniformEURO_01_multitarn_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformEURO_02_multitarn_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformEURO_01_F, 250, MISC_STOCK);
			ITEM(Atlas_U_CombatUniformEURO_02_F, 250, MISC_STOCK);

			ITEM(Atlas_U_B_G_CombatUniform_arid, 200, MISC_STOCK);
			ITEM(Atlas_U_B_G_CombatUniform_vest_arid, 200, MISC_STOCK);
			ITEM(Atlas_U_B_G_CombatUniform_tshirt_arid, 200, MISC_STOCK);
			ITEM(Atlas_U_B_G_CombatUniform_wdl, 200, MISC_STOCK);
			ITEM(Atlas_U_B_G_CombatUniform_vest_wdl, 200, MISC_STOCK);
			ITEM(Atlas_U_B_G_CombatUniform_tshirt_wdl, 200, MISC_STOCK);

			ITEM(Atlas_U_O_Afghanka_01_dst_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_02_dst_F, 200, MISC_STOCK);
			
			ITEM(Atlas_U_O_Afghanka_01_ghex_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_02_ghex_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_01_grn_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_02_grn_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_01_hex_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_01_khk_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_02_khk_F, 200, MISC_STOCK);

			ITEM(Atlas_U_O_Afghanka_01_semiarid_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_02_semiarid_F, 200, MISC_STOCK);
			ITEM(Atlas_U_I_Afghanka_01_ardi_full_F, 200, MISC_STOCK);
			ITEM(Atlas_U_I_Afghanka_01_ardi_half_F, 200, MISC_STOCK);
			ITEM(Atlas_U_I_Afghanka_02_ardi_half_F, 200, MISC_STOCK);
			ITEM(Atlas_U_I_Afghanka_02_ardi_full_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_01_whex_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_02_whex_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_01_ruarid_F, 200, MISC_STOCK); 
			ITEM(Atlas_U_O_Afghanka_02_ruarid_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_01_rutaiga_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_Afghanka_02_rutaiga_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_LightCombatFatigues_semiarid_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_LightCombatFatigues_whex_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_VZ_Officer_oli_CO_f, 200, MISC_STOCK);
			ITEM(Atlas_U_O_officer_noInsignia_semiarid_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_CombatUniform_tshirt_semiarid_F, 200, MISC_STOCK);
			ITEM(Atlas_U_O_officer_noInsignia_whex_F, 200, MISC_STOCK);
			
			ITEM(Atlas_U_O_W_OfficerUniform, 200, MISC_STOCK);
			ITEM(Atlas_U_B_H_Officer_F, 200, MISC_STOCK);
			ITEM(Atlas_U_I_I_OfficerUniform, 200, MISC_STOCK);
			ITEM(Atlas_U_I_I_SFUniform_tee_olive, 200, MISC_STOCK);

			ITEM(Atlas_U_O_Luchnik_semiarid_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_Luchnik_RolledUp_semiarid_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_Luchnik_whex_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_Luchnik_Officer_whex_F, 250, MISC_STOCK);
			ITEM(Atlas_U_O_Luchnik_RolledUp_whex_F, 250, MISC_STOCK);
			ITEM(Atlas_U_I_I_SFUniform_olive, 250, MISC_STOCK);
			ITEM(Atlas_U_I_I_SFUniform_shortsleeve_olive, 250, MISC_STOCK);
			
			ITEM(Atlas_U_Tank_olive_F, 250, MISC_STOCK);
			ITEM(Atlas_U_Tank_wdl_F, 250, MISC_STOCK);

			ITEM(Atlas_U_B_K_HeliPilotCoveralls, 350, MISC_STOCK);
			ITEM(Atlas_U_B_G_HeliPilotCoveralls, 350, MISC_STOCK);
			ITEM(Atlas_U_B_A_Wetsuit, 350, MISC_STOCK);
			ITEM(Atlas_U_I_I_Wetsuit, 350, MISC_STOCK);

			ITEM(Atlas_U_O_CombatUniform_mhex, 500, MISC_STOCK);

			ITEM(Atlas_U_O_CombatUniform_semiarid, 500, MISC_STOCK);
			ITEM(Atlas_U_O_W_CombatUniform_owcamo, 500, MISC_STOCK);

			ITEM(Atlas_U_B_A_PilotCoveralls, 500, MISC_STOCK);
			ITEM(Atlas_U_I_A_PilotCoveralls, 500, MISC_STOCK);
			ITEM(Atlas_U_O_W_PilotCoveralls, 500, MISC_STOCK);

			ITEM(Atlas_U_B_A_GhillieSuit, 750, MISC_STOCK);
			ITEM(Atlas_U_B_A_GhillieSuit_Arid, 750, MISC_STOCK);
			ITEM(Atlas_U_B_A_GhillieSuit_Tropical, 750, MISC_STOCK);
			ITEM(Atlas_U_I_I_GhillieSuit, 750, MISC_STOCK);
			ITEM(Atlas_U_B_K_GhillieSuit, 750, MISC_STOCK);

			ITEM(Atlas_U_B_T_JSOC_StealthUniform_alt_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_T_JSOC_StealthUniform_RolledUp_alt_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_D_JSOC_StealthUniform_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_D_JSOC_StealthUniform_RolledUp_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_JSOC_StealthUniform_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_JSOC_StealthUniform_RolledUp_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_T_JSOC_StealthUniform_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_T_JSOC_StealthUniform_RolledUp_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_W_JSOC_StealthUniform_F, 5000, MISC_STOCK);
			ITEM(Atlas_U_B_W_JSOC_StealthUniform_RolledUp_F, 5000, MISC_STOCK);

			ITEM(Atlas_U_O_V_Soldier_Viper_whex_F, 25000, MISC_STOCK);
			ITEM(H_HelmetO_ViperSP_whex_F, 15000, MISC_STOCK);
		};

		class helmetsAtlas
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_Atlas", localize "STR_A3AU_helmets"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
			///////helmets
			ITEM(H_Booniehat_flecktarn, 200, MISC_STOCK);
			ITEM(H_Booniehat_flecktarn_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_multitarn, 200, MISC_STOCK);
			ITEM(H_Booniehat_multitarn_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_semiarid, 200, MISC_STOCK);
			ITEM(H_Booniehat_semiarid_hs, 200, MISC_STOCK);
			ITEM(H_Booniehat_whex_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_whex_hs_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_aucamo_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_aucamo_ard_F, 200, MISC_STOCK); 
			ITEM(H_Booniehat_aucamo_ard_hs_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_aucamo_hs_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_aucamo_trp_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_aucamo_trp_hs_F, 200, MISC_STOCK);
			ITEM(H_Booniehat_jungle, 200, MISC_STOCK);
			ITEM(H_Booniehat_jungle_hs, 200, MISC_STOCK);
			ITEM(H_Cap_aucamo, 200, MISC_STOCK);
			ITEM(H_Cap_aucamo_ard, 200, MISC_STOCK);
			ITEM(H_Cap_aucamo_trp, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_flecktarn, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_hs_flecktarn, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_hs_multitarn, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_multitarn, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_kzg, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_hs_kzg, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_ldf, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_hs_ldf, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_hs_pantera, 200, MISC_STOCK);
			ITEM(Atlas_H_FieldCap_pantera, 200, MISC_STOCK);
			ITEM(H_MilCap_sgg, 200, MISC_STOCK);
			ITEM(H_MilCap_semiarid, 200, MISC_STOCK);
			ITEM(H_MilCap_whex_F, 200, MISC_STOCK);
			ITEM(Atlas_H_MilCap_nohs_sgg, 200, MISC_STOCK);
			ITEM(Atlas_H_MilCap_nohs_semiarid, 200, MISC_STOCK);
			ITEM(Atlas_H_MilCap_nohs_whex_F, 200, MISC_STOCK);
			ITEM(Atlas_H_MilCap_nohs_aucamo, 200, MISC_STOCK);
			ITEM(H_MilCap_aucamo, 200, MISC_STOCK);
			ITEM(Atlas_H_MilCap_nohs_jungle, 200, MISC_STOCK);
			ITEM(H_MilCap_jungle, 200, MISC_STOCK);
			ITEM(Atlas_H_MilCap_tachs_Jungle, 200, MISC_STOCK);
			ITEM(Atlas_H_MilCap_nohs_kzg, 200, MISC_STOCK);
			ITEM(H_Hat_Pakol_brn_F, 200, MISC_STOCK);
			ITEM(H_Hat_Pakol_gry_F, 200, MISC_STOCK);
			ITEM(H_Hat_Pakol_tan_F, 200, MISC_STOCK);

			ITEM(H_HelmetHBK_aucamo_arid_F, 800, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_arid_chops_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_arid_ear_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_arid_headset_F, 850, MISC_STOCK);

			ITEM(H_HelmetHBK_aucamo_tropic_F, 800, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_tropic_chops_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_tropic_ear_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_tropic_headset_F, 850, MISC_STOCK);

			ITEM(H_HelmetHBK_aucamo_F, 800, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_chops_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_ear_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_aucamo_headset_F, 850, MISC_STOCK);

			ITEM(H_HelmetHBK_commando_F, 800, MISC_STOCK);
			ITEM(H_HelmetHBK_commando_ear_F, 900, MISC_STOCK);
			ITEM(H_HelmetHBK_commando_headset_F, 900, MISC_STOCK);

			ITEM(H_HelmetSpecO_whex_F, 1000, MISC_STOCK);
			ITEM(H_HelmetLeaderO_whex_F, 1000, MISC_STOCK);

			ITEM(H_HelmetO_whex_F, 800, MISC_STOCK);

			ITEM(Atlas_H_PASGT_Cover_alt_Black_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_O_DHex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_O_GHex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_Green_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_O_Hex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_Olive_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_O_SAHex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_Tan_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_O_UHex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_wdl_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_HIMF_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_alt_KZG_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_I_EAF_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_I_EAF_R_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_UN_F, 500, MISC_STOCK);
			ITEM(Atlas_H_PASGT_Cover_I_UNA_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_cover_fleck_F, 500, MISC_STOCK);
			ITEM(H_HelmetB_cover_fleck_F, 500, MISC_STOCK);
			ITEM(H_HelmetB_green, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_green, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_cover_Multitarn_F, 500, MISC_STOCK);
			ITEM(H_HelmetB_cover_Multitarn_F, 500, MISC_STOCK);
			ITEM(H_HelmetI_I_01_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetI_I_01_cover_alt_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetI_I_01_cover_alt_blk_F, 500, MISC_STOCK);
			ITEM(H_HelmetI_I_01_cover_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetI_I_01_cover_alt_UN_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_blk_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_Cover_dst_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_Cover_ghex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_cover_hex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_cover_mhex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_Cover_semiarid_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_Cover_uhex_F, 500, MISC_STOCK);

			ITEM(Atlas_H_HelmetCCH_HiCut_Cover_whex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_grn_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_Headset_blk_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_Headset_grn_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_Headset_khk_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_HiCut_khk_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_blk_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_Cover_dst_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_Cover_ghex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_cover_hex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_cover_mhex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_Cover_semiarid_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_Cover_uhex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_Cover_whex_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_grn_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_Headset_blk_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_Headset_grn_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_Headset_khk_F, 500, MISC_STOCK);
			ITEM(Atlas_H_HelmetCCH_khk_F, 500, MISC_STOCK); 
			ITEM(H_HelmetB_light_green, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light_green, 500, MISC_STOCK);
			ITEM(H_HelmetB_light_idfsf, 500, MISC_STOCK);
			ITEM(H_HelmetSpecB_light_idfsf, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_semiarid_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_ardi_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_whex_F, 500, MISC_STOCK);
			ITEM(H_HelmetLuchnik_cover_sfia_F, 500, MISC_STOCK);
			ITEM(H_O_Helmet_canvas_semiarid, 500, MISC_STOCK);
			ITEM(H_O_Helmet_canvas_owcamo, 500, MISC_STOCK);
			ITEM(H_O_Helmet_canvas_RACS, 500, MISC_STOCK);
			ITEM(Atlas_H_Helmet_FASTMT_Cover_aucamo_ard_F, 500, MISC_STOCK);
			ITEM(Atlas_H_Helmet_FASTMT_Cover_aucamo_trp_F, 500, MISC_STOCK);
			ITEM(Atlas_H_Helmet_FASTMT_Cover_aucamo_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_CDF_F, 500, MISC_STOCK);
			ITEM(H_HelmetSpecter_cover_semiarid_CO, 500, MISC_STOCK);
			ITEM(H_MK7_Marar_F, 500, MISC_STOCK);

			ITEM(H_PilotHelmetFighter_B_A, 1000, MISC_STOCK);
			ITEM(H_PilotHelmetFighter_I_I, 1000, MISC_STOCK);

			ITEM(H_CrewHelmetHeli_B_A, 600, MISC_STOCK);
			ITEM(H_PilotHelmetHeli_B_A, 600, MISC_STOCK);
		};	