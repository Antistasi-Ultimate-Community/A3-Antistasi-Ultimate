_psrlAttachments = ["", 2, "acc_pointer_IR", 1];

(_loadoutData get "lightATLaunchers") append [
    ["launch_PSRL1_digi_RF", "", _psrlAttachments, "", ["PSRL1_AT_RF","PSRL1_AT_RF","PSRL1_FRAG_RF"], [], ""], 4,
    ["launch_PSRL1_digi_RF", "", _psrlAttachments, "", ["PSRL1_AT_RF","PSRL1_AT_RF","PSRL1_HE_RF"], [], ""], 2,

    ["launch_PSRL1_PWS_digi_RF", "", _psrlAttachments, "", ["PSRL1_AT_RF","PSRL1_AT_RF","PSRL1_FRAG_RF"], [], ""], 2,
    ["launch_PSRL1_PWS_digi_RF", "", _psrlAttachments, "", ["PSRL1_AT_RF","PSRL1_AT_RF","PSRL1_HE_RF"], [], ""], 1
];

//dedicated AT troops get the heavier AT rockets as well as more common PWS-equipped launchers
(_loadoutData get "ATLaunchers") append [
    ["launch_PSRL1_digi_RF", "",_psrlAttachments, "", ["PSRL1_HEAT_RF","PSRL1_HEAT_RF","PSRL1_AT_RF"], [], ""], 2,
    ["launch_PSRL1_digi_RF", "",_psrlAttachments, "", ["PSRL1_HEAT_RF","PSRL1_AT_RF","PSRL1_HE_RF"], [], ""], 1,

    ["launch_PSRL1_PWS_digi_RF", "", _psrlAttachments, "", ["PSRL1_HEAT_RF","PSRL1_HEAT_RF","PSRL1_AT_RF"], [], ""], 4,
    ["launch_PSRL1_PWS_digi_RF", "", _psrlAttachments, "", ["PSRL1_HEAT_RF","PSRL1_AT_RF","PSRL1_HE_RF"], [], ""], 2
];

