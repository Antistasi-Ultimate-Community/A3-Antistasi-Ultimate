(_loadoutData get "antiInfantryGrenades") append [
    "gm_handgrenade_conc_dm51","gm_handgrenade_conc_dm51a1","gm_handgrenade_frag_dm41","gm_handgrenade_frag_dm41a1","gm_handgrenade_frag_dm51","gm_handgrenade_frag_dm51a1","gm_handgrenade_frag_m26",
    "gm_handgrenade_frag_m26a1", "gm_handgrenade_frag_rgd5"
];
(_loadoutData get "smokeGrenades") append [
    "gm_smokeshell_wht_gc",
    "gm_smokeshell_wht_dm25"
];
(_loadoutData get "signalsmokeGrenades") append [
    "gm_smokeshell_blk_gc","gm_smokeshell_blu_gc","gm_smokeshell_grn_gc","gm_smokeshell_org_gc","gm_smokeshell_red_gc","gm_smokeshell_yel_gc","gm_smokeshell_grn_dm21",
    "gm_smokeshell_red_dm23","gm_smokeshell_yel_dm26","gm_smokeshell_org_dm32"
];
(_loadoutData get "lightExplosives") append [
    "gm_explosive_plnp_charge"
];
(_loadoutData get "heavyExplosives") append [
    "gm_explosive_petn_charge"
];
(_loadoutData get "ATMines") append [
    "gm_mine_at_dm21","gm_mine_at_tm46"
];
(_loadoutData get "APMines") append [
    "gm_mine_ap_dm31"
];

