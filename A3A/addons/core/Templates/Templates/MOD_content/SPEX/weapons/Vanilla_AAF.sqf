/* 
(_policeLoadoutData get "sidearms") append [
    ["SPEX_Enfield_No2","","","",["SPEX_6rnd_9x20R","SPEX_6rnd_9x20R","SPEX_6rnd_9x20R"], [], ""], 1,
    ["SPEX_Enfield_No2_late","","","",["SPEX_6rnd_9x20R","SPEX_6rnd_9x20R","SPEX_6rnd_9x20R"], [], ""], 1
];
//////////////////////////////////////////////////////

(_militiaLoadoutData get "marksmanRifles") append [ //most of these are terrible DMRs and thus will be uncommon
    ["SPEX_No1_Mk3_Enfield","SPEX_ACC_2HalfInch_GL_CUP","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No1_Mk3_Enfield","SPEX_ACC_P1907_Bayo","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.3,
    ["SPEX_No1_Mk3_Enfield","","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No1_Mk3_Enfield","","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No1_Mk3_mid_Enfield","SPEX_ACC_2HalfInch_GL_CUP","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No1_Mk3_mid_Enfield","SPEX_ACC_P1907_Bayo","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.3,
    ["SPEX_No1_Mk3_mid_Enfield","","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No1_Mk3_mid_Enfield","","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No1_Mk3_late_Enfield","SPEX_ACC_2HalfInch_GL_CUP","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No1_Mk3_late_Enfield","SPEX_ACC_P1907_Bayo","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.3,
    ["SPEX_No1_Mk3_late_Enfield","","SPEX_ACC_Enfield_No1_Wires","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No1_Mk3_late_Enfield","","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No4_Mk1_Enfield","","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No4_Mk1_Enfield","SPEX_ACC_No4_Mk2_Bayo","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.3,
    ["SPEX_No4_Mk1_Enfield_dunkel","","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.5,
    ["SPEX_No4_Mk1_Enfield_dunkel","SPEX_ACC_No4_Mk2_Bayo","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 0.3
];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];
(_militiaLoadoutData get "machineGuns") append [
    ["SPEX_LMG_303_Mk1","","","",["SPE_30Rnd_770x56","SPE_30Rnd_770x56","SPE_30Rnd_770x56_AP_MKI","SPE_30Rnd_770x56_MKVIII"],[],""], 1
]; */
(_militiaLoadoutData get "sniperRifles") append [
    ["SPEX_No4_Mk1_Enfield_Scoped","","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 1,
    ["SPEX_No4_Mk1_Enfield_Scoped_dunkel","","","",["SPEX_10Rnd_770x56","SPEX_10Rnd_770x56","SPEX_10Rnd_770x56_AP_MKI","SPEX_10Rnd_770x56_MkVIII"],[],""], 1
];
//////////////////////////////////////////////////////
(_loadoutData get "lightATLaunchers") append [
    ["SPEX_PIAT", "", "SPEX_PIAT_Sleeve", "", ["SPEX_1Rnd_89mm_PIAT","SPEX_1Rnd_89mm_PIAT","SPEX_1Rnd_89mm_PIAT"], [], ""], 1,
    ["SPEX_PIAT", "", "", "", ["SPEX_1Rnd_89mm_PIAT","SPEX_1Rnd_89mm_PIAT","SPEX_1Rnd_89mm_PIAT"], [], ""], 0.5,
    ["SPEX_PIAT_Brown", "", "SPEX_PIAT_Sleeve", "", ["SPEX_1Rnd_89mm_PIAT","SPEX_1Rnd_89mm_PIAT","SPEX_1Rnd_89mm_PIAT"], [], ""], 1,
    ["SPEX_PIAT_Brown", "", "", "", ["SPEX_1Rnd_89mm_PIAT","SPEX_1Rnd_89mm_PIAT","SPEX_1Rnd_89mm_PIAT"], [], ""], 0.5
];
