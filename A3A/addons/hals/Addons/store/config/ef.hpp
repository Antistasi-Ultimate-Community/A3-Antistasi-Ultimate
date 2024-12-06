		class riflesEF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_EF", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(ef_arifle_mxar, 1250, RIFLE_STOCK); // EF_30Rnd_65x39_caseless_coy_mag, EF_100Rnd_65x39_caseless_coy_mag
			ITEM(ef_arifle_mxar_black, 1250, RIFLE_STOCK);
			ITEM(ef_arifle_mxar_coy, 1250, RIFLE_STOCK);
			ITEM(ef_arifle_mxar_khk, 1250, RIFLE_STOCK);

			ITEM(ef_arifle_mx_coy, 1250, RIFLE_STOCK);
			ITEM(ef_arifle_mxc_coy, 1200, RIFLE_STOCK);
			ITEM(ef_arifle_mx_sw_coy, 1300, RIFLE_STOCK);
			ITEM(ef_arifle_mxm_coy, 1300, RIFLE_STOCK);
			ITEM(ef_arifle_mx_gl_coy, 1400, RIFLE_STOCK);

			ITEM(ef_arifle_mxar_gl, 1400, RIFLE_STOCK);
			ITEM(ef_arifle_mxar_gl_black, 1400, RIFLE_STOCK);
			ITEM(ef_arifle_mxar_gl_coy, 1400, RIFLE_STOCK);
			ITEM(ef_arifle_mxar_gl_khk, 1400, RIFLE_STOCK);
		};

		class handgunsEF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_EF", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(ef_hgun_Pistol_heavy_01_coy, 200, PISTOL_STOCK);
			ITEM(ef_hgun_P07_coy, 200, PISTOL_STOCK);
		};

		class navigationEF
		{
			displayName = __EVAL(formatText ["%1 %2, %3 %4 %5", localize "STR_A3AU_EF", localize "STR_A3AU_gps", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\compass_ca.paa";

			ITEM(EF_LPNVG, 1000, NN_STOCK);
			ITEM(EF_LPNVG_Tan, 1000, NN_STOCK);
			ITEM(EF_LPNVG_T, 5000, NN_STOCK);
			ITEM(EF_LPNVG_T_Tan, 5000, NN_STOCK);
		};

		class pointersEF
		{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_EF", localize "STR_A3AU_pointers", localize "STR_A3AU_and", localize "STR_A3AU_flashlights"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(EF_acc_pointer_IR_coy, 75, PN_STOCK);
		};

		class muzzlesEF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_EF", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";

			ITEM(ef_snds_mxar, 1000, MZ_STOCK);
			ITEM(ef_snds_mxar_coy, 1000, MZ_STOCK);
			ITEM(ef_snds_mxar_khk, 1000, MZ_STOCK);
			ITEM(ef_snds_mxar_sand, 600, MZ_STOCK);
		};

		class opticsEF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_EF", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";

			class ef_optic_mbs 
			{
				price = 500;
				stock = 75;
			};
			class ef_optic_mbs_remote : ef_optic_mbs {};
			class ef_optic_mbs_coy : ef_optic_mbs {};
			class ef_optic_mbs_remote_coy : ef_optic_mbs {};
			class ef_optic_mbs_khk : ef_optic_mbs {};
			class ef_optic_mbs_remote_khk : ef_optic_mbs {};
			class ef_optic_mbs_sand : ef_optic_mbs {};
			class ef_optic_mbs_remote_sand : ef_optic_mbs {};

			class ef_optic_microsight 
			{
				price = 150;
				stock = 100;
			};
			class ef_optic_microsight_coy : ef_optic_microsight {};
			class ef_optic_microsight_khk : ef_optic_microsight {};
			class ef_optic_microsight_sand : ef_optic_microsight {};
			class ef_optic_microsight_pistol : ef_optic_microsight {};
			class ef_optic_microsight_pistol_coy : ef_optic_microsight {};
			class ef_optic_microsight_pistol_khk : ef_optic_microsight {};
			class ef_optic_microsight_pistol_sand : ef_optic_microsight {};
			class ef_optic_Holosight_coy : ef_optic_microsight {};
			class ef_optic_Holosight_smg_coy : ef_optic_microsight {};
		};

		class magazinesEF
		{
			displayName = __EVAL(formatText["%1 %2", localize "STR_A3AU_EF", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";

			///////////////////////////////////////////////////////
			// RIFLES
			///////////////////////////////////////////////////////
			class EF_30Rnd_65x39_caseless_coy_mag 
			{
				price = 300;
				stock = MAGAZINE_STOCK;
			};
			class EF_100Rnd_65x39_caseless_coy_mag 
			{
				price = 1000;
				stock = MAGAZINE_STOCK;
			};
		};

		class miscEF
		{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_EF", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(EF_B_AssaultPack_coy, 600, MISC_STOCK);
			ITEM(EF_B_Carryall_coy, 600, MISC_STOCK);
			ITEM(EF_B_Kitbag_coy, 600, MISC_STOCK);
			ITEM(EF_B_RaiderPack_black, 600, MISC_STOCK);
			ITEM(EF_B_RaiderPack_coy, 600, MISC_STOCK);
			ITEM(EF_B_RaiderPack_olive, 600, MISC_STOCK);

			ITEM(EF_H_Booniehat_Des, 200, MISC_STOCK);
			ITEM(EF_H_Booniehat_Wdl, 200, MISC_STOCK);
			ITEM(EF_H_Cap_Navy, 200, MISC_STOCK);
			ITEM(EF_H_Cap_Takmyr, 200, MISC_STOCK);
			ITEM(EF_H_Protecta, 200, MISC_STOCK);
			ITEM(EF_H_UtilityCap_Des, 200, MISC_STOCK);
			ITEM(EF_H_UtilityCap_Wdl, 200, MISC_STOCK);

			ITEM(EF_H_HelmetCrew_Coy, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetCrew_White, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetCrew_Yellow, 1000, MISC_STOCK);

			ITEM(EF_H_HelmetB_light_slick, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetB_light_black_slick, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetB_light_desert_slick, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetB_light_grass_slick, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetB_light_sand_slick, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetB_light_snakeskin_slick, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetB_light_tna_slick, 1000, MISC_STOCK);
			ITEM(EF_H_HelmetB_light_wdl_slick, 1000, MISC_STOCK);
			ITEM(EF_H_MCH, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_Basic, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_BasicNet_Black, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_BasicNet_Coy, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_BasicNet_Des, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_BasicNet_Olive, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_BasicNet_Wdl, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_Full, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_FullCamo_Black, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_FullCamo_Coy, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_FullCamo_Des, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_FullCamo_Olive, 1000, MISC_STOCK);
			ITEM(EF_H_MCH_FullCamo_Wdl, 1000, MISC_STOCK);

			ITEM(EF_V_AAV_Black, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Diver_Black, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Rifleman_Black, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Sailor_Black, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Scout_Black, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Support_Black, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_TL_Black, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Coy, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Diver_Coy, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Rifleman_Coy, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Sailor_Coy, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Scout_Coy, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Support_Coy, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_TL_Coy, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Olive, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Diver_Olive, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Rifleman_Olive, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Sailor_Olive, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Scout_Olive, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_Support_Olive, 1500, MISC_STOCK);
			ITEM(EF_V_AAV_TL_Olive, 1500, MISC_STOCK);
			ITEM(EF_V_CCR_Rifleman_Black, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_Scout_Black, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_Support_Black, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_TL_Black, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_Rifleman_Coy, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_Scout_Coy, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_Support_Coy, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_TL_Coy, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_Rifleman_Olive, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_Scout_Olive, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_Support_Olive, 1000, MISC_STOCK);
			ITEM(EF_V_CCR_TL_Olive, 1000, MISC_STOCK);

			ITEM(EF_U_B_MarineCombatUniform_Des_1, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Des_2, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Des_3, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Des_4, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Des_5, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Des_6, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Wdl_1, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Wdl_2, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Wdl_3, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Wdl_4, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Wdl_5, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Wdl_6, 1000, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Diver_Des, 1200, MISC_STOCK);
			ITEM(EF_U_B_MarineCombatUniform_Diver_Wdl, 1200, MISC_STOCK);
		};
