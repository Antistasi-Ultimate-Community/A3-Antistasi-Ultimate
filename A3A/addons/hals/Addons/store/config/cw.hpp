//Clone Wars

		class handgunscw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(ls_weapon_dc15sa, 110, PISTOL_STOCK); //AMMO: SWLW_DC15SA_Mag
			ITEM(ls_weapon_dc17s, 100, PISTOL_STOCK); //AMMO: SWLW_DC17_Mag
			ITEM(ls_weapon_rg4d, 100, PISTOL_STOCK); //AMMO: SWLW_RG4D_Mag
			ITEM(ls_weapon_dc17s_dual, 150, PISTOL_STOCK); //AMMO: ls_mag_dc17dual_20rnd
			ITEM(ls_weapon_dc17s_fordo, 120, PISTOL_STOCK); //AMMO: ls_mag_dc17sidearm
			ITEM(ls_weapon_electrostaff, 300, PISTOL_STOCK); //AMMO: 
			ITEM(ls_weapon_verpinePowerLance, 400, PISTOL_STOCK); //AMMO: 
			ITEM(ls_weapon_westar35sa, 100, PISTOL_STOCK); //AMMO: SWLW_westar35sa_Mag

			ITEM(3AS_pistol_DC15SA_F, 110, PISTOL_STOCK); //AMMO: 3AS_15Rnd_EC30_mag 3AS_15Rnd_EM30_mag
			ITEM(3AS_DC17S_F, 100, PISTOL_STOCK); //AMMO: 3AS_16Rnd_EC20_Mag 3AS_16Rnd_EM20_Mag
			ITEM(3AS_DC17STest_F, 150, PISTOL_STOCK); //AMMO: 3AS_10Rnd_Test_mag
			ITEM(DymekBlasterPistol_F, 120, PISTOL_STOCK); //AMMO: 3AS_16Rnd_EY20_Mag
			ITEM(3AS_S5_f, 120, PISTOL_STOCK); //AMMO: 11Rnd_45ACP_Mag

			ITEM(JLTS_DC17SA, 100, PISTOL_STOCK); //AMMO: JLTS_DC17SA_mag
			ITEM(JLTS_RG4D, 100, PISTOL_STOCK); //AMMO: JLTS_RG4D_mag
		};

		class smgcw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_smgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(ls_weapon_e5, 185, RIFLE_STOCK); // SWLW_E5_Mag
			ITEM(ls_weapon_dc15s, 200, RIFLE_STOCK); // SWLW_DC15s_Mag
            ITEM(ls_weapon_acpr, 190, RIFLE_STOCK); // SWLW_acpr_Mag
			ITEM(ls_weapon_acpa, 125, RIFLE_STOCK); // SWLW_acpa_Mag
			ITEM(ls_weapon_dp20, 210, RIFLE_STOCK); // SWLW_DP20_Mag
			
			ITEM(JLTS_DC15S, 200, RIFLE_STOCK); // JLTS_DC15S_mag
			ITEM(JLTS_DP23, 210, RIFLE_STOCK); // JLTS_DP23_mag
			ITEM(JLTS_E5, 185, RIFLE_STOCK); // JLTS_E5_mag
			
			ITEM(3AS_DC15S_F, 200, RIFLE_STOCK); // 3AS_60Rnd_EC30_mag 3AS_60Rnd_EM30_mag
			ITEM(3AS_Cinnagaran_Carbine_F, 250, RIFLE_STOCK); // 3AS_50Rnd_EG40_Mag
			ITEM(3AS_E5_F, 210, RIFLE_STOCK); // 3AS_60Rnd_EM50_RedPlasma

		};
		
		class mgcw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_mgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";	

			ITEM(ls_weapon_ls150, 550, RIFLE_STOCK); // SWLW_LS150_mag
			ITEM(ls_weapon_dc15saw, 550, RIFLE_STOCK); // SWLW_DC15SAW_mag
			ITEM(ls_weapon_e5c, 500, RIFLE_STOCK); // SWLW_E5C_mag
			ITEM(ls_weapon_zh73, 500, RIFLE_STOCK); // SWLW_ZH73_Mag
			ITEM(ls_weapon_westarM5, 600, RIFLE_STOCK); // SWLW_WestarM5_Mag
			ITEM(ls_weapon_z6, 800, RIFLE_STOCK); // SWLW_Z6_mag
			ITEM(ls_weapon_westarM5_ugl, 650, RIFLE_STOCK); // SWLW_WestarM5_standard_Mag
			
			ITEM(JLTS_E5C, 500, RIFLE_STOCK); // JLTS_E5C_mag
			ITEM(JLTS_E5C_stock, 500, RIFLE_STOCK); // JLTS_E5C_mag
			ITEM(JLTS_Z6, 600, RIFLE_STOCK); // JLTS_Z6_mag
			
			ITEM(E5C_F, 500, RIFLE_STOCK); // 3AS_130Rnd_EM50_RedPlasma
			ITEM(3AS_DC15L_F, 800, RIFLE_STOCK); // 3AS_200Rnd_EC40_Mag 3AS_200Rnd_EM40_Mag
			ITEM(3AS_WestarM5_F, 600, RIFLE_STOCK); // 3AS_60Rnd_EC50_Mag
			ITEM(3AS_WestarM5_GL, 800, RIFLE_STOCK); // 3AS_60Rnd_EM50_RedPlasma
			
		};

		class riflescw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_rifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			
			ITEM(ls_weapon_dc15a, 225, RIFLE_STOCK); // SWLW_DC15A_Mag
			ITEM(ls_weapon_dc15a_wooden, 225, RIFLE_STOCK); // SWLW_DC15A_Mag
			ITEM(ls_weapon_dc15ac, 225, RIFLE_STOCK); // SWLW_DC15AC_Mag
			ITEM(ls_weapon_dc17m, 500, RIFLE_STOCK); // SWLW_DC17M_Blaster_Mag  SWLW_DC17M_Sniper_Mag SWLW_DC17M_AT_Mag
			ITEM(ls_weapon_westar35c, 225, RIFLE_STOCK); // SWLW_westar35c_Mag
			ITEM(ls_weapon_westar35s, 225, RIFLE_STOCK); // SWLW_Westar35S_Mag
			
			ITEM(JLTS_DC15A_plastic, 225, RIFLE_STOCK); // JLTS_DC15A_mag
			ITEM(JLTS_DC15A, 225, RIFLE_STOCK); // JLTS_DC15A_mag
			ITEM(JLTS_DC15A_ugl_plastic, 330, RIFLE_STOCK); // JLTS_DC15A_mag
			ITEM(JLTS_DC15A_ugl, 330, RIFLE_STOCK); // JLTS_DC15A_mag
			ITEM(JLTS_DW32S, 300, RIFLE_STOCK); // JLTS_DW32S_mag
			ITEM(JLTS_SBB3, 300, RIFLE_STOCK); // JLTS_SBB3_mag

			ITEM(3AS_Arkanian_F, 330, RIFLE_STOCK); // 3AS_40Rnd_EM50_Mag
			ITEM(3AS_Arkanian_Stock_F, 350, RIFLE_STOCK); // 3AS_40Rnd_EM50_Mag
			ITEM(3AS_DC15A_GL, 225, RIFLE_STOCK); // 3AS_45Rnd_EC50_Mag
			ITEM(3AS_DC15A_F, 225, RIFLE_STOCK); // 3AS_45Rnd_EM50_Mag
			ITEM(3AS_DC15C_F, 225, RIFLE_STOCK); // 3AS_40Rnd_EC40_Mag 
			ITEM(3AS_DC15C_GL, 330, RIFLE_STOCK); // 3AS_40Rnd_EM40_Mag
			ITEM(3AS_DC17M_F, 500, RIFLE_STOCK); // 3AS_100Rnd_EC40_mag 3AS_100Rnd_EM40_mag 3AS_5Rnd_EC80_mag 3AS_5Rnd_EM80_mag 3AS_AntiArmour_mag
			ITEM(3AS_DymekBlasterRifle_F, 300, RIFLE_STOCK); // 3AS_45Rnd_EY50_Mag
			
		};

		class sniperriflescw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_sniperRifles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";

			ITEM(ls_weapon_mercenarySniper, 580, RIFLE_STOCK); // SWLW_sniper_Mag
			ITEM(ls_weapon_dc15x, 700, RIFLE_STOCK); // SWLW_DC15X_Mag
			ITEM(ls_weapon_dc15x_wooden, 700, RIFLE_STOCK); // SWLW_DC15X_Mag
			ITEM(ls_weapon_dc15br, 300, RIFLE_STOCK); // SWLW_DC15BR_Mag
			ITEM(ls_weapon_dc15br_wooden, 300, RIFLE_STOCK); // SWLW_DC15BR_Mag
			
			ITEM(JLTS_EPL2, 400, RIFLE_STOCK); // JLTS_EPL2_mag
			
			ITEM(3AS_DymekSniperRifle_F, 400, RIFLE_STOCK); // 3AS_10Rnd_EY80_Mag
			ITEM(3AS_Valken38X_F, 400, RIFLE_STOCK); // 3AS_10Rnd_EC80_Mag 3AS_10Rnd_EM80_Mag
			
		};

		class launcherscw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			
			ITEM(ls_weapon_rps6_loaded, 200, 25);
			ITEM(ls_weapon_rps6, 400, 25);
			ITEM(ls_weapon_e60r_at, 450, 25); 
			ITEM(ls_weapon_e60r_aa, 450, 25); 
			ITEM(ls_weapon_plx1_at, 500, 25); 
			ITEM(ls_weapon_plx1_aa, 500, 25);
			ITEM(ls_weapon_z7, 350, 25); 
			
			ITEM(JLTS_E60R_AT, 500, 25); 
			ITEM(JLTS_PLX1_AT, 500, 25); 
			ITEM(JLTS_RPS6, 450, 25); 
			
			ITEM(3AS_Chaingun, 350, 25); 
			ITEM(3AS_E60R_F, 500, 25); 
			ITEM(3AS_PLX1_F, 500, 25); 
			ITEM(3AS_RPS6_G, 400, 25); 
			ITEM(3AS_RPS6_F, 400, 25); 
			ITEM(3AS_RPS6_HP, 450, 25); 
			
		}; 

		class launchermagazinescw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_launcherAmmo"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(ls_magazine_rps6_heat, 200, 15);
			ITEM(ls_magazine_e60r_at, 250, 15);
			ITEM(ls_magazine_e60r_ap, 200, 15);
			ITEM(ls_magazine_e60r_aa, 200, 15);
			ITEM(ls_magazine_plx1_at, 250, 15);
			ITEM(ls_magazine_plx1_ap, 220, 15);
			ITEM(ls_magazine_plx1_aa, 220, 15);
			ITEM(ls_magazine_z7, 200, 15);
			
			ITEM(JLTS_RPS6_HE_mag, 100, 15);
			ITEM(JLTS_E60R_AT_mag, 250, 15);
			ITEM(JLTS_E60R_AP_mag, 200, 15);
			ITEM(JLTS_PLX1_AT_mag, 250, 15);
			ITEM(JLTS_PLX1_AP_mag, 200, 15);
			ITEM(JLTS_RPS6_mag, 200, 15);
			
			ITEM(3AS_Chaingun_Drum_Mag, 100, 15);
			ITEM(3AS_E60R_AT, 250, 15);
			ITEM(3AS_JLTS_MK43_AT, 300, 15);
			ITEM(3AS_JLTS_MK39_AA, 250, 15);
			ITEM(3AS_JLTS_MK44_HE, 200, 15);
			ITEM(3AS_MK41_AT, 250, 15);
			ITEM(3AS_MK42_HE, 200, 15);
			
		};

		class muzzlescw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";
			
			ITEM(ls_muzzle_dc17m_antiArmor, 90, MZ_STOCK);
			ITEM(ls_muzzle_dc17m_blaster, 70, MZ_STOCK);
			ITEM(ls_muzzle_dc17m_sniper, 80, MZ_STOCK);
			ITEM(ls_muzzle_westar35s_suppressor, 50, MZ_STOCK);
			
			ITEM(3as_muzzle_le_dc15a, 80, MZ_STOCK);
			
		};

		class magazinescw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(ls_magazine_dc15sa, 15, MZ_STOCK);
            ITEM(ls_magazine_dc17s, 20, MZ_STOCK);
            ITEM(ls_magazine_rg4d, 20, MZ_STOCK);
            ITEM(ls_magazine_e5, 25, MZ_STOCK);
            ITEM(ls_magazine_dc15s, 30, MZ_STOCK);
            ITEM(ls_magazine_acpr, 22, MZ_STOCK);
            ITEM(ls_magazine_acpa, 15, MZ_STOCK);
            ITEM(ls_magazine_dp20, 25, MZ_STOCK);
			ITEM(ls_magazine_dp20_slug, 25, MZ_STOCK);
            ITEM(ls_magazine_ls150, 120, MZ_STOCK);
            ITEM(ls_magazine_dc15a, 150, MZ_STOCK);
			ITEM(ls_magazine_e5c, 100, MZ_STOCK);
            ITEM(ls_magazine_zh73, 110, MZ_STOCK);
            ITEM(ls_magazine_westarM5, 160, MZ_STOCK);
            ITEM(ls_magazine_z6, 200, MZ_STOCK);
            ITEM(ls_magazine_dc15br, 70, MZ_STOCK);
            ITEM(ls_magazine_dc17m, 90, MZ_STOCK);
            ITEM(ls_magazine_dc17m_sniper, 100, MZ_STOCK);
			ITEM(ls_magazine_dc17m_antiArmor, 120, MZ_STOCK);
            ITEM(ls_magazine_mercenarySniper, 100, MZ_STOCK);
            ITEM(ls_magazine_dc15x, 110, MZ_STOCK);
			ITEM(3AS_FlamerFuel, 350, MZ_STOCK);
            ITEM(ls_magazine_3Rnd_40mw_IM41, 250, MZ_STOCK);
            ITEM(ls_magazine_westar35sa, 20, MZ_STOCK);
            ITEM(3AS_15Rnd_EC30_mag, 20, MZ_STOCK);
            ITEM(3AS_15Rnd_EM30_mag, 20, MZ_STOCK);
            ITEM(3AS_16Rnd_EC20_Mag, 20, MZ_STOCK);
            ITEM(3AS_16Rnd_EM20_Mag, 20, MZ_STOCK);
            ITEM(3AS_10Rnd_Test_mag, 25, MZ_STOCK);
            ITEM(3AS_16Rnd_EY20_Mag, 20, MZ_STOCK);
            ITEM(JLTS_DC17SA_mag, 20, MZ_STOCK);
			ITEM(JLTS_RG4D_mag, 20, MZ_STOCK);
            ITEM(JLTS_DC15S_mag, 20, MZ_STOCK);
            ITEM(JLTS_DP23_mag, 50, MZ_STOCK);
            ITEM(JLTS_E5_mag, 40, MZ_STOCK);
            ITEM(3AS_60Rnd_EC30_mag, 40, MZ_STOCK);
            ITEM(3AS_60Rnd_EM30_mag, 40, MZ_STOCK);
            ITEM(3AS_60Rnd_EM50_RedPlasma, 40, MZ_STOCK);
            ITEM(JLTS_E5C_mag, 100, MZ_STOCK);
			ITEM(JLTS_Z6_mag, 120, MZ_STOCK);
            ITEM(3AS_130Rnd_EM50_RedPlasma, 100, MZ_STOCK);
            ITEM(3AS_200Rnd_EC40_Mag, 150, MZ_STOCK);
			ITEM(3AS_200Rnd_EM40_Mag, 150, MZ_STOCK);
            ITEM(3AS_60Rnd_EC50_Mag, 100, MZ_STOCK);
			ITEM(ls_magazine_westar35c, 60, MZ_STOCK);
            ITEM(ls_magazine_westar35s, 60, MZ_STOCK);
            ITEM(JLTS_DC15A_mag, 50, MZ_STOCK);
            ITEM(JLTS_DW32S_mag, 70, MZ_STOCK);
            ITEM(JLTS_SBB3_mag, 70, MZ_STOCK);
            ITEM(3AS_45Rnd_EC50_Mag, 50, MZ_STOCK);
            ITEM(3AS_45Rnd_EM50_Mag, 50, MZ_STOCK);
            ITEM(3AS_40Rnd_EC40_Mag, 60, MZ_STOCK);
            ITEM(3AS_40Rnd_EM40_Mag, 60, MZ_STOCK);
            ITEM(3AS_100Rnd_EC40_mag, 70, MZ_STOCK);
			ITEM(3AS_100Rnd_EM40_mag, 70, MZ_STOCK);
            ITEM(3AS_5Rnd_EC80_mag, 90, MZ_STOCK);
            ITEM(3AS_5Rnd_EM80_mag, 90, MZ_STOCK);
            ITEM(3AS_AntiArmour_mag, 250, MZ_STOCK);
            ITEM(3AS_45Rnd_EY50_Mag, 100, MZ_STOCK);
            ITEM(JLTS_EPL2_mag, 75, MZ_STOCK);
            ITEM(3AS_10Rnd_EY80_Mag, 90, MZ_STOCK);
            ITEM(3AS_10Rnd_EC80_Mag, 90, MZ_STOCK);
            ITEM(3AS_10Rnd_EM80_Mag, 90, MZ_STOCK);
			ITEM(3AS_50Rnd_EG40_Mag, 60, MZ_STOCK);
			ITEM(3AS_40Rnd_EM50_Mag, 60, MZ_STOCK);
			ITEM(ls_magazine_3Rnd_40mw_IM92F, 70, 25);
			ITEM(ls_magazine_2Rnd_40mw_IM334K, 70, 25);
			ITEM(ls_magazine_3Rnd_40mw_IM304D, 70, 25);
			ITEM(ls_magazine_2Rnd_40mw_G77_HEAB, 70, 25);
			ITEM(ls_magazine_3Rnd_40mw_G76_HEF, 70, 25);
			ITEM(3AS_6Rnd_HE_Grenade_shell, 70, 25);
			
		};

		class misccw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(ls_explosive_demoCharge_magazine, 450, MISC_STOCK);
			ITEM(ls_explosive_breachCharge_magazine, 300, MISC_STOCK);
			
			ITEM(ls_droidHelmet_b1_geonosis, 1000, MISC_STOCK);
			ITEM(ls_droidHelmet_b1, 1000, MISC_STOCK);
			ITEM(ls_droidHelmet_b1_geonosisOfficer, 1000, MISC_STOCK);
			ITEM(ls_droidHelmet_b1_saboteur, 1000, MISC_STOCK);
			ITEM(ls_droidHelmet_b1_training, 1000, MISC_STOCK);
			ITEM(ls_droidHelmet_b1_crew, 1000, MISC_STOCK);
			ITEM(ls_droidHelmet_b1_officer, 1000, MISC_STOCK);
			ITEM(ls_droidUniform_b1_crew, 1500, MISC_STOCK);
			ITEM(ls_droidUniform_b1, 1500, MISC_STOCK);
			ITEM(ls_droidUniform_b1_security, 1500, MISC_STOCK);
			ITEM(ls_droidUniform_bx, 1500, MISC_STOCK);
			ITEM(ls_droidUniform_b1_pilot, 1500, MISC_STOCK);
			ITEM(3AS_U_CIS_TS, 1500, MISC_STOCK);
			
			ITEM(JLTS_credits_10, 100, MISC_STOCK);
			ITEM(JLTS_credits_50, 500, MISC_STOCK);
			ITEM(JLTS_credits_100, 1000, MISC_STOCK);
			ITEM(JLTS_credits_500, 5000, MISC_STOCK);
			ITEM(JLTS_credits_1000, 10000, MISC_STOCK);
			ITEM(JLTS_credits_5000, 50000, MISC_STOCK);
			ITEM(JLTS_flan_10 , 100, MISC_STOCK);
			ITEM(JLTS_flan_50, 500, MISC_STOCK);
			ITEM(JLTS_flan_100, 1000, MISC_STOCK);
			ITEM(JLTS_flan_500, 5000, MISC_STOCK);
			ITEM(JLTS_flan_1000, 10000, MISC_STOCK);
			ITEM(JLTS_flan_5000, 50000, MISC_STOCK);
			ITEM(JLTS_credit_card, 1138, MISC_STOCK);
			
		};

		class pointerscw{
			displayName = __EVAL(formatText ["%1 %2 %3 %4", localize "STR_A3AU_cw", localize "STR_A3AU_binoculars", localize "STR_A3AU_and", localize "STR_A3AU_nvgs"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemAcc_ca.paa";

			ITEM(ls_clone_electrobinocularsCommander, 70, PN_STOCK);
			ITEM(ls_clone_electrobinocularsCommander_night, 70, PN_STOCK);
			ITEM(ls_clone_electrobinoculars, 70, PN_STOCK);
			ITEM(JLTS_DroidBinocular, 70, PN_STOCK);
			ITEM(3AS_JLTS_CloneScoutElectroBinocular, 70, PN_STOCK);
			ITEM(JLTS_CloneBinocular, 70, PN_STOCK);
			ITEM(JLTS_CloneBinocular_black, 70, PN_STOCK);

			ITEM(ls_mandalorian_rangefinder, 70, PN_STOCK);
			ITEM(lsd_gar_p1Standard_nvg, 70, PN_STOCK);
			ITEM(lsd_gar_standard_nvg, 70, PN_STOCK);
			ITEM(ls_memeNVG_splinterCell, 70, PN_STOCK);
			ITEM(ls_memeNVG_zygerrianDisguise, 70, PN_STOCK);
			
		};

		class specialweaponscw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(3AS_Flamer_Base, 300, RIFLE_STOCK); // 3AS_FlamerFuel
			ITEM(ls_weapon_rd4, 800, RIFLE_STOCK); // SWLW_mag_40mm_1rnd
			ITEM(ls_weapon_mpl57, 800, RIFLE_STOCK); // SWLW_mag_40mm_1rnd
		};

		class opticscw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			
			ITEM(ls_cows_dc17m_sniper, 80, MAGAZINE_STOCK);
			ITEM(ls_cows_mercenarySniper_scope, 100, MAGAZINE_STOCK);
			ITEM(ls_cows_zh73_scope, 80, MAGAZINE_STOCK);
			ITEM(ls_cows_westarM5_scope, 100, MAGAZINE_STOCK);
			ITEM(ls_cows_westar35s_scope, 60, MAGAZINE_STOCK);
			
			ITEM(jlts_dc15x_scope, 100, MAGAZINE_STOCK);
			
			ITEM(3as_optic_lescope_dc15a, 80, MAGAZINE_STOCK);
			ITEM(3as_optic_red_dc15a, 60, MAGAZINE_STOCK);
			ITEM(3as_optic_acog_dc15c, 80, MAGAZINE_STOCK);
			ITEM(3as_optic_reflex_dc15c, 60, MAGAZINE_STOCK);
			ITEM(3as_optic_dc15l, 60, MAGAZINE_STOCK);
			ITEM(3as_optic_holo_dc15s, 60, MAGAZINE_STOCK);
			ITEM(3as_optic_vk38x, 70, MAGAZINE_STOCK);
			ITEM(3as_optic_scope_westarm5, 70, MAGAZINE_STOCK);
			ITEM(3AS_Optic_Arkanian_1_F, 70, MAGAZINE_STOCK);
			ITEM(3AS_Optic_Arkanian_2_F, 70, MAGAZINE_STOCK);
			ITEM(3AS_Optic_Cinnagaran_1_F, 70, MAGAZINE_STOCK);
			
		};

		class underbarrelcw{
	     	displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_bipods"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemBipod_ca.paa";

			ITEM(bipod_01_F_blk, 30, 20);
			ITEM(bipod_02_F_blk, 30, 20);
			ITEM(bipod_03_F_blk, 30, 20);
			
			ITEM(3as_bipod_dc15l_f, 30, 20);
			ITEM(3as_bipod_vk38x_f, 30, 20);
			
		};
