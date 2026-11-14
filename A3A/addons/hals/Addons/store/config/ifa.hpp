		class handgunsifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(LIB_M1896, 90, PISTOL_STOCK) //AMMO: LIB_10Rnd_9x19_M1896
			ITEM(LIB_FLARE_PISTOL, 50, PISTOL_STOCK) //AMMO: LIB_1Rnd_flare_white
			ITEM(LIB_M1895, 90, PISTOL_STOCK) //AMMO: LIB_7Rnd_762x38
			ITEM(LIB_P08, 110, PISTOL_STOCK) //AMMO: LIB_8Rnd_9x19_P08
			ITEM(LIB_P38, 110, PISTOL_STOCK) //AMMO: LIB_8Rnd_9x19
			ITEM(LIB_TT33, 110, PISTOL_STOCK) //AMMO: LIB_8Rnd_762x25
			ITEM(LIB_WaltherPPK, 110, PISTOL_STOCK) //AMMO: LIB_7Rnd_765x17_PPK
			ITEM(LIB_Webley_mk6, 110, PISTOL_STOCK) //AMMO: LIB_6Rnd_455
			ITEM(LIB_Webley_Flare, 110, PISTOL_STOCK) //AMMO: LIB_1Rnd_flare_white
			ITEM(LIB_Welrod_mk1, 150, PISTOL_STOCK) //AMMO: LIB_6Rnd_9x19_Welrod
			ITEM(LIB_Colt_M1911, 110, PISTOL_STOCK) //AMMO: LIB_7Rnd_45ACP
		};

		class smgifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(LIB_Sten_Mk2, 165, RIFLE_STOCK) // LIB_32Rnd_9x19_Sten
			ITEM(LIB_Sten_Mk5, 185, RIFLE_STOCK) // LIB_32Rnd_9x19_Sten
			ITEM(LIB_MP38, 210, RIFLE_STOCK) // LIB_32Rnd_9x19
			ITEM(LIB_MP40, 200, RIFLE_STOCK) // LIB_32Rnd_9x19_t
			ITEM(LIB_PPSh41_m, 245, RIFLE_STOCK) // LIB_35Rnd_762x25 LIB_71Rnd_762x25
			ITEM(LIB_M3_GreaseGun, 185, RIFLE_STOCK) // LIB_30Rnd_M3_GreaseGun_45ACP
            ITEM(LIB_M1A1_Thompson, 220, RIFLE_STOCK) // 30rnd mag: LIB_30Rnd_45ACP 30rnd mag tracer: LIB_30Rnd_45ACP_t
			ITEM(LIB_M1928_Thompson, 245, RIFLE_STOCK) // 30rnd mag: LIB_30Rnd_45ACP 30rnd mag tracer: LIB_30Rnd_45ACP_t 50rnd mag: LIB_50Rnd_45ACP
			ITEM(LIB_M1928A1_Thompson, 280, RIFLE_STOCK) // 30rnd mag: LIB_30Rnd_45ACP 30rnd mag tracer: LIB_30Rnd_45ACP_t
			ITEM(LIB_MP44, 400, RIFLE_STOCK) // 30rnd mag: LIB_30Rnd_792x33  LIB_30Rnd_792x33_t
		};
		
		class mgifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(LIB_M1919A4, 550, RIFLE_STOCK) //NORMAL: LIB_50Rnd_762x63 M1_BALL: LIB_50Rnd_762x63_M1
			ITEM(LIB_M1919A6, 650, RIFLE_STOCK) //NORMAL: LIB_50Rnd_762x63 M1_BALL: LIB_50Rnd_762x63_M1
			ITEM(LIB_Bren_Mk2, 500, RIFLE_STOCK) //NORMAL: LIB_Bren_Mk2 BALL: LIB_30Rnd_770x56_MKVIII
			ITEM(LIB_M1918A2_BAR, 400, RIFLE_STOCK) //NORMAL: LIB_M1918A2_BAR BALL: LIB_20Rnd_762x63_M1
			ITEM(LIB_DP28, 650, RIFLE_STOCK) //NORMAL: LIB_47Rnd_762x54	LIB_47Rnd_762x54d
			ITEM(LIB_DT, 750, RIFLE_STOCK) //NORMAL: LIB_63Rnd_762x54	LIB_63Rnd_762x54d
			ITEM(LIB_DT_OPTIC, 1200, RIFLE_STOCK) //NORMAL: LIB_63Rnd_762x54	LIB_63Rnd_762x54d
			ITEM(LIB_MG34, 850, RIFLE_STOCK) //NORMAL: LIB_50Rnd_792x57 	LIB_50Rnd_792x57_SMK	LIB_50Rnd_792x57_sS
			ITEM(LIB_MG42, 1000, RIFLE_STOCK) //NORMAL: LIB_50Rnd_792x57 	LIB_50Rnd_792x57_SMK	LIB_50Rnd_792x57_sS
			ITEM(LIB_FG42G, 500, RIFLE_STOCK) //NORMAL: LIB_20Rnd_792x57
		};

		class riflesifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(LIB_LeeEnfield_No1, 210, RIFLE_STOCK) //NORMAL: LIB_10Rnd_770x56 BALL: LIB_10Rnd_770x56_MkVIII
			ITEM(LIB_LeeEnfield_No4, 200, RIFLE_STOCK) //^^
			ITEM(LIB_DELISLE, 250, RIFLE_STOCK) //NORMAL: LIB_7Rnd_45ACP_DeLisle
			ITEM(LIB_M1_Carbine, 250, RIFLE_STOCK) //NORMAL: LIB_15Rnd_762x33 TRACER: LIB_15Rnd_762x33_t
			ITEM(LIB_M1_Garand, 300, RIFLE_STOCK) //NORMAL: LIB_8Rnd_762x63 BALL: LIB_8Rnd_762x63_M1 tracer: LIB_8Rnd_762x63_t
			ITEM(LIB_M1903A3_Springfield, 200, RIFLE_STOCK) //NORMAL: LIB_5Rnd_762x63
			ITEM(LIB_M9130, 180, RIFLE_STOCK) //NORMAL: LIB_5Rnd_762x54 LIB_5Rnd_762x54_b30 LIB_5Rnd_762x54_D LIB_5Rnd_762x54_t30 LIB_5Rnd_762x54_t46
			ITEM(LIB_M38, 170, RIFLE_STOCK) //NORMAL: ^^
			ITEM(LIB_M44, 170, RIFLE_STOCK) //NORMAL: ^^^
			ITEM(LIB_SVT_40, 320, RIFLE_STOCK) //NORMAL: LIB_10Rnd_762x54 LIB_10Rnd_762x54_b30 LIB_10Rnd_762x54_d LIB_10Rnd_762x54_t30 LIB_10Rnd_762x54_t46 LIB_10Rnd_762x54_t302 LIB_10Rnd_762x54_t462
			ITEM(LIB_K98, 210, RIFLE_STOCK) //NORMAL: LIB_5Rnd_792x57 LIB_5Rnd_792x57_t LIB_5Rnd_792x57_SMK LIB_5Rnd_792x57_sS
			ITEM(LIB_K98_Late, 190, RIFLE_STOCK) //NORMAL: ^^
			ITEM(LIB_G3340, 200, RIFLE_STOCK) //NORMAL: ^^^
			ITEM(LIB_G41, 300, RIFLE_STOCK) //NORMAL: LIB_10Rnd_792x57_clip
			ITEM(LIB_G43, 280, RIFLE_STOCK) //NORMAL: LIB_10Rnd_792x57 LIB_10Rnd_792x57_T2 LIB_10Rnd_792x57_SMK LIB_10Rnd_792x57_sS LIB_10Rnd_792x57_T
		};

		class sniperriflesifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(LIB_LeeEnfield_No4_Scoped, 580, RIFLE_STOCK) // SAME AS LIB_LeeEnfield_No1
			ITEM(LIB_M1903A4_Springfield, 570, RIFLE_STOCK) // SAME AS LIB_M1903A3
			ITEM(LIB_K98ZF39, 570, RIFLE_STOCK) // SAME AS uns_springfield
			ITEM(LIB_M9130PU, 570, RIFLE_STOCK) // SAME AS uns_springfield
		};

		class launchersifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			ITEM(LIB_PIAT, 300, 25) 
			ITEM(LIB_M1A1_Bazooka, 350, 25) 
			ITEM(LIB_Faustpatrone, 200, 25) 
			ITEM(LIB_PzFaust_30m, 225, 25) 
			ITEM(LIB_PzFaust_60m, 250, 25) 
			ITEM(LIB_RPzB, 350, 25) 
			ITEM(LIB_RPzB_w, 350, 25) 
		}; 

		class launchermagazinesifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			ITEM(LIB_1Rnd_89m_PIAT, 100, 15)
			ITEM(LIB_1Rnd_60mm_M6, 100, 15)
			ITEM(LIB_1Rnd_Faustpatrone, 100, 15)
			ITEM(LIB_1Rnd_PzFaust_30m, 100, 15)
			ITEM(LIB_1Rnd_PzFaust_60m, 100, 15)
			ITEM(LIB_1Rnd_RPzB, 100, 15)
		};

		class riflegrenadesifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_glGrenades"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			ITEM(LIB_1Rnd_G_MillsBomb, 70, 25)
			ITEM(LIB_1Rnd_G_M9A1, 80, 25)
			ITEM(LIB_1Rnd_G_Mk2, 90, 25)
			ITEM(LIB_1Rnd_G_PZGR_30, 70, 25)
			ITEM(LIB_1Rnd_G_PZGR_40, 90, 25)
			ITEM(LIB_1Rnd_G_DYAKONOV, 80, 25)
		};

		class muzzlesifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";
			
			ITEM(lib_acc_p1903_bayo, 75, MZ_STOCK)
			ITEM(lib_acc_no4_mk2_bayo, 75, MZ_STOCK)
			ITEM(lib_acc_m1_bayo, 75, MZ_STOCK)
			ITEM(lib_acc_m1891_bayo, 75, MZ_STOCK)
			ITEM(lib_acc_k98_bayo, 75, MZ_STOCK)
			ITEM(lib_acc_gl_enfield_cup_empty, 80, MZ_STOCK)
			ITEM(lib_acc_gl_m7, 80, MZ_STOCK)
			ITEM(lib_acc_gw_sb_empty, 80, MZ_STOCK)
			ITEM(lib_acc_gl_dyakonov_empty, 80, MZ_STOCK)
		};

		class magazinesifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(LIB_7Rnd_45ACP, 17, MZ_STOCK)
            ITEM(LIB_32Rnd_9x19_Sten, 20, MZ_STOCK)
            ITEM(LIB_30Rnd_45ACP, 22, MZ_STOCK)
            ITEM(LIB_50Rnd_45ACP, 45, MZ_STOCK)
            ITEM(LIB_50Rnd_762x63_M1, 75, MZ_STOCK)
            ITEM(LIB_30Rnd_770x56_MKVIII, 65, MZ_STOCK)
            ITEM(LIB_20Rnd_762x63_M1, 55, MZ_STOCK)
            ITEM(LIB_10Rnd_770x56_MkVIII, 27, MZ_STOCK)
            ITEM(LIB_15Rnd_762x33, 20, MZ_STOCK)
            ITEM(LIB_8Rnd_762x63, 26, MZ_STOCK) 
			ITEM(LIB_10Rnd_9x19_M1896, 12, MZ_STOCK)
			ITEM(LIB_1Rnd_flare_white, 10, MZ_STOCK)
			ITEM(LIB_7Rnd_762x38, 15, MZ_STOCK)
			ITEM(LIB_8Rnd_9x19_P08, 15, MZ_STOCK)
			ITEM(LIB_8Rnd_9x19, 15, MZ_STOCK)
			ITEM(LIB_8Rnd_762x25, 15, MZ_STOCK)
			ITEM(LIB_7Rnd_765x17_PPK, 17, MZ_STOCK)
			ITEM(LIB_6Rnd_455, 15, MZ_STOCK)
			ITEM(LIB_6Rnd_9x19_Welrod, 20, MZ_STOCK)
			ITEM(LIB_1Rnd_flare_yellow, 10, MZ_STOCK)
			ITEM(LIB_1Rnd_flare_red, 10, MZ_STOCK)
			ITEM(LIB_1Rnd_flare_green, 10, MZ_STOCK)
			ITEM(LIB_32Rnd_9x19, 22, MZ_STOCK)
			ITEM(LIB_32Rnd_9x19_t, 22, MZ_STOCK)
			ITEM(LIB_30Rnd_M3_GreaseGun_45ACP, 22, MZ_STOCK)
			ITEM(LIB_35Rnd_762x25, 22, MZ_STOCK)
            ITEM(LIB_71Rnd_762x25, 45, MZ_STOCK)
			ITEM(LIB_47Rnd_762x54, 70, MZ_STOCK)
			ITEM(LIB_47Rnd_762x54d, 80, MZ_STOCK)
			ITEM(LIB_63Rnd_762x54, 90, MZ_STOCK)
			ITEM(LIB_63Rnd_762x54d, 100, MZ_STOCK)
			ITEM(LIB_50Rnd_792x57, 80, MZ_STOCK)
			ITEM(LIB_50Rnd_792x57_SMK, 90, MZ_STOCK)
			ITEM(LIB_50Rnd_792x57_sS, 90, MZ_STOCK)
			ITEM(LIB_20Rnd_792x57, 60, MZ_STOCK)
			ITEM(LIB_30Rnd_792x33, 50, MZ_STOCK)
			ITEM(LIB_30Rnd_792x33_t, 50, MZ_STOCK)
			ITEM(LIB_5Rnd_762x54, 15, MZ_STOCK)
			ITEM(LIB_5Rnd_762x54_b30, 20, MZ_STOCK)
			ITEM(LIB_5Rnd_762x54_D, 20, MZ_STOCK)
			ITEM(LIB_5Rnd_762x54_t30, 20, MZ_STOCK)
			ITEM(LIB_5Rnd_762x54_t46, 20, MZ_STOCK)
			ITEM(LIB_10Rnd_762x54, 25, MZ_STOCK)
			ITEM(LIB_10Rnd_762x54_b30, 30, MZ_STOCK)
			ITEM(LIB_10Rnd_762x54_d, 25, MZ_STOCK)
			ITEM(LIB_10Rnd_762x54_t30, 25, MZ_STOCK)
			ITEM(LIB_10Rnd_762x54_t46, 25, MZ_STOCK)
			ITEM(LIB_10Rnd_762x54_t302, 25, MZ_STOCK)
			ITEM(LIB_10Rnd_762x54_t462, 25, MZ_STOCK)
			ITEM(LIB_5Rnd_792x57, 15, MZ_STOCK)
			ITEM(LIB_5Rnd_792x57_t, 20, MZ_STOCK)
			ITEM(LIB_5Rnd_792x57_SMK, 25, MZ_STOCK)
			ITEM(LIB_5Rnd_792x57_sS, 20, MZ_STOCK)
			ITEM(LIB_10Rnd_792x57_clip, 35, MZ_STOCK)
			ITEM(LIB_10Rnd_792x57, 20, MZ_STOCK)
			ITEM(LIB_10Rnd_792x57_T2, 25, MZ_STOCK)
			ITEM(LIB_10Rnd_792x57_SMK, 35, MZ_STOCK)
			ITEM(LIB_10Rnd_792x57_sS, 25, MZ_STOCK)
			ITEM(LIB_10Rnd_792x57_T, 25, MZ_STOCK)
			
		};

		class miscifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(LIB_Ladung_Big_MINE_mag, 450, MISC_STOCK)
			ITEM(LIB_Ladung_Small_MINE_mag, 400, MISC_STOCK)
		};

		class pointersifaa{
			displayName = __EVAL(formatText ["%1 %2 %3 %4 %5", localize "STR_A3AU_ifa", localize "STR_A3AU_barret", localize "STR_A3AU_handles", localize "STR_A3AU_and", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(lib_m1918a2_bar_handle, 70, PN_STOCK)
			ITEM(lib_m1918a2_bar_bipod, 70, PN_STOCK)
		};

		class specialweaponsifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(LIB_M2_Flamethrower, 300, 25)
			ITEM(B_LIB_US_M2Flamethrower, 800, 25)
		};

		class opticsifaa{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			ITEM(lib_optic_zf4, 150, MAGAZINE_STOCK)
		};

		class underbarrelifaa{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_ifa", localize "STR_A3AU_bagsStatics"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(LIB_Maxim_Bar, 600, 20)
			ITEM(LIB_Maxim_Bag, 500, 20)
			ITEM(LIB_Laffete_Tripod, 400, 20)
		};