_sfSMGOptics append ["optic_VRCO_RF", 4];
(_sfLoadoutData get "SMGs") append [
    ["SMG_01_black_RF","muzzle_snds_acp", "acc_flashlight_smg_01", _sfSMGOptics,["30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], [], ""], 1
];
_sfTlOptics append ["optic_VRCO_RF", 0.5];
_sfRifleOptics append ["optic_VRCO_RF", 1.25];
//////////////////////////////////////////////////////
_eliteSMGOptics append ["optic_VRCO_RF", 5];
(_eliteLoadoutData get "SMGs") append [
    ["SMG_01_black_RF","","acc_flashlight_smg_01", _eliteSMGOptics,["30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], [], ""], 2.5
];
_eliteSlOptics append ["optic_VRCO_RF", 0.5];
_eliteRifleOptics append ["optic_VRCO_RF", 3.5];
//////////////////////////////////////////////////////
_militarySMGOptics append ["optic_VRCO_RF", 3];
(_militaryLoadoutData get "SMGs") append [
    ["SMG_01_black_RF","","acc_flashlight_smg_01", _militarySMGOptics,["30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], [], ""], 2.5
];
_militarySlRifleOptics append ["optic_VRCO_RF", 1];
_militaryRifleOptics append ["optic_VRCO_RF", 2.5];
//////////////////////////////////////////////////////
(_policeLoadoutData get "SMGs") append [
    ["SMG_01_black_RF","","acc_flashlight_smg_01", _policeSMGOptics,["30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], [], ""], 1.5 
];
//////////////////////////////////////////////////////
(_militiaLoadoutData get "SMGs") append [
    ["SMG_01_black_RF","","acc_flashlight_smg_01", _militiaSMGOptics,["30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_Tracer_Green"], [], ""], 1
];
(_militiaLoadoutData get "marksmanRifles") append [
    ["srifle_h6_digi_rf", "", "", _militiaMarksmanOptics,["10Rnd_556x45_AP_Stanag_RF","10Rnd_556x45_AP_Stanag_RF","20Rnd_556x45_AP_Stanag_RF","20Rnd_556x45_AP_Stanag_RF"], [], ""], 7.5,
    ["srifle_h6_oli_rf", "", "", _militiaMarksmanOptics,["10Rnd_556x45_AP_Stanag_RF","10Rnd_556x45_AP_Stanag_RF","20Rnd_556x45_AP_Stanag_RF","20Rnd_556x45_AP_Stanag_RF"], [], ""], 7.5
];
(_militiaLoadoutData get "sniperRifles") append [
    ["srifle_h6_digi_rf", "", "", _militiaSniperOptics,["10Rnd_556x45_AP_Stanag_RF","10Rnd_556x45_AP_Stanag_RF","20Rnd_556x45_AP_Stanag_RF","20Rnd_556x45_AP_Stanag_RF"], [], ""], 10,
    ["srifle_h6_oli_rf", "", "", _militiaSniperOptics,["10Rnd_556x45_AP_Stanag_RF","10Rnd_556x45_AP_Stanag_RF","20Rnd_556x45_AP_Stanag_RF","20Rnd_556x45_AP_Stanag_RF"], [], ""], 10
];
//////////////////////////////////////////////////////
_rfSFDeagleOptics = ["optic_VRCO_pistol_RF", 8, "optic_rds_RF", 2]; // Better than making variants of each Deagle with different Optics and separately balancing their weights.
(_sfLoadoutData get "sidearms") append [
    ["hgun_Glock19_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", ["17Rnd_9x19_Mag_RF","33Rnd_9x19_Mag_RF"], [], ""], 2.5,
    ["hgun_Glock19_auto_Tan_RF", "muzzle_snds_L", "acc_flashlight_IR_pistol_RF", "optic_MRD_tan_RF", ["17Rnd_9x19_Mag_RF","33Rnd_9x19_Mag_RF","65Rnd_9x19_Mag_RF"], [], ""], 7.5,
    ["hgun_DEagle_RF", "", "", _rfSFDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 5, 
    ["hgun_DEagle_classic_RF", "", "", _rfSFDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 2,
    ["hgun_DEagle_copper_RF", "", "", _rfSFDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.5,
    ["hgun_DEagle_bronze_RF", "", "", _rfSFDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 1,
    ["hgun_DEagle_camo_RF", "", "", _rfSFDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.5,
    ["hgun_DEagle_gold_RF", "", "", _rfSFDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.25
    // SpecOps use the Deagle enough where it appears as frequently as other sidearms.
];
_rfEliteDeagleOptics = ["optic_VRCO_pistol_RF", 6, "optic_rds_RF", 4];
_rfEliteGlockOptics = ["optic_MRD_tan_RF", 3, "", 1];
(_eliteLoadoutData get "sidearms") append [
    ["hgun_Glock19_Tan_RF", "", "acc_flashlight_IR_pistol_RF", _rfEliteGlockOptics, ["17Rnd_9x19_Mag_RF","33Rnd_9x19_Mag_RF"], [], ""], 7,
    ["hgun_Glock19_auto_Tan_RF", "", "acc_flashlight_IR_pistol_RF", _rfEliteGlockOptics, ["17Rnd_9x19_Mag_RF","33Rnd_9x19_Mag_RF","65Rnd_9x19_Mag_RF"], [], ""], 3,
    ["hgun_DEagle_RF", "", "", _rfEliteDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 1,
    ["hgun_DEagle_bronze_RF", "", "", _rfEliteDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.1,
    ["hgun_DEagle_gold_RF", "", "", _rfEliteDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.025,
    ["hgun_DEagle_classic_RF", "", "", _rfEliteDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.25,
    ["hgun_DEagle_camo_RF", "", "", _rfEliteDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.1,
    ["hgun_DEagle_copper_RF", "", "", _rfEliteDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.1
    
    // Elites carry around the Deagle uncommonly, but enough where you should be able to consistently collect them.
];

_rfMilitaryDeagleOptics = ["optic_rds_RF", 1, "", 2];
_rfMilitaryGlockOptics = ["optic_MRD_tan_RF", 1, "", 3];
(_militaryLoadoutData get "sidearms") append [
    ["hgun_Glock19_Tan_RF", "", "acc_flashlight_pistol", _rfMilitaryGlockOptics, ["17Rnd_9x19_Mag_RF","33Rnd_9x19_Mag_RF"], [], ""], 9,
    ["hgun_Glock19_auto_Tan_RF", "", "acc_flashlight_pistol", _rfMilitaryGlockOptics, ["17Rnd_9x19_Mag_RF","33Rnd_9x19_Mag_RF"], [], ""], 1, // Full auto Glocks aren't something the usual soldier is gonna carry around often.
    ["hgun_DEagle_RF", "", "", _rfMilitaryDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.3,
    ["hgun_DEagle_classic_RF", "", "", _rfMilitaryDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.1,
    ["hgun_DEagle_copper_RF", "", "", _rfMilitaryDeagleOptics, ["7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF","7Rnd_50AE_Mag_RF"], [], ""], 0.1
    // Make the Deagle super rare, since it's an unusual gun for a normal soldier to have.
];
(_militiaLoadoutData get "sidearms") append [
    ["hgun_Glock19_Tan_RF", "", "", "", ["17Rnd_9x19_Mag_RF","17Rnd_9x19_Mag_RF"], [], ""], 10
];

(_policeLoadoutData get "sidearms") append [
    ["hgun_Glock19_RF", "", "", "", ["17Rnd_9x19_Mag_RF","17Rnd_9x19_Mag_RF"], [], ""], 10
];




