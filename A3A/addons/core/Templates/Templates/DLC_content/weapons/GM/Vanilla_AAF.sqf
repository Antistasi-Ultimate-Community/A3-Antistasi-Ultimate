(_loadoutData get "lightATLaunchers") append [
    ["gm_m72a3_oli", "", "", "", ["gm_1Rnd_66mm_heat_m72a3"], [], ""], 8,
    ["gm_rpg18_oli", "", "", "", ["gm_1Rnd_64mm_heat_pg18"], [], ""], 3,
    ["gm_pzf44_2_oli", "", "", "gm_feroz2x17_pzf44_2_blk", ["gm_1Rnd_44x537mm_heat_dm32_pzf44_2"], [], ""], 3
];
(_loadoutData get "ATLaunchers") append [
    ["gm_pzf3_blk", "", "", "", ["gm_1Rnd_60mm_heat_dm22_pzf3", "gm_1Rnd_60mm_heat_dm32_pzf3", "gm_1Rnd_60mm_heat_dm12_pzf3"], [], ""], 3,
    ["gm_pzf84_oli", "", "", "gm_feroz2x17_pzf84_blk", ["gm_1Rnd_84x245mm_heat_t_DM32_carlgustaf", "gm_1Rnd_84x245mm_heat_t_DM22_carlgustaf", "gm_1Rnd_84x245mm_heat_t_DM12_carlgustaf"], [], ""], 3
];
(_loadoutData get "AALaunchers") append [
    ["gm_fim43_oli", "", "", "", ["gm_1Rnd_70mm_he_m585_fim43"], [], ""], 3
];
//////////////////////////////////////////////////////
(_sfLoadoutData get "slRifles") append [
    ["gm_g11k2_ris_blk","", _sfAccessories, _sfTlOptics, ["gm_50Rnd_473x33mm_B_DM11_g11_blk","gm_50Rnd_473x33mm_B_DM11_g11_blk","gm_50Rnd_473x33mm_B_DM11_g11_blk"], [], ""], 7,
    ["gm_sg551_swat_blk","gm_suppressor_atec150_556mm_blk", _sfAccessories, _sfTlOptics, ["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""], 5
];
(_sfLoadoutData get "rifles") append [
    ["gm_sg551_ris_blk", "gm_suppressor_atec150_556mm_blk","", _sfRifleOptics, ["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""], 4,
    ["gm_sg542_ris_blk", "gm_suppressor_atec150_762mm_blk","", _sfRifleOptics, ["gm_20Rnd_762x51mm_B_T_DM21A2_sg542_blk","gm_20Rnd_762x51mm_AP_DM151_sg542_blk","gm_20Rnd_762x51mm_B_DM41_sg542_blk","gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""], 4
];
(_sfLoadoutData get "marksmanRifles") append [
    ["gm_msg90_blk","","","gm_feroz24_stanagHK_blk",["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"], 2,
    ["gm_msg90a1_blk","gm_suppressor_atec150_762mm_long_blk","","gm_feroz24_stanagHK_blk",["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"], 6
];
(_sfLoadoutData get "sniperRifles") append [
    ["gm_psg1_blk","","","gm_zf6x42_psg1_stanag_blk",["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk"], [], "gm_msg90_bipod_blk"], 5
];
(_sfLoadoutData get "designatedGrenadeLaunchers") append [
    ["gm_hk69a1_blk", "", "", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_HE_Grenade_shell"], ["1Rnd_Smoke_Grenade_shell"], ""], 7,
    ["gm_pallad_d_brn", "", "", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_HE_Grenade_shell"], [], ""], 3
];
//////////////////////////////////////////////////////

(_eliteLoadoutData get "slRifles") append [
    ["gm_g11k2_ris_blk","", _eliteAccessories, _eliteSlOptics, ["gm_50Rnd_473x33mm_B_DM11_g11_blk","gm_50Rnd_473x33mm_B_DM11_g11_blk","gm_50Rnd_473x33mm_B_DM11_g11_blk"], [], ""], 3,
    ["gm_sg551_swat_blk","", _eliteAccessories, _eliteSlOptics, ["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""], 4
];
(_eliteLoadoutData get "rifles") append [
    ["gm_sg551_swat_blk","", _eliteAccessories, _eliteRifleOptics, ["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""], 2,
    ["gm_sg551_ris_blk", "","", _eliteRifleOptics, ["gm_30Rnd_556x45mm_B_T_DM21_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_DM11_sg550_brn","gm_30Rnd_556x45mm_B_T_DM21_sg550_brn"], [], ""], 5,
    ["gm_sg542_ris_blk", "","", _eliteRifleOptics, ["gm_20Rnd_762x51mm_B_T_DM21A2_sg542_blk","gm_20Rnd_762x51mm_AP_DM151_sg542_blk","gm_20Rnd_762x51mm_B_DM41_sg542_blk","gm_20Rnd_762x51mm_B_DM111_sg542_blk"], [], ""], 2
];
(_eliteLoadoutData get "marksmanRifles") append [
    ["gm_msg90_blk","","","gm_feroz24_stanagHK_blk",["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"], 2,
    ["gm_msg90a1_blk","","","gm_feroz24_stanagHK_blk",["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"], 6
];
(_eliteLoadoutData get "sniperRifles") append [
    ["gm_psg1_blk","","","gm_zf6x42_psg1_stanag_blk",["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk"], [], "gm_msg90_bipod_blk"], 6
];   
(_eliteLoadoutData get "designatedGrenadeLaunchers") append [
    ["gm_hk69a1_blk", "", "", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_HE_Grenade_shell"], ["1Rnd_Smoke_Grenade_shell"], ""], 4,
    ["gm_pallad_d_brn", "", "", "", ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Smoke_Grenade_shell", "1Rnd_HE_Grenade_shell"], [], ""], 2
];
(_eliteLoadoutData get "SMGs") append [
    ["gm_mp5n_surefire_blk", "", "gm_surefire_l60_wht_surefire_blk", "gm_rv_stanagClaw_blk", ["gm_60Rnd_9x19mm_B_DM11_mp5a3_blk","gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk"], [], ""], 2,
    ["gm_mp5sd6_blk", "", "", "gm_rv_stanagClaw_blk", ["gm_60Rnd_9x19mm_B_DM11_mp5a3_blk","gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk"], [], ""], 1
];
//////////////////////////////////////////////////////
_militaryRifleOptics append ["gm_c79a1_blk", 1, "gm_blits_ris_blk", 0.5, "gm_rv_ris_blk", 2];
(_militaryLoadoutData get "rifles") append [
    ["gm_c7a1_oli", "", "", "gm_c79a1_oli", ["gm_30Rnd_556x45mm_B_M855_stanag_gry", "gm_30Rnd_556x45mm_B_M855_stanag_gry","gm_30Rnd_556x45mm_B_T_M856_stanag_gry"], [], ""], 4,
    ["gm_g36a1_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk","gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk"], [], ""], 2,
    ["gm_g36e_blk", "", "", "", ["gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk","gm_30Rnd_556x45mm_B_DM11_g36_blk","gm_30Rnd_556x45mm_B_T_DM21_g36_blk"], [], ""], 6,
    ["gm_g3a4a1_ris_oli", "", "", _militaryRifleOptics, ["gm_20Rnd_762x51mm_B_DM111_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], ""], 3,
    ["gm_g3ka4a1_ris_blk", "", "", _militaryRifleOptics, ["gm_20Rnd_762x51mm_B_DM111_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk", "gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], ""], 2
];
_gmMilitaryMG8Optics = ["gm_rv_stanagHK_blk", 2, "gm_blits_StanagHK_blk", 4, "gm_feroz24_stanagHK_blk", 1, "", 1];
(_militaryLoadoutData get "machineGuns") append [
    ["gm_mg3_blk", "", "", "", ["gm_120Rnd_762x51mm_B_T_DM21_mg3_grn","gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn"], [], ""], 4,
    ["gm_mg8a2_blk", "", "", _gmMilitaryMG8Optics, ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli","gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], "gm_g8_bipod_blk"], 5
];
_gmMilitaryMarksmanOptics = ["gm_feroz24_stanagHK_blk", 3, "gm_blits_stanagHK_blk", 1];
(_militaryLoadoutData get "marksmanRifles") append [
    ["gm_msg90_blk","","", _gmMilitaryMarksmanOptics,["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM111_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"], 1,
    ["gm_msg90a1_blk","","", _gmMilitaryMarksmanOptics,["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM111_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"], 3
];
(_militaryLoadoutData get "sniperRifles") append [
    ["gm_psg1_blk","","","gm_zf6x42_psg1_stanag_blk",["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk"], [], "gm_msg90_bipod_blk"], 5
];
//////////////////////////////////////////////////////
_gmMilitiaMP5Optics = ["gm_rv_StanagClaw_blk", 1, "", 4];
(_militiaLoadoutData get "SMGs") append [
    ["gm_mp5n_surefire_blk", "", "gm_surefire_l60_wht_surefire_blk", _gmMilitiaMP5Optics, ["gm_60Rnd_9x19mm_B_DM11_mp5a3_blk","gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk"], [], ""], 3,
    ["gm_mp5a2_blk", "", "", _gmMilitiaMP5Optics, ["gm_30Rnd_9x19mm_B_DM51_mp5_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk","gm_30Rnd_9x19mm_B_DM11_mp5_blk","gm_30Rnd_9x19mm_AP_DM91_mp5_blk"], [], ""], 6
];
_gmMilitiaMG8Optics = ["gm_rv_stanagHK_blk", 3, "gm_blits_StanagHK_blk", 0.5, "gm_feroz24_stanagHK_blk", 1, "", 8];
(_militiaLoadoutData get "machineGuns") append [
    ["gm_mg8a1_blk", "", "", _gmMilitiaMG8Optics, ["gm_100Rnd_762x51mm_B_T_DM21_mg8_oli","gm_100Rnd_762x51mm_B_T_DM21A2_mg8_oli"], [], "gm_g8_bipod_blk"], 8
];
(_militiaLoadoutData get "marksmanRifles") append [
    ["gm_msg90_blk","","",_gmMilitaryMarksmanOptics,["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"], 2,
    ["gm_msg90a1_blk","","",_gmMilitaryMarksmanOptics,["gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk", "gm_20Rnd_762x51mm_B_DM111_g3_blk","gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk"], [], "gm_msg90_bipod_blk"], 6
];
(_militiaLoadoutData get "sniperRifles") append [
    ["gm_psg1_blk","","","gm_zf6x42_psg1_stanag_blk",["gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk","gm_20Rnd_762x51mm_AP_DM151_g3_blk","gm_20Rnd_762x51mm_B_DM41_g3_blk"], [], "gm_msg90_bipod_blk"], 5
];
//////////////////////////////////////////////////////
(_policeLoadoutData get "sidearms") append [
    ["gm_m49_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM51_p210_blk","gm_8Rnd_9x19mm_B_DM11_p210_blk"], [], ""], 0.5,
    ["gm_p1_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p1_blk","gm_8Rnd_9x19mm_B_DM51_p1_blk","gm_8Rnd_9x19mm_BSD_DM81_p1_blk"], [], ""], 0.5,
    ["gm_p1sd_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p1_blk","gm_8Rnd_9x19mm_B_DM51_p1_blk","gm_8Rnd_9x19mm_BSD_DM81_p1_blk"], [], ""], 0.1,
    ["gm_p210_blk", "", "", "", ["gm_8Rnd_9x19mm_B_DM11_p210_blk","gm_8Rnd_9x19mm_B_DM51_p210_blk"], [], ""], 2,
    ["gm_pim_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""], 0.75,
    ["gm_pimb_blk", "", "", "", ["gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk","gm_8Rnd_9x18mm_B_pst_pm_blk"], [], ""], 0.2,
    ["gm_pm63_handgun_blk", "", "", "", ["gm_15Rnd_9x18mm_B_pst_pm63_blk","gm_25Rnd_9x18mm_B_pst_pm63_blk"], [], ""], 0.25
];
_gmPoliceShotgunAccessories = ["gm_surefire_l60_wht_hoseclamp_blk", 1, "", 1.5];
_gmPoliceSMGOptics = ["gm_rv_stanagClaw_blk", 1, "", 3];
(_policeLoadoutData get "SMGs") append [
    ["gm_mp5n_surefire_blk", "", "gm_surefire_l60_wht_surefire_blk", _gmPoliceSMGOptics, ["gm_60Rnd_9x19mm_B_DM11_mp5a3_blk","gm_60Rnd_9x19mm_AP_DM91_mp5a3_blk","gm_30Rnd_9x19mm_B_DM51_mp5_blk"], [], ""], 3,
    ["gm_hk512_wud", "", _gmPoliceShotgunAccessories, "", ["gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug","gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug"], [], ""], 1.5,
    ["gm_hk512_ris_wud", "", _gmPoliceShotgunAccessories, _policeSMGOptics, ["gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug","gm_7rnd_12ga_hk512_pellet","gm_7rnd_12ga_hk512_slug"], [], ""], 3,
    ["gm_mp2a1_blk", "", "", "", ["gm_32Rnd_9x19mm_B_DM51_mp2_blk","gm_32Rnd_9x19mm_B_DM11_mp2_blk","gm_32Rnd_9x19mm_AP_DM91_mp2_blk"], [], ""], 3,
    ["gm_pm63_blk", "", "", "", ["gm_25Rnd_9x18mm_B_pst_pm63_blk","gm_15Rnd_9x18mm_B_pst_pm63_blk"], [], ""], 0.5
];
