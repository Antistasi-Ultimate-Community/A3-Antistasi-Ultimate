//Clone Wars

		class handgunscw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_handguns"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";

			ITEM(SWLW_DC15SA, 110, PISTOL_STOCK); //AMMO: SWLW_DC15SA_Mag
			ITEM(SWLW_DC17, 100, PISTOL_STOCK); //AMMO: SWLW_DC17_Mag
			ITEM(SWLW_RG4D, 100, PISTOL_STOCK); //AMMO: SWLW_RG4D_Mag
			ITEM(ls_weapon_dualDC17_secondary, 150, PISTOL_STOCK); //AMMO: ls_mag_dc17dual_20rnd
			ITEM(ls_weapon_dc17sidearm_fordoCustom, 120, PISTOL_STOCK); //AMMO: ls_mag_dc17sidearm
			ITEM(ls_weapon_dc17sidearm, 100, PISTOL_STOCK); //AMMO: ls_mag_dc17sidearm
			ITEM(ls_weapon_electrostaff_melee, 300, PISTOL_STOCK); //AMMO: 
			ITEM(ls_weapon_verpinePowerLance_melee, 400, PISTOL_STOCK); //AMMO: 
			ITEM(SWLW_Westar35SA, 100, PISTOL_STOCK); //AMMO: SWLW_westar35sa_Mag
			ITEM(ls_weapon_westar35sa_secondary, 100, PISTOL_STOCK); //AMMO: SWLW_westar35sa_Mag

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

			ITEM(SWLW_E5, 185, RIFLE_STOCK); // SWLW_E5_Mag
			ITEM(SWLW_DC15s, 200, RIFLE_STOCK); // SWLW_DC15s_Mag
            ITEM(SWLW_ACPR, 190, RIFLE_STOCK); // SWLW_acpr_Mag
			ITEM(SWLW_ACPA, 125, RIFLE_STOCK); // SWLW_acpa_Mag
			ITEM(SWLW_DP20, 210, RIFLE_STOCK); // SWLW_DP20_Mag
			
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

			ITEM(SWLW_LS150, 550, RIFLE_STOCK); // SWLW_LS150_mag
			ITEM(ls_weapon_ls150_primary, 550, RIFLE_STOCK); // SWLW_LS150_mag
			ITEM(SWLW_DC15SAW, 550, RIFLE_STOCK); // SWLW_DC15SAW_mag
			ITEM(SWLW_E5C, 500, RIFLE_STOCK); // SWLW_E5C_mag
			ITEM(SWLW_ZH73, 500, RIFLE_STOCK); // SWLW_ZH73_Mag
			ITEM(SWLW_WestarM5, 600, RIFLE_STOCK); // SWLW_WestarM5_Mag
			ITEM(SWLW_Z6, 800, RIFLE_STOCK); // SWLW_Z6_mag
			ITEM(SWLW_WestarM5_ugl, 600, RIFLE_STOCK); // SWLW_WestarM5_standard_Mag
			ITEM(SWLW_DC15SAW_wooden, 550, RIFLE_STOCK); // SWLW_DC15SAW_mag
			
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
			
			ITEM(SWLW_DC15A, 225, RIFLE_STOCK); // SWLW_DC15A_Mag
			ITEM(SWLW_DC15A_wooden, 225, RIFLE_STOCK); // SWLW_DC15A_Mag
			ITEM(SWLW_DC15A_ugl, 330, RIFLE_STOCK); // SWLW_DC15A_Mag
			ITEM(SWLW_DC15A_ugl_wooden, 330, RIFLE_STOCK); // SWLW_DC15A_Mag
			ITEM(SWLW_DC15AC, 225, RIFLE_STOCK); // SWLW_DC15AC_Mag
			ITEM(SWLW_DC17M, 500, RIFLE_STOCK); // SWLW_DC17M_Blaster_Mag  SWLW_DC17M_Sniper_Mag SWLW_DC17M_AT_Mag
			ITEM(ls_weapon_dc15a_wooden, 225, RIFLE_STOCK); // SWLW_DC15A_Mag
			ITEM(ls_weapon_dc15a, 225, RIFLE_STOCK); // SWLW_DC15A_Mag
			ITEM(SWLW_westar35c, 225, RIFLE_STOCK); // SWLW_westar35c_Mag
			ITEM(ls_weapon_westar35c_primary, 225, RIFLE_STOCK); // SWLW_westar35c_Mag
			ITEM(SWLW_Westar35S, 225, RIFLE_STOCK); // SWLW_Westar35S_Mag
			ITEM(ls_weapon_westar35s_primary, 225, RIFLE_STOCK); // SWLW_Westar35S_Mag
			
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

			ITEM(SWLW_sniper, 580, RIFLE_STOCK); // SWLW_sniper_Mag
			ITEM(SWLW_DC15X, 700, RIFLE_STOCK); // SWLW_DC15X_Mag
			ITEM(SWLW_DC15X_wooden, 700, RIFLE_STOCK); // SWLW_DC15X_Mag
			ITEM(SWLW_DC15BR, 300, RIFLE_STOCK); // SWLW_DC15BR_Mag
			
			ITEM(JLTS_EPL2, 400, RIFLE_STOCK); // JLTS_EPL2_mag
			
			ITEM(3AS_DymekSniperRifle_F, 400, RIFLE_STOCK); // 3AS_10Rnd_EY80_Mag
			ITEM(3AS_Valken38X_F, 400, RIFLE_STOCK); // 3AS_10Rnd_EC80_Mag 3AS_10Rnd_EM80_Mag
			
		};

		class launcherscw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_launchers"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\secondaryWeapon_ca.paa";
			
			ITEM(ls_weapon_rps6_disposable, 200, 25);
			ITEM(ls_weapon_rps6, 400, 25);
			ITEM(SWLW_E60R, 450, 25); 
			ITEM(SWLW_E60R_AA, 450, 25); 
			ITEM(SWLW_PLX1, 500, 25); 
			ITEM(SWLW_PLX1_AA, 500, 25); 
			ITEM(ls_weapon_at_plx1, 500, 25); 
			ITEM(ls_weapon_aa_plx1, 500, 25); 
			ITEM(SWLW_Z7, 350, 25); 
			
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
			
			ITEM(ls_mag_rpg_1rnd, 200, 15);
			ITEM(SWLW_e60r_at_mag, 250, 15);
			ITEM(SWLW_e60r_aa_mag, 200, 15);
			ITEM(SWLW_plx1_at_mag, 250, 15);
			ITEM(SWLW_plx1_aa_mag, 220, 15);
			ITEM(SWLW_Z7_mag, 200, 15);
			
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

		class riflegrenadescw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_glGrenades"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(SWLW_DC15A_UGL_Mag, 70, 25);
			ITEM(SWLW_DC15A_UGL_smoke_white_Mag, 50, 25);
			ITEM(SWLW_DC15A_UGL_flare_white_Mag, 50, 25);
			ITEM(SWLW_WestarM5_g_Mag, 70, 25);
			
			ITEM(3AS_6Rnd_HE_Grenade_shell, 70, 25);
			
		};

		class muzzlescw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_muzzles"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemMuzzle_ca.paa";
			
			ITEM(swlw_attachment_dc17m_at, 90, MZ_STOCK);
			ITEM(swlw_attachment_dc17m_blaster, 70, MZ_STOCK);
			ITEM(swlw_attachment_dc17m_sniper, 80, MZ_STOCK);
			
			ITEM(3as_muzzle_le_dc15a, 80, MZ_STOCK);
			
		};

		class magazinescw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_magazines"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargoMag_ca.paa";
			
			ITEM(SWLW_DC15SA_Mag, 15, MZ_STOCK);
            ITEM(SWLW_DC17_Mag, 20, MZ_STOCK);
            ITEM(SWLW_RG4D_Mag, 20, MZ_STOCK);
            ITEM(SWLW_E5_Mag, 25, MZ_STOCK);
            ITEM(SWLW_DC15s_Mag, 30, MZ_STOCK);
            ITEM(SWLW_acpr_Mag, 22, MZ_STOCK);
            ITEM(SWLW_acpa_Mag, 15, MZ_STOCK);
            ITEM(SWLW_DP20_Mag, 25, MZ_STOCK);
            ITEM(SWLW_LS150_mag, 120, MZ_STOCK);
            ITEM(SWLW_DC15SAW_mag, 150, MZ_STOCK);
			ITEM(SWLW_E5C_mag, 100, MZ_STOCK);
            ITEM(SWLW_ZH73_Mag, 110, MZ_STOCK);
            ITEM(SWLW_WestarM5_Mag, 160, MZ_STOCK);
            ITEM(SWLW_DC15A_Mag, 80, MZ_STOCK);
            ITEM(SWLW_Z6_mag, 200, MZ_STOCK);
            ITEM(SWLW_DC15AC_Mag, 75, MZ_STOCK);
            ITEM(SWLW_DC15BR_Mag, 70, MZ_STOCK);
            ITEM(SWLW_DC17M_Blaster_Mag, 90, MZ_STOCK);
            ITEM(SWLW_DC17M_Sniper_Mag, 100, MZ_STOCK);
			ITEM(SWLW_DC17M_AT_Mag, 120, MZ_STOCK);
            ITEM(SWLW_sniper_Mag, 100, MZ_STOCK);
            ITEM(SWLW_DC15X_Mag, 110, MZ_STOCK);
			ITEM(3AS_FlamerFuel, 350, MZ_STOCK);
            ITEM(SWLW_mag_40mm_1rnd, 250, MZ_STOCK);
			
			ITEM(ls_mag_dc17dual_20rnd, 25, MZ_STOCK);
            ITEM(ls_mag_dc17sidearm, 20, MZ_STOCK);
            ITEM(SWLW_westar35sa_Mag, 20, MZ_STOCK);
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
            ITEM(SWLW_WestarM5_standard_Mag, 90, MZ_STOCK);
            ITEM(JLTS_E5C_mag, 100, MZ_STOCK);
			ITEM(JLTS_Z6_mag, 120, MZ_STOCK);
            ITEM(3AS_130Rnd_EM50_RedPlasma, 100, MZ_STOCK);
            ITEM(3AS_200Rnd_EC40_Mag, 150, MZ_STOCK);
			ITEM(3AS_200Rnd_EM40_Mag, 150, MZ_STOCK);
            ITEM(3AS_60Rnd_EC50_Mag, 100, MZ_STOCK);
			ITEM(SWLW_westar35c_Mag, 60, MZ_STOCK);
            ITEM(SWLW_Westar35S_Mag, 60, MZ_STOCK);
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
			
		};

		class misccw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_misc"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";

			ITEM(SWLW_clones_spec_demo_mag, 450, MISC_STOCK);
			ITEM(SWLW_clones_spec_breach_mag, 400, MISC_STOCK);
			
			
			ITEM(lsd_cis_oom_Geonosis_helmet, 1000, MISC_STOCK);
			ITEM(ls_cis_b1_helmet, 1000, MISC_STOCK);
			ITEM(lsd_cis_b1Geonosis_helmet, 1000, MISC_STOCK);
			ITEM(lsd_cis_b1Saboteur_helmet, 1000, MISC_STOCK);
			ITEM(lsd_cis_b1Training_helmet, 1000, MISC_STOCK);
			ITEM(lsd_cis_oomCrew_helmet, 1000, MISC_STOCK);
			ITEM(lsd_cis_oomOfficer_helmet, 1000, MISC_STOCK);
			ITEM(lsd_cis_oomCrew_uniform, 1500, MISC_STOCK);
			ITEM(ls_cis_b1Droid_uniform, 1500, MISC_STOCK);
			ITEM(lsd_cis_bxDroid_uniform, 1500, MISC_STOCK);
			ITEM(lsd_cis_oomPilot_uniform, 1500, MISC_STOCK);
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

			ITEM(SWLB_clone_commander_binocular, 70, PN_STOCK);
			ITEM(SWLB_clone_commander_binocular_night, 70, PN_STOCK);
			ITEM(SWLB_clone_binocular, 70, PN_STOCK);
			ITEM(JLTS_DroidBinocular, 70, PN_STOCK);
			ITEM(3AS_JLTS_CloneScoutElectroBinocular, 70, PN_STOCK);
			ITEM(JLTS_CloneBinocular, 70, PN_STOCK);
			ITEM(JLTS_CloneBinocular_black, 70, PN_STOCK);

			ITEM(ls_mandalorian_rangefinder_nvg, 70, PN_STOCK);
			ITEM(lsd_gar_p1Rangefinder_nvg, 70, PN_STOCK);
			ITEM(lsd_gar_rangefinder_nvg, 70, PN_STOCK);
			ITEM(ls_memefor_splinterCell_nvg, 70, PN_STOCK);
			ITEM(ls_memefor_ZygerrianDisguise, 70, PN_STOCK);
			
		};

		class specialweaponscw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_specialWeapons"]);
			picture = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryWeapon_ca.paa";
			ITEM(3AS_Flamer_Base, 300, RIFLE_STOCK); // 3AS_FlamerFuel
			ITEM(SWLW_GL, 800, RIFLE_STOCK); // SWLW_mag_40mm_1rnd
		};

		class opticscw{
			displayName = __EVAL(formatText ["%1 %2", localize "STR_A3AU_cw", localize "STR_A3AU_sights"]);
			picture = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
			
			ITEM(swlw_attachment_scope_dc17m_sniper, 80, MAGAZINE_STOCK);
			ITEM(swlw_sniper_scope, 100, MAGAZINE_STOCK);
			ITEM(swlw_zh73_scope, 80, MAGAZINE_STOCK);
			ITEM(swlw_westarm5_scope, 100, MAGAZINE_STOCK);
			ITEM(swlw_westar35s_scope, 60, MAGAZINE_STOCK);
			ITEM(ls_acc_dcholosight_blue, 60, MAGAZINE_STOCK);
			ITEM(ls_acc_dcholosight_green, 60, MAGAZINE_STOCK);
			ITEM(ls_acc_dcholosight_red, 60, MAGAZINE_STOCK);
			ITEM(ls_acc_dcholosight_yellow, 60, MAGAZINE_STOCK);
			
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
