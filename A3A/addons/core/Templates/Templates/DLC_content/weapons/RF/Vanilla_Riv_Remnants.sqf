_rpgs append [
    ["launch_PSRL1_black_RF", "", "", "", ["PSRL1_AT_RF","PSRL1_HEAT_RF"], [], ""],
    ["launch_PSRL1_digi_RF", "", "", "", ["PSRL1_AT_RF","PSRL1_HEAT_RF"], [], ""],
    ["launch_PSRL1_olive_RF", "", "", "", ["PSRL1_AT_RF","PSRL1_HEAT_RF"], [], ""],
    ["launch_PSRL1_PWS_black_RF", "", "", "", ["PSRL1_AT_RF","PSRL1_HEAT_RF"], [], ""],
    ["launch_PSRL1_PWS_digi_RF", "", "", "", ["PSRL1_AT_RF","PSRL1_HEAT_RF"], [], ""],
    ["launch_PSRL1_PWS_olive_RF", "", "", "", ["PSRL1_AT_RF","PSRL1_HEAT_RF"], [], ""]
];

(_loadoutData get "lightHELaunchers") append [
    ["launch_PSRL1_black_RF", "", "", "", ["PSRL1_FRAG_RF","PSRL1_HE_RF"], [], ""],
    ["launch_PSRL1_digi_RF", "", "", "", ["PSRL1_FRAG_RF","PSRL1_HE_RF"], [], ""],
    ["launch_PSRL1_olive_RF", "", "", "", ["PSRL1_FRAG_RF","PSRL1_HE_RF"], [], ""],
    ["launch_PSRL1_PWS_black_RF", "", "", "", ["PSRL1_FRAG_RF","PSRL1_HE_RF"], [], ""],
    ["launch_PSRL1_PWS_digi_RF", "", "", "", ["PSRL1_FRAG_RF","PSRL1_HE_RF"], [], ""],
    ["launch_PSRL1_PWS_olive_RF", "", "", "", ["PSRL1_FRAG_RF","PSRL1_HE_RF"], [], ""]
];

if (random 100 <= 45) then {
	_tunedRifles pushBack ["srifle_h6_gold_rf", "muzzle_snds_M", "", "optic_VRCO_RF", ["30Rnd_556x45_AP_Stanag_green_RF"], [], ""];
	_pistols append ["hgun_DEagle_gold_RF"];
};

_marksmanRifles pushBack ["srifle_DMR_01_black_RF", "", "acc_flashlight", "optic_VRCO_RF", ["10Rnd_762x54_Mag","10Rnd_762x54_Mag","10Rnd_762x54_Mag"], [], ""];