_rpgs append [
    ["gm_m72a3_oli", "", "", "", ["gm_1Rnd_66mm_heat_m72a3"], [], ""],
    ["gm_rpg18_oli", "", "", "", ["gm_1Rnd_64mm_heat_pg18"], [], ""],
    ["gm_pzf44_2_oli", "", "", "gm_feroz2x17_pzf44_2_blk", ["gm_1Rnd_44x537mm_heat_dm32_pzf44_2", "gm_1Rnd_44x537mm_heat_dm32_pzf44_2"], [], ""]
];
(_loadoutData get "lightHELaunchers") append [
    ["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm22_pzf3", "gm_1Rnd_60mm_heat_dm32_pzf3"], [], ""],
    ["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf84_blk", ["gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12a1_carlgustaf","gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf"], [], ""]
];
(_loadoutData get "AALaunchers") append [
    ["gm_fim43_oli", "", "", "", ["gm_1Rnd_70mm_he_m585_fim43"], [], ""]
];
_gls append [
	["gm_g3a4a1_ris_oli", "", "", "optic_MRCO", ["gm_40Rnd_762x51mm_B_T_DM21_g3_blk","gm_40Rnd_762x51mm_B_T_DM21A1_g3_blk","gm_40Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk"], ["gm_1rnd_67mm_heat_dm22a1_g3"], ""],
	["gm_akm_pallad_wud", "", "", "gm_zvn64_ak", ["gm_30Rnd_762x39mm_B_57N231_ak47_blk","gm_30Rnd_762x39mm_B_57N231_ak47_blk","gm_30Rnd_762x39mm_B_57N231_ak47_blk"], ["1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell"], ""]
];
_rifles append [
	["gm_ak74n_wud", "", "", "",  ["gm_30Rnd_545x39mm_B_7N6_ak74_org", "gm_30Rnd_545x39mm_B_7N6_ak74_org", "gm_30Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_akm_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
	["gm_akmn_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
	["gm_akms_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
	["gm_akmsl_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
	["gm_akmsn_wud", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk", "gm_30Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
	["gm_hk33a2_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
	["gm_hk33a3_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
	["gm_hk33ka2_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
	["gm_hk33ka3_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
	["gm_hk33sg1_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],//
	["gm_g3a3a1_ris_blk", "", "", "",  ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
	["gm_g3a4a1_ris_blk", "", "", "",  ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
	["gm_g3a4a1_ris_blk", "", "", "",  ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
	["gm_m16a1_blk", "","","",["gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""],
	["gm_m16a2_blk", "","","",["gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""]
];
_carbines append [
    ["gm_mp5n_surefire_blk", "", "gm_surefire_l60_wht_surefire_blk", "gm_rv_stanagClaw_blk", ["gm_60Rnd_9x19mm_B_DM11_mp5a3_blk","gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk"], [], ""],
    ["gm_mp5sd6_blk", "", "gm_surefire_l60_ir_hoseclamp_blk", "gm_rv_stanagClaw_blk", ["gm_60Rnd_9x19mm_B_DM11_mp5a3_blk","gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk"], [], ""],
	["gm_mp5a2_blk", "", "", "gm_rv_stanagClaw_blk", ["gm_30Rnd_9x19mm_B_DM51_mp5_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk","gm_30Rnd_9x19mm_B_DM11_mp5_blk","gm_30Rnd_9x19mm_AP_DM91_mp5_blk"], [], ""],
    ["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_B_DM51_mp2_blk","gm_32Rnd_9x19mm_B_DM11_mp2_blk","gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""],
	["gm_g3ka4a1_ris_blk", "", "", "optic_ACO_grn_smg",  ["gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21_g3_blk"], [], ""],
	["gm_hk53a2_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
	["gm_hk53a3_blk", "", "", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
	["gm_mpm85_blk", "", "gm_surefire_l60_wht_surefire_blk", "",  ["gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk", "gm_30Rnd_556x45mm_B_DM11_hk33_blk"], [], ""],
	["gm_mpiaks74nk_brn", "", "", "",  ["gm_30Rnd_545x39mm_B_7N6_ak74_org", "gm_30Rnd_545x39mm_B_7N6_ak74_org", "gm_30Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_mpikms72k_brn", "", "", "",  ["gm_30Rnd_762x39mm_B_57N231_mpikm_blk", "gm_30Rnd_762x39mm_B_57N231_mpikm_blk", "gm_30Rnd_762x39mm_B_57N231_mpikm_blk"], [], ""]
];
_tunedRifles append [
    ["gm_g11k2_ris_blk","","acc_pointer_IR","optic_Nightstalker",["gm_50Rnd_473x33mm_B_DM11_g11_blk","gm_50Rnd_473x33mm_B_DM11_g11_blk","gm_50Rnd_473x33mm_B_DM11_g11_blk"], [], ""],
    ["gm_sg551_swat_blk","","acc_pointer_IR","optic_Hamr",["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""],
	["gm_sg551_ris_blk", "","","optic_Hamr",["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""],
    ["gm_sg542_ris_blk", "","","optic_Hamr",["gm_20Rnd_762x51mm_B_T_DM21A2_sg542_blk","gm_20Rnd_762x51mm_AP_DM151_sg542_blk","gm_20Rnd_762x51mm_B_DM41_sg542_blk","gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""],
	["gm_m16a1_blk", "","","gm_colt4x20_ar15_blk",["gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""],
	["gm_m16a2_blk", "","","gm_colt4x20_ar15_blk",["gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry","gm_20Rnd_556x45mm_B_M193_stanag_gry"], [], ""],
	["gm_mpikms72ksd_brn", "","gm_flashlightp2_wht_akkhandguard_blu","gm_pka_dovetail_blk",["gm_30Rnd_762x39mm_BSD_57N231U_mpikm_blk","gm_30Rnd_762x39mm_BSD_57N231U_mpikm_blk","gm_30Rnd_762x39mm_BSD_57N231U_mpikm_blk"], [], ""]
];
_marksmanRifles append [
    ["gm_msg90_blk","","","gm_feroz24_stanagHK_blk",["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"],
    ["gm_msg90a1_blk","","","gm_feroz24_stanagHK_blk",["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"],
	["gm_psg1_blk","","","gm_zf6x42_psg1_stanag_blk",["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk"], [], "gm_msg90_bipod_blk"],
	["gm_svd_wud","","","gm_pso6x36_1_dovetail_blk",["gm_10Rnd_762x54mmR_AP_7N1_svd_blk","gm_10Rnd_762x54mmR_API_7bz3_svd_blk","gm_10Rnd_762x54mmR_B_T_7t2_svd_blk"], [], "gm_msg90_bipod_blk"]
];
_enforcerRifles append [
    ["gm_c7a1_oli", "", "", "optic_Hamr", ["gm_30Rnd_556x45mm_B_M855_stanag_gry","gm_30Rnd_556x45mm_B_T_M856_stanag_gry","gm_30Rnd_556x45mm_B_M193_stanag_gry","gm_30Rnd_556x45mm_B_T_M196_stanag_gry"], [], ""],
    ["gm_g36a1_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk","gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk"], [], ""],
    ["gm_g36e_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk","gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk"], [], ""],
    ["gm_g3ka4a1_ris_blk", "", "", "gm_c79a1_blk", ["gm_40Rnd_762x51mm_AP_DM151_g3_blk","gm_40Rnd_762x51mm_B_DM41_g3_blk","gm_40Rnd_762x51mm_B_DM111_g3_blk","gm_40Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], ""],
	["gm_hk512_wud", "", "gm_surefire_l60_wht_hoseclamp_blk", "", ["gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug","gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug"], [], ""],
    ["gm_hk512_ris_wud", "", "gm_surefire_l60_wht_hoseclamp_blk", "optic_Aco", ["gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug","gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug"], [], ""]
];
_mgs append [
    ["gm_mg3_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21_mg3_grn","gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn"], [], ""],
	["gm_mg8a1_blk", "", "", "gm_colt4x20_stanagClaw_blk", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli","gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], "gm_g8_bipod_blk"],
    ["gm_mg8a2_blk", "", "", "gm_blits_stanagHK_blk", ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli","gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], "gm_g8_bipod_blk"],
	["gm_hmgpkm_prp", "", "", "", ["gm_100Rnd_762x54mmR_B_T_7t2_pk_grn","gm_100Rnd_762x54mmR_B_T_7t2_pk_grn"], [], ""],
	["gm_lmgrpk74n_blk", "gm_suppressor_pbs4_545mm_blk", "gm_flashlightp2_wht_akhandguard_blu", "gm_pka_dovetail_blk", ["gm_45Rnd_545x39mm_B_7N6_ak74_org","gm_45Rnd_545x39mm_B_7N6_ak74_org","gm_45Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_lmgrpk_brn", "gm_suppressor_pbs1_762mm_blk", "gm_flashlightp2_wht_akkhandguard_blu", "gm_pka_dovetail_blk", ["gm_75Rnd_762x39mm_B_57N231_mpikm_blk","gm_75Rnd_762x39mm_B_57N231_mpikm_blk"], [], ""],
	["gm_rpk74n_wud", "gm_suppressor_pbs4_545mm_blk", "", "gm_zfk4x25_blk", ["gm_45Rnd_545x39mm_B_7N6_ak74_org","gm_45Rnd_545x39mm_B_7N6_ak74_org","gm_45Rnd_545x39mm_B_7N6_ak74_org"], [], ""],
	["gm_rpk_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zvn64_rpk", ["gm_75Rnd_762x39mm_B_57N231_ak47_blk","gm_75Rnd_762x39mm_B_57N231_ak47_blk"], [], ""],
	["gm_rpkn_wud", "gm_suppressor_pbs1_762mm_blk", "", "gm_zfk4x25_blk", ["gm_75Rnd_762x39mm_B_57N231_ak47_blk","gm_75Rnd_762x39mm_B_57N231_ak47_blk"], [], ""]
];
_pistols append [
    ["gm_m49_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk","gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""],
    ["gm_p1_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p1_blk","gm_8Rnd_9x19mm_B_DM51_p1_blk","gm_8Rnd_9x19mm_BSD_DM81_p1_blk"], [], ""],
    ["gm_p1sd_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p1_blk","gm_8Rnd_9x19mm_B_DM51_p1_blk","gm_8Rnd_9x19mm_BSD_DM81_p1_blk"], [], ""],
    ["gm_p210_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p210_blk","gm_8Rnd_9x19mm_B_DM51_p210_blk"], [], ""],
    ["gm_pim_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""],
    ["gm_pimb_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""],
    ["gm_pm63_handgun_blk", "", "", "", ["gm_15Rnd_9x18mm_B_pst_pm63_blk","gm_25Rnd_9x18mm_B_pst_pm63_blk"], [], ""]
];