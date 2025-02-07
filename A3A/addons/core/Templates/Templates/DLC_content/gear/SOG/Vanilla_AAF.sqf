(_loadoutData get "glasses") append [
    "vn_g_glasses_01", 2.5,
    "vn_g_spectacles_01", 1.5,
    "vn_g_spectacles_02", 2
];
(_loadoutData get "goggles") append [
    "vn_b_acc_towel_02", 1,
    "vn_b_acc_towel_01", 1,
    "vn_b_acc_rag_02", 1,
    "vn_b_acc_rag_01", 1,
    "vn_o_poncho_01_01", 2,
    "vn_o_acc_goggles_02", 3,
    "vn_b_acc_goggles_01", 3,
    "vn_b_acc_m17_01", 1,
    "vn_o_bandana_g", 1.5, // These bandanas are identical to vanilla items but the latter aren't included in the base AAF file so they get to stay for now.
    "vn_o_bandana_b", 1.5,
    "vn_b_bandana_a", 1
];
//////////////////////////////////////////////////////
(_militaryLoadoutData get "Hvests") append [
    "vn_b_vest_usarmy_14", 0.5,
    "vn_b_vest_usarmy_13", 0.5,
    "vn_b_vest_usmc_02", 1,
    "vn_b_vest_usmc_01", 1,
    "vn_b_vest_usmc_06", 1
];
(_militaryLoadoutData get "vests") append [ // These freqs together should make the SOG vests have a cumulative spawn weight of 3.9.
    "vn_b_vest_anzac_09", 0.65,
    "vn_b_vest_anzac_08", 0.65,
    "vn_b_vest_usarmy_11", 0.65,
    "vn_b_vest_usarmy_12", 0.65,
    "vn_b_vest_usmc_02", 0.22,
    "vn_b_vest_usmc_01", 0.22,
    "vn_b_vest_usmc_06", 0.22,
    "vn_b_vest_usmc_03", 0.22,
    "vn_b_vest_usmc_04", 0.22,
    "vn_b_vest_usmc_05", 0.22
]; 
(_militaryLoadoutData get "backpacks") append [
    "vn_b_pack_pfield_02", 1,
    "vn_b_pack_p08_02", 1.25,
    "vn_b_pack_p44_02", 1.25,
    "vn_b_pack_01", 0.4,
    "vn_b_pack_02", 0.4,
    "vn_b_pack_03", 0.4,
    "vn_b_pack_04", 0.4,
    "vn_b_pack_05", 0.4,
    "vn_b_pack_trp_03", 0.5,
    "vn_b_pack_trp_01", 0.5,
    "vn_b_pack_trp_04", 0.5,
    "vn_b_pack_trp_02", 0.5,
    "vn_b_pack_m41_04", 0.5,
    "vn_b_pack_m41_03", 0.5,
    "vn_b_pack_m41_02", 0.5,
    "vn_b_pack_m41_01", 0.5
];
//////////////////////////////////////////////////////
(_militiaLoadoutData get "Hvests") append [
    "vn_b_vest_usarmy_13", 1,
    "vn_b_vest_usarmy_14", 1,
    "vn_b_vest_usmc_02", 0.75,
    "vn_b_vest_usmc_01", 0.75,
    "vn_b_vest_usmc_06", 0.75
];

(_militiaLoadoutData get "vests") append [ // While individual spawn chance is low, as a whole this should make all the SOG rigging slightly more common than the vanilla chest rig.
    "vn_b_vest_sog_04", 0.5,
    "vn_b_vest_sog_01", 0.5,
    "vn_b_vest_sog_02", 0.5,
    "vn_b_vest_sog_06", 0.5,
    "vn_b_vest_sog_05", 0.5,
    "vn_b_vest_sog_03", 0.5,
    "vn_b_vest_seal_05", 0.5,
    "vn_b_vest_seal_03", 0.5,
    "vn_b_vest_sas_01", 0.5,
    "vn_b_vest_sas_04", 0.5,
    "vn_b_vest_sas_03", 0.5,
    "vn_b_vest_sas_02", 0.5
];
(_militiaLoadoutData get "backpacks") append [
    "vn_b_pack_p08_02", 2,
    "vn_b_pack_p44_01", 2,
    "vn_b_pack_trp_03_02", 1,
    "vn_b_pack_m41_01", 1
];
//////////////////////////////////////////////////////
(_crewLoadoutData get "vests") append [
    "vn_b_vest_usarmy_11", 1.25,
    "vn_b_vest_usarmy_12", 1.25,
    "vn_b_vest_usarmy_13", 1.25,
    "vn_b_vest_usarmy_14", 1.25
];

(_pilotLoadoutData get "vests") append [
    "vn_b_vest_aircrew_01", 10,
    "vn_b_vest_anzac_08", 5
];